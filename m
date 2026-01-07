Return-Path: <linux-media+bounces-50171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D60D0003E
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 21:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52B3F302EA32
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 20:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E39833858A;
	Wed,  7 Jan 2026 20:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ow/GNDmI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LNby6tTm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB543242B3
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 20:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767817250; cv=none; b=kXjc2bHGavwOvgi0EqbJdCjAXkP8AMyzHUf2yVVrxq0QCHY+3OT8entImtkegcQogRSYAfm5znQ2kVnRVbrgFQjHkXUhgWGQWdgxLbmdyxvPwLBx+NlFmjaflb+zyqKG+zYpioGMS9bbuVPsclsF47weOqOnCSW+JfeAjiyQNt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767817250; c=relaxed/simple;
	bh=rLPrXXCAfPuxBdsZLfAjGLBukOgQ/2Vnohj8QX9MIIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jl/790R+Jgdd1o4KfOhupBMzaQ23aDFKDjBST+VwIZLU1fNIcd/IY8ixzRihn4TP9uOC9L+i6vR6rqkzTCkwgf97+dw1F9z7AJfQsA+XIuh2pG4DglCNyp9cfTmy8jntaJpb22/KsdG6J7nOZ9M89KsXx1Rnnvnm0fyV4/Dm8zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ow/GNDmI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LNby6tTm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607HTVw83751446
	for <linux-media@vger.kernel.org>; Wed, 7 Jan 2026 20:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0q1tSYi01Szo+sCxsmBIBI
	NfduOF7aVAMx4jRc7JOVY=; b=Ow/GNDmIZJxqJSAmqnfzpd2RTp65LXRSn6ibBC
	gVwaOPl36I7ECp8j0CHHaFrEky54URq+YwRlffFd3wUWGgyekRlDrtgpSWvTE1Da
	yhdQKBma48X2zYVF+4PBzH4IY0eWBFUcs+9rA2Hw48PVNzfZHDzrcaLXMShVJTr+
	lpN5vTHeKmd1zdZtVO2C/tYicBf+SVmaKY/rd9A0Wjab3zc1mfbgnGzLSiDJ0dvU
	H2gn7GLeQ7dvWEWBliOBblb9SQ3J4X0QtTwUzvF3Isc49QVg8Nr1N2bZBLQsrPKn
	yvDEUYgoy/AR7GmUwhlXRxuJS7jYI6KISDuMt+kwWrfv87gw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuxcrj2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 20:20:44 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-11f46b444d9so231344c88.2
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 12:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767817244; x=1768422044; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0q1tSYi01Szo+sCxsmBIBINfduOF7aVAMx4jRc7JOVY=;
        b=LNby6tTmRpV7+2Cj2fjFIM7W2IJi41+1zl0gq5SclJrZxVx4hvlK22laSWatW5McQN
         vkykXwcu/H9E0wGx5IHW72DVejfhAFr2sPc6aHFcqbnkL3mgIl2DXzY8JohkZNISXQOg
         ZvjvZ/B+52EtO6uhz+Ls7D4I7g9J48enmX2a195X0ggeXdgxcE5xRCljHiGpDynFgSaP
         1EeeUuGqtE9YZf0gFHZolf99qbM99ngDpuoPjP2UbynDQj3QlfRYo9bQguOC8VImMM3j
         Fs6h8OPCN636b/fVDZh9jgw75aEA2yiE5J8crReydR5goouf7JaEMkzhENdUkGir12Z2
         8pDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767817244; x=1768422044;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0q1tSYi01Szo+sCxsmBIBINfduOF7aVAMx4jRc7JOVY=;
        b=brnHWUuZRWhy/9L6sxqDVJ8VH6mF0zSjWA/8flxvYjkxlBCs9i5uZ6enuete4BS3S/
         JTLq8jN2qMe3zASQp83wkJUVz5iclrm9eSDQPJxYDgXgiX2Dff2SNBMA91cwwyW01qIf
         ZUhPfjcAiSCKVrIv02PjPMzg/ey7hmPhUPpvCKmOOaf9Ib8W94AeiS11dW6f/O1gE2Jf
         ls+yPaIUebHJC27Bvt311bYMF+R2OUsDj4FY44otx3NIZt/FxZQ+AxFejbOZhBPpBsCb
         7QJXamUTyYd3vs7MP+ddredZD9wfew5nndtugLFVIUk1UCSnKNIEY+Q6SB7PejR4TApP
         yWCQ==
X-Gm-Message-State: AOJu0YxJfkACwsT/a6lh9x5ATwdVNFeA/SYYYKEiRiRplISIWIzd9Kjc
	rTsYY6s+8OPcdCjjfiwf2VzQPKK9v7w+ecCB/32sEc+oZ5zf6+zfYWkQbkdaKyxZC2X6kE/dxdn
	b0nIg8SpGlLr2aHsqsqhWh1QrQGIrX/CBcWgCYeZgFfGjvS+e/iv5QJmUthMB3hhdbzxJv6hUpw
	==
X-Gm-Gg: AY/fxX5NPyf0o4DgGwyQtYI2AVaQZBgpta+9VGYqgFq/Rbm3Q6VWqTDHhuy6C6CVQKA
	apwP7R7YokZNtGYFG/sGOjyZ9z1U8w6bWhW3ENORSUlSEmFqra92BXn93KAGEH8Tb2sjfB+lEof
	Yir1hyuu9gSvGzzzA2iVjG2Et/xbGPMiVMbtEDkGBDyqtvqYOJoMbmRl+4D5DjQiplAqgVmzqOD
	ZxvkbpGadd+Vw7QBYUwWab416hex4bTgBjdurlarobk6qMprWyUkDqx/GTQcGO9I1du/hrXN4Ke
	dUwI8xXIEzj/HmaYVrBeUuIJDNWg2EWjso5in4Rm+B4MEqTXDc/NPvb/lV0aE5Zxlyw9ysJaJec
	641TMiQ5g2pGtTD5GdPImFqnKnMZG/Dq8mPQnuqMTtfoxTIo5/emFJk9pfAaKX0PNZ2qvsw==
X-Received: by 2002:a05:693c:401b:b0:2ac:19ac:ba3e with SMTP id 5a478bee46e88-2b17d3538f5mr1198707eec.9.1767817243412;
        Wed, 07 Jan 2026 12:20:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDoBTHSUIdsDaR06jl79egNUHwkgEhrQyyas36tn5/eSnmhuG9GcB06jP/Cur0OJKkjtjcZg==
X-Received: by 2002:a05:693c:401b:b0:2ac:19ac:ba3e with SMTP id 5a478bee46e88-2b17d3538f5mr1198686eec.9.1767817242697;
        Wed, 07 Jan 2026 12:20:42 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078dd8fsm8697098eec.20.2026.01.07.12.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 12:20:42 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 12:20:39 -0800
Subject: [PATCH v4l-utils] v4l-utils: Add support for AV1 stateful decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-av1_stateful-v1-1-a691013af2b7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABbAXmkC/x3M0QqEIBBA0V+JeU4YxTXqVyJCatodkApHJYj+P
 dnH83DvDUKRSWBobohUWPjYK3TbwPLz+5cUr9Vg0DjU2Clf9CzJJ9pyUGg/xmrnVuw7qMkZaeP
 rvxuh2KBy4iAwPc8L6vDUX2kAAAA=
X-Change-ID: 20260107-av1_stateful-04524166d097
To: linux-media@vger.kernel.org
Cc: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767817242; l=7488;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=rLPrXXCAfPuxBdsZLfAjGLBukOgQ/2Vnohj8QX9MIIs=;
 b=N7xuDjRzB85XNxQkGJxwBToH2DB1+I2lyUtURiaWhHKVPgePRrfRZZas9J/sXjTeKU7VBf2C5
 Z7yLMfyFaHLA+9euJNoTjssPuijApMKY4IB8NWiRZ+uFPkmkthcl9NB
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE2MSBTYWx0ZWRfXwqo/9A9coYYm
 Vl5f8CNXYtXDDQyBBblV99qm2F8CBv0QLtLOQu8i/4vWvWIkOxin1yspUyepHmDgjSQ0Rx5XwRa
 i2NVRiJPyVc8+8gnbyxXIyd1e+xLC4tk9/vphw3hUCOeqepyhas7fhU1acVDybbcucMz3G8j+s/
 dfumRPki1coLj7tmGxxoiFwKQ6wi7tRv9jjGroZTRVvw7nyDEQ1YftdM+9bGXpd5PusUCEQqWuk
 sxU0nID+JkBYLVm595mw2Nl5qvVfOT5xXnZETkw9n1KGj8tg/l5XjFZZgWn1smuZb7HHKopmwt8
 cMCc2aVeXXZflVZktSIkEiSk3AESPhTdybXjN51ypW/5pJPrPQ0j7OZewHz4UoDW0DJbbZog156
 Kc68T45YEs4/ZLuF339j705VWnVwsvxUCz6oT0A6QhpCuNd+yerPU4tmGUgTC0AnyTBX+ZFUiYl
 1T7ztrQxnYJNFEBrInA==
X-Proofpoint-ORIG-GUID: SWVKUQ39aQ2dEJEWEHW2Qem3TYuyzXFh
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=695ec01c cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jA7o2ZmO-xJa9xylZ4gA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: SWVKUQ39aQ2dEJEWEHW2Qem3TYuyzXFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070161

Introduce a new pixel format, V4L2_PIX_FMT_AV1, to the
V4l2 uapi. This format is intended for AV1
bitstreams in stateful decoding workflows.
The fourcc code 'AV10' is used to distinguish
this format from the existing V4L2_PIX_FMT_AV1_FRAME,
which is used for stateless AV1 decoder implementation

Add support for this in v4l2-compliance and v4l2-ctl.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
Compliance test for iris_driver device /dev/video0:

Driver Info:
		Driver name      : iris_driver
		Card type        : Iris Decoder
		Bus info         : platform:aa00000.video-codec
		Driver version   : 6.17.0
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
		test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not
Supported)
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
		test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not
Supported)
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

Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0,
Warnings: 0

V4l2-ctl Test verified for 2 streams as well.
---
 contrib/freebsd/include/linux/videodev2.h | 1 +
 include/linux/videodev2.h                 | 1 +
 utils/common/v4l2-pix-formats.h           | 1 +
 utils/v4l2-compliance/v4l2-compliance.cpp | 1 +
 utils/v4l2-tracer/v4l2-tracer-info-gen.h  | 1 +
 5 files changed, 5 insertions(+)

diff --git a/contrib/freebsd/include/linux/videodev2.h b/contrib/freebsd/include/linux/videodev2.h
index 0b1465842b3f0c0cfa7b6dd1802171c69b4753d0..6657998a11fdee9e1e3941d506a84f24ec2661a0 100644
--- a/contrib/freebsd/include/linux/videodev2.h
+++ b/contrib/freebsd/include/linux/videodev2.h
@@ -782,6 +782,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
 #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
 #define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* AV1 parsed frame */
+#define V4L2_PIX_FMT_AV1 v4l2_fourcc('A', 'V', '0', '1') /* AV1 */
 #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
 #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
 #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */
diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index a1f30e0382914801c56c0ffec3a90186721e9c95..2503003f8ee6a04acaa9b8e564be51fd86c7dc8f 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -751,6 +751,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
 #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
 #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */
+#define V4L2_PIX_FMT_AV1      v4l2_fourcc('A', 'V', '0', '1') /* AV1 (stateful) */
 
 /*  Vendor-specific formats   */
 #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1 YUV */
diff --git a/utils/common/v4l2-pix-formats.h b/utils/common/v4l2-pix-formats.h
index b0a7fe10bd5d439b2705da536ef4f80350dec353..135a06a8660f19e1787a00554dbc39eeb85b7091 100644
--- a/utils/common/v4l2-pix-formats.h
+++ b/utils/common/v4l2-pix-formats.h
@@ -260,6 +260,7 @@
 	case V4L2_PIX_FMT_QC10C: return "QCOM Compressed 10-bit Format";
 	case V4L2_PIX_FMT_AJPG: return "Aspeed JPEG";
 	case V4L2_PIX_FMT_AV1_FRAME: return "AV1 Frame";
+	case V4L2_PIX_FMT_AV1: return "AV1";
 	case V4L2_PIX_FMT_MT2110T: return "Mediatek 10bit Tile Mode";
 	case V4L2_PIX_FMT_MT2110R: return "Mediatek 10bit Raster Mode";
 	case V4L2_PIX_FMT_HEXTILE: return "Hextile Compressed Format";
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index b82d7dad326907d42edeb3d503cf4e6652fe9b6e..be0fd98537951485c61a1cd0df01ec0593eaf341 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -585,6 +585,7 @@ static void determine_codec_mask(struct node &node)
 			case V4L2_PIX_FMT_VP8:
 			case V4L2_PIX_FMT_VP9:
 			case V4L2_PIX_FMT_HEVC:
+			case V4L2_PIX_FMT_AV1:
 			case V4L2_PIX_FMT_FWHT:
 				mask |= STATEFUL_DECODER;
 				break;
diff --git a/utils/v4l2-tracer/v4l2-tracer-info-gen.h b/utils/v4l2-tracer/v4l2-tracer-info-gen.h
index b54ee579166c84c01403cd3f207f9a590ebd9e1c..bca4556edbd2dd0537b915dc62bade677fb80e41 100644
--- a/utils/v4l2-tracer/v4l2-tracer-info-gen.h
+++ b/utils/v4l2-tracer/v4l2-tracer-info-gen.h
@@ -1422,6 +1422,7 @@ constexpr val_def v4l2_pix_fmt_val_def[] = {
 	{ V4L2_PIX_FMT_H264_SLICE,	"V4L2_PIX_FMT_H264_SLICE" },
 	{ V4L2_PIX_FMT_HEVC_SLICE,	"V4L2_PIX_FMT_HEVC_SLICE" },
 	{ V4L2_PIX_FMT_AV1_FRAME,	"V4L2_PIX_FMT_AV1_FRAME" },
+	{ V4L2_PIX_FMT_AV1,	"V4L2_PIX_FMT_AV1" },
 	{ V4L2_PIX_FMT_SPK,	"V4L2_PIX_FMT_SPK" },
 	{ V4L2_PIX_FMT_RV30,	"V4L2_PIX_FMT_RV30" },
 	{ V4L2_PIX_FMT_RV40,	"V4L2_PIX_FMT_RV40" },

---
base-commit: ea9e12ad2131e2471d719fbfee17e89f0fca71f3
change-id: 20260107-av1_stateful-04524166d097

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>


