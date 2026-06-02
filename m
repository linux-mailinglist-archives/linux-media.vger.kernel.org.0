Return-Path: <linux-media+bounces-63351-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHbcFlyYHmoAlQkAu9opvQ
	(envelope-from <linux-media+bounces-63351-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 10:46:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B8762ACEF
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 10:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 561633018A06
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 08:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A1E2F1FEC;
	Tue,  2 Jun 2026 08:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W57rs4Hd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE84B3C7DE1
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 08:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389567; cv=none; b=KPG0Txg8N6wm+cgHRT/eSluf95tAVKMGI0PYS8MJ6qDnKJ4rH11B3rfRlA3nef2ae4/mjf7fPp2rLnKJ8+B2vd7COYexPDDR5475BIgz8RucE7KMaUOI9uUuLFCKY0GrK2fgI6SyQK3qp8zB1qn9HJeHXfc+yJ9caxMMhiLULo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389567; c=relaxed/simple;
	bh=xT5r9NVgkYEKWh1xLMKUKVZxO/Wb2whTO/28uxl7euc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LTIjE/UG63GUYv4945Z5stBLdYefxnVUAdTKDCz1cKJiW3ys6Du3QLtl3sLkrJmhoiRGiDpOZCkMU95ePNeYmeBfLWxyZQhIfLCMPYGUARJgyjFw2J8OAJKaGPxFHerZH5BjkKeUScuqIqF3Dr7KuRIPfDuemG80vc9wy5Fic6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W57rs4Hd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b09e4cccso5789165e9.0
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 01:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780389561; x=1780994361; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1PvSRBWue+3kavTB/dmduj5HlWrKGAmUTCoEl/I0Lak=;
        b=W57rs4Hd94mpzEuiQR5qnoTJv7mPCoXEIHGyUFJfxsgDQ8VKNP50lwP/zhwVnhHxlI
         2gKCd5+RspzINWm84GLIhp9uGjVl7O17DKcMD6M2+rjvAygI5wxxQYtZgwODSDbwFJQm
         2fJxlz3wX5OygFV3PztCD+DYw0wWlAAugo5ix6/LYCb/C1B3gKaqy9yVnsbJZLjXI/48
         VQiacJElAe7NXYpwURgzh8XgC7G8NoLpGOoKuoIylhF9WrEVRqrCTuhvxI+eXyiKVjs6
         JYFUt5X/QBch62GMzEWSaHFOFGAu3xyUQDZ5CHWSmrmvXDlFRtVoZx3mN5ECT4hq/Yfd
         gByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780389561; x=1780994361;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PvSRBWue+3kavTB/dmduj5HlWrKGAmUTCoEl/I0Lak=;
        b=AnBDud8Uy+N2Fchiv+WA7XwqEGFBs1DsFstIz9uFGNjtnZyTbVLbUUOoN6Ezxd+Ygu
         Lphi3DOt6t22QDlnc0YDBuwBNUZ+QlcV+N6o4eosPAICtbS/5K7FjE962oSVwUK1pVUo
         bMRK3KOd8mbZ87hiQNFNFBUSCCbueVSMNjCOeFHd6gbIrDDDky5EESIS/h42xwXbkyyI
         V/0IRKxz5/646kxA/a8mk2U0+Q56dzSkH5Fifa6EvcZIwXb84xC+1/H1EYi4ZrgrpOXw
         ACsOJv+2YdFlrmZ4NPaAjnqt4MOsC8fXTnh3w2KRCFQdWHAunIpDaTQmRrwgUIiqtRnu
         1cJw==
X-Gm-Message-State: AOJu0Ywugfs7zoFsRG8FNQWLqL7bqzjf9j2YrD6yeMmN4TmXHLi4Tdgz
	sT/RiwxuUoCmy0k6akAE7Hx2X1KcqY2HgQJXCEHZCTPRzeYCkCmHGg224Z4tZndwJL27i1uYviG
	wYWh4
X-Gm-Gg: Acq92OFR0CJCjcn0qE3YraMOQZgtjjxAKig56bKvTC/M0OSd6x3hJ7zvqnhakad54GP
	RqY3wH1k7mNJn4dso0+KR1doqjJxpDlOKUZ+RM3/SDY+GMw9PABa1oQWHa4AkqXWJVzL6xz68rL
	eSROczEZx6ZPt+3Y0piDHLWkVzyWnGo5XykSMsX/gLj1vnDaiOV0sSShqqNBByoabg3wHbeCQp8
	qvCS9TCHEh4L+O9I270DIwuEgHWUIoHNjSRWFj8qySvu8+KzKzlvH1hiAyzg0AruPYRNlrdNlr6
	pLe66hcAuWz3Gwerb7eey9JjiRl/fsU2WU4OKKjxbGvNDQ5ePwlwA6I1ZY2a3uFUT5uUZpaJiyA
	DYjecRvs2q4fepP12hQDYiqd88SeGIhL0dHiBNoJC+Zw8c+qDZBF1rPfC+5+RTFhK3s0ArUylme
	CALLAtQmKVRhn4IXsSwhnHakWb0oklpyNR1ljtCuasji7Auxy21Jk17M8=
X-Received: by 2002:a05:600c:a111:b0:490:389:7644 with SMTP id 5b1f17b1804b1-490a292fdd1mr201164935e9.17.1780389561017;
        Tue, 02 Jun 2026 01:39:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e26050sm43879425e9.9.2026.06.02.01.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:39:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v5 0/6] media: qcom: iris: add support for decoding 10bit
 formats
Date: Tue, 02 Jun 2026 10:39:15 +0200
Message-Id: <20260602-topic-sm8x50-iris-10bit-decoding-v5-0-c2b32474ed67@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALOWHmoC/5XPTW7CMBAF4Ksgr+tq/IftrnqPikUyscMgGiM7j
 UAod68DC6jYpMsnPX1v5spKyBQK+9hcWQ4TFUpDDeZtw3DfDH3g1NXMJMgtaHB8TCdCXr7d2QC
 nTIULaGnkXcDU0dBzsBpVg9Zbg6wypxwinW8TX7t7Lj/tIeC4uEtjT2VM+XK7YRJL7x9zk+DAt
 XQoAsqgovo80tDk9J5yz5a9ST6Jwq4QZRXRO9tuTaNEZ15E9RCNECtEVUUbEbRvvQItX0T9JMo
 1oq6ii9FFrD970H/EeZ5/Ae+Sze7ZAQAA
X-Change-ID: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Wangao Wang <wangao.wang@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=11376;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xT5r9NVgkYEKWh1xLMKUKVZxO/Wb2whTO/28uxl7euc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqHpa1zHrQF/MygRSaqOCwXHg7ggAMaUfQCMIMbgww
 QOQCvKKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCah6WtQAKCRB33NvayMhJ0W6LEA
 CmpYMQJ/WBoxhSmaMnqzeJvG3o7xkfkB1K3oYH0bhwIwkfoTYcaISaRUJtnV+10vUsyvBLeYOnQx+J
 Xv0Jy2JlNgPd07Iu9mtw3YU7MnSuD+SgtvIiL9urnOWUYvxasO4fYT7wXhywj7stN0qyl3VnWzUADW
 oaFIPldxlufsu82YuXnl3E4WkeGJGhp9trdmOOUPfUmOBg3TyqxZ3LCY0DrXZaP4JyXngsWG5mIUlV
 38eNb4nLM+jOtwjbShIlraqB/NWrYkhrbchhDrg7XnSNEgEqdxukaD2LBjHfKBa46oTUkkuf1RPIe3
 OxO5FSUGF3X7iuh9lIBeg0CoICHeROxrPecYVrLAU8OE9hrwXgjVNbt5js/l08ZXvKPw78sYVLSKv+
 Wu0k23AQhqOooehAofPURUbpzp2twMframkxzJrNYDFT/7tUb/kcgYC9nnVyjebiDBWBwIW0QmcPh8
 wemrUHSli9zsva3MwmI7MHQwgCLNB94UBlpHJumWa6Y+f9/mwRST/6TrqPonUcS8Mefgai1UyKK9Iq
 38S2WLcrLL8MOUyZArErLbV5rcS8G3EU6ySzJE21qdlrrfttoIlurfPTddd0/Q6hFStsyeHBrdygfo
 9KM7GWW3r4CbcLLOHuVioF+TctUwRtC8nizCy4bXiVjGFfJUbtztxOUjR38w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-63351-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:mid,linaro.org:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,msgid.link:url,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 57B8762ACEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This adds the plumbing to support decoding HEVC, VP9 and AV1
streams into 10bit pixel formats, linear and compressed.

This has only been tested on SM8550 & SM8650 with HEVC, and was
inspired by Venus, DRM MSM and the downstream vidc driver for the
buffer calculations and HFI messages.

Gstreamer support for QC08 and QC10 need the MR at [1] to be applied,
but NV12 and P010 works out of the box with mainline Gstreamer.

Fluster HEVC results on SM8650 using Gstreamer:

./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 141/147
The failing test case:
- Pixel Format mismatch
 - TSUNEQBD_A_MAIN10_Technicolor_2 - Gstreamer waits NV12 but decoder returns P010
- Unsupported resolution
 - PICSIZE_A_Bossen_1 - resolution is higher than max supported
 - PICSIZE_B_Bossen_1 - resolution is higher than max supported
 - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
 - WPP_D_ericsson_MAIN10_2 - resolution is lower than min supported
- CRC mismatch
 - RAP_A_docomo_6

v4l2-compliance results on SM8550 & SM8650:

$ v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.33.0-5456, 64 bits, 64-bit time_t
v4l2-compliance SHA: 8aa593bda182 2026-04-11 10:54:25

Compliance test for iris_driver device /dev/video1:

Driver Info:
	Driver name      : iris_driver
	Card type        : Iris Encoder
	Bus info         : platform:aa00000.video-codec
	Driver version   : 7.0.0
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
	test second /dev/video1 open: OK
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
	Standard Controls: 43 Private Controls: 0

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

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	Video Capture Multiplanar: Captured 61 buffers    
	test MMAP (select, REQBUFS): OK
	Video Capture Multiplanar: Captured 61 buffers    
	test MMAP (epoll, REQBUFS): OK
	Video Capture Multiplanar: Captured 61 buffers    
	test MMAP (select, CREATE_BUFS): OK
	Video Capture Multiplanar: Captured 61 buffers    
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0

$ v4l2-compliance -d /dev/video0 -s5 --stream-from=test_video_10s.h264
v4l2-compliance 1.33.0-5456, 64 bits, 64-bit time_t
v4l2-compliance SHA: 8aa593bda182 2026-04-11 10:54:25

Compliance test for iris_driver device /dev/video0:

Driver Info:
	Driver name      : iris_driver
	Card type        : Iris Decoder
	Bus info         : platform:aa00000.video-codec
	Driver version   : 7.0.0
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
	Standard Controls: 12 Private Controls: 0

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

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
the input file is smaller than 7077888 bytes
	Video Capture Multiplanar: Captured 601 buffers   
	test MMAP (select, REQBUFS): OK
the input file is smaller than 7077888 bytes
	Video Capture Multiplanar: Captured 601 buffers   
	test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
	Video Capture Multiplanar: Captured 601 buffers   
	test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
	Video Capture Multiplanar: Captured 601 buffers   
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8195

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v5:
- Collected all review and test tags
- Rebased on https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/tree/next-smoketest
- Fixed rebase conflicts on patch 5 & 6 and tested for no regression
- Link to v4: https://patch.msgid.link/20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org

Changes in v4:
- Picked review tags
- Use u32 instead of __u32
- Explicit DPB
- Drop NULL and use >>1 in q10c buffer calc
- Drop selicolon after switch statementr
- Correctly align HFI_PROP_UBWC_STRIDE_SCANLINE entry
- Rebase on media next tree after the file split
- Link to v3: https://patch.msgid.link/20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org

Changes in v3:
- Added review tag on patch 1
- Limited stride command to AV1 decoding only
- Link to v2: https://patch.msgid.link/20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org

Changes in v2:
- Fixed bug breaking 8bit decoding
- Dropped filtering on G_FMT while waiting for soure change
- Dropped format filtering on ENUMFMT
- Switched ALIGN(x, 192) to roundup(x, 192) because ALIGN works only with Power Of Two numbers
- Cleaned and refactors the width/height/stride calculations
- Cleaned and redesigned the buffer calculations functions with proper comments and var names
- Passed fluster and v4l2-compliance to check for non regression
- Tested on SM8550
- Added missing V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10 with made gstreamer fail decoding
- Link to v1: https://patch.msgid.link/20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org

---
Neil Armstrong (6):
      media: qcom: iris: add helpers for 8bit and 10bit formats
      media: qcom: iris: add QC10C & P010 buffer size calculations
      media: qcom: iris: gen2: add support for 10bit decoding
      media: qcom: iris: vdec: update size and stride calculations for 10bit formats
      media: qcom: iris: vdec: update find_format to handle 8bit and 10bit formats
      media: qcom: iris: vdec: allow GEN2 decoding into 10bit format

 drivers/media/platform/qcom/iris/iris_buffer.c     | 195 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |   8 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  75 +++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  37 +++-
 drivers/media/platform/qcom/iris/iris_instance.h   |   2 +
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 drivers/media/platform/qcom/iris/iris_utils.c      |  16 +-
 drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
 drivers/media/platform/qcom/iris/iris_vdec.c       |  43 ++++-
 10 files changed, 363 insertions(+), 17 deletions(-)
---
base-commit: a8498730d17490930991076d00eed85827d2beb1
change-id: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


