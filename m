Return-Path: <linux-media+bounces-66798-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oYXbOe4mTGr3gwEAu9opvQ
	(envelope-from <linux-media+bounces-66798-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 00:06:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 607A0715E1F
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 00:06:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=aW2oRqxn;
	dmarc=pass (policy=quarantine) header.from=pm.me;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66798-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66798-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 624203026C95
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 22:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7B5430CD3;
	Mon,  6 Jul 2026 22:06:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5411BC08F;
	Mon,  6 Jul 2026 22:06:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783375563; cv=none; b=ATN9rEmT8xnV6iyFOd2K3mnUAlJyhvtRTDwDnnYFRb09GOqjmFjbSdkmoaF2EBJ8KWGU2XdXkL2JtQphbf2Dc5XJHR+wwM0KwNDFz+lyxyTdtRQ/9U7ccLNBCT/2/fBwx7vLZdduzyk0nGwL6Xg0Rqz6NSbqHGN1hUoDCv1yGAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783375563; c=relaxed/simple;
	bh=8qBUPwBt0u3SSoYNcTeaf6PTJyTN9IpFeain1BtACVk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m0eT0H6GcYhScCLKiZHXsK7UahbE1oOgCwkevX/gOrb0nFuGOTlftXl55EhJWcffd2tdxLXkxrDOyRoohPtTXKAi6N5fVS1EYna7VHIcNIVHm6+ZhFvrnDOalsoLlyiXnujbDPqRjkhr+1SADZpP1y69hwV74IObi7uYUhPDBJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=aW2oRqxn; arc=none smtp.client-ip=85.9.210.45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1783375550; x=1783634750;
	bh=4N09trsfve7s8Xvwo2ELkVFWjx5c6BjMdk9I4terRNE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=aW2oRqxnsNyKZShss5i9Xn3G01AzNMYI/77GrN2IyXbzAb00Of35s2m6ayfw4rFAU
	 DA7xK4ZhKmc+U4qhY9+GCHgb3yywaienP4Ne0Xr2aAsLQv5ggVYL1lTa28je4y1mfH
	 chZRKeM1qYc/gUo8Rd4d72NdLKYMwDe8qxZnYqxw3Ue26a9P/GuY7nAmI1nFrLXxeI
	 8op4hsS25qU9rlneWRPYlUYigEmb+MQT51luXOT0V1lmTZJPDTbJjYdz/LG6Bj8gGn
	 0k1+6xlYSw+giihDbeabCpyDbhvSyqr7yJlJJEKsboA/7t6hknOCyc1bwXRt7rrbDn
	 qfkJhx6v/SlAg==
Date: Mon, 06 Jul 2026 22:05:42 +0000
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <akoskovich@pm.me>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Add support for the Iris codec on Milos
Message-ID: <20260706-milos-iris-v4-0-119cbe0a7262@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: b499a7350ea2746088f054143f93e717bd86f937
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66798-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:akoskovich@pm.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akoskovich@pm.me,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pm.me:from_mime,pm.me:email,pm.me:mid,pm.me:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 607A0715E1F

This series adds the bindings, nodes and platform data for the Milos platfo=
rm
for the Iris video codec, allowing Milos to use hardware=E2=80=91accelerate=
d video
encoding and decoding.

Ran v4l2-compliance and some fluster tests, though a concerning amount of t=
hem
failed. Attaching v4l2-compliance output and the full fluster results below=
.

nothing-asteroids:~$ v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.32.0, 64 bits, 64-bit time_t

Compliance test for iris_driver device /dev/video1:

Driver Info:
=09Driver name      : iris_driver
=09Card type        : Iris Encoder
=09Bus info         : platform:aa00000.video-codec
=09Driver version   : 7.2.0
=09Capabilities     : 0x84204000
=09=09Video Memory-to-Memory Multiplanar
=09=09Streaming
=09=09Extended Pix Format
=09=09Device Capabilities
=09Device Caps      : 0x04204000
=09=09Video Memory-to-Memory Multiplanar
=09=09Streaming
=09=09Extended Pix Format
=09Detected Stateful Encoder

Required ioctls:
=09test VIDIOC_QUERYCAP: OK
=09test invalid ioctls: OK

Allow for multiple opens:
=09test second /dev/video1 open: OK
=09test VIDIOC_QUERYCAP: OK
=09test VIDIOC_G/S_PRIORITY: OK
=09test for unlimited opens: OK

Debug ioctls:
=09test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
=09test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
=09test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
=09test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
=09test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
=09test VIDIOC_ENUMAUDIO: OK (Not Supported)
=09test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
=09test VIDIOC_G/S_AUDIO: OK (Not Supported)
=09Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
=09test VIDIOC_G/S_MODULATOR: OK (Not Supported)
=09test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
=09test VIDIOC_ENUMAUDOUT: OK (Not Supported)
=09test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
=09test VIDIOC_G/S_AUDOUT: OK (Not Supported)
=09Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
=09test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
=09test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
=09test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
=09test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
=09test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
=09test VIDIOC_QUERYCTRL: OK
=09test VIDIOC_G/S_CTRL: OK
=09test VIDIOC_G/S/TRY_EXT_CTRLS: OK
=09test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
=09test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
=09Standard Controls: 64 Private Controls: 0

Format ioctls:
=09test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
=09test VIDIOC_G/S_PARM: OK
=09test VIDIOC_G_FBUF: OK (Not Supported)
=09test VIDIOC_G_FMT: OK
=09test VIDIOC_TRY_FMT: OK
=09test VIDIOC_S_FMT: OK
=09test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
=09test Cropping: OK
=09test Composing: OK (Not Supported)
=09test Scaling: OK (Not Supported)

Codec ioctls:
=09test VIDIOC_(TRY_)ENCODER_CMD: OK
=09test VIDIOC_G_ENC_INDEX: OK (Not Supported)
=09test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
=09test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
=09test CREATE_BUFS maximum buffers: OK
=09test VIDIOC_REMOVE_BUFS: OK
=09test VIDIOC_EXPBUF: OK
=09test Requests: OK (Not Supported)
=09test blocking wait: OK

Test input 0:

Streaming ioctls:
=09test read/write: OK (Not Supported)
=09Video Capture Multiplanar: Captured 124 buffers  =20
=09=09fail: v4l2-test-buffers.cpp(1750): node->streamon(q.g_type())
=09test MMAP (select, REQBUFS): FAIL
=09Video Capture Multiplanar: Captured 61 buffers   =20
=09=09fail: v4l2-test-buffers.cpp(1750): node->streamon(q.g_type())
=09test MMAP (epoll, REQBUFS): FAIL
=09Video Capture Multiplanar: Captured 61 buffers   =20
=09=09fail: v4l2-test-buffers.cpp(1750): node->streamon(q.g_type())
=09test MMAP (select, CREATE_BUFS): FAIL
=09Video Capture Multiplanar: Captured 61 buffers   =20
=09=09fail: v4l2-test-buffers.cpp(1750): node->streamon(q.g_type())
=09test MMAP (epoll, CREATE_BUFS): FAIL
=09test USERPTR (select): OK (Not Supported)
=09test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 50, Failed: 4, War=
nings: 0
nothing-asteroids:~$=20

nothing-asteroids:~$ v4l2-compliance -d /dev/video0 -s5 --stream-from=3D/me=
dia/FVDO_Freeway_720p.264
v4l2-compliance 1.32.0, 64 bits, 64-bit time_t

Compliance test for iris_driver device /dev/video0:

Driver Info:
=09Driver name      : iris_driver
=09Card type        : Iris Decoder
=09Bus info         : platform:aa00000.video-codec
=09Driver version   : 7.2.0
=09Capabilities     : 0x84204000
=09=09Video Memory-to-Memory Multiplanar
=09=09Streaming
=09=09Extended Pix Format
=09=09Device Capabilities
=09Device Caps      : 0x04204000
=09=09Video Memory-to-Memory Multiplanar
=09=09Streaming
=09=09Extended Pix Format
=09Detected Stateful Decoder

Required ioctls:
=09test VIDIOC_QUERYCAP: OK
=09test invalid ioctls: OK

Allow for multiple opens:
=09test second /dev/video0 open: OK
=09test VIDIOC_QUERYCAP: OK
=09test VIDIOC_G/S_PRIORITY: OK
=09test for unlimited opens: OK

Debug ioctls:
=09test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
=09test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
=09test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
=09test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
=09test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
=09test VIDIOC_ENUMAUDIO: OK (Not Supported)
=09test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
=09test VIDIOC_G/S_AUDIO: OK (Not Supported)
=09Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
=09test VIDIOC_G/S_MODULATOR: OK (Not Supported)
=09test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
=09test VIDIOC_ENUMAUDOUT: OK (Not Supported)
=09test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
=09test VIDIOC_G/S_AUDOUT: OK (Not Supported)
=09Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
=09test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
=09test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
=09test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
=09test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
=09test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
=09test VIDIOC_QUERYCTRL: OK
=09test VIDIOC_G/S_CTRL: OK
=09test VIDIOC_G/S/TRY_EXT_CTRLS: OK
=09test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
=09test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
=09Standard Controls: 10 Private Controls: 0

Format ioctls:
=09test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
=09test VIDIOC_G/S_PARM: OK (Not Supported)
=09test VIDIOC_G_FBUF: OK (Not Supported)
=09test VIDIOC_G_FMT: OK
=09test VIDIOC_TRY_FMT: OK
=09test VIDIOC_S_FMT: OK
=09test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
=09test Cropping: OK
=09test Composing: OK
=09test Scaling: OK (Not Supported)

Codec ioctls:
=09test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
=09test VIDIOC_G_ENC_INDEX: OK (Not Supported)
=09test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
=09test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
=09test CREATE_BUFS maximum buffers: OK
=09test VIDIOC_REMOVE_BUFS: OK
=09test VIDIOC_EXPBUF: OK
=09test Requests: OK (Not Supported)
=09test blocking wait: OK

Test input 0:

Streaming ioctls:
=09test read/write: OK (Not Supported)
the input file is smaller than 7077888 bytes
=09Video Capture Multiplanar: Captured 465 buffers  =20
=09test MMAP (select, REQBUFS): OK
the input file is smaller than 7077888 bytes
=09Video Capture Multiplanar: Captured 465 buffers  =20
=09test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
=09Video Capture Multiplanar: Captured 465 buffers  =20
=09test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
=09Video Capture Multiplanar: Captured 465 buffers  =20
=09test MMAP (epoll, CREATE_BUFS): OK
=09test USERPTR (select): OK (Not Supported)
=09test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, War=
nings: 0
nothing-asteroids:~$=20

The fluster results can be found here:
https://github.com/linux-msm/fluster-tests/pull/1

---
Changes in v4:
- Update firmware name to vpu20_p2_gen2_s7.mbn
- Drop mb_cycles_fw[_vpp], unused on vpu2
- Add mb_cycles_vsp
- Use hex for iommus
- Link to v3: https://lore.kernel.org/r/20260705-milos-iris-v3-0-8c1353530f=
24@pm.me

Changes in v3:
- Rebase onto next-20260703
- Switched fluster tests to use gstreamer, ffmpeg ones not reproducible run=
 to run?
- Update milos caps to include caps introduced in tree after v2
- Correct iris opp table to only update the MX rail values
- Link to v2: https://lore.kernel.org/r/20260529-milos-iris-v2-0-7a763d7195=
ae@pm.me

Changes in v2:
- Rebase onto 7.1.0-rc5
- Change firmware name to vpu20_p2.mbn
- Change iris reg to hex
- Correct iris opp table
- Update cover letter with new test run on 7.1.0-rc5, add -s arg to v4l2-co=
mpliance
- Link to v1: https://lore.kernel.org/r/20260406-milos-iris-v1-0-17ed0167ba=
6f@pm.me

---
Alexander Koskovich (3):
      dt-bindings: media: qcom,milos-iris: Add Milos video codec
      media: iris: Add support for Milos (VPU v2.0)
      arm64: dts: qcom: milos: Add Iris VPU v2.0

 .../devicetree/bindings/media/qcom,milos-iris.yaml | 166 ++++
 arch/arm64/boot/dts/qcom/milos.dtsi                |  85 ++
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 883 +++++++++++++++++=
++++
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 .../media/platform/qcom/iris/iris_platform_milos.h |  27 +
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  35 +
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 7 files changed, 1202 insertions(+)
---
base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
change-id: 20260406-milos-iris-d1a854e4cb75

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



