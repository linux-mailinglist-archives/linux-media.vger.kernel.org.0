Return-Path: <linux-media+bounces-43511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E68DBB18DD
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 21:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 138101C44D1
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 19:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1733043DC;
	Wed,  1 Oct 2025 19:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dITpJMdS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A949D303CAB
	for <linux-media@vger.kernel.org>; Wed,  1 Oct 2025 19:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759345228; cv=none; b=TKSRsvbELDBdIxCrKNaBVFS6tj7RFsEs78IQbvmUqZume2GRbkuWTfPAQDyK5d0PmDqi0W7fCjs2J9KqP33YjvDCC/Vbskn2xpOp/36BiXRtBoeLTbcM5LZOAgpL30xDQ7acEJ82olLhnhzqmW4IouLm+0whTbpW13b1cDUWHls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759345228; c=relaxed/simple;
	bh=/rm1Y/tRBwPrsxYpaC+lx0uQgFufvlrB5k6kOnop6/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jk1TtJqG3DLzlepqfpEu68kJ/yOrpzsf4yBatrVSNHTHAvwoXKNuhIFz8AYReujIVB2RQlaBuRaBKwtXu+UHCIA0b/bBkM0kxZs6GlernyrsPwiulowZKk1N4N67AJ64hih/KpqOIzCfeq34bhRSnXAIThebHKhZfN/CjziBY/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dITpJMdS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcLkX018108
	for <linux-media@vger.kernel.org>; Wed, 1 Oct 2025 19:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UOM6pErh4JXh+pgCFCh1VyiU3BioiWvX5lWpX48wx/M=; b=dITpJMdSXPG1KLvF
	q8Aq2T4ihnWDcO2QZN7Pv+lDrEqr64Wr/kK0fPhXn7FqgLRSt5ToxbkNIxkm0xO0
	jBu0Nw2QwJ5htDTZR0eFHwG0mQsxrYxSDacMqv0P9EzWTdb4WG8g9NnMMXdfxQrk
	Gl1UJ4ySBSYcufajwu87fzFgKxDa3S1ppbmnZE5FnrrfGJO0bXFYVbSE0tCoJA4z
	E6WLIBFTCdS+MkzQbOCwBBtzOUSYs1rHe4bIokDt11NDd2oa8kJ2PE8VZyAmwOk/
	+nR8a2wxS4CTImQYIKc3jv6IvDM1JJgr3Bc4Yt/lQ0hHa6b3BfYqWfx30Ud7wl6g
	f3jMEg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf75hm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Oct 2025 19:00:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32ed9dbba55so58179a91.2
        for <linux-media@vger.kernel.org>; Wed, 01 Oct 2025 12:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759345212; x=1759950012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOM6pErh4JXh+pgCFCh1VyiU3BioiWvX5lWpX48wx/M=;
        b=Yj/5fFrb9uVcwziTuBz8MxSIZZmTkPOOyPwjQ7KyCjcLy2oh6Dwh8d2QAphH34AQL0
         YcA9+LAZg1skMsZrP8QLOidlrtbuv8Ts2JbWlG25o+L5Lwm4NRZjxbo2yxxbcn/hRF6q
         aJxTI8hX1awq6pOo0TivHdupqSM9EYqKHMP4L3VnXiQF5gqMguJjHKoyVK5nHPFQaur6
         ifbY1EBjhgJQY/Hj1hPc0DoFBPfV6B2tjK/RhiGUwszBcl/IA+S0D3wx1r0hiL2yXNEC
         6mXv8wJ6I3bMVdJd92p4/I3RNZPIyx8lsrnfMwaZJbW34QMPKmuzosgkJpqpz6nSw2k3
         i1Rg==
X-Gm-Message-State: AOJu0YyFNWQ4Q4GWWIoJm932UwFSo+slCP3awX8OBMwfBTsGQHxObVkQ
	7ytlPIZZ7isYVWEsktmj/0h63JZRUYcHMci2bjq+liNhv7bd96HMmxjnOXbWYBXThn0S5fz/AUM
	ZKhybfQceIXKFzIN0S/u4nugdceVxvyIiPhkfaQiky/e1fxEqJ4LPJqvK0gvGC1Cm7FuUgS+pgQ
	==
X-Gm-Gg: ASbGncv/foyhnkqRyCg62qqC+VA53ZpQ/K7ta+twy3tJW6BONiix3d+Qai0xvmC6qZC
	2dU72LW932kgCtWQ2IgDEJjjy6MajLwNa0QK6+MIDUM800GRiSOBcsCcwnwWO098mARzAUNwU3Q
	pc0JcIyXi1bKcTBtNGGUPJRw6a06OYXtmXeXjTWIOxXba2TYeiRy7wQjQ+kFwMpy3xd0GLfBPTI
	CyD5IsROr5EEX5tm2HfJoW5ytn8tDM04UAbsNqCmnyX2FN4arysg0SzH6/iISfs3PG+dN7k+CKT
	AW91Q4GcZGaajhXKFgZuu/E7+v1Nd7L9n7kbgE00Mvtmuro5siWIe1pz+jnvkeltGrJYawIEZ3u
	zsVdVcpxrq7fclcQW9xQ5ZqIFEsQQ1A==
X-Received: by 2002:a17:90b:224c:b0:32e:74b6:4ef9 with SMTP id 98e67ed59e1d1-339a6d425ffmr2697914a91.0.1759345211625;
        Wed, 01 Oct 2025 12:00:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOya6qECNpJ/6SMsAf6t/f1E24fDwdtbmQv0sCvjkybfOLZCjjsyzeop/XkBa+HD2orVE21w==
X-Received: by 2002:a17:90b:224c:b0:32e:74b6:4ef9 with SMTP id 98e67ed59e1d1-339a6d425ffmr2697884a91.0.1759345211040;
        Wed, 01 Oct 2025 12:00:11 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701cbffsm2950074a91.21.2025.10.01.12.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 12:00:10 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Wed, 01 Oct 2025 12:00:04 -0700
Subject: [PATCH 1/5] media: uapi: videodev2: Add support for AV1 stateful
 decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-av1_irisdecoder-v1-1-9fb08f3b96a0@oss.qualcomm.com>
References: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
In-Reply-To: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759345209; l=2422;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=/rm1Y/tRBwPrsxYpaC+lx0uQgFufvlrB5k6kOnop6/c=;
 b=FwUQJyOxBbml7pw9V/Ys5GVnoZdTtkEyEOGQk0Uuq8AhzLh7ZnUQ5p4zFEGKUJILkfwMAb4Lm
 bPdsvL/RRqFBI5PUHQph+15o9hqW8aKW9BXY7qK3FLFXygM3XQpCLrx
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: 5584ITDGJCnMMrbJ4S4CGgPVbajvOo36
X-Proofpoint-GUID: 5584ITDGJCnMMrbJ4S4CGgPVbajvOo36
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68dd7a48 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=5q8hE9cQKCNJD2usWYQA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX02Q+v/UQ+JYc
 ylAhxsvDEXxJJXuuZqIEPtZyLbbztCMsstcaPJI0IF0SLNe+S/M5EiLB8VQxUo8IavJzH6cdSam
 npszzwd0nA/tOj5vddxfcOCPQHCuWeBdwhGZN3+MTQUUUKas2gTCbSX2guEfx1ZEYY3rY6qx7il
 oTk3LA7OoxNEyNINIwYBAlHjNVe23dtlnXekw94yONaztOjYCtH+te9nddC6uz5rUQ32HULBgiL
 fMjUGm1KSaXyoUPSfGN59vTr4M/8RvRXaKQKM7jRPhxqzLvB6AUNmh9/RyMXJv5atAdcI9Nb0Qc
 OcOm629PLBf3udg2XIQeFXaLJWATLMpNJXK7AKhEELl4cXQ9PbXABJZXbjziRXyE2m4wBwyz/ES
 tiDU3d+eojRqoiAYTFiIQlLvcBan5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_05,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175

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
index 806ed73ac474ce0e6df00f902850db9fd0db240e..043ec57d7d48a36005f2a0121a5bc7b733d06590 100644
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
+        pipeline as stateful video decoder. The decoder expects one Temporal
+        Unit per buffer from OBU-stream or AnnexB.
+        The encoder generates one Temporal Unit per buffer.
 .. raw:: latex
 
     \normalsize
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index becd08fdbddb857f8f2bf205d2164dc6e20e80b2..4c07ad6afd45d6a56d19d65fd25f091d81725823 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -775,6 +775,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
 #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
 #define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* AV1 parsed frame */
+#define V4L2_PIX_FMT_AV1      v4l2_fourcc('A', 'V', '1', '0') /* AV1 (stateful) */
 #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
 #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
 #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */

-- 
2.34.1


