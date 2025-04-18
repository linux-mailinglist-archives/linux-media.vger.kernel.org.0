Return-Path: <linux-media+bounces-30547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74262A93859
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 16:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 631E744015A
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 14:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6662A15746F;
	Fri, 18 Apr 2025 14:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADXeD5sV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D7F15852F
	for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 14:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744985517; cv=none; b=s95PAWzTXSxuMQuztZhjqWJLDh/xRWePudXeLCMoBTN6lkK7B+y7BHtlSS9jkevz/9DLJipwQWxdRWL80cmHkwQqNu2mq1Rlb4HgttrO0Ed4yw/3zuvxCu9OiID0kA6fz3fqFmI5o4IxfjiSXU/tas3oMQqCdB0ndZhApd14yaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744985517; c=relaxed/simple;
	bh=cNQAmYFP4ZCzwRoDr71PI3p2hhW5R8r2x37XXi1XxtI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jOijvu8YVyOmWvFl4BRzqMZHVPtPHp3ha3ZfOZF1cGrOtK38LbQ+4D+62DCVKGBWkimYp3afaW8k37mt9vudEmCtLs9YFfMCQqU1pVbcrHQ46lLMkWXhLuALqIarRD4N3SonhQM4DtlHkFTKWeWwUJEVuL4wR4wuitSp8Oqth5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADXeD5sV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I27gUc023428
	for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 14:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SaR7ioYiruE
	GWEDgtvRdMsBeNGg0Xxv2OQTLT9fqir0=; b=ADXeD5sVDPPW1xnw9WrgqFGZNFm
	jjSbnMOFe7yWnfXN8KAd0jaWgRa72tY/BMpwVtpQwf2Z24R3honfbHMRgtUcwrzR
	K+hrjC8uMklKxRNNVLEK142i2xFDyUSyAoMBKU1GxmW1bpwsVPpznRz8dDOfBDjp
	fwhUoYf2vl+d0BkEO5r2ZiAPM3hNTfnbrIFUIhJZqjz8QWfCXtECm/spPW4bjV69
	vCjobo3YgSU0jRNC7K97xbePsruacBGRZU/lPLZsDr+6eKegq8RKbi7cjgUZJqDW
	gJR8NHd3I0TxHiafAnYCRCPKr9HFQrgLu6tSNYPE7LP1Tut8C/SqGy8SokQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbq1vpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 14:11:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c549ea7166so251934285a.2
        for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 07:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744985514; x=1745590314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaR7ioYiruEGWEDgtvRdMsBeNGg0Xxv2OQTLT9fqir0=;
        b=QYob+URmgZG/KhtUJg1PvimMQDzYmCw9MBmhTMiFcuxz5tY0bJeu6Kk/9cCYK8O+Sy
         H6HzQqMV2+Z1X0mesAHtjhCzn5KfvO4ekgWGCcxILqU5bfttOL9zdmFjCJWjQV5FE4gI
         3uhhpDPT2wmULgDw2Gl3DLDT36DZmNunE9aUWvpY/+bkLv/Q/Y4ge4UfmljA66cp7Bva
         QVlklL0BAEfnqoOKOK88foNKVffQsbRLoi18V+9i51MvaTDXAYaqOqyjPc6+ZQar2e3h
         9VfrLQsdMcLmj0Bb4eWOGwfeC7ooyHfo14J1rRvAB8WI0phgIWemgBw0gVg9Qi7qn5QV
         DGeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLq24piLvVX6AbJuLtUwagcRa4AvfT72lpn6h8GcQe0glrOzxogqIC7iLTn+LV5uzRgM3+mmYgamTFcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMYpAaPXWKzVll9wwJ3uYJ9nMn6VnalDDaN4hF+jz7bFYwfL9C
	Nvk/mPWP1zygyzNvPT6HNPWEUkdJ/ZCGNLIr2Z/jNdP+qavdnNS9fLNoeV9vvZHEV7J5Lxc5cE0
	4scM3O7T4D9zwpQyxjbhpfqELDUxJFlZil3k0gmoXFLBEYCdcgq7SmMrlcxxEdw==
X-Gm-Gg: ASbGncvO7ybeikoYXFnPDYJGRuYswBPeMZubJtCozWk4UpcjYdZ1t1xT2w3L8UUkRt3
	Z1cH/0fzICWy6sgqnTh+f4myAzJpY/m/xnf3ay8/tlOvZoPGTqh/DA7lFk2Z2yDMQWJtw6+Zb2Q
	Bq8oLIvFL5DnytGdxQvGGub0Lo8AzpfjGyKO8JWHaqQVqLDcvUetQN044CvaSDpgD4hMFfEq3Tg
	kJPMyC6vYoNQ8gQqdsqOkZrGbT49qHU0AA5iqreZbB2yR8nOTOVh4OuKQlqQvVk8tL/4fV0h4JT
	/BcsrFPjsv7rGQULeebxgvH0YBimSUeY2SXMUv5V9YSMB5o=
X-Received: by 2002:a05:620a:2902:b0:7c7:694e:1ba0 with SMTP id af79cd13be357-7c928038e7fmr369367885a.44.1744985513671;
        Fri, 18 Apr 2025 07:11:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU/GpCIqMnPivNPeoh0WSJh6fEhjCoUE1vUT+Y1ccQz9eFG1zCRoEcAlnChcyFybdK/4G0EA==
X-Received: by 2002:a05:620a:2902:b0:7c7:694e:1ba0 with SMTP id af79cd13be357-7c928038e7fmr369363185a.44.1744985513230;
        Fri, 18 Apr 2025 07:11:53 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:2dd5:219d:5008:1bec])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4404352a5f0sm81172835e9.1.2025.04.18.07.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:11:52 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 1/6] media: qcom: camss: Add support for TFE (Spectra 340)
Date: Fri, 18 Apr 2025 16:11:42 +0200
Message-Id: <20250418141147.205179-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418141147.205179-1-loic.poulain@oss.qualcomm.com>
References: <20250418141147.205179-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qXy9R6reoLEIn0-Bytf1j-Hyx_COm5kx
X-Proofpoint-GUID: qXy9R6reoLEIn0-Bytf1j-Hyx_COm5kx
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=68025dab cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=5YBWHmY6e4A8bI1BiDgA:9 a=IZ6BfI08DC7DjxxD:21 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_05,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180105

Add support for TFE (Thin Front End) found in QCM2290.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../media/platform/qcom/camss/camss-vfe-340.c | 319 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
 3 files changed, 321 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-340.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index d26a9c24a430..719898f5d32b 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -17,6 +17,7 @@ qcom-camss-objs += \
 		camss-vfe-4-7.o \
 		camss-vfe-4-8.o \
 		camss-vfe-17x.o \
+		camss-vfe-340.o \
 		camss-vfe-480.o \
 		camss-vfe-680.o \
 		camss-vfe-780.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
new file mode 100644
index 000000000000..ab91387b7894
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -0,0 +1,319 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module 340 (TFE)
+ *
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+
+#include "camss.h"
+#include "camss-vfe.h"
+
+#define TFE_GLOBAL_RESET_CMD				(0x014)
+#define		TFE_GLOBAL_RESET_CMD_CORE	BIT(0)
+
+#define TFE_REG_UPDATE_CMD				(0x02c)
+
+#define TFE_IRQ_CMD					(0x030)
+#define		TFE_IRQ_CMD_CLEAR		BIT(0)
+#define TFE_IRQ_MASK_0					(0x034)
+#define		TFE_IRQ_MASK_0_RST_DONE		BIT(0)
+#define		TFE_IRQ_MASK_0_BUS_WR		BIT(1)
+#define TFE_IRQ_MASK_1					(0x038)
+#define TFE_IRQ_MASK_2					(0x03c)
+#define TFE_IRQ_CLEAR_0					(0x040)
+
+#define TFE_IRQ_STATUS_0				(0x04c)
+
+#define BUS_REG(a)					(0xa00 + (a))
+
+#define TFE_BUS_IRQ_MASK_0				BUS_REG(0x18)
+#define		TFE_BUS_IRQ_MASK_RUP_DONE_MASK	GENMASK(3, 0)
+#define		TFE_BUS_IRQ_MASK_RUP_DONE(sc)	FIELD_PREP(TFE_BUS_IRQ_MASK_RUP_DONE_MASK, BIT(sc))
+#define		TFE_BUS_IRQ_MASK_BUF_DONE_MASK	GENMASK(15, 8)
+#define		TFE_BUS_IRQ_MASK_BUF_DONE(sg)	FIELD_PREP(TFE_BUS_IRQ_MASK_BUF_DONE_MASK, BIT(sg))
+#define		TFE_BUS_IRQ_MASK_0_CONS_VIOL	BIT(28)
+#define		TFE_BUS_IRQ_MASK_0_VIOL		BIT(30)
+#define		TFE_BUS_IRQ_MASK_0_IMG_VIOL	BIT(31)
+
+#define TFE_BUS_IRQ_MASK_1				BUS_REG(0x1c)
+#define TFE_BUS_IRQ_CLEAR_0				BUS_REG(0x20)
+#define TFE_BUS_IRQ_STATUS_0				BUS_REG(0x28)
+#define TFE_BUS_IRQ_CMD					BUS_REG(0x30)
+#define		TFE_BUS_IRQ_CMD_CLEAR		BIT(0)
+
+#define TFE_BUS_STATUS_CLEAR				BUS_REG(0x60)
+#define TFE_BUS_VIOLATION_STATUS			BUS_REG(0x64)
+#define TFE_BUS_OVERFLOW_STATUS				BUS_REG(0x68)
+#define TFE_BUS_IMAGE_SZ_VIOLATION_STATUS		BUS_REG(0x70)
+
+#define TFE_BUS_CLIENT_CFG(c)				BUS_REG(0x200 + (c) * 0x100)
+#define		TFE_BUS_CLIENT_CFG_EN		BIT(0)
+#define		TFE_BUS_CLIENT_CFG_MODE_FRAME	BIT(16)
+#define TFE_BUS_IMAGE_ADDR(c)				BUS_REG(0x204 + (c) * 0x100)
+#define TFE_BUS_FRAME_INCR(c)				BUS_REG(0x208 + (c) * 0x100)
+#define TFE_BUS_IMAGE_CFG_0(c)				BUS_REG(0x20c + (c) * 0x100)
+#define		TFE_BUS_IMAGE_CFG_0_DEFAULT	0xffff
+#define TFE_BUS_IMAGE_CFG_1(c)				BUS_REG(0x210 + (c) * 0x100)
+#define TFE_BUS_IMAGE_CFG_2(c)				BUS_REG(0x214 + (c) * 0x100)
+#define		TFE_BUS_IMAGE_CFG_2_DEFAULT	0xffff
+#define TFE_BUS_PACKER_CFG(c)				BUS_REG(0x218 + (c) * 0x100)
+#define		TFE_BUS_PACKER_CFG_FMT_PLAIN64	0xa
+#define TFE_BUS_IRQ_SUBSAMPLE_CFG_0(c)			BUS_REG(0x230 + (c) * 0x100)
+#define TFE_BUS_IRQ_SUBSAMPLE_CFG_1(c)			BUS_REG(0x234 + (c) * 0x100)
+#define TFE_BUS_FRAMEDROP_CFG_0(c)			BUS_REG(0x238 + (c) * 0x100)
+#define TFE_BUS_FRAMEDROP_CFG_1(c)			BUS_REG(0x23c + (c) * 0x100)
+
+/*
+ * TODO: differentiate the port id based on requested type of RDI, BHIST etc
+ *
+ * TFE write master IDs (clients)
+ *
+ * BAYER		0
+ * IDEAL_RAW		1
+ * STATS_TINTLESS_BG	2
+ * STATS_BHIST		3
+ * STATS_AWB_BG		4
+ * STATS_AEC_BG		5
+ * STATS_BAF		6
+ * RDI0			7
+ * RDI1			8
+ * RDI2			9
+ */
+#define RDI_WM(n)		(7 + (n))
+#define TFE_WM_NUM		10
+
+enum tfe_iface {
+	TFE_IFACE_PIX,
+	TFE_IFACE_RDI0,
+	TFE_IFACE_RDI1,
+	TFE_IFACE_RDI2,
+	TFE_IFACE_NUM
+};
+
+enum tfe_subgroups {
+	TFE_SUBGROUP_BAYER,
+	TFE_SUBGROUP_IDEAL_RAW,
+	TFE_SUBGROUP_HDR,
+	TFE_SUBGROUP_BG,
+	TFE_SUBGROUP_BAF,
+	TFE_SUBGROUP_RDI0,
+	TFE_SUBGROUP_RDI1,
+	TFE_SUBGROUP_RDI2,
+	TFE_SUBGROUP_NUM
+};
+
+enum tfe_iface tfe_line_iface_map[VFE_LINE_NUM_MAX] = {
+	[VFE_LINE_RDI0] = TFE_IFACE_RDI0,
+	[VFE_LINE_RDI1] = TFE_IFACE_RDI1,
+	[VFE_LINE_RDI2] = TFE_IFACE_RDI2,
+	[VFE_LINE_PIX] = TFE_IFACE_PIX,
+};
+
+enum vfe_line_id tfe_subgroup_line_map[TFE_SUBGROUP_NUM] = {
+	[TFE_SUBGROUP_BAYER] = VFE_LINE_PIX,
+	[TFE_SUBGROUP_IDEAL_RAW] = VFE_LINE_PIX,
+	[TFE_SUBGROUP_HDR] = VFE_LINE_PIX,
+	[TFE_SUBGROUP_BG] = VFE_LINE_PIX,
+	[TFE_SUBGROUP_BAF] = VFE_LINE_PIX,
+	[TFE_SUBGROUP_RDI0] = VFE_LINE_RDI0,
+	[TFE_SUBGROUP_RDI1] = VFE_LINE_RDI1,
+	[TFE_SUBGROUP_RDI2] = VFE_LINE_RDI2,
+};
+
+static inline enum tfe_iface  __line_to_iface(enum vfe_line_id line_id)
+{
+	if (line_id <= VFE_LINE_NONE || line_id >= VFE_LINE_NUM_MAX) {
+		pr_warn("VFE: Invalid line %d\n", line_id);
+		return TFE_IFACE_RDI0;
+	}
+
+	return tfe_line_iface_map[line_id];
+}
+
+static inline enum vfe_line_id __iface_to_line(unsigned int iface)
+{
+	int i;
+
+	for (i = 0; i < VFE_LINE_NUM_MAX; i++) {
+		if (tfe_line_iface_map[i] == iface)
+			return i;
+	}
+
+	return VFE_LINE_NONE;
+}
+
+static inline enum vfe_line_id __subgroup_to_line(enum tfe_subgroups sg)
+{
+	if (sg >= TFE_SUBGROUP_NUM)
+		return VFE_LINE_NONE;
+
+	return tfe_subgroup_line_map[sg];
+}
+
+static void vfe_global_reset(struct vfe_device *vfe)
+{
+	writel(TFE_IRQ_MASK_0_RST_DONE, vfe->base + TFE_IRQ_MASK_0);
+	writel(TFE_GLOBAL_RESET_CMD_CORE, vfe->base + TFE_GLOBAL_RESET_CMD);
+}
+
+static irqreturn_t vfe_isr(int irq, void *dev)
+{
+	struct vfe_device *vfe = dev;
+	u32 status;
+	int i;
+
+	status = readl_relaxed(vfe->base + TFE_IRQ_STATUS_0);
+	writel_relaxed(status, vfe->base + TFE_IRQ_CLEAR_0);
+	writel_relaxed(TFE_IRQ_CMD_CLEAR, vfe->base + TFE_IRQ_CMD);
+
+	if (status & TFE_IRQ_MASK_0_RST_DONE) {
+		dev_dbg(vfe->camss->dev, "VFE%u: Reset done!", vfe->id);
+		vfe_isr_reset_ack(vfe);
+	}
+
+	if (status & TFE_IRQ_MASK_0_BUS_WR) {
+		u32 bus_status = readl_relaxed(vfe->base + TFE_BUS_IRQ_STATUS_0);
+
+		writel_relaxed(bus_status, vfe->base + TFE_BUS_IRQ_CLEAR_0);
+		writel_relaxed(TFE_BUS_IRQ_CMD_CLEAR, vfe->base + TFE_BUS_IRQ_CMD);
+
+		for (i = 0; i < TFE_IFACE_NUM; i++) {
+			if (bus_status & TFE_BUS_IRQ_MASK_RUP_DONE(i))
+				vfe->res->hw_ops->reg_update_clear(vfe, __iface_to_line(i));
+		}
+
+		for (i = 0; i < TFE_SUBGROUP_NUM; i++) {
+			if (bus_status & TFE_BUS_IRQ_MASK_BUF_DONE(i))
+				vfe_buf_done(vfe, __subgroup_to_line(i));
+		}
+
+		if (bus_status & TFE_BUS_IRQ_MASK_0_CONS_VIOL)
+			dev_err_ratelimited(vfe->camss->dev, "VFE%u: Bad config violation",
+					    vfe->id);
+
+		if (bus_status & TFE_BUS_IRQ_MASK_0_VIOL)
+			dev_err_ratelimited(vfe->camss->dev, "VFE%u: Input data violation",
+					    vfe->id);
+
+		if (bus_status & TFE_BUS_IRQ_MASK_0_IMG_VIOL)
+			dev_err_ratelimited(vfe->camss->dev, "VFE%u: Image size violation",
+					    vfe->id);
+	}
+
+	status = readl_relaxed(vfe->base + TFE_BUS_OVERFLOW_STATUS);
+	if (status) {
+		writel_relaxed(status, vfe->base + TFE_BUS_STATUS_CLEAR);
+		for (i = 0; i < TFE_WM_NUM; i++) {
+			if (status & BIT(i))
+				dev_err_ratelimited(vfe->camss->dev,
+						    "VFE%u: bus overflow for wm %u\n",
+						    vfe->id, i);
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int vfe_halt(struct vfe_device *vfe)
+{
+	/* rely on vfe_disable_output() to stop the VFE */
+	return 0;
+}
+
+static void vfe_enable_irq(struct vfe_device *vfe)
+{
+	writel(TFE_IRQ_MASK_0_RST_DONE | TFE_IRQ_MASK_0_BUS_WR,
+	       vfe->base + TFE_IRQ_MASK_0);
+	writel(TFE_BUS_IRQ_MASK_RUP_DONE_MASK | TFE_BUS_IRQ_MASK_BUF_DONE_MASK |
+	       TFE_BUS_IRQ_MASK_0_CONS_VIOL | TFE_BUS_IRQ_MASK_0_VIOL |
+	       TFE_BUS_IRQ_MASK_0_IMG_VIOL, vfe->base + TFE_BUS_IRQ_MASK_0);
+}
+
+static void vfe_wm_update(struct vfe_device *vfe, u8 rdi, u32 addr,
+			  struct vfe_line *line)
+{
+	u8 wm = RDI_WM(rdi);
+
+	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(wm));
+}
+
+static void vfe_wm_start(struct vfe_device *vfe, u8 rdi, struct vfe_line *line)
+{
+	struct v4l2_pix_format_mplane *pix = &line->video_out.active_fmt.fmt.pix_mp;
+	u32 stride = pix->plane_fmt[0].bytesperline;
+	u8 wm = RDI_WM(rdi);
+
+	/* Configuration for plain RDI frames */
+	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(wm));
+	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(wm));
+	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(wm));
+	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(wm));
+	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(wm));
+
+	/* No dropped frames, one irq per frame */
+	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(wm));
+	writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(wm));
+	writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(wm));
+	writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(wm));
+
+	vfe_enable_irq(vfe);
+
+	writel(TFE_BUS_CLIENT_CFG_EN | TFE_BUS_CLIENT_CFG_MODE_FRAME,
+	       vfe->base + TFE_BUS_CLIENT_CFG(wm));
+
+	dev_dbg(vfe->camss->dev, "VFE%u: Started RDI%u width %u height %u stride %u\n",
+		vfe->id, rdi, pix->width, pix->height, stride);
+}
+
+static void vfe_wm_stop(struct vfe_device *vfe, u8 rdi)
+{
+	u8 wm = RDI_WM(rdi);
+
+	writel(0, vfe->base + TFE_BUS_CLIENT_CFG(wm));
+
+	dev_dbg(vfe->camss->dev, "VFE%u: Stopped RDI%u\n", vfe->id, rdi);
+}
+
+static const struct camss_video_ops vfe_video_ops_520 = {
+	.queue_buffer = vfe_queue_buffer_v2,
+	.flush_buffers = vfe_flush_buffers,
+};
+
+static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
+{
+	vfe->video_ops = vfe_video_ops_520;
+}
+
+static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	vfe->reg_update |= BIT(__line_to_iface(line_id));
+	writel_relaxed(vfe->reg_update, vfe->base + TFE_REG_UPDATE_CMD);
+}
+
+static void vfe_reg_update_clear(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	vfe->reg_update &= ~BIT(__line_to_iface(line_id));
+}
+
+const struct vfe_hw_ops vfe_ops_340 = {
+	.global_reset = vfe_global_reset,
+	.hw_version = vfe_hw_version,
+	.isr = vfe_isr,
+	.pm_domain_off = vfe_pm_domain_off,
+	.pm_domain_on = vfe_pm_domain_on,
+	.subdev_init = vfe_subdev_init,
+	.vfe_disable = vfe_disable,
+	.vfe_enable = vfe_enable_v2,
+	.vfe_halt = vfe_halt,
+	.vfe_wm_start = vfe_wm_start,
+	.vfe_wm_stop = vfe_wm_stop,
+	.vfe_buf_done = vfe_buf_done,
+	.vfe_wm_update = vfe_wm_update,
+	.reg_update = vfe_reg_update,
+	.reg_update_clear = vfe_reg_update_clear,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index a23f666be753..9b138849caca 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -242,6 +242,7 @@ extern const struct vfe_hw_ops vfe_ops_4_1;
 extern const struct vfe_hw_ops vfe_ops_4_7;
 extern const struct vfe_hw_ops vfe_ops_4_8;
 extern const struct vfe_hw_ops vfe_ops_170;
+extern const struct vfe_hw_ops vfe_ops_340;
 extern const struct vfe_hw_ops vfe_ops_480;
 extern const struct vfe_hw_ops vfe_ops_680;
 extern const struct vfe_hw_ops vfe_ops_780;
-- 
2.34.1


