Return-Path: <linux-media+bounces-58983-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GxiDO0A4mna0QAAu9opvQ
	(envelope-from <linux-media+bounces-58983-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 11:44:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9344197CF
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 11:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0869D308E05A
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 09:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267893B388D;
	Fri, 17 Apr 2026 09:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J4DjKAwF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819953803D9
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 09:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776418672; cv=none; b=Ox0B8JATJ+KJkkLmm7DSipBfgHmiMo8Ko7xZQf9f3X231CdTl67kpgV2vrr4GAFiXAN6wcThwxILiLZhgRhAWQu1Hbgr5nVnNTqI5CBqqHLjxPJlh9FSAxFFBLvPogD06O9kciHuCtaQZDsGbgVIDD9qv2OfR4CW5IhBCfUzKfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776418672; c=relaxed/simple;
	bh=5iEW2F0Rv3S808BfkCqFKmTGD2r8AlTHE8RkeiLex/o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XPcXYjij0kWJSTdGLdcjswB6ODIi9mokDva+B5e6naqf5pr8bEUCOWq4iyAYLYZ6s2hW6aiTSpqTX/KvUYc95/CqcvOlMPrF5psQL+Qg3QfT+USmj8ub8DSWeak0AoSCWmxPRj7KEIavnWCp2oYxC4DfbCKhmssBySgmnSd1n7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J4DjKAwF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b8efed61so5242785e9.1
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 02:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776418669; x=1777023469; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=983vGdgApwdg5HCBHVzB/G7ynUQFaPFLHovgXZ3/LPk=;
        b=J4DjKAwFf4V5xw5UwwLNduGy6W7p6XK5shxoqB+4qJraosRs6U6r1Kep5tgT8NcxG8
         9JveryPTpp6+2IX0TAKJq8k3kD9eUxi7cHxn/gnDPcHVExUHdLDrCPhmIOqXTloZ8zuS
         l+bocLkktzDhBCfYZjzM/6JOu9TQ13RSlLumAEdBJVbzZhjrO/arr5UgM3aYn3qBV7gW
         OQKiecRy42nm0rD4kL+Rin78AkowJtKJHokAEcd7G6/zxFWyn5ASLesYgD2/TmQ7EpFe
         TFWSNE8Xf5ZtY/0W9m+Xe0/qhrZx2YtRA1iG9XIP9lpRYD3uMOqaTQe3D1pdJN4rv2Qc
         PN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776418669; x=1777023469;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=983vGdgApwdg5HCBHVzB/G7ynUQFaPFLHovgXZ3/LPk=;
        b=I140TXEGoa8v+tMt0jl3VBmf35QHGHcttZIXxF6kwXfoOxVBbCQ6xddTYUW0D3bvJJ
         LbPLf7rUAevqtSjhY2qYQkOuaojXkGqbFzJ7fUuOy7FwV6l385/LJPBuM+TNhZ4P0Ax6
         JCHZ0wYaqEvBMLG1KC6MKX3G4NHCX0v/hSf/HHPn9uJ2URACHD2ZKPhmjwFjZm+kFggn
         3w2AcGd8jZ0lxuQSI1oD/0+IJ29iR1eYsiQnsKOeFqPDFTkdQj04I+Na9N77+6s29l6k
         livNeHLxPFkbOJ+fbXdfWJlaaWGDmYta/N6zfwy22UhD1J9MW7DnzBQbUQ3TzFC3aWtr
         tUnQ==
X-Gm-Message-State: AOJu0YxoP0gxrrBwgCxwazSeBNtVSM3zQDbN3E9l8g7U9c1o496Yu1QH
	l5xkuKKMoIwyGsp7ikeSkSxCDfEd3TncAbUpfm45l1glcerNxzZO001hUfVpzBAYF6c=
X-Gm-Gg: AeBDietkm3dtQTMEZF44NTJuMs0RcXfXuh3pk+9pqllbkNcnH0dhlLleYJFLb109pJz
	87RvkGQlNdo4tFbFVp0i7IYaZeQkTTtbvhbmC9wgvBF4tVwMYnmZBLm+uwqBqiQ6E+QeNkhjBzF
	Mqlmn/Adt4sndqvrm8OWivUSXBCVoTHN99pxKb05vrHsqF/dQy7L4Xb52dBXJTDjGwyaIKuNaVd
	8jAaLLJ9eIznNjLkt6QQouWZonIHMAYyOqNBgB5FziGBw7iZ97gGgN9mH48Qx81GL9P7rvoRY0T
	7f2H0OtVK6K/q9ks3qDGKOBBcL6fKdYPX4p5STxwaDiXHXn2jaivV7oRutlz1cwjQ1t9+dQtHrE
	hGQe3kO3TEJmwi+gxOK2FOmZpK26Ca+tytoq0uIR4BrS3hMzx7FK7cYvDJ+gOgmfQT5/J+nzQXJ
	ne7JzRwGEIiTRdlEsciA5kBAJMew93WksRhu5Awl8jHxBZ1SJDCjvOL9o=
X-Received: by 2002:a05:600c:c112:b0:486:fe83:861c with SMTP id 5b1f17b1804b1-488fb896910mr20987465e9.7.1776418668644;
        Fri, 17 Apr 2026 02:37:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7b2634sm12915435e9.28.2026.04.17.02.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 02:37:48 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/6] media: qcom: iris: add support for decoding 10bit
 formats
Date: Fri, 17 Apr 2026 11:37:40 +0200
Message-Id: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGT/4WkC/5WOQQ6CMBBFr2Jm7Zi2gKAr72FYwDDAGG1JWwmGc
 HcBT+DyJS///RkCe+EA18MMnkcJ4uwK5ngA6ivbMUqzMhhlzipVBUY3CGF4FVOmULwE1KqWiA2
 Ta8R2qPKUkoryS54RrDOD51amPXEvfxze9YMpbrub0UuIzn/2D6PevD9yo0aFqSlIMxlO2uT2F
 Ft5d3K+g3JZli9rMMyL4wAAAA==
X-Change-ID: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=11345;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=5iEW2F0Rv3S808BfkCqFKmTGD2r8AlTHE8RkeiLex/o=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp4f9oNuJZR7aXEjeCljZlpiTmazhRzVkjgs0C5OXO
 Kp2vtfWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaeH/aAAKCRB33NvayMhJ0TWfD/
 kBItqfKvdqvUlCTdlVjFxUg/jF+HUqESRvhC7PffrkJiAn6FuPZAYpYzmLAi/xJbkzKbin45yzyd5W
 XimCsvxzinMyphXlAIiFrbUAMAXM47Jw4CXnR+XFMT68PAd5XawS+/h/RTvhpn5YQFzMJisX7Wyr1Z
 phJdIeEXRxBa4Q6SxibwN/bs8/FoIk4X7ybW190APVMn8b7eH73BELErKa9hq0PWxaCLCkCr1jBLHp
 EI9USvhfQLPjWuAL0P+m2/RXyA6/v0gUQiM7VabUbLNYntSOFwO33FsQginsyS/5IjgWByEeGX06Xk
 bcTrNp3JWCGRfaKCu+Vx7kNEDPT9OznxUnW1KgtVjra+c8BpXwz0Yk1rclWCPObQPL788myy2GmARW
 O+rxaag3zr0qRftfF6Ud1LA1777zXtMgFv+C0JJeJTJxdseZIrTPuQ2et8KrvCDTOGnCvyuMufFsY2
 qGgKKhQkRRPOafUhxyshFG3e43FuKHoPcSHBb57fsyR1WXaAf521k58Fi9nzRKW7OeFea6nhocED5j
 /mebRZkbbCg4afzz+dxWd0iNT464UH87eX8x7f1lQfIKCVTyZOCbTp96dbc39wfxxP1hJ591/tyYfB
 mwxR6FkW8iGHIVJm/yaD4hrQkPDZmjcVTrWrrsjWgt9m+llTaZa4oqvnqUig==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58983-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BA9344197CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This adds the plumbing to support decoding HEVC, VP9 and AV1
streams into 10bit pixel formats, linear and compressed.

This has only been tested on SM8550 & SM8650 with HEVC, and was
inspired by Venus, DRM MSM and the downstream vidc driver for the
buffer calculations and HFI messages.

I was unable to get 10bit decoding working with ffmpeg since P010
support for v4l2 decoding is missing, but v4l2-ctl works with:
v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=P010 --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.P010
v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=Q10C --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.QC10

The non-10bit decoding still works as before.

With Big_Buck_Bunny_1080_10s_30MB reencoded in 10-bit profile
and tranformed in v4l2 header format with [1]:
ffmpeg -i Big_Buck_Bunny_1080_10s_30MB.h264 -pix_fmt yuv420p10le -c:v libx265 -crf 28 -x265-params profile=main10 Big_Buck_Bunny_1080_10s_30MB_main10.h265
/path/to/mkhdr.sh Big_Buck_Bunny_1080_10s_30MB_main10.h265 raw Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr

Fluster HEVC results on SM8650:

./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 131/147
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
- CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as well
 - VPSSPSPPS_A_MainConcept_1

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

[1] https://github.com/superna9999/pyv4l2compliance

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
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
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  71 +++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  37 +++-
 drivers/media/platform/qcom/iris/iris_instance.h   |   2 +
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  |   8 +-
 drivers/media/platform/qcom/iris/iris_utils.c      |  16 +-
 drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
 drivers/media/platform/qcom/iris/iris_vdec.c       |  42 ++++-
 10 files changed, 360 insertions(+), 15 deletions(-)
---
base-commit: cac3ec101ba14f040f966d2464c60f9c0f92ec47
change-id: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


