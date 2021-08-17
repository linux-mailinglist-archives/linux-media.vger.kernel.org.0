Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 637673EE713
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 09:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234596AbhHQHTe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 17 Aug 2021 03:19:34 -0400
Received: from www.linuxtv.org ([130.149.80.248]:42252 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233688AbhHQHTW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 03:19:22 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mFtN2-002TCs-DZ; Tue, 17 Aug 2021 07:18:48 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mFtN1-0013ET-Ce; Tue, 17 Aug 2021 07:18:46 +0000
Date:   Tue, 17 Aug 2021 07:18:46 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Message-ID: <476465706.0.1629184726292@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #662
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: libcamera
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/libcamera/662/display/redirect?page=changes>

Changes:

[umang.jain] pipeline: ipu3: Skip recording timestamp for cancelled buffers


------------------------------------------
[...truncated 7.44 KB...]
[8/373] Generating tp_header with a custom command
[9/373] Generating formats_h with a custom command
[10/373] Compiling C++ object src/libcamera/base/libcamera-base.so.p/flags.cpp.o
[11/373] Generating property_ids_h with a custom command
[12/373] Generating gen-header with a custom command
[13/373] Compiling C++ object src/libcamera/base/libcamera-base.so.p/file.cpp.o
[14/373] Compiling C++ object src/libcamera/base/libcamera-base.so.p/log.cpp.o
[15/373] Compiling C++ object src/libcamera/base/libcamera-base.so.p/message.cpp.o
[16/373] Generating ipa-priv-key with a custom command
.............................+++++
...+++++
[17/373] Compiling C++ object src/libcamera/base/libcamera-base.so.p/object.cpp.o
[18/373] Compiling C++ object src/libcamera/base/libcamera-base.so.p/semaphore.cpp.o
[19/373] Compiling C++ object src/libcamera/base/libcamera-base.so.p/signal.cpp.o
[20/373] Compiling C++ object src/libcamera/base/libcamera-base.so.p/thread.cpp.o
[21/373] Compiling C++ object src/libcamera/base/libcamera-base.so.p/timer.cpp.o
[22/373] Compiling C++ object src/libcamera/base/libcamera-base.so.p/utils.cpp.o
[23/373] Generating control_ids_h with a custom command
[24/373] Generating rkisp1_ipa_interface_cpp with a custom command
[25/373] Generating raspberrypi_ipa_interface_cpp with a custom command
[26/373] Generating ipu3_ipa_interface_cpp with a custom command
[27/373] Generating core_mojom_module with a custom command
[28/373] Generating vimc_ipa_interface_cpp with a custom command
[29/373] Generating core_ipa_interface_cpp with a custom command
[30/373] Generating ipa_pub_key_cpp with a custom command
writing RSA key
[31/373] Generating property_ids_cpp with a custom command
[32/373] Generating control_ids_cpp with a custom command
[33/373] Generating 'src/qcam/qcam.p/moc_main_window.cpp'.
[34/373] Compiling C++ object src/cam/cam.p/camera_session.cpp.o
[35/373] Compiling C++ object src/cam/cam.p/event_loop.cpp.o
[36/373] Compiling C++ object src/cam/cam.p/file_sink.cpp.o
[37/373] Compiling C++ object src/cam/cam.p/frame_sink.cpp.o
[38/373] Generating mojom_templates with a custom command
[39/373] Compiling C++ object src/cam/cam.p/main.cpp.o
[40/373] Compiling C++ object src/cam/cam.p/options.cpp.o
[41/373] Linking target src/libcamera/base/libcamera-base.so
[42/373] Generating qt5-feathericons_qrc with a custom command
[43/373] Compiling C++ object src/cam/cam.p/stream_options.cpp.o
[44/373] Generating ipu3_mojom_module with a custom command
[45/373] Generating qt5-shaders_qrc with a custom command
[46/373] Generating raspberrypi_mojom_module with a custom command
[47/373] Generating rkisp1_mojom_module with a custom command
[48/373] Generating vimc_mojom_module with a custom command
[49/373] Generating 'src/qcam/qcam.p/moc_viewfinder_qt.cpp'.
[50/373] Generating core_ipa_interface_h with a custom command
[51/373] Generating core_ipa_serializer_h with a custom command
[52/373] Generating ipu3_ipa_interface_h with a custom command
[53/373] Generating raspberrypi_ipa_interface_h with a custom command
[54/373] Generating ipu3_proxy_h with a custom command
[55/373] Generating ipu3_ipa_serializer_h with a custom command
[56/373] Generating rkisp1_ipa_interface_h with a custom command
[57/373] Generating raspberrypi_ipa_serializer_h with a custom command
[58/373] Generating rkisp1_ipa_serializer_h with a custom command
[59/373] Generating raspberrypi_proxy_h with a custom command
[60/373] Generating vimc_ipa_interface_h with a custom command
[61/373] Generating rkisp1_proxy_h with a custom command
[62/373] Generating vimc_ipa_serializer_h with a custom command
[63/373] Generating vimc_proxy_h with a custom command
[64/373] Compiling C++ object src/libcamera/libcamera.so.p/meson-generated_.._control_ids.cpp.o
[65/373] Generating ipu3_proxy_cpp with a custom command
[66/373] Compiling C++ object src/libcamera/libcamera.so.p/meson-generated_.._proxy_ipu3_ipa_proxy.cpp.o
[67/373] Compiling C++ object src/libcamera/libcamera.so.p/camera.cpp.o
[68/373] Generating vimc_proxy_cpp with a custom command
[69/373] Compiling C++ object src/libcamera/libcamera.so.p/meson-generated_.._property_ids.cpp.o
[70/373] Generating vimc_proxy_worker with a custom command
[71/373] Compiling C++ object src/libcamera/libcamera.so.p/meson-generated_.._proxy_vimc_ipa_proxy.cpp.o
[72/373] Generating raspberrypi_proxy_cpp with a custom command
[73/373] Generating rkisp1_proxy_cpp with a custom command
[74/373] Compiling C++ object src/libcamera/libcamera.so.p/byte_stream_buffer.cpp.o
[75/373] Generating raspberrypi_proxy_worker with a custom command
[76/373] Compiling C++ object src/libcamera/libcamera.so.p/bayer_format.cpp.o
[77/373] Compiling C++ object src/libcamera/libcamera.so.p/meson-generated_.._proxy_rkisp1_ipa_proxy.cpp.o
[78/373] Compiling C++ object src/libcamera/libcamera.so.p/camera_controls.cpp.o
[79/373] Compiling C++ object src/libcamera/libcamera.so.p/meson-generated_.._proxy_raspberrypi_ipa_proxy.cpp.o
[80/373] Compiling C++ object src/libcamera/libcamera.so.p/camera_manager.cpp.o
[81/373] Compiling C++ object src/libcamera/libcamera.so.p/camera_sensor.cpp.o
[82/373] Compiling C++ object src/libcamera/libcamera.so.p/camera_sensor_properties.cpp.o
[83/373] Compiling C++ object src/libcamera/libcamera.so.p/controls.cpp.o
[84/373] Compiling C++ object src/libcamera/libcamera.so.p/control_serializer.cpp.o
[85/373] Compiling C++ object src/libcamera/libcamera.so.p/control_validator.cpp.o
[86/373] Generating ipu3_proxy_worker with a custom command
[87/373] Compiling C++ object src/libcamera/libcamera.so.p/delayed_controls.cpp.o
[88/373] Compiling C++ object src/libcamera/libcamera.so.p/device_enumerator.cpp.o
[89/373] Compiling C++ object src/libcamera/libcamera.so.p/device_enumerator_sysfs.cpp.o
[90/373] Compiling C++ object src/libcamera/libcamera.so.p/file_descriptor.cpp.o
[91/373] Compiling C++ object src/libcamera/libcamera.so.p/formats.cpp.o
[92/373] Compiling C++ object src/libcamera/libcamera.so.p/framebuffer.cpp.o
[93/373] Compiling C++ object src/libcamera/libcamera.so.p/framebuffer_allocator.cpp.o
[94/373] Compiling C++ object src/libcamera/libcamera.so.p/geometry.cpp.o
[95/373] Compiling C++ object src/libcamera/libcamera.so.p/ipa_controls.cpp.o
[96/373] Compiling C++ object src/libcamera/libcamera.so.p/ipa_interface.cpp.o
[97/373] Compiling C++ object src/libcamera/libcamera.so.p/ipa_data_serializer.cpp.o
[98/373] Compiling C++ object src/libcamera/libcamera.so.p/ipc_pipe.cpp.o
[99/373] Compiling C++ object src/libcamera/libcamera.so.p/ipa_manager.cpp.o
[100/373] Compiling C++ object src/libcamera/libcamera.so.p/ipa_module.cpp.o
[101/373] Compiling C++ object src/libcamera/libcamera.so.p/ipa_proxy.cpp.o
[102/373] Compiling C++ object test/pipeline/ipu3/ipu3_pipeline_test.p/ipu3_pipeline_test.cpp.o
[103/373] Compiling C++ object src/libcamera/libcamera.so.p/ipc_pipe_unixsocket.cpp.o
[104/373] Compiling C++ object src/libcamera/libcamera.so.p/ipc_unixsocket.cpp.o
[105/373] Compiling C++ object src/libcamera/libcamera.so.p/mapped_framebuffer.cpp.o
[106/373] Compiling C++ object src/libcamera/libcamera.so.p/media_device.cpp.o
[107/373] Compiling C++ object src/libcamera/libcamera.so.p/media_object.cpp.o
[108/373] Compiling C++ object src/libcamera/libcamera.so.p/pixel_format.cpp.o
[109/373] Compiling C++ object src/libcamera/libcamera.so.p/process.cpp.o
[110/373] Compiling C++ object src/libcamera/libcamera.so.p/pub_key.cpp.o
[111/373] Compiling C++ object src/libcamera/libcamera.so.p/request.cpp.o
[112/373] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_handler.cpp.o
[113/373] Compiling C++ object src/libcamera/libcamera.so.p/sysfs.cpp.o
[114/373] Compiling C++ object src/libcamera/libcamera.so.p/source_paths.cpp.o
[115/373] Compiling C++ object src/libcamera/libcamera.so.p/stream.cpp.o
[116/373] Compiling C++ object src/libcamera/libcamera.so.p/transform.cpp.o
[117/373] Compiling C++ object src/libcamera/libcamera.so.p/v4l2_device.cpp.o
[118/373] Compiling C++ object src/libcamera/libcamera.so.p/v4l2_pixelformat.cpp.o
[119/373] Compiling C++ object src/libcamera/libcamera.so.p/v4l2_subdevice.cpp.o
[120/373] Compiling C++ object src/libcamera/libcamera.so.p/v4l2_videodevice.cpp.o
[121/373] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_ipu3_cio2.cpp.o
[122/373] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_ipu3_frames.cpp.o
[123/373] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_ipu3_imgu.cpp.o
[124/373] Generating version.cpp with a custom command
[125/373] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_raspberrypi_dma_heaps.cpp.o
[126/373] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_raspberrypi_rpi_stream.cpp.o
[127/373] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_rkisp1_rkisp1_path.cpp.o
[128/373] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_simple_converter.cpp.o
[129/373] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_raspberrypi_raspberrypi.cpp.o
[130/373] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_rkisp1_rkisp1.cpp.o
[131/373] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_uvcvideo_uvcvideo.cpp.o
[132/373] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_simple_simple.cpp.o
[133/373] Compiling C++ object src/libcamera/libcamera.so.p/tracepoints.cpp.o
[134/373] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_vimc_vimc.cpp.o
[135/373] Compiling C++ object src/libcamera/proxy/worker/ipu3_ipa_proxy.p/meson-generated_.._ipu3_ipa_proxy_worker.cpp.o
[136/373] Compiling C++ object test/ipa/ipa_module_test.p/ipa_module_test.cpp.o
[137/373] Compiling C++ object src/libcamera/libcamera.so.p/device_enumerator_udev.cpp.o
[138/373] Compiling C++ object test/camera/statemachine.p/statemachine.cpp.o
[139/373] Compiling C++ object src/libcamera/proxy/worker/raspberrypi_ipa_proxy.p/meson-generated_.._raspberrypi_ipa_proxy_worker.cpp.o
[140/373] Compiling C++ object test/camera/capture.p/capture.cpp.o
[141/373] Compiling C++ object src/ipa/libipa/libipa.a.p/camera_sensor_helper.cpp.o
[142/373] Compiling C++ object src/libcamera/proxy/worker/vimc_ipa_proxy.p/meson-generated_.._vimc_ipa_proxy_worker.cpp.o
[143/373] Compiling C++ object src/ipa/libipa/libipa.a.p/histogram.cpp.o
[144/373] Compiling C++ object src/ipa/libipa/libipa.a.p/algorithm.cpp.o
[145/373] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/ipu3.cpp.o
[146/373] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/ipu3_awb.cpp.o
[147/373] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/ipu3_agc.cpp.o
[148/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper.cpp.o
[149/373] Linking static target src/ipa/libipa/libipa.a
[150/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/md_parser_smia.cpp.o
[151/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_ov5647.cpp.o
[152/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_imx219.cpp.o
[153/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_imx290.cpp.o
[154/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_imx477.cpp.o
[155/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/raspberrypi.cpp.o
[156/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_histogram.cpp.o
[157/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_ov9281.cpp.o
[158/373] Generating symbol file src/libcamera/base/libcamera-base.so.p/libcamera-base.so.symbols
[159/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_controller.cpp.o
In file included from /usr/include/boost/bind.hpp:30,
                 from /usr/include/boost/property_tree/json_parser/detail/parser.hpp:7,
                 from /usr/include/boost/property_tree/json_parser/detail/read.hpp:13,
                 from /usr/include/boost/property_tree/json_parser.hpp:16,
                 from ../src/ipa/raspberrypi/controller/controller.cpp:13:
/usr/include/boost/bind.hpp:36:1: note: ‘#pragma message: The practice of declaring the Bind placeholders (_1, _2, ...) in the global namespace is deprecated. Please use <boost/bind/bind.hpp> + using namespace boost::placeholders, or define BOOST_BIND_GLOBAL_PLACEHOLDERS to retain the current behavior.’
   36 | BOOST_PRAGMA_MESSAGE(
      | ^~~~~~~~~~~~~~~~~~~~
[160/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_algorithm.cpp.o
[161/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_alsc.cpp.o
[162/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_awb.cpp.o
[163/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_sharpen.cpp.o
[164/373] Generating rkisp1_proxy_worker with a custom command
[165/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_black_level.cpp.o
[166/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_focus.cpp.o
[167/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_geq.cpp.o
[168/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_noise.cpp.o
[169/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_lux.cpp.o
[170/373] Compiling C++ object src/libcamera/proxy/worker/rkisp1_ipa_proxy.p/meson-generated_.._rkisp1_ipa_proxy_worker.cpp.o
[171/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_contrast.cpp.o
[172/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_dpc.cpp.o
[173/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_agc.cpp.o
[174/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_pwl.cpp.o
[175/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_device_status.cpp.o
[176/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_ccm.cpp.o
[177/373] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_sdn.cpp.o
[178/373] Compiling C++ object src/ipa/rkisp1/ipa_rkisp1.so.p/rkisp1.cpp.o
[179/373] Compiling C++ object src/ipa/vimc/ipa_vimc.so.p/vimc.cpp.o
[180/373] Compiling C++ object src/qcam/qcam.p/meson-generated_.._qt5-feathericons_qrc.cpp.o
[181/373] Compiling C++ object src/qcam/qcam.p/meson-generated_.._qt5-shaders_qrc.cpp.o
[182/373] Compiling C++ object src/qcam/qcam.p/meson-generated_moc_main_window.cpp.o
[183/373] Compiling C++ object src/qcam/qcam.p/meson-generated_moc_viewfinder_qt.cpp.o
[184/373] Compiling C++ object src/qcam/qcam.p/.._cam_options.cpp.o
[185/373] Compiling C++ object src/qcam/qcam.p/.._cam_stream_options.cpp.o
[186/373] Compiling C++ object src/qcam/qcam.p/format_converter.cpp.o
[187/373] Compiling C++ object src/qcam/qcam.p/message_handler.cpp.o
[188/373] Compiling C++ object src/qcam/qcam.p/main.cpp.o
[189/373] Compiling C++ object src/qcam/qcam.p/viewfinder_qt.cpp.o
[190/373] Compiling C++ object src/qcam/qcam.p/dng_writer.cpp.o
[191/373] Compiling C++ object src/qcam/qcam.p/main_window.cpp.o
[192/373] Compiling C++ object src/qcam/qcam.p/viewfinder_gl.cpp.o
[193/373] Generating 'src/qcam/qcam.p/moc_viewfinder_gl.cpp'.
[194/373] Compiling C++ object src/qcam/qcam.p/meson-generated_moc_viewfinder_gl.cpp.o
[195/373] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerapool.cpp.o
[196/373] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcameraallocator.cpp.o
[197/373] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera_file.cpp.o
[198/373] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera.cpp.o
[199/373] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamera-utils.cpp.o
[200/373] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera_proxy.cpp.o
[201/373] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_compat.cpp.o
[202/373] Compiling C++ object test/controls/control_info.p/control_info.cpp.o
[203/373] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerapad.cpp.o
[204/373] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_compat_manager.cpp.o
[205/373] Compiling C++ object test/camera/configuration_set.p/configuration_set.cpp.o
[206/373] Compiling C++ object test/controls/control_info_map.p/control_info_map.cpp.o
[207/373] Compiling C++ object test/controls/control_list.p/control_list.cpp.o
[208/373] Compiling C++ object test/camera/buffer_import.p/buffer_import.cpp.o
[209/373] Compiling C++ object test/libtest/liblibtest.a.p/buffer_source.cpp.o
[210/373] Generating documentation with a custom command
FAILED: Documentation/html 
/var/lib/jenkins/.local/bin/sphinx-build -D release=v0.0.0+2902-c0417c4d -q -W -b html <https://builder.linuxtv.org/job/libcamera/ws/Documentation> Documentation/html
Traceback (most recent call last):
  File "/var/lib/jenkins/.local/bin/sphinx-build", line 6, in <module>
    from sphinx.cmd.build import main
ModuleNotFoundError: No module named 'sphinx'
[211/373] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcameraprovider.cpp.o
[212/373] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerasrc.cpp.o
[213/373] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamera.cpp.o
[214/373] Compiling C++ object src/libcamera/libcamera.so.p/meson-generated_.._version.cpp.o
[215/373] Compiling C++ object src/libcamera/libcamera.so.p/meson-generated_.._ipa_pub_key.cpp.o
[216/373] Compiling C++ object test/libtest/liblibtest.a.p/test.cpp.o
[217/373] Compiling C++ object test/libtest/liblibtest.a.p/camera_test.cpp.o
[218/373] Compiling C++ object src/libcamera/libcamera.so.p/pipeline_ipu3_ipu3.cpp.o
[219/373] Generating doxygen with a custom command
<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/base/file.cpp>:48: warning: no matching class member found for 
  libcamera::File::MapFlag::NoOption

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/base/file.cpp>:50: warning: no uniquely matching class member found for 
  libcamera::File::MapFlag::Private

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/base/file.cpp>:63: warning: no matching class member found for 
  libcamera::File::OpenModeFlag::NotOpen

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/base/file.cpp>:65: warning: no matching class member found for 
  libcamera::File::OpenModeFlag::ReadOnly

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/base/file.cpp>:67: warning: no matching class member found for 
  libcamera::File::OpenModeFlag::WriteOnly

<https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/base/file.cpp>:69: warning: no uniquely matching class member found for 
  libcamera::File::OpenModeFlag::ReadWrite

ninja: build stopped: subcommand failed.
Build step 'Execute shell' marked build as failure
