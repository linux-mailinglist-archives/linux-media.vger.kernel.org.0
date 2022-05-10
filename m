Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3637552247A
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 21:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237906AbiEJTDl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 10 May 2022 15:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbiEJTDk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 15:03:40 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93E8025C59
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 12:03:38 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1noV8y-005izZ-GO; Tue, 10 May 2022 19:03:36 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1noV8w-001b78-S6; Tue, 10 May 2022 19:03:34 +0000
Date:   Tue, 10 May 2022 19:03:34 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Message-ID: <513988346.2.1652209414367@builder.linuxtv.org>
In-Reply-To: <363745425.1.1652191420856@builder.linuxtv.org>
References: <363745425.1.1652191420856@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #844
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

See <https://builder.linuxtv.org/job/libcamera/844/display/redirect?page=changes>

Changes:

[kieran.bingham] v4l2_videodevice: Disable the watchdog timer when no buffers are queued


------------------------------------------
[...truncated 19.79 KB...]
[114/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/sysfs.cpp.o
[115/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/stream.cpp.o
[116/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/v4l2_pixelformat.cpp.o
[117/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/transform.cpp.o
[118/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/yaml_parser.cpp.o
[119/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/pipeline_ipu3_frames.cpp.o
[120/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/pipeline_ipu3_cio2.cpp.o
[121/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/v4l2_subdevice.cpp.o
[122/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/pipeline_ipu3_imgu.cpp.o
[123/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/v4l2_device.cpp.o
[124/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/pipeline_raspberrypi_dma_heaps.cpp.o
[125/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/pipeline_rkisp1_rkisp1.cpp.o
[126/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/pipeline_raspberrypi_rpi_stream.cpp.o
[127/539] Compiling C++ object test/object-invoke.p/object-invoke.cpp.o
[128/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/pipeline_rkisp1_rkisp1_path.cpp.o
[129/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/pipeline_simple_simple.cpp.o
[130/539] Compiling C++ object src/ipa/rkisp1/ipa_rkisp1.so.p/algorithms_agc.cpp.o
[131/539] Compiling C++ object src/android/libcamera-hal.so.p/camera_ops.cpp.o
[132/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/tracepoints.cpp.o
[133/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/pipeline_raspberrypi_raspberrypi.cpp.o
[134/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/pipeline_ipu3_ipu3.cpp.o
[135/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/pipeline_simple_converter.cpp.o
[136/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/pipeline_vimc_vimc.cpp.o
[137/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/pipeline_uvcvideo_uvcvideo.cpp.o
[138/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/device_enumerator_udev.cpp.o
[139/539] Compiling C++ object src/libcamera/proxy/worker/ipu3_ipa_proxy.p/meson-generated_.._ipu3_ipa_proxy_worker.cpp.o
[140/539] Generating symbol file src/libcamera/base/libcamera-base.so.0.0.0.p/libcamera-base.so.0.0.0.symbols
[141/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_dpc.cpp.o
[142/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_ccm.cpp.o
[143/539] Compiling C++ object src/libcamera/proxy/worker/raspberrypi_ipa_proxy.p/meson-generated_.._raspberrypi_ipa_proxy_worker.cpp.o
[144/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_compare_win.cc.o
[145/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_compare_neon.cc.o
[146/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_compare_msa.cc.o
[147/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_compare_mmi.cc.o
[148/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_compare_neon64.cc.o
[149/539] Compiling C++ object src/libcamera/proxy/worker/rkisp1_ipa_proxy.p/meson-generated_.._rkisp1_ipa_proxy_worker.cpp.o
[150/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_convert_from.cc.o
[151/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_convert_from_argb.cc.o
[152/539] Compiling C++ object src/libcamera/proxy/worker/vimc_ipa_proxy.p/meson-generated_.._vimc_ipa_proxy_worker.cpp.o
[153/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_convert.cc.o
[154/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_convert_argb.cc.o
[155/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_mjpeg_validate.cc.o
[156/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_convert_jpeg.cc.o
[157/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_convert_to_argb.cc.o
[158/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_convert_to_i420.cc.o
[159/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_rotate.cc.o
[160/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_rotate_argb.cc.o
[161/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_cpu_id.cc.o
[162/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_mjpeg_decoder.cc.o
[163/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_rotate_mmi.cc.o
[164/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_rotate_common.cc.o
[165/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_rotate_msa.cc.o
[166/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_rotate_neon.cc.o
[167/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_rotate_any.cc.o
[168/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_row_any.cc.o
[169/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_row_common.cc.o
[170/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_rotate_gcc.cc.o
[171/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_rotate_neon64.cc.o
[172/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_row_msa.cc.o
[173/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_rotate_win.cc.o
[174/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_row_neon.cc.o
[175/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_row_neon64.cc.o
[176/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_row_win.cc.o
[177/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_scale.cc.o
[178/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_scale_argb.cc.o
[179/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_row_gcc.cc.o
[180/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_row_mmi.cc.o
[181/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_scale_neon.cc.o
[182/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_scale_msa.cc.o
[183/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_scale_any.cc.o
[184/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_scale_neon64.cc.o
[185/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_scale_common.cc.o
[186/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_scale_mmi.cc.o
[187/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_video_common.cc.o
[188/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_scale_uv.cc.o
[189/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_scale_gcc.cc.o
[190/539] Compiling C++ object subprojects/libyuv/libcm_yuv.a.p/source_scale_win.cc.o
[191/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_compare_mmi.cc.o
[192/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_compare.cc.o
[193/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_compare_common.cc.o
[194/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_compare_gcc.cc.o
[195/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_compare_msa.cc.o
[196/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_convert.cc.o
[197/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_convert_argb.cc.o
[198/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_compare_neon.cc.o
[199/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_compare_neon64.cc.o
[200/539] Linking static target subprojects/libyuv/libcm_yuv.a
[201/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_compare_win.cc.o
[202/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_convert_from.cc.o
[203/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_convert_jpeg.cc.o
[204/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_convert_from_argb.cc.o
[205/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_convert_to_argb.cc.o
[206/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_mjpeg_validate.cc.o
[207/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_mjpeg_decoder.cc.o
[208/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_convert_to_i420.cc.o
[209/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_cpu_id.cc.o
[210/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_rotate_common.cc.o
[211/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_rotate_gcc.cc.o
[212/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_rotate_any.cc.o
[213/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_planar_functions.cc.o
[214/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_rotate_argb.cc.o
[215/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_rotate_neon64.cc.o
[216/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_rotate.cc.o
[217/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_rotate_mmi.cc.o
[218/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_rotate_win.cc.o
[219/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_row_any.cc.o
[220/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_row_common.cc.o
[221/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_rotate_neon.cc.o
[222/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_row_msa.cc.o
[223/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_row_mmi.cc.o
[224/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_row_gcc.cc.o
[225/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_row_neon64.cc.o
[226/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_row_neon.cc.o
[227/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_scale_any.cc.o
[228/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_scale_argb.cc.o
[229/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_scale_gcc.cc.o
[230/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_scale_msa.cc.o
[231/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_scale.cc.o
[232/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_scale_mmi.cc.o
[233/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_scale_common.cc.o
[234/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_row_win.cc.o
[235/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_scale_neon64.cc.o
[236/539] Compiling C object src/android/libcamera_metadata.a.p/metadata_camera_metadata.c.o
[237/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_scale_uv.cc.o
[238/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_scale_neon.cc.o
[239/539] Linking static target src/android/libcamera_metadata.a
[240/539] Compiling C++ object src/android/libcamera-hal.so.p/camera3_hal.cpp.o
[241/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_rotate_msa.cc.o
[242/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_scale_win.cc.o
[243/539] Compiling C++ object subprojects/libyuv/libcm_yuv_shared.so.p/source_video_common.cc.o
[244/539] Compiling C++ object src/android/libcamera-hal.so.p/camera_device.cpp.o
[245/539] Compiling C++ object src/android/libcamera-hal.so.p/camera_metadata.cpp.o
[246/539] Compiling C++ object test/event-thread.p/event-thread.cpp.o
[247/539] Compiling C++ object src/android/libcamera-hal.so.p/camera_hal_config.cpp.o
[248/539] Compiling C++ object src/android/libcamera-hal.so.p/camera_stream.cpp.o
[249/539] Compiling C++ object src/android/libcamera-hal.so.p/camera_hal_manager.cpp.o
[250/539] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_encoder_libjpeg.cpp.o
[251/539] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_thumbnailer.cpp.o
[252/539] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_post_processor_jpeg.cpp.o
[253/539] Compiling C++ object src/android/libcamera-hal.so.p/mm_generic_camera_buffer.cpp.o
[254/539] Compiling C++ object src/android/libcamera-hal.so.p/mm_generic_frame_buffer_allocator.cpp.o
[255/539] Compiling C++ object src/ipa/libipa/libipa.a.p/camera_sensor_helper.cpp.o
[256/539] Compiling C++ object src/ipa/libipa/libipa.a.p/libipa.cpp.o
[257/539] Compiling C++ object src/android/libcamera-hal.so.p/yuv_post_processor_yuv.cpp.o
[258/539] Compiling C++ object src/android/libcamera-hal.so.p/camera_capabilities.cpp.o
[259/539] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/ipa_context.cpp.o
[260/539] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_exif.cpp.o
[261/539] Compiling C++ object src/ipa/libipa/libipa.a.p/histogram.cpp.o
[262/539] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_af.cpp.o
[263/539] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/ipu3.cpp.o
[264/539] Linking static target src/ipa/libipa/libipa.a
[265/539] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_blc.cpp.o
[266/539] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_awb.cpp.o
[267/539] Compiling C++ object src/android/libcamera-hal.so.p/camera_request.cpp.o
[268/539] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_agc.cpp.o
[269/539] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_tone_mapping.cpp.o
[270/539] Linking target subprojects/libyuv/libcm_yuv_shared.so
[271/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/md_parser_smia.cpp.o
[272/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper.cpp.o
[273/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_ov5647.cpp.o
[274/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_imx219.cpp.o
[275/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_imx296.cpp.o
[276/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_imx290.cpp.o
[277/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_ov9281.cpp.o
[278/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_imx477.cpp.o
[279/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/cam_helper_imx519.cpp.o
[280/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_histogram.cpp.o
[281/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_alsc.cpp.o
[282/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_controller.cpp.o
In file included from /usr/include/boost/bind.hpp:30,
                 from /usr/include/boost/property_tree/json_parser/detail/parser.hpp:7,
                 from /usr/include/boost/property_tree/json_parser/detail/read.hpp:13,
                 from /usr/include/boost/property_tree/json_parser.hpp:16,
                 from ../src/ipa/raspberrypi/controller/controller.cpp:13:
/usr/include/boost/bind.hpp:36:1: note: ‘#pragma message: The practice of declaring the Bind placeholders (_1, _2, ...) in the global namespace is deprecated. Please use <boost/bind/bind.hpp> + using namespace boost::placeholders, or define BOOST_BIND_GLOBAL_PLACEHOLDERS to retain the current behavior.’
   36 | BOOST_PRAGMA_MESSAGE(
      | ^~~~~~~~~~~~~~~~~~~~
[283/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_focus.cpp.o
[284/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/raspberrypi.cpp.o
[285/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_algorithm.cpp.o
[286/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_awb.cpp.o
[287/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_sharpen.cpp.o
[288/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_black_level.cpp.o
[289/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_noise.cpp.o
[290/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_geq.cpp.o
[291/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_contrast.cpp.o
[292/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_pwl.cpp.o
[293/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_lux.cpp.o
[294/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_agc.cpp.o
[295/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_rpi_sdn.cpp.o
[296/539] Compiling C++ object src/ipa/raspberrypi/ipa_rpi.so.p/controller_device_status.cpp.o
[297/539] Compiling C++ object src/ipa/rkisp1/ipa_rkisp1.so.p/algorithms_awb.cpp.o
[298/539] Compiling C++ object test/shared-fd.p/shared-fd.cpp.o
[299/539] Compiling C++ object test/pixel-format.p/pixel-format.cpp.o
[300/539] Compiling C++ object src/lc-compliance/lc-compliance.p/.._cam_event_loop.cpp.o
[301/539] Compiling C++ object src/ipa/rkisp1/ipa_rkisp1.so.p/algorithms_blc.cpp.o
[302/539] Compiling C++ object src/ipa/rkisp1/ipa_rkisp1.so.p/ipa_context.cpp.o
[303/539] Compiling C++ object src/lc-compliance/lc-compliance.p/environment.cpp.o
[304/539] Compiling C++ object src/lc-compliance/lc-compliance.p/main.cpp.o
[305/539] Compiling C++ object src/lc-compliance/lc-compliance.p/.._cam_options.cpp.o
[306/539] Compiling C++ object src/ipa/rkisp1/ipa_rkisp1.so.p/rkisp1.cpp.o
[307/539] Compiling C++ object src/ipa/vimc/ipa_vimc.so.p/vimc.cpp.o
[308/539] Compiling C++ object src/cam/cam.p/camera_session.cpp.o
[309/539] Compiling C++ object src/cam/cam.p/frame_sink.cpp.o
[310/539] Compiling C++ object src/lc-compliance/lc-compliance.p/capture_test.cpp.o
[311/539] Compiling C++ object src/cam/cam.p/event_loop.cpp.o
[312/539] Compiling C++ object src/cam/cam.p/file_sink.cpp.o
[313/539] Generating qt5-feathericons_qrc with a custom command
[314/539] Compiling C++ object src/cam/cam.p/main.cpp.o
[315/539] Generating qt5-shaders_qrc with a custom command
[316/539] Compiling C++ object src/lc-compliance/lc-compliance.p/.._.._subprojects_googletest-release-1.11.0_googletest_src_gtest-all.cc.o
[317/539] Generating 'src/qcam/qcam.p/moc_main_window.cpp'.
[318/539] Generating 'src/qcam/qcam.p/moc_viewfinder_qt.cpp'.
[319/539] Compiling C++ object src/cam/cam.p/image.cpp.o
[320/539] Generating 'src/qcam/qcam.p/moc_viewfinder_gl.cpp'.
[321/539] Compiling C++ object src/lc-compliance/lc-compliance.p/simple_capture.cpp.o
[322/539] Compiling C++ object src/qcam/qcam.p/meson-generated_moc_main_window.cpp.o
[323/539] Compiling C++ object src/qcam/qcam.p/meson-generated_moc_viewfinder_qt.cpp.o
[324/539] Compiling C++ object src/cam/cam.p/options.cpp.o
[325/539] Compiling C++ object src/qcam/qcam.p/.._cam_image.cpp.o
[326/539] Compiling C++ object src/qcam/qcam.p/meson-generated_moc_viewfinder_gl.cpp.o
[327/539] Compiling C++ object src/qcam/qcam.p/meson-generated_.._qt5-feathericons_qrc.cpp.o
[328/539] Compiling C++ object src/qcam/qcam.p/.._cam_options.cpp.o
[329/539] Compiling C++ object src/qcam/qcam.p/format_converter.cpp.o
[330/539] Compiling C++ object src/qcam/qcam.p/message_handler.cpp.o
[331/539] Compiling C++ object src/qcam/qcam.p/main.cpp.o
[332/539] Compiling C++ object src/qcam/qcam.p/main_window.cpp.o
[333/539] Compiling C++ object src/qcam/qcam.p/viewfinder_qt.cpp.o
[334/539] Compiling C++ object src/qcam/qcam.p/viewfinder_gl.cpp.o
[335/539] Compiling C++ object src/cam/cam.p/stream_options.cpp.o
[336/539] Compiling C++ object src/qcam/qcam.p/meson-generated_.._qt5-shaders_qrc.cpp.o
[337/539] Compiling C++ object src/qcam/qcam.p/.._cam_stream_options.cpp.o
[338/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/meson-generated_.._ipa_pub_key.cpp.o
[339/539] Compiling C++ object src/qcam/qcam.p/dng_writer.cpp.o
[340/539] Generating py_gen_controls with a custom command
FAILED: src/py/libcamera/pyenums_generated.cpp 
gen-py-control-enums.py -o src/py/libcamera/pyenums_generated.cpp <https://builder.linuxtv.org/job/libcamera/ws/src/libcamera/control_ids.yaml> ../src/py/libcamera/pyenums_generated.cpp.in
/bin/sh: 1: gen-py-control-enums.py: not found
[341/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/meson-generated_.._version.cpp.o
[342/539] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamera-utils.cpp.o
[343/539] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcameraallocator.cpp.o
[344/539] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcameraprovider.cpp.o
[345/539] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerapool.cpp.o
[346/539] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamera.cpp.o
[347/539] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerasrc.cpp.o
[348/539] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerapad.cpp.o
[349/539] Compiling C++ object src/libcamera/libcamera.so.0.0.0.p/v4l2_videodevice.cpp.o
ninja: build stopped: subcommand failed.
Build step 'Execute shell' marked build as failure
