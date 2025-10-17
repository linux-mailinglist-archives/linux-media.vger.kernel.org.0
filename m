Return-Path: <linux-media+bounces-44939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BA9BEB415
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 20:41:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3F3119A7C79
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 18:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAA5330317;
	Fri, 17 Oct 2025 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MdFACgCJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390EB231842
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 18:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760726484; cv=none; b=nH0gVhDylifWQojHvEt1nG9re0H3Xnv+n+pPG0hyC04GK9xyaATo1FUCv4f0mQvClsz2y/7o3YvFvlyZdLjtFAYHQGnSkJddUFASRMrUIX2wocPERGTP3PAB1Mgc76bAuijJ83kJ+FAyxY2mcvjXV53NFeJC7GebrSSYy+znMl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760726484; c=relaxed/simple;
	bh=0hCN7qCXSLUAZXIjLrkyQ5Q9apLRdYKGIeQ8hEqHEvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=paDW8Zbx021Ei+5v+cQxyFoU2j5A8RVVYtxNCvFrtJwnGkdQnghzMm8vypUsq4OiJV7eO+p/wC8PAikMs2hDMfpAonXYs0Ml4d0+pGkaWMEhUdpsUspk6dEo/bq6cp9n9crkNoCu72umpA3mOVtuHl8iURT0gFwUxaACX6TOk3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MdFACgCJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HIamGn002692
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 18:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K5dffV9vMTN48/Ti+Eh3Xd6lFyWq3KjwFHmjYc0NovU=; b=MdFACgCJjWVuvGZS
	QeDh2WcNStf5QQtGSxMxdm7zTRaxYS7JmFXP8Cefe5rhET/VQJGGUv53RaxaLdix
	JbGRTDUQ90gMVFQpKR8I7hreuWCNgqvS3y4g9ZUsnp3UFtCf22T2Cnss7+9szJ3k
	eXwz4LJVi1GsA92gwcHgHPHz5JMa2xUf//It/O3R5FMnK1U8yvTFsq8Z4Ncv113w
	ArlJ7gXeTK3+B9kYFAXZJ7PAf3zJkhj1o2s7m5cWQZSfB6B6WgVJccwiTnht8H1x
	LvEdCB47fFBn4z1Ne+vWB3+MI/NsRot+D4uTm4epYcLrpwu96kLx4LBZ8T8MgXIV
	iQyUJA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49uqun8sxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 18:41:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87bbee3b92cso7884766d6.1
        for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 11:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760726481; x=1761331281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5dffV9vMTN48/Ti+Eh3Xd6lFyWq3KjwFHmjYc0NovU=;
        b=aeI9GkY07ZoPDX5Shy2Ga5MRpr2UkEMJOiVBLZnlbsvUf/CPFu1Lv5tcs0pEdVEkqB
         QIlrXa1z2/PEZEIevZ3EbjYQ4xUFVm5cfKYHGPsQfp9Y7w0eKi4EPSuxt/lNe7wVVBc9
         nxsaDjRb3/o7C1LKqdDEgvvNrK7AHVhtNplK7xeju2Kqi8ZaHv+MfrZnFUv5sng84p3Q
         Wbrj4/ZdjDkj53xG04i0JPnY00OvXpJ2pTRnulsEAdLxna6US5O2RokqRUmmA8c3gfkB
         VH+wAWHm9VkcKJZ3HzdFukccthBFGOH6TMQdTRHh6GCOIyAhHxBwtx3HYmD1FztBgtJ0
         d8kw==
X-Gm-Message-State: AOJu0YyW96/XV4SuDT2V2bEHT83YTOU0j1bdRB6u5+48atSxmMA2q9lN
	4gRJHsZbzzoR/x6V6Q6MW73rbb++Vwzk8Zv5BjdgXqSELzI4cOp5KjFWc3/pqbjoj+4V7s633uK
	HO1QYFHUVoSYDtPbvUicLSYkyYXX0FEctDDy2OEOnG1ujZZ0ubDX9BZUihosVphIOuw==
X-Gm-Gg: ASbGncsDRcCZ9qhVJCOCOwl3WzfwFiIXCUlEPWlR6kT4zyv11Wca9cCbZwfUbvUk6eM
	sz5B4RcqHX0Anwxf8hW9c7VOD9ZpWxrw4upP5ggZQPrJEbmSs2Ez1SINYoweh4mmspE2TinujHz
	DV/j0689upIRD737Wj6jSvC4nF4e5pqxAI7kYakxCcwLDB94AOs6YRvQCRw3TTO0ewfRsNwiLVB
	ZTMv0PEpkitASyPL1EBpMp8nO+6HDJMOVisAADzrCxeFatHaFgV5kygp9N61oDq8+D0e9npS0aG
	NV+qcpLpUK83VCsBjLW4QKpOvoh5UHD9LM4gLk/S88rsaTHcNp5n18r76VVVyqwELnVz0p294N5
	AlGz9UkoGdch6xZktFk+aAz2bMJR8OgDv1usYS2ArNc0HvR8zgLEoWB+SJQQ=
X-Received: by 2002:a05:6a21:32a0:b0:334:8d22:f95d with SMTP id adf61e73a8af0-334a853656fmr3755224637.2.1760726126655;
        Fri, 17 Oct 2025 11:35:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmm9s2Z9CdP5xpjHJUp8p4fYTpy+mkia0Il4jJ8DvJs8HvC0urRpa3rj4KvgvAv1rY/sYxCQ==
X-Received: by 2002:a05:6a21:32a0:b0:334:8d22:f95d with SMTP id adf61e73a8af0-334a853656fmr3755198637.2.1760726126104;
        Fri, 17 Oct 2025 11:35:26 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f24fasm245487b3a.42.2025.10.17.11.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 11:35:25 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 11:35:15 -0700
Subject: [PATCH v2 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-av1_irisdecoder-v2-1-964a5478139e@oss.qualcomm.com>
References: <20251017-av1_irisdecoder-v2-0-964a5478139e@oss.qualcomm.com>
In-Reply-To: <20251017-av1_irisdecoder-v2-0-964a5478139e@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760726124; l=2423;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=0hCN7qCXSLUAZXIjLrkyQ5Q9apLRdYKGIeQ8hEqHEvA=;
 b=RGUIsMsESqBt6hXY0FtwCgHQ3CTacRhs+L+y0gnVmPeLhBqSoeivguFT8nRn9HVtwghv0nqUv
 qy4LpmxRUlqAQf8W0eYj+Od9Nf31cocgjG9o80jfH6I+NCqMwt91laD
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=aM/9aL9m c=1 sm=1 tr=0 ts=68f28dd2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5q8hE9cQKCNJD2usWYQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE3MDEwOSBTYWx0ZWRfX51eDGi9feSiV
 TI6fQsr/BvmxWNFMoxnpQv3hhfJQq6ng1pQVMl4Yn0dRqpG7oYHjnXYcirsU71gFJco5f1c0CFO
 NYA+Ai4XmhuqeotA7LHSKWt/H6QV/DCyRTId61VS/fFCFWx0i0Lq0rG0+MXouvVo1G6vPhfAj46
 x/RKbNKDBlM/0JxFBE+O9oaJo/EyF50tsbZCVmTDW9fdHGB9Ehfle+nby4Ihocl7nCn7Han7ho3
 zK9QHa1ZiIVcHqnEEFOETdRXzCdcQreHvjgY9MFG/bL/xFcCydTX6ej8aLJPwg9wtUEPM0GkGWC
 8pB7TByP2AEmDsDK//QKc3hHtR3BNWGCH01qiWmn5nOb1iN4Pd0j1DimMnlVWGXgsguqABH5hsG
 bpuN4DyU/6sDal7CvyQ4+NWFIk6mtA==
X-Proofpoint-ORIG-GUID: CwDVzgksFVqz4suijDmY9_t6q9eAVQU4
X-Proofpoint-GUID: CwDVzgksFVqz4suijDmY9_t6q9eAVQU4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510170109

Introduce a new pixel format, V4L2_PIX_FMT_AV1, to the
Video4Linux2(V4L2) API. This format is intended for AV1
bitstreams in stateful decoding/encoding workflows.
The fourcc code 'AV10' is used to distinguish
this format from the existing V4L2_PIX_FMT_AV1_FRAME,
which is used for stateless AV1 decoder implementation.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 Documentation/userspace-api/media/v4l/pixfmt-compressed.rst | 8 ++++++++
 include/uapi/linux/videodev2.h                              | 1 +
 2 files changed, 9 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index 806ed73ac474ce0e6df00f902850db9fd0db240e..d82557a6ac30851b4fd432a5ceab969abaed2e25 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -274,6 +274,14 @@ Compressed Formats
         of macroblocks to decode a full corresponding frame to the matching
         capture buffer.
 
+    * .. _V4L2-PIX-FMT-AV1:
+
+      - ``V4L2_PIX_FMT_AV1``
+      - 'AV10'
+      - AV1 compressed video frame. This format is adapted for implementing AV1
+        pipeline. The decoder implements stateful video decoder and expects one
+        Temporal Unit per buffer from OBU-stream or AnnexB.
+        The encoder generates one Temporal Unit per buffer.
 .. raw:: latex
 
     \normalsize
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index becd08fdbddb857f8f2bf205d2164dc6e20e80b2..e03cfe0a5ae830595f0bf69b951ca16beaedab72 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -775,6 +775,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
 #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
 #define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* AV1 parsed frame */
+#define V4L2_PIX_FMT_AV1      v4l2_fourcc('A', 'V', '1', '0') /* AV1 */
 #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
 #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
 #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */

-- 
2.34.1


