Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7938F5217A4
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 15:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242776AbiEJN2K convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 10 May 2022 09:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243298AbiEJN0l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 09:26:41 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A4A232753
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 06:19:20 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1noPlm-005Lod-2V; Tue, 10 May 2022 13:19:18 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1noPlk-0009oP-2x; Tue, 10 May 2022 13:19:15 +0000
Date:   Tue, 10 May 2022 13:19:15 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Message-ID: <1947579924.0.1652188755494@builder.linuxtv.org>
In-Reply-To: <742172381.1.1652136497699@builder.linuxtv.org>
References: <742172381.1.1652136497699@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #842
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: libcamera
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/libcamera/842/display/redirect?page=changes>

Changes:

[kieran.bingham] meson: Require meson 0.56+

[kieran.bingham] meson: Use new project_*_root() functions

[kieran.bingham] meson: Add 'check: true' for run_command() calls

[kieran.bingham] Add Python bindings

[kieran.bingham] py: Generate control enums from yaml

[kieran.bingham] py: Add unittests.py

[kieran.bingham] py: Add cam.py


------------------------------------------
[...truncated 22.71 KB...]
[132/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/pipeline_simple_converter.cpp.o
[133/539] Compiling C++ object src/libcamera/proxy/worker/ipu3_ipa_proxy.p/meson-generated_.._ipu3_ipa_proxy_worker.cpp.o
[134/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/tracepoints.cpp.o
[135/539] Compiling C++ object src/libcamera/proxy/worker/raspberrypi_ipa_proxy.p/meson-generated_.._raspberrypi_ipa_proxy_worker.cpp.o
[136/539] Generating rkisp1_proxy_worker with a custom command
[137/539] Generating vimc_proxy_worker with a custom command
[138/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_compare_common.cc.o
[139/539] Compiling C++ object src/libcamera/proxy/worker/rkisp1_ipa_proxy.p/meson-generated_.._rkisp1_ipa_proxy_worker.cpp.o
[140/539] Compiling C++ object src/libcamera/proxy/worker/vimc_ipa_proxy.p/meson-generated_.._vimc_ipa_proxy_worker.cpp.o
[141/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/meson-generated_.._ipa_pub_key.cpp.o
[142/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/meson-generated_.._version.cpp.o
[143/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_dpc.cpp.o
[144/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_compare_mmi.cc.o
[145/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_ccm.cpp.o
[146/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_compare_msa.cc.o
[147/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_compare_neon.cc.o
[148/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_compare_gcc.cc.o
[149/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_compare_neon64.cc.o
[150/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_compare.cc.o
[151/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_compare_win.cc.o
[152/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_convert.cc.o
[153/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_convert_from_argb.cc.o
[154/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_convert_to_i420.cc.o
[155/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_convert_jpeg.cc.o
[156/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_cpu_id.cc.o
[157/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_convert_argb.cc.o
[158/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_convert_to_argb.cc.o
[159/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_convert_from.cc.o
[160/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_mjpeg_decoder.cc.o
[161/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_rotate_any.cc.o
[162/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_mjpeg_validate.cc.o
[163/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_rotate_gcc.cc.o
[164/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_rotate_argb.cc.o
[165/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_rotate_common.cc.o
[166/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_rotate_msa.cc.o
[167/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_rotate_mmi.cc.o
[168/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/yaml_parser.cpp.o
[169/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_rotate_neon.cc.o
[170/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_rotate_neon64.cc.o
[171/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_rotate_win.cc.o
[172/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_rotate.cc.o
[173/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_row_mmi.cc.o
[174/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_row_gcc.cc.o
[175/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_row_neon64.cc.o
[176/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_row_msa.cc.o
[177/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_row_win.cc.o
[178/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_row_neon.cc.o
[179/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_row_common.cc.o
[180/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_scale_any.cc.o
[181/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_scale.cc.o
[182/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_scale_mmi.cc.o
[183/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_scale_argb.cc.o
[184/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_row_any.cc.o
[185/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_scale_msa.cc.o
[186/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_scale_gcc.cc.o
[187/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_scale_common.cc.o
[188/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_scale_neon64.cc.o
[189/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_video_common.cc.o
[190/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_scale_neon.cc.o
[191/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_scale_uv.cc.o
[192/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_scale_win.cc.o
[193/539] Linking static target subprojects/libyuv/libcm_yuv.a
[194/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_compare_common.cc.o
[195/539] Compiling C++ object src/android/libcamera-hal.so.p/camera_ops.cpp.o
[196/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_compare_gcc.cc.o
[197/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_compare_msa.cc.o
[198/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_compare_win.cc.o
[199/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_compare_neon.cc.o
[200/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_compare_mmi.cc.o
[201/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_compare_neon64.cc.o
[202/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_convert_jpeg.cc.o
[203/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_convert_from.cc.o
[204/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_compare.cc.o
[205/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_convert.cc.o
[206/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_convert_argb.cc.o
[207/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_convert_to_i420.cc.o
[208/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_cpu_id.cc.o
[209/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_convert_from_argb.cc.o
[210/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_convert_to_argb.cc.o
[211/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_mjpeg_decoder.cc.o
[212/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_rotate_any.cc.o
[213/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_rotate_mmi.cc.o
[214/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_rotate_gcc.cc.o
[215/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_rotate_msa.cc.o
[216/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_mjpeg_validate.cc.o
[217/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_rotate.cc.o
[218/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_rotate_common.cc.o
[219/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_rotate_argb.cc.o
[220/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_rotate_win.cc.o
[221/539] Linking target src/libcamera/libcamera.so.0.0.0
[222/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_planar_functions.cc.o
[223/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_row_mmi.cc.o
[224/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_rotate_neon64.cc.o
[225/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_rotate_neon.cc.o
[226/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_row_neon.cc.o
[227/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_row_msa.cc.o
[228/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_row_gcc.cc.o
[229/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_row_neon64.cc.o
[230/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_scale_any.cc.o
[231/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_row_win.cc.o
[232/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_scale_argb.cc.o
[233/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_scale_mmi.cc.o
[234/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_row_any.cc.o
[235/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_scale.cc.o
[236/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_scale_gcc.cc.o
[237/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_scale_common.cc.o
[238/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_scale_neon.cc.o
[239/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_scale_msa.cc.o
[240/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_row_common.cc.o
[241/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_scale_win.cc.o
[242/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_video_common.cc.o
[243/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_scale_neon64.cc.o
[244/539] Compiling C++ object test/event-thread.p/event-thread.cpp.o
[245/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_scale_uv.cc.o
[246/539] Compiling C object src/android/libcamera_metadata.a.p/metadata_camera_metadata.c.o
[247/539] Linking static target src/android/libcamera_metadata.a
[248/539] Linking target subprojects/libyuv/libcm_yuv_shared.so
[249/539] Generating symbol file src/libcamera/libcamera.so.0.0.0.p/libcamera.so.0.0.0.symbols
[250/539] Linking target src/libcamera/proxy/worker/ipu3_ipa_proxy
[251/539] Compiling C++ object src/android/libcamera-hal.so.p/camera_metadata.cpp.o
[252/539] Linking target src/libcamera/proxy/worker/raspberrypi_ipa_proxy
[253/539] Linking target src/libcamera/proxy/worker/rkisp1_ipa_proxy
[254/539] Linking target src/libcamera/proxy/worker/vimc_ipa_proxy
[255/539] Compiling C++ object src/android/libcamera-hal.so.p/camera3_hal.cpp.o
[256/539] Compiling C++ object src/android/libcamera-hal.so.p/camera_hal_config.cpp.o
[257/539] Compiling C++ object src/android/libcamera-hal.so.p/camera_request.cpp.o
[258/539] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_encoder_libjpeg.cpp.o
[259/539] Compiling C++ object src/android/libcamera-hal.so.p/camera_hal_manager.cpp.o
[260/539] Compiling C++ object src/ipa/libipa/libipa.a.p/camera_sensor_helper.cpp.o
[261/539] Compiling C++ object src/ipa/libipa/libipa.a.p/histogram.cpp.o
[262/539] Compiling C++ object src/ipa/libipa/libipa.a.p/libipa.cpp.o
[263/539] Linking static target src/ipa/libipa/libipa.a
[264/539] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/ipa_context.cpp.o
[265/539] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/ipu3.cpp.o
[266/539] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_af.cpp.o
[267/539] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_agc.cpp.o
[268/539] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_awb.cpp.o
[269/539] Compiling C++ object src/android/libcamera-hal.so.p/camera_stream.cpp.o
[270/539] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_tone_mapping.cpp.o
[271/539] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_exif.cpp.o
[272/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/raspberrypi.cpp.o
[273/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/md_parser_smia.cpp.o
[274/539] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_blc.cpp.o
[275/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper.cpp.o
[276/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_ov5647.cpp.o
[277/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_imx219.cpp.o
[278/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_imx296.cpp.o
[279/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_imx290.cpp.o
[280/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_imx519.cpp.o
[281/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_imx477.cpp.o
[282/539] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_post_processor_jpeg.cpp.o
[283/539] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_thumbnailer.cpp.o
[284/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_histogram.cpp.o
[285/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_controller.cpp.o
In file included from /usr/include/boost/bind.hpp:30,
                 from /usr/include/boost/property_tree/json_parser/detail/parser.hpp:7,
                 from /usr/include/boost/property_tree/json_parser/detail/read.hpp:13,
                 from /usr/include/boost/property_tree/json_parser.hpp:16,
                 from ../src/ipa/raspberrypi/controller/controller.cpp:13:
/usr/include/boost/bind.hpp:36:1: note: ‘#pragma message: The practice of declaring the Bind placeholders (_1, _2, ...) in the global namespace is deprecated. Please use <boost/bind/bind.hpp> + using namespace boost::placeholders, or define BOOST_BIND_GLOBAL_PLACEHOLDERS to retain the current behavior.’
   36 | BOOST_PRAGMA_MESSAGE(
      | ^~~~~~~~~~~~~~~~~~~~
[286/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_ov9281.cpp.o
[287/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_alsc.cpp.o
[288/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_algorithm.cpp.o
[289/539] Linking target src/ipa/ipu3/ipa_ipu3.so
[290/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_sharpen.cpp.o
[291/539] Generating ipa_ipu3.so.sign with a custom command
[292/539] Compiling C++ object src/android/libcamera-hal.so.p/yuv_post_processor_yuv.cpp.o
[293/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_black_level.cpp.o
[294/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_focus.cpp.o
[295/539] Compiling C++ object src/android/libcamera-hal.so.p/camera_capabilities.cpp.o
[296/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_contrast.cpp.o
[297/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_geq.cpp.o
[298/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_pwl.cpp.o
[299/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_awb.cpp.o
[300/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_device_status.cpp.o
[301/539] Compiling C++ object src/ipa/rkisp1/ipa_rkisp1.so.p/algorithms_awb.cpp.o
[302/539] Compiling C++ object src/ipa/rkisp1/ipa_rkisp1.so.p/ipa_context.cpp.o
[303/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_lux.cpp.o
[304/539] Compiling C++ object test/pixel-format.p/pixel-format.cpp.o
[305/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_sdn.cpp.o
[306/539] Compiling C++ object src/ipa/vimc/ipa_vimc.so.p/vimc.cpp.o
[307/539] Compiling C++ object test/shared-fd.p/shared-fd.cpp.o
[308/539] Compiling C++ object src/ipa/rkisp1/ipa_rkisp1.so.p/rkisp1.cpp.o
[309/539] Compiling C++ object src/ipa/rkisp1/ipa_rkisp1.so.p/algorithms_blc.cpp.o
[310/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_agc.cpp.o
[311/539] Compiling C++ object src/lc-compliance/lc-compliance.p/.._cam_options.cpp.o
[312/539] Compiling C++ object src/lc-compliance/lc-compliance.p/environment.cpp.o
[313/539] Compiling C++ object src/lc-compliance/lc-compliance.p/simple_capture.cpp.o
[314/539] Compiling C++ object src/lc-compliance/lc-compliance.p/capture_test.cpp.o
[315/539] Compiling C++ object src/cam/cam.p/camera_session.cpp.o
[316/539] Compiling C++ object src/android/libcamera-hal.so.p/mm_generic_camera_buffer.cpp.o
[317/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_noise.cpp.o
[318/539] Compiling C++ object src/lc-compliance/lc-compliance.p/.._cam_event_loop.cpp.o
[319/539] Compiling C++ object src/lc-compliance/lc-compliance.p/main.cpp.o
[320/539] Compiling C++ object src/cam/cam.p/file_sink.cpp.o
[321/539] Linking target src/ipa/vimc/ipa_vimc.so
[322/539] Generating ipa_vimc.so.sign with a custom command
[323/539] Compiling C++ object src/cam/cam.p/main.cpp.o
[324/539] Compiling C++ object src/lc-compliance/lc-compliance.p/.._.._subprojects_googletest-release-1.11.0_googletest_src_gtest-all.cc.o
[325/539] Compiling C++ object src/cam/cam.p/image.cpp.o
[326/539] Generating qt5-feathericons_qrc with a custom command
[327/539] Compiling C++ object src/cam/cam.p/stream_options.cpp.o
[328/539] Compiling C++ object src/cam/cam.p/options.cpp.o
[329/539] Generating qt5-shaders_qrc with a custom command
[330/539] Compiling C++ object src/android/libcamera-hal.so.p/camera_device.cpp.o
[331/539] Generating 'src/qcam/qcam.p/moc_viewfinder_qt.cpp'.
[332/539] Compiling C++ object src/cam/cam.p/frame_sink.cpp.o
[333/539] Compiling C++ object src/cam/cam.p/event_loop.cpp.o
[334/539] Compiling C++ object src/qcam/qcam.p/meson-generated_.._qt5-feathericons_qrc.cpp.o
[335/539] Generating 'src/qcam/qcam.p/moc_main_window.cpp'.
[336/539] Compiling C++ object src/qcam/qcam.p/meson-generated_moc_viewfinder_qt.cpp.o
[337/539] Linking target src/ipa/rkisp1/ipa_rkisp1.so
[338/539] Compiling C++ object src/qcam/qcam.p/meson-generated_moc_main_window.cpp.o
[339/539] Generating ipa_rkisp1.so.sign with a custom command
[340/539] Compiling C++ object src/qcam/qcam.p/format_converter.cpp.o
[341/539] Compiling C++ object src/qcam/qcam.p/.._cam_stream_options.cpp.o
[342/539] Compiling C++ object src/qcam/qcam.p/meson-generated_.._qt5-shaders_qrc.cpp.o
[343/539] Compiling C++ object src/qcam/qcam.p/main.cpp.o
[344/539] Generating 'src/qcam/qcam.p/moc_viewfinder_gl.cpp'.
[345/539] Compiling C++ object src/qcam/qcam.p/viewfinder_qt.cpp.o
[346/539] Compiling C++ object src/qcam/qcam.p/.._cam_image.cpp.o
[347/539] Compiling C++ object src/android/libcamera-hal.so.p/mm_generic_frame_buffer_allocator.cpp.o
[348/539] Compiling C++ object src/qcam/qcam.p/main_window.cpp.o
[349/539] Compiling C++ object src/qcam/qcam.p/viewfinder_gl.cpp.o
[350/539] Compiling C++ object src/qcam/qcam.p/dng_writer.cpp.o
[351/539] Compiling C++ object src/qcam/qcam.p/message_handler.cpp.o
[352/539] Compiling C++ object src/qcam/qcam.p/meson-generated_moc_viewfinder_gl.cpp.o
[353/539] Compiling C++ object src/qcam/qcam.p/.._cam_options.cpp.o
[354/539] Linking target src/cam/cam
[355/539] Linking target src/ipa/raspberrypi/ipa_rpi.so
[356/539] Generating ipa_rpi.so.sign with a custom command
[357/539] Linking target src/lc-compliance/lc-compliance
[358/539] Generating py_gen_controls with a custom command
FAILED: src/py/libcamera/pyenums_generated.cpp 
gen-py-control-enums.py -o src/py/libcamera/pyenums_generated.cpp <https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/control_ids.yaml> ../src/py/libcamera/pyenums_generated.cpp.in
/bin/sh: 1: gen-py-control-enums.py: not found
[359/539] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerapad.cpp.o
[360/539] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcameraallocator.cpp.o
[361/539] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerapool.cpp.o
[362/539] Linking target src/android/libcamera-hal.so
[363/539] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamera.cpp.o
[364/539] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamera-utils.cpp.o
[365/539] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcameraprovider.cpp.o
[366/539] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerasrc.cpp.o
[367/539] Linking target src/qcam/qcam
ninja: build stopped: subcommand failed.
Build step 'Execute shell' marked build as failure
