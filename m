Return-Path: <linux-media+bounces-36688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA2BAF7E91
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 19:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88A1A6E03B0
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 17:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3ABE289E03;
	Thu,  3 Jul 2025 17:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pfyMaTrP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860CC288C92;
	Thu,  3 Jul 2025 17:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751563235; cv=none; b=c42cFGz4N9KxXCzrxVlbeIrzsotxOo4LtmDcd50DT+bRe0t6s7Cp2RIQLhFB/woudHUOj5JkG9X2yse+mGkRnorK4AYuM9ZloIIzdlxzazs6j/fLYFQW2JzFJM2nyI8h/ttEif5amE1D2mj7S88eUqK9NqdcB+BK5xwjBPO/M9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751563235; c=relaxed/simple;
	bh=gLsVm9VLVkvtCHAE1H7CqlePzzxacqvoy2x0zTVoIw4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KfTqn1dLCNXrUELHeiBMJJ5HIfU/G90vHulVIbz7nW7+fkfmWqa+yjo7lZn3c0wYxGd/KUsb2LMiXpE67eJ1yMcXrIC4WDfJjTI0wU3ycWz+qAxdT01RQ40eDQfrApMWsT5a8sR4WY39Wh4ei5/jHPmEFd+K4OBdxQrUYHZzirU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pfyMaTrP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563BRh7d008506;
	Thu, 3 Jul 2025 17:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gLTPSOK+OzAjHEPchAvZu+FQELwARKXWJASIQkIYZ2w=; b=pfyMaTrPWVpsTdEK
	VVxW/NAdXqNOGV/AsQyZ43tZRg4fMBFtl329ScBhgP55OA0D7KlNa7/wXM2B9C20
	cRchf9ZZmz3IMjXGZJ2YuLyw7lDmOvcJ+AAB4gK9uu06tTbR8KmrOfhhftSMeigz
	nG3wnt4biDbr+9Ym8chFJkJ9jKNdFMvD4IzZSnAwsI2z1y9iZvflBIjq94pAlepJ
	8cznNXpXyhnISkDOvElP9Mri0KqPZkj8fL3k4/jICTUIA9QRn5P36hi2TqpAXPsX
	9GwGLypIX8y9LGkRt8uQNXw236SxILV2EifOcWcdZgr2xxHujn3FDqy6rnxxnGBX
	+6lQyA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63khgr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 17:20:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563HK8dH027255
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 17:20:08 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 10:20:02 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <quic_svankada@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/9] media: qcom: camss: Rename camss-csid-780.c to camss-csid-gen3.c
Date: Thu, 3 Jul 2025 22:49:30 +0530
Message-ID: <20250703171938.3606998-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6866bbd1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=WaFXn7faHerf0vuhdFYA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE0NCBTYWx0ZWRfXzin6qEKIEnUH
 pVsfE8uoXcLz35HWFzQBCgo94tmQc+qHhD7o3CTDNKQXmSFof850u+QxXcHJKt0F6fk7MJPkaS7
 9CbkGUnBk1dmSLgfHwl0tXRbcnS1siqYRk221UtoUgasVgcWfXR35588ocgib1BSIxkqctwZqh6
 mxM29S7zSpxTSR7c7U8fBqLmxkuPtN7SgdEAP5FEcIh+921h+3crcpYzPqi6upzzWMRYerQ0gof
 UJUiyE1yg/F4uAybghuQHzEXYo8zwmnc600Wi5ITsM0IN2b3zAMaFTrcnKONGPlTeTqKEsZKmTi
 UAi9Qkc+0QqdMwndci/1+BkcgN10wjQxAfKVTCVW3AevZXXt/+bSFaYzzQWHjC74LqRfilMi9Lw
 ifxaQrDivpBYNwXIIwoSwVOD8dyCcda82+/gJK5YagNNobpj0EV1hhnfgf6m2+yYQIz7xhiv
X-Proofpoint-ORIG-GUID: 65T7UWsW7dsxZglDFL35ieNyT8Q8DXzE
X-Proofpoint-GUID: 65T7UWsW7dsxZglDFL35ieNyT8Q8DXzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030144

Rename the file camss-csid-780.c to camss-csid-gen3.c to enable
reuse of CSID logic across multiple SoCs.

The SA8775P SoC includes CSID 690, which is functionally very
similar to CSID 780, with only minor differences in register
bitfields. This rename prepares the codebase for supporting
additional SoCs without duplicating CSID logic.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/Makefile             |  2 +-
 .../qcom/camss/{camss-csid-780.c => camss-csid-gen3.c} |  8 +++++---
 .../qcom/camss/{camss-csid-780.h => camss-csid-gen3.h} |  9 +++++----
 drivers/media/platform/qcom/camss/camss-csid.h         |  2 +-
 drivers/media/platform/qcom/camss/camss.c              | 10 +++++-----
 5 files changed, 17 insertions(+), 14 deletions(-)
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
index 4c720d177731..0941152ec301 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-780.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -4,6 +4,8 @@
  *
  * Copyright (c) 2024 Qualcomm Technologies, Inc.
  */
+
+
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
@@ -13,7 +15,7 @@
 
 #include "camss.h"
 #include "camss-csid.h"
-#include "camss-csid-780.h"
+#include "camss-csid-gen3.h"
 
 #define CSID_IO_PATH_CFG0(csid)		(0x4 * (csid))
 #define		OUTPUT_IFE_EN			0x100
@@ -259,7 +261,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 
 			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i)) {
 				/*
-				 * For Titan 780, bus done and RUP IRQ have been moved to
+				 * For Titan Gen3, bus done and RUP IRQ have been moved to
 				 * CSID from VFE. Once CSID received bus done, need notify
 				 * VFE of this event. Trigger VFE to handle bus done process.
 				 */
@@ -325,7 +327,7 @@ static void csid_subdev_init(struct csid_device *csid)
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
index a990c66a60ff..e6298042ae74 100644
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
@@ -18,8 +18,9 @@
 #define DECODE_FORMAT_UNCOMPRESSED_24_BIT	0x7
 #define DECODE_FORMAT_PAYLOAD_ONLY		0xf
 
+
 #define PLAIN_FORMAT_PLAIN8	0x0 /* supports DPCM, UNCOMPRESSED_6/8_BIT */
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
index 06f42875702f..1431e08dc04a 100644
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


