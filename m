Return-Path: <linux-media+bounces-37063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AB5AFC5BD
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 10:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 155FA1884D84
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 08:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E422BE05F;
	Tue,  8 Jul 2025 08:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dP40+Zb9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DAA2BD016
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 08:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963555; cv=none; b=BUe0S6KSQKMrm5Ki+hAzs3KMEvLI0Huud41xe3xw1ft6ivofsboFvUwE7zIs5vvxPCE1G256kREcyog/5sfEhRcZ48jjl1F9dGSKdqatEcTLipIl20Nn9TnBfZEirF4Cv6taMBTJBK+2OqNkrf/UlIxFDtmOLAPngvx7w9vPQIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963555; c=relaxed/simple;
	bh=J8hJb6ZfXZfIS27ED/iy0umD/CUmgJhuLhkCD8yWVHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jqHH4vuOb076c+qyrQk8BCwqDA0S1zrRP1hRC+prAk4anDbwWB0OYcapvewKHcuzXfWNtaWmUbYbzublOX0/pb13DeLKnUIKxha8ESlP+XdkzZlXIuLLrYwl3a4bIJpDdIGzeSUE3Lz3F7rb6SyXvJ6Zbe/yedSW6LpHCogPRQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dP40+Zb9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5687v5N0021204
	for <linux-media@vger.kernel.org>; Tue, 8 Jul 2025 08:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=261qkP0f/h5
	Tj/nGF5EXndFRIC5FkfysWzMW9JJfa+w=; b=dP40+Zb9QaRHkCkuOU4fW1+Lhw/
	GSRFHnR/ZqP52rvNCHoSSa74CUnRgFaWjTNeUAU7VTbXxZGJcJVEkLOLWI9eyaxG
	AnyqetB089Bw1Ngf2aZVijLSYUP7NtioMzUlT4jQdgoB+gtdLBVsnADYJCZrXaTz
	UJRo73oz5IrvWKNyBIXeWKD6EyFATjdAGcEzOaHutYKm99eMOcP1DzgwMXF6LJ5z
	TCcUr8o27zRMvpL+ugWhQMbqcbvwrGJGzDbv+2YGPR8sL8GDkU7eWLIZlgwpv8AH
	UXVJSW0o7b/Y7nmbnJO6Qwy27Ey2sV/NjaUnTUMXSuZPVT2ac7HzUkxBL8g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrkkpkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 08:32:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09ed509aaso489587685a.3
        for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 01:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963552; x=1752568352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=261qkP0f/h5Tj/nGF5EXndFRIC5FkfysWzMW9JJfa+w=;
        b=IczBuxlBzAFFgiM32gZdC8m9EkNnUfRGj1ZgM1ZG3gutbsZbgpqWRgjwRsR1L8VEMt
         7auOkSxi1r45J6gUoXHsnamA2O5xwbbK0QytVesHlKJ4g2dVRQNqizRyMd+C9hjQ1rDM
         1MnIQQGpPYAWbAUqzdHbUoaeLKDJglq4DHvjSI8HUh25O4ZEanQwff97jPE47K3DfA8n
         g6mvuC9l8XdzrEgQXgSNaumBSI4Pmms56o25POVqLzCmkBn0VX2r4lMQ+/3gkYz6A3F5
         7mBzgvMT/vgLEFn0Yb2bCF2sov6Bmt05vPTmBf4KkO8vdDwFS+xhIM5mOSFYAaDREtUU
         qCwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjwTdqvA16+GCQUtCZeREjG3npAf54iXXUdSeAQVrUvv0TCAVE6htAPUXZ7lYH+mhZSS1guXZbBCrCDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCbc5ZmHEcoNEkXSH/PXN9ojJWzRFQjsqJlA5ej1LFb6fAQUW1
	vmtpQxXq9veaaKlz+8Q7BwmdCf7pD631vnc0N5qafMvuXZ/X7mcTgCpTjPLZgc+qGFkMRpASLRo
	5uGSTPiIuRhm+wL96wjuQlRXr4mWHOg7vzgxOjjNEPLGW+bSHE0slB4IfDbAlkMjluA==
X-Gm-Gg: ASbGncvkzs5YfdK9g5CkaKYjRxokmeQ0zQhk86/SVuglZaMYs5VuJBSUbI3vWg5juo8
	VlQ/129FLbMUvbh5jPN1fglMxEbAGLeAmNm+un4vfbnKE6QemxhJrBVj94WnhGkCu8U5oGHerQf
	k9j04rzfvkQEWJg9M4IMLgrz4Cwe3rpRbm7SBF9g8S8ilp/5fTaloTRyVKl4oU3w/U15O7NPGt2
	cLST49IEkTSqz9N9p3XZB4FqlQitibDK0xUIiYsNi3TIc7q8/WKjQXndxs5/zAnvjGnxmv+nlF8
	urFNxjoP+4gaA+G/Q2oVUsD4xWwjIgwXxYkGEgsFXk2Poet7jtfnV8XXZw==
X-Received: by 2002:a05:620a:c4a:b0:7d4:29a5:8143 with SMTP id af79cd13be357-7da016a9a3emr357965785a.6.1751963551761;
        Tue, 08 Jul 2025 01:32:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9kcw30kxWvuGYffuDMauZaIExdoL/kbe57FpY0sCUGZ5XoEwq84PtEGPs+fmcz/zH2Z2CwQ==
X-Received: by 2002:a05:620a:c4a:b0:7d4:29a5:8143 with SMTP id af79cd13be357-7da016a9a3emr357962085a.6.1751963551246;
        Tue, 08 Jul 2025 01:32:31 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:953b:906f:73bc:cc41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0959sm12315812f8f.27.2025.07.08.01.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:32:30 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v6 2/6] media: qcom: camss: Add CSID 340 support
Date: Tue,  8 Jul 2025 10:32:18 +0200
Message-Id: <20250708083222.1020-3-loic.poulain@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: FzbH0yz1ZVQ5Ew37MESlx1KqrlowlEd0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA2OCBTYWx0ZWRfX2Bq8c5gf/APL
 1aksUaOnqmyXe2EKVAnNLJivP7LbY630huvAAPpbSM5xzbyge+97Gzzuy70MI5+o0k3ZhQ/Fpzc
 moqbgyq/o/kEvlSte3bavM4zQbymRt2iv3TxquE6d/NWA7omU5XrYORlWt81h8U7Fw3cRE4+yc5
 fbY8zOGhW++E49tJ8YMih1zZsEiomUd/A7eske5lbrVIoIHZD2RaE27X81z9+aQ6ozW9ZHpn3LX
 D2s7p7U1+ye4KXQIuhZM5KpZlMNf1f6BNtL+zn9tc3spC9+wUdIdp2OudlHetE7eo9ZbdjVaWup
 h5GEgfN3UmSH+OWQvYLwGsu8f1bgxXpgRk/LbiYlhwpScBqYzeRKgVzhKcaumDFiziqZJGnVxr+
 oVEWqYpU3w4cRNNiN7g1aHBlSrRkcOzYjYDCT3VCZ1W+YdMt3rC6iGW3wTznQV9O0NG56ZqE
X-Proofpoint-GUID: FzbH0yz1ZVQ5Ew37MESlx1KqrlowlEd0
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=686cd7a1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=L3ROWYctCJYvUZd4tikA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080068

Add support for CSID found in QCM2290, it's a simplified gen-2 version.
- There is no Test Pattern Generator (moved outside CSID)
- There is no subsampling (moved to CAMIF module)

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../platform/qcom/camss/camss-csid-340.c      | 189 ++++++++++++++++++
 .../media/platform/qcom/camss/camss-csid.h    |   1 +
 3 files changed, 191 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-340.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 719898f5d32b..3217bf40976d 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -6,6 +6,7 @@ qcom-camss-objs += \
 		camss-csid.o \
 		camss-csid-4-1.o \
 		camss-csid-4-7.o \
+		camss-csid-340.o \
 		camss-csid-680.o \
 		camss-csid-gen2.o \
 		camss-csid-780.o \
diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
new file mode 100644
index 000000000000..7a8fbae3009b
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module 340
+ *
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/completion.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+
+#include "camss.h"
+#include "camss-csid.h"
+#include "camss-csid-gen2.h"
+
+#define CSID_RST_STROBES					(0x010)
+#define		CSID_RST_SW_REGS			BIT(0)
+#define		CSID_RST_IRQ				BIT(1)
+#define CSID_RST_IFE_CLK				BIT(2)
+#define		CSID_RST_PHY_CLK			BIT(3)
+#define		CSID_RST_CSID_CLK			BIT(4)
+
+#define CSID_IRQ_STATUS						(0x070)
+#define CSID_IRQ_MASK						(0x074)
+#define		CSID_IRQ_MASK_RST_DONE			BIT(0)
+#define CSID_IRQ_CLEAR						(0x078)
+#define CSID_IRQ_CMD						(0x080)
+#define		CSID_IRQ_CMD_CLEAR			BIT(0)
+
+#define CSID_CSI2_RX_CFG0					(0x100)
+#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES_MASK	GENMASK(1, 0)
+#define		CSI2_RX_CFG0_DLX_INPUT_SEL_MASK		GENMASK(17, 4)
+#define		CSI2_RX_CFG0_PHY_NUM_SEL_MASK		GENMASK(21, 20)
+#define		CSI2_RX_CFG0_PHY_NUM_SEL_BASE_IDX	1
+#define		CSI2_RX_CFG0_PHY_TYPE_SEL		BIT(24)
+
+#define CSID_CSI2_RX_CFG1					(0x104)
+#define		CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN	BIT(0)
+#define		CSI2_RX_CFG1_MISR_EN			BIT(6)
+#define		CSI2_RX_CFG1_CGC_MODE			BIT(7)
+
+#define CSID_RDI_CFG0(rdi)					(0x300 + 0x100 * (rdi))
+#define		CSID_RDI_CFG0_BYTE_CNTR_EN		BIT(0)
+#define		CSID_RDI_CFG0_TIMESTAMP_EN		BIT(1)
+#define		CSID_RDI_CFG0_DECODE_FORMAT_MASK	GENMASK(15, 12)
+#define		CSID_RDI_CFG0_DECODE_FORMAT_NOP		CSID_RDI_CFG0_DECODE_FORMAT_MASK
+#define		CSID_RDI_CFG0_DT_MASK			GENMASK(21, 16)
+#define		CSID_RDI_CFG0_VC_MASK			GENMASK(23, 22)
+#define		CSID_RDI_CFG0_DTID_MASK			GENMASK(28, 27)
+#define		CSID_RDI_CFG0_ENABLE			BIT(31)
+
+#define CSID_RDI_CTRL(rdi)					(0x308 + 0x100 * (rdi))
+#define CSID_RDI_CTRL_HALT_AT_FRAME_BOUNDARY		0
+#define CSID_RDI_CTRL_RESUME_AT_FRAME_BOUNDARY		1
+
+static void __csid_configure_rx(struct csid_device *csid,
+				struct csid_phy_config *phy, int vc)
+{
+	u32 val;
+
+	val = FIELD_PREP(CSI2_RX_CFG0_NUM_ACTIVE_LANES_MASK, phy->lane_cnt - 1);
+	val |= FIELD_PREP(CSI2_RX_CFG0_DLX_INPUT_SEL_MASK, phy->lane_assign);
+	val |= FIELD_PREP(CSI2_RX_CFG0_PHY_NUM_SEL_MASK,
+			  phy->csiphy_id + CSI2_RX_CFG0_PHY_NUM_SEL_BASE_IDX);
+	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
+
+	val = CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
+	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
+}
+
+static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
+{
+	writel_relaxed(!!enable, csid->base + CSID_RDI_CTRL(rdi));
+}
+
+static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
+{
+	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
+	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
+								   csid->res->formats->nformats,
+								   input_format->code);
+	u8 lane_cnt = csid->phy.lane_cnt;
+	u8 dt_id;
+	u32 val;
+
+	if (!lane_cnt)
+		lane_cnt = 4;
+
+	/*
+	 * DT_ID is a two bit bitfield that is concatenated with
+	 * the four least significant bits of the five bit VC
+	 * bitfield to generate an internal CID value.
+	 *
+	 * CSID_RDI_CFG0(vc)
+	 * DT_ID : 28:27
+	 * VC    : 26:22
+	 * DT    : 21:16
+	 *
+	 * CID   : VC 3:0 << 2 | DT_ID 1:0
+	 */
+	dt_id = vc & 0x03;
+
+	val = CSID_RDI_CFG0_DECODE_FORMAT_NOP; /* only for RDI path */
+	val |= FIELD_PREP(CSID_RDI_CFG0_DT_MASK, format->data_type);
+	val |= FIELD_PREP(CSID_RDI_CFG0_VC_MASK, vc);
+	val |= FIELD_PREP(CSID_RDI_CFG0_DTID_MASK, dt_id);
+
+	if (enable)
+		val |= CSID_RDI_CFG0_ENABLE;
+
+	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x vc=%u)\n",
+		csid->id, enable ? "enable" : "disable", format->data_type, vc);
+
+	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
+}
+
+static void csid_configure_stream(struct csid_device *csid, u8 enable)
+{
+	int i;
+
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
+		if (csid->phy.en_vc & BIT(i)) {
+			__csid_configure_rdi_stream(csid, enable, i);
+			__csid_configure_rx(csid, &csid->phy, i);
+			__csid_ctrl_rdi(csid, enable, i);
+		}
+	}
+}
+
+static int csid_reset(struct csid_device *csid)
+{
+	unsigned long time;
+
+	writel_relaxed(CSID_IRQ_MASK_RST_DONE, csid->base + CSID_IRQ_MASK);
+	writel_relaxed(CSID_IRQ_MASK_RST_DONE, csid->base + CSID_IRQ_CLEAR);
+	writel_relaxed(CSID_IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
+
+	reinit_completion(&csid->reset_complete);
+
+	/* Reset with registers preserved */
+	writel(CSID_RST_IRQ | CSID_RST_IFE_CLK | CSID_RST_PHY_CLK | CSID_RST_CSID_CLK,
+	       csid->base + CSID_RST_STROBES);
+
+	time = wait_for_completion_timeout(&csid->reset_complete,
+					   msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
+	if (!time) {
+		dev_err(csid->camss->dev, "CSID%u: reset timeout\n", csid->id);
+		return -EIO;
+	}
+
+	dev_dbg(csid->camss->dev, "CSID%u: reset done\n", csid->id);
+
+	return 0;
+}
+
+static irqreturn_t csid_isr(int irq, void *dev)
+{
+	struct csid_device *csid = dev;
+	u32 val;
+
+	val = readl_relaxed(csid->base + CSID_IRQ_STATUS);
+	writel_relaxed(val, csid->base + CSID_IRQ_CLEAR);
+	writel_relaxed(CSID_IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
+
+	if (val & CSID_IRQ_MASK_RST_DONE)
+		complete(&csid->reset_complete);
+	else
+		dev_warn_ratelimited(csid->camss->dev, "Spurious CSID interrupt\n");
+
+	return IRQ_HANDLED;
+}
+
+static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
+{
+	return -EOPNOTSUPP; /* Not part of CSID */
+}
+
+static void csid_subdev_init(struct csid_device *csid) {}
+
+const struct csid_hw_ops csid_ops_340 = {
+	.configure_testgen_pattern = csid_configure_testgen_pattern,
+	.configure_stream = csid_configure_stream,
+	.hw_version = csid_hw_version,
+	.isr = csid_isr,
+	.reset = csid_reset,
+	.src_pad_code = csid_src_pad_code,
+	.subdev_init = csid_subdev_init,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 9dc826d8c8f6..3399e92658d8 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -213,6 +213,7 @@ extern const struct csid_formats csid_formats_gen2;
 
 extern const struct csid_hw_ops csid_ops_4_1;
 extern const struct csid_hw_ops csid_ops_4_7;
+extern const struct csid_hw_ops csid_ops_340;
 extern const struct csid_hw_ops csid_ops_680;
 extern const struct csid_hw_ops csid_ops_gen2;
 extern const struct csid_hw_ops csid_ops_780;
-- 
2.34.1


