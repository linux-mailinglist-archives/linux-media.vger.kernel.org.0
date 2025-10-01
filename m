Return-Path: <linux-media+bounces-43500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D2922BB13C3
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 18:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9009D4E18D3
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 16:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02DD27FD76;
	Wed,  1 Oct 2025 16:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="tjLFzKla"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59B727056D
	for <linux-media@vger.kernel.org>; Wed,  1 Oct 2025 16:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759335554; cv=none; b=SyYNCXy6bj1UiAXEPw8U2CKskEPzKp6U4mGGjr6upqVDY35h1mwUByRnes6ouQPRfglGqebejVYjsDJEFkQZZJ10LYLNOXgfsMBo4DZvdOQzTfX58bhYyjJoNnbbSr/png71IniFX70vz+TJRuhVsVUXw6dRUNWfGMqtzXCIcGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759335554; c=relaxed/simple;
	bh=5wAj7QbNBLy7Jqp7ZAKMIj7C0wJ8oElJXTcA1fXrP4I=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=K31BISx3jheoM/eWWgZqiKxuNJmATO9GkC/Cmmxep8PBInv63auRA+hzet7L4rLVLX2GAuIRrBcwHZbl70bnq7XuCW88F+D6Ci9zATgHBEL1L7SQqhBSB8HbC6Avl12mYgkR0dEU1qkSpZCuOb9P0vePBFFSHHcOui2Pd/pROQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=tjLFzKla; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=KVW/pqj+v/1ivz2nKA4dv5wckbkrryKBiMpw94QcP14=; b=tjLFzKlaXF4ceY6gsy67iYEaRJ
	KZc5J7frsYZAIVmFWAl2AjQkaQK2ElVmh5YLImRxrolWTwwA8rFdS7Gd5BhyMhEmhoYKyTi147/9M
	IDTRnAe3AziAeT45FLRNsodOFMirDZwKCbF++YYrXAYtUN/f2C/FQlzVEe9nC9bZmb/LpqPWoja/v
	4Y6Z8eryDk/Sadrer8JDQgFzf0fRwHgk740hLjmXby+gaOzlmjs/wsE781TdVnWoMOHTYOOET0HyD
	spxybeGSgjD9zzaYq5tzBrd3W6M8hRA4W/sjkpc20j9CVxnWtGnbG45OX5Ny6mCOOG1ZG/0oVVebl
	oDpE1Vkg==;
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1v3zXq-0002nH-2J;
	Wed, 01 Oct 2025 16:19:11 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1v3zXq-00Ehi6-1v;
	Wed, 01 Oct 2025 16:19:10 +0000
Date: Wed, 1 Oct 2025 16:19:10 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
	libcamera-devel@lists.libcamera.org
Message-ID: <253941160.1.1759335550594@builder.linuxtv.org>
In-Reply-To: <1858163136.2.1759157364224@builder.linuxtv.org>
References: <1858163136.2.1759157364224@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #1493
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: libcamera
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated

See <https://builder.linuxtv.org/job/libcamera/1493/display/redirect?page=changes>

Changes:

[kieran.bingham] ipa: software_isp: Fix context_.configuration.agc.againMin init

[kieran.bingham] ipa: software_isp: AGC: Do not lower gain below 1.0

[kieran.bingham] ipa: software_isp: AGC: Raise exposure or gain not both at the same time

[kieran.bingham] ipa: software_isp: AGC: Only use integers for exposure calculations

[kieran.bingham] libcamera: software_isp: Add valid flag to struct SwIspStats

[kieran.bingham] libcamera: software_isp: Run sw-statistics once every 4th frame

[kieran.bingham] ipa: simple: blc: Use 16 as starting blacklevel when there is no sensor-info


------------------------------------------
[...truncated 23.75 KiB...]
[140/347] Generating src/libcamera/ipa/mali-c55_ipa_interface.cpp with a custom command
[141/347] Generating src/libcamera/ipa/soft_ipa_interface.cpp with a custom command
[142/347] Generating src/libcamera/ipa/rkisp1_ipa_interface.cpp with a custom command
[143/347] Generating src/libcamera/ipa/vimc_ipa_interface.cpp with a custom command
[144/347] Generating src/libcamera/ipa/raspberrypi_ipa_interface.cpp with a custom command
[145/347] Generating include/libcamera/ipa/soft_ipa_serializer_h with a custom command (wrapped by meson to set env)
[146/347] Generating include/libcamera/ipa/soft_ipa_interface_h with a custom command (wrapped by meson to set env)
[147/347] Generating src/libcamera/ipa/core_ipa_interface.cpp with a custom command
[148/347] Generating include/libcamera/ipa/soft_proxy_h with a custom command (wrapped by meson to set env)
[149/347] Generating include/libcamera/ipa/ipu3_ipa_serializer_h with a custom command (wrapped by meson to set env)
[150/347] Generating src/libcamera/ipa_pub_key_cpp with a custom command
writing RSA key
[151/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/camera.cpp.o
[152/347] Generating src/libcamera/proxy/ipu3_proxy_cpp with a custom command (wrapped by meson to set env)
[153/347] Generating src/libcamera/proxy/soft_proxy_cpp with a custom command (wrapped by meson to set env)
[154/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/camera_manager.cpp.o
[155/347] Generating src/libcamera/proxy/worker/ipu3_proxy_worker with a custom command (wrapped by meson to set env)
[156/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-generated_.._proxy_ipu3_ipa_proxy.cpp.o
[157/347] Generating src/libcamera/version.cpp with a custom command
[158/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/controls.cpp.o
[159/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/fence.cpp.o
[160/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-generated_.._proxy_soft_ipa_proxy.cpp.o
[161/347] Linking target src/libcamera/base/libcamera-base.so.0.5.2
[162/347] Generating src/libcamera/controls_ids_cpp with a custom command (wrapped by meson to set env)
[163/347] Generating src/libcamera/proxy/worker/soft_proxy_worker with a custom command (wrapped by meson to set env)
[164/347] Generating src/libcamera/properties_ids_cpp with a custom command (wrapped by meson to set env)
[165/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/geometry.cpp.o
[166/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/orientation.cpp.o
[167/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-generated_.._control_ids.cpp.o
[168/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-generated_.._property_ids.cpp.o
[169/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/color_space.cpp.o
[170/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/framebuffer.cpp.o
[171/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pixel_format.cpp.o
[172/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/framebuffer_allocator.cpp.o
[173/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/transform.cpp.o
[174/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/byte_stream_buffer.cpp.o
[175/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/stream.cpp.o
[176/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/request.cpp.o
[177/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/camera_controls.cpp.o
[178/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/control_serializer.cpp.o
[179/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/debug_controls.cpp.o
[180/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/converter.cpp.o
[181/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/control_validator.cpp.o
[182/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/camera_lens.cpp.o
[183/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/device_enumerator.cpp.o
[184/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/delayed_controls.cpp.o
[185/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/device_enumerator_sysfs.cpp.o
[186/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_controls.cpp.o
[187/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/global_configuration.cpp.o
[188/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/formats.cpp.o
[189/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_data_serializer.cpp.o
[190/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/dma_buf_allocator.cpp.o
[191/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/clock_recovery.cpp.o
[192/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_proxy.cpp.o
[193/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/bayer_format.cpp.o
[194/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_manager.cpp.o
[195/347] Generating symbol file src/libcamera/base/libcamera-base.so.0.5.2.p/libcamera-base.so.0.5.2.symbols
[196/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_module.cpp.o
[197/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/matrix.cpp.o
[198/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_interface.cpp.o
[199/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/media_device.cpp.o
[200/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipc_pipe_unixsocket.cpp.o
[201/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/mapped_framebuffer.cpp.o
[202/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/media_object.cpp.o
[203/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/shared_mem_object.cpp.o
[204/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipc_unixsocket.cpp.o
[205/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_handler.cpp.o
[206/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/v4l2_pixelformat.cpp.o
[207/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/process.cpp.o
[208/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipc_pipe.cpp.o
[209/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/v4l2_videodevice.cpp.o
[210/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/vector.cpp.o
[211/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/yaml_parser.cpp.o
[212/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/converter_converter_v4l2_m2m.cpp.o
[213/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/v4l2_subdevice.cpp.o
[214/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_ipu3_frames.cpp.o
[215/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_ipu3_cio2.cpp.o
[216/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/media_pipeline.cpp.o
[217/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_uvcvideo_uvcvideo.cpp.o
[218/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_simple_simple.cpp.o
[219/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/sensor_camera_sensor.cpp.o
[220/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/sensor_camera_sensor_properties.cpp.o
[221/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-generated_.._version.cpp.o
[222/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pub_key.cpp.o
[223/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/software_isp_debayer.cpp.o
[224/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/source_paths.cpp.o
[225/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/sysfs.cpp.o
[226/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/v4l2_device.cpp.o
[227/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/device_enumerator_udev.cpp.o
[228/347] Compiling C++ object src/libcamera/proxy/worker/ipu3_ipa_proxy.p/meson-generated_.._ipu3_ipa_proxy_worker.cpp.o
[229/347] Compiling C++ object src/libcamera/proxy/worker/soft_ipa_proxy.p/meson-generated_.._soft_ipa_proxy_worker.cpp.o
[230/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_ipu3_imgu.cpp.o
[231/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_ipu3_ipu3.cpp.o
[232/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/sensor_camera_sensor_raw.cpp.o
[233/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/sensor_camera_sensor_legacy.cpp.o
[234/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/tracepoints.cpp.o
[235/347] Compiling C object src/android/libcamera_metadata.a.p/metadata_camera_metadata.c.o
[236/347] Linking static target src/android/libcamera_metadata.a
[237/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-generated_.._ipa_pub_key.cpp.o
[238/347] Compiling C++ object src/android/libcamera-hal.so.p/camera_hal_config.cpp.o
[239/347] Compiling C++ object src/android/libcamera-hal.so.p/camera_hal_manager.cpp.o
[240/347] Compiling C++ object src/android/libcamera-hal.so.p/camera_metadata.cpp.o
[241/347] Compiling C++ object src/android/libcamera-hal.so.p/camera3_hal.cpp.o
[242/347] Compiling C++ object src/android/libcamera-hal.so.p/camera_device.cpp.o
[243/347] Compiling C++ object src/android/libcamera-hal.so.p/camera_ops.cpp.o
[244/347] Compiling C++ object src/android/libcamera-hal.so.p/camera_capabilities.cpp.o
[245/347] Compiling C++ object src/android/libcamera-hal.so.p/camera_request.cpp.o
[246/347] Compiling C++ object src/android/libcamera-hal.so.p/hal_framebuffer.cpp.o
[247/347] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_thumbnailer.cpp.o
[248/347] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_encoder_libjpeg.cpp.o
[249/347] Compiling C++ object src/android/libcamera-hal.so.p/yuv_post_processor_yuv.cpp.o
[250/347] Compiling C++ object src/ipa/libipa/libipa.a.p/agc_mean_luminance.cpp.o
[251/347] Compiling C++ object src/android/libcamera-hal.so.p/mm_generic_frame_buffer_allocator.cpp.o
[252/347] Compiling C++ object src/ipa/libipa/libipa.a.p/awb_bayes.cpp.o
[253/347] Compiling C++ object src/ipa/libipa/libipa.a.p/awb_grey.cpp.o
[254/347] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_exif.cpp.o
[255/347] Compiling C++ object src/ipa/libipa/libipa.a.p/camera_sensor_helper.cpp.o
[256/347] Compiling C object src/android/libcamera-hal.so.p/mm_libhardware_stub.c.o
[257/347] Compiling C++ object src/android/libcamera-hal.so.p/camera_stream.cpp.o
[258/347] Compiling C++ object src/ipa/libipa/libipa.a.p/algorithm.cpp.o
[259/347] Compiling C++ object src/ipa/libipa/libipa.a.p/colours.cpp.o
[260/347] Compiling C++ object src/ipa/libipa/libipa.a.p/awb.cpp.o
[261/347] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_post_processor_jpeg.cpp.o
[262/347] Compiling C++ object src/android/libcamera-hal.so.p/mm_generic_camera_buffer.cpp.o
[263/347] Compiling C++ object src/ipa/libipa/libipa.a.p/fixedpoint.cpp.o
[264/347] Compiling C++ object src/ipa/libipa/libipa.a.p/fc_queue.cpp.o
[265/347] Compiling C++ object src/ipa/libipa/libipa.a.p/exposure_mode_helper.cpp.o
[266/347] Compiling C++ object src/ipa/libipa/libipa.a.p/interpolator.cpp.o
[267/347] Compiling C++ object src/ipa/libipa/libipa.a.p/lsc_polynomial.cpp.o
[268/347] Compiling C++ object src/ipa/libipa/libipa.a.p/lux.cpp.o
[269/347] Compiling C++ object src/ipa/libipa/libipa.a.p/histogram.cpp.o
[270/347] Compiling C++ object src/ipa/libipa/libipa.a.p/module.cpp.o
[271/347] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/ipa_context.cpp.o
[272/347] Compiling C++ object src/ipa/libipa/libipa.a.p/pwl.cpp.o
[273/347] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_af.cpp.o
[274/347] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/ipu3.cpp.o
[275/347] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_blc.cpp.o
[276/347] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_awb.cpp.o
[277/347] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_agc.cpp.o
[278/347] Linking static target src/ipa/libipa/libipa.a
[279/347] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_tone_mapping.cpp.o
[280/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/software_isp_swstats_cpu.cpp.o
[281/347] Compiling C++ object src/apps/common/libapps.a.p/image.cpp.o
[282/347] Compiling C++ object src/apps/common/libapps.a.p/options.cpp.o
[283/347] Compiling C++ object src/apps/common/libapps.a.p/ppm_writer.cpp.o
[284/347] Compiling C++ object src/apps/common/libapps.a.p/stream_options.cpp.o
[285/347] Compiling C++ object src/apps/common/libapps.a.p/event_loop.cpp.o
[286/347] Compiling C++ object src/apps/common/libapps.a.p/dng_writer.cpp.o
[287/347] Linking static target src/apps/common/libapps.a
[288/347] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/environment.cpp.o
[289/347] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/helpers_capture.cpp.o
[290/347] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/main.cpp.o
[291/347] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/test_base.cpp.o
[292/347] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/tests_capture_test.cpp.o
[293/347] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/.._.._.._subprojects_googletest-release-1.11.0_googletest_src_gtest-all.cc.o
[294/347] Compiling C++ object src/apps/cam/cam.p/camera_session.cpp.o
[295/347] Compiling C++ object src/apps/cam/cam.p/capture_script.cpp.o
[296/347] Compiling C++ object src/apps/cam/cam.p/file_sink.cpp.o
[297/347] Compiling C++ object src/apps/cam/cam.p/frame_sink.cpp.o
[298/347] Compiling C++ object src/apps/cam/cam.p/main.cpp.o
[299/347] Compiling C++ object src/apps/cam/cam.p/drm.cpp.o
[300/347] Compiling C++ object src/apps/cam/cam.p/kms_sink.cpp.o
[301/347] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/ipa_context.cpp.o
[302/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/software_isp_debayer_cpu.cpp.o
[303/347] Compiling C++ object src/apps/cam/cam.p/sdl_sink.cpp.o
[304/347] Compiling C++ object src/apps/cam/cam.p/sdl_texture.cpp.o
[305/347] Compiling C++ object src/apps/cam/cam.p/sdl_texture_1plane.cpp.o
[306/347] Compiling C++ object src/apps/cam/cam.p/sdl_texture_yuv.cpp.o
[307/347] Compiling C++ object src/apps/cam/cam.p/sdl_texture_mjpg.cpp.o
[308/347] Compiling C++ object src/apps/ipa-verify/ipa_verify.p/main.cpp.o
[309/347] Generating src/gstreamer/gstlibcamera-controls.cpp with a custom command (wrapped by meson to set env)
[310/347] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamera-utils.cpp.o
[311/347] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/meson-generated_.._gstlibcamera-controls.cpp.o
[312/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/software_isp_software_isp.cpp.o
[313/347] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/algorithms_awb.cpp.o
[314/347] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamera.cpp.o
[315/347] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/algorithms_blc.cpp.o
[316/347] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/algorithms_lut.cpp.o
[317/347] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera.cpp.o
[318/347] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera_file.cpp.o
[319/347] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/soft_simple.cpp.o
[320/347] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerapad.cpp.o
[321/347] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcameraallocator.cpp.o
[322/347] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/algorithms_agc.cpp.o
[323/347] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_compat.cpp.o
[324/347] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera_proxy.cpp.o
[325/347] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_compat_manager.cpp.o
[326/347] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/algorithms_ccm.cpp.o
[327/347] Generating Documentation/doxyfile-public with a custom command
[328/347] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerapool.cpp.o
[329/347] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcameraprovider.cpp.o
[330/347] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerasrc.cpp.o
[331/347] Linking target src/libcamera/libcamera.so.0.5.2
[332/347] Generating symbol file src/libcamera/libcamera.so.0.5.2.p/libcamera.so.0.5.2.symbols
[333/347] Linking target src/apps/ipa-verify/ipa_verify
[334/347] Linking target src/ipa/simple/ipa_soft_simple.so
[335/347] Linking target src/libcamera/proxy/worker/ipu3_ipa_proxy
[336/347] Linking target src/ipa/ipu3/ipa_ipu3.so
[337/347] Generating src/ipa/simple/ipa_soft_simple.so.sign with a custom command
[338/347] Linking target src/android/libcamera-hal.so
[339/347] Linking target src/apps/lc-compliance/lc-compliance
[340/347] Linking target src/libcamera/proxy/worker/soft_ipa_proxy
[341/347] Generating src/ipa/ipu3/ipa_ipu3.so.sign with a custom command
[342/347] Linking target src/v4l2/v4l2-compat.so
[343/347] Linking target src/apps/cam/cam
[344/347] Linking target src/gstreamer/libgstlibcamera.so
[345/347] Generating Documentation/doxygen-public with a custom command
[346/347] Generating Documentation/doxygen-internal with a custom command
[347/347] Generating Documentation/documentation with a custom command
FAILED: Documentation/html 
/var/lib/jenkins/.local/bin/sphinx-build -D release=v0.5.2+109-07b87b80 -q -W -b html -c Documentation <https://builder.linuxtv.org/job/libcamera/ws/Documentation> Documentation/html

Theme error!

Versions
========

* Platform:         linux; (Linux-6.1.0-17-amd64-x86_64-with-glibc2.36)
* Python version:   3.11.2 (CPython)
* Sphinx version:   8.2.3
* Docutils version: 0.21.2
* Jinja2 version:   3.1.2
* Pygments version: 2.19.2

Last Messages
=============

None.

Loaded Extensions
=================

None.

Traceback
=========

      File "/var/lib/jenkins/.local/lib/python3.11/site-packages/sphinx/theming.py", line 228, in create
        raise ThemeError(__('no theme named %r found (missing theme.toml?)') % name)
    sphinx.errors.ThemeError: no theme named 'sphinx_book_theme' found (missing theme.toml?)


The full traceback has been saved in:
/tmp/sphinx-err-g_upiqpb.log

To report this error to the developers, please open an issue at <https://github.com/sphinx-doc/sphinx/issues/>. Thanks!
Please also report this if it was a user error, so that a better error message can be provided next time.
ninja: build stopped: subcommand failed.
Build step 'Execute shell' marked build as failure

