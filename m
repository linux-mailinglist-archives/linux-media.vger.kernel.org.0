Return-Path: <linux-media+bounces-43656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A46CBB4422
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 17:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26B267A2BA8
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 15:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A201C151991;
	Thu,  2 Oct 2025 15:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="h4/BgZiw"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79CD3C1F
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 15:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759417424; cv=none; b=p6mqnj6AR+a+guzprDPfmkfotmSeLwp4CWXbJvt6R9xUKkwhJxWFsGgQ6qvHpn5VAGfLfonl9kyNv78sm4uVRJ3UYvT6pszntbNCNoTPpWmB+tJN5WSF+IMiKrsYzwZSyzqjbJjwzgAcPu/Q8ZjEQQglme+mtKweTbZ964W5sWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759417424; c=relaxed/simple;
	bh=RvEnltARbaSX3roNwnezX/QY/BDLk0i+gPECWy65izE=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=sMjPwCwzIPkeMJyuXn1sZnaH0wk3Utfsgdx9L6NHS+2nH0z3UXoAAaQ204U5kWF8mQldVDy36ZbEot2FMSs8gBWoXTfTT91tJflfMM1vCkxj77LTzY8Lre52CfugLAs3tfWSpPeCkPVQH+eE/1ZrX6BH4tx8lKF9htaeJWw6Szw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=h4/BgZiw; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=palYXrVlk7ZKXEZJjnoDYj/vN8wLr7U6z2t5Z/cDZjU=; b=h4/BgZiwrRHf3wh7LiQ/++N6B3
	Wf/U9eMXLT9KCVb5dfi3heWMNIlKI3o5Jg1t95K6Xv1t3BUiZUD5pGOg199Levxk3ZgMvmPMPKufb
	pz03SM31XNK2jP9dgkPJ0EW6OfBfiuayyQTND034GE5YO8+WVf33+pMnN9OWp8Q9g+MAH5I55apsI
	W9hwQQ5u65ZmyTXS0OqCM+vNJzRvL4moR8Gse2LPvZXQKfDy0+304PURUI8FGXKeEmHa0jFny8aXb
	AO3TQXefHwL2aqh2MdkO+E8XMx10XWnE87i6IkcWHl6eyTjNewO3VLmghpmvITwUXYR2svORAUxAa
	08hIxsNw==;
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1v4KqL-0002Zs-0v;
	Thu, 02 Oct 2025 15:03:41 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1v4KqL-00EnYg-0Z;
	Thu, 02 Oct 2025 15:03:41 +0000
Date: Thu, 2 Oct 2025 15:03:41 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
	libcamera-devel@lists.libcamera.org
Message-ID: <80706474.1.1759417421172@builder.linuxtv.org>
In-Reply-To: <253941160.1.1759335550594@builder.linuxtv.org>
References: <253941160.1.1759335550594@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #1494
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: libcamera
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated

See <https://builder.linuxtv.org/job/libcamera/1494/display/redirect?page=
=3Dchanges>

Changes:

[barnabas.pocze] apps: cam: Use signalfd


------------------------------------------
[...truncated 23.07 KiB...]
[142/347] Generating src/libcamera/ipa/raspberrypi_ipa_interface.cpp with a=
 custom command
[143/347] Generating src/libcamera/ipa/vimc_ipa_interface.cpp with a custom=
 command
[144/347] Generating src/libcamera/ipa/core_ipa_interface.cpp with a custom=
 command
[145/347] Generating src/libcamera/ipa/rkisp1_ipa_interface.cpp with a cust=
om command
[146/347] Generating src/ipa-priv-key with a custom command
.......+..+...+...+....+.........+......+......+........+....+...+.........=
+........+......+............+...+.+.....+.........+....+++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++*..........+...+.....+...++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*.+......+..+.=
...+...+........+....+.....+..........+........+.+......+...+.....+...+....=
+...+..+.+........+....+........+.........+...+.............+...+..........=
.+.+...+...........+.+........+.+...+.....+......+....+...+........+....+..=
+...+...+....+.........+..+..........+..+.+..+...+.......+...............+.=
.+............+.............+..+......+............+.+..+.......+......+..+=
...+....+......+.....................+.......................+...+...+.+...=
+........+...............+.........+...+.+..+...+....+......+......+.....+.=
..+.+.....+......+.+...+..+....+.....+..........+...+......+...........+.+.=
.+...+.......+...........+....+...+........+.+.........+.....+............+=
...+......+...+......+.......+........+.........+...............+.+..+.....=
..+.....+...+.......+..................+............+..+...+...+....+......=
...+..+...+....+......+........................+...+..............+...+....=
...+.....+...+......+.+...........+...............+............+.+.........=
+..+.............+...+.....+...+.+......+........+..........+......+...+..+=
......+...+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
.+.+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*..+...=
....+..+.+..............+.......+......++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++*.....+.+..............+......+......+....+...=
........+......+...+...............+....+......+..+...+......+...+.........=
.+......+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
[147/347] Generating include/libcamera/ipa/soft_proxy_h with a custom comma=
nd (wrapped by meson to set env)
[148/347] Generating src/libcamera/ipa_pub_key_cpp with a custom command
writing RSA key
[149/347] Linking target src/libcamera/base/libcamera-base.so.0.5.2
[150/347] Generating include/libcamera/ipa/ipu3_ipa_serializer_h with a cus=
tom command (wrapped by meson to set env)
[151/347] Generating include/libcamera/ipa/soft_ipa_serializer_h with a cus=
tom command (wrapped by meson to set env)
[152/347] Compiling C object src/android/libcamera_metadata.a.p/metadata_ca=
mera_metadata.c.o
[153/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/camera.cp=
p.o
[154/347] Generating src/libcamera/properties_ids_cpp with a custom command=
 (wrapped by meson to set env)
[155/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/camera_ma=
nager.cpp.o
[156/347] Generating src/libcamera/proxy/ipu3_proxy_cpp with a custom comma=
nd (wrapped by meson to set env)
[157/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-gen=
erated_.._property_ids.cpp.o
[158/347] Generating src/libcamera/proxy/soft_proxy_cpp with a custom comma=
nd (wrapped by meson to set env)
[159/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/color_spa=
ce.cpp.o
[160/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-gen=
erated_.._proxy_ipu3_ipa_proxy.cpp.o
[161/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/controls.=
cpp.o
[162/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/fence.cpp=
.o
[163/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-gen=
erated_.._proxy_soft_ipa_proxy.cpp.o
[164/347] Generating src/libcamera/proxy/worker/ipu3_proxy_worker with a cu=
stom command (wrapped by meson to set env)
[165/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/framebuff=
er.cpp.o
[166/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/orientati=
on.cpp.o
[167/347] Generating src/libcamera/version.cpp with a custom command
[168/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/framebuff=
er_allocator.cpp.o
[169/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/geometry.=
cpp.o
[170/347] Generating src/libcamera/controls_ids_cpp with a custom command (=
wrapped by meson to set env)
[171/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pixel_for=
mat.cpp.o
[172/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/request.c=
pp.o
[173/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/transform=
.cpp.o
[174/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/stream.cp=
p.o
[175/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/bayer_for=
mat.cpp.o
[176/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-gen=
erated_.._control_ids.cpp.o
[177/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/byte_stre=
am_buffer.cpp.o
[178/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/clock_rec=
overy.cpp.o
[179/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/control_v=
alidator.cpp.o
[180/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/camera_le=
ns.cpp.o
[181/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/camera_co=
ntrols.cpp.o
[182/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/control_s=
erializer.cpp.o
[183/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/converter=
.cpp.o
[184/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/debug_con=
trols.cpp.o
[185/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/delayed_c=
ontrols.cpp.o
[186/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/device_en=
umerator_sysfs.cpp.o
[187/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/device_en=
umerator.cpp.o
[188/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/dma_buf_a=
llocator.cpp.o
[189/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_inter=
face.cpp.o
[190/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/formats.c=
pp.o
[191/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_contr=
ols.cpp.o
[192/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_data_=
serializer.cpp.o
[193/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/global_co=
nfiguration.cpp.o
[194/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipc_pipe.=
cpp.o
[195/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipc_unixs=
ocket.cpp.o
[196/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_proxy=
.cpp.o
[197/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_manag=
er.cpp.o
[198/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipa_modul=
e.cpp.o
[199/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/mapped_fr=
amebuffer.cpp.o
[200/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/ipc_pipe_=
unixsocket.cpp.o
[201/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/matrix.cp=
p.o
[202/347] Generating src/libcamera/proxy/worker/soft_proxy_worker with a cu=
stom command (wrapped by meson to set env)
[203/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/media_dev=
ice.cpp.o
[204/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/media_pip=
eline.cpp.o
[205/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/shared_me=
m_object.cpp.o
[206/347] Generating symbol file src/libcamera/base/libcamera-base.so.0.5.2=
.p/libcamera-base.so.0.5.2.symbols
[207/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pub_key.c=
pp.o
[208/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/source_pa=
ths.cpp.o
[209/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_=
handler.cpp.o
[210/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/sysfs.cpp=
.o
[211/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/process.c=
pp.o
[212/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/media_obj=
ect.cpp.o
[213/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/v4l2_pixe=
lformat.cpp.o
[214/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/v4l2_devi=
ce.cpp.o
[215/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/yaml_pars=
er.cpp.o
[216/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_=
ipu3_frames.cpp.o
[217/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/vector.cp=
p.o
[218/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/v4l2_vide=
odevice.cpp.o
[219/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/v4l2_subd=
evice.cpp.o
[220/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/converter=
_converter_v4l2_m2m.cpp.o
[221/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_=
ipu3_cio2.cpp.o
[222/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_=
ipu3_imgu.cpp.o
[223/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/sensor_ca=
mera_sensor.cpp.o
[224/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/sensor_ca=
mera_sensor_raw.cpp.o
[225/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/sensor_ca=
mera_sensor_properties.cpp.o
[226/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/sensor_ca=
mera_sensor_legacy.cpp.o
[227/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_=
ipu3_ipu3.cpp.o
[228/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/software_=
isp_debayer.cpp.o
[229/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_=
simple_simple.cpp.o
[230/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/pipeline_=
uvcvideo_uvcvideo.cpp.o
[231/347] Linking static target src/android/libcamera_metadata.a
[232/347] Compiling C++ object src/libcamera/proxy/worker/soft_ipa_proxy.p/=
meson-generated_.._soft_ipa_proxy_worker.cpp.o
[233/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/software_=
isp_swstats_cpu.cpp.o
[234/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/tracepoin=
ts.cpp.o
[235/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/software_=
isp_debayer_cpu.cpp.o
[236/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/software_=
isp_software_isp.cpp.o
[237/347] Compiling C++ object src/libcamera/proxy/worker/ipu3_ipa_proxy.p/=
meson-generated_.._ipu3_ipa_proxy_worker.cpp.o
[238/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/device_en=
umerator_udev.cpp.o
[239/347] Compiling C++ object src/android/libcamera-hal.so.p/camera_capabi=
lities.cpp.o
[240/347] Compiling C++ object src/android/libcamera-hal.so.p/camera_hal_co=
nfig.cpp.o
[241/347] Compiling C++ object src/android/libcamera-hal.so.p/camera_hal_ma=
nager.cpp.o
[242/347] Compiling C++ object src/android/libcamera-hal.so.p/camera_metada=
ta.cpp.o
[243/347] Compiling C++ object src/android/libcamera-hal.so.p/camera3_hal.c=
pp.o
[244/347] Compiling C++ object src/android/libcamera-hal.so.p/camera_device=
.cpp.o
[245/347] Compiling C++ object src/android/libcamera-hal.so.p/hal_framebuff=
er.cpp.o
[246/347] Compiling C++ object src/android/libcamera-hal.so.p/camera_ops.cp=
p.o
[247/347] Compiling C++ object src/android/libcamera-hal.so.p/camera_reques=
t.cpp.o
[248/347] Compiling C++ object src/android/libcamera-hal.so.p/camera_stream=
.cpp.o
[249/347] Compiling C++ object src/android/libcamera-hal.so.p/yuv_post_proc=
essor_yuv.cpp.o
[250/347] Compiling C object src/android/libcamera-hal.so.p/mm_libhardware_=
stub.c.o
[251/347] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_encoder_=
libjpeg.cpp.o
[252/347] Compiling C++ object src/ipa/libipa/libipa.a.p/algorithm.cpp.o
[253/347] Compiling C++ object src/android/libcamera-hal.so.p/mm_generic_ca=
mera_buffer.cpp.o
[254/347] Compiling C++ object src/ipa/libipa/libipa.a.p/agc_mean_luminance=
.cpp.o
[255/347] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_exif.cpp=
.o
[256/347] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_post_pro=
cessor_jpeg.cpp.o
[257/347] Compiling C++ object src/android/libcamera-hal.so.p/jpeg_thumbnai=
ler.cpp.o
[258/347] Compiling C++ object src/android/libcamera-hal.so.p/mm_generic_fr=
ame_buffer_allocator.cpp.o
[259/347] Compiling C++ object src/ipa/libipa/libipa.a.p/camera_sensor_help=
er.cpp.o
[260/347] Compiling C++ object src/ipa/libipa/libipa.a.p/awb_grey.cpp.o
[261/347] Compiling C++ object src/ipa/libipa/libipa.a.p/exposure_mode_help=
er.cpp.o
[262/347] Compiling C++ object src/ipa/libipa/libipa.a.p/awb.cpp.o
[263/347] Compiling C++ object src/ipa/libipa/libipa.a.p/fixedpoint.cpp.o
[264/347] Compiling C++ object src/ipa/libipa/libipa.a.p/colours.cpp.o
[265/347] Compiling C++ object src/ipa/libipa/libipa.a.p/fc_queue.cpp.o
[266/347] Compiling C++ object src/ipa/libipa/libipa.a.p/interpolator.cpp.o
[267/347] Compiling C++ object src/ipa/libipa/libipa.a.p/lsc_polynomial.cpp=
.o
[268/347] Compiling C++ object src/ipa/libipa/libipa.a.p/module.cpp.o
[269/347] Compiling C++ object src/ipa/libipa/libipa.a.p/pwl.cpp.o
[270/347] Compiling C++ object src/ipa/libipa/libipa.a.p/histogram.cpp.o
[271/347] Compiling C++ object src/ipa/libipa/libipa.a.p/lux.cpp.o
[272/347] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/ipa_context.cpp.o
[273/347] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_awb.cp=
p.o
[274/347] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_agc.cp=
p.o
[275/347] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_af.cpp=
.o
[276/347] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_tone_m=
apping.cpp.o
[277/347] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/ipa_cont=
ext.cpp.o
[278/347] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/ipu3.cpp.o
[279/347] Compiling C++ object src/ipa/ipu3/ipa_ipu3.so.p/algorithms_blc.cp=
p.o
[280/347] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/algorith=
ms_awb.cpp.o
[281/347] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/algorith=
ms_agc.cpp.o
[282/347] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/algorith=
ms_blc.cpp.o
[283/347] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/soft_sim=
ple.cpp.o
[284/347] Compiling C++ object src/apps/common/libapps.a.p/image.cpp.o
[285/347] Compiling C++ object src/apps/common/libapps.a.p/ppm_writer.cpp.o
[286/347] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/algorith=
ms_ccm.cpp.o
[287/347] Compiling C++ object src/apps/common/libapps.a.p/options.cpp.o
[288/347] Compiling C++ object src/ipa/simple/ipa_soft_simple.so.p/algorith=
ms_lut.cpp.o
[289/347] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/envir=
onment.cpp.o
[290/347] Compiling C++ object src/apps/common/libapps.a.p/stream_options.c=
pp.o
[291/347] Compiling C++ object src/apps/common/libapps.a.p/dng_writer.cpp.o
[292/347] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/helpe=
rs_capture.cpp.o
[293/347] Compiling C++ object src/ipa/libipa/libipa.a.p/awb_bayes.cpp.o
[294/347] Compiling C++ object src/apps/common/libapps.a.p/event_loop.cpp.o
[295/347] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/test_=
base.cpp.o
[296/347] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/tests=
_capture_test.cpp.o
[297/347] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/.._..=
_.._subprojects_googletest-release-1.11.0_googletest_src_gtest-all.cc.o
[298/347] Linking static target src/apps/common/libapps.a
[299/347] Linking static target src/ipa/libipa/libipa.a
[300/347] Compiling C++ object src/apps/lc-compliance/lc-compliance.p/main.=
cpp.o
[301/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-gen=
erated_.._version.cpp.o
[302/347] Compiling C++ object src/apps/cam/cam.p/frame_sink.cpp.o
[303/347] Compiling C++ object src/libcamera/libcamera.so.0.5.2.p/meson-gen=
erated_.._ipa_pub_key.cpp.o
[304/347] Compiling C++ object src/apps/cam/cam.p/file_sink.cpp.o
[305/347] Compiling C++ object src/apps/cam/cam.p/kms_sink.cpp.o
[306/347] Compiling C++ object src/apps/cam/cam.p/sdl_texture_1plane.cpp.o
[307/347] Compiling C++ object src/apps/ipa-verify/ipa_verify.p/main.cpp.o
[308/347] Compiling C++ object src/apps/cam/cam.p/main.cpp.o
[309/347] Compiling C++ object src/apps/cam/cam.p/sdl_texture.cpp.o
[310/347] Compiling C++ object src/apps/cam/cam.p/capture_script.cpp.o
[311/347] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcam=
era-utils.cpp.o
[312/347] Generating src/gstreamer/gstlibcamera-controls.cpp with a custom =
command (wrapped by meson to set env)
[313/347] Linking target src/libcamera/libcamera.so.0.5.2
[314/347] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcam=
era.cpp.o
[315/347] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcam=
eraallocator.cpp.o
[316/347] Compiling C++ object src/apps/cam/cam.p/drm.cpp.o
[317/347] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcam=
erapad.cpp.o
[318/347] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera.cpp.o
[319/347] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera_file.c=
pp.o
[320/347] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_camera_proxy.=
cpp.o
[321/347] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_compat.cpp.o
[322/347] Compiling C++ object src/v4l2/v4l2-compat.so.p/v4l2_compat_manage=
r.cpp.o
[323/347] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcam=
eraprovider.cpp.o
[324/347] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcam=
erasrc.cpp.o
[325/347] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/gstlibcam=
erapool.cpp.o
[326/347] Generating Documentation/doxyfile-public with a custom command
[327/347] Generating symbol file src/libcamera/libcamera.so.0.5.2.p/libcame=
ra.so.0.5.2.symbols
[328/347] Compiling C++ object src/gstreamer/libgstlibcamera.so.p/meson-gen=
erated_.._gstlibcamera-controls.cpp.o
[329/347] Linking target src/libcamera/proxy/worker/ipu3_ipa_proxy
[330/347] Linking target src/libcamera/proxy/worker/soft_ipa_proxy
[331/347] Compiling C++ object src/apps/cam/cam.p/sdl_texture_yuv.cpp.o
[332/347] Linking target src/ipa/ipu3/ipa_ipu3.so
[333/347] Generating src/ipa/ipu3/ipa_ipu3.so.sign with a custom command
[334/347] Linking target src/android/libcamera-hal.so
[335/347] Linking target src/ipa/simple/ipa_soft_simple.so
[336/347] Compiling C++ object src/apps/cam/cam.p/sdl_sink.cpp.o
[337/347] Generating src/ipa/simple/ipa_soft_simple.so.sign with a custom c=
ommand
[338/347] Linking target src/apps/ipa-verify/ipa_verify
[339/347] Linking target src/gstreamer/libgstlibcamera.so
[340/347] Linking target src/apps/lc-compliance/lc-compliance
[341/347] Linking target src/v4l2/v4l2-compat.so
[342/347] Compiling C++ object src/apps/cam/cam.p/sdl_texture_mjpg.cpp.o
[343/347] Compiling C++ object src/apps/cam/cam.p/camera_session.cpp.o
[344/347] Linking target src/apps/cam/cam
[345/347] Generating Documentation/doxygen-public with a custom command
[346/347] Generating Documentation/doxygen-internal with a custom command
[347/347] Generating Documentation/documentation with a custom command
FAILED: Documentation/html=20
/var/lib/jenkins/.local/bin/sphinx-build -D release=3Dv0.5.2+110-48b3b7ba -=
q -W -b html -c Documentation <https://builder.linuxtv.org/job/libcamera/ws=
/Documentation> Documentation/html

Theme error!

Versions
=3D=3D=3D=3D=3D=3D=3D=3D

* Platform:         linux; (Linux-6.1.0-17-amd64-x86_64-with-glibc2.36)
* Python version:   3.11.2 (CPython)
* Sphinx version:   8.2.3
* Docutils version: 0.21.2
* Jinja2 version:   3.1.2
* Pygments version: 2.19.2

Last Messages
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

None.

Loaded Extensions
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

None.

Traceback
=3D=3D=3D=3D=3D=3D=3D=3D=3D

      File "/var/lib/jenkins/.local/lib/python3.11/site-packages/sphinx/the=
ming.py", line 228, in create
        raise ThemeError(__('no theme named %r found (missing theme.toml?)'=
) % name)
    sphinx.errors.ThemeError: no theme named 'sphinx_book_theme' found (mis=
sing theme.toml?)


The full traceback has been saved in:
/tmp/sphinx-err-kwzj8thb.log

To report this error to the developers, please open an issue at <https://gi=
thub.com/sphinx-doc/sphinx/issues/>. Thanks!
Please also report this if it was a user error, so that a better error mess=
age can be provided next time.
ninja: build stopped: subcommand failed.
Build step 'Execute shell' marked build as failure

