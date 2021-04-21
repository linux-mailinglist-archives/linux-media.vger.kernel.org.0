Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2064636669A
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 10:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237540AbhDUIBZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 04:01:25 -0400
Received: from www.linuxtv.org ([130.149.80.248]:39348 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235510AbhDUIBZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 04:01:25 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lZ7n0-000d8U-Tg; Wed, 21 Apr 2021 08:00:51 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lZ7r5-0005cN-NL; Wed, 21 Apr 2021 08:05:04 +0000
Date:   Wed, 21 Apr 2021 08:05:03 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Message-ID: <1649510653.0.1618992303662@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #522
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

See <https://builder.linuxtv.org/job/libcamera/522/display/redirect?page=changes>

Changes:

[jacopo] libcamera: Drop argument from LIBCAMERA_DECLARE_PRIVATE

[jacopo] libcamera: class: Drop 'klass' argument from documentation


------------------------------------------
[...truncated 24.99 KB...]
[191/471] Compiling C++ object src/libcamera/libcamera.so.p/log.cpp.o
[192/471] Compiling C++ object src/libcamera/libcamera.so.p/media_device.cpp.o
[193/471] Compiling C++ object src/libcamera/libcamera.so.p/utils.cpp.o
[194/471] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_handler.cpp.o
[195/471] Compiling C++ object src/libcamera/libcamera.so.p/stream.cpp.o
[196/471] Compiling C++ object src/libcamera/libcamera.so.p/process.cpp.o
[197/471] Compiling C++ object src/libcamera/libcamera.so.p/v4l2_pixelformat.cpp.o
[198/471] Compiling C++ object src/libcamera/libcamera.so.p/v4l2_controls.cpp.o
[199/471] Compiling C++ object test/ipc/unixsocket_ipc.p/unixsocket_ipc.cpp.o
[200/471] Compiling C++ object src/libcamera/libcamera.so.p/v4l2_device.cpp.o
[201/471] Compiling C++ object src/libcamera/libcamera.so.p/thread.cpp.o
[202/471] Compiling C++ object src/libcamera/libcamera.so.p/v4l2_subdevice.cpp.o
[203/471] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_ipu3_frames.cpp.o
[204/471] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_raspberrypi_dma_heaps.cpp.o
[205/471] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_ipu3_imgu.cpp.o
[206/471] Compiling C++ object src/libcamera/libcamera.so.p/v4l2_videodevice.cpp.o
[207/471] Compiling C++ object test/ipa/ipa_interface_test.p/ipa_interface_test.cpp.o
[208/471] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_ipu3_cio2.cpp.o
[209/471] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_rkisp1_rkisp1_path.cpp.o
[210/471] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_raspberrypi_rpi_stream.cpp.o
[211/471] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_simple_converter.cpp.o
[212/471] Compiling C++ object src/libcamera/libcamera.so.p/tracepoints.cpp.o
[213/471] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_ipu3_ipu3.cpp.o
[214/471] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_uvcvideo_uvcvideo.cpp.o
[215/471] Compiling C++ object src/libcamera/libcamera.so.p/.._android_camera3_hal.cpp.o
[216/471] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_vimc_vimc.cpp.o
[217/471] Compiling C++ object src/libcamera/libcamera.so.p/device_enumerator_udev.cpp.o
[218/471] Compiling C++ object src/libcamera/libcamera.so.p/.._android_camera_metadata.cpp.o
[219/471] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_rkisp1_rkisp1.cpp.o
[220/471] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_raspberrypi_raspberrypi.cpp.o
[221/471] Compiling C++ object src/libcamera/libcamera.so.p/.._android_camera_hal_manager.cpp.o
[222/471] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_simple_simple.cpp.o
[223/471] Compiling C++ object src/libcamera/libcamera.so.p/.._android_camera_ops.cpp.o
[224/471] Compiling C++ object src/libcamera/libcamera.so.p/.._android_yuv_post_processor_yuv.cpp.o
[225/471] Compiling C++ object src/libcamera/libcamera.so.p/.._android_jpeg_thumbnailer.cpp.o
[226/471] Compiling C++ object src/libcamera/libcamera.so.p/.._android_mm_generic_camera_buffer.cpp.o
[227/471] Generating ipu3_proxy_worker with a custom command
[228/471] Compiling C++ object src/libcamera/libcamera.so.p/.._android_camera_worker.cpp.o
[229/471] Compiling C++ object src/libcamera/libcamera.so.p/.._android_camera_stream.cpp.o
[230/471] Compiling C++ object src/libcamera/libcamera.so.p/.._android_jpeg_exif.cpp.o
[231/471] Generating raspberrypi_proxy_worker with a custom command
[232/471] Linking static target src/ipa/libipa/libipa.a
[233/471] Compiling C++ object src/libcamera/libcamera.so.p/.._android_jpeg_encoder_libjpeg.cpp.o
[234/471] Generating rkisp1_proxy_worker with a custom command
[235/471] Generating vimc_proxy_worker with a custom command
[236/471] Compiling C++ object src/libcamera/libcamera.so.p/.._android_jpeg_post_processor_jpeg.cpp.o
[237/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/md_parser.cpp.o
[238/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_imx290.cpp.o
[239/471] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/ipu3.cpp.o
[240/471] Compiling C++ object src/libcamera/libcamera.so.p/.._android_camera_device.cpp.o
[241/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper.cpp.o
[242/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_histogram.cpp.o
[243/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_ov5647.cpp.o
[244/471] Compiling C++ object src/libcamera/proxy/worker/vimc_ipa_proxy.p/meson-generated_.._vimc_ipa_proxy_worker.cpp.o
[245/471] Compiling C++ object src/libcamera/proxy/worker/ipu3_ipa_proxy.p/meson-generated_.._ipu3_ipa_proxy_worker.cpp.o
[246/471] Compiling C++ object src/libcamera/proxy/worker/rkisp1_ipa_proxy.p/meson-generated_.._rkisp1_ipa_proxy_worker.cpp.o
[247/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_imx219.cpp.o
[248/471] Compiling C++ object src/libcamera/proxy/worker/raspberrypi_ipa_proxy.p/meson-generated_.._raspberrypi_ipa_proxy_worker.cpp.o
[249/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_algorithm.cpp.o
[250/471] Linking target src/libcamera/libcamera.so
[251/471] Generating symbol file src/libcamera/libcamera.so.p/libcamera.so.symbols
[252/471] Linking target src/libcamera/proxy/worker/ipu3_ipa_proxy
[253/471] Linking target src/libcamera/proxy/worker/raspberrypi_ipa_proxy
[254/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_focus.cpp.o
[255/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_sharpen.cpp.o
[256/471] Linking target src/libcamera/proxy/worker/vimc_ipa_proxy
[257/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_black_level.cpp.o
[258/471] Linking target src/libcamera/proxy/worker/rkisp1_ipa_proxy
[259/471] Linking target src/ipa/ipu3/ipa_ipu3.so
[260/471] Generating ipa_ipu3.so.sign with a custom command
[261/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_geq.cpp.o
[262/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_alsc.cpp.o
[263/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/raspberrypi.cpp.o
[264/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_noise.cpp.o
[265/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_awb.cpp.o
[266/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_pwl.cpp.o
[267/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_controller.cpp.o
[268/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_contrast.cpp.o
[269/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_lux.cpp.o
[270/471] Compiling C++ object src/lc-compliance/lc-compliance.p/.._cam_event_loop.cpp.o
[271/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_dpc.cpp.o
[272/471] Compiling C++ object src/ipa/vimc/ipa_vimc.so.p/vimc.cpp.o
[273/471] Compiling C++ object src/lc-compliance/lc-compliance.p/results.cpp.o
[274/471] Compiling C++ object src/cam/cam.p/capture.cpp.o
[275/471] Linking target src/ipa/vimc/ipa_vimc.so
[276/471] Generating ipa_vimc.so.sign with a custom command
[277/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_sdn.cpp.o
[278/471] Compiling C++ object src/ipa/rkisp1/ipa_rkisp1.so.p/rkisp1.cpp.o
[279/471] Compiling C++ object src/cam/cam.p/event_loop.cpp.o
[280/471] Linking target src/ipa/rkisp1/ipa_rkisp1.so
[281/471] Generating ipa_rkisp1.so.sign with a custom command
[282/471] Compiling C++ object src/cam/cam.p/options.cpp.o
[283/471] Generating qt5-feathericons_qrc with a custom command
[284/471] Generating qt5-shaders_qrc with a custom command
[285/471] Compiling C++ object src/lc-compliance/lc-compliance.p/.._cam_options.cpp.o
[286/471] Generating 'src/qcam/qcam.p/moc_viewfinder_qt.cpp'.
[287/471] Compiling C++ object src/lc-compliance/lc-compliance.p/main.cpp.o
[288/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_agc.cpp.o
[289/471] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_ccm.cpp.o
[290/471] Generating 'src/qcam/qcam.p/moc_main_window.cpp'.
[291/471] Compiling C++ object src/cam/cam.p/buffer_writer.cpp.o
[292/471] Generating 'src/qcam/qcam.p/moc_viewfinder_gl.cpp'.
[293/471] Compiling C++ object src/lc-compliance/lc-compliance.p/single_stream.cpp.o
[294/471] Compiling C++ object src/qcam/qcam.p/meson-generated_.._qt5-shaders_qrc.cpp.o
[295/471] Compiling C++ object src/lc-compliance/lc-compliance.p/simple_capture.cpp.o
[296/471] Compiling C++ object src/qcam/qcam.p/meson-generated_.._qt5-feathericons_qrc.cpp.o
[297/471] Compiling C++ object src/qcam/qcam.p/.._cam_options.cpp.o
[298/471] Compiling C++ object src/qcam/qcam.p/format_converter.cpp.o
[299/471] Linking target src/ipa/raspberrypi/ipa_rpi.so
[300/471] Linking target src/lc-compliance/lc-compliance
[301/471] Generating ipa_rpi.so.sign with a custom command
[302/471] Compiling C++ object src/cam/cam.p/main.cpp.o
[303/471] Compiling C++ object src/qcam/qcam.p/message_handler.cpp.o
[304/471] Compiling C++ object src/cam/cam.p/stream_options.cpp.o
[305/471] Linking target src/cam/cam
[306/471] Compiling C++ object src/qcam/qcam.p/.._cam_stream_options.cpp.o
[307/471] Compiling C++ object src/qcam/qcam.p/meson-generated_moc_viewfinder_qt.cpp.o
[308/471] Compiling C++ object src/qcam/qcam.p/meson-generated_moc_main_window.cpp.o
[309/471] Compiling C++ object src/qcam/qcam.p/meson-generated_moc_viewfinder_gl.cpp.o
[310/471] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamera.cpp.o
[311/471] Compiling C++ object src/qcam/qcam.p/dng_writer.cpp.o
[312/471] Compiling C++ object src/qcam/qcam.p/main.cpp.o
[313/471] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamera-utils.cpp.o
[314/471] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerapool.cpp.o
[315/471] Compiling C++ object src/qcam/qcam.p/viewfinder_qt.cpp.o
[316/471] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcameraprovider.cpp.o
[317/471] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcameraallocator.cpp.o
[318/471] Compiling C++ object src/qcam/qcam.p/viewfinder_gl.cpp.o
[319/471] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerapad.cpp.o
[320/471] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerasrc.cpp.o
[321/471] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera_file.cpp.o
[322/471] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera.cpp.o
[323/471] Compiling C++ object test/controls/control_list.p/control_list.cpp.o
[324/471] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_compat.cpp.o
[325/471] Linking target src/gstreamer/libgstlibcamera.so
[326/471] Compiling C++ object test/controls/control_value.p/control_value.cpp.o
[327/471] Compiling C++ object test/ipa/ipa_module_test.p/ipa_module_test.cpp.o
[328/471] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_compat_manager.cpp.o
[329/471] Compiling C++ object test/controls/control_info.p/control_info.cpp.o
[330/471] Compiling C++ object src/qcam/qcam.p/main_window.cpp.o
[331/471] Compiling C++ object test/libtest/liblibtest.a.p/test.cpp.o
[332/471] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera_proxy.cpp.o
[333/471] Compiling C++ object test/controls/control_info_map.p/control_info_map.cpp.o
[334/471] Linking target src/v4l2/v4l2-compat.so
[335/471] Compiling C++ object test/libtest/liblibtest.a.p/camera_test.cpp.o
[336/471] Linking target src/qcam/qcam
[337/471] Compiling C++ object test/camera/configuration_default.p/configuration_default.cpp.o
[338/471] Compiling C++ object test/camera/configuration_set.p/configuration_set.cpp.o
[339/471] Compiling C++ object test/libtest/liblibtest.a.p/buffer_source.cpp.o
[340/471] Linking static target test/libtest/liblibtest.a
[341/471] Linking target test/ipa/ipa_module_test
[342/471] Linking target test/ipa/ipa_interface_test
[343/471] Compiling C++ object test/camera/buffer_import.p/buffer_import.cpp.o
[344/471] Compiling C++ object test/camera/statemachine.p/statemachine.cpp.o
[345/471] Compiling C++ object test/log/log_api.p/log_api.cpp.o
[346/471] Linking target test/ipc/unixsocket_ipc
[347/471] Linking target test/controls/control_list
[348/471] Linking target test/controls/control_value
[349/471] Linking target test/controls/control_info
[350/471] Compiling C++ object test/media_device/liblib_mdev_test.a.p/media_device_test.cpp.o
[351/471] Compiling C++ object test/ipc/unixsocket.p/unixsocket.cpp.o
[352/471] Linking target test/controls/control_info_map
[353/471] Linking target test/camera/configuration_default
[354/471] Linking static target test/media_device/liblib_mdev_test.a
[355/471] Linking target test/camera/configuration_set
[356/471] Linking target test/camera/statemachine
[357/471] Linking target test/camera/buffer_import
[358/471] Linking target test/ipc/unixsocket
[359/471] Linking target test/log/log_api
[360/471] Compiling C++ object test/camera/capture.p/capture.cpp.o
[361/471] Compiling C++ object test/log/log_process.p/log_process.cpp.o
[362/471] Linking target test/camera/capture
[363/471] Generating test_mojom_module with a custom command
[364/471] Linking target test/log/log_process
[365/471] Generating test_ipa_serializer_h with a custom command
[366/471] Generating test_ipa_interface_h with a custom command
[367/471] Compiling C++ object test/media_device/media_device_link_test.p/media_device_link_test.cpp.o
[368/471] Compiling C++ object test/media_device/media_device_print_test.p/media_device_print_test.cpp.o
[369/471] Compiling C++ object test/process/process_test.p/process_test.cpp.o
[370/471] Compiling C++ object test/pipeline/rkisp1/rkisp1_pipeline_test.p/rkisp1_pipeline_test.cpp.o
[371/471] Linking target test/media_device/media_device_link_test
[372/471] Linking target test/media_device/media_device_print_test
[373/471] Linking target test/process/process_test
[374/471] Linking target test/pipeline/rkisp1/rkisp1_pipeline_test
[375/471] Compiling C++ object test/pipeline/ipu3/ipu3_pipeline_test.p/ipu3_pipeline_test.cpp.o
[376/471] Compiling C++ object test/media_device/media_device_acquire.p/media_device_acquire.cpp.o
[377/471] Linking target test/pipeline/ipu3/ipu3_pipeline_test
[378/471] Compiling C++ object test/serialization/control_serialization.p/control_serialization.cpp.o
[379/471] Linking target test/media_device/media_device_acquire
[380/471] Compiling C++ object test/stream/stream_formats.p/stream_formats.cpp.o
[381/471] Compiling C++ object test/serialization/control_serialization.p/serialization_test.cpp.o
[382/471] Compiling C++ object test/serialization/generated_serializer/generated_serializer_test.p/generated_serializer_test.cpp.o
[383/471] Linking target test/stream/stream_formats
[384/471] Compiling C++ object test/serialization/ipa_data_serializer_test.p/serialization_test.cpp.o
[385/471] Linking target test/serialization/control_serialization
[386/471] Linking target test/serialization/generated_serializer/generated_serializer_test
[387/471] Compiling C++ object test/v4l2_subdevice/list_formats.p/list_formats.cpp.o
[388/471] Compiling C++ object test/v4l2_subdevice/list_formats.p/v4l2_subdevice_test.cpp.o
[389/471] Compiling C++ object test/v4l2_subdevice/test_formats.p/test_formats.cpp.o
[390/471] Linking target test/v4l2_subdevice/list_formats
[391/471] Compiling C++ object test/v4l2_videodevice/double_open.p/double_open.cpp.o
[392/471] Compiling C++ object test/v4l2_subdevice/test_formats.p/v4l2_subdevice_test.cpp.o
[393/471] Linking target test/v4l2_subdevice/test_formats
[394/471] Compiling C++ object test/v4l2_videodevice/controls.p/v4l2_videodevice_test.cpp.o
[395/471] Compiling C++ object test/v4l2_videodevice/controls.p/controls.cpp.o
[396/471] Compiling C++ object test/v4l2_videodevice/double_open.p/v4l2_videodevice_test.cpp.o
[397/471] Compiling C++ object test/v4l2_videodevice/formats.p/v4l2_videodevice_test.cpp.o
[398/471] Compiling C++ object test/v4l2_videodevice/formats.p/formats.cpp.o
[399/471] Linking target test/v4l2_videodevice/double_open
[400/471] Linking target test/v4l2_videodevice/controls
[401/471] Linking target test/v4l2_videodevice/formats
[402/471] Compiling C++ object test/v4l2_videodevice/request_buffers.p/request_buffers.cpp.o
[403/471] Compiling C++ object test/v4l2_videodevice/request_buffers.p/v4l2_videodevice_test.cpp.o
[404/471] Compiling C++ object test/serialization/ipa_data_serializer_test.p/ipa_data_serializer_test.cpp.o
[405/471] Generating doxygen with a custom command
warning: ignoring unsupported tag `HTML_DYNAMIC_MENUS     =' at line 1210, file Documentation/Doxyfile
[406/471] Linking target test/v4l2_videodevice/request_buffers
[407/471] Compiling C++ object test/v4l2_videodevice/buffer_cache.p/buffer_cache.cpp.o
[408/471] Compiling C++ object test/v4l2_videodevice/stream_on_off.p/stream_on_off.cpp.o
[409/471] Linking target test/serialization/ipa_data_serializer_test
[410/471] Compiling C++ object test/v4l2_videodevice/stream_on_off.p/v4l2_videodevice_test.cpp.o
[411/471] Compiling C++ object test/v4l2_videodevice/buffer_cache.p/v4l2_videodevice_test.cpp.o
[412/471] Compiling C++ object test/geometry.p/geometry.cpp.o
[413/471] Compiling C++ object test/v4l2_videodevice/capture_async.p/v4l2_videodevice_test.cpp.o
[414/471] Linking target test/v4l2_videodevice/stream_on_off
[415/471] Linking target test/v4l2_videodevice/buffer_cache
[416/471] Linking target test/geometry
[417/471] Compiling C++ object test/v4l2_videodevice/capture_async.p/capture_async.cpp.o
[418/471] Compiling C++ object test/v4l2_videodevice/buffer_sharing.p/v4l2_videodevice_test.cpp.o
[419/471] Compiling C++ object test/bayer-format.p/bayer-format.cpp.o
[420/471] Compiling C++ object test/v4l2_videodevice/buffer_sharing.p/buffer_sharing.cpp.o
[421/471] Linking target test/v4l2_videodevice/capture_async
[422/471] Generating documentation with a custom command
FAILED: Documentation/html 
/var/lib/jenkins/.local/bin/sphinx-build -D release=v0.0.0+2511-e58b5fa3 -q -W -b html <https://builder.linuxtv.org/job/libcamera/ws/Documentation> Documentation/html

Extension error:
Could not import extension sphinx.builders.epub3 (exception: No module named 'imagesize')
[423/471] Linking target test/bayer-format
[424/471] Linking target test/v4l2_videodevice/buffer_sharing
[425/471] Compiling C++ object test/v4l2_videodevice/v4l2_m2mdevice.p/v4l2_m2mdevice.cpp.o
[426/471] Compiling C++ object test/v4l2_videodevice/v4l2_m2mdevice.p/v4l2_videodevice_test.cpp.o
[427/471] Compiling C++ object test/span.p/span.cpp.o
[428/471] Compiling C++ object test/byte-stream-buffer.p/byte-stream-buffer.cpp.o
[429/471] Compiling C++ object test/signal.p/signal.cpp.o
[430/471] Compiling C++ object test/camera-sensor.p/camera-sensor.cpp.o
[431/471] Compiling C++ object test/delayed_controls.p/delayed_controls.cpp.o
ninja: build stopped: subcommand failed.
Build step 'Execute shell' marked build as failure
