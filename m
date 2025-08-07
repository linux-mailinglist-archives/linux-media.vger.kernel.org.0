Return-Path: <linux-media+bounces-39040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C2468B1D752
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 14:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CD9C7A6F11
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 12:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB6F2505AA;
	Thu,  7 Aug 2025 12:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Igvhm4hX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E2E24728B;
	Thu,  7 Aug 2025 12:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754568707; cv=none; b=RKd2uJqmCJFzX4EYa1+NXHK8vaZNz2VnRdGCpsw8/DBobs8JWv6pGhuxg4CF0tarnzCfK7KYtE7tLfcYgtc5tl5q/OiNKuknXNHPqTp7VGu3DtQo6pFTq1R27JxlQ5lbcDH7QYOKlvPb+CJ2WmI5LI/QkG5WqaOphz5DpUaWUSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754568707; c=relaxed/simple;
	bh=st9nWA4NExetMqG//3mDmoK6GhjB1sOHtGv1pzvyzxM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XbhWht5BAsSCkp7PYaidWig5Tsk4WiaWGOr12nq7NHpJtn0XYH8bx7i48zWVULXRTTaTnSz4Pdkq1hXAvwpGvuOKv/MnUmktnDB9jZoUVKfqax0jazA+9G1gC38ChIKnj7WsTbLf/CsQO/ozIYDhTh3YR+h55XBd1rsrinu8UNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Igvhm4hX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779DCAP001951;
	Thu, 7 Aug 2025 12:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CoHT2Dikt2Zt4dRmaEq410LK4Yb3iyGv0o9o5lGsA2Q=; b=Igvhm4hXZ4dF+zCM
	bHXK6p5ORUUkaUZeLTf2TDw3rhS1/qOA/Ct2iU1wFM892FBHqk2iWxjM4wLmCYLG
	kQUWTFp2AWLmoHTrkcHP+fHssIhtYfC0+QHvShtiHFqYl/x3lybVpxBRuSivi2t4
	NwbISyUaWzNKi1N1D8QAlBORFhvTnTDTtOmylKCN7yM8PWGyS8yt30gBuMXuUIAl
	Kva83QnP0ZWLLMP+olbNioQ9MfbNRZSjoli64fqUVG2odPwICfXwlzh065JUkSUy
	erB8g+oso+s51B9bk0ut/fn2q8b5wIyMg2HDhmZPstonL+bf8O0CYQ0vmHcRYroJ
	Hkc0ew==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw3664v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 12:11:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 577CBang028131
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Aug 2025 12:11:36 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 7 Aug 2025 05:11:30 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 2/9] media: qcom: camss: Rename camss-vfe-780.c to camss-vfe-gen3.c
Date: Thu, 7 Aug 2025 17:40:58 +0530
Message-ID: <20250807121105.710072-3-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250807121105.710072-1-quic_vikramsa@quicinc.com>
References: <20250807121105.710072-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfXwLS2hsLBe0wN
 487nfLiw4hXc/hrcmz9kU/iRh7SPo7JLjQH50ZDvyRS4B6jGGRNVESN6bB013+zLXb7uzHAulKA
 8zgnKesMhOgpn3H7ElaXarRP621/XMuna5lW7Z7p/2B2O3sa2/jffO5yFXXA3MM7q+M8FjEcC+0
 Bo/UhAc1kacluaizyV7q0MHlT9vRrYtkVhokWHx2pDi3QiDcK0V36AkYyXy3ySyuklUxaAtR/1R
 qMJJBGYs9y8N+ai9uAxzfh518yrEm7+QHv8Fwa+pUEM8WES6WA6rcc7Dk8CPMcajpoILFGC0REu
 GZIs6ZDTm32LPIlxX5yaEACyjWGBhJnY9+eW2yy7W4HQoBH652otO8VwHQbVRNQQt40h+TQDRGt
 M4UdZK9m
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=689497f9 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=m-t3JITvBdmPMbOQ9dkA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zisnEmu08dHaJ2zdHKFMdK9NxPipx3Bj
X-Proofpoint-ORIG-GUID: zisnEmu08dHaJ2zdHKFMdK9NxPipx3Bj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

Rename the file camss-vfe-780.c to camss-vfe-gen3.c to enable
reuse of VFE logic across multiple SoCs.

The SA8775P SoC includes VFE 690, which is very similar to
VFE 780, with only minor differences in register bitfields.
Rename prepares the codebase for supporting additional SoCs
without duplicating VFE logic.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Makefile             |  2 +-
 .../qcom/camss/{camss-vfe-780.c => camss-vfe-gen3.c}   |  8 ++++----
 drivers/media/platform/qcom/camss/camss-vfe.h          |  2 +-
 drivers/media/platform/qcom/camss/camss.c              | 10 +++++-----
 4 files changed, 11 insertions(+), 11 deletions(-)
 rename drivers/media/platform/qcom/camss/{camss-vfe-780.c => camss-vfe-gen3.c} (96%)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index ee869e69521a..76845a456c45 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -19,7 +19,7 @@ qcom-camss-objs += \
 		camss-vfe-17x.o \
 		camss-vfe-480.o \
 		camss-vfe-680.o \
-		camss-vfe-780.o \
+		camss-vfe-gen3.o \
 		camss-vfe-gen1.o \
 		camss-vfe.o \
 		camss-video.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
similarity index 96%
rename from drivers/media/platform/qcom/camss/camss-vfe-780.c
rename to drivers/media/platform/qcom/camss/camss-vfe-gen3.c
index b9812d70f91b..93d16b0951e9 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v780 (SM8550)
+ * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module gen3
  *
  * Copyright (c) 2024 Qualcomm Technologies, Inc.
  */
@@ -113,14 +113,14 @@ static inline void vfe_reg_update_clear(struct vfe_device *vfe,
 	camss_reg_update(vfe->camss, vfe->id, port_id, true);
 }
 
-static const struct camss_video_ops vfe_video_ops_780 = {
+static const struct camss_video_ops vfe_video_ops_gen3 = {
 	.queue_buffer = vfe_queue_buffer_v2,
 	.flush_buffers = vfe_flush_buffers,
 };
 
 static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 {
-	vfe->video_ops = vfe_video_ops_780;
+	vfe->video_ops = vfe_video_ops_gen3;
 }
 
 static void vfe_global_reset(struct vfe_device *vfe)
@@ -140,7 +140,7 @@ static int vfe_halt(struct vfe_device *vfe)
 	return 0;
 }
 
-const struct vfe_hw_ops vfe_ops_780 = {
+const struct vfe_hw_ops vfe_ops_gen3 = {
 	.global_reset = vfe_global_reset,
 	.hw_version = vfe_hw_version,
 	.isr = vfe_isr,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index a23f666be753..02d9162ffd93 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -244,7 +244,7 @@ extern const struct vfe_hw_ops vfe_ops_4_8;
 extern const struct vfe_hw_ops vfe_ops_170;
 extern const struct vfe_hw_ops vfe_ops_480;
 extern const struct vfe_hw_ops vfe_ops_680;
-extern const struct vfe_hw_ops vfe_ops_780;
+extern const struct vfe_hw_ops vfe_ops_gen3;
 
 int vfe_get(struct vfe_device *vfe);
 void vfe_put(struct vfe_device *vfe);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 97f8e2bb6d81..346cfc4fb392 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2371,7 +2371,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 			.is_lite = false,
 			.has_pd = true,
 			.pd_name = "ife0",
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_gen3,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -2395,7 +2395,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 			.is_lite = false,
 			.has_pd = true,
 			.pd_name = "ife1",
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_gen3,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -2419,7 +2419,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 			.is_lite = false,
 			.has_pd = true,
 			.pd_name = "ife2",
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_gen3,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -2441,7 +2441,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_gen3,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -2463,7 +2463,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_780,
+			.hw_ops = &vfe_ops_gen3,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
-- 
2.25.1


