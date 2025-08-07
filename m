Return-Path: <linux-media+bounces-39039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D397CB1D74E
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 14:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7394718C77A5
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 12:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780CA247DE1;
	Thu,  7 Aug 2025 12:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OzS4ep0z"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C22C246BCD;
	Thu,  7 Aug 2025 12:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754568705; cv=none; b=oqmprkhniNnKsMC1eD5h2ZSuPT/Ppftx5VoxSq7FDr2SrEuD3Y2oAfNF8PcdSz6acValpbISH4bW+eehOZRTWbEc/L2NeJp4qhZ7LwGXTul9nU5T5TcMg7bN4safFxZr9ZHtxZGfgPY5G90N4Eb2UJwJpdniN2KLxyeHQzJI3H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754568705; c=relaxed/simple;
	bh=vGtcGmqLXORU/EFR47QLn9An4W5po68LHvTztj41/d0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sd9tlrN1f/fVUj7pI8oSNiZ7Loi8i+3wi3yUjN3wY4ek8jWbok2FG5X7gB/8BH+KtLstF4Yj3qKwtKPXOnuPvp2q6UeF7cswNuSKA3p1n9tdAH1G4WeOqldUI1Ng8THhuZZbcVNkhSIdPVmAuxcPm6tzdoUHc2qQQ/171lN1tjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OzS4ep0z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779DDjg003806;
	Thu, 7 Aug 2025 12:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BmHTyOBHfQ7FrtdDDjAhtDrzz6aqy8AJ1xVe+BhyDsM=; b=OzS4ep0z0N0TG2E5
	7aLe5OKNOpo5OPPMpGjx/ZRUhaPp4Y18sn4eHG0ivYwLvTt1lcnfNN1mjxX/HLYT
	Ttq7yqVXPWBO7x2EVGKi/JAJpf+QaAi93Nlyh2DjI+vrN+ftxn7UJxcXXmLuLTer
	tgH0fkMfivRVVixz7eIteB7X8ORHwJlFGicZSNVZT5Ajji2GePCj7Am1bhCwMAvl
	kn2X6LqnJBx2htG7EhSMlcfy4lLG5opqzCSaInKNesRZuDOVak2L8M0P/1ebpIfN
	tKU8TL9JBaRgRHgYIqEAYW9KxtQIk6kfpw8JBOs4RWxgJ5NMuJFUBCuhdfQ6K3QW
	4+w7Vw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyae66x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 12:11:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 577CBUa6024031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Aug 2025 12:11:30 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 7 Aug 2025 05:11:25 -0700
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
Subject: [PATCH v4 1/9] media: qcom: camss: Rename camss-csid-780.c to camss-csid-gen3.c
Date: Thu, 7 Aug 2025 17:40:57 +0530
Message-ID: <20250807121105.710072-2-quic_vikramsa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: I37lKQisFHFizVj2PXfExsaQo_cTTHab
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=689497f3 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=WaFXn7faHerf0vuhdFYA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX+VxiAn9xt/SD
 LwsEDjpSDaolQQV2cb3/57IayRhIEb7rKyh96wbPL6r2vAjWPBKpSEang6ErTV7IgNKDe2GgYdu
 u2QGE2sf9N1TIIO/zKAbO6P9CrvbAkTMYL4oBMMIlkRbFMPZfWtZQQsRtr+gjrUamDULHKbtwXu
 k/PjiWtBRraFijMMI1dwQHNzN7Hoxjo0Er0YY8T6S1vIMnQ36D4R2F2fN5OhupkYUzqBOSTKQh1
 vQhRVt+Edf2D4eeXW7IIMEST8LxXXXsxi69d7vZF7SA+I8d5Z4R10i4MOIt1h7xc44FpFldK2XL
 qyDEcRm3GTS5Fzz/BP5oSTwKI7RuypicDRwEMvaY+ywCdAE+hlxZp1u/hFt1qqjcsbkj+uDA+xi
 nvgVAFvr
X-Proofpoint-GUID: I37lKQisFHFizVj2PXfExsaQo_cTTHab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

Rename the file camss-csid-780.c to camss-csid-gen3.c to enable
reuse of CSID logic across multiple SoCs.

The SA8775P SoC includes CSID 690, which is functionally very
similar to CSID 780, with only minor differences in register
bitfields. This rename prepares the codebase for supporting
additional SoCs without duplicating CSID logic.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Makefile             |  2 +-
 .../qcom/camss/{camss-csid-780.c => camss-csid-gen3.c} |  6 +++---
 .../qcom/camss/{camss-csid-780.h => camss-csid-gen3.h} |  8 ++++----
 drivers/media/platform/qcom/camss/camss-csid.h         |  2 +-
 drivers/media/platform/qcom/camss/camss.c              | 10 +++++-----
 5 files changed, 14 insertions(+), 14 deletions(-)
 rename drivers/media/platform/qcom/camss/{camss-csid-780.c => camss-csid-gen3.c} (98%)
 rename drivers/media/platform/qcom/camss/{camss-csid-780.h => camss-csid-gen3.h} (84%)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index d26a9c24a430..ee869e69521a 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -8,7 +8,7 @@ qcom-camss-objs += \
 		camss-csid-4-7.o \
 		camss-csid-680.o \
 		camss-csid-gen2.o \
-		camss-csid-780.o \
+		camss-csid-gen3.o \
 		camss-csiphy-2ph-1-0.o \
 		camss-csiphy-3ph-1-0.o \
 		camss-csiphy.o \
diff --git a/drivers/media/platform/qcom/camss/camss-csid-780.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
similarity index 98%
rename from drivers/media/platform/qcom/camss/camss-csid-780.c
rename to drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 4c720d177731..433908a54baa 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-780.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -13,7 +13,7 @@
 
 #include "camss.h"
 #include "camss-csid.h"
-#include "camss-csid-780.h"
+#include "camss-csid-gen3.h"
 
 #define CSID_IO_PATH_CFG0(csid)		(0x4 * (csid))
 #define		OUTPUT_IFE_EN			0x100
@@ -259,7 +259,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 
 			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i)) {
 				/*
-				 * For Titan 780, bus done and RUP IRQ have been moved to
+				 * For Titan Gen3, bus done and RUP IRQ have been moved to
 				 * CSID from VFE. Once CSID received bus done, need notify
 				 * VFE of this event. Trigger VFE to handle bus done process.
 				 */
@@ -325,7 +325,7 @@ static void csid_subdev_init(struct csid_device *csid)
 	csid->testgen.nmodes = CSID_PAYLOAD_MODE_DISABLED;
 }
 
-const struct csid_hw_ops csid_ops_780 = {
+const struct csid_hw_ops csid_ops_gen3 = {
 	.configure_stream = csid_configure_stream,
 	.configure_testgen_pattern = csid_configure_testgen_pattern,
 	.hw_version = csid_hw_version,
diff --git a/drivers/media/platform/qcom/camss/camss-csid-780.h b/drivers/media/platform/qcom/camss/camss-csid-gen3.h
similarity index 84%
rename from drivers/media/platform/qcom/camss/camss-csid-780.h
rename to drivers/media/platform/qcom/camss/camss-csid-gen3.h
index a990c66a60ff..6ee62da770c1 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-780.h
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.h
@@ -1,13 +1,13 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * camss-csid-780.h
+ * camss-csid-gen3.h
  *
  * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module Generation 3
  *
  * Copyright (c) 2024 Qualcomm Technologies, Inc.
  */
-#ifndef __QC_MSM_CAMSS_CSID_780_H__
-#define __QC_MSM_CAMSS_CSID_780_H__
+#ifndef __QC_MSM_CAMSS_CSID_GEN3_H__
+#define __QC_MSM_CAMSS_CSID_GEN3_H__
 
 #define DECODE_FORMAT_UNCOMPRESSED_8_BIT	0x1
 #define DECODE_FORMAT_UNCOMPRESSED_10_BIT	0x2
@@ -22,4 +22,4 @@
 #define PLAIN_FORMAT_PLAIN16	0x1 /* supports DPCM, UNCOMPRESSED_10/16_BIT */
 #define PLAIN_FORMAT_PLAIN32	0x2 /* supports UNCOMPRESSED_20_BIT */
 
-#endif /* __QC_MSM_CAMSS_CSID_780_H__ */
+#endif /* __QC_MSM_CAMSS_CSID_GEN3_H__ */
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 9dc826d8c8f6..62273ca9f199 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -215,7 +215,7 @@ extern const struct csid_hw_ops csid_ops_4_1;
 extern const struct csid_hw_ops csid_ops_4_7;
 extern const struct csid_hw_ops csid_ops_680;
 extern const struct csid_hw_ops csid_ops_gen2;
-extern const struct csid_hw_ops csid_ops_780;
+extern const struct csid_hw_ops csid_ops_gen3;
 
 /*
  * csid_is_lite - Check if CSID is CSID lite.
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index e08e70b93824..97f8e2bb6d81 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2285,7 +2285,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.csid = {
 			.is_lite = false,
 			.parent_dev_ops = &vfe_parent_dev_ops,
-			.hw_ops = &csid_ops_780,
+			.hw_ops = &csid_ops_gen3,
 			.formats = &csid_formats_gen2
 		}
 	},
@@ -2300,7 +2300,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.csid = {
 			.is_lite = false,
 			.parent_dev_ops = &vfe_parent_dev_ops,
-			.hw_ops = &csid_ops_780,
+			.hw_ops = &csid_ops_gen3,
 			.formats = &csid_formats_gen2
 		}
 	},
@@ -2315,7 +2315,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.csid = {
 			.is_lite = false,
 			.parent_dev_ops = &vfe_parent_dev_ops,
-			.hw_ops = &csid_ops_780,
+			.hw_ops = &csid_ops_gen3,
 			.formats = &csid_formats_gen2
 		}
 	},
@@ -2330,7 +2330,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.csid = {
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
-			.hw_ops = &csid_ops_780,
+			.hw_ops = &csid_ops_gen3,
 			.formats = &csid_formats_gen2
 		}
 	},
@@ -2345,7 +2345,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.csid = {
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
-			.hw_ops = &csid_ops_780,
+			.hw_ops = &csid_ops_gen3,
 			.formats = &csid_formats_gen2
 		}
 	}
-- 
2.25.1


