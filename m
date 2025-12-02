Return-Path: <linux-media+bounces-48103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 745A9C9D4B1
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 00:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E62964E6DF3
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 23:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FCC32860C;
	Tue,  2 Dec 2025 23:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IWfrCN7i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dOyuTDG9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AF6244661
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 23:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764716635; cv=none; b=FM76Bmjhn+pTwBrpBzOSKDP9zzUZWj2ovRmWpccUGRgj012XiyRQByrOXUyblYSWnVl8QzUBc0kJtjJbqlErNTT3xxeS1Q8prGreKu0tDxZiJh1S5CP5koWCsJRXjIsNf4hWeg8rr6m9nwrMGn61lfuddUpoqwwdce8kd0aza98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764716635; c=relaxed/simple;
	bh=LM5cLcvrL97GVflWOVSbpoD+zNNmsN4BqP7GlTU2puY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OajtLyRSxvAj+vRxq2tD4Qo6Y5ocQl2fHO8BuDjFnLIR/lauNpvPHTJO7Hu1ziHBPqKjUvcuu5lCSqc6bU+R1kqn1x2pwSxE6q3mSO5F35X4c8+HBwXsRFAWQHsgDVAyNjGpRMtLW3IddZb9KUCW89iMkTSi6J3F+Ii3tW5LUFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IWfrCN7i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dOyuTDG9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2MrYsf479281
	for <linux-media@vger.kernel.org>; Tue, 2 Dec 2025 23:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	15Q9ck6ovkYMJTPJoDc2Dx9iK+2vuB4WM6abfMTFsKQ=; b=IWfrCN7ixDKeAOV3
	1kxZXdq1+vw4Jv7+xJiqsrKPoXHsDbZlEXu3K2mRTvZBT24AT2jFCzjLTGFVLvz+
	x/vnEG4/XxAckaX5jRmhfc7JTivr+FxWPGcsa+mKGpKz2fTvVLj5XsdgogDHmevh
	eDJGEiD2fxFNHI73/X65gQPtcIxez4W4/CmJdYyfZZqGHW7kJLKtq7C8HV2Vs2D7
	U8P9x5E2gm3RT7v07WNgiTGsR/AMtX2qNzLpuKcdTY+2yrHtf6VgFerI11xqh3xC
	0MxBrJxrSuDQQRT75jMJ8Y7DvflWuI92wv7KiWbTyxqoAE1Gigvjsx67zlptYe4U
	pT/tHA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at9a980vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 02 Dec 2025 23:03:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-beaa9a31079so101466a12.2
        for <linux-media@vger.kernel.org>; Tue, 02 Dec 2025 15:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764716632; x=1765321432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15Q9ck6ovkYMJTPJoDc2Dx9iK+2vuB4WM6abfMTFsKQ=;
        b=dOyuTDG9/tN3yfxevIJi4TW2xLd1mPttn27DDDtIBDGFp3TYJU7fAPK5aUIcwSdypX
         qwF4PglMAEZaPEG4Eyw1PhAGAgwnG3XWF3v6nviL6nP0mH4+dkDwm9hxxf/cPqyNH+uq
         FTCVen8GJ6MrBp00HBnvcB61fFsMrGaz/xwVfdJlwJwGH/jTyI2rtwcSp437hYPGDFrs
         1c6maOOkSppFHHTTTs3BGfBeGTjN3kip0EFFCpw4gwmBO2PvP8mgqG1AmtfSAdhy0WJH
         1A45YXCPrIU6VOpSh/+2g74kuc799YEvoFd5FfwUExIvwtu7xNGNxbKbD7TsM/Cfsura
         q78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764716632; x=1765321432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=15Q9ck6ovkYMJTPJoDc2Dx9iK+2vuB4WM6abfMTFsKQ=;
        b=nJOkPculL773pyJ7RyKo8kd4QCTcBpsXwmYPcUYCXiW3giLnOXDD+wkWIxO3ZvcsBw
         1HKWbaX+pVrscv0uAZWkapI0+elJdEjEh4BLZb2LpiqF2P/2jS5oqAB0KgJqEeY31Bz/
         aY7mbf2JfImaq5xPnJN+X0WOaW42b8aFw8C6kPNJWWlRoHLfLzJCO/I96sOX7EoVqbl2
         om9mvuqWV6gwyGp4lBWLYPG+32mpCh+Fa2wi/vuPluD98ul2Iduyy0mZqCO9zxtk3NvL
         icRKTo9HjgI3I1cPqJP5RnYqUPa1MgwO5Hb8LhiJYj5PvY9ffUCnr/CaTFWS1O0eshZq
         bPQQ==
X-Gm-Message-State: AOJu0YyKCcaoWwl2RGpJajGn9J+ZxneI6wJTHYFZcSfDduPfciAbtQ+E
	J7RzgVux1C28dEGGL3XZzdLvEDAVCBsIW2TtzqXW2TRVLHOTLAX23dqzNwUwrUn5NAytYMjlUE/
	jv3XSXwurVhAhobbxBYDgJolsF3rTjy7zEKV35FvF8h11leYk4wabWgQWT/CnpQjEZA==
X-Gm-Gg: ASbGncuEpWBKeIER3kvj0ccv+pUICCSxkpOlo/x7UmPTp5XDeJWY/aIJ3YL3lOEmzyQ
	j18K+h9EdnVkS76H4oIt08GkI3Q6b1yzPS325ivE72nIcFw/5gHPblALP6FpM35r5MTGRVpRon1
	rL5fJl1FLUYvpRe+duXsfUYkhY0fYIm9XRRzrR6DSpphRb8TdYe5bvPFQHXxutnCbwb1tXhy4An
	H9Sd91NJ0Scu0yDO2WuGELkKDavucFJOqpFqL31y3VS1QzODlZMGMn9amo9eNkSTvmaLIGi0Auy
	HbyPWPNxUC+/pBayDK8EnHBnE4DYmswM63rVboODgYBrVGzRri4XDmenkX22UGXM0a6duuy9aEJ
	CpTg6HYi+U8K7IuzidUftt6jIYfRM4v/0AQg0QdhCb0TVqsXpLIJ3AcrbB8+RtLP595sq/g==
X-Received: by 2002:a05:7300:ad08:b0:2a4:3592:8624 with SMTP id 5a478bee46e88-2ab92e230b3mr182094eec.2.1764716632038;
        Tue, 02 Dec 2025 15:03:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6UOXCH+XKa7SI/WBt4c/5dAn0X7e3OjuS7CW37qUQxEYYs974JvbEpcKs/mnaCNylTAUMsw==
X-Received: by 2002:a05:7300:ad08:b0:2a4:3592:8624 with SMTP id 5a478bee46e88-2ab92e230b3mr182065eec.2.1764716631395;
        Tue, 02 Dec 2025 15:03:51 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a965ae9d06sm59214149eec.4.2025.12.02.15.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 15:03:51 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 02 Dec 2025 15:03:42 -0800
Subject: [PATCH v8 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-av1d_stateful_v3-v8-1-2f74a81773b4@oss.qualcomm.com>
References: <20251202-av1d_stateful_v3-v8-0-2f74a81773b4@oss.qualcomm.com>
In-Reply-To: <20251202-av1d_stateful_v3-v8-0-2f74a81773b4@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764716630; l=2597;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=LM5cLcvrL97GVflWOVSbpoD+zNNmsN4BqP7GlTU2puY=;
 b=mfGLNxNno/UKDn6zsDFlYdadUi9+6hmIS9Ztyuf1DkzPX+f+1EF1apBdWaXqJO0BpQ9N001uG
 g12dfcZtoKeA3+YQGHo7PdJtgOJci4jx8CADYbb4TE6rZzSt5uWhRr7
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDE4MiBTYWx0ZWRfXzOWviNH9is2Z
 +Awgoy+hAPfheratdTsEnwpTZLm8CIL71GXVAPhaIsFOI6d5CytkwncIakCqugcJTuQMz+PRf6p
 1dZUEFUWxtE1GEH4lJMJoxWX31J9hnIzsXJm5dPV2EHf5xNjrSe73oCtLntfHPVuqBYUu2tp4xT
 3tYC2RGNNN/63zvMhpguMXx+7HVi+8+dHDMd5gQC6ziA/k3p6CaDPlKERtyXovMXprurUbr8VKe
 lmdHQMcRrI/AsYx91aLHRhTS9YowMGdkw6gsGHE1ymxMkc9tviay3j34xvGENES4zXFvYFhhm2D
 48HMIy1oUlWsrAi0x2+J7L2K4DpzELvS0X0naYC6p61lCwMi2sOrCundShFaT72EkwOLInoqzkR
 4heBBzLWnJJoaBBWGBtvzDZAVTYDzw==
X-Authority-Analysis: v=2.4 cv=b6+/I9Gx c=1 sm=1 tr=0 ts=692f7058 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5q8hE9cQKCNJD2usWYQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: ztX8plra4Pmt2w9o2-Q174V76_UHvXG5
X-Proofpoint-ORIG-GUID: ztX8plra4Pmt2w9o2-Q174V76_UHvXG5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020182

Introduce a new pixel format, V4L2_PIX_FMT_AV1, to the
Video4Linux2(V4L2) API. This format is intended for AV1
bitstreams in stateful decoding/encoding workflows.
The fourcc code 'AV10' is used to distinguish
this format from the existing V4L2_PIX_FMT_AV1_FRAME,
which is used for stateless AV1 decoder implementation.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 Documentation/userspace-api/media/v4l/pixfmt-compressed.rst | 8 ++++++++
 include/uapi/linux/videodev2.h                              | 1 +
 2 files changed, 9 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index c7efb0465db6480fe35be8557728c196e0e530f4..235f955d3cd5cfc83b0d3d424e6625b14c07266c 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -275,6 +275,14 @@ Compressed Formats
         of macroblocks to decode a full corresponding frame to the matching
         capture buffer.
 
+    * .. _V4L2-PIX-FMT-AV1:
+
+      - ``V4L2_PIX_FMT_AV1``
+      - 'AV01'
+      - AV1 compressed video frame. This format is adapted for implementing AV1
+        pipeline. The decoder implements stateful video decoder and expects one
+        temporal unit per buffer in OBU stream format.
+        The encoder generates one Temporal Unit per buffer.
 .. raw:: latex
 
     \normalsize
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index add08188f06890182a5c399a223c1ab0a546cae1..848e86617d5c87d76f15663403c2f3f0e709073b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -775,6 +775,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
 #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
 #define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* AV1 parsed frame */
+#define V4L2_PIX_FMT_AV1      v4l2_fourcc('A', 'V', '0', '1') /* AV1 */
 #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
 #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
 #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */

-- 
2.34.1


