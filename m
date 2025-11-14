Return-Path: <linux-media+bounces-47057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 11311C5BB85
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 08:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 70B1C4F3091
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 07:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43292F6195;
	Fri, 14 Nov 2025 07:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVpgvx3U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hkunjBcl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F992F5A35
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 07:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763104306; cv=none; b=sY0G49BOXw4iOX1eTOQaFTx6ltk7Q6Tz/PvlQLCQP9+YLllLjBfMSEc6jrabMGVoip7/GATzT2yMZ7E2Ka+4pBFGfvM4kjDbP8mWxIr0YZmuZr7aTLQZ6vLQiIi+eP/tVDpyLoeVXG46iwGqRCUPGXkqO/RVgjgqOqIaLUF3LqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763104306; c=relaxed/simple;
	bh=8S31U7MmYPn2nmhGIIm4RCr89FexhlrQA6cvwYJmvFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R16PF7+zNsCv0ltMYcOn/4/v5FNdYUqByJVR2dnuDX+vmnbIb3smqSlaxBy45Kkf+Xje7xfh16cuJZwa6A5urnd1kz7S7qvIOq3bhkxv+jOYkNZ6T0A8okfNmAAbhtzJe3xmk6C1voId8gLK9QT7W6ILisF9giHM8rZhfTEs6hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVpgvx3U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hkunjBcl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMao521629664
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 07:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XktchzTOMtCDjUaDtSoz0Q0aJB0fGkJ8c3O1MVr7kNE=; b=HVpgvx3UnFo/t+xd
	ih4LdCrS0brReCG9J9fcGk/obi4Tbifte1McgBicuwMuhHJcjyt3V/OpUOl099Fq
	znQA/KW88pNz+DLG1ytQ8IIUQecIHNzZOFeXRo5Cta5H77H9IHSKdoYcOszigAjB
	MrZhcq/1ohr9QanCg1/q7i9553jKdxt0DD87yyIyDtL/2XfLBdIFYAuh57DiLc4N
	6IIF98tPLOAh7ilmi8DtMc5EIUcbdP/WSI9hTjPJ8ud1v85B+arfSHxow9iKUWEI
	AG+82O1r7ymTCE973uBA6aPmfjy1Tm8qyUWdGlq+PxqcfmSvZhrIaa2dJqedRbrM
	3wpPag==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9d97b5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 07:11:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88236bcdfc4so48111026d6.1
        for <linux-media@vger.kernel.org>; Thu, 13 Nov 2025 23:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763104301; x=1763709101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XktchzTOMtCDjUaDtSoz0Q0aJB0fGkJ8c3O1MVr7kNE=;
        b=hkunjBcl92yZXnZ3SBkCmuAtE4t3dzDR2qPe9/kMgVmRuLyxovRCSrNXFkZ4xf+RvX
         kclablyqk2sk/NHjmMd7zDo/Cf9IZ2zQbejbQTQieFbMLpX6bfFkEo2r7L3Kq5kUwhON
         qQxTOr9TYDeQtc58mIDG5tfEm1vD0moZv+xEjM/bwN3UzwI/UWWCOCVB3PSwyyNu10sb
         E2ItF6fF1KY0DcS1pnoUyhrtNaL6U3xeX6Nx/T/Ff8p5Is+cjG9vjE2Yqjuy90UoZqun
         +yepGCnP+6f1nYETXgu+RJ+1trkOk+vKHIVHG0qrK/+llA4NXpXHbwXu94qaiyGLYmOv
         CAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763104301; x=1763709101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XktchzTOMtCDjUaDtSoz0Q0aJB0fGkJ8c3O1MVr7kNE=;
        b=sIM7G48GHY5H1SXe7mQs/nljfQiDbtsaVyWN7nl+oddJsb0G3eUYzaVUonGdc8lSQv
         WM6ZrFANmgnW2u2aznjDsV/uoezJ0w2bZz8siFRjCpzLpk7OPrE50upDfT1mMuuIo5pb
         zk/Ee9RhCZWZ+fDStyBGxWZ0vtEv3bd4cqySlE+noTP146GM4IMPbPMzHHuyC6b4OFU9
         VegVRmuhWTcCJsvLvCLUziINujIUxJ06WbxtZ3iDQNXdWAeZle5mL4/t/GfPDoHvlsSI
         q8NT+fCNRJOAAtnOwV05KuTUAVjw7I/yGDLFIwpghwT6bBxiC4hF5tIkVqVt/X2Xiws3
         VT4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHlvSHXhPaBVPgY2YxIDtjL2jP3xOPsWON5eWpkT3lYQaTLI92c4v1vLTLAcoKzqogtYbnDiWJ4Um+Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdsjmvxw6t7JBLdjlULw48fbef7G1nOilgqkHiI5dcSyJjsHRp
	l/MKyN/JyHyvFQWwrlnc23i20m1FlKjaU35T+w2DBwsNBTTneJQsMUxAphlAjxgtFL4f3tZR7fs
	ZPVu3Ys+U7mWEG1s4Pgvs9adgRkNUDMUb7TGJl9J4hgZEg2q1An5uC2v0ZjgT6OMwHQ==
X-Gm-Gg: ASbGncsV8ETKgMoKxnPypaxhtKB4FdIOJB5FhDbM6NR4qY49uHXCoPYeYIJzySp4/Po
	tGDJIR01JcDtWVia2VY7mGlQ8fGrDbhfS/zeV3SBJYed3XTMRcaplCV7CP1W/h/8ZB+UST8yV85
	ncpQBjKm1BaMiTAF2qcTUAaGNH/7mPK7v7GBCrDtab1JMASNLrMjecbfTxeFI22oem5N/k4rT9K
	WQPaqycJ76w3q6q1/OzdnI9c26DrjVBltGsJ5LabesA6YZi8iGO4O6voI0isWtpl1iYIJiELlbr
	PcaW/vOtRrZXd+KQCLqo/dKLYe7h2lw7yRJeVsy7UFJzM1j9bZ6Wa9zTvxR4evatFm5+REcKp16
	tO7s9uCebXq5zwM65xyNu9uOsX2PH3EjUJamF8Cz65aictdi4eD796Hhr7/RI+nczUA==
X-Received: by 2002:a05:6214:268a:b0:87b:b3a2:6727 with SMTP id 6a1803df08f44-88292695b52mr26555876d6.45.1763104301181;
        Thu, 13 Nov 2025 23:11:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwZyyV/NX/cpzzNAvb91tVO8m3mDf2wWW+E3EJcEZu+5EvyAX+MgsuTKfOobSliRbgJN79bQ==
X-Received: by 2002:a05:6214:268a:b0:87b:b3a2:6727 with SMTP id 6a1803df08f44-88292695b52mr26555566d6.45.1763104300606;
        Thu, 13 Nov 2025 23:11:40 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-882862ce056sm26336666d6.6.2025.11.13.23.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:11:39 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 15:11:20 +0800
Subject: [PATCH v6 3/3] media: qcom: camss: tpg: Add TPG support for LeMans
 and Monaco
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-camss_tpg-v6-3-38d3d9fbe339@oss.qualcomm.com>
References: <20251114-camss_tpg-v6-0-38d3d9fbe339@oss.qualcomm.com>
In-Reply-To: <20251114-camss_tpg-v6-0-38d3d9fbe339@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763104282; l=13720;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=8S31U7MmYPn2nmhGIIm4RCr89FexhlrQA6cvwYJmvFw=;
 b=MtGE3nJYDNdV4886Dxjf/kv+txNGX15r0lme6Jgh3HmjFVqa/Vwe7FuJrico1KnXH/mwHD+od
 C9+9x3R8R1iA/wQeHftpgpZTsmIY5lNoYnZRdoYhGOt8QwnecBiWzIF
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: 4PK9eB7yG59mR8zhRSNugWarY1oVlubJ
X-Authority-Analysis: v=2.4 cv=Rdidyltv c=1 sm=1 tr=0 ts=6916d62e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=d2G8kzP7RSt0yfC46H0A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 4PK9eB7yG59mR8zhRSNugWarY1oVlubJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA1NSBTYWx0ZWRfX+zdRWyDBFS2B
 QP777479vmSL7LB0+SVM6Sw86BxaXNq57G6zlQaMvdau2yZI5+GvvL/YFzoSe9O84DEw7vrP53U
 qDzaZ6sMyG2D0rgaGm+iPIxJKTDnTxqFf1VLqunY0xFa4qKsL+VZ/yAdvse7waV6XuOuY8nNF16
 8xOHRz5VZhf/MJdxouy176MgQTyWHrWysrb7YZZ1/sfnwB5JC0ElExJK2Uv70xyxMeuOm92XKar
 MSid30UqEpOaMvlzReVAeIIISBDW6cuKjLhgc2Whw6+yNSaEMNhr/81Ze7GVMc/cavDLzXgq1Ys
 qC5dzuWd5FcdoTv0+JoeMp6N0FtNkDe9vQ+pVpnaFc/mpqCuFV8ujbww6h4EbF9irFtjdVuFITX
 QF3zArt0qo2auJZlOJ3Ci6hu9q213g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140055

Add support for TPG found on LeMans and Monaco.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  16 ++
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 235 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.c          |  67 ++++++
 4 files changed, 319 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index d355e67c25700ac061b878543c32ed8defc03ad0..e8996dacf1771d13ec1936c9bebc0e71566898ef 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -28,5 +28,6 @@ qcom-camss-objs += \
 		camss-video.o \
 		camss-format.o \
 		camss-tpg.o \
+		camss-tpg-gen1.o \
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 664245cf6eb0cac662b02f8b920cd1c72db0aeb2..2c94727daeb799aa4f72250cbb2d9c443c5fe351 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -66,6 +66,8 @@
 #define		CSI2_RX_CFG0_VC_MODE		3
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL	20
+#define		CSI2_RX_CFG0_TPG_NUM_EN		27
+#define		CSI2_RX_CFG0_TPG_NUM_SEL	28
 
 #define CSID_CSI2_RX_CFG1		0x204
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN	BIT(0)
@@ -109,11 +111,25 @@ static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy, int vc)
 {
 	int val;
+	struct camss *camss;
+	struct tpg_device *tpg;
 
+	camss = csid->camss;
 	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
 	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << CSI2_RX_CFG0_PHY_NUM_SEL;
 
+	if (camss->tpg) {
+		tpg = &camss->tpg[phy->csiphy_id];
+
+		if (tpg->testgen.mode > 0) {
+			val |= (phy->csiphy_id + 1) << CSI2_RX_CFG0_TPG_NUM_SEL;
+			val |= 1 << CSI2_RX_CFG0_TPG_NUM_EN;
+		} else {
+			val &= ~(CSI2_RX_CFG0_TPG_NUM_SEL | CSI2_RX_CFG0_TPG_NUM_EN);
+		}
+	}
+
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
new file mode 100644
index 0000000000000000000000000000000000000000..931e14f32bbeb317db33de39f248f9e2870dd3a9
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -0,0 +1,235 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *
+ * Qualcomm MSM Camera Subsystem - TPG (Test Patter Generator) Module
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/bitfield.h>
+#include <linux/completion.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+
+#include "camss-tpg.h"
+#include "camss.h"
+
+#define TPG_HW_VERSION		0x0
+# define HW_VERSION_STEPPING		GENMASK(15, 0)
+# define HW_VERSION_REVISION		GENMASK(27, 16)
+# define HW_VERSION_GENERATION		GENMASK(31, 28)
+
+#define TPG_HW_STATUS		0x4
+
+#define TPG_VC_n_GAIN_CFG(n)		(0x60 + (n) * 0x60)
+
+#define TPG_CTRL		0x64
+# define TPG_CTRL_TEST_EN		BIT(0)
+# define TPG_CTRL_PHY_SEL		BIT(3)
+# define TPG_CTRL_NUM_ACTIVE_LANES	GENMASK(5, 4)
+# define TPG_CTRL_VC_DT_PATTERN_ID	GENMASK(8, 6)
+# define TPG_CTRL_OVERLAP_SHDR_EN	BIT(10)
+# define TPG_CTRL_NUM_ACTIVE_VC		GENMASK(31, 30)
+#  define NUM_ACTIVE_VC_0_ENABLED		0
+#  define NUM_ACTIVE_VC_0_1_ENABLED		1
+#  define NUM_ACTIVE_VC_0_1_2_ENABLED		2
+#  define NUM_ACTIVE_VC_0_1_3_ENABLED		3
+
+#define TPG_VC_n_CFG0(n)	(0x68 + (n) * 0x60)
+# define TPG_VC_n_CFG0_VC_NUM			GENMASK(4, 0)
+# define TPG_VC_n_CFG0_NUM_ACTIVE_DT		GENMASK(9, 8)
+#  define NUM_ACTIVE_SLOTS_0_ENABLED			0
+#  define NUM_ACTIVE_SLOTS_0_1_ENABLED			1
+#  define NUM_ACTIVE_SLOTS_0_1_2_ENABLED		2
+#  define NUM_ACTIVE_SLOTS_0_1_3_ENABLED		3
+# define TPG_VC_n_CFG0_NUM_BATCH		GENMASK(15, 12)
+# define TPG_VC_n_CFG0_NUM_FRAMES		GENMASK(31, 16)
+
+#define TPG_VC_n_LSFR_SEED(n)	(0x6C + (n) * 0x60)
+
+#define TPG_VC_n_HBI_CFG(n)	(0x70 + (n) * 0x60)
+
+#define TPG_VC_n_VBI_CFG(n)	(0x74 + (n) * 0x60)
+
+#define TPG_VC_n_COLOR_BARS_CFG(n)		(0x78 + (n) * 0x60)
+# define TPG_VC_n_COLOR_BARS_CFG_PIX_PATTERN		GENMASK(2, 0)
+# define TPG_VC_n_COLOR_BARS_CFG_QCFA_EN		BIT(3)
+# define TPG_VC_n_COLOR_BARS_CFG_SPLIT_EN		BIT(4)
+# define TPG_VC_n_COLOR_BARS_CFG_NOISE_EN		BIT(5)
+# define TPG_VC_n_COLOR_BARS_CFG_ROTATE_PERIOD		GENMASK(13, 8)
+# define TPG_VC_n_COLOR_BARS_CFG_XCFA_EN		BIT(16)
+# define TPG_VC_n_COLOR_BARS_CFG_SIZE_X			GENMASK(26, 24)
+# define TPG_VC_n_COLOR_BARS_CFG_SIZE_Y			GENMASK(30, 28)
+
+#define TPG_VC_m_DT_n_CFG_0(m, n)		(0x7C + (m) * 0x60 + (n) * 0xC)
+# define TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT	GENMASK(15, 0)
+# define TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH	GENMASK(31, 16)
+
+#define TPG_VC_m_DT_n_CFG_1(m, n)		(0x80 + (m) * 0x60 + (n) * 0xC)
+# define TPG_VC_m_DT_n_CFG_1_DATA_TYPE		GENMASK(5, 0)
+# define TPG_VC_m_DT_n_CFG_1_ECC_XOR_MASK	GENMASK(13, 8)
+# define TPG_VC_m_DT_n_CFG_1_CRC_XOR_MASK	GENMASK(31, 16)
+
+#define TPG_VC_m_DT_n_CFG_2(m, n)		(0x84 + (m) * 0x60 + (n) * 0xC)
+# define TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE		GENMASK(3, 0)
+# define TPG_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD	GENMASK(27, 4)
+# define TPG_VC_m_DT_n_CFG_2_ENCODE_FORMAT		GENMASK(31, 28)
+
+#define TPG_VC_n_COLOR_BAR_CFA_COLOR0(n)	(0xB0 + (n) * 0x60)
+#define TPG_VC_n_COLOR_BAR_CFA_COLOR1(n)	(0xB4 + (n) * 0x60)
+#define TPG_VC_n_COLOR_BAR_CFA_COLOR2(n)	(0xB8 + (n) * 0x60)
+#define TPG_VC_n_COLOR_BAR_CFA_COLOR3(n)	(0xBC + (n) * 0x60)
+
+/* Line offset between VC(n) and VC(n-1), n form 1 to 3 */
+#define TPG_VC_n_SHDR_CFG	(0x84 + (n) * 0x60)
+
+#define TPG_CLEAR		0x1F4
+
+#define TPG_HBI_PCT_DEFAULT			545	/* 545% */
+#define TPG_VBI_PCT_DEFAULT			10	/* 10% */
+#define PERCENT_BASE				100
+#define BITS_PER_BYTE				8
+
+/* Default user-specified payload for TPG test generator.
+ * Keep consistent with CSID TPG default: 0xBE.
+ */
+#define TPG_USER_SPECIFIED_PAYLOAD_DEFAULT	0xBE
+#define TPG_LFSR_SEED_DEFAULT			0x12345678
+#define TPG_COLOR_BARS_CFG_STANDARD \
+	FIELD_PREP(TPG_VC_n_COLOR_BARS_CFG_ROTATE_PERIOD, 0xA)
+
+static int tpg_stream_on(struct tpg_device *tpg)
+{
+	struct tpg_testgen_config *tg = &tpg->testgen;
+	struct v4l2_mbus_framefmt *input_format;
+	const struct tpg_format_info *format;
+	u8 lane_cnt = tpg->res->lane_cnt;
+	u8 dt_cnt = 0;
+	u8 i;
+	u32 val;
+
+	/* Loop through all enabled VCs and configure stream for each */
+	for (i = 0; i < tpg->res->vc_cnt; i++) {
+		input_format = &tpg->fmt[MSM_TPG_PAD_SRC + i];
+		format = tpg_get_fmt_entry(tpg,
+					   tpg->res->formats->formats,
+					   tpg->res->formats->nformats,
+					   input_format->code);
+		if (IS_ERR(format))
+			return -EINVAL;
+
+		val = FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT, input_format->height & 0xffff) |
+		      FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH, input_format->width & 0xffff);
+		writel(val, tpg->base + TPG_VC_m_DT_n_CFG_0(i, dt_cnt));
+
+		val = FIELD_PREP(TPG_VC_m_DT_n_CFG_1_DATA_TYPE, format->data_type);
+		writel(val, tpg->base + TPG_VC_m_DT_n_CFG_1(i, dt_cnt));
+
+		val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, tg->mode - 1) |
+		      FIELD_PREP(TPG_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
+				 TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
+		      FIELD_PREP(TPG_VC_m_DT_n_CFG_2_ENCODE_FORMAT, format->encode_format);
+		writel(val, tpg->base + TPG_VC_m_DT_n_CFG_2(i, dt_cnt));
+
+		writel(TPG_COLOR_BARS_CFG_STANDARD, tpg->base + TPG_VC_n_COLOR_BARS_CFG(i));
+
+		val = DIV_ROUND_UP(input_format->width * format->bpp * TPG_HBI_PCT_DEFAULT,
+				   BITS_PER_BYTE * lane_cnt * PERCENT_BASE);
+		writel(val, tpg->base + TPG_VC_n_HBI_CFG(i));
+		val = input_format->height * TPG_VBI_PCT_DEFAULT / PERCENT_BASE;
+		writel(val, tpg->base + TPG_VC_n_VBI_CFG(i));
+
+		writel(TPG_LFSR_SEED_DEFAULT, tpg->base + TPG_VC_n_LSFR_SEED(i));
+
+		/* configure one DT, infinite frames */
+		val = FIELD_PREP(TPG_VC_n_CFG0_VC_NUM, i) |
+		      FIELD_PREP(TPG_VC_n_CFG0_NUM_FRAMES, 0);
+		writel(val, tpg->base + TPG_VC_n_CFG0(i));
+	}
+
+	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
+		  FIELD_PREP(TPG_CTRL_PHY_SEL, 0) |
+		  FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
+		  FIELD_PREP(TPG_CTRL_VC_DT_PATTERN_ID, 0) |
+		  FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, tpg->res->vc_cnt - 1);
+	writel(val, tpg->base + TPG_CTRL);
+
+	return 0;
+}
+
+static void tpg_stream_off(struct tpg_device *tpg)
+{
+	writel(0, tpg->base + TPG_CTRL);
+	writel(1, tpg->base + TPG_CLEAR);
+}
+
+static int tpg_configure_stream(struct tpg_device *tpg, u8 enable)
+{
+	int ret = 0;
+
+	if (enable)
+		ret = tpg_stream_on(tpg);
+	else
+		tpg_stream_off(tpg);
+
+	return ret;
+}
+
+static int tpg_configure_testgen_pattern(struct tpg_device *tpg, s32 val)
+{
+	if (val > 0 && val <= TPG_PAYLOAD_MODE_COLOR_BARS)
+		tpg->testgen.mode = val;
+
+	return 0;
+}
+
+/*
+ * tpg_hw_version - tpg hardware version query
+ * @tpg: tpg device
+ *
+ * Return HW version or error
+ */
+static u32 tpg_hw_version(struct tpg_device *tpg)
+{
+	u32 hw_version;
+	u32 hw_gen;
+	u32 hw_rev;
+	u32 hw_step;
+
+	hw_version = readl(tpg->base + TPG_HW_VERSION);
+	hw_gen = FIELD_GET(HW_VERSION_GENERATION, hw_version);
+	hw_rev = FIELD_GET(HW_VERSION_REVISION, hw_version);
+	hw_step = FIELD_GET(HW_VERSION_STEPPING, hw_version);
+	dev_dbg_once(tpg->camss->dev, "tpg HW Version = %u.%u.%u\n",
+		     hw_gen, hw_rev, hw_step);
+
+	return hw_version;
+}
+
+/*
+ * tpg_reset - Trigger reset on tpg module and wait to complete
+ * @tpg: tpg device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int tpg_reset(struct tpg_device *tpg)
+{
+	writel(0, tpg->base + TPG_CTRL);
+	writel(1, tpg->base + TPG_CLEAR);
+
+	return 0;
+}
+
+static void tpg_subdev_init(struct tpg_device *tpg)
+{
+	tpg->testgen.modes = testgen_payload_modes;
+	tpg->testgen.nmodes = TPG_PAYLOAD_MODE_NUM_SUPPORTED_GEN1;
+}
+
+const struct tpg_hw_ops tpg_ops_gen1 = {
+	.configure_stream = tpg_configure_stream,
+	.configure_testgen_pattern = tpg_configure_testgen_pattern,
+	.hw_version = tpg_hw_version,
+	.reset = tpg_reset,
+	.subdev_init = tpg_subdev_init,
+};
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 43fdcb9af101ef34b118035ca9c68757b66118df..667fd03502058745dfbf34923a26ac4a54677798 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3199,6 +3199,62 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources tpg_res_8775p[] = {
+	/* TPG0 */
+	{
+		.regulators = {  },
+		.clock = { "csiphy_rx", "camnoc_axi" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 400000000 },
+		},
+		.reg = { "tpg0" },
+		.interrupt = { "tpg0" },
+		.tpg = {
+			.lane_cnt = 4,
+			.vc_cnt = 1,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+
+	/* TPG1 */
+	{
+		.regulators = {  },
+		.clock = { "csiphy_rx", "camnoc_axi" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 400000000 },
+		},
+		.reg = { "tpg1" },
+		.interrupt = { "tpg1" },
+		.tpg = {
+			.lane_cnt = 4,
+			.vc_cnt = 1,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+
+	/* TPG2 */
+	{
+		.regulators = {  },
+		.clock = { "csiphy_rx", "camnoc_axi" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 400000000 },
+		},
+		.reg = { "tpg2" },
+		.interrupt = { "tpg2" },
+		.tpg = {
+			.lane_cnt = 4,
+			.vc_cnt = 1,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+};
+
 static const struct camss_subdev_resources csid_res_8775p[] = {
 	/* CSID0 */
 	{
@@ -4674,6 +4730,13 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss->csiphy)
 		return -ENOMEM;
 
+	if (camss->res->tpg_num > 0) {
+		camss->tpg = devm_kcalloc(dev, camss->res->tpg_num,
+					  sizeof(*camss->tpg), GFP_KERNEL);
+		if (!camss->tpg)
+			return -ENOMEM;
+	}
+
 	camss->csid = devm_kcalloc(dev, camss->res->csid_num, sizeof(*camss->csid),
 				   GFP_KERNEL);
 	if (!camss->csid)
@@ -4863,11 +4926,13 @@ static const struct camss_resources qcs8300_resources = {
 	.version = CAMSS_8300,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8300,
+	.tpg_res = tpg_res_8775p,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.vfe_res = vfe_res_8775p,
 	.icc_res = icc_res_qcs8300,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8300),
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
 	.csid_num = ARRAY_SIZE(csid_res_8775p),
 	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
 	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
@@ -4877,11 +4942,13 @@ static const struct camss_resources sa8775p_resources = {
 	.version = CAMSS_8775P,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8775p,
+	.tpg_res = tpg_res_8775p,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.vfe_res = vfe_res_8775p,
 	.icc_res = icc_res_sa8775p,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8775p),
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
 	.csid_num = ARRAY_SIZE(csid_res_8775p),
 	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
 	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),

-- 
2.34.1


