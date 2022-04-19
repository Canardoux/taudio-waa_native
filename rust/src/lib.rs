use std::os::raw::{c_char};
use std::ffi::{CString, CStr};
use rand::Rng;

use std::{thread, time};
use web_audio_api::buffer::AudioBuffer;
use web_audio_api::context::{AudioContext, BaseAudioContext};
use web_audio_api::node::AudioNode;

// run in release mode
// cargo run --release --example granular


#[no_mangle]
pub extern "C" fn rust_greeting(to: *const c_char) -> *mut c_char {



   let audio_context = AudioContext::new(None);

    println!("LARPOUX- white noise");

    // grab audio buffer
    //let  audio_buffer = audio_context.create_buffer(2,82000, audio_context.sample_rate_raw());
    let mut b_left_vec: Vec<f32> = Vec::new();
    let mut b_right_rec: Vec<f32> = Vec::new();
    let m =  audio_context.sample_rate().floor() as i32;
    let mut rng = rand::thread_rng();
    for _i in 0 .. 2 * m * 10 {
        let r : f32 = rng.gen_range(-1.0..1.0);
        b_left_vec.push(r);
        b_right_rec.push(r);
    }
    let b = vec![b_left_vec, b_right_rec];
  let  audio_buffer = AudioBuffer::from(b,  audio_context.sample_rate_raw());
           let src = audio_context.create_buffer_source();
    src.set_buffer(audio_buffer.clone());
    src.connect(&audio_context.destination());
println!("start");
   let start_time = audio_context.current_time();
    src.start_at(start_time);
    //src.stop_at(start_time + duration);
println!("stop");

    println!("LARPOUX- end white noise");

        println!("sleep");
        thread::sleep(time::Duration::from_millis(10000 as u64));
        println!("sleep done");




  let c_str = unsafe { CStr::from_ptr(to) };
  let recipient = match c_str.to_str() {
    Err(_) => "there",
    Ok(string) => string,
  };
  CString::new("Hello ".to_owned() + recipient).unwrap().into_raw()
}


#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        let result = 2 + 2;
        assert_eq!(result, 4);
    }
}


