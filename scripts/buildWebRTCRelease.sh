
#/obj/webrtc/examples/libapprtc_common.a
export LIBFILES='obj/webrtc/examples/libapprtc_common.a 
	obj/webrtc/examples/libapprtc_signaling.a
 	obj/webrtc/sdk/librtc_sdk_common_objc.a 
 	obj/webrtc/base/librtc_base.a 
 	obj/webrtc/base/librtc_base_approved.a 
 	obj/webrtc/libwebrtc_common.a 
 	obj/third_party/boringssl/libboringssl.a 
 	obj/webrtc/system_wrappers/libfield_trial_default.a 
 	obj/webrtc/system_wrappers/libmetrics_default.a 
 	obj/webrtc/sdk/librtc_sdk_peerconnection_objc.a  
 	obj/third_party/libyuv/libyuv.a 
 	obj/webrtc/api/libjingle_peerconnection.a 
 	obj/webrtc/modules/audio_coding/libaudio_encoder_interface.a 
 	obj/webrtc/call/libcall.a obj/webrtc/audio/libaudio.a 
 	obj/webrtc/system_wrappers/libsystem_wrappers.a 
 	obj/webrtc/voice_engine/libvoice_engine.a 
 	obj/webrtc/modules/audio_coding/libaudio_coding.a 
 	obj/webrtc/modules/audio_coding/libwebrtc_opus.a 
 	obj/third_party/opus/libopus.a 
 	obj/webrtc/modules/audio_coding/libaudio_decoder_interface.a 
 	obj/webrtc/modules/audio_coding/libaudio_network_adaptor.a 
	obj/webrtc/modules/audio_coding/libana_config_proto.a 
	obj/third_party/protobuf/libprotobuf_lite.a 
	obj/webrtc/modules/audio_coding/libana_debug_dump_proto.a 
	obj/webrtc/modules/audio_coding/libcng.a 
	obj/webrtc/common_audio/libcommon_audio.a 
	obj/webrtc/modules/audio_coding/libg711.a 
	obj/webrtc/modules/audio_coding/libpcm16b.a 
	obj/webrtc/modules/audio_coding/libilbc.a 
	obj/webrtc/modules/audio_coding/libisac_common.a 
	obj/webrtc/modules/audio_coding/libg722.a 
	obj/webrtc/modules/audio_coding/libred.a 
	obj/webrtc/modules/audio_coding/libneteq.a 
	obj/webrtc/modules/audio_coding/libbuiltin_audio_decoder_factory.a 
	obj/webrtc/modules/audio_coding/libaudio_format.a 
	obj/webrtc/modules/audio_coding/librent_a_codec.a 
	obj/webrtc/voice_engine/liblevel_indicator.a 
	obj/webrtc/modules/audio_coding/libaudio_format_conversion.a 
	obj/webrtc/modules/audio_conference_mixer/libaudio_conference_mixer.a 
	obj/webrtc/modules/audio_processing/libaudio_processing.a 
	obj/webrtc/modules/audio_coding/libisac.a 
	obj/webrtc/modules/audio_processing/libaudioproc_debug_proto.a 
	obj/webrtc/modules/utility/libutility.a 
	obj/webrtc/base/librtc_task_queue.a 
	obj/webrtc/modules/media_file/libmedia_file.a 
	obj/webrtc/modules/audio_device/libaudio_device.a 
	obj/webrtc/modules/bitrate_controller/libbitrate_controller.a 
	obj/webrtc/modules/pacing/libpacing.a 
	obj/webrtc/modules/rtp_rtcp/librtp_rtcp.a 
	obj/webrtc/common_video/libcommon_video.a 
	obj/webrtc/modules/remote_bitrate_estimator/libremote_bitrate_estimator.a 
	obj/webrtc/logging/librtc_event_log_impl.a 
	obj/webrtc/logging/librtc_event_log_proto.a 
	obj/webrtc/modules/congestion_controller/libcongestion_controller.a 
	obj/webrtc/video/libvideo.a 
	obj/webrtc/modules/video_coding/libvideo_coding.a 
	obj/webrtc/modules/video_coding/libvideo_coding_utility.a 
	obj/webrtc/modules/video_coding/libwebrtc_h264.a 
	obj/webrtc/modules/video_coding/libwebrtc_h264_video_toolbox.a 
	obj/webrtc/modules/video_coding/libwebrtc_i420.a 
	obj/webrtc/modules/video_coding/libwebrtc_vp8.a  
	obj/third_party/libvpx/libvpx.a  
	obj/webrtc/modules/video_coding/libwebrtc_vp9.a  
	obj/webrtc/media/librtc_media.a 
	obj/third_party/usrsctp/libusrsctp.a 
	obj/webrtc/modules/video_capture/libvideo_capture_internal_impl.a 
	obj/webrtc/modules/video_capture/libvideo_capture_module.a 
	obj/webrtc/p2p/librtc_p2p.a 
	obj/third_party/expat/libexpat.a 
	obj/webrtc/pc/librtc_pc.a 
	obj/third_party/libsrtp/libsrtp.a 
	obj/webrtc/stats/librtc_stats.a'

export DEVICE_LIBFILES_COMMON='obj/third_party/libyuv/libyuv_neon.a 
	obj/webrtc/common_audio/libcommon_audio_neon.a  
	obj/webrtc/modules/audio_processing/libaudio_processing_neon.a 
	obj/webrtc/modules/video_processing/libvideo_processing_neon.a
	obj/webrtc/modules/video_processing/libvideo_processing.a'

export DEVICE_LIBFILES_32='obj/webrtc/modules/audio_coding/libisac_neon.a
	obj/webrtc/modules/audio_coding/libisac_fix.a
	obj/third_party/libvpx/libvpx_assembly_arm.a'

export SIMULATOR_LIBFILES='obj/webrtc/common_audio/libcommon_audio_sse2.a
	obj/webrtc/modules/audio_processing/libaudio_processing_sse2.a
	obj/webrtc/modules/video_processing/libvideo_processing_sse2.a
	obj/webrtc/common_audio/libcommon_audio_sse2.a
	obj/webrtc/modules/video_processing/libvideo_processing_sse2.a
	obj/third_party/libvpx/libvpx_yasm.a'
	

echo "Building device libs"
echo "===================="
 gn gen out/Release-device-arm32 --args='target_os="ios" target_cpu="arm" is_component_build=false is_debug=false'
 ninja -C out/Release-device-arm32 AppRTCMobile
 gn gen out/Release-device-arm64 --args='target_os="ios" target_cpu="arm64" is_component_build=false is_debug=false'
 ninja -C out/Release-device-arm64 AppRTCMobile
echo "Building simulator libs"
echo "===================="
 gn gen out/Release-sim32 --args='target_os="ios" target_cpu="x86" is_component_build=false'
 ninja -C out/Release-sim32  AppRTCMobile
 gn gen out/Release-sim64 --args='target_os="ios" target_cpu="x64" is_component_build=false'
 ninja -C out/Release-sim64  AppRTCMobile
 

echo "Building simulator libs"
echo "===================="
 cd out/Release-sim64 
 libtool -static -o libWebRTC-sim64-full.a $LIBFILES $SIMULATOR_LIBFILES 
 strip -S -x -o libWebRTC-sim64.a -r libWebRTC-sim64-full.a
 cd ../../out/Release-sim32 
 strip -S -x -o libWebRTC-sim32.a -r libWebRTC-sim32-full.a 

echo "Building device libs"
echo "===================="

cd ../../out/Release-device-arm32 
libtool -static -o libWebRTC-arm32-full.a $LIBFILES $DEVICE_LIBFILES_COMMON $DEVICE_LIBFILES_32 
strip -S -x -o libWebRTC-arm32.a -r libWebRTC-arm32-full.a

cd ../../out/Release-device-arm64 
libtool -static -o libWebRTC-arm64-full.a $LIBFILES  $DEVICE_LIBFILES_COMMON 
strip -S -x -o libWebRTC-arm64.a -r libWebRTC-arm64-full.a

echo "Running lipo"
echo "===================="
cd ../../out
pwd
ls
lipo -create Release-sim32/libWebRTC-sim32.a Release-sim64/libWebRTC-sim64.a Release-device-arm32/libWebRTC-arm32.a Release-device-arm64/libWebRTC-arm64.a -output libWebRTC.a
lipo -create Release-device-arm32/libWebRTC-arm32.a Release-device-arm64/libWebRTC-arm64.a -output libWebRTC.a



 