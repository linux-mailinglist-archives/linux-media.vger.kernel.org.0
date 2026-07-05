Return-Path: <linux-media+bounces-66624-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JSlVOLItSmpc/AAAu9opvQ
	(envelope-from <linux-media+bounces-66624-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 12:10:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF32709B05
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 12:10:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=DeYhQUsx;
	dmarc=pass (policy=quarantine) header.from=pm.me;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66624-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66624-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01FB430214DF
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2026 10:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291323905F9;
	Sun,  5 Jul 2026 10:10:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8897D363C61
	for <linux-media@vger.kernel.org>; Sun,  5 Jul 2026 10:10:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783246244; cv=none; b=MlT0P+Fe/p+n05m0cVcxcLTJ1NzavH4yXq8WnOggbBymK/j1iGfn5tQCNuJPgNeEp24fl76PEM+k6P+W718RUxUw+OUE3Ksk+lDWXKDVZX2IQPPkkBH4vSQRhjMkFgV5dlcCQAsO5mvSL8rc3sqmSsbQneibluPF0O38UCKiidU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783246244; c=relaxed/simple;
	bh=ti1ZQnZ3CWSskQlXEQ0fiOdRlUVL2HJItisxZtj5FPE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SeTSmhLYB6jj+0iz+lZbJI9/JMp5PcAWdBApGnT3sVY3smAj+u4M0/rLWYfxT4qmgXL5Kb/M6AzNiphl8Abmy0mFaZ4KUYbArsWMd8taSEgeliJB6kYWdqWYtgbQuJ1GpPk+FmMSJtSTB8KmEezYgUh7w9Yj3e2TkoyOXhoK5+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=DeYhQUsx; arc=none smtp.client-ip=85.9.210.45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1783246224; x=1783505424;
	bh=jrnsBdk/rSJRzMAclGahYxqjm09uhimSA4djDcgSbvg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=DeYhQUsx/VkPj2c8PvX1CpcitMh/6703JEsU9ggJ+spBpRuxIPmXLa8qttbb3+iyp
	 +Ut8LEk8aIIbt9netC/rp1+p9lDx8tXom4XD3VczdR6rH1C1L8w1Xd/2DJEgxNnY9+
	 IRO9tF7lwjnHTudQqC9eyhjjzEQ+6CDU6zYb3auxF5fbgbDDLKJhtABM7OFC0XhMr/
	 mV9KcfKo0eIGp3vzRb8o1ktIUv7D6dHDVW2a+79jSmwZsAcmGzVVn4Bcm6I8ObHYkg
	 dEHg+R3zG0ULKQze0+mcJDMQKyP0dveyOrqFLQJ6/9ombCxuVshdEWlOK3P/qIHhN9
	 yBibhnZPMDIrg==
Date: Sun, 05 Jul 2026 10:10:18 +0000
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <akoskovich@pm.me>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add support for the Iris codec on Milos
Message-ID: <20260705-milos-iris-v3-0-8c1353530f24@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 251031ab86d65745a358309de3586fca1040d1a1
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66624-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:akoskovich@pm.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akoskovich@pm.me,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:from_mime,pm.me:email,pm.me:mid,pm.me:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4DF32709B05

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

Fluster results:

nothing-asteroids:~/fluster$ ./fluster.py --no-emoji run -ts JVT-AVC_V1 -d =
GStreamer-H.264-V4L2
***************************************************************************=
*************************
Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2
Using 8 parallel job(s)
***************************************************************************=
*************************

[TEST SUITE] (DECODER             ) TEST VECTOR              ... RESULT
----------------------------------------------------------------------
[JVT-AVC_V1] (GStreamer-H.264-V4L2) BA3_SVA_C                ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) BA1_Sony_D               ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) BAMQ1_JVC_C              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) BAMQ2_JVC_C              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) BASQP1_Sony_C            ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CABA1_SVA_B              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) BA_MW_D                  ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) AUD_MW_E                 ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CABA1_Sony_D             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) BANM_MW_D                ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) cabac_mot_fld0_full      ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CABA2_SVA_B              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CABA3_SVA_B              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) cabac_mot_mbaff0_full    ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) cabac_mot_picaff0_full   ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) cabac_mot_frm0_full      ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CABAST3_Sony_E           ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CABASTBR3_Sony_B         ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CABREF3_Sand_D           ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) BA2_Sony_F               ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) BA1_FT_C                 ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CAFI1_SVA_C              ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CAMA1_Sony_C             ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CAMA1_TOSHIBA_B          ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CACQP3_Sony_D            ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) cama1_vtc_c              ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) cama2_vtc_b              ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CAMA3_Sand_E             ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CAMACI3_Sony_C           ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CABA2_Sony_E             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) cama3_vtc_b              ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CAMANL1_TOSHIBA_B        ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CAMANL2_TOSHIBA_B        ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CAMANL3_Sand_E           ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CAMASL3_Sony_B           ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CAMP_MOT_MBAFF_L30       ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CAMP_MOT_MBAFF_L31       ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CABA3_Sony_C             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CABA3_TOSHIBA_E          ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CANL1_SVA_B              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CANL2_SVA_B              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CANL3_SVA_B              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CABACI3_Sony_B           ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CANLMA2_Sony_C           ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CANL1_Sony_E             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CAPA1_TOSHIBA_B          ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CANLMA3_Sony_C           ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CAPAMA3_Sand_F           ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CANL4_SVA_B              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) cavlc_mot_fld0_full_B    ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CAPCM1_Sand_E            ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CAPCMNL1_Sand_E          ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) cavlc_mot_mbaff0_full_B  ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CAQP1_Sony_B             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) cavlc_mot_picaff0_full_B ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) cavlc_mot_frm0_full_B    ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CAWP5_TOSHIBA_E          ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CAWP1_TOSHIBA_E          ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CI_MW_D                  ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CANL1_TOSHIBA_G          ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CANL2_Sony_E             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVCANLMA2_Sony_C         ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CANL3_Sony_C             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVFI1_Sony_D             ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVFI1_SVA_C              ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVFI2_Sony_H             ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVFI2_SVA_C              ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVMANL1_TOSHIBA_B        ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVMA1_Sony_D             ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVMA1_TOSHIBA_B          ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVMANL2_TOSHIBA_B        ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVFC1_Sony_C             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVMAPAQP3_Sony_E         ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVMAQP3_Sony_D           ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CAPM3_Sony_D             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVMAQP2_Sony_G           ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVMP_MOT_FLD_L30_B       ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVMP_MOT_FRM_L31_B       ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVNLFI2_Sony_H           ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVNLFI1_Sony_C           ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVPA1_TOSHIBA_B          ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVPCMNL2_SVA_C           ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVPCMNL1_SVA_C           ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CI1_FT_B                 ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVWP1_TOSHIBA_E          ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVWP3_TOSHIBA_E          ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVWP2_TOSHIBA_E          ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) FI1_Sony_E               ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVWP5_TOSHIBA_E          ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVBS3_Sony_C             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) FM1_BT_B                 ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) FM2_SVA_C                ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVSEFDFT3_Sony_E         ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVSE3_Sony_H             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) FM1_FT_E                 ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) CVSE2_Sony_B             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) MIDR_MW_D                ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) MR1_BT_A                 ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) HCBP1_HHI_A              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) HCBP2_HHI_A              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) HCMP1_HHI_A              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) MPS_MW_A                 ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) MR1_MW_A                 ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) MR6_BT_B                 ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) MR7_BT_B                 ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) MR8_BT_B                 ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) MR9_BT_B                 ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) NL1_Sony_D               ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) MR2_MW_A                 ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) MR2_TANDBERG_E           ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) NL3_SVA_E                ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) MR3_TANDBERG_B           ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) NLMQ1_JVC_C              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) MR4_TANDBERG_C           ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) MR5_TANDBERG_C           ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) NLMQ2_JVC_C              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) Sharp_MP_Field_1_B       ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) Sharp_MP_Field_2_B       ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) Sharp_MP_PAFF_1r2        ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) Sharp_MP_Field_3_B       ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) Sharp_MP_PAFF_2r         ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) sp2_bt_b                 ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) SP1_BT_A                 ... Error
[JVT-AVC_V1] (GStreamer-H.264-V4L2) MV1_BRCM_D               ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) SL1_SVA_B                ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) SVA_BA2_D                ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) SVA_BA1_B                ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) SVA_Base_B               ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) NRF_MW_E                 ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) NL2_Sony_H               ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) SVA_NL2_E                ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) SVA_NL1_B                ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) SVA_FM1_E                ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) SVA_CL1_E                ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2) LS_SVA_D                 ... Success

nothing-asteroids:~/fluster$ ./fluster.py --no-emoji run -ts JCT-VC-HEVC_V1=
 -d GStreamer-H.265-V4L2
***************************************************************************=
*************************
Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2
Using 8 parallel job(s)
***************************************************************************=
*************************

[TEST SUITE    ] (DECODER             ) TEST VECTOR                     ...=
 RESULT
----------------------------------------------------------------------
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) AMP_E_Hisilicon_3               ...=
 Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) AMP_D_Hisilicon_3               ...=
 Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) AMVP_A_MTK_4                    ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) AMP_B_Samsung_7                 ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) AMVP_B_MTK_4                    ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) AMP_A_Samsung_7                 ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) CAINIT_A_SHARP_4                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) AMVP_C_Samsung_7                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) BUMPING_A_ericsson_1            ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) CAINIT_B_SHARP_4                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) CIP_A_Panasonic_3               ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) CAINIT_D_SHARP_3                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) CAINIT_C_SHARP_3                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) CAINIT_E_SHARP_3                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) CAINIT_F_SHARP_3                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) CAINIT_G_SHARP_3                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) cip_B_NEC_3                     ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) CIP_C_Panasonic_2               ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) CAINIT_H_SHARP_3                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) DBLK_A_MAIN10_VIXS_4            ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) DBLK_D_VIXS_2                   ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) DBLK_E_VIXS_2                   ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) DBLK_A_SONY_3                   ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) CONFWIN_A_Sony_1                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) DBLK_C_SONY_3                   ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) DBLK_B_SONY_3                   ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) DBLK_F_VIXS_2                   ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) DBLK_G_VIXS_2                   ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) DELTAQP_B_SONY_3                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) DELTAQP_C_SONY_3                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) ENTP_A_QUALCOMM_1               ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) DSLICE_A_HHI_5                  ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) DSLICE_B_HHI_5                  ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) DSLICE_C_HHI_5                  ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) EXT_A_ericsson_4                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) ENTP_B_Qualcomm_1               ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) ENTP_C_Qualcomm_1               ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) DELTAQP_A_BRCM_4                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) ipcm_A_NEC_3                    ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) ipcm_B_NEC_3                    ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) FILLER_A_Sony_1                 ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) INITQP_A_Sony_1                 ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) ipcm_C_NEC_3                    ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) ipcm_E_NEC_2                    ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) ipcm_D_NEC_3                    ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) IPRED_A_docomo_2                ...=
 Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) HRD_A_Fujitsu_3                 ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) INITQP_B_Main10_Sony_1          ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) IPRED_B_Nokia_3                 ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) IPRED_C_Mitsubishi_3            ...=
 Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) MAXBINS_A_TI_5                  ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) MAXBINS_B_TI_5                  ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) LS_A_Orange_2                   ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) MAXBINS_C_TI_5                  ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) MERGE_A_TI_3                    ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) LS_B_Orange_4                   ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) MERGE_C_TI_3                    ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) MERGE_D_TI_3                    ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) MERGE_B_TI_3                    ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) MERGE_E_TI_3                    ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) MERGE_F_MTK_4                   ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) MERGE_G_HHI_4                   ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) MVEDGE_A_qualcomm_3             ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) MVCLIP_A_qualcomm_3             ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) NoOutPrior_A_Qualcomm_1         ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) NoOutPrior_B_Qualcomm_1         ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) NUT_A_ericsson_5                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) PICSIZE_A_Bossen_1              ...=
 Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) PICSIZE_B_Bossen_1              ...=
 Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) PICSIZE_C_Bossen_1              ...=
 Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) PICSIZE_D_Bossen_1              ...=
 Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) OPFLAG_B_Qualcomm_1             ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) PMERGE_A_TI_3                   ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) PMERGE_B_TI_3                   ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) OPFLAG_C_Qualcomm_1             ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) PMERGE_C_TI_3                   ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) PMERGE_E_TI_3                   ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) PPS_A_qualcomm_7                ...=
 Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) PMERGE_D_TI_3                   ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) POC_A_Bossen_3                  ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) RAP_B_Bossen_2                  ...=
 Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) PS_B_VIDYO_3                    ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) RAP_A_docomo_6                  ...=
 Fail
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) RPS_A_docomo_5                  ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) LTRPSPS_A_Qualcomm_1            ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) RPS_C_ericsson_5                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) RPS_D_ericsson_6                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) RPS_F_docomo_2                  ...=
 Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) MVDL1ZERO_A_docomo_4            ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) RQT_A_HHI_4                     ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) RQT_B_HHI_4                     ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) RPLM_A_qualcomm_4               ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) OPFLAG_A_Qualcomm_1             ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) RPLM_B_qualcomm_4               ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) RQT_C_HHI_4                     ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) RQT_F_HHI_4                     ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) RQT_E_HHI_4                     ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) RQT_D_HHI_4                     ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) RQT_G_HHI_4                     ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) SAO_C_Samsung_5                 ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) SAO_E_Canon_4                   ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) SAO_D_Samsung_5                 ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) RPS_B_qualcomm_5                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) SAO_B_MediaTek_5                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) SAO_G_Canon_3                   ...=
 Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) SAO_A_MediaTek_4                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) SAO_F_Canon_3                   ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) SAO_H_Parabola_1                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) SDH_A_Orange_4                  ...=
 Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) RPS_E_qualcomm_5                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) SLICES_A_Rovi_3                 ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) SLIST_B_Sony_9                  ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) SLIST_A_Sony_5                  ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) SLPPLP_A_VIDYO_2                ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) SLIST_C_Sony_4                  ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) SLIST_D_Sony_9                  ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) TMVP_A_MS_3                     ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) STRUCT_B_Samsung_7              ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) STRUCT_A_Samsung_7              ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) TSKIP_A_MS_3                    ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) TILES_B_Cisco_1                 ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) TILES_A_Cisco_2                 ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) TSUNEQBD_A_MAIN10_Technicolor_2 ...=
 Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) VPSSPSPPS_A_MainConcept_1       ...=
 Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) TSCL_B_VIDYO_4                  ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) TUSIZE_A_Samsung_1              ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) TSCL_A_VIDYO_5                  ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) VPSID_A_VIDYO_2                 ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) WPP_A_ericsson_MAIN10_2         ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) WPP_A_ericsson_MAIN_2           ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) WPP_B_ericsson_MAIN10_2         ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) WP_A_MAIN10_Toshiba_3           ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) SAODBLK_A_MainConcept_4         ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) SAODBLK_B_MainConcept_4         ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) WP_B_Toshiba_3                  ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) WP_MAIN10_B_Toshiba_3           ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) WP_A_Toshiba_3                  ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) WPP_B_ericsson_MAIN_2           ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) WPP_D_ericsson_MAIN_2           ...=
 Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) WPP_C_ericsson_MAIN10_2         ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) WPP_D_ericsson_MAIN10_2         ...=
 Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) WPP_C_ericsson_MAIN_2           ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) WPP_E_ericsson_MAIN10_2         ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) WPP_E_ericsson_MAIN_2           ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) WPP_F_ericsson_MAIN_2           ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) WPP_F_ericsson_MAIN10_2         ...=
 Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2) AMP_F_Hisilicon_3               ...=
 Timeout

nothing-asteroids:~/fluster$ ./fluster.py --no-emoji run -ts VP9-TEST-VECTO=
RS -d GStreamer-VP9-V4L2 -j1
***************************************************************************=
*************************
Running test suite VP9-TEST-VECTORS with decoder GStreamer-VP9-V4L2
Using 1 parallel job(s)
***************************************************************************=
*************************

[TEST SUITE      ] (DECODER           ) TEST VECTOR                        =
             ... RESULT
----------------------------------------------------------------------
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-00.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-01.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-02.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-03.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-04.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-05.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-06.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-07.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-08.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-09.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-10.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-11.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-12.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-13.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-14.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-15.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-16.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-17.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-18.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-19.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-20.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-21.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-22.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-23.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-24.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-25.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-26.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-27.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-28.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-29.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-30.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-31.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-32.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-33.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-34.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-35.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-36.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-37.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-38.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-39.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-40.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-41.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-42.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-43.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-44.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-45.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-46.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-47.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-48.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-49.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-50.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-51.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-52.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-53.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-54.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-55.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-56.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-57.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-58.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-59.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-60.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-61.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-62.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-00-quantizer-63.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-01-sharpness-1.webm         =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-01-sharpness-2.webm         =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-01-sharpness-3.webm         =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-01-sharpness-4.webm         =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-01-sharpness-5.webm         =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-01-sharpness-6.webm         =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-01-sharpness-7.webm         =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-08x08.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-08x10.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-08x16.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-08x18.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-08x32.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-08x34.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-08x64.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-08x66.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-10x08.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-10x10.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-10x16.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-10x18.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-10x32.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-10x34.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-10x64.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-10x66.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-130x132.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-132x130.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-132x132.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-16x08.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-16x10.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-16x16.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-16x18.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-16x32.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-16x34.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-16x64.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-16x66.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-178x180.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-180x178.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-180x180.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-18x08.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-18x10.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-18x16.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-18x18.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-18x32.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-18x34.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-18x64.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-18x66.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-32x08.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-32x10.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-32x16.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-32x18.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-32x32.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-32x34.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-32x64.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-32x66.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-34x08.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-34x10.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-34x16.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-34x18.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-34x32.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-34x34.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-34x64.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-34x66.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-64x08.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-64x10.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-64x16.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-64x18.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-64x32.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-64x34.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-64x64.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-64x66.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-66x08.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-66x10.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-66x16.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-66x18.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-66x32.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-66x34.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-66x64.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-66x66.webm          =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-02-size-lf-1920x1080.webm   =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-deltaq.webm              =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-196x196.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-196x198.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-196x200.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-196x202.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-196x208.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-196x210.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-196x224.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-196x226.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-198x196.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-198x198.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-198x200.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-198x202.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-198x208.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-198x210.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-198x224.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-198x226.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-200x196.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-200x198.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-200x200.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-200x202.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-200x208.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-200x210.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-200x224.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-200x226.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-202x196.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-202x198.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-202x200.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-202x202.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-202x208.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-202x210.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-202x224.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-202x226.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-208x196.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-208x198.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-208x200.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-208x202.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-208x208.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-208x210.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-208x224.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-208x226.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-210x196.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-210x198.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-210x200.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-210x202.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-210x208.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-210x210.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-210x224.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-210x226.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-224x196.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-224x198.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-224x200.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-224x202.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-224x208.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-224x210.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-224x224.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-224x226.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-226x196.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-226x198.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-226x200.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-226x202.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-226x208.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-226x210.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-226x224.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-226x226.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-03-size-352x288.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-05-resize.ivf               =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-06-bilinear.webm            =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-07-frame_parallel-1.webm    =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-07-frame_parallel.webm      =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-08-tile_1x2_frame_parallel.w=
ebm          ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-08-tile_1x2.webm            =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-08-tile_1x4_frame_parallel.w=
ebm          ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-08-tile_1x4.webm            =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-08-tile_1x8_frame_parallel.w=
ebm          ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-08-tile_1x8.webm            =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-08-tile-4x1.webm            =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-08-tile-4x4.webm            =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-09-aq2.webm                 =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-09-lf_deltas.webm           =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-09-subpixel-00.ivf          =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-10-show-existing-frame2.webm=
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-10-show-existing-frame.webm =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-11-size-351x287.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-11-size-351x288.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-11-size-352x287.webm        =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-12-droppable_1.ivf          =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-12-droppable_2.ivf          =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-12-droppable_3.ivf          =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-10frames-fp-tiles-=
1-2-4-8.webm ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-10frames-fp-tiles-=
1-2.webm     ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-10frames-fp-tiles-=
1-4.webm     ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-10frames-fp-tiles-=
1-8.webm     ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-10frames-fp-tiles-=
2-1.webm     ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-10frames-fp-tiles-=
2-4.webm     ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-10frames-fp-tiles-=
2-8.webm     ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-10frames-fp-tiles-=
4-1.webm     ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-10frames-fp-tiles-=
4-2.webm     ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-10frames-fp-tiles-=
4-8.webm     ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-10frames-fp-tiles-=
8-1.webm     ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-10frames-fp-tiles-=
8-2.webm     ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-10frames-fp-tiles-=
8-4-2-1.webm ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-10frames-fp-tiles-=
8-4.webm     ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-fp-tiles-1-16.webm=
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-fp-tiles-1-2-4-8-1=
6.webm       ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-fp-tiles-1-2.webm =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-fp-tiles-1-4.webm =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-fp-tiles-16-1.webm=
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-fp-tiles-16-2.webm=
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-fp-tiles-16-4.webm=
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-fp-tiles-16-8-4-2-=
1.webm       ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-fp-tiles-16-8.webm=
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-fp-tiles-1-8.webm =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-fp-tiles-2-16.webm=
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-fp-tiles-2-1.webm =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-fp-tiles-2-4.webm =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-fp-tiles-2-8.webm =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-fp-tiles-4-16.webm=
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-fp-tiles-4-1.webm =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-fp-tiles-4-2.webm =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-fp-tiles-4-8.webm =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-fp-tiles-8-16.webm=
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-fp-tiles-8-1.webm =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-fp-tiles-8-2.webm =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-14-resize-fp-tiles-8-4.webm =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-15-segkey_adpq.webm         =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-15-segkey.webm              =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-16-intra-only.webm          =
             ... Timeout
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-17-show-existing-frame.webm =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-18-resize.ivf               =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-19-skip-01.webm             =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-19-skip-02.webm             =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-19-skip.webm                =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-20-big_superframe-01.webm   =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-20-big_superframe-02.webm   =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_1280x720_5_1=
-2.webm      ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_1280x720_5_3=
-4.webm      ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_1280x720_7_1=
-2.webm      ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_1280x720_7_3=
-4.webm      ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_1920x1080_5_=
1-2.webm     ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_1920x1080_5_=
3-4.webm     ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_1920x1080_7_=
1-2.webm     ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_1920x1080_7_=
3-4.webm     ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_320x180_5_1-=
2.webm       ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_320x180_5_3-=
4.webm       ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_320x180_7_1-=
2.webm       ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_320x180_7_3-=
4.webm       ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_320x240_5_1-=
2.webm       ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_320x240_5_3-=
4.webm       ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_320x240_7_1-=
2.webm       ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_320x240_7_3-=
4.webm       ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_640x360_5_1-=
2.webm       ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_640x360_5_3-=
4.webm       ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_640x360_7_1-=
2.webm       ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_640x360_7_3-=
4.webm       ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_640x480_5_1-=
2.webm       ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_640x480_5_3-=
4.webm       ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_640x480_7_1-=
2.webm       ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-21-resize_inter_640x480_7_3-=
4.webm       ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-22-svc_1280x720_1.webm      =
             ... Success
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp90-2-22-svc_1280x720_3.ivf       =
             ... Fail
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp91-2-04-yuv422.webm              =
             ... Error
[VP9-TEST-VECTORS] (GStreamer-VP9-V4L2) vp91-2-04-yuv444.webm              =
             ... Error

---
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
 .../media/platform/qcom/iris/iris_platform_milos.h |  28 +
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  35 +
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 7 files changed, 1203 insertions(+)
---
base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
change-id: 20260406-milos-iris-d1a854e4cb75

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



