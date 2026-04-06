Return-Path: <linux-media+bounces-58088-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHkwA8GI02lGiwcAu9opvQ
	(envelope-from <linux-media+bounces-58088-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 12:19:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F283A2C2A
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 12:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 175C83013A42
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 10:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60B33290B7;
	Mon,  6 Apr 2026 10:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="WsdISPkT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF3678F3A
	for <linux-media@vger.kernel.org>; Mon,  6 Apr 2026 10:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775470775; cv=none; b=tMVZY8CuS/bPt0SSBBz2GO+gQhPv1bn5Zy1MQs2DYsdeEUkZj4QzKxCr9t+Ndeb7x+ijg2q9SU1uQvu/jmOb69/+ElOj1bjGKU+YxLjFbxyLY4YpsKmIDAPpPx9krAUVnbBztW+jKFhRtqRTmmvsqXpqCBkigaihhHrpSlHO8So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775470775; c=relaxed/simple;
	bh=rF+f0UgZEiBWaZ45Taari/8j1TlgNI3OT5IeZlHhMIM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=U4fgAF/Bv3YgFl4CEMmwkI1NTezmFIg6wVSd9v6f190gDX3B8E5Jr2B8Ss+61/WepsJY32XK39LL5fPuS36VDj5gBaQWPHGDUVhqxHoYh9zU85DqyZvyL+Jl/7V9xXw6nN7kZkI/gsMDKMu59SHL3ptfCFQ6mR9PdixEPumYHwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=WsdISPkT; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775470769; x=1775729969;
	bh=ZeSLNhn3aMKGmWEkyABGeQ0fj74iZLMFh9VV6PBTlgs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=WsdISPkT/3Dr37q7qKvNHEh5vFEJkFQHsiGYhjWLZ+DnNeY/rWWzc3zi2XLaBydmM
	 9sP+RhMAdn9vNEoLqjwXDcoFSreFD48ghSTMxcbmRRD2q8DjJdiizUK7MddykbaYg+
	 V+n8GdLfPknB3+AmTH6wdSMUvrf5UWSCH1vbbq47H2H1VZW+w8pEWbpjMOALXeougf
	 wu2TQkZGEtdnJlXVdJPZ39XesdvAcx1ZKSaBgLzT7dmrZRxRn1oQpBvO+JGmMLhfvD
	 C5qhNyTqmGLt0LiKcUSrXz0/A8yPAzpzfGAO/M5NIUiYhb1HBSn/4YkDUn7W59VYst
	 9b38mcybc8e7g==
Date: Mon, 06 Apr 2026 10:19:23 +0000
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 0/3] Add support for the Iris codec on Milos
Message-ID: <20260406-milos-iris-v1-0-17ed0167ba6f@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 16ac40ce048821c5668b42bcbb902fd11e632340
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
	TAGGED_FROM(0.00)[bounces-58088-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: 46F283A2C2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds the bindings, nodes and platform data for the Milos platfo=
rm
for the Iris video codec, allowing Milos to use hardware=E2=80=91accelerate=
d video
encoding and decoding.

Ran v4l2-compliance and some fluster tests, though a concerning amount of t=
hem
failed. Attaching v4l2-compliance output and the full fluster results below=
.

~ # v4l2-compliance -d /dev/video0
v4l2-compliance 1.32.0, 64 bits, 64-bit time_t

Compliance test for iris_driver device /dev/video0:

Driver Info:
=09Driver name      : iris_driver
=09Card type        : Iris Decoder
=09Bus info         : platform:aa00000.video-codec
=09Driver version   : 7.0.0
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

Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0, War=
nings: 0

~ # v4l2-compliance -d /dev/video1
v4l2-compliance 1.32.0, 64 bits, 64-bit time_t

Compliance test for iris_driver device /dev/video1:

Driver Info:
=09Driver name      : iris_driver
=09Card type        : Iris Encoder
=09Bus info         : platform:aa00000.video-codec
=09Driver version   : 7.0.0
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
=09Standard Controls: 43 Private Controls: 0

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

Total for iris_driver device /dev/video1: 48, Succeeded: 48, Failed: 0, War=
nings: 0

-------------------------------

H264:
|Test|FFmpeg-H.264-v4l2m2m|
|-|-|
|TOTAL|36/135|
|TOTAL TIME|23.574s|
|-|-|
|AUD_MW_E|Pass|
|BA1_FT_C|Fail|
|BA1_Sony_D|Pass|
|BA2_Sony_F|Pass|
|BA3_SVA_C|Error|
|BA_MW_D|Fail|
|BAMQ1_JVC_C|Fail|
|BAMQ2_JVC_C|Fail|
|BANM_MW_D|Fail|
|BASQP1_Sony_C|Fail|
|CABA1_Sony_D|Fail|
|CABA1_SVA_B|Pass|
|CABA2_Sony_E|Pass|
|CABA2_SVA_B|Pass|
|CABA3_Sony_C|Fail|
|CABA3_SVA_B|Pass|
|CABA3_TOSHIBA_E|Fail|
|cabac_mot_fld0_full|Fail|
|cabac_mot_frm0_full|Pass|
|cabac_mot_mbaff0_full|Fail|
|cabac_mot_picaff0_full|Fail|
|CABACI3_Sony_B|Pass|
|CABAST3_Sony_E|Pass|
|CABASTBR3_Sony_B|Pass|
|CABREF3_Sand_D|Fail|
|CACQP3_Sony_D|Pass|
|CAFI1_SVA_C|Fail|
|CAMA1_Sony_C|Fail|
|CAMA1_TOSHIBA_B|Fail|
|cama1_vtc_c|Fail|
|cama2_vtc_b|Fail|
|CAMA3_Sand_E|Fail|
|cama3_vtc_b|Fail|
|CAMACI3_Sony_C|Fail|
|CAMANL1_TOSHIBA_B|Fail|
|CAMANL2_TOSHIBA_B|Fail|
|CAMANL3_Sand_E|Fail|
|CAMASL3_Sony_B|Fail|
|CAMP_MOT_MBAFF_L30|Fail|
|CAMP_MOT_MBAFF_L31|Fail|
|CANL1_Sony_E|Pass|
|CANL1_SVA_B|Pass|
|CANL1_TOSHIBA_G|Fail|
|CANL2_Sony_E|Fail|
|CANL2_SVA_B|Fail|
|CANL3_Sony_C|Fail|
|CANL3_SVA_B|Fail|
|CANL4_SVA_B|Fail|
|CANLMA2_Sony_C|Fail|
|CANLMA3_Sony_C|Fail|
|CAPA1_TOSHIBA_B|Fail|
|CAPAMA3_Sand_F|Fail|
|CAPCM1_Sand_E|Pass|
|CAPCMNL1_Sand_E|Fail|
|CAPM3_Sony_D|Fail|
|CAQP1_Sony_B|Pass|
|cavlc_mot_fld0_full_B|Fail|
|cavlc_mot_frm0_full_B|Pass|
|cavlc_mot_mbaff0_full_B|Fail|
|cavlc_mot_picaff0_full_B|Fail|
|CAWP1_TOSHIBA_E|Pass|
|CAWP5_TOSHIBA_E|Pass|
|CI1_FT_B|Pass|
|CI_MW_D|Pass|
|CVBS3_Sony_C|Pass|
|CVCANLMA2_Sony_C|Fail|
|CVFC1_Sony_C|Fail|
|CVFI1_Sony_D|Fail|
|CVFI1_SVA_C|Fail|
|CVFI2_Sony_H|Fail|
|CVFI2_SVA_C|Fail|
|CVMA1_Sony_D|Fail|
|CVMA1_TOSHIBA_B|Fail|
|CVMANL1_TOSHIBA_B|Fail|
|CVMANL2_TOSHIBA_B|Fail|
|CVMAPAQP3_Sony_E|Fail|
|CVMAQP2_Sony_G|Fail|
|CVMAQP3_Sony_D|Fail|
|CVMP_MOT_FLD_L30_B|Fail|
|CVMP_MOT_FRM_L31_B|Fail|
|CVNLFI1_Sony_C|Fail|
|CVNLFI2_Sony_H|Fail|
|CVPA1_TOSHIBA_B|Fail|
|CVPCMNL1_SVA_C|Fail|
|CVPCMNL2_SVA_C|Pass|
|CVSE2_Sony_B|Fail|
|CVSE3_Sony_H|Pass|
|CVSEFDFT3_Sony_E|Fail|
|CVWP1_TOSHIBA_E|Fail|
|CVWP2_TOSHIBA_E|Pass|
|CVWP3_TOSHIBA_E|Pass|
|CVWP5_TOSHIBA_E|Fail|
|FI1_Sony_E|Fail|
|FM1_BT_B|Error|
|FM1_FT_E|Error|
|FM2_SVA_C|Error|
|HCBP1_HHI_A|Pass|
|HCBP2_HHI_A|Fail|
|HCMP1_HHI_A|Fail|
|LS_SVA_D|Fail|
|MIDR_MW_D|Fail|
|MPS_MW_A|Pass|
|MR1_BT_A|Pass|
|MR1_MW_A|Fail|
|MR2_MW_A|Fail|
|MR2_TANDBERG_E|Pass|
|MR3_TANDBERG_B|Fail|
|MR4_TANDBERG_C|Fail|
|MR5_TANDBERG_C|Fail|
|MR6_BT_B|Error|
|MR7_BT_B|Error|
|MR8_BT_B|Error|
|MR9_BT_B|Fail|
|MV1_BRCM_D|Pass|
|NL1_Sony_D|Fail|
|NL2_Sony_H|Pass|
|NL3_SVA_E|Fail|
|NLMQ1_JVC_C|Fail|
|NLMQ2_JVC_C|Pass|
|NRF_MW_E|Fail|
|Sharp_MP_Field_1_B|Fail|
|Sharp_MP_Field_2_B|Fail|
|Sharp_MP_Field_3_B|Fail|
|Sharp_MP_PAFF_1r2|Fail|
|Sharp_MP_PAFF_2r|Fail|
|SL1_SVA_B|Pass|
|SP1_BT_A|Error|
|sp2_bt_b|Error|
|SVA_BA1_B|Pass|
|SVA_BA2_D|Pass|
|SVA_Base_B|Fail|
|SVA_CL1_E|Fail|
|SVA_FM1_E|Fail|
|SVA_NL1_B|Fail|
|SVA_NL2_E|Fail|
|-|-|
|Test|FFmpeg-H.264-v4l2m2m|
|TOTAL|36/135|
|TOTAL TIME|23.574s|

|-|-|
|Profile|FFmpeg-H.264-v4l2m2m|
|CONSTRAINED_BASELINE|12/33|
|BASELINE|1/7|
|EXTENDED|0/6|
|MAIN|23/89|

|TOTALS|FFmpeg-H.264-v4l2m2m|
|-|-|
|TOTAL|36/135|
|TOTAL TIME|23.574s|
|-|-|
|Profile|FFmpeg-H.264-v4l2m2m|
|BASELINE|1/7|
|CONSTRAINED_BASELINE|12/33|
|EXTENDED|0/6|
|MAIN|23/89|
|-|-|

-------------------------------

|Test|FFmpeg-H.265-v4l2m2m|
|-|-|
|TOTAL|109/147|
|TOTAL TIME|38.547s|
|-|-|
|AMP_A_Samsung_7|Pass|
|AMP_B_Samsung_7|Pass|
|AMP_D_Hisilicon_3|Pass|
|AMP_E_Hisilicon_3|Pass|
|AMP_F_Hisilicon_3|Pass|
|AMVP_A_MTK_4|Pass|
|AMVP_B_MTK_4|Fail|
|AMVP_C_Samsung_7|Pass|
|BUMPING_A_ericsson_1|Fail|
|CAINIT_A_SHARP_4|Pass|
|CAINIT_B_SHARP_4|Pass|
|CAINIT_C_SHARP_3|Pass|
|CAINIT_D_SHARP_3|Pass|
|CAINIT_E_SHARP_3|Pass|
|CAINIT_F_SHARP_3|Pass|
|CAINIT_G_SHARP_3|Pass|
|CAINIT_H_SHARP_3|Pass|
|CIP_A_Panasonic_3|Pass|
|cip_B_NEC_3|Pass|
|CIP_C_Panasonic_2|Pass|
|CONFWIN_A_Sony_1|Fail|
|DBLK_A_MAIN10_VIXS_4|Fail|
|DBLK_A_SONY_3|Pass|
|DBLK_B_SONY_3|Pass|
|DBLK_C_SONY_3|Pass|
|DBLK_D_VIXS_2|Pass|
|DBLK_E_VIXS_2|Pass|
|DBLK_F_VIXS_2|Pass|
|DBLK_G_VIXS_2|Pass|
|DELTAQP_A_BRCM_4|Pass|
|DELTAQP_B_SONY_3|Pass|
|DELTAQP_C_SONY_3|Pass|
|DSLICE_A_HHI_5|Pass|
|DSLICE_B_HHI_5|Pass|
|DSLICE_C_HHI_5|Pass|
|ENTP_A_QUALCOMM_1|Pass|
|ENTP_B_Qualcomm_1|Pass|
|ENTP_C_Qualcomm_1|Pass|
|EXT_A_ericsson_4|Pass|
|FILLER_A_Sony_1|Pass|
|HRD_A_Fujitsu_3|Pass|
|INITQP_A_Sony_1|Pass|
|INITQP_B_Main10_Sony_1|Fail|
|ipcm_A_NEC_3|Fail|
|ipcm_B_NEC_3|Pass|
|ipcm_C_NEC_3|Pass|
|ipcm_D_NEC_3|Pass|
|ipcm_E_NEC_2|Pass|
|IPRED_A_docomo_2|Pass|
|IPRED_B_Nokia_3|Pass|
|IPRED_C_Mitsubishi_3|Pass|
|LS_A_Orange_2|Pass|
|LS_B_Orange_4|Pass|
|LTRPSPS_A_Qualcomm_1|Fail|
|MAXBINS_A_TI_5|Pass|
|MAXBINS_B_TI_5|Pass|
|MAXBINS_C_TI_5|Pass|
|MERGE_A_TI_3|Pass|
|MERGE_B_TI_3|Pass|
|MERGE_C_TI_3|Fail|
|MERGE_D_TI_3|Fail|
|MERGE_E_TI_3|Pass|
|MERGE_F_MTK_4|Pass|
|MERGE_G_HHI_4|Pass|
|MVCLIP_A_qualcomm_3|Fail|
|MVDL1ZERO_A_docomo_4|Pass|
|MVEDGE_A_qualcomm_3|Fail|
|NoOutPrior_A_Qualcomm_1|Fail|
|NoOutPrior_B_Qualcomm_1|Fail|
|NUT_A_ericsson_5|Fail|
|OPFLAG_A_Qualcomm_1|Pass|
|OPFLAG_B_Qualcomm_1|Fail|
|OPFLAG_C_Qualcomm_1|Fail|
|PICSIZE_A_Bossen_1|Error|
|PICSIZE_B_Bossen_1|Error|
|PICSIZE_C_Bossen_1|Error|
|PICSIZE_D_Bossen_1|Error|
|PMERGE_A_TI_3|Pass|
|PMERGE_B_TI_3|Pass|
|PMERGE_C_TI_3|Pass|
|PMERGE_D_TI_3|Pass|
|PMERGE_E_TI_3|Pass|
|POC_A_Bossen_3|Pass|
|PPS_A_qualcomm_7|Pass|
|PS_B_VIDYO_3|Pass|
|RAP_A_docomo_6|Fail|
|RAP_B_Bossen_2|Fail|
|RPLM_A_qualcomm_4|Pass|
|RPLM_B_qualcomm_4|Pass|
|RPS_A_docomo_5|Pass|
|RPS_B_qualcomm_5|Pass|
|RPS_C_ericsson_5|Pass|
|RPS_D_ericsson_6|Pass|
|RPS_E_qualcomm_5|Pass|
|RPS_F_docomo_2|Pass|
|RQT_A_HHI_4|Pass|
|RQT_B_HHI_4|Pass|
|RQT_C_HHI_4|Pass|
|RQT_D_HHI_4|Pass|
|RQT_E_HHI_4|Pass|
|RQT_F_HHI_4|Pass|
|RQT_G_HHI_4|Pass|
|SAO_A_MediaTek_4|Fail|
|SAO_B_MediaTek_5|Pass|
|SAO_C_Samsung_5|Pass|
|SAO_D_Samsung_5|Pass|
|SAO_E_Canon_4|Pass|
|SAO_F_Canon_3|Pass|
|SAO_G_Canon_3|Pass|
|SAO_H_Parabola_1|Pass|
|SAODBLK_A_MainConcept_4|Pass|
|SAODBLK_B_MainConcept_4|Pass|
|SDH_A_Orange_4|Pass|
|SLICES_A_Rovi_3|Pass|
|SLIST_A_Sony_5|Pass|
|SLIST_B_Sony_9|Pass|
|SLIST_C_Sony_4|Pass|
|SLIST_D_Sony_9|Pass|
|SLPPLP_A_VIDYO_2|Pass|
|STRUCT_A_Samsung_7|Pass|
|STRUCT_B_Samsung_7|Pass|
|TILES_A_Cisco_2|Pass|
|TILES_B_Cisco_1|Pass|
|TMVP_A_MS_3|Pass|
|TSCL_A_VIDYO_5|Fail|
|TSCL_B_VIDYO_4|Pass|
|TSKIP_A_MS_3|Pass|
|TSUNEQBD_A_MAIN10_Technicolor_2|Error|
|TUSIZE_A_Samsung_1|Pass|
|VPSID_A_VIDYO_2|Pass|
|VPSSPSPPS_A_MainConcept_1|Fail|
|WP_A_MAIN10_Toshiba_3|Fail|
|WP_A_Toshiba_3|Pass|
|WP_B_Toshiba_3|Pass|
|WP_MAIN10_B_Toshiba_3|Fail|
|WPP_A_ericsson_MAIN10_2|Fail|
|WPP_A_ericsson_MAIN_2|Pass|
|WPP_B_ericsson_MAIN10_2|Fail|
|WPP_B_ericsson_MAIN_2|Fail|
|WPP_C_ericsson_MAIN10_2|Fail|
|WPP_C_ericsson_MAIN_2|Fail|
|WPP_D_ericsson_MAIN10_2|Error|
|WPP_D_ericsson_MAIN_2|Error|
|WPP_E_ericsson_MAIN10_2|Fail|
|WPP_E_ericsson_MAIN_2|Fail|
|WPP_F_ericsson_MAIN10_2|Fail|
|WPP_F_ericsson_MAIN_2|Pass|
|-|-|
|Test|FFmpeg-H.265-v4l2m2m|
|TOTAL|109/147|
|TOTAL TIME|38.547s|

|-|-|
|Profile|FFmpeg-H.265-v4l2m2m|
|MAIN|108/135|
|MAIN_10|0/11|
|MAIN_STILL_PICTURE|1/1|

|TOTALS|FFmpeg-H.265-v4l2m2m|
|-|-|
|TOTAL|109/147|
|TOTAL TIME|38.547s|
|-|-|
|Profile|FFmpeg-H.265-v4l2m2m|
|MAIN|108/135|
|MAIN_10|0/11|
|MAIN_STILL_PICTURE|1/1|
|-|-|

-------------------------------

|Test|FFmpeg-VP9-v4l2m2m|
|-|-|
|TOTAL|111/305|
|TOTAL TIME|77.260s|
|-|-|
|vp90-2-00-quantizer-00.webm|Pass|
|vp90-2-00-quantizer-01.webm|Pass|
|vp90-2-00-quantizer-02.webm|Pass|
|vp90-2-00-quantizer-03.webm|Fail|
|vp90-2-00-quantizer-04.webm|Fail|
|vp90-2-00-quantizer-05.webm|Pass|
|vp90-2-00-quantizer-06.webm|Pass|
|vp90-2-00-quantizer-07.webm|Pass|
|vp90-2-00-quantizer-08.webm|Fail|
|vp90-2-00-quantizer-09.webm|Pass|
|vp90-2-00-quantizer-10.webm|Pass|
|vp90-2-00-quantizer-11.webm|Pass|
|vp90-2-00-quantizer-12.webm|Pass|
|vp90-2-00-quantizer-13.webm|Pass|
|vp90-2-00-quantizer-14.webm|Pass|
|vp90-2-00-quantizer-15.webm|Pass|
|vp90-2-00-quantizer-16.webm|Fail|
|vp90-2-00-quantizer-17.webm|Pass|
|vp90-2-00-quantizer-18.webm|Pass|
|vp90-2-00-quantizer-19.webm|Pass|
|vp90-2-00-quantizer-20.webm|Pass|
|vp90-2-00-quantizer-21.webm|Pass|
|vp90-2-00-quantizer-22.webm|Pass|
|vp90-2-00-quantizer-23.webm|Pass|
|vp90-2-00-quantizer-24.webm|Pass|
|vp90-2-00-quantizer-25.webm|Fail|
|vp90-2-00-quantizer-26.webm|Fail|
|vp90-2-00-quantizer-27.webm|Pass|
|vp90-2-00-quantizer-28.webm|Pass|
|vp90-2-00-quantizer-29.webm|Fail|
|vp90-2-00-quantizer-30.webm|Pass|
|vp90-2-00-quantizer-31.webm|Pass|
|vp90-2-00-quantizer-32.webm|Fail|
|vp90-2-00-quantizer-33.webm|Pass|
|vp90-2-00-quantizer-34.webm|Pass|
|vp90-2-00-quantizer-35.webm|Pass|
|vp90-2-00-quantizer-36.webm|Pass|
|vp90-2-00-quantizer-37.webm|Pass|
|vp90-2-00-quantizer-38.webm|Pass|
|vp90-2-00-quantizer-39.webm|Pass|
|vp90-2-00-quantizer-40.webm|Pass|
|vp90-2-00-quantizer-41.webm|Pass|
|vp90-2-00-quantizer-42.webm|Pass|
|vp90-2-00-quantizer-43.webm|Pass|
|vp90-2-00-quantizer-44.webm|Fail|
|vp90-2-00-quantizer-45.webm|Pass|
|vp90-2-00-quantizer-46.webm|Pass|
|vp90-2-00-quantizer-47.webm|Pass|
|vp90-2-00-quantizer-48.webm|Pass|
|vp90-2-00-quantizer-49.webm|Pass|
|vp90-2-00-quantizer-50.webm|Fail|
|vp90-2-00-quantizer-51.webm|Pass|
|vp90-2-00-quantizer-52.webm|Pass|
|vp90-2-00-quantizer-53.webm|Pass|
|vp90-2-00-quantizer-54.webm|Pass|
|vp90-2-00-quantizer-55.webm|Pass|
|vp90-2-00-quantizer-56.webm|Pass|
|vp90-2-00-quantizer-57.webm|Pass|
|vp90-2-00-quantizer-58.webm|Pass|
|vp90-2-00-quantizer-59.webm|Fail|
|vp90-2-00-quantizer-60.webm|Pass|
|vp90-2-00-quantizer-61.webm|Pass|
|vp90-2-00-quantizer-62.webm|Pass|
|vp90-2-00-quantizer-63.webm|Fail|
|vp90-2-01-sharpness-1.webm|Pass|
|vp90-2-01-sharpness-2.webm|Pass|
|vp90-2-01-sharpness-3.webm|Pass|
|vp90-2-01-sharpness-4.webm|Pass|
|vp90-2-01-sharpness-5.webm|Pass|
|vp90-2-01-sharpness-6.webm|Pass|
|vp90-2-01-sharpness-7.webm|Pass|
|vp90-2-02-size-08x08.webm|Error|
|vp90-2-02-size-08x10.webm|Error|
|vp90-2-02-size-08x16.webm|Error|
|vp90-2-02-size-08x18.webm|Error|
|vp90-2-02-size-08x32.webm|Error|
|vp90-2-02-size-08x34.webm|Error|
|vp90-2-02-size-08x64.webm|Error|
|vp90-2-02-size-08x66.webm|Error|
|vp90-2-02-size-10x08.webm|Error|
|vp90-2-02-size-10x10.webm|Error|
|vp90-2-02-size-10x16.webm|Error|
|vp90-2-02-size-10x18.webm|Error|
|vp90-2-02-size-10x32.webm|Error|
|vp90-2-02-size-10x34.webm|Error|
|vp90-2-02-size-10x64.webm|Error|
|vp90-2-02-size-10x66.webm|Error|
|vp90-2-02-size-130x132.webm|Fail|
|vp90-2-02-size-132x130.webm|Pass|
|vp90-2-02-size-132x132.webm|Pass|
|vp90-2-02-size-16x08.webm|Error|
|vp90-2-02-size-16x10.webm|Error|
|vp90-2-02-size-16x16.webm|Error|
|vp90-2-02-size-16x18.webm|Error|
|vp90-2-02-size-16x32.webm|Error|
|vp90-2-02-size-16x34.webm|Error|
|vp90-2-02-size-16x64.webm|Error|
|vp90-2-02-size-16x66.webm|Error|
|vp90-2-02-size-178x180.webm|Fail|
|vp90-2-02-size-180x178.webm|Pass|
|vp90-2-02-size-180x180.webm|Fail|
|vp90-2-02-size-18x08.webm|Error|
|vp90-2-02-size-18x10.webm|Error|
|vp90-2-02-size-18x16.webm|Error|
|vp90-2-02-size-18x18.webm|Error|
|vp90-2-02-size-18x32.webm|Error|
|vp90-2-02-size-18x34.webm|Error|
|vp90-2-02-size-18x64.webm|Error|
|vp90-2-02-size-18x66.webm|Error|
|vp90-2-02-size-32x08.webm|Error|
|vp90-2-02-size-32x10.webm|Error|
|vp90-2-02-size-32x16.webm|Error|
|vp90-2-02-size-32x18.webm|Error|
|vp90-2-02-size-32x32.webm|Error|
|vp90-2-02-size-32x34.webm|Error|
|vp90-2-02-size-32x64.webm|Error|
|vp90-2-02-size-32x66.webm|Error|
|vp90-2-02-size-34x08.webm|Error|
|vp90-2-02-size-34x10.webm|Error|
|vp90-2-02-size-34x16.webm|Error|
|vp90-2-02-size-34x18.webm|Error|
|vp90-2-02-size-34x32.webm|Error|
|vp90-2-02-size-34x34.webm|Error|
|vp90-2-02-size-34x64.webm|Error|
|vp90-2-02-size-34x66.webm|Error|
|vp90-2-02-size-64x08.webm|Error|
|vp90-2-02-size-64x10.webm|Error|
|vp90-2-02-size-64x16.webm|Error|
|vp90-2-02-size-64x18.webm|Error|
|vp90-2-02-size-64x32.webm|Error|
|vp90-2-02-size-64x34.webm|Error|
|vp90-2-02-size-64x64.webm|Error|
|vp90-2-02-size-64x66.webm|Error|
|vp90-2-02-size-66x08.webm|Error|
|vp90-2-02-size-66x10.webm|Error|
|vp90-2-02-size-66x16.webm|Error|
|vp90-2-02-size-66x18.webm|Error|
|vp90-2-02-size-66x32.webm|Error|
|vp90-2-02-size-66x34.webm|Error|
|vp90-2-02-size-66x64.webm|Error|
|vp90-2-02-size-66x66.webm|Error|
|vp90-2-02-size-lf-1920x1080.webm|Fail|
|vp90-2-03-deltaq.webm|Fail|
|vp90-2-03-size-196x196.webm|Pass|
|vp90-2-03-size-196x198.webm|Pass|
|vp90-2-03-size-196x200.webm|Pass|
|vp90-2-03-size-196x202.webm|Pass|
|vp90-2-03-size-196x208.webm|Fail|
|vp90-2-03-size-196x210.webm|Fail|
|vp90-2-03-size-196x224.webm|Pass|
|vp90-2-03-size-196x226.webm|Fail|
|vp90-2-03-size-198x196.webm|Fail|
|vp90-2-03-size-198x198.webm|Pass|
|vp90-2-03-size-198x200.webm|Pass|
|vp90-2-03-size-198x202.webm|Pass|
|vp90-2-03-size-198x208.webm|Pass|
|vp90-2-03-size-198x210.webm|Fail|
|vp90-2-03-size-198x224.webm|Pass|
|vp90-2-03-size-198x226.webm|Fail|
|vp90-2-03-size-200x196.webm|Fail|
|vp90-2-03-size-200x198.webm|Fail|
|vp90-2-03-size-200x200.webm|Fail|
|vp90-2-03-size-200x202.webm|Pass|
|vp90-2-03-size-200x208.webm|Fail|
|vp90-2-03-size-200x210.webm|Fail|
|vp90-2-03-size-200x224.webm|Pass|
|vp90-2-03-size-200x226.webm|Fail|
|vp90-2-03-size-202x196.webm|Fail|
|vp90-2-03-size-202x198.webm|Fail|
|vp90-2-03-size-202x200.webm|Fail|
|vp90-2-03-size-202x202.webm|Fail|
|vp90-2-03-size-202x208.webm|Pass|
|vp90-2-03-size-202x210.webm|Fail|
|vp90-2-03-size-202x224.webm|Fail|
|vp90-2-03-size-202x226.webm|Pass|
|vp90-2-03-size-208x196.webm|Pass|
|vp90-2-03-size-208x198.webm|Pass|
|vp90-2-03-size-208x200.webm|Pass|
|vp90-2-03-size-208x202.webm|Pass|
|vp90-2-03-size-208x208.webm|Pass|
|vp90-2-03-size-208x210.webm|Pass|
|vp90-2-03-size-208x224.webm|Pass|
|vp90-2-03-size-208x226.webm|Pass|
|vp90-2-03-size-210x196.webm|Pass|
|vp90-2-03-size-210x198.webm|Pass|
|vp90-2-03-size-210x200.webm|Fail|
|vp90-2-03-size-210x202.webm|Pass|
|vp90-2-03-size-210x208.webm|Pass|
|vp90-2-03-size-210x210.webm|Fail|
|vp90-2-03-size-210x224.webm|Pass|
|vp90-2-03-size-210x226.webm|Fail|
|vp90-2-03-size-224x196.webm|Fail|
|vp90-2-03-size-224x198.webm|Pass|
|vp90-2-03-size-224x200.webm|Pass|
|vp90-2-03-size-224x202.webm|Fail|
|vp90-2-03-size-224x208.webm|Pass|
|vp90-2-03-size-224x210.webm|Fail|
|vp90-2-03-size-224x224.webm|Pass|
|vp90-2-03-size-224x226.webm|Pass|
|vp90-2-03-size-226x196.webm|Pass|
|vp90-2-03-size-226x198.webm|Fail|
|vp90-2-03-size-226x200.webm|Fail|
|vp90-2-03-size-226x202.webm|Fail|
|vp90-2-03-size-226x208.webm|Pass|
|vp90-2-03-size-226x210.webm|Pass|
|vp90-2-03-size-226x224.webm|Fail|
|vp90-2-03-size-226x226.webm|Fail|
|vp90-2-03-size-352x288.webm|Pass|
|vp90-2-05-resize.ivf|Fail|
|vp90-2-06-bilinear.webm|Pass|
|vp90-2-07-frame_parallel-1.webm|Pass|
|vp90-2-07-frame_parallel.webm|Fail|
|vp90-2-08-tile_1x2_frame_parallel.webm|Fail|
|vp90-2-08-tile_1x2.webm|Fail|
|vp90-2-08-tile_1x4_frame_parallel.webm|Fail|
|vp90-2-08-tile_1x4.webm|Fail|
|vp90-2-08-tile_1x8_frame_parallel.webm|Pass|
|vp90-2-08-tile_1x8.webm|Pass|
|vp90-2-08-tile-4x1.webm|Pass|
|vp90-2-08-tile-4x4.webm|Pass|
|vp90-2-09-aq2.webm|Fail|
|vp90-2-09-lf_deltas.webm|Fail|
|vp90-2-09-subpixel-00.ivf|Fail|
|vp90-2-10-show-existing-frame2.webm|Fail|
|vp90-2-10-show-existing-frame.webm|Fail|
|vp90-2-11-size-351x287.webm|Fail|
|vp90-2-11-size-351x288.webm|Fail|
|vp90-2-11-size-352x287.webm|Fail|
|vp90-2-12-droppable_1.ivf|Pass|
|vp90-2-12-droppable_2.ivf|Pass|
|vp90-2-12-droppable_3.ivf|Pass|
|vp90-2-14-resize-10frames-fp-tiles-1-2-4-8.webm|Timeout|
|vp90-2-14-resize-10frames-fp-tiles-1-2.webm|Timeout|
|vp90-2-14-resize-10frames-fp-tiles-1-4.webm|Fail|
|vp90-2-14-resize-10frames-fp-tiles-1-8.webm|Fail|
|vp90-2-14-resize-10frames-fp-tiles-2-1.webm|Timeout|
|vp90-2-14-resize-10frames-fp-tiles-2-4.webm|Timeout|
|vp90-2-14-resize-10frames-fp-tiles-2-8.webm|Timeout|
|vp90-2-14-resize-10frames-fp-tiles-4-1.webm|Timeout|
|vp90-2-14-resize-10frames-fp-tiles-4-2.webm|Timeout|
|vp90-2-14-resize-10frames-fp-tiles-4-8.webm|Timeout|
|vp90-2-14-resize-10frames-fp-tiles-8-1.webm|Timeout|
|vp90-2-14-resize-10frames-fp-tiles-8-2.webm|Timeout|
|vp90-2-14-resize-10frames-fp-tiles-8-4-2-1.webm|Timeout|
|vp90-2-14-resize-10frames-fp-tiles-8-4.webm|Timeout|
|vp90-2-14-resize-fp-tiles-1-16.webm|Fail|
|vp90-2-14-resize-fp-tiles-1-2-4-8-16.webm|Timeout|
|vp90-2-14-resize-fp-tiles-1-2.webm|Fail|
|vp90-2-14-resize-fp-tiles-1-4.webm|Timeout|
|vp90-2-14-resize-fp-tiles-16-1.webm|Error|
|vp90-2-14-resize-fp-tiles-16-2.webm|Error|
|vp90-2-14-resize-fp-tiles-16-4.webm|Error|
|vp90-2-14-resize-fp-tiles-16-8-4-2-1.webm|Error|
|vp90-2-14-resize-fp-tiles-16-8.webm|Error|
|vp90-2-14-resize-fp-tiles-1-8.webm|Fail|
|vp90-2-14-resize-fp-tiles-2-16.webm|Error|
|vp90-2-14-resize-fp-tiles-2-1.webm|Fail|
|vp90-2-14-resize-fp-tiles-2-4.webm|Fail|
|vp90-2-14-resize-fp-tiles-2-8.webm|Timeout|
|vp90-2-14-resize-fp-tiles-4-16.webm|Error|
|vp90-2-14-resize-fp-tiles-4-1.webm|Timeout|
|vp90-2-14-resize-fp-tiles-4-2.webm|Timeout|
|vp90-2-14-resize-fp-tiles-4-8.webm|Fail|
|vp90-2-14-resize-fp-tiles-8-16.webm|Error|
|vp90-2-14-resize-fp-tiles-8-1.webm|Timeout|
|vp90-2-14-resize-fp-tiles-8-2.webm|Timeout|
|vp90-2-14-resize-fp-tiles-8-4.webm|Timeout|
|vp90-2-15-segkey_adpq.webm|Fail|
|vp90-2-15-segkey.webm|Pass|
|vp90-2-16-intra-only.webm|Fail|
|vp90-2-17-show-existing-frame.webm|Pass|
|vp90-2-18-resize.ivf|Fail|
|vp90-2-19-skip-01.webm|Fail|
|vp90-2-19-skip-02.webm|Fail|
|vp90-2-19-skip.webm|Pass|
|vp90-2-20-big_superframe-01.webm|Fail|
|vp90-2-20-big_superframe-02.webm|Fail|
|vp90-2-21-resize_inter_1280x720_5_1-2.webm|Timeout|
|vp90-2-21-resize_inter_1280x720_5_3-4.webm|Timeout|
|vp90-2-21-resize_inter_1280x720_7_1-2.webm|Fail|
|vp90-2-21-resize_inter_1280x720_7_3-4.webm|Timeout|
|vp90-2-21-resize_inter_1920x1080_5_1-2.webm|Timeout|
|vp90-2-21-resize_inter_1920x1080_5_3-4.webm|Timeout|
|vp90-2-21-resize_inter_1920x1080_7_1-2.webm|Timeout|
|vp90-2-21-resize_inter_1920x1080_7_3-4.webm|Timeout|
|vp90-2-21-resize_inter_320x180_5_1-2.webm|Fail|
|vp90-2-21-resize_inter_320x180_5_3-4.webm|Fail|
|vp90-2-21-resize_inter_320x180_7_1-2.webm|Fail|
|vp90-2-21-resize_inter_320x180_7_3-4.webm|Fail|
|vp90-2-21-resize_inter_320x240_5_1-2.webm|Timeout|
|vp90-2-21-resize_inter_320x240_5_3-4.webm|Fail|
|vp90-2-21-resize_inter_320x240_7_1-2.webm|Fail|
|vp90-2-21-resize_inter_320x240_7_3-4.webm|Timeout|
|vp90-2-21-resize_inter_640x360_5_1-2.webm|Fail|
|vp90-2-21-resize_inter_640x360_5_3-4.webm|Timeout|
|vp90-2-21-resize_inter_640x360_7_1-2.webm|Fail|
|vp90-2-21-resize_inter_640x360_7_3-4.webm|Fail|
|vp90-2-21-resize_inter_640x480_5_1-2.webm|Timeout|
|vp90-2-21-resize_inter_640x480_5_3-4.webm|Fail|
|vp90-2-21-resize_inter_640x480_7_1-2.webm|Timeout|
|vp90-2-21-resize_inter_640x480_7_3-4.webm|Timeout|
|vp90-2-22-svc_1280x720_1.webm|Pass|
|vp90-2-22-svc_1280x720_3.ivf|Timeout|
|vp91-2-04-yuv422.webm|Error|
|vp91-2-04-yuv444.webm|Error|
|-|-|
|Test|FFmpeg-VP9-v4l2m2m|
|TOTAL|111/305|
|TOTAL TIME|77.260s|

|TOTALS|FFmpeg-VP9-v4l2m2m|
|-|-|
|TOTAL|111/305|
|TOTAL TIME|77.260s|
|-|-|

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Alexander Koskovich (3):
      dt-bindings: media: qcom,milos-iris: Add Milos video codec
      media: iris: Add support for Milos (VPU v2.0)
      arm64: dts: qcom: milos: Add Iris VPU v2.0

 .../devicetree/bindings/media/qcom,milos-iris.yaml | 166 ++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                |  85 +++
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 106 ++++
 .../media/platform/qcom/iris/iris_platform_milos.h | 655 +++++++++++++++++=
++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 6 files changed, 1017 insertions(+)
---
base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
change-id: 20260406-milos-iris-d1a854e4cb75

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



