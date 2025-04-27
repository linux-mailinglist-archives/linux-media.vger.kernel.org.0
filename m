Return-Path: <linux-media+bounces-31115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B35A9E026
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 09:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20905177DF7
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 07:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFF52472A4;
	Sun, 27 Apr 2025 07:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QfHheDBL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9388B2459EE;
	Sun, 27 Apr 2025 07:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745737364; cv=none; b=t7t3/xixgx3lh3b5tNNlhl0Kkk5bo7dyIVfv5SKukEosS1caWq8sbh0rkZP+BQ92vn5vSpLSpkj77/gnGqCsnyV63ihDUIs4BbcTvsiuBg1tkvoIGHKi0nMs9e501iBiWMYWyQteXWtfqJosHo6NSwliDfw3waLYa1catYInyDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745737364; c=relaxed/simple;
	bh=oLJCHq4pqgaHS3PtRjVEVV6zs9pwCaB9kndLg8b25rI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tpn6JRfL0PI1OvjCKyW67lUT2Af4tJcZUFk3t+nvb0P1GsI5Ug8laohwZXrQ+R4i+0mYDMFop+MtnMHqx1zoHF1ORD5KcVSyCb6ZqwnhHGY3WS31UbtgdC5HLMZ5wYy6Z/5AfrtpAiW++toxAVcxm6wTqVjBC/+5+BobYUheEro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QfHheDBL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53QGM2n8011200;
	Sun, 27 Apr 2025 07:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a1b9jZwIhmbsvzlg7my+PK+iTSLNTOdYbbPraVtsR4A=; b=QfHheDBL/QiE756Q
	Ftawnx8htaDKxXG2QoVRmZ5AFSyrZ7yh+noBKCkqD6H9hSutcSDb01MKbL24Ng9w
	xARJ06BF9oTVPq6WaNxdTlmT2ATm9vl4T2faEWkaEXDt/+ApkkbLZgP20VEeGKKg
	AAbsrUyIPubnPoC2JT0993LD6P2gGrKtkzaCB3NpLSWh98von3HxQT2Qr3pdTdOH
	LWFdWCGgZ85CefM7pw26bKFlbRHAkNWRpic2sYaxEz7JH04yAD/Hg/G/zKu5E6zx
	4/W7wLvqJHZIHz553qxgyzZyGXNdnR3nRC3OtOoiZNIOKf6LaxI+lhuqZzdGuJnK
	Xcnxxw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq5b6f3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 07:02:15 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53R72EOH005650
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 07:02:14 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 27 Apr 2025 00:02:08 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH RFC/WIP v2 1/9] media: qcom: camss: add generic csid handling in csid gen3
Date: Sun, 27 Apr 2025 12:31:27 +0530
Message-ID: <20250427070135.884623-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
References: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: ljEiZQDaib6bx2WjN_ewjWfnVEv-A1ia
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI3MDA1NSBTYWx0ZWRfXzv939D57uXM3 CVA4LfZ/t6D+8+uCA2YEQK1Rb/lvhmE8aFxH2i/jIdXZZrwmIi6WKjnqbpXsufg+sMc7lOBWkPV eOsxpt4JBRU+rPluaONy/qJ0Z31oC35AHmXlDl1Ov/KRHes8iTMkmjb0vnEd/9iTXuAPgr2xhXo
 SGtWfriqucwLtACG7tC1KZTqzAtdoKjHR4JZIfS879V6nRK/J1uKCChp44+keRKuYfOQmpIUc3/ bwV6PIPjtxkH26BcYCwm3mB+0BlUF8KL5i2ya2aUCn8BU5WhJNfCYmobe4F0TeDfThEbpawHonK pJ0AeHKz6G5OWe2fGDyad7C0rCc8TyOF667eHMPFtzSiW0BePuHJUBUUo4hcnn0HxMidDqYLu33
 sysDlyRYujpdMfdDHjrQVbqtRDX9viOOxLajHk0TUb5MbIUsJfD4X+HhQsl4AZyazC7cjNun
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=680dd677 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=WaFXn7faHerf0vuhdFYA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ljEiZQDaib6bx2WjN_ewjWfnVEv-A1ia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-27_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504270055

Rename camss-csid-780.c to camss-csid-gen3.c to avoid code duplication
for later SOCs i.e SA8775P. SA8775P have csid 690 which is almost same
as csid 780 with very minor changes in register bitfield.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/Makefile            |  2 +-
 .../camss/{camss-csid-780.c => camss-csid-gen3.c}     | 11 +++++++----
 .../camss/{camss-csid-780.h => camss-csid-gen3.h}     |  9 +++++----
 drivers/media/platform/qcom/camss/camss-csid.h        |  2 +-
 drivers/media/platform/qcom/camss/camss.c             | 10 +++++-----
 5 files changed, 19 insertions(+), 15 deletions(-)
 rename drivers/media/platform/qcom/camss/{camss-csid-780.c => camss-csid-gen3.c} (97%)
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
similarity index 97%
rename from drivers/media/platform/qcom/camss/camss-csid-780.c
rename to drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 4c720d177731..b66105f7b901 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-780.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -1,9 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
+ * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module gen3
+ * Gen3 Supports Qualcomm csid version 780 and 690
  *
  * Copyright (c) 2024 Qualcomm Technologies, Inc.
  */
+
+
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
@@ -13,7 +16,7 @@
 
 #include "camss.h"
 #include "camss-csid.h"
-#include "camss-csid-780.h"
+#include "camss-csid-gen3.h"
 
 #define CSID_IO_PATH_CFG0(csid)		(0x4 * (csid))
 #define		OUTPUT_IFE_EN			0x100
@@ -259,7 +262,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 
 			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i)) {
 				/*
-				 * For Titan 780, bus done and RUP IRQ have been moved to
+				 * For Titan Gen3, bus done and RUP IRQ have been moved to
 				 * CSID from VFE. Once CSID received bus done, need notify
 				 * VFE of this event. Trigger VFE to handle bus done process.
 				 */
@@ -325,7 +328,7 @@ static void csid_subdev_init(struct csid_device *csid)
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


