Return-Path: <linux-media+bounces-57283-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kG+dK8u0xmmiNgUAu9opvQ
	(envelope-from <linux-media+bounces-57283-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:48:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA78347BFC
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D0C953052908
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC3435CB70;
	Fri, 27 Mar 2026 16:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nP0lHlOk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311673590A8
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 16:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630016; cv=none; b=RXWeqXumgLt9OKdL1kqfyylNZ7dBWmv9G5pRgEWzoJjMExdU/9+cLsAxS+g++PQ3wvx4HTRJVuz1mljK+X85zoADRq/VfiiU2mhzt+Av7RDMdmywSguf9WSgexFIemWr7qaCGkC+HfFz/PRNqr72bfB/C+FyolqGFxLadeQGbsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630016; c=relaxed/simple;
	bh=r0ZvJ5TUWKzisHOV7jFBz/GP+JKwSuIZUQ+QSbUAR/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I+C+RU7fd3LN9Vw9re3WWv/HwcBebpt/8KBbwfSMRXu1GRB0TYfaqSbl+wp9pS9EZQ6BE0g/W3phYW0R0lvcwkWnhyBUGwZ/jZD2dIvpHt6ZflGaA55zTQ7k8HrwYddAkgpMtJuFf0MjOztlqhDQsAHBRXbhzscyT3mgQM+UVH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nP0lHlOk; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64ad9fabd08so2506292d50.2
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 09:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774630013; x=1775234813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fCk7U46MYSgCc+QKhwtVh9bKjwKXfA0ka9j2W+wC8w=;
        b=nP0lHlOkSAO+fww0dqt5MkxlhZd5hJzw2WPD9YJ8Kh7zOr2rSg6EPSOShTXkfsnjA9
         B1eQ+MyxgAlcByN6P2uSV+CDUQiPPw3so5OYoIXMe/qZsnsBlvt+AB5QRiXntT4lrZiO
         Jkw9wlbLtWCRLSsE773xe7SQy6rWH52LVZtcpVaQ97zP8tJINFBmd1EJ8/StjzyKt9HS
         6dM3cuIIyIANP2QIXmypXCaLGXZFovXdErUJkSGGR6DV5djWlPcdF+iUl2hm+Zhgziy5
         h8kH/rtOM6QwmTIrVUrJxH/0nOzDoaEwDxkx2d7UEDwzwkEvryz4RwbeuO8RMpziOQrY
         5vJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630013; x=1775234813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4fCk7U46MYSgCc+QKhwtVh9bKjwKXfA0ka9j2W+wC8w=;
        b=QpYk343IZ2SWJvgoiEZDzh+iS5+jJXIzqpsltdF+OMpQALPSKCq9JRS41YcUKK7/N2
         BG23ZqttUG4ICR24tIEK+xpnmaq+eZIFMZwAKbjgft2TLcmgY9CxbyLPwUhuhDd4Vv+W
         32ztNLh6AhMu32CF//xwP5rcxi499iNmID3778MqVv1qrBaKE1No+YLtOQyg+K3TT/t9
         Vbryc9W3u+NbBilKOzZhwpYWPsILwMw8XiKBB8N5wVP3oW07xs1hkZk/drzK8iFc6AT9
         t4CFe9vqLSnTrHGuKx5L7YVh0fUyx+qWWY5lwSIcRIt+MTUP/4XWWAvMOXvPgj3Nt9bu
         ZDJw==
X-Forwarded-Encrypted: i=1; AJvYcCXJX2U7miWfAspxJAYvZC09J7pUxTWAu+/O692ZPXFaO6/Yse+oMY48IHgEnsvyA37VotybDjbXbp6rrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/LzhUoHPQ5zuvIO/dwgwNH5YgZ0Oy3HBUzVR8RqD7b3FG4Rdd
	FiIBJwNN9PnmwRkNPih2BWOfo7ixh1Y9kdAIyX5N6KsSB+Xrr71SuxWN
X-Gm-Gg: ATEYQzzVosXg61w5FVotkffAzAWb88cqxXGMmbGve9yKiP/c6KyAePs5xa8Rw48zRir
	sP266NiLnSwLvikBIsA0SIocE8gDs7fp/VEdvZ/x3EDnLYARzCU26MH9VLwLMbsYzU0oLHFMgwW
	dYxhdFsMTfux58pOcmziWuIclwGpqkV3IK+aFS6kReEzOwHuRir1nYCKdO6Kf7ladMghljYrE3k
	JmmTu9gNO+un616YfHR7ptA/geGKNhzwzM6zKU9D7VtCYPYvY9IFavyehXlp9cWvzwxpKV7hRhl
	T1CYhwj4NUzNNdS/mnkldu5e5S0R9x580xRbjNqte20e15XTR8kDpmD9bdL5NEX0egOJDy+GQUg
	FmLukAug/PpwFy9pTM/cPIguT3jWgeHNPONGNnLAeksjE2lXdW1fVkomWYhPaLQQf1t5s9S9ZjQ
	awUK72bm/UTBuYSwJfUxqMkHI3uvh/2eY+cHyo2eGAQcrqQ4nrct9DS8z49vHFUlFjLjvV53w=
X-Received: by 2002:a05:690e:4847:b0:649:f002:582b with SMTP id 956f58d0204a3-64ff7199764mr2384505d50.7.1774630012548;
        Fri, 27 Mar 2026 09:46:52 -0700 (PDT)
Received: from localhost (104-48-214-220.lightspeed.snantx.sbcglobal.net. [104.48.214.220])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64ef57bfcfcsm3308415d50.1.2026.03.27.09.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:46:52 -0700 (PDT)
From: Steev Klimaszewski <threeway@gmail.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	andersson@kernel.org,
	bod@kernel.org,
	bryan.odonoghue@linaro.org,
	conor+dt@kernel.org,
	david@ixit.cz,
	devicetree@vger.kernel.org,
	dikshita.agarwal@oss.qualcomm.com,
	johan+linaro@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	stanimir.varbanov@linaro.org,
	vikash.garodia@oss.qualcomm.com
Subject: Re: [PATCH v4 0/6] media: iris: enable SM8350 and SC8280XP support
Date: Fri, 27 Mar 2026 11:46:51 -0500
Message-ID: <20260327164651.45628-1-threeway@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57283-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[threeway@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,finn:email]
X-Rspamd-Queue-Id: 7CA78347BFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry, all,

I've tested this on my Thinkpad X13s, after disabling venus module otherwis=
e it
loads venus not iris.

In el2, the device seems to be /dev/video33

steev@finn:~$ v4l2-compliance -d 33
v4l2-compliance 1.32.0, 64 bits, 64-bit time_t

Compliance test for iris_driver device /dev/video33:

Driver Info:
	Driver name      : iris_driver
	Card type        : Iris Encoder
	Bus info         : platform:aa00000.video-codec
	Driver version   : 6.19.10
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
	Detected Stateful Encoder

Required ioctls:
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video33 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 33 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Total for iris_driver device /dev/video33: 48, Succeeded: 48, Failed: 0, Wa=
rnings: 0



In el1, the device becomes /dev/video0

steev@finn:~$ v4l2-compliance
v4l2-compliance 1.32.0, 64 bits, 64-bit time_t

Compliance test for iris_driver device /dev/video0:

Driver Info:
	Driver name      : iris_driver
	Card type        : Iris Decoder
	Bus info         : platform:aa00000.video-codec
	Driver version   : 6.19.10
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
	Detected Stateful Decoder

Required ioctls:
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 2 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK
	test Composing: OK
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0, War=
nings: 0


So the compliance tests pass in both el1 and el2, however, if I attempt to =
play
a video in totem, and then skip forward in it some random amount of time, t=
otem
freezes and I get the following splat:

[  143.388380] arm-smmu 15000000.iommu: Unhandled context fault: fsr=3D0x40=
2, iova=3D0xd516d400, fsynr=3D0x600002, cbfrsynra=3D0x2a00, cb=3D6
[  143.388390] arm-smmu 15000000.iommu: FSR    =3D 00000402 [Format=3D2 TF]=
, SID=3D0x2a00
[  143.388392] arm-smmu 15000000.iommu: FSYNR0 =3D 00600002 [S1CBNDX=3D96 P=
LVL=3D2]
[  143.388423] qcom-iris aa00000.video-codec: sys error (type: 1, session i=
d:ff, data1:1, data2:deadbead)
[  145.913827] qcom-iris aa00000.video-codec: session error for command: 0,=
 event id:1004, session id:e39bc002
[  146.945692] qcom-iris aa00000.video-codec: session error for command: 0,=
 event id:1004, session id:e39bc002
[  147.969651] qcom-iris aa00000.video-codec: session error for command: 0,=
 event id:1004, session id:e39bc002
[  147.969693] qcom-iris aa00000.video-codec: session error for command: 0,=
 event id:1004, session id:e39bc002
[  147.970493] qcom-iris aa00000.video-codec: session error for command: 0,=
 event id:1004, session id:e39bc002
[  148.993683] ------------[ cut here ]------------
[  148.993695] WARNING: drivers/media/common/videobuf2/videobuf2-core.c:182=
7 at vb2_start_streaming+0xe0/0x17c [videobuf2_common], CPU#3: totem/7330
[  148.993727] Modules linked in: michael_mic uhid
[  148.993732] qcom-iris aa00000.video-codec: session error for command: 0,=
 event id:1004, session id:e39bc002
[  148.993736]  algif_hash
[  148.993739]  algif_skcipher af_alg snd_soc_wsa883x q6prm_clocks q6apm_lp=
ass_dais q6apm_dai snd_q6dsp_common q6prm overlay zram lz4hc_compress zsmal=
loc lz4_compress binfmt_misc qrtr_mhi ath11k_pci ath11k mac80211 libarc4 sh=
a256 cfg80211 mhi hci_uart btqca btbcm bluetooth ecdh_generic ecc rfkill qc=
om_spmi_temp_alarm snd_soc_sc8280xp lenovo_thinkpad_t14s snd_soc_qcom_sdw s=
nd_soc_qcom_common sparse_keymap qcom_spmi_adc_tm5 qcom_spmi_adc5 qcom_vadc=
_common ov5675 snd_soc_hdmi_codec qcom_camss qcom_iris videobuf2_dma_contig=
 videobuf2_dma_sg v4l2_mem2mem snd_soc_wcd938x videobuf2_memops videobuf2_v=
4l2 v4l2_fwnode videobuf2_common v4l2_async snd_soc_lpass_rx_macro snd_soc_=
lpass_tx_macro snd_soc_lpass_wsa_macro snd_soc_lpass_va_macro snd_soc_wcd93=
8x_sdw regmap_sdw snd_soc_wcd_mbhc videodev snd_soc_wcd_common soundwire_qc=
om snd_q6apm snd_soc_wcd_classh snd_soc_lpass_macro_common mc snd_soc_core =
snd_compress snd_pcm_dmaengine snd_pcm fastrpc slimbus pci_pwrctrl_pwrseq s=
nd_timer qcom_rng snd soundcore soundwire_bus fuse nfnetlink
[  148.993936]  ipv6 btrfs xor xor_neon raid6_pq zstd_compress panel_edp hi=
d_multitouch qcom_pm8008_regulator nvme ucsi_glink pmic_glink_altmode qcom_=
battmgr aux_hpd_bridge typec_ucsi nvme_core qcom_pm8008 i2c_hid_of_elan i2c=
_hid_of rpmsg_ctrl apr i2c_hid rpmsg_char qrtr_smd qcom_pd_mapper msm ubwc_=
config ocmem drm_gpuvm drm_exec gpu_sched drm_display_helper phy_qcom_qmp_c=
ombo cec leds_qcom_lpg aux_bridge drm_dp_aux_bus led_class_multicolor qcom_=
pbs rtc_pm8xxx qcom_pon qcom_stats dispcc_sc8280xp drm_client_lib phy_qcom_=
edp camcc_sc8280xp i2c_qcom_cci i2c_qcom_geni drm_kms_helper phy_qcom_qmp_u=
sb qcom_refgen_regulator videocc_sm8350 llcc_qcom drm icc_bwmon phy_qcom_sn=
ps_femto_v2 gpi gpucc_sc8280xp qrtr qcom_q6v5_pas qcom_pil_info qcom_common=
 qcom_glink_smem lpasscc_sc8280xp pinctrl_sc8280xp_lpass_lpi pinctrl_lpass_=
lpi qcom_q6v5 pmic_glink qcom_sysmon gpio_sbu_mux phy_qcom_qmp_pcie mdt_loa=
der pdr_interface qcom_wdt icc_osm_l3 qcom_pdr_msg pwrseq_qcom_wcn typec qm=
i_helpers pwrseq_core socinfo pwm_bl backlight
[  148.994147] CPU: 3 UID: 1000 PID: 7330 Comm: totem Not tainted 6.19.10 #=
2 PREEMPT
[  148.994155] Hardware name: LENOVO 21BX0015US/21BX0015US, BIOS N3HET94W (=
1.66 ) 09/15/2025
[  148.994160] pstate: 80401005 (Nzcv daif +PAN -UAO -TCO -DIT +SSBS BTYPE=
=3D--)
[  148.994166] pc : vb2_start_streaming+0xe0/0x17c [videobuf2_common]
[  148.994178] lr : vb2_start_streaming+0x70/0x17c [videobuf2_common]
[  148.994187] sp : ffff80009b95bb70
[  148.994191] x29: ffff80009b95bb70 x28: 0000000000000001 x27: ffff80009b9=
5bce8
[  148.994201] x26: 0000000000000000 x25: 0000000000000000 x24: ffffd3da978=
2e138
[  148.994211] x23: ffff0000902f5cc0 x22: 0000000040045612 x21: ffff0000f7a=
da910
[  148.994219] x20: ffff0000f7ada928 x19: 00000000fffffff0 x18: 00000000000=
00000
[  148.994228] x17: 0000000000000000 x16: ffffd3daf7056f00 x15: 0000ffff180=
2f330
[  148.994237] x14: 0000000000000000 x13: 0000000000000000 x12: 00000000000=
00000
[  148.994246] x11: 0000000000000000 x10: 0000000000000000 x9 : 00000000000=
00035
[  148.994255] x8 : ffff80009b95bd68 x7 : ffffd3da976bafc0 x6 : 00000000000=
00012
[  148.994263] x5 : ffff0000f7ada948 x4 : 0000000000000000 x3 : 00000000000=
00005
[  148.994272] x2 : ffff0000c1b82080 x1 : ffff0000c1b82080 x0 : ffff0000845=
17a30
[  148.994282] Call trace:
[  148.994285]  vb2_start_streaming+0xe0/0x17c [videobuf2_common] (P)
[  148.994298]  vb2_core_streamon+0xd8/0x1bc [videobuf2_common]
[  148.994308]  vb2_streamon+0x18/0x60 [videobuf2_v4l2]
[  148.994318]  v4l2_m2m_ioctl_streamon+0x5c/0xa0 [v4l2_mem2mem]
[  148.994330]  v4l_streamon+0x24/0x30 [videodev]
[  148.994362]  __video_do_ioctl+0x340/0x3ec [videodev]
[  148.994389]  video_usercopy+0x2b0/0x74c [videodev]
[  148.994415]  video_ioctl2+0x18/0x34 [videodev]
[  148.994441]  v4l2_ioctl+0x40/0x60 [videodev]
[  148.994467]  __arm64_sys_ioctl+0xa4/0xf4
[  148.994480]  invoke_syscall.constprop.0+0x40/0xf0
[  148.994495]  el0_svc_common.constprop.0+0x38/0xd8
[  148.994504]  do_el0_svc+0x1c/0x28
[  148.994513]  el0_svc+0x34/0x104
[  148.994525]  el0t_64_sync_handler+0xa0/0xe4
[  148.994534]  el0t_64_sync+0x198/0x19c
[  148.994543] ---[ end trace 0000000000000000 ]---


This is much better than the previous venus patchset where accessing the
hardware decoding would cause the machine to hard reset at least!


-- steev

