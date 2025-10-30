Return-Path: <linux-media+bounces-45969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BF0C1EA9A
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 08:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81377188502C
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 07:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355E2334693;
	Thu, 30 Oct 2025 07:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DfM1D6AB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikp/Bxoa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBC72EB5A6
	for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 07:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761807638; cv=none; b=unkgSHW/9hLb+rRBZyIpSUK9VZMbc9a1lXJEntEZIaoExyDCmO/ermwUOgfO6KxSXHS9Mn05/TQfQ5CQi9szVcwk05yii4Spr36LnJJLoIdCAhpzdGP4dForFgJvdp9vviLE4+OUrYPRD2J8C+OMgTH4RapdoopNkHp+ubZm5G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761807638; c=relaxed/simple;
	bh=nkMTv+cGBneu9mDQTjTqBZI+GutDvkdMMD3WodVls7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kRd9T70i6AMvzy58HcYug3ZK+Hdw6WFcj5RAJiXqlN7bSZmEBXOw1LUMwpTdfmiGDdS6vtk/itDboHaI64Dexc4C4Q+fT0Mjide67anHZYigIkRvhho4+iTVpwe4FNqSKczgdYj75ygb36fwn2H33XWlZuc5fQkJy9tzbwpXodM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DfM1D6AB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikp/Bxoa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TL7Avu1578774
	for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 07:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	79IsCawl82bQEifBPmUrGKC8kwHl1F6WlaHBtQQ3mx0=; b=DfM1D6ABnHE4WEUe
	LeZgbuARWpYQUalLf2pc0NzV5rITck/EefYiYkOnw14B+fHjDYPm0jQSU3GQ0v1c
	I28kUj4+nSGxZvGynUjdOlNIbLEuAS3mFNywAzOTaCh2HXkN0aZCtZ4ANyPIZ4FZ
	4CACgtu2+VwLXPx7ZBkqHyNcMS0xqYGmHkV6+IVa3kghux0aO2ab7c6uyuK/d3fr
	gmSthIrr4MS1JQMD7ittlchEmbpT/MoJHkS+QiQ1Ot1NkWRAx4bkDtn38ctI7Dcx
	8wDxC6yzNJyCDjhlKgt0Qp0ksfzk3dWrX+WQa2XW+5CtWsuwiG+ZXUoecMIcyNxw
	o52c5w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tjehcuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 07:00:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28e970be282so1590235ad.1
        for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 00:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761807626; x=1762412426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79IsCawl82bQEifBPmUrGKC8kwHl1F6WlaHBtQQ3mx0=;
        b=ikp/BxoaeQNCPu12sGpsu7Ic23J+t/g0XFPJOCxnbYZn4ydu5FoTZ99tiQE0dYJ688
         E03LjtlOULwpyYjvzVxS6XwnChAkdTUCVwYn7piC7aoOkaYiVFrt+VsVtvk85Lp15qDJ
         8xTEAjwrWPD0IZxB/xSMzF/QdT/XHAyo9qOfszs91qiZCWCZll2/4hOOzJ5qNme7ZHH3
         JjX6HBdzCohdwp6loKImpOFJksaAanwwb/bU8VlW7Hf9epveoUyP7+gFyo7766tYMV2X
         J73rT5/a6/CD2bn2Aa9Uenqb0hGkeCHBiVCZoX1oSXKvdwdQto8ia80z7428wDBoPiVc
         zWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761807626; x=1762412426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79IsCawl82bQEifBPmUrGKC8kwHl1F6WlaHBtQQ3mx0=;
        b=QFURGdvbjH8r5WnX30PlnCTs7QfPZY8da+XnltX5gcxxufQ+EUaG4+1Esa7J8YqwTg
         bqMD6LoQLf/67MLWtsrca1DoGniTUr88GjHZjZ1uzez09x8YvAJI3gboN5veZGBuaIh1
         lY7gOC2/pqpnVbzDvXv+3D49UGO1YwVl356UYDb71UUeFD6ty23lKx4SpbNqp9NaAltP
         ukDZTGF607bNOPRVfQaf4c38lvofzGQNOy5ZUmsDCXoPHR2xkSxnjlqmHyRefq7eYW+r
         zywv/R7tZoKrVBcCLTB1hnznk99JmnM5e/WW7gtoitLTp43meyeRl8EWx+MOHYXGj6Ul
         P4hA==
X-Gm-Message-State: AOJu0YzKJyyGVZRP9DBle0uHZjOdvJODP9Fuk/R9TGLfS2iXFwrNjac+
	2e290CxfxRP5yNUMAoRSAurAQ7kN1a1MlVjUbVGwukGa2GSDBqBnpb3gfBk4ZolWKfbRoRhdo1b
	aOlL7ntgS0T5sglYzyeA7P2yCn1ZcZyiN903buvtzfJoyUww+oh+2He7WrGSSs1VKVA==
X-Gm-Gg: ASbGncu66wmo5LVbMg/L/5wgKCKaImIcFUKXX/2XgcLeyFJoETbShhnBxLjkRabCF5H
	eFr0lqpSTR5394zkxwb3/J05JtrAsL70+ZX4AlCQwMKNrcwhXtjke0UdD39O8DeXtmMZNYq0pVN
	o3BLhzFCzGVER/Hp1LX4JyA5Ir6x1Jb6vEZwY2Szpf62uCTUnNX+Ui4pWu077ApfBaUydg5J9Ni
	76H/ZyBjvZzvUpR0fTSBc5Q1euCmYojdNuOTNsaIW29dXbXRllmDrsCKuL78q3hrJ9o7xFdCxLV
	ZK6Old0vrnkPYPuM1I5clFLOnX1T1TlyQTRO4agwDaeGG/mMQDeLcHp8RBUe9nt6a9gEdFH0g1x
	jJNv/uJiEALvMuRImdXYDrsIWU4uvz2CT42GapPxo1hC2he8uCaF/jIT9YL8=
X-Received: by 2002:a17:902:8c92:b0:294:9847:fbfc with SMTP id d9443c01a7336-294def6c333mr25632135ad.11.1761807625620;
        Thu, 30 Oct 2025 00:00:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGasTEFUNJtE+G94KtjRffyB1Voc9iYmdVLTZXDt6lCPlF0AJJNQDh4vq/aF7zCXdujtbxQ1A==
X-Received: by 2002:a17:902:8c92:b0:294:9847:fbfc with SMTP id d9443c01a7336-294def6c333mr25631925ad.11.1761807624956;
        Thu, 30 Oct 2025 00:00:24 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d40a73sm177671325ad.74.2025.10.30.00.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 00:00:24 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 00:00:06 -0700
Subject: [PATCH v3 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-av1d_stateful_v3-v3-1-a1184de52fc4@oss.qualcomm.com>
References: <20251030-av1d_stateful_v3-v3-0-a1184de52fc4@oss.qualcomm.com>
In-Reply-To: <20251030-av1d_stateful_v3-v3-0-a1184de52fc4@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761807623; l=2423;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=nkMTv+cGBneu9mDQTjTqBZI+GutDvkdMMD3WodVls7o=;
 b=YXg1T+6exolovBIvmlpqgpeHmi+0zn2Pmy4thtiJSXAp0j6HTJrXOM/YQbZc+4P6CcLABv4rE
 q2MIfsrUPaXCg1YK7dZpsV59L/HyCErY8nDeVeciPW1QNp5dTQbYeLK
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: vpiuNWBfgSkk190uIlzGV_k2iu0FdxFW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA1NSBTYWx0ZWRfX20fKizIZzV0i
 dZbRxVrcujhmfFZYVsBzNaSArBFwc8IzB4H/a994qE/LCf0BElH47actsqlziQJ2lwGlVt88N3V
 xid8yps2OZMicUQon1fOX3YV9XimR2DttGIRIrPA6uv9SKE7j/9GWh8UNrzV6eM08ac4aKfWqn5
 YcDfpHCooncayXfBSoe4BCrwXOycVNG32I42IkGnGEL8m6LT+kT1jVvP9hZELdholsXZ3b7g0CQ
 x/F2efq6+xDDIXgpyq45Jtj8Iyl9xLJRfFREOj1NgalE3DIePv/aMoLoedOlzFv7YP2PKWk0JRr
 7ud6EgRvUHR7N3Hfui3Mze2lxy3ROOwtxCXGcj8kxWDMrscOFno27Q4UNFuiXKFIA3oGALmlxN9
 816PoN+LnZbtvPt9Ig66FbKQ+SKNdQ==
X-Authority-Analysis: v=2.4 cv=a/Q9NESF c=1 sm=1 tr=0 ts=69030d0a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5q8hE9cQKCNJD2usWYQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: vpiuNWBfgSkk190uIlzGV_k2iu0FdxFW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300055

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
index c7efb0465db6480fe35be8557728c196e0e530f4..0c70410ffd4d58e0719d3cf13ad336c97b454ae9 100644
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
+        Temporal Unit per buffer from OBU-stream or AnnexB.
+        The encoder generates one Temporal Unit per buffer.
 .. raw:: latex
 
     \normalsize
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index becd08fdbddb857f8f2bf205d2164dc6e20e80b2..cf0b71bbe0f9d397e1e6c88433a0fc3ba11fb947 100644
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


