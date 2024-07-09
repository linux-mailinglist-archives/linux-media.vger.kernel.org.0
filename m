Return-Path: <linux-media+bounces-14786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB2992BF57
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 18:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DFCC1F22FA2
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 16:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F771AB520;
	Tue,  9 Jul 2024 16:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Iuf5NlnL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532231A4F2D;
	Tue,  9 Jul 2024 16:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720541278; cv=none; b=PX35O9wQILsC5NNvjAmnLkkSHAU4u3vuaBK+O42HTdgJZXQh6reMx2x5p38e2tzZpZSGnafjKnnUzBGaxZIpJ8HOa+3Yco1QvyCqorqdtzk+g3UChpYC2karIZNbQOdYE1HbRercajZji2oBp4JqQmqjY2rYr3cDjCR+kqWWmyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720541278; c=relaxed/simple;
	bh=f5UmIdHt6Q9hPnTp4/PpKnhvKXfu0LXbEq5C5Ix4i/4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o0trecPxS5nZmnqieUtr2UCVZPUy1xUuiYONJlTCZ6l6m2MRrf9nT0loEYXy2gEA94PDI+I3+JTh6RAk2aZEIi2dETrvI0FlVXTHapFDrmRRfuNKk9f4omeqUvDwxGcbA47zkKGhGIOaaCc8NOEQ0HlsBjrCwDktP3QAsmrYq5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Iuf5NlnL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469CXHbK003730;
	Tue, 9 Jul 2024 16:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rdi+5Wv2DEUcak9IZDZWT4tI
	9DZJDKncUCDhVvDpfd4=; b=Iuf5NlnLf2n6YYB9jYpQlVJ/2RDTIRXE1JgyShdC
	kns2DGIVcZX9B2Cez8U3Vamnzkkzzf879FFCUws5s0dxtUXR6ct+7k1GrkyR7FVs
	fEJHrJBgo2DvRum481zuG8FrEvQOtaBuV3Ym0i5o8xKj2nq4DdJ3ktFgdwuYhRnf
	2AuuPsykyaKcj1qwAbgCDV1EytnCc5Z2nVP2xpeDDk9PHVCO1/OOnMcPomNYlJQu
	DiDGbsRvu2IXvrPk7LtdKOVU9TtoADVIC2VhlJrxHc2kjMNWo0faZsPxpOaWl9c3
	hu9Gg4+r1ISbNDi9D90oinVYbHX5mbbDP9B2f3ZFZgXoAA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 408w0r9tbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 16:07:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469G7nRg030846
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 16:07:49 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 09:07:42 -0700
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
Subject: [PATCH 09/13] media: qcom: camss: Add CSID Gen3 support for SM8550
Date: Tue, 9 Jul 2024 21:36:52 +0530
Message-ID: <20240709160656.31146-10-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240709160656.31146-1-quic_depengs@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 59sifLpIzS-NobXW7aYy7abHxzGiSxw6
X-Proofpoint-GUID: 59sifLpIzS-NobXW7aYy7abHxzGiSxw6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_05,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090106

The CSID in SM8550 is gen3, it has new register offset and new
functionality. The buf done irq,register update and reset are
moved to CSID gen3. And CSID gen3 has a new register block which
is named as CSID top, it controls the output of CSID, since the
CSID can connect to Sensor Front End (SFE) or original VFE, the
register in top block is used to control the HW connection.

Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../platform/qcom/camss/camss-csid-gen3.c     | 445 ++++++++++++++++++
 .../platform/qcom/camss/camss-csid-gen3.h     |  26 +
 .../media/platform/qcom/camss/camss-csid.h    |   2 +
 4 files changed, 474 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen3.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen3.h

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index e636968a1126..c336e4c1a399 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -7,6 +7,7 @@ qcom-camss-objs += \
 		camss-csid-4-1.o \
 		camss-csid-4-7.o \
 		camss-csid-gen2.o \
+		camss-csid-gen3.o \
 		camss-csiphy-2ph-1-0.o \
 		camss-csiphy-3ph-1-0.o \
 		camss-csiphy.o \
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
new file mode 100644
index 000000000000..17fd7c5499de
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -0,0 +1,445 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-csid-gen3.c
+ *
+ * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
+ *
+ * Copyright (c) 2024 Qualcomm Technologies, Inc.
+ */
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+
+#include "camss.h"
+#include "camss-csid.h"
+#include "camss-csid-gen3.h"
+
+
+#define CSID_TOP_IO_PATH_CFG0(csid)	(0x4 * (csid))
+#define		OUTPUT_IFE_EN 0x100
+#define		INTERNAL_CSID 1
+
+#define CSID_HW_VERSION		0x0
+#define		HW_VERSION_STEPPING	0
+#define		HW_VERSION_REVISION	16
+#define		HW_VERSION_GENERATION	28
+
+#define CSID_RST_CFG	0xC
+#define		RST_MODE		0
+#define		RST_LOCATION	4
+
+#define CSID_RST_CMD	0x10
+#define		SELECT_HW_RST	0
+#define		SELECT_SW_RST	1
+#define		SELECT_IRQ_RST	2
+
+#define CSID_CSI2_RX_IRQ_STATUS	0x9C
+#define	CSID_CSI2_RX_IRQ_MASK	0xA0
+#define CSID_CSI2_RX_IRQ_CLEAR	0xA4
+#define CSID_CSI2_RX_IRQ_SET	0xA8
+
+#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)		(0xEC + 0x10 * (rdi))
+#define CSID_CSI2_RDIN_IRQ_MASK(rdi)		(0xF0 + 0x10 * (rdi))
+#define   CSID_CSI2_RDIN_INFO_FIFO_FULL 2
+#define   CSID_CSI2_RDIN_INFO_CAMIF_EOF 3
+#define   CSID_CSI2_RDIN_INFO_CAMIF_SOF 4
+#define   CSID_CSI2_RDIN_INFO_INPUT_EOF 9
+#define   CSID_CSI2_RDIN_INFO_INPUT_SOF 12
+#define   CSID_CSI2_RDIN_ERROR_REC_FRAME_DROP 18
+#define   CSID_CSI2_RDIN_ERROR_REC_OVERFLOW_IRQ 19
+#define   CSID_CSI2_RDIN_ERROR_REC_CCIF_VIOLATION 20
+#define   CSID_CSI2_RDIN_EPOCH0 21
+#define   CSID_CSI2_RDIN_EPOCH1 22
+#define   CSID_CSI2_RDIN_RUP_DONE 23
+#define   CSID_CSI2_RDIN_CCIF_VIOLATION 29
+
+#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)		(0xF4 + 0x10 * (rdi))
+#define CSID_CSI2_RDIN_IRQ_SET(rdi)			(0xF8 + 0x10 * (rdi))
+
+#define CSID_TOP_IRQ_STATUS	0x7C
+#define		TOP_IRQ_STATUS_RESET_DONE 0
+#define CSID_TOP_IRQ_MASK	0x80
+#define CSID_TOP_IRQ_CLEAR	0x84
+#define CSID_TOP_IRQ_SET	0x88
+#define CSID_IRQ_CMD		0x14
+#define		IRQ_CMD_CLEAR	0
+#define		IRQ_CMD_SET	4
+
+#define CSID_BUF_DONE_IRQ_STATUS	0x8C
+#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET (csid_is_lite(csid) ? 0x1 : 0xE)
+#define CSID_BUF_DONE_IRQ_MASK	0x90
+#define CSID_BUF_DONE_IRQ_CLEAR	0x94
+#define CSID_BUF_DONE_IRQ_SET	0x98
+
+#define CSID_CSI2_RX_CFG0	0x200
+#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES	0
+#define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
+#define		CSI2_RX_CFG0_DL1_INPUT_SEL	8
+#define		CSI2_RX_CFG0_DL2_INPUT_SEL	12
+#define		CSI2_RX_CFG0_DL3_INPUT_SEL	16
+#define		CSI2_RX_CFG0_PHY_NUM_SEL	20
+#define			CSI2_RX_CFG0_PHY_SEL_BASE_IDX 1
+#define		CSI2_RX_CFG0_PHY_TYPE_SEL	24
+#define		CSI2_RX_CFG0_TPG_MUX_EN		27
+#define		CSI2_RX_CFG0_TPG_NUM_SEL	28
+
+#define CSID_CSI2_RX_CFG1	0x204
+#define		CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN		0
+#define		CSI2_RX_CFG1_DE_SCRAMBLE_EN			1
+#define		CSI2_RX_CFG1_VC_MODE				2
+#define		CSI2_RX_CFG1_COMPLETE_STREAM_EN			4
+#define		CSI2_RX_CFG1_COMPLETE_STREAM_FRAME_TIMING	5
+#define		CSI2_RX_CFG1_MISR_EN				6
+#define		CSI2_RX_CFG1_PHY_BIST_EN			7
+#define		CSI2_RX_CFG1_EPD_MODE				8
+#define		CSI2_RX_CFG1_EOTP_EN				9
+#define		CSI2_RX_CFG1_DYN_SWITCH_EN			10
+#define		CSI2_RX_CFG1_RUP_AUP_LATCH_DIS		11
+
+#define CSID_CSI2_RX_CAPTURE_CTRL	0x208
+#define		CSI2_RX_CAPTURE_CTRL_LONG_PKT_CAPTURE_EN	0
+#define		CSI2_RX_CAPTURE_CTRL_SHORT_PKT_CAPTURE_EN	1
+#define		CSI2_RX_CAPTURE_CTRL_CPHY_PKT_CAPTURE_EN	3
+#define		CSI2_RX_CAPTURE_CTRL_LONG_PKT_CAPTURE_DT		4
+#define		CSI2_RX_CAPTURE_CTRL_LONG_PKT_CAPTURE_VC		10
+#define		CSI2_RX_CAPTURE_CTRL_SHORT_PKT_CAPTURE_VC	15
+#define		CSI2_RX_CAPTURE_CTRL_CPHY_PKT_CAPTURE_DT		20
+#define		CSI2_RX_CAPTURE_CTRL_CPHY_PKT_CAPTURE_VC		26
+
+#define CSID_RDI_CFG0(rdi)			(0x500 + 0x100 * (rdi))
+#define		RDI_CFG0_VFR_EN				0
+#define		RDI_CFG0_FRAME_ID_DEC_EN	1
+#define		RDI_CFG0_RETIME_DIS			5
+#define		RDI_CFG0_TIMESTAMP_EN		6
+#define		RDI_CFG0_TIMESTAMP_STB_SEL	8
+#define		RDI_CFG0_DECODE_FORMAT		12
+#define		RDI_CFG0_DT					16
+#define		RDI_CFG0_VC					22
+#define		RDI_CFG0_DT_ID				27
+#define		RDI_CFG0_EN					31
+
+#define CSID_RDI_CFG1(rdi)			(0x510 + 0x100 * (rdi))
+#define		RDI_CFG1_BYTE_CNTR_EN	2
+#define		RDI_CFG1_DROP_H_EN	5
+#define		RDI_CFG1_DROP_V_EN	6
+#define		RDI_CFG1_CROP_H_EN	7
+#define		RDI_CFG1_CROP_V_EN	8
+#define		RDI_CFG1_MISR_EN	9
+#define		RDI_CFG1_PIX_STORE  10
+#define		RDI_CFG1_PLAIN_ALIGNMENT	11
+#define		RDI_CFG1_PLAIN_FORMAT	12
+#define		RDI_CFG1_EARLY_EOF_EN	14
+#define		RDI_CFG1_PACKING_FORMAT	15
+
+#define CSID_RDI_CTRL(rdi)			(0x504 + 0x100 * (rdi))
+#define		RDI_CTRL_START_CMD		0
+#define		RDI_CTRL_START_MODE		2
+
+#define CSID_RDI_EPOCH_IRQ_CFG(rdi) (0x52C + 0x100 * (rdi))
+
+#define CSID_RDI_FRM_DROP_PATTERN(rdi)			(0x540 + 0x100 * (rdi))
+#define CSID_RDI_FRM_DROP_PERIOD(rdi)			(0x544 + 0x100 * (rdi))
+#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)		(0x548 + 0x100 * (rdi))
+#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)		(0x54C + 0x100 * (rdi))
+#define CSID_RDI_RPP_PIX_DROP_PATTERN(rdi)		(0x558 + 0x100 * (rdi))
+#define CSID_RDI_RPP_PIX_DROP_PERIOD(rdi)		(0x55C + 0x100 * (rdi))
+#define CSID_RDI_RPP_LINE_DROP_PATTERN(rdi)		(0x560 + 0x100 * (rdi))
+#define CSID_RDI_RPP_LINE_DROP_PERIOD(rdi)		(0x564 + 0x100 * (rdi))
+
+#define CSID_RDI_RPP_HCROP(rdi)                 (0x550 + 0x100 * (rdi))
+#define CSID_RDI_RPP_VCROP(rdi)                 (0x554 + 0x100 * (rdi))
+
+#define CSID_RDI_ERROR_RECOVERY_CFG0(rdi)       (0x514 + 0x100 * (rdi))
+
+#define CSID_REG_UPDATE_CMD		0x18
+static inline int reg_update_rdi(struct csid_device *csid, int n)
+{
+	return BIT(n + 4) + BIT(20 + n);
+}
+
+#define	    REG_UPDATE_RDI		reg_update_rdi
+
+static void __csid_configure_rx(struct csid_device *csid,
+				struct csid_phy_config *phy, int vc)
+{
+	int val;
+
+	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
+	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
+	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << CSI2_RX_CFG0_PHY_NUM_SEL;
+
+	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
+
+	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
+	if (vc > 3)
+		val |= 1 << CSI2_RX_CFG1_VC_MODE;
+	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
+}
+
+static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
+{
+	int val;
+
+	if (enable)
+		val = 1 << RDI_CTRL_START_CMD;
+	else
+		val = 0 << RDI_CTRL_START_CMD;
+	writel_relaxed(val, csid->base + CSID_RDI_CTRL(rdi));
+}
+
+static void __csid_configure_top(struct csid_device *csid)
+{
+	u32 val;
+
+	/* CSID "top" is a new function in Titan780.
+	 * CSID can connect to VFE & SFE(Sensor Front End).
+	 * This connection is ontrolled by CSID "top".
+	 * Only enable VFE path in current driver.
+	 */
+	if (csid->top_base) {
+		val = OUTPUT_IFE_EN | INTERNAL_CSID;
+		writel_relaxed(val, csid->top_base + CSID_TOP_IO_PATH_CFG0(csid->id));
+	}
+}
+
+static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
+{
+	u32 val;
+	u8 lane_cnt = csid->phy.lane_cnt;
+	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
+	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
+	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
+								   csid->res->formats->nformats,
+								   input_format->code);
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
+	u8 dt_id = vc & 0x03;
+
+	val = 1 << RDI_CFG0_TIMESTAMP_EN;
+	val |= 2 << RDI_CFG0_TIMESTAMP_STB_SEL;
+	/* note: for non-RDI path, this should be format->decode_format */
+	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
+	val |= vc << RDI_CFG0_VC;
+	val |= format->data_type << RDI_CFG0_DT;
+	val |= dt_id << RDI_CFG0_DT_ID;
+
+	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
+
+	val = 1 << RDI_CFG1_PACKING_FORMAT;
+	val |= 1 << RDI_CFG1_PIX_STORE;
+	val |= 1 << RDI_CFG1_DROP_H_EN;
+	val |= 1 << RDI_CFG1_DROP_V_EN;
+	val |= 1 << RDI_CFG1_CROP_H_EN;
+	val |= 1 << RDI_CFG1_CROP_V_EN;
+	val |= RDI_CFG1_EARLY_EOF_EN;
+
+	writel_relaxed(val, csid->base + CSID_RDI_CFG1(vc));
+
+	val = 0;
+	writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(vc));
+
+	val = 1;
+	writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(vc));
+
+	val = 0;
+	writel_relaxed(val, csid->base + CSID_RDI_CTRL(vc));
+
+	val = readl_relaxed(csid->base + CSID_RDI_CFG0(vc));
+	val |=  enable << RDI_CFG0_EN;
+	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
+}
+
+static void csid_configure_stream(struct csid_device *csid, u8 enable)
+{
+	u8 i;
+
+	/* Loop through all enabled VCs and configure stream for each */
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
+		if (csid->phy.en_vc & BIT(i)) {
+			/* Configure CSID "top" */
+			__csid_configure_top(csid);
+			__csid_configure_rdi_stream(csid, enable, i);
+			__csid_configure_rx(csid, &csid->phy, i);
+			__csid_ctrl_rdi(csid, enable, i);
+		}
+}
+
+static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
+{
+	if (val > 0 && val <= csid->testgen.nmodes)
+		csid->testgen.mode = val;
+
+	return 0;
+}
+
+/*
+ * csid_hw_version - CSID hardware version query
+ * @csid: CSID device
+ *
+ * Return HW version or error
+ */
+static u32 csid_hw_version(struct csid_device *csid)
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
+	dev_info(csid->camss->dev, "CSID HW Version = %u.%u.%u\n",
+		hw_gen, hw_rev, hw_step);
+
+	return hw_version;
+}
+
+/*
+ * csid_isr - CSID module interrupt service routine
+ * @irq: Interrupt line
+ * @dev: CSID device
+ *
+ * Return IRQ_HANDLED on success
+ */
+static irqreturn_t csid_isr(int irq, void *dev)
+{
+	struct csid_device *csid = dev;
+	u32 val, buf_done_val;
+	u8 reset_done;
+	int i;
+
+	val = readl_relaxed(csid->base + CSID_TOP_IRQ_STATUS);
+	writel_relaxed(val, csid->base + CSID_TOP_IRQ_CLEAR);
+	reset_done = val & BIT(TOP_IRQ_STATUS_RESET_DONE);
+
+	val = readl_relaxed(csid->base + CSID_CSI2_RX_IRQ_STATUS);
+	writel_relaxed(val, csid->base + CSID_CSI2_RX_IRQ_CLEAR);
+
+	buf_done_val = readl_relaxed(csid->base + CSID_BUF_DONE_IRQ_STATUS);
+	writel_relaxed(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+
+	/* Read and clear IRQ status for each enabled RDI channel */
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
+		if (csid->phy.en_vc & BIT(i)) {
+			val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
+			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
+		}
+
+	val = 1 << IRQ_CMD_CLEAR;
+	writel_relaxed(val, csid->base + CSID_IRQ_CMD);
+
+	if (reset_done)
+		complete(&csid->reset_complete);
+
+	return IRQ_HANDLED;
+}
+
+/*
+ * csid_reset - Trigger reset on CSID module and wait to complete
+ * @csid: CSID device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csid_reset(struct csid_device *csid)
+{
+	unsigned long time;
+	u32 val;
+	int i;
+
+	reinit_completion(&csid->reset_complete);
+
+	writel_relaxed(1, csid->base + CSID_TOP_IRQ_CLEAR);
+	writel_relaxed(1, csid->base + CSID_IRQ_CMD);
+	writel_relaxed(1, csid->base + CSID_TOP_IRQ_MASK);
+
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
+		if (csid->phy.en_vc & BIT(i)) {
+			writel_relaxed(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
+						csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+			writel_relaxed(0x1 << IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
+			writel_relaxed(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
+						csid->base + CSID_BUF_DONE_IRQ_MASK);
+		}
+
+	/* preserve registers */
+	val = (0x1 << RST_LOCATION) | (0x1 << RST_MODE);
+	writel_relaxed(val, csid->base + CSID_RST_CFG);
+
+	val = (0x1 << SELECT_HW_RST) | (0x1 << SELECT_IRQ_RST);
+	writel_relaxed(val, csid->base + CSID_RST_CMD);
+
+	time = wait_for_completion_timeout(&csid->reset_complete,
+					   msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
+	if (!time) {
+		dev_err(csid->camss->dev, "CSID reset timeout\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
+			     unsigned int match_format_idx, u32 match_code)
+{
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
+static void csid_subdev_init(struct csid_device *csid)
+{
+	csid->testgen.modes = csid_testgen_modes;
+	csid->testgen.nmodes = CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN2;
+}
+
+const struct csid_hw_ops csid_ops_gen3 = {
+	.configure_stream = csid_configure_stream,
+	.configure_testgen_pattern = csid_configure_testgen_pattern,
+	.hw_version = csid_hw_version,
+	.isr = csid_isr,
+	.reset = csid_reset,
+	.src_pad_code = csid_src_pad_code,
+	.subdev_init = csid_subdev_init,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.h b/drivers/media/platform/qcom/camss/camss-csid-gen3.h
new file mode 100644
index 000000000000..2241b91fd09e
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * camss-csid-gen3.h
+ *
+ * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module Generation 1
+ *
+ * Copyright (c) 2024 Qualcomm Technologies, Inc.
+ */
+#ifndef QC_MSM_CAMSS_CSID_GEN3_H
+#define QC_MSM_CAMSS_CSID_GEN3_H
+
+#define DECODE_FORMAT_UNCOMPRESSED_8_BIT	0x1
+#define DECODE_FORMAT_UNCOMPRESSED_10_BIT	0x2
+#define DECODE_FORMAT_UNCOMPRESSED_12_BIT	0x3
+#define DECODE_FORMAT_UNCOMPRESSED_14_BIT	0x4
+#define DECODE_FORMAT_UNCOMPRESSED_16_BIT	0x5
+#define DECODE_FORMAT_UNCOMPRESSED_20_BIT	0x6
+#define DECODE_FORMAT_UNCOMPRESSED_24_BIT	0x7
+#define DECODE_FORMAT_PAYLOAD_ONLY		0xf
+
+
+#define PLAIN_FORMAT_PLAIN8	0x0 /* supports DPCM, UNCOMPRESSED_6/8_BIT */
+#define PLAIN_FORMAT_PLAIN16	0x1 /* supports DPCM, UNCOMPRESSED_10/16_BIT */
+#define PLAIN_FORMAT_PLAIN32	0x2 /* supports UNCOMPRESSED_20_BIT */
+
+#endif /* QC_MSM_CAMSS_CSID_GEN3_H */
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 8cdae98e4dca..ae5b6b0dc0ea 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -167,7 +167,9 @@ struct csid_device {
 	struct v4l2_subdev subdev;
 	struct media_pad pads[MSM_CSID_PADS_NUM];
 	void __iomem *base;
+	void __iomem *top_base;
 	u32 irq;
+	u32 reg_update;
 	char irq_name[30];
 	struct camss_clock *clock;
 	int nclocks;
-- 
2.34.1


