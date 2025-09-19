Return-Path: <linux-media+bounces-42769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E22DB88D4B
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 12:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F6BE5686C3
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 10:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E68307AE0;
	Fri, 19 Sep 2025 10:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="WiuGTIdM"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841172FA0F3
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 10:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758277250; cv=none; b=lyl7iRs/9TxWYP+A4Oh+MZks4m1fTVNq7OKh2oYbRPfebhvI4s60CEmGluoRRRXJMsiFy4Im/vAZI9lobm87s5/0oltdIFG6j0mmmIHb3c2Ia/Y/viWv60FmzCr0h20Fw5CpJCKm9ARsKfYtNKGRazQ9AOjXdnt/wAMOS7Zxsmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758277250; c=relaxed/simple;
	bh=dyJP1Lm7pPGEFX7HCY6McDOvKEJyIsJ0D/pe6VxUE30=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=c4pVwfwljefsrCvkGBoc7ApS1S9AQEvbVD9d+QA0pRtqi93beyaXLRkGHIFmtXFZGTKYn/QOa1muNQ+yuVQ3eeN62rU0DIepHtpZRDCSvzdw+CNQ8bz+AlfxcbgKu0AbQIsBz0zNz3voLslhMbprHyDToG37s/0qG/9srfcItR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=WiuGTIdM; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=12BDPj2iqoErfDVkzje5+WDALyHwspKv5miFzPKqxTM=; b=WiuGTIdMeoD47HHON2rCSFEpOX
	ohOsMQR9sIkmcIi2bkX1ihUIrGRo2CPyb6Nb8WiwSBuJuEOxXafTvrQo/xqCAlHfsVfPiy0JZ3t+L
	SgXURGElGvoY7NGCaCpkG1bc9H1Xqr2cncCQCawcW13F2R/LxA8GpWVC6kqkEdoSFt+nRNGWcky44
	ijfPw4Z0YdHzDJJJgh3tzOIJm1ALrIhQ5C3Y/6X4qvIO5w2zZda1A0Eg8gUE3IYuIqXXskwIlYU/C
	65+6RUq2K8FLolZU7XlL125DZUwNK+z4O5azM899KzKryxp8ElMhfLmoDiWgI6L26R1hYzaus/KnX
	efh8+THg==;
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1uzYES-0006A5-0I;
	Fri, 19 Sep 2025 10:20:48 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1uzYER-00Cq35-3D;
	Fri, 19 Sep 2025 10:20:48 +0000
Date: Fri, 19 Sep 2025 10:20:47 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
	libcamera-devel@lists.libcamera.org
Message-ID: <779655236.1.1758277247992@builder.linuxtv.org>
In-Reply-To: <872623170.1.1758224010275@builder.linuxtv.org>
References: <872623170.1.1758224010275@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #1487
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

See <https://builder.linuxtv.org/job/libcamera/1487/display/redirect?page=changes>

Changes:

[kieran.bingham] ipa: rkisp1: Add basic compression algorithm

[kieran.bingham] tuning: rksip1: Add a static Compress entry

[kieran.bingham] libipa: camera_sensor_helper: Add quantizeGain() function

[kieran.bingham] libipa: exposure_mode_helper: Take exposure/gain quantization into account

[kieran.bingham] libipa: exposure_mode_helper: Remove double calculation of lastStageGain

[kieran.bingham] libipa: exposure_mode_helper: Remove unnecessary clamp calls

[kieran.bingham] libipa: agc_mean_luminance: Fix constraint logging

[kieran.bingham] libipa: agc_mean_luminance: Configure the exposure mode helpers

[kieran.bingham] libipa: exposure_mode_helper: Calculate quantization gain in splitExposure()

[kieran.bingham] ipa: rkisp1: agc: Add correction for exposure quantization

[kieran.bingham] pipeline: rkisp1: Add error log when parameter queuing fails

[kieran.bingham] include: linux: Partially update linux headers from v6.16-rc1-310-gd968e50b5c26

[kieran.bingham] ipa: rkisp1: Switch histogram to RGB combined mode

[kieran.bingham] pipeline: rkisp1: Query kernel for available params blocks

[kieran.bingham] libipa: agc_mean_luminance: Introduce effectiveYTarget() accessor

[kieran.bingham] libipa: agc_mean_luminance: Add support for additional constraints

[kieran.bingham] rkisp1: agc: Agc add yTarget to frame context

[kieran.bingham] ipa: rkisp1: Add WDR algorithm

[kieran.bingham] tuning: rksip1: Add a static WideDynamicRange entry


------------------------------------------
[...truncated 24.01 KiB...]
[139/346] Compiling C++ object src/libcamera/base/libcamera-base.so.0.5.2.p/unique_fd.cpp.o
[140/346] Compiling C++ object src/libcamera/base/libcamera-base.so.0.5.2.p/backtrace.cpp.o
[141/346] Compiling C++ object src/libcamera/base/libcamera-base.so.0.5.2.p/utils.cpp.o
[142/346] Generating src/libcamera/ipa/mali-c55_ipa_interface.cpp with a custom command
[143/346] Generating src/libcamera/ipa/rkisp1_ipa_interface.cpp with a custom command
[144/346] Compiling C++ object src/libcamera/base/libcamera-base.so.0.5.2.p/semaphore.cpp.o
[145/346] Generating src/libcamera/ipa/raspberrypi_ipa_interface.cpp with a custom command
[146/346] Generating src/libcamera/ipa/core_ipa_interface.cpp with a custom command
[147/346] Generating src/libcamera/ipa/soft_ipa_interface.cpp with a custom command
[148/346] Generating src/libcamera/ipa/vimc_ipa_interface.cpp with a custom command
[149/346] Compiling C++ object src/libcamera/base/libcamera-base.so.0.5.2.p/mutex.cpp.o
[150/346] Generating src/libcamera/ipa_pub_key_cpp with a custom command
writing RSA key
[151/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/camera_manager.cpp.o
[152/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/controls.cpp.o
[153/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/fence.cpp.o
[154/346] Generating src/libcamera/proxy/soft_proxy_cpp with a custom command (wrapped by meson to set env)
[155/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/framebuffer.cpp.o
[156/346] Generating src/libcamera/proxy/ipu3_proxy_cpp with a custom command (wrapped by meson to set env)
[157/346] Generating src/libcamera/properties_ids_cpp with a custom command (wrapped by meson to set env)
[158/346] Generating src/libcamera/controls_ids_cpp with a custom command (wrapped by meson to set env)
[159/346] Linking target src/libcamera/base/libcamera-base.so.0.5.2
[160/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/framebuffer_allocator.cpp.o
[161/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-generated_.._property_ids.cpp.o
[162/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/geometry.cpp.o
[163/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/orientation.cpp.o
[164/346] Generating src/libcamera/version.cpp with a custom command
[165/346] Generating symbol file src/libcamera/base/libcamera-base.so.0.5.2.p/libcamera-base.so.0.5.2.symbols
[166/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-generated_.._version.cpp.o
[167/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pixel_format.cpp.o
[168/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-generated_.._control_ids.cpp.o
[169/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-generated_.._ipa_pub_key.cpp.o
[170/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/color_space.cpp.o
[171/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/request.cpp.o
[172/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/camera.cpp.o
[173/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-generated_.._proxy_soft_ipa_proxy.cpp.o
[174/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/control_validator.cpp.o
[175/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/clock_recovery.cpp.o
[176/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/transform.cpp.o
[177/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/byte_stream_buffer.cpp.o
[178/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/camera_controls.cpp.o
[179/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/stream.cpp.o
[180/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/converter.cpp.o
[181/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-generated_.._proxy_ipu3_ipa_proxy.cpp.o
[182/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/device_enumerator.cpp.o
[183/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_controls.cpp.o
[184/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/device_enumerator_sysfs.cpp.o
[185/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/dma_buf_allocator.cpp.o
[186/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_interface.cpp.o
[187/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_manager.cpp.o
[188/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_proxy.cpp.o
[189/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_module.cpp.o
[190/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipc_pipe.cpp.o
[191/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipc_pipe_unixsocket.cpp.o
[192/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/mapped_framebuffer.cpp.o
[193/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipc_unixsocket.cpp.o
[194/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/matrix.cpp.o
[195/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/media_device.cpp.o
[196/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/media_object.cpp.o
[197/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_handler.cpp.o
[198/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/process.cpp.o
[199/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pub_key.cpp.o
[200/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/source_paths.cpp.o
[201/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/shared_mem_object.cpp.o
[202/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/sysfs.cpp.o
[203/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/debug_controls.cpp.o
[204/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/formats.cpp.o
[205/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/delayed_controls.cpp.o
[206/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/v4l2_pixelformat.cpp.o
[207/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/camera_lens.cpp.o
[208/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/vector.cpp.o
[209/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/yaml_parser.cpp.o
[210/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_ipu3_frames.cpp.o
[211/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/bayer_format.cpp.o
[212/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/control_serializer.cpp.o
[213/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_data_serializer.cpp.o
[214/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/media_pipeline.cpp.o
[215/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_ipu3_imgu.cpp.o
[216/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/v4l2_device.cpp.o
[217/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/converter_converter_v4l2_m2m.cpp.o
[218/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_ipu3_cio2.cpp.o
[219/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/software_isp_debayer.cpp.o
[220/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/sensor_camera_sensor.cpp.o
[221/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/v4l2_videodevice.cpp.o
[222/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/sensor_camera_sensor_properties.cpp.o
[223/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/tracepoints.cpp.o
[224/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/device_enumerator_udev.cpp.o
[225/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_uvcvideo_uvcvideo.cpp.o
[226/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/v4l2_subdevice.cpp.o
[227/346] Compiling C object src/android/libcamera_metadata.a.p/metadata_camera_metadata.c.o
[228/346] Linking static target src/android/libcamera_metadata.a
[229/346] Generating src/libcamera/proxy/worker/ipu3_proxy_worker with a custom command (wrapped by meson to set env)
[230/346] Generating src/libcamera/proxy/worker/soft_proxy_worker with a custom command (wrapped by meson to set env)
[231/346] Compiling C++ object src/android/libcamera-hal.so.p/camera3_hal.cpp.o
[232/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/software_isp_swstats_cpu.cpp.o
[233/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/software_isp_debayer_cpu.cpp.o
[234/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_ipu3_ipu3.cpp.o
[235/346] Compiling C++ object src/android/libcamera-hal.so.p/camera_hal_manager.cpp.o
[236/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/sensor_camera_sensor_raw.cpp.o
[237/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/sensor_camera_sensor_legacy.cpp.o
[238/346] Compiling C++ object src/android/libcamera-hal.so.p/camera_hal_config.cpp.o
[239/346] Compiling C++ object src/android/libcamera-hal.so.p/camera_ops.cpp.o
[240/346] Compiling C++ object src/android/libcamera-hal.so.p/hal_framebuffer.cpp.o
[241/346] Compiling C++ object src/android/libcamera-hal.so.p/camera_request.cpp.o
[242/346] Compiling C++ object src/android/libcamera-hal.so.p/camera_metadata.cpp.o
[243/346] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_exif.cpp.o
[244/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/software_isp_software_isp.cpp.o
[245/346] Compiling C++ object src/libcamera/proxy/worker/soft_ipa_proxy.p/meson-generated_.._soft_ipa_proxy_worker.cpp.o
[246/346] Compiling C++ object src/libcamera/proxy/worker/ipu3_ipa_proxy.p/meson-generated_.._ipu3_ipa_proxy_worker.cpp.o
[247/346] Compiling C++ object src/android/libcamera-hal.so.p/camera_capabilities.cpp.o
[248/346] Compiling C object src/android/libcamera-hal.so.p/mm_libhardware_stub.c.o
[249/346] Compiling C++ object src/android/libcamera-hal.so.p/yuv_post_processor_yuv.cpp.o
[250/346] Compiling C++ object src/ipa/libipa/libipa.a.p/algorithm.cpp.o
[251/346] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_simple_simple.cpp.o
[252/346] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_encoder_libjpeg.cpp.o
[253/346] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_post_processor_jpeg.cpp.o
[254/346] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_thumbnailer.cpp.o
[255/346] Compiling C++ object src/android/libcamera-hal.so.p/camera_stream.cpp.o
[256/346] Compiling C++ object src/ipa/libipa/libipa.a.p/colours.cpp.o
[257/346] Compiling C++ object src/android/libcamera-hal.so.p/mm_generic_camera_buffer.cpp.o
[258/346] Compiling C++ object src/ipa/libipa/libipa.a.p/fc_queue.cpp.o
[259/346] Compiling C++ object src/ipa/libipa/libipa.a.p/fixedpoint.cpp.o
[260/346] Compiling C++ object src/ipa/libipa/libipa.a.p/histogram.cpp.o
[261/346] Compiling C++ object src/ipa/libipa/libipa.a.p/interpolator.cpp.o
[262/346] Compiling C++ object src/ipa/libipa/libipa.a.p/lsc_polynomial.cpp.o
[263/346] Compiling C++ object src/ipa/libipa/libipa.a.p/lux.cpp.o
[264/346] Compiling C++ object src/ipa/libipa/libipa.a.p/module.cpp.o
[265/346] Compiling C++ object src/ipa/libipa/libipa.a.p/pwl.cpp.o
[266/346] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/ipa_context.cpp.o
[267/346] Compiling C++ object src/android/libcamera-hal.so.p/mm_generic_frame_buffer_allocator.cpp.o
[268/346] Linking target src/libcamera/libcamera.so.0.5.2
[269/346] Compiling C++ object src/ipa/libipa/libipa.a.p/awb.cpp.o
[270/346] Compiling C++ object src/ipa/libipa/libipa.a.p/awb_grey.cpp.o
[271/346] Compiling C++ object src/ipa/libipa/libipa.a.p/exposure_mode_helper.cpp.o
[272/346] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_blc.cpp.o
[273/346] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_tone_mapping.cpp.o
[274/346] Compiling C++ object src/android/libcamera-hal.so.p/camera_device.cpp.o
[275/346] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/ipa_context.cpp.o
[276/346] Compiling C++ object src/ipa/libipa/libipa.a.p/awb_bayes.cpp.o
[277/346] Compiling C++ object src/ipa/libipa/libipa.a.p/agc_mean_luminance.cpp.o
[278/346] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_af.cpp.o
[279/346] Compiling C++ object src/ipa/libipa/libipa.a.p/camera_sensor_helper.cpp.o
[280/346] Generating symbol file src/libcamera/libcamera.so.0.5.2.p/libcamera.so.0.5.2.symbols
[281/346] Linking static target src/ipa/libipa/libipa.a
[282/346] Linking target src/libcamera/proxy/worker/soft_ipa_proxy
[283/346] Linking target src/libcamera/proxy/worker/ipu3_ipa_proxy
[284/346] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/algorithms_blc.cpp.o
[285/346] Compiling C++ object src/apps/common/libapps.a.p/image.cpp.o
[286/346] Compiling C++ object src/apps/common/libapps.a.p/options.cpp.o
[287/346] Compiling C++ object src/apps/common/libapps.a.p/ppm_writer.cpp.o
[288/346] Compiling C++ object src/apps/common/libapps.a.p/stream_options.cpp.o
[289/346] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_awb.cpp.o
[290/346] Compiling C++ object src/apps/common/libapps.a.p/event_loop.cpp.o
[291/346] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/ipu3.cpp.o
[292/346] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/algorithms_awb.cpp.o
[293/346] Linking target src/android/libcamera-hal.so
[294/346] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_agc.cpp.o
[295/346] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/soft_simple.cpp.o
[296/346] Linking target src/ipa/ipu3/ipa_ipu3.so
[297/346] Generating src/ipa/ipu3/ipa_ipu3.so.sign with a custom command
[298/346] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/algorithms_agc.cpp.o
[299/346] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/.._.._.._subprojects_googletest-release-1.11.0_googletest_src_gtest-all.cc.o
[300/346] Compiling C++ object src/apps/cam/cam.p/capture_script.cpp.o
[301/346] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/environment.cpp.o
[302/346] Compiling C++ object src/apps/cam/cam.p/file_sink.cpp.o
[303/346] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/algorithms_ccm.cpp.o
[304/346] Compiling C++ object src/apps/cam/cam.p/frame_sink.cpp.o
[305/346] Compiling C++ object src/apps/cam/cam.p/kms_sink.cpp.o
[306/346] Compiling C++ object src/apps/cam/cam.p/sdl_sink.cpp.o
[307/346] Compiling C++ object src/apps/cam/cam.p/sdl_texture.cpp.o
[308/346] Compiling C++ object src/apps/cam/cam.p/drm.cpp.o
[309/346] Compiling C++ object src/apps/cam/cam.p/sdl_texture_1plane.cpp.o
[310/346] Compiling C++ object src/apps/cam/cam.p/sdl_texture_yuv.cpp.o
[311/346] Compiling C++ object src/apps/cam/cam.p/sdl_texture_mjpg.cpp.o
[312/346] Compiling C++ object src/apps/ipa-verify/ipa_verify.p/main.cpp.o
[313/346] Generating src/gstreamer/gstlibcamera-controls.cpp with a custom command (wrapped by meson to set env)
[314/346] Linking target src/apps/ipa-verify/ipa_verify
[315/346] Compiling C++ object src/apps/common/libapps.a.p/dng_writer.cpp.o
[316/346] Linking static target src/apps/common/libapps.a
[317/346] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/algorithms_lut.cpp.o
[318/346] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/main.cpp.o
[319/346] Linking target src/ipa/simple/ipa_soft_simple.so
[320/346] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/test_base.cpp.o
[321/346] Generating src/ipa/simple/ipa_soft_simple.so.sign with a custom command
[322/346] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamera.cpp.o
[323/346] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcameraallocator.cpp.o
[324/346] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/helpers_capture.cpp.o
[325/346] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerapool.cpp.o
[326/346] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerapad.cpp.o
[327/346] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcameraprovider.cpp.o
[328/346] Compiling C++ object src/apps/cam/cam.p/main.cpp.o
[329/346] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamera-utils.cpp.o
[330/346] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera_file.cpp.o
[331/346] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/tests_capture_test.cpp.o
[332/346] Generating Documentation/doxyfile-public with a custom command
[333/346] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera.cpp.o
[334/346] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/meson-generated_.._gstlibcamera-controls.cpp.o
[335/346] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_compat.cpp.o
[336/346] Linking target src/apps/lc-compliance/lc-compliance
[337/346] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera_proxy.cpp.o
[338/346] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcamerasrc.cpp.o
[339/346] Compiling C++ object src/apps/cam/cam.p/camera_session.cpp.o
[340/346] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_compat_manager.cpp.o
[341/346] Linking target src/gstreamer/libgstlibcamera.so
[342/346] Linking target src/v4l2/v4l2-compat.so
[343/346] Linking target src/apps/cam/cam
[344/346] Generating Documentation/doxygen-public with a custom command
[345/346] Generating Documentation/doxygen-internal with a custom command
[346/346] Generating Documentation/documentation with a custom command
FAILED: Documentation/html 
/var/lib/jenkins/.local/bin/sphinx-build -D release=v0.5.2+87-2f7c4744 -q -W -b html -c Documentation <https://builder.linuxtv.org/job/libcamera/ws/Documentation> Documentation/html

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
/tmp/sphinx-err-424dckpq.log

To report this error to the developers, please open an issue at <https://github.com/sphinx-doc/sphinx/issues/>. Thanks!
Please also report this if it was a user error, so that a better error message can be provided next time.
ninja: build stopped: subcommand failed.
Build step 'Execute shell' marked build as failure

