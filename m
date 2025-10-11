Return-Path: <linux-media+bounces-44203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D225BCFB1D
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 20:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5C0AC4E7205
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 18:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFAF0283128;
	Sat, 11 Oct 2025 18:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pp/LQKmS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262FB1E500C
	for <linux-media@vger.kernel.org>; Sat, 11 Oct 2025 18:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760208746; cv=none; b=LxE00pdKdRIIw99mrmjTPq7+YMs3hXFICn7/5kZMKEjHbOwLSprKP+4HsqhAyQF56j7fVofUCnOmkD/k4Moavny5ZsTI9lsNWyfHMT9JqEc01RySylPToP69ZCcMcT6yq8DT0RAiLnirFECrfLd+XuidF+jBJH0qiWfZn+OAsPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760208746; c=relaxed/simple;
	bh=LR3Le0n1hkOxyG2zNR5DTqkiALlJgdV2/aeAG4mtih8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jf3fIETAxdYbFWpiBTCLhoG/mJ83cSWFpYWgBnmADjurbjOqeVrRXqHyRj+O9FOay6/fk5WMJQwnZL8WZhAS57KGIsNOVYDIfGKnz04GV0vK95q1AQWTxhNIzt71mli920764O9kSgINJe0XworB3an7+evChdS346Xua37//y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pp/LQKmS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4742C4CEF4;
	Sat, 11 Oct 2025 18:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760208745;
	bh=LR3Le0n1hkOxyG2zNR5DTqkiALlJgdV2/aeAG4mtih8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Pp/LQKmSOcVDwRNDYzHVDiyRIoSUlnHgeAZ95IZ1n0AbCEHLLXs1T/FC+4xQqUETu
	 3072qs7fHbSfoODJ6IL4gc7L5wnlQjsSM7xu9nkMrdbYiEQwpmrr4jJxA3WBa1RrwB
	 ehAFlc3cQz0Kjb1LlYe3Ss+Z3cm+yG7b5q1owIoYLugiCrEoPXjm7pMls/qhxVWDls
	 ebOOWE1/SdvOjncKUESo40nV15ij+Pnorh2Q0FnUKVNjhoSSKS9Sj+Gr+ZQZtLhOA7
	 a6jzcGK8h4qNzxmBSuULL0wTdD3oaIQgxouJGiwtJ8jRpc7Wp0z3Eqgr49RPAqu7Yw
	 fmG1D1dyISkWA==
Date: Sat, 11 Oct 2025 19:52:19 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jenkins Builder Robot <jenkins@linuxtv.org>, mchehab@kernel.org,
 linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Subject: Re: Build failed in Jenkins: libcamera #1486
Message-ID: <20251011195207.48230e4f@sal.lan>
In-Reply-To: <20250918200953.GM8821@pendragon.ideasonboard.com>
References: <872623170.1.1758224010275@builder.linuxtv.org>
	<20250918200953.GM8821@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 18 Sep 2025 23:09:53 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> On Thu, Sep 18, 2025 at 07:33:30PM +0000, Jenkins Builder Robot wrote:
> > See <https://builder.linuxtv.org/job/libcamera/1486/display/redirect?page=changes>
> > 
> > Changes:
> > 
> > [Laurent Pinchart] Documentation: Use standard ordering for Doxyfile variables
> > 
> > [Laurent Pinchart] Documentation: Add doxygen-awesome-css
> > 
> > [Laurent Pinchart] Documentation: Enable doxygen-awesome-css
> > 
> > [Laurent Pinchart] Documentation: Use the sphinx book theme
> > 
> > [Laurent Pinchart] Documentation: Add api-html/ and internal-api-html/ to docs sources
> > 
> > [Laurent Pinchart] Documentation: Reorganize toctree
> > 
> > [Laurent Pinchart] Documentation: Improve Sphinx and Doxygen integration
> > 
> > [Laurent Pinchart] Documentation: Drop unnecessary documentation-contents.rst
> > 
> > [Laurent Pinchart] Documentation: mainpage: Make it easier to distinguish public and internal API
> > 
> > [Laurent Pinchart] Documentation: Rename api to public-api and drop -html suffix
> > 
> > 
> > ------------------------------------------
> > [...truncated 24.52 KiB...]
> > [141/346] Generating include/libcamera/ipa/ipu3_ipa_serializer_h with a custom command (wrapped by meson to set env)
> > [142/346] Generating src/libcamera/ipa/rkisp1_ipa_interface.cpp with a custom command
> > [143/346] Generating include/libcamera/ipa/soft_ipa_serializer_h with a custom command (wrapped by meson to set env)
> > [144/346] Generating src/libcamera/ipa/soft_ipa_interface.cpp with a custom command
> > [145/346] Generating src/libcamera/ipa/raspberrypi_ipa_interface.cpp with a custom command
> > [146/346] Generating src/libcamera/ipa/vimc_ipa_interface.cpp with a custom command
> > [147/346] Generating src/libcamera/ipa/core_ipa_interface.cpp with a custom command
> > [148/346] Generating include/libcamera/ipa/soft_ipa_interface_h with a custom command (wrapped by meson to set env)
> > [149/346] Generating include/libcamera/ipa/soft_proxy_h with a custom command (wrapped by meson to set env)
> > [150/346] Generating src/libcamera/ipa_pub_key_cpp with a custom command
> > writing RSA key
> > [151/346] Linking target src/libcamera/base/libcamera-base.so.0.5.2
> > [152/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/camera.cpp.o
> > [153/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/camera_manager.cpp.o
> > [154/346] Generating src/libcamera/proxy/soft_proxy_cpp with a custom command (wrapped by meson to set env)
> > [155/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/color_space.cpp.o
> > [156/346] Generating src/libcamera/proxy/ipu3_proxy_cpp with a custom command (wrapped by meson to set env)
> > [157/346] Generating src/libcamera/properties_ids_cpp with a custom command (wrapped by meson to set env)
> > [158/346] Generating src/libcamera/proxy/worker/ipu3_proxy_worker with a custom command (wrapped by meson to set env)
> > [159/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-generated_.._proxy_soft_ipa_proxy.cpp.o
> > [160/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-generated_.._property_ids.cpp.o
> > [161/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/fence.cpp.o
> > [162/346] Generating src/libcamera/controls_ids_cpp with a custom command (wrapped by meson to set env)
> > [163/346] Generating src/libcamera/proxy/worker/soft_proxy_worker with a custom command (wrapped by meson to set env)
> > [164/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/controls.cpp.o
> > [165/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-generated_.._proxy_ipu3_ipa_proxy.cpp.o
> > [166/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/framebuffer.cpp.o
> > [167/346] Generating src/libcamera/version.cpp with a custom command
> > [168/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/framebuffer_allocator.cpp.o
> > [169/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/orientation.cpp.o
> > [170/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pixel_format.cpp.o
> > [171/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/geometry.cpp.o
> > [172/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-generated_.._control_ids.cpp.o
> > [173/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/stream.cpp.o
> > [174/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/transform.cpp.o
> > [175/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/request.cpp.o
> > [176/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/bayer_format.cpp.o
> > [177/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/camera_controls.cpp.o
> > [178/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/camera_lens.cpp.o
> > [179/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/clock_recovery.cpp.o
> > [180/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/byte_stream_buffer.cpp.o
> > [181/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/control_validator.cpp.o
> > [182/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/control_serializer.cpp.o
> > [183/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/debug_controls.cpp.o
> > [184/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/device_enumerator_sysfs.cpp.o
> > [185/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/device_enumerator.cpp.o
> > [186/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/converter.cpp.o
> > [187/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/delayed_controls.cpp.o
> > [188/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/formats.cpp.o
> > [189/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_interface.cpp.o
> > [190/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/dma_buf_allocator.cpp.o
> > [191/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_controls.cpp.o
> > [192/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_proxy.cpp.o
> > [193/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_module.cpp.o
> > [194/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_data_serializer.cpp.o
> > [195/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipc_pipe.cpp.o
> > [196/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipc_unixsocket.cpp.o
> > [197/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/mapped_framebuffer.cpp.o
> > [198/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/matrix.cpp.o
> > [199/346] Generating symbol file src/libcamera/base/libcamera-base.so.0.5.2.p/libcamera-base.so.0.5.2.symbols
> > [200/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_manager.cpp.o
> > [201/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipc_pipe_unixsocket.cpp.o
> > [202/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/media_device.cpp.o
> > [203/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/media_object.cpp.o
> > [204/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/media_pipeline.cpp.o
> > [205/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pub_key.cpp.o
> > [206/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_handler.cpp.o
> > [207/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/process.cpp.o
> > [208/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/shared_mem_object.cpp.o
> > [209/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/source_paths.cpp.o
> > [210/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/sysfs.cpp.o
> > [211/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/v4l2_pixelformat.cpp.o
> > [212/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/v4l2_device.cpp.o
> > [213/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/vector.cpp.o
> > [214/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/v4l2_subdevice.cpp.o
> > [215/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/v4l2_videodevice.cpp.o
> > [216/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/yaml_parser.cpp.o
> > [217/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/converter_converter_v4l2_m2m.cpp.o
> > [218/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_ipu3_frames.cpp.o
> > [219/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_ipu3_cio2.cpp.o
> > [220/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_ipu3_imgu.cpp.o
> > [221/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/sensor_camera_sensor.cpp.o
> > [222/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/sensor_camera_sensor_legacy.cpp.o
> > [223/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/sensor_camera_sensor_properties.cpp.o
> > [224/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/sensor_camera_sensor_raw.cpp.o
> > [225/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/software_isp_debayer.cpp.o
> > [226/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_uvcvideo_uvcvideo.cpp.o
> > [227/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_ipu3_ipu3.cpp.o
> > [228/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/software_isp_debayer_cpu.cpp.o
> > [229/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/software_isp_software_isp.cpp.o
> > [230/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/software_isp_swstats_cpu.cpp.o
> > [231/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_simple_simple.cpp.o
> > [232/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/tracepoints.cpp.o
> > [233/346] Compiling C++ object src/libcamera/proxy/worker/ipu3_ipa_proxy.p/meson-generated_.._ipu3_ipa_proxy_worker.cpp.o
> > [234/346] Compiling C++ object src/libcamera/proxy/worker/soft_ipa_proxy.p/meson-generated_.._soft_ipa_proxy_worker.cpp.o
> > [235/346] Compiling C object src/android/libcamera_metadata.a.p/metadata_camera_metadata.c.o
> > [236/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/device_enumerator_udev.cpp.o
> > [237/346] Compiling C++ object src/android/libcamera-hal.so.p/camera3_hal.cpp.o
> > [238/346] Compiling C++ object src/android/libcamera-hal.so.p/camera_hal_config.cpp.o
> > [239/346] Compiling C++ object src/android/libcamera-hal.so.p/camera_hal_manager.cpp.o
> > [240/346] Compiling C++ object src/android/libcamera-hal.so.p/camera_metadata.cpp.o
> > [241/346] Linking static target src/android/libcamera_metadata.a
> > [242/346] Compiling C++ object src/android/libcamera-hal.so.p/camera_capabilities.cpp.o
> > [243/346] Compiling C++ object src/android/libcamera-hal.so.p/camera_device.cpp.o
> > [244/346] Compiling C++ object src/android/libcamera-hal.so.p/hal_framebuffer.cpp.o
> > [245/346] Compiling C++ object src/android/libcamera-hal.so.p/camera_ops.cpp.o
> > [246/346] Compiling C++ object src/android/libcamera-hal.so.p/camera_request.cpp.o
> > [247/346] Compiling C++ object src/android/libcamera-hal.so.p/camera_stream.cpp.o
> > [248/346] Compiling C++ object src/android/libcamera-hal.so.p/yuv_post_processor_yuv.cpp.o
> > [249/346] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_encoder_libjpeg.cpp.o
> > [250/346] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_exif.cpp.o
> > [251/346] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_thumbnailer.cpp.o
> > [252/346] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_post_processor_jpeg.cpp.o
> > [253/346] Compiling C object src/android/libcamera-hal.so.p/mm_libhardware_stub.c.o
> > [254/346] Compiling C++ object src/android/libcamera-hal.so.p/mm_generic_camera_buffer.cpp.o
> > [255/346] Compiling C++ object src/android/libcamera-hal.so.p/mm_generic_frame_buffer_allocator.cpp.o
> > [256/346] Compiling C++ object src/ipa/libipa/libipa.a.p/algorithm.cpp.o
> > [257/346] Compiling C++ object src/ipa/libipa/libipa.a.p/agc_mean_luminance.cpp.o
> > [258/346] Compiling C++ object src/ipa/libipa/libipa.a.p/awb_bayes.cpp.o
> > [259/346] Compiling C++ object src/ipa/libipa/libipa.a.p/awb_grey.cpp.o
> > [260/346] Compiling C++ object src/ipa/libipa/libipa.a.p/awb.cpp.o
> > [261/346] Compiling C++ object src/ipa/libipa/libipa.a.p/colours.cpp.o
> > [262/346] Compiling C++ object src/ipa/libipa/libipa.a.p/fixedpoint.cpp.o
> > [263/346] Compiling C++ object src/ipa/libipa/libipa.a.p/camera_sensor_helper.cpp.o
> > [264/346] Compiling C++ object src/ipa/libipa/libipa.a.p/exposure_mode_helper.cpp.o
> > [265/346] Compiling C++ object src/ipa/libipa/libipa.a.p/fc_queue.cpp.o
> > [266/346] Compiling C++ object src/ipa/libipa/libipa.a.p/histogram.cpp.o
> > [267/346] Compiling C++ object src/ipa/libipa/libipa.a.p/lsc_polynomial.cpp.o
> > [268/346] Compiling C++ object src/ipa/libipa/libipa.a.p/lux.cpp.o
> > [269/346] Compiling C++ object src/ipa/libipa/libipa.a.p/interpolator.cpp.o
> > [270/346] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/ipa_context.cpp.o
> > [271/346] Compiling C++ object src/ipa/libipa/libipa.a.p/module.cpp.o
> > [272/346] Compiling C++ object src/ipa/libipa/libipa.a.p/pwl.cpp.o
> > [273/346] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_af.cpp.o
> > [274/346] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_awb.cpp.o
> > [275/346] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/ipu3.cpp.o
> > [276/346] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_blc.cpp.o
> > [277/346] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_tone_mapping.cpp.o
> > [278/346] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_agc.cpp.o
> > [279/346] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/ipa_context.cpp.o
> > [280/346] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/algorithms_agc.cpp.o
> > [281/346] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/algorithms_blc.cpp.o
> > [282/346] Compiling C++ object src/apps/common/libapps.a.p/image.cpp.o
> > [283/346] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/algorithms_awb.cpp.o
> > [284/346] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/algorithms_lut.cpp.o
> > [285/346] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/soft_simple.cpp.o
> > [286/346] Compiling C++ object src/apps/common/libapps.a.p/ppm_writer.cpp.o
> > [287/346] Compiling C++ object src/apps/common/libapps.a.p/options.cpp.o
> > [288/346] Compiling C++ object src/apps/common/libapps.a.p/stream_options.cpp.o
> > [289/346] Linking static target src/ipa/libipa/libipa.a
> > [290/346] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/algorithms_ccm.cpp.o
> > [291/346] Compiling C++ object src/apps/common/libapps.a.p/event_loop.cpp.o
> > [292/346] Compiling C++ object src/apps/common/libapps.a.p/dng_writer.cpp.o
> > [293/346] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/environment.cpp.o
> > [294/346] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/helpers_capture.cpp.o
> > [295/346] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/main.cpp.o
> > [296/346] Linking static target src/apps/common/libapps.a
> > [297/346] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/test_base.cpp.o
> > [298/346] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/tests_capture_test.cpp.o
> > [299/346] Compiling C++ object src/apps/cam/cam.p/capture_script.cpp.o
> > [300/346] Compiling C++ object src/apps/cam/cam.p/camera_session.cpp.o
> > [301/346] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/.._.._.._subprojects_googletest-release-1.11.0_googletest_src_gtest-all.cc.o
> > [302/346] Compiling C++ object src/apps/cam/cam.p/file_sink.cpp.o
> > [303/346] Compiling C++ object src/apps/cam/cam.p/frame_sink.cpp.o
> > [304/346] Compiling C++ object src/apps/cam/cam.p/sdl_texture_1plane.cpp.o
> > [305/346] Compiling C++ object src/apps/cam/cam.p/sdl_texture.cpp.o
> > [306/346] Compiling C++ object src/apps/cam/cam.p/drm.cpp.o
> > [307/346] Compiling C++ object src/apps/cam/cam.p/sdl_texture_yuv.cpp.o
> > [308/346] Compiling C++ object src/apps/cam/cam.p/sdl_sink.cpp.o
> > [309/346] Compiling C++ object src/apps/cam/cam.p/main.cpp.o
> > [310/346] Compiling C++ object src/apps/ipa-verify/ipa_verify.p/main.cpp.o
> > [311/346] Compiling C++ object src/apps/cam/cam.p/kms_sink.cpp.o
> > [312/346] Compiling C++ object src/apps/cam/cam.p/sdl_texture_mjpg.cpp.o
> > [313/346] Generating src/gstreamer/gstlibcamera-controls.cpp with a custom command (wrapped by meson to set env)
> > [314/346] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerapad.cpp.o
> > [315/346] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamera-utils.cpp.o
> > [316/346] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerapool.cpp.o
> > [317/346] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcameraprovider.cpp.o
> > [318/346] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera.cpp.o
> > [319/346] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera_proxy.cpp.o
> > [320/346] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera_file.cpp.o
> > [321/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-generated_.._version.cpp.o
> > [322/346] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_compat_manager.cpp.o
> > [323/346] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_compat.cpp.o
> > [324/346] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcameraallocator.cpp.o
> > [325/346] Generating Documentation/doxyfile-public with a custom command
> > [326/346] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerasrc.cpp.o
> > [327/346] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamera.cpp.o
> > [328/346] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/meson-generated_.._gstlibcamera-controls.cpp.o
> > [329/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-generated_.._ipa_pub_key.cpp.o
> > [330/346] Linking target src/libcamera/libcamera.so.0.5.2
> > [331/346] Generating symbol file src/libcamera/libcamera.so.0.5.2.p/libcamera.so.0.5.2.symbols
> > [332/346] Generating Documentation/doxygen-public with a custom command
> > [333/346] Linking target src/apps/ipa-verify/ipa_verify
> > [334/346] Linking target src/ipa/ipu3/ipa_ipu3.so
> > [335/346] Linking target src/ipa/simple/ipa_soft_simple.so
> > [336/346] Linking target src/libcamera/proxy/worker/ipu3_ipa_proxy
> > [337/346] Linking target src/libcamera/proxy/worker/soft_ipa_proxy
> > [338/346] Generating src/ipa/ipu3/ipa_ipu3.so.sign with a custom command
> > [339/346] Generating src/ipa/simple/ipa_soft_simple.so.sign with a custom command
> > [340/346] Linking target src/v4l2/v4l2-compat.so
> > [341/346] Linking target src/apps/lc-compliance/lc-compliance
> > [342/346] Linking target src/android/libcamera-hal.so
> > [343/346] Linking target src/gstreamer/libgstlibcamera.so
> > [344/346] Linking target src/apps/cam/cam
> > [345/346] Generating Documentation/doxygen-internal with a custom command
> > warning: source '<https://builder.linuxtv.org/job/libcamera/ws/build/src/libcamera/libcamera.so'> is not a readable file or directory... skipping.
> > warning: source '<https://builder.linuxtv.org/job/libcamera/ws/build/src/libcamera/libcamera.so.0.5'> is not a readable file or directory... skipping.
> > [346/346] Generating Documentation/documentation with a custom command
> > FAILED: Documentation/html 
> > /var/lib/jenkins/.local/bin/sphinx-build -D release=v0.5.2+68-d3580209 -q -W -b html -c Documentation <https://builder.linuxtv.org/job/libcamera/ws/Documentation> Documentation/html
> > 
> > Theme error!
> > 
> > Versions
> > ========
> > 
> > * Platform:         linux; (Linux-6.1.0-17-amd64-x86_64-with-glibc2.36)
> > * Python version:   3.11.2 (CPython)
> > * Sphinx version:   8.2.3
> > * Docutils version: 0.21.2
> > * Jinja2 version:   3.1.2
> > * Pygments version: 2.19.2
> > 
> > Last Messages
> > =============
> > 
> > None.
> > 
> > Loaded Extensions
> > =================
> > 
> > None.
> > 
> > Traceback
> > =========
> > 
> >       File "/var/lib/jenkins/.local/lib/python3.11/site-packages/sphinx/theming.py", line 228, in create
> >         raise ThemeError(__('no theme named %r found (missing theme.toml?)') % name)
> >     sphinx.errors.ThemeError: no theme named 'sphinx_book_theme' found (missing theme.toml?)  
> 
> libcamera now requires the python3-sphinx-book-theme package to build
> the documentation.

Build should now be OK.

Regards,
Mauro

