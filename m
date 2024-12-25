Return-Path: <linux-media+bounces-24068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3242C9FC577
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 14:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88C9F1883E37
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 13:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9F51CDA01;
	Wed, 25 Dec 2024 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D+IwHgRJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C53E1B4148;
	Wed, 25 Dec 2024 13:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735133783; cv=none; b=dJnjQstu6uVGR+8c9ArWuTpA7V4aB6sFZfEnwn1MljmJ+DjbL+jx3ieB0si7MjYhSKl4OTx+CZOAOqNpM77MhxMz5mTm50j1J3fW5GP7M+51Vi9OSUYgJt19Z9simSGY/mUH1qGd5AJ6SrXpzpdw+mo+sX+lasfi3xml/g8xMs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735133783; c=relaxed/simple;
	bh=N2wTfOaqQz09iL4UuHRUTk3YkRyHZFwmbdorpn9vZPI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EU5RJ8Dlm60ddjlOFVaiS4mqlSFMCN0t9x/5q9bRB6gqAwr8RakqyYf7rFr9ZmgpPtTcFMOEeVHgf3Z1LVnFX5QevXGldfmSgG+6fyEbu5+U//K4gjnlnkZnESCiHFBVdGqzpgSZkrrQuvCzSEhj5b92EkLU8nnBYuiD01+JRfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D+IwHgRJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP66X2C030310;
	Wed, 25 Dec 2024 13:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ii/olgFbnI0+Kx807JofvHfCeT2JnLbdZwXQ6+waQ9k=; b=D+IwHgRJNQCB7ZvO
	1S65sLENp9LSeKqOU6V9TJ0WNi+GiYGeFKIqsiz9emtX8lkMU1oxV3XkgRnOkoHD
	To5na2exbXkFhNrAqICLKdUqNJIMlnhNXccTwtKgXGHE/wBulReZg0cAQyKR0c0c
	LBq7rB0jVOOUHIpaPDuNW7PvJV9G1E4Umf0sTx0mB+cqdyFYlbmqAzeYkAMZyY5k
	siSEeuyBOl0fTMDGATHEhdmhqyZ3oIFsOU1iVIgB2hJbUshuKFMgFhMyx4YRImov
	bQDk0hIZw402QDaJ0jAy+zD3ZjNg+/VSN9XTFq+Iv17Rpem+jhZSvHeZaaDvibCz
	XWhCYQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rcg8h5r8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 13:36:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BPDaBND032740
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 13:36:11 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Dec 2024 05:36:04 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH 07/16] media: qcom: camss: csid: Move common code into csid core
Date: Wed, 25 Dec 2024 19:05:14 +0530
Message-ID: <20241225133523.4034820-8-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241225133523.4034820-1-quic_depengs@quicinc.com>
References: <20241225133523.4034820-1-quic_depengs@quicinc.com>
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
X-Proofpoint-GUID: jupIPzN5IiiuZ7OAQBaY7iInriL7mYTU
X-Proofpoint-ORIG-GUID: jupIPzN5IiiuZ7OAQBaY7iInriL7mYTU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 spamscore=0
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412250121

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


