Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CAF158CAF8
	for <lists+linux-media@lfdr.de>; Mon,  8 Aug 2022 17:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235766AbiHHPDt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 8 Aug 2022 11:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbiHHPDs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Aug 2022 11:03:48 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89806B853
        for <linux-media@vger.kernel.org>; Mon,  8 Aug 2022 08:03:44 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oL4IA-009JZR-He; Mon, 08 Aug 2022 15:03:42 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oL4I9-00DJIN-4F; Mon, 08 Aug 2022 15:03:40 +0000
Date:   Mon, 8 Aug 2022 15:03:40 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Message-ID: <1245165385.1.1659971020507@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #925
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: libcamera
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/libcamera/925/display/redirect?page=changes>

Changes:

[laurent.pinchart] cam: sdl_texture_yuyv: Make line stride configurable

[laurent.pinchart] cam: Rename sdl_texture_yuyv.{cpp,h} to sdl_texture_yuv.{cpp,h}

[laurent.pinchart] cam: sdl_sink: Support multi-planar formats

[laurent.pinchart] cam: sdl_sink: Add NV12 texture support


------------------------------------------
[...truncated 36.56 KB...]
[311/547] Compiling C++ object src/ipa/rkisp1/ipa_rkisp1.so.p/algorithms_gsl.cpp.o
[312/547] Compiling C++ object src/lc-compliance/lc-compliance.p/.._cam_event_loop.cpp.o
[313/547] Compiling C++ object src/lc-compliance/lc-compliance.p/.._cam_options.cpp.o
[314/547] Compiling C++ object src/lc-compliance/lc-compliance.p/main.cpp.o
[315/547] Compiling C++ object src/lc-compliance/lc-compliance.p/simple_capture.cpp.o
[316/547] Compiling C++ object src/cam/cam.p/capture_script.cpp.o
[317/547] Compiling C++ object src/lc-compliance/lc-compliance.p/capture_test.cpp.o
[318/547] Compiling C++ object src/cam/cam.p/event_loop.cpp.o
[319/547] Compiling C++ object src/cam/cam.p/frame_sink.cpp.o
[320/547] Compiling C++ object src/lc-compliance/lc-compliance.p/.._.._subprojects_googletest-release-1.11.0_googletest_src_gtest-all.cc.o
[321/547] Compiling C++ object src/cam/cam.p/camera_session.cpp.o
[322/547] Compiling C++ object src/cam/cam.p/file_sink.cpp.o
[323/547] Compiling C++ object src/cam/cam.p/image.cpp.o
[324/547] Compiling C++ object src/cam/cam.p/main.cpp.o
[325/547] Compiling C++ object src/cam/cam.p/options.cpp.o
[326/547] Compiling C++ object src/cam/cam.p/stream_options.cpp.o
[327/547] Generating qt5-feathericons_qrc with a custom command
[328/547] Generating qt5-shaders_qrc with a custom command
[329/547] Compiling C++ object src/qcam/qcam.p/meson-generated_.._qt5-feathericons_qrc.cpp.o
[330/547] Compiling C++ object src/qcam/qcam.p/meson-generated_.._qt5-shaders_qrc.cpp.o
[331/547] Generating 'src/qcam/qcam.p/moc_main_window.cpp'.
[332/547] Generating 'src/qcam/qcam.p/moc_viewfinder_qt.cpp'.
[333/547] Compiling C++ object src/qcam/qcam.p/.._cam_image.cpp.o
[334/547] Compiling C++ object src/qcam/qcam.p/meson-generated_moc_main_window.cpp.o
[335/547] Compiling C++ object src/qcam/qcam.p/meson-generated_moc_viewfinder_qt.cpp.o
[336/547] Compiling C++ object src/qcam/qcam.p/.._cam_options.cpp.o
[337/547] Compiling C++ object src/qcam/qcam.p/.._cam_stream_options.cpp.o
[338/547] Compiling C++ object src/qcam/qcam.p/format_converter.cpp.o
[339/547] Compiling C++ object src/qcam/qcam.p/main.cpp.o
[340/547] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/meson-generated_.._version.cpp.o
[341/547] Compiling C++ object src/qcam/qcam.p/message_handler.cpp.o
[342/547] Generating 'src/qcam/qcam.p/moc_viewfinder_gl.cpp'.
[343/547] Compiling C++ object src/qcam/qcam.p/main_window.cpp.o
[344/547] Compiling C++ object src/qcam/qcam.p/viewfinder_qt.cpp.o
[345/547] Compiling C++ object src/qcam/qcam.p/dng_writer.cpp.o
[346/547] Compiling C++ object src/qcam/qcam.p/meson-generated_moc_viewfinder_gl.cpp.o
[347/547] Compiling C++ object src/qcam/qcam.p/viewfinder_gl.cpp.o
[348/547] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamera-utils.cpp.o
[349/547] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerapool.cpp.o
[350/547] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerapad.cpp.o
[351/547] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera.cpp.o
[352/547] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera_file.cpp.o
[353/547] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera_proxy.cpp.o
[354/547] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamera.cpp.o
[355/547] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcameraallocator.cpp.o
[356/547] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_compat.cpp.o
[357/547] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/meson-generated_.._ipa_pub_key.cpp.o
[358/547] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_compat_manager.cpp.o
[359/547] Compiling C++ object test/media_device/media_device_acquire.p/media_device_acquire.cpp.o
[360/547] Compiling C++ object test/media_device/media_device_print_test.p/media_device_print_test.cpp.o
[361/547] Compiling C++ object test/media_device/media_device_link_test.p/media_device_link_test.cpp.o
[362/547] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcameraprovider.cpp.o
[363/547] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerasrc.cpp.o
[364/547] Compiling C++ object test/libtest/liblibtest.a.p/buffer_source.cpp.o
[365/547] Compiling C++ object test/libtest/liblibtest.a.p/camera_test.cpp.o
[366/547] Compiling C++ object test/libtest/liblibtest.a.p/test.cpp.o
[367/547] Compiling C++ object test/camera/configuration_default.p/configuration_default.cpp.o
[368/547] Compiling C++ object test/camera/configuration_set.p/configuration_set.cpp.o
[369/547] Linking static target test/libtest/liblibtest.a
[370/547] Compiling C++ object test/camera/buffer_import.p/buffer_import.cpp.o
[371/547] Compiling C++ object test/camera/capture.p/capture.cpp.o
[372/547] Compiling C++ object test/camera/statemachine.p/statemachine.cpp.o
[373/547] Compiling C++ object test/camera/camera_reconfigure.p/camera_reconfigure.cpp.o
[374/547] Compiling C++ object test/controls/control_info.p/control_info.cpp.o
[375/547] Compiling C++ object test/controls/control_list.p/control_list.cpp.o
[376/547] Compiling C++ object test/controls/control_value.p/control_value.cpp.o
[377/547] Compiling C++ object test/controls/control_info_map.p/control_info_map.cpp.o
[378/547] Compiling C++ object test/gstreamer/single_stream_test.p/gstreamer_single_stream_test.cpp.o
[379/547] Compiling C++ object test/gstreamer/single_stream_test.p/gstreamer_test.cpp.o
[380/547] Compiling C++ object test/gstreamer/multi_stream_test.p/gstreamer_multi_stream_test.cpp.o
[381/547] Compiling C++ object test/ipa/ipa_module_test.p/ipa_module_test.cpp.o
[382/547] Compiling C++ object test/ipa/ipa_interface_test.p/ipa_interface_test.cpp.o
[383/547] Compiling C++ object test/gstreamer/multi_stream_test.p/gstreamer_test.cpp.o
[384/547] Compiling C++ object test/ipc/unixsocket_ipc.p/unixsocket_ipc.cpp.o
[385/547] Compiling C++ object test/ipc/unixsocket.p/unixsocket.cpp.o
[386/547] Compiling C++ object test/log/log_api.p/log_api.cpp.o
[387/547] Compiling C++ object test/media_device/liblib_mdev_test.a.p/media_device_test.cpp.o
[388/547] Compiling C++ object test/log/log_process.p/log_process.cpp.o
[389/547] Compiling C++ object test/pipeline/ipu3/ipu3_pipeline_test.p/ipu3_pipeline_test.cpp.o
[390/547] Compiling C++ object test/pipeline/rkisp1/rkisp1_pipeline_test.p/rkisp1_pipeline_test.cpp.o
[391/547] Linking static target test/media_device/liblib_mdev_test.a
[392/547] Compiling C++ object test/process/process_test.p/process_test.cpp.o
[393/547] Compiling C++ object test/serialization/control_serialization.p/control_serialization.cpp.o
[394/547] Compiling C++ object test/serialization/control_serialization.p/serialization_test.cpp.o
[395/547] Compiling C++ object test/serialization/ipa_data_serializer_test.p/serialization_test.cpp.o
[396/547] Compiling C++ object test/serialization/ipa_data_serializer_test.p/ipa_data_serializer_test.cpp.o
[397/547] Compiling C++ object test/stream/stream_formats.p/stream_formats.cpp.o
[398/547] Compiling C++ object test/v4l2_subdevice/list_formats.p/v4l2_subdevice_test.cpp.o
[399/547] Compiling C++ object test/v4l2_subdevice/list_formats.p/list_formats.cpp.o
[400/547] Compiling C++ object test/v4l2_subdevice/test_formats.p/test_formats.cpp.o
[401/547] Generating test_mojom_module with a custom command
[402/547] Compiling C++ object test/v4l2_subdevice/test_formats.p/v4l2_subdevice_test.cpp.o
[403/547] Compiling C++ object test/v4l2_videodevice/double_open.p/double_open.cpp.o
[404/547] Compiling C++ object test/v4l2_videodevice/double_open.p/v4l2_videodevice_test.cpp.o
[405/547] Compiling C++ object test/v4l2_videodevice/controls.p/controls.cpp.o
[406/547] Compiling C++ object test/v4l2_videodevice/controls.p/v4l2_videodevice_test.cpp.o
[407/547] Generating test_ipa_interface_h with a custom command
[408/547] Compiling C++ object test/v4l2_videodevice/formats.p/v4l2_videodevice_test.cpp.o
[409/547] Compiling C++ object test/v4l2_videodevice/formats.p/formats.cpp.o
[410/547] Compiling C++ object test/v4l2_videodevice/dequeue_watchdog.p/dequeue_watchdog.cpp.o
[411/547] Compiling C++ object test/v4l2_videodevice/dequeue_watchdog.p/v4l2_videodevice_test.cpp.o
[412/547] Compiling C++ object test/v4l2_videodevice/request_buffers.p/request_buffers.cpp.o
[413/547] Compiling C++ object test/v4l2_videodevice/request_buffers.p/v4l2_videodevice_test.cpp.o
[414/547] Compiling C++ object test/v4l2_videodevice/buffer_cache.p/buffer_cache.cpp.o
[415/547] Compiling C++ object test/v4l2_videodevice/stream_on_off.p/stream_on_off.cpp.o
[416/547] Compiling C++ object test/v4l2_videodevice/buffer_cache.p/v4l2_videodevice_test.cpp.o
[417/547] Compiling C++ object test/v4l2_videodevice/stream_on_off.p/v4l2_videodevice_test.cpp.o
[418/547] Compiling C++ object test/v4l2_videodevice/capture_async.p/capture_async.cpp.o
[419/547] Generating test_ipa_serializer_h with a custom command
[420/547] Compiling C++ object test/v4l2_videodevice/capture_async.p/v4l2_videodevice_test.cpp.o
[421/547] Compiling C++ object test/v4l2_videodevice/buffer_sharing.p/buffer_sharing.cpp.o
[422/547] Compiling C++ object test/v4l2_videodevice/buffer_sharing.p/v4l2_videodevice_test.cpp.o
[423/547] Compiling C++ object test/v4l2_videodevice/v4l2_m2mdevice.p/v4l2_m2mdevice.cpp.o
[424/547] Compiling C++ object test/geometry.p/geometry.cpp.o
[425/547] Compiling C++ object test/v4l2_videodevice/v4l2_m2mdevice.p/v4l2_videodevice_test.cpp.o
[426/547] Compiling C++ object test/public-api.p/public-api.cpp.o
[427/547] Compiling C++ object test/signal.p/signal.cpp.o
[428/547] Compiling C++ object test/span.p/span.cpp.o
[429/547] Compiling C++ object test/bayer-format.p/bayer-format.cpp.o
[430/547] Compiling C++ object test/byte-stream-buffer.p/byte-stream-buffer.cpp.o
[431/547] Compiling C++ object test/delayed_controls.p/delayed_controls.cpp.o
[432/547] Compiling C++ object test/event.p/event.cpp.o
[433/547] Compiling C++ object test/event-thread.p/event-thread.cpp.o
[434/547] Compiling C++ object test/flags.p/flags.cpp.o
[435/547] Compiling C++ object test/file.p/file.cpp.o
[436/547] Compiling C++ object test/hotplug-cameras.p/hotplug-cameras.cpp.o
[437/547] Compiling C++ object test/message.p/message.cpp.o
[438/547] Compiling C++ object test/object.p/object.cpp.o
[439/547] Linking target src/libcamera/libcamera.so.0.0.0
[440/547] Generating documentation with a custom command
[441/547] Compiling C++ object src/cam/cam.p/sdl_texture.cpp.o
[442/547] Compiling C++ object test/object-invoke.p/object-invoke.cpp.o
[443/547] Compiling C++ object test/serialization/generated_serializer/generated_serializer_test.p/generated_serializer_test.cpp.o
[444/547] Compiling C++ object test/object-delete.p/object-delete.cpp.o
[445/547] Compiling C++ object test/pixel-format.p/pixel-format.cpp.o
[446/547] Compiling C++ object src/cam/cam.p/sdl_texture_mjpg.cpp.o
[447/547] Compiling C++ object src/cam/cam.p/sdl_sink.cpp.o
[448/547] Compiling C++ object test/shared-fd.p/shared-fd.cpp.o
[449/547] Compiling C++ object test/signal-threads.p/signal-threads.cpp.o
[450/547] Compiling C++ object test/timer-thread.p/timer-thread.cpp.o
[451/547] Compiling C++ object test/unique-fd.p/unique-fd.cpp.o
[452/547] Compiling C++ object test/threads.p/threads.cpp.o
[453/547] Compiling C++ object test/timer.p/timer.cpp.o
[454/547] Compiling C++ object test/utils.p/utils.cpp.o
[455/547] Compiling C++ object test/mapped-buffer.p/mapped-buffer.cpp.o
[456/547] Compiling C++ object test/fence.p/fence.cpp.o
[457/547] Compiling C++ object test/yaml-parser.p/yaml-parser.cpp.o
[458/547] Compiling C++ object src/cam/cam.p/sdl_texture_yuv.cpp.o
FAILED: src/cam/cam.p/sdl_texture_yuv.cpp.o 
ccache c++ -Isrc/cam/cam.p -Isrc/cam -I../src/cam -Iinclude -I../include -Iinclude/libcamera -I/usr/include/SDL2 -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -Wextra -Werror -std=c++17 -g -Wshadow -include <https://builder.linuxtv.org/job/libcamera/ws/build/config.h> -D_REENTRANT -pthread -DHAVE_SDL -DHAVE_LIBJPEG -MD -MQ src/cam/cam.p/sdl_texture_yuv.cpp.o -MF src/cam/cam.p/sdl_texture_yuv.cpp.o.d -o src/cam/cam.p/sdl_texture_yuv.cpp.o -c ../src/cam/sdl_texture_yuv.cpp
../src/cam/sdl_texture_yuv.cpp: In member function ‘virtual void SDLTextureNV12::update(const std::vector<libcamera::Span<const unsigned char> >&)’:
../src/cam/sdl_texture_yuv.cpp:19:2: error: ‘SDL_UpdateNVTexture’ was not declared in this scope; did you mean ‘SDL_UpdateYUVTexture’?
   19 |  SDL_UpdateNVTexture(ptr_, &rect_, data[0].data(), pitch_,
      |  ^~~~~~~~~~~~~~~~~~~
      |  SDL_UpdateYUVTexture
[459/547] Generating symbol file src/libcamera/libcamera.so.0.0.0.p/libcamera.so.0.0.0.symbols
[460/547] Generating doxygen with a custom command
<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/base/file.cpp>:49: warning: no matching class member found for 
  libcamera::File::MapFlag::NoOption

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/base/file.cpp>:51: warning: no uniquely matching class member found for 
  libcamera::File::MapFlag::Private

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/base/file.cpp>:64: warning: no matching class member found for 
  libcamera::File::OpenModeFlag::NotOpen

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/base/file.cpp>:66: warning: no matching class member found for 
  libcamera::File::OpenModeFlag::ReadOnly

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/base/file.cpp>:68: warning: no matching class member found for 
  libcamera::File::OpenModeFlag::WriteOnly

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/base/file.cpp>:70: warning: no uniquely matching class member found for 
  libcamera::File::OpenModeFlag::ReadWrite

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/bayer_format.cpp>:58: warning: no uniquely matching class member found for 
  libcamera::BayerFormat::Packing::None

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/bayer_format.cpp>:60: warning: no matching class member found for 
  libcamera::BayerFormat::Packing::CSI2

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/bayer_format.cpp>:62: warning: no matching class member found for 
  libcamera::BayerFormat::Packing::IPU3

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/camera.cpp>:334: warning: no uniquely matching class member found for 
  libcamera::CameraConfiguration::ColorSpaceFlag::None

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/camera.cpp>:336: warning: no matching class member found for 
  libcamera::CameraConfiguration::ColorSpaceFlag::StreamsShareColorSpace

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/color_space.cpp>:53: warning: no uniquely matching class member found for 
  libcamera::ColorSpace::Primaries::Raw

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/color_space.cpp>:57: warning: no uniquely matching class member found for 
  libcamera::ColorSpace::Primaries::Smpte170m

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/color_space.cpp>:60: warning: no uniquely matching class member found for 
  libcamera::ColorSpace::Primaries::Rec709

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/color_space.cpp>:63: warning: no uniquely matching class member found for 
  libcamera::ColorSpace::Primaries::Rec2020

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/color_space.cpp>:71: warning: no matching class member found for 
  libcamera::ColorSpace::TransferFunction::Linear

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/color_space.cpp>:74: warning: no uniquely matching class member found for 
  libcamera::ColorSpace::TransferFunction::Srgb

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/color_space.cpp>:77: warning: no uniquely matching class member found for 
  libcamera::ColorSpace::TransferFunction::Rec709

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/color_space.cpp>:85: warning: no uniquely matching class member found for 
  libcamera::ColorSpace::YcbcrEncoding::None

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/color_space.cpp>:88: warning: no matching class member found for 
  libcamera::ColorSpace::YcbcrEncoding::Rec601

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/color_space.cpp>:91: warning: no uniquely matching class member found for 
  libcamera::ColorSpace::YcbcrEncoding::Rec709

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/color_space.cpp>:94: warning: no uniquely matching class member found for 
  libcamera::ColorSpace::YcbcrEncoding::Rec2020

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/color_space.cpp>:102: warning: no matching class member found for 
  libcamera::ColorSpace::Range::Full

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/color_space.cpp>:105: warning: no matching class member found for 
  libcamera::ColorSpace::Range::Limited

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/control_serializer.cpp>:95: warning: no matching class member found for 
  libcamera::ControlSerializer::Role::Proxy

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/control_serializer.cpp>:98: warning: no matching class member found for 
  libcamera::ControlSerializer::Role::Worker

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/media_object.cpp>:254: warning: no uniquely matching class member found for 
  libcamera::MediaEntity::Type::Invalid

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/media_object.cpp>:257: warning: no uniquely matching class member found for 
  libcamera::MediaEntity::Type::MediaEntity

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/media_object.cpp>:260: warning: no uniquely matching class member found for 
  libcamera::MediaEntity::Type::V4L2VideoDevice

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/media_object.cpp>:263: warning: no uniquely matching class member found for 
  libcamera::MediaEntity::Type::V4L2Subdevice

ninja: build stopped: subcommand failed.
Build step 'Execute shell' marked build as failure
