Return-Path: <linux-media+bounces-37062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A96EFAFC5BB
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 10:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9FA14206BA
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 08:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133EB2BE04F;
	Tue,  8 Jul 2025 08:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WOesb742"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A5E2BDC0A
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 08:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963554; cv=none; b=mm94xWLshULLd3JTiT6eOFZ7epsk3TOD11NVnA00S26Fj9+5fSgnszatsU0T/Kudv4WbCEpWb7WF28rCDs/4E1Sn4UpgN/oKO+jWM7DQDv/+sPwP0ycQcgUPDgx/71mqLXFKu91UC1Vc4O1XFnjnZA7a6vGE8t5KLOyvk6Eq6DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963554; c=relaxed/simple;
	bh=cNQAmYFP4ZCzwRoDr71PI3p2hhW5R8r2x37XXi1XxtI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IyqL7KGjI0VjKrIqkxzUhhWOCXA/5erZC5vdszZahXMWNCtEpb6JZRW5hdqbhSIDqrNZ9K+F2lAOyem5G4/7G+GP7gOX+KRyxB5EO/exQv/e9KQyQGX6olEptmSNNaUTYLtZfs5fwGuSd3kL6TYhhwBTDsjdgFLuyppTZb1NUIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WOesb742; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568844gQ027442
	for <linux-media@vger.kernel.org>; Tue, 8 Jul 2025 08:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SaR7ioYiruE
	GWEDgtvRdMsBeNGg0Xxv2OQTLT9fqir0=; b=WOesb742yKcO8G68CAF47JDzrZh
	0dDuPr2kmnrEayb4LGujxH8GsVzoooAuEMKESA7ycNxhoYKehhWOZ24/LJfg1rcc
	yCYzaIPk/jOJEME5kTEk8HF+PHeUqTA7yaFtogw9VlhQT+lkBH7rQuDFP9rAKyKN
	TjoADkEEDWEjbs74Sqi1quiQ4EwQbOwzm8x8lZ+CmTIMxu3B8/RdASFpik05gu2j
	742+NDp7JwxJobuNqmLrGv6WqHHhd1T4rQYmKfJZ2zVverkkoNK+QAXqpAho8NqF
	5UwhqfQiqtpNRcn6CCL3J+4Swnwns3lhcBlrKnhlFdAE28evTl6NXWBdLIA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucmv6hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 08:32:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7cf6c53390eso240127285a.2
        for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 01:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963550; x=1752568350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaR7ioYiruEGWEDgtvRdMsBeNGg0Xxv2OQTLT9fqir0=;
        b=JVt1PlSuhykueSB2BYoAY2+JBlSOGXvIvRBxqmoBukthW/rT3zReVkL6F+S83jFODM
         X3/LkOSRKXHES5+wNCUMhvwHXXVnmgRJ0QeDseC5o3z+k0s5KEQDmWtIVUnsQhQ2ZL/c
         p9Azmdgeorb/e/UkN9uloZKWAv+RU3ygoSbpEKR49vXllsFKvgdL6G1t61lxQEqI6WGb
         ggLJvVOAABc5mCqyKbuSCf1l+Z8HiH7Ueh0iVoKiHVlnmxmk8GdXVx7U4mm7l/YyoqZx
         P1wbhO5KcONbpRr+f8iOYyuvV/Bm6gneCaykJgWwWOcuCqOY3aBsZukaMiNO5x67/Z10
         1BmA==
X-Forwarded-Encrypted: i=1; AJvYcCXerauhgG1EUBiqqMO7WiJ/9CDNOryhInH+jy7IRUiZY505ygt7HZOs0JzXnxZq7wk1P4icupiKUTRKVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5rKK0kJsOazFTiQx0tZ5oMuk3z8GW9/6kNhipoW+YCQPVIBz3
	TY9tYbWsWiqYspDVhiko+qgHD523V7V1Ts9ZGC+pUBSCbh/c7xiYegsYqUpbUVPRNW3Hhh8GBmw
	t5N7hVTiXfC0TZeQtge+KU30eJJ55mgLCnlBEjqKKmws7ruTlRRv1x4SI69R3Zdr6lA==
X-Gm-Gg: ASbGnct60B/VVnH/olAmSHPz97WJ6fbgeSvDMlxu1pCdCl28IjX7cmUKGb6w6Vo9gv+
	3BfEmXUE2tX6XcUOVmhLrIYmT5RHfrR3BzTThtAIj+mNqDLnnONKR935bbU/4FCxyqzrwCBDNWf
	0iKWuU2AWsNXF2XJ1Ze5Heby7TfaxhIp+7xcXo6JQaRsWRrhNYkrBc8vvVoTz3wkkM30BvneIzV
	Gzv90IchUtVEWbAgQLr7lt55JGV73ecAWR6ALMef2lKgXPAnqGUM4KqtOFuWwgO6awGvW+WVpsT
	Y7uy+J+YOUVsdODy3uIkQh59MSDMequ1fD/sCLqkY572DDbvjuMQC05JKA==
X-Received: by 2002:a05:620a:1b9c:b0:7d3:8ffa:f1bc with SMTP id af79cd13be357-7d5df194ad6mr1876799285a.58.1751963550002;
        Tue, 08 Jul 2025 01:32:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJfDAgAT+GDA6hQlipEgwU/5zk1BTNPmx1JZTv9dHPvfieLTPvb+lKyHpsYKJcPtrK5UUKqw==
X-Received: by 2002:a05:620a:1b9c:b0:7d3:8ffa:f1bc with SMTP id af79cd13be357-7d5df194ad6mr1876795185a.58.1751963549455;
        Tue, 08 Jul 2025 01:32:29 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:953b:906f:73bc:cc41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0959sm12315812f8f.27.2025.07.08.01.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:32:28 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v6 1/6] media: qcom: camss: Add support for TFE (Spectra 340)
Date: Tue,  8 Jul 2025 10:32:17 +0200
Message-Id: <20250708083222.1020-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708083222.1020-1-loic.poulain@oss.qualcomm.com>
References: <20250708083222.1020-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686cd79f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=5YBWHmY6e4A8bI1BiDgA:9 a=IZ6BfI08DC7DjxxD:21
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: zrNAZWEfkBKKKJsEhF6l6k-aoVEphPBC
X-Proofpoint-ORIG-GUID: zrNAZWEfkBKKKJsEhF6l6k-aoVEphPBC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA2OCBTYWx0ZWRfXyh5ZLRRI5QH+
 LP27TK7f81O9nyF4cgwdpMAxv4c5NLQeIFwxgVEV3Qs/KfrhTCQjTFcUzvaprhp+RMAMAYzEF9j
 JqDepzT5zhHYm8CP/rqAZx08Kjjn8UA3AQhEpJi6D1fleaydmI+qgAkBhkS51HDU+8UdrxW4VHd
 QUpPude2Nn+zpjQRPv6QPQHTouAISBEkCJBjPD/UhQSAzg/BqawkcnTk2jn9FBPNPl2cA1BXDVw
 okt1VWRIQTCAUrpyUxFEvxZEX3mjDjiPyNa7zp71H2Zeg/pJlXLs6qfstvoP6rCXHcZSeYwW+f3
 znKnbIRCwVoqnrbG7bmlNoxQthw6C0+h8CvcTzDaAST8t3G1Bq21wE4a0L4JkZwhE+cMn1S3iYb
 pwLy/QFdrx6iduPYhDBq7gsJg3+vVf69Gv0Tu7Y8X+yoxbnJvjilU7Rto1uY59SsUpsNseMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080068

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


