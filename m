Return-Path: <linux-media+bounces-23203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A409ECE2B
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 15:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9ED72857EA
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 14:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F76D2288FA;
	Wed, 11 Dec 2024 14:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fNfiNbUf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06152288DE;
	Wed, 11 Dec 2024 14:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733926153; cv=none; b=h++Y7VmsIlwNQkoqoqLqxzBq5EWvVlfJ6u77LSedZv69ELV3LIxyGWod6uGPk7b10lBqHJryPuchuA8chTFBdLbYsU3YtslksY2WUNUY/3Gp52p/vtTaoVk77RzxM+p38QxIrohK8mjNWmFSGNPC5ORAxwWclKu5rQvskc8VKfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733926153; c=relaxed/simple;
	bh=N2wTfOaqQz09iL4UuHRUTk3YkRyHZFwmbdorpn9vZPI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K2kefM4n2RQ52S4LeR9CMtF2ERXnyOnPmkXNNP7Yd6Bf/KQdaRvWmLVQOze9WQwPp+oAV7OnyrFWceQ8C1CIXUL+pxQUK6lgzFq3TspVI8KZDioZx8n8FWJ1t5CjyD0ML7W5YFS5Fd4O8hk54S0nY/qOfA4kmiz/uDqsFBOuPJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fNfiNbUf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB77nqI032030;
	Wed, 11 Dec 2024 14:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ii/olgFbnI0+Kx807JofvHfCeT2JnLbdZwXQ6+waQ9k=; b=fNfiNbUffyYpSQtJ
	8rAB+XSC6LgDXSg0o4KQCGD0x0LFIIp766KApmieYJLQgNGTB1+KrLsvCm2Kfy0e
	6BnppQC/gfLSk8GwcbwS8+ttbSSBcAKRDNBjmYYpGbWgAOdmT/IxMwRbkPlqf/kA
	qt4SZFpXS1HYwl9sMZsXbTbGwwWtPZ3iS4t7vN1wq9M3WOsR6AWJml/1U6vtlCEs
	WDT1cg2DZrESU+1Wo6aaO/zkoDAEGddk1EsLO/5FZO4O+YBP4a0C3WtAfH7awSPA
	USAyoKlELxAOu4ojTUaytdOP49IVlCDIMrvN5se6u6GWxn2ax+vfuGjj1R2S7S9B
	uILo5g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43etn8u2ww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 14:09:07 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BBE97SS003876
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 14:09:07 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Dec 2024 06:09:00 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH 07/16] media: qcom: camss: csid: Move common code into csid core
Date: Wed, 11 Dec 2024 19:37:29 +0530
Message-ID: <20241211140738.3835588-8-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241211140738.3835588-1-quic_depengs@quicinc.com>
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
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
X-Proofpoint-ORIG-GUID: gf7NYO2VDpCaTQhZ-Uxli8qpuxeE9ga3
X-Proofpoint-GUID: gf7NYO2VDpCaTQhZ-Uxli8qpuxeE9ga3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110102

The get hw version and src pad code functions can be common code in csid
core file, then the csid driver of different hw version can reuse them,
rather than adding duplicate code in csid driver for each version.

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../platform/qcom/camss/camss-csid-4-1.c      | 19 -----
 .../platform/qcom/camss/camss-csid-4-7.c      | 42 ----------
 .../platform/qcom/camss/camss-csid-gen2.c     | 60 ---------------
 .../media/platform/qcom/camss/camss-csid.c    | 77 +++++++++++++++++++
 .../media/platform/qcom/camss/camss-csid.h    | 21 +++++
 5 files changed, 98 insertions(+), 121 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-4-1.c b/drivers/media/platform/qcom/camss/camss-csid-4-1.c
index c95861420502..6998e1c52895 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-4-1.c
@@ -17,7 +17,6 @@
 #include "camss-csid-gen1.h"
 #include "camss.h"
 
-#define CAMSS_CSID_HW_VERSION		0x0
 #define CAMSS_CSID_CORE_CTRL_0		0x004
 #define CAMSS_CSID_CORE_CTRL_1		0x008
 #define CAMSS_CSID_RST_CMD		0x00c
@@ -139,15 +138,6 @@ static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
 	return 0;
 }
 
-static u32 csid_hw_version(struct csid_device *csid)
-{
-	u32 hw_version = readl_relaxed(csid->base + CAMSS_CSID_HW_VERSION);
-
-	dev_dbg(csid->camss->dev, "CSID HW Version = 0x%08x\n", hw_version);
-
-	return hw_version;
-}
-
 static irqreturn_t csid_isr(int irq, void *dev)
 {
 	struct csid_device *csid = dev;
@@ -180,15 +170,6 @@ static int csid_reset(struct csid_device *csid)
 	return 0;
 }
 
-static u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
-			     unsigned int match_format_idx, u32 match_code)
-{
-	if (match_format_idx > 0)
-		return 0;
-
-	return sink_code;
-}
-
 static void csid_subdev_init(struct csid_device *csid)
 {
 	csid->testgen.modes = csid_testgen_modes;
diff --git a/drivers/media/platform/qcom/camss/camss-csid-4-7.c b/drivers/media/platform/qcom/camss/camss-csid-4-7.c
index 08578a143688..66054d4872e6 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-4-7.c
@@ -16,7 +16,6 @@
 #include "camss-csid-gen1.h"
 #include "camss.h"
 
-#define CAMSS_CSID_HW_VERSION		0x0
 #define CAMSS_CSID_CORE_CTRL_0		0x004
 #define CAMSS_CSID_CORE_CTRL_1		0x008
 #define CAMSS_CSID_RST_CMD		0x010
@@ -151,15 +150,6 @@ static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
 	return 0;
 }
 
-static u32 csid_hw_version(struct csid_device *csid)
-{
-	u32 hw_version = readl_relaxed(csid->base + CAMSS_CSID_HW_VERSION);
-
-	dev_dbg(csid->camss->dev, "CSID HW Version = 0x%08x\n", hw_version);
-
-	return hw_version;
-}
-
 /*
  * isr - CSID module interrupt service routine
  * @irq: Interrupt line
@@ -205,38 +195,6 @@ static int csid_reset(struct csid_device *csid)
 	return 0;
 }
 
-static u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
-			     unsigned int match_format_idx, u32 match_code)
-{
-	switch (sink_code) {
-	case MEDIA_BUS_FMT_SBGGR10_1X10:
-	{
-		u32 src_code[] = {
-			MEDIA_BUS_FMT_SBGGR10_1X10,
-			MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE,
-		};
-
-		return csid_find_code(src_code, ARRAY_SIZE(src_code),
-				      match_format_idx, match_code);
-	}
-	case MEDIA_BUS_FMT_Y10_1X10:
-	{
-		u32 src_code[] = {
-			MEDIA_BUS_FMT_Y10_1X10,
-			MEDIA_BUS_FMT_Y10_2X8_PADHI_LE,
-		};
-
-		return csid_find_code(src_code, ARRAY_SIZE(src_code),
-				      match_format_idx, match_code);
-	}
-	default:
-		if (match_format_idx > 0)
-			return 0;
-
-		return sink_code;
-	}
-}
-
 static void csid_subdev_init(struct csid_device *csid)
 {
 	csid->testgen.modes = csid_testgen_modes;
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index e1c757933e27..2a1746dcc1c5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -22,11 +22,6 @@
  * alternate register layout.
  */
 
-#define CSID_HW_VERSION		0x0
-#define		HW_VERSION_STEPPING	0
-#define		HW_VERSION_REVISION	16
-#define		HW_VERSION_GENERATION	28
-
 #define CSID_RST_STROBES	0x10
 #define		RST_STROBES	0
 
@@ -351,29 +346,6 @@ static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
 	return 0;
 }
 
-/*
- * csid_hw_version - CSID hardware version query
- * @csid: CSID device
- *
- * Return HW version or error
- */
-static u32 csid_hw_version(struct csid_device *csid)
-{
-	u32 hw_version;
-	u32 hw_gen;
-	u32 hw_rev;
-	u32 hw_step;
-
-	hw_version = readl_relaxed(csid->base + CSID_HW_VERSION);
-	hw_gen = (hw_version >> HW_VERSION_GENERATION) & 0xF;
-	hw_rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
-	hw_step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
-	dev_dbg(csid->camss->dev, "CSID HW Version = %u.%u.%u\n",
-		hw_gen, hw_rev, hw_step);
-
-	return hw_version;
-}
-
 /*
  * csid_isr - CSID module interrupt service routine
  * @irq: Interrupt line
@@ -443,38 +415,6 @@ static int csid_reset(struct csid_device *csid)
 	return 0;
 }
 
-static u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
-			     unsigned int match_format_idx, u32 match_code)
-{
-	switch (sink_code) {
-	case MEDIA_BUS_FMT_SBGGR10_1X10:
-	{
-		u32 src_code[] = {
-			MEDIA_BUS_FMT_SBGGR10_1X10,
-			MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE,
-		};
-
-		return csid_find_code(src_code, ARRAY_SIZE(src_code),
-				      match_format_idx, match_code);
-	}
-	case MEDIA_BUS_FMT_Y10_1X10:
-	{
-		u32 src_code[] = {
-			MEDIA_BUS_FMT_Y10_1X10,
-			MEDIA_BUS_FMT_Y10_2X8_PADHI_LE,
-		};
-
-		return csid_find_code(src_code, ARRAY_SIZE(src_code),
-				      match_format_idx, match_code);
-	}
-	default:
-		if (match_format_idx > 0)
-			return 0;
-
-		return sink_code;
-	}
-}
-
 static void csid_subdev_init(struct csid_device *csid)
 {
 	csid->testgen.modes = csid_testgen_modes;
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 858db5d4ca75..6cf8e434dc05 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -29,6 +29,11 @@
 #define VFE_480_CSID_OFFSET 0x1200
 #define VFE_480_LITE_CSID_OFFSET 0x200
 
+#define CSID_HW_VERSION		0x0
+#define		HW_VERSION_STEPPING	0
+#define		HW_VERSION_REVISION	16
+#define		HW_VERSION_GENERATION	28
+
 #define MSM_CSID_NAME "msm_csid"
 
 const char * const csid_testgen_modes[] = {
@@ -590,6 +595,78 @@ static int csid_set_clock_rates(struct csid_device *csid)
 	return 0;
 }
 
+/*
+ * csid_hw_version - CSID hardware version query
+ * @csid: CSID device
+ *
+ * Return HW version or error
+ */
+u32 csid_hw_version(struct csid_device *csid)
+{
+	u32 hw_version;
+	u32 hw_gen;
+	u32 hw_rev;
+	u32 hw_step;
+
+	hw_version = readl_relaxed(csid->base + CSID_HW_VERSION);
+	hw_gen = (hw_version >> HW_VERSION_GENERATION) & 0xF;
+	hw_rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
+	hw_step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
+	dev_info(csid->camss->dev, "CSID:%d HW Version = %u.%u.%u\n",
+		 csid->id, hw_gen, hw_rev, hw_step);
+
+	return hw_version;
+}
+
+/*
+ * csid_src_pad_code - Pick an output/src format based on the input/sink format
+ * @csid: CSID device
+ * @sink_code: The sink format of the input
+ * @match_format_idx: Request preferred index, as defined by subdevice csid
+ *                    format. Set @match_code to 0 if used.
+ * @match_code: Request preferred code, set @match_format_idx to 0 if used
+ *
+ * Return 0 on failure or src format code otherwise
+ */
+u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
+		      unsigned int match_format_idx, u32 match_code)
+{
+	if (csid->camss->res->version == CAMSS_8x16) {
+		if (match_format_idx > 0)
+			return 0;
+
+		return sink_code;
+	}
+
+	switch (sink_code) {
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	{
+		u32 src_code[] = {
+			MEDIA_BUS_FMT_SBGGR10_1X10,
+			MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE,
+		};
+
+		return csid_find_code(src_code, ARRAY_SIZE(src_code),
+				      match_format_idx, match_code);
+	}
+	case MEDIA_BUS_FMT_Y10_1X10:
+	{
+		u32 src_code[] = {
+			MEDIA_BUS_FMT_Y10_1X10,
+			MEDIA_BUS_FMT_Y10_2X8_PADHI_LE,
+		};
+
+		return csid_find_code(src_code, ARRAY_SIZE(src_code),
+				      match_format_idx, match_code);
+	}
+	default:
+		if (match_format_idx > 0)
+			return 0;
+
+		return sink_code;
+	}
+}
+
 /*
  * csid_set_power - Power on/off CSID module
  * @sd: CSID V4L2 subdevice
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 8cdae98e4dca..f52209b96583 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -237,4 +237,25 @@ extern const struct csid_hw_ops csid_ops_gen2;
  */
 bool csid_is_lite(struct csid_device *csid);
 
+/*
+ * csid_hw_version - CSID hardware version query
+ * @csid: CSID device
+ *
+ * Return HW version or error
+ */
+u32 csid_hw_version(struct csid_device *csid);
+
+/*
+ * csid_src_pad_code - Pick an output/src format based on the input/sink format
+ * @csid: CSID device
+ * @sink_code: The sink format of the input
+ * @match_format_idx: Request preferred index, as defined by subdevice csid
+ *                    format. Set @match_code to 0 if used.
+ * @match_code: Request preferred code, set @match_format_idx to 0 if used
+ *
+ * Return 0 on failure or src format code otherwise
+ */
+u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
+		      unsigned int match_format_idx, u32 match_code);
+
 #endif /* QC_MSM_CAMSS_CSID_H */
-- 
2.34.1


