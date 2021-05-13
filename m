Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A209837F22E
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 06:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbhEMEan (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 May 2021 00:30:43 -0400
Received: from www.linuxtv.org ([130.149.80.248]:42834 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229471AbhEMEam (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 May 2021 00:30:42 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lh2yZ-0008z6-Vh; Thu, 13 May 2021 04:29:32 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lh32p-0000oo-4W; Thu, 13 May 2021 04:33:55 +0000
Date:   Thu, 13 May 2021 04:33:55 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Message-ID: <1413204648.13.1620880435128@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #543
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: libcamera
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/libcamera/543/display/redirect?page=changes>

Changes:

[paul.elder] Documentation: Add IPA writers guide


------------------------------------------
[...truncated 28.97 KB...]
[239/476] Compiling C++ object src/libcamera/libcamera.so.p/.._android_camera_ops.cpp.o
[240/476] Compiling C++ object src/libcamera/proxy/worker/rkisp1_ipa_proxy.p/meson-generated_.._rkisp1_ipa_proxy_worker.cpp.o
[241/476] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/ipu3_awb.cpp.o
[242/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/raspberrypi.cpp.o
[243/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/md_parser.cpp.o
[244/476] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/ipu3_agc.cpp.o
[245/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_ov5647.cpp.o
[246/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_imx219.cpp.o
[247/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_histogram.cpp.o
[248/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_imx477.cpp.o
[249/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_imx290.cpp.o
[250/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_algorithm.cpp.o
[251/476] Compiling C++ object src/ipa/libipa/libipa.a.p/algorithm.cpp.o
[252/476] Linking static target src/ipa/libipa/libipa.a
[253/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_sharpen.cpp.o
[254/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_alsc.cpp.o
[255/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_focus.cpp.o
[256/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_noise.cpp.o
[257/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_geq.cpp.o
[258/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_black_level.cpp.o
[259/476] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/ipu3.cpp.o
[260/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_dpc.cpp.o
[261/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_agc.cpp.o
[262/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_contrast.cpp.o
[263/476] Compiling C++ object src/libcamera/proxy/worker/vimc_ipa_proxy.p/meson-generated_.._vimc_ipa_proxy_worker.cpp.o
[264/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_ccm.cpp.o
[265/476] Compiling C++ object src/lc-compliance/lc-compliance.p/main.cpp.o
[266/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_sdn.cpp.o
[267/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_pwl.cpp.o
[268/476] Compiling C++ object src/lc-compliance/lc-compliance.p/results.cpp.o
[269/476] Compiling C++ object src/ipa/vimc/ipa_vimc.so.p/vimc.cpp.o
[270/476] Compiling C++ object src/lc-compliance/lc-compliance.p/.._cam_event_loop.cpp.o
[271/476] Compiling C++ object src/lc-compliance/lc-compliance.p/single_stream.cpp.o
[272/476] Compiling C++ object src/libcamera/proxy/worker/raspberrypi_ipa_proxy.p/meson-generated_.._raspberrypi_ipa_proxy_worker.cpp.o
[273/476] Compiling C++ object src/cam/cam.p/event_loop.cpp.o
[274/476] Compiling C++ object src/lc-compliance/lc-compliance.p/simple_capture.cpp.o
[275/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_lux.cpp.o
[276/476] Compiling C++ object src/lc-compliance/lc-compliance.p/.._cam_options.cpp.o
[277/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_controller.cpp.o
[278/476] Compiling C++ object src/cam/cam.p/buffer_writer.cpp.o
[279/476] Compiling C++ object src/ipa/rkisp1/ipa_rkisp1.so.p/rkisp1.cpp.o
[280/476] Generating 'src/qcam/qcam.p/moc_main_window.cpp'.
[281/476] Generating qt5-feathericons_qrc with a custom command
[282/476] Generating 'src/qcam/qcam.p/moc_viewfinder_qt.cpp'.
[283/476] Generating 'src/qcam/qcam.p/moc_viewfinder_gl.cpp'.
[284/476] Compiling C++ object src/cam/cam.p/options.cpp.o
[285/476] Generating qt5-shaders_qrc with a custom command
[286/476] Compiling C++ object src/cam/cam.p/capture.cpp.o
[287/476] Compiling C++ object src/qcam/qcam.p/meson-generated_.._qt5-feathericons_qrc.cpp.o
[288/476] Linking target src/libcamera/libcamera.so
[289/476] Compiling C++ object src/qcam/qcam.p/meson-generated_.._qt5-shaders_qrc.cpp.o
[290/476] Compiling C++ object src/qcam/qcam.p/.._cam_stream_options.cpp.o
[291/476] Compiling C++ object src/cam/cam.p/main.cpp.o
[292/476] Compiling C++ object src/qcam/qcam.p/meson-generated_moc_viewfinder_gl.cpp.o
[293/476] Compiling C++ object src/qcam/qcam.p/meson-generated_moc_main_window.cpp.o
[294/476] Compiling C++ object src/qcam/qcam.p/.._cam_options.cpp.o
[295/476] Compiling C++ object src/qcam/qcam.p/format_converter.cpp.o
[296/476] Compiling C++ object src/qcam/qcam.p/meson-generated_moc_viewfinder_qt.cpp.o
[297/476] Compiling C++ object src/qcam/qcam.p/message_handler.cpp.o
[298/476] Compiling C++ object src/cam/cam.p/stream_options.cpp.o
[299/476] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_awb.cpp.o
[300/476] Compiling C++ object src/qcam/qcam.p/dng_writer.cpp.o
[301/476] Compiling C++ object src/qcam/qcam.p/main.cpp.o
[302/476] Compiling C++ object src/qcam/qcam.p/viewfinder_gl.cpp.o
[303/476] Generating symbol file src/libcamera/libcamera.so.p/libcamera.so.symbols
[304/476] Compiling C++ object src/qcam/qcam.p/viewfinder_qt.cpp.o
[305/476] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamera.cpp.o
[306/476] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcameraprovider.cpp.o
[307/476] Linking target src/libcamera/proxy/worker/rkisp1_ipa_proxy
[308/476] Linking target src/libcamera/proxy/worker/ipu3_ipa_proxy
[309/476] Linking target src/libcamera/proxy/worker/raspberrypi_ipa_proxy
[310/476] Linking target src/libcamera/proxy/worker/vimc_ipa_proxy
[311/476] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerasrc.cpp.o
[312/476] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerapad.cpp.o
[313/476] Linking target src/ipa/rkisp1/ipa_rkisp1.so
[314/476] Generating ipa_rkisp1.so.sign with a custom command
[315/476] Linking target src/ipa/vimc/ipa_vimc.so
[316/476] Generating ipa_vimc.so.sign with a custom command
[317/476] Linking target src/ipa/ipu3/ipa_ipu3.so
[318/476] Generating ipa_ipu3.so.sign with a custom command
[319/476] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcameraallocator.cpp.o
[320/476] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerapool.cpp.o
[321/476] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamera-utils.cpp.o
[322/476] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_compat.cpp.o
[323/476] Linking target src/lc-compliance/lc-compliance
[324/476] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera_file.cpp.o
[325/476] Linking target src/cam/cam
[326/476] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera.cpp.o
[327/476] Compiling C++ object test/camera/configuration_set.p/configuration_set.cpp.o
[328/476] Compiling C++ object test/camera/statemachine.p/statemachine.cpp.o
[329/476] Linking target src/ipa/raspberrypi/ipa_rpi.so
[330/476] Generating ipa_rpi.so.sign with a custom command
[331/476] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera_proxy.cpp.o
[332/476] Compiling C++ object test/controls/control_list.p/control_list.cpp.o
[333/476] Compiling C++ object test/camera/capture.p/capture.cpp.o
[334/476] Compiling C++ object test/camera/buffer_import.p/buffer_import.cpp.o
[335/476] Compiling C++ object test/libtest/liblibtest.a.p/test.cpp.o
[336/476] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_compat_manager.cpp.o
[337/476] Compiling C++ object test/ipa/ipa_module_test.p/ipa_module_test.cpp.o
[338/476] Linking target src/gstreamer/libgstlibcamera.so
[339/476] Compiling C++ object test/camera/configuration_default.p/configuration_default.cpp.o
[340/476] Compiling C++ object test/libtest/liblibtest.a.p/buffer_source.cpp.o
[341/476] Compiling C++ object test/ipc/unixsocket.p/unixsocket.cpp.o
[342/476] Compiling C++ object test/log/log_api.p/log_api.cpp.o
[343/476] Linking target src/v4l2/v4l2-compat.so
[344/476] Compiling C++ object test/ipc/unixsocket_ipc.p/unixsocket_ipc.cpp.o
[345/476] Compiling C++ object test/libtest/liblibtest.a.p/camera_test.cpp.o
[346/476] Linking static target test/libtest/liblibtest.a
[347/476] Compiling C++ object test/ipa/ipa_interface_test.p/ipa_interface_test.cpp.o
[348/476] Compiling C++ object test/media_device/liblib_mdev_test.a.p/media_device_test.cpp.o
[349/476] Compiling C++ object test/log/log_process.p/log_process.cpp.o
[350/476] Compiling C++ object test/media_device/media_device_print_test.p/media_device_print_test.cpp.o
[351/476] Compiling C++ object test/controls/control_value.p/control_value.cpp.o
[352/476] Compiling C++ object test/media_device/media_device_acquire.p/media_device_acquire.cpp.o
[353/476] Linking target test/controls/control_info
[354/476] Linking target test/camera/capture
[355/476] Linking target test/controls/control_info_map
[356/476] Linking target test/camera/configuration_set
[357/476] Linking target test/controls/control_list
[358/476] Compiling C++ object src/qcam/qcam.p/main_window.cpp.o
[359/476] Linking target test/camera/buffer_import
[360/476] Linking target test/controls/control_value
[361/476] Linking target test/camera/statemachine
[362/476] Linking target test/ipc/unixsocket_ipc
[363/476] Linking static target test/media_device/liblib_mdev_test.a
[364/476] Linking target test/camera/configuration_default
[365/476] Linking target test/ipa/ipa_module_test
[366/476] Linking target test/ipa/ipa_interface_test
[367/476] Compiling C++ object test/media_device/media_device_link_test.p/media_device_link_test.cpp.o
[368/476] Linking target test/ipc/unixsocket
[369/476] Linking target test/log/log_api
[370/476] Linking target test/log/log_process
[371/476] Compiling C++ object test/pipeline/ipu3/ipu3_pipeline_test.p/ipu3_pipeline_test.cpp.o
[372/476] Linking target test/media_device/media_device_print_test
[373/476] Linking target test/media_device/media_device_acquire
[374/476] Compiling C++ object test/pipeline/rkisp1/rkisp1_pipeline_test.p/rkisp1_pipeline_test.cpp.o
[375/476] Compiling C++ object test/process/process_test.p/process_test.cpp.o
[376/476] Generating test_mojom_module with a custom command
[377/476] Linking target test/media_device/media_device_link_test
[378/476] Compiling C++ object test/serialization/control_serialization.p/control_serialization.cpp.o
[379/476] Linking target test/pipeline/ipu3/ipu3_pipeline_test
[380/476] Generating test_ipa_interface_h with a custom command
[381/476] Compiling C++ object test/serialization/control_serialization.p/serialization_test.cpp.o
[382/476] Generating test_ipa_serializer_h with a custom command
[383/476] Compiling C++ object test/serialization/ipa_data_serializer_test.p/serialization_test.cpp.o
[384/476] Linking target test/pipeline/rkisp1/rkisp1_pipeline_test
[385/476] Linking target test/process/process_test
[386/476] Compiling C++ object test/stream/stream_formats.p/stream_formats.cpp.o
[387/476] Compiling C++ object test/v4l2_subdevice/list_formats.p/list_formats.cpp.o
[388/476] Compiling C++ object test/serialization/generated_serializer/generated_serializer_test.p/generated_serializer_test.cpp.o
[389/476] Compiling C++ object test/v4l2_subdevice/list_formats.p/v4l2_subdevice_test.cpp.o
[390/476] Linking target test/serialization/control_serialization
[391/476] Linking target test/stream/stream_formats
[392/476] Compiling C++ object test/v4l2_videodevice/double_open.p/double_open.cpp.o
[393/476] Linking target test/v4l2_subdevice/list_formats
[394/476] Compiling C++ object test/v4l2_subdevice/test_formats.p/v4l2_subdevice_test.cpp.o
[395/476] Linking target test/serialization/generated_serializer/generated_serializer_test
[396/476] Compiling C++ object test/v4l2_videodevice/controls.p/v4l2_videodevice_test.cpp.o
[397/476] Compiling C++ object test/v4l2_videodevice/double_open.p/v4l2_videodevice_test.cpp.o
[398/476] Compiling C++ object test/v4l2_subdevice/test_formats.p/test_formats.cpp.o
[399/476] Compiling C++ object test/v4l2_videodevice/request_buffers.p/request_buffers.cpp.o
[400/476] Compiling C++ object test/v4l2_videodevice/formats.p/formats.cpp.o
[401/476] Compiling C++ object test/v4l2_videodevice/formats.p/v4l2_videodevice_test.cpp.o
[402/476] Linking target test/v4l2_videodevice/double_open
[403/476] Linking target test/v4l2_subdevice/test_formats
[404/476] Compiling C++ object test/v4l2_videodevice/request_buffers.p/v4l2_videodevice_test.cpp.o
[405/476] Compiling C++ object test/v4l2_videodevice/controls.p/controls.cpp.o
[406/476] Compiling C++ object test/v4l2_videodevice/buffer_cache.p/v4l2_videodevice_test.cpp.o
[407/476] Linking target test/v4l2_videodevice/formats
[408/476] Compiling C++ object test/v4l2_videodevice/stream_on_off.p/stream_on_off.cpp.o
[409/476] Compiling C++ object test/v4l2_videodevice/buffer_cache.p/buffer_cache.cpp.o
[410/476] Linking target test/v4l2_videodevice/request_buffers
[411/476] Linking target test/v4l2_videodevice/controls
[412/476] Compiling C++ object test/v4l2_videodevice/stream_on_off.p/v4l2_videodevice_test.cpp.o
[413/476] Compiling C++ object test/v4l2_videodevice/capture_async.p/v4l2_videodevice_test.cpp.o
[414/476] Compiling C++ object test/v4l2_videodevice/capture_async.p/capture_async.cpp.o
[415/476] Compiling C++ object test/v4l2_videodevice/buffer_sharing.p/buffer_sharing.cpp.o
[416/476] Compiling C++ object test/v4l2_videodevice/buffer_sharing.p/v4l2_videodevice_test.cpp.o
[417/476] Linking target test/v4l2_videodevice/buffer_cache
[418/476] Compiling C++ object test/v4l2_videodevice/v4l2_m2mdevice.p/v4l2_videodevice_test.cpp.o
[419/476] Linking target test/v4l2_videodevice/stream_on_off
[420/476] Compiling C++ object test/geometry.p/geometry.cpp.o
[421/476] Compiling C++ object test/span.p/span.cpp.o
[422/476] Linking target test/v4l2_videodevice/capture_async
[423/476] Compiling C++ object test/serialization/ipa_data_serializer_test.p/ipa_data_serializer_test.cpp.o
[424/476] Linking target test/v4l2_videodevice/buffer_sharing
[425/476] Linking target test/span
[426/476] Compiling C++ object test/bayer-format.p/bayer-format.cpp.o
[427/476] Compiling C++ object test/byte-stream-buffer.p/byte-stream-buffer.cpp.o
[428/476] Linking target test/geometry
[429/476] Compiling C++ object test/camera-sensor.p/camera-sensor.cpp.o
[430/476] Compiling C++ object test/v4l2_videodevice/v4l2_m2mdevice.p/v4l2_m2mdevice.cpp.o
[431/476] Linking target src/qcam/qcam
[432/476] Linking target test/serialization/ipa_data_serializer_test
[433/476] Compiling C++ object test/delayed_controls.p/delayed_controls.cpp.o
[434/476] Linking target test/camera-sensor
[435/476] Compiling C++ object test/signal.p/signal.cpp.o
[436/476] Compiling C++ object test/event-dispatcher.p/event-dispatcher.cpp.o
[437/476] Linking target test/byte-stream-buffer
[438/476] Linking target test/bayer-format
[439/476] Compiling C++ object test/event.p/event.cpp.o
[440/476] Compiling C++ object test/file.p/file.cpp.o
[441/476] Linking target test/v4l2_videodevice/v4l2_m2mdevice
[442/476] Compiling C++ object test/event-thread.p/event-thread.cpp.o
[443/476] Compiling C++ object test/hotplug-cameras.p/hotplug-cameras.cpp.o
[444/476] Linking target test/delayed_controls
[445/476] Compiling C++ object test/file-descriptor.p/file-descriptor.cpp.o
[446/476] Linking target test/event
[447/476] Linking target test/signal
[448/476] Linking target test/event-dispatcher
[449/476] Compiling C++ object test/message.p/message.cpp.o
[450/476] Compiling C++ object test/object.p/object.cpp.o
[451/476] Linking target test/file
[452/476] Linking target test/event-thread
[453/476] Compiling C++ object test/object-delete.p/object-delete.cpp.o
[454/476] Linking target test/hotplug-cameras
[455/476] Linking target test/file-descriptor
[456/476] Compiling C++ object test/signal-threads.p/signal-threads.cpp.o
[457/476] Compiling C++ object test/threads.p/threads.cpp.o
[458/476] Compiling C++ object test/object-invoke.p/object-invoke.cpp.o
[459/476] Compiling C++ object test/pixel-format.p/pixel-format.cpp.o
[460/476] Linking target test/message
[461/476] Linking target test/object
[462/476] Linking target test/object-delete
[463/476] Compiling C++ object test/mapped-buffer.p/mapped-buffer.cpp.o
[464/476] Compiling C++ object test/timer-thread.p/timer-thread.cpp.o
[465/476] Compiling C++ object test/timer.p/timer.cpp.o
[466/476] Linking target test/threads
[467/476] Linking target test/signal-threads
[468/476] Compiling C++ object test/utils.p/utils.cpp.o
[469/476] Linking target test/object-invoke
[470/476] Linking target test/pixel-format
[471/476] Linking target test/mapped-buffer
[472/476] Linking target test/timer
[473/476] Linking target test/timer-thread
[474/476] Linking target test/utils
[475/476] Generating documentation with a custom command
FAILED: Documentation/html 
/var/lib/jenkins/.local/bin/sphinx-build -D release=v0.0.0+2570-0906ddb2 -q -W -b html <https://builder.linuxtv.org/job/libcamera/ws/Documentation> Documentation/html

Warning, treated as error:
<https://builder.linuxtv.org/job/libcamera/ws/Documentation/guides/ipa.rst>:440:Title underline too short.

Using the IPA interface (IPA Module)
-----------------------------
[476/476] Generating doxygen with a custom command
warning: ignoring unsupported tag `HTML_DYNAMIC_MENUS     =' at line 1210, file Documentation/Doxyfile
ninja: build stopped: subcommand failed.
Build step 'Execute shell' marked build as failure
