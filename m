Return-Path: <linux-media+bounces-16153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 256D794F012
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 16:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49C1F1C21F59
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 14:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6624D18E051;
	Mon, 12 Aug 2024 14:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QIvI0P1g"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B055218CC0B;
	Mon, 12 Aug 2024 14:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723473755; cv=none; b=XCaoVpp80X/Q+it4uTAT8lOrDHFokEUZGzKKP5yYFUJanSyuMKVVpq/jGf6YuvfXTD7/Ivr2KgVKYzhi6wcJ1pZJMVJYAUuDsoEEmzoodiSg48YHw+DpQTHzoYG6VtqVjnO6pN3jVFr0C0Ewa3bfoHGDto3R448JQh0kNU6R0iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723473755; c=relaxed/simple;
	bh=gIJWbk/5ZNAQTVLuL9S6Td8StCB/L9frmXbfAGo8Nb4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f4ksLFBxSiFmSn7UlElvMUtz/JYppfxhwWMd6wVOb/p8e8G8XVp7hA3cAQSRCzp0znrJ9xys6IkLFT3ub/tzfV9a5rNG/31qBR/zSbh3DlkM1xJBy6tKOxeCREvC3vJpTvpKmo+bAfH1awY6vME1e2PK1ifsa9H7sGe77LLRCs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QIvI0P1g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47CDSaCg025137;
	Mon, 12 Aug 2024 14:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ogANULJ7+kiJnn1LsBG96d4epWvdS/jgiLOOdEYEVlc=; b=QIvI0P1gzkIkQKwU
	aYD2OVL12F+XaRdxLBNZ5yJCZUG48SKbUhgjBFXwBm5+kLD+e6LRbP9ECKfUlQ/B
	NyB3Gq8Ln+M9GUnqW4raLDDDqcI9s0W+j/ZtcntIZ60hYvOOqotl148XleUVPYZg
	GvOv2JjkOQV/1tITxyz/K4oRkdxl2gkK51AYljfljJqNW0PEgQzvAkbDCO6u4TGl
	my2/gv+DOWtDpf1sXgO4Ljlqwk5GJALi6uyqaCbeKoQtizqnNVqwwGI3H8mfAOrH
	T1LOuZWsD36wnoUuFFMVqIbq3oCnxtOrPSFcl6oOGtek3O/h7dw4czsYhI0MOsM2
	h5j+AQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x16s4haa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 14:42:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47CEgStd003400
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 14:42:28 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 12 Aug 2024 07:42:22 -0700
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <quic_depengs@quicinc.com>,
        Yongsheng Li
	<quic_yon@quicinc.com>
Subject: [PATCH 12/13] media: qcom: camss: Add CSID Gen3 support for sm8550
Date: Mon, 12 Aug 2024 20:11:30 +0530
Message-ID: <20240812144131.369378-13-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812144131.369378-1-quic_depengs@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
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
X-Proofpoint-GUID: sAiU3yFhA3du4QQoWD3dFsokJHlqwQrV
X-Proofpoint-ORIG-GUID: sAiU3yFhA3du4QQoWD3dFsokJHlqwQrV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_04,2024-08-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408120109

The CSID in sm8550 is gen3, it has new register offset and new
functionality. The buf done irq,register update and reset are
moved to CSID gen3.

The sm8550 also has a new block is named as CSID top, CSID can
connect to VFE or SFE(Sensor Front End), the connection is controlled
by CSID top.

Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../platform/qcom/camss/camss-csid-gen3.c     | 339 ++++++++++++++++++
 .../platform/qcom/camss/camss-csid-gen3.h     |  26 ++
 .../media/platform/qcom/camss/camss-csid.c    |  46 ++-
 .../media/platform/qcom/camss/camss-csid.h    |  10 +
 drivers/media/platform/qcom/camss/camss.c     |  91 +++++
 drivers/media/platform/qcom/camss/camss.h     |   2 +
 7 files changed, 503 insertions(+), 12 deletions(-)
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
index 000000000000..d96bc126f0a9
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -0,0 +1,339 @@
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
+#define CSID_TOP_IO_PATH_CFG0(csid)	(0x4 * (csid))
+#define		OUTPUT_IFE_EN			0x100
+#define		INTERNAL_CSID			1
+
+#define CSID_RST_CFG			0xC
+#define		RST_MODE			0
+#define		RST_LOCATION			4
+
+#define CSID_RST_CMD			0x10
+#define		SELECT_HW_RST			0
+#define		SELECT_SW_RST			1
+#define		SELECT_IRQ_RST			2
+
+#define CSID_CSI2_RX_IRQ_STATUS		0x9C
+#define CSID_CSI2_RX_IRQ_MASK		0xA0
+#define CSID_CSI2_RX_IRQ_CLEAR		0xA4
+#define CSID_CSI2_RX_IRQ_SET		0xA8
+
+#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)	(0xEC + 0x10 * (rdi))
+
+#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)	(0xF4 + 0x10 * (rdi))
+#define CSID_CSI2_RDIN_IRQ_SET(rdi)	(0xF8 + 0x10 * (rdi))
+
+#define CSID_TOP_IRQ_STATUS		0x7C
+#define		 TOP_IRQ_STATUS_RESET_DONE	0
+
+#define CSID_TOP_IRQ_MASK		0x80
+#define CSID_TOP_IRQ_CLEAR		0x84
+#define CSID_TOP_IRQ_SET		0x88
+
+#define CSID_IRQ_CMD			0x14
+#define		IRQ_CMD_CLEAR			0
+#define		IRQ_CMD_SET			4
+
+#define CSID_REG_UPDATE_CMD		0x18
+
+#define CSID_BUF_DONE_IRQ_STATUS	0x8C
+#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET	(csid_is_lite(csid) ? 1 : 14)
+#define CSID_BUF_DONE_IRQ_MASK		0x90
+#define CSID_BUF_DONE_IRQ_CLEAR		0x94
+#define CSID_BUF_DONE_IRQ_SET		0x98
+
+#define	CSI2_RX_CFG0_PHY_SEL_BASE_IDX	1
+
+#define CSID_CSI2_RX_CFG0		0x200
+#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES	0
+#define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
+#define		CSI2_RX_CFG0_PHY_NUM_SEL	20
+
+#define CSID_CSI2_RX_CFG1		0x204
+#define		CSI2_RX_CFG1_ECC_CORRECTION_EN	0
+#define		CSI2_RX_CFG1_VC_MODE		2
+
+#define CSID_RDI_CFG0(rdi)		(0x500 + 0x100 * (rdi))
+#define		RDI_CFG0_TIMESTAMP_EN		6
+#define		RDI_CFG0_TIMESTAMP_STB_SEL	8
+#define		RDI_CFG0_DECODE_FORMAT		12
+#define		RDI_CFG0_DT			16
+#define		RDI_CFG0_VC			22
+#define		RDI_CFG0_DT_ID			27
+#define		RDI_CFG0_EN			31
+
+#define CSID_RDI_CFG1(rdi)		(0x510 + 0x100 * (rdi))
+#define		RDI_CFG1_DROP_H_EN		5
+#define		RDI_CFG1_DROP_V_EN		6
+#define		RDI_CFG1_CROP_H_EN		7
+#define		RDI_CFG1_CROP_V_EN		8
+#define		RDI_CFG1_PIX_STORE		10
+#define		RDI_CFG1_PACKING_FORMAT		15
+
+#define CSID_RDI_CTRL(rdi)		(0x504 + 0x100 * (rdi))
+#define		RDI_CTRL_START_CMD		0
+
+#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)	(0x548 + 0x100 * (rdi))
+#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)	(0x54C + 0x100 * (rdi))
+
+static inline int reg_update_rdi(struct csid_device *csid, int n)
+{
+	return BIT(n + 4) + BIT(20 + n);
+}
+#define REG_UPDATE_RDI			reg_update_rdi
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
+	writel(val, csid->base + CSID_CSI2_RX_CFG0);
+
+	val = 1 << CSI2_RX_CFG1_ECC_CORRECTION_EN;
+	if (vc > 3)
+		val |= 1 << CSI2_RX_CFG1_VC_MODE;
+	writel(val, csid->base + CSID_CSI2_RX_CFG1);
+}
+
+static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
+{
+	int val = 0;
+
+	if (enable)
+		val = 1 << RDI_CTRL_START_CMD;
+
+	writel(val, csid->base + CSID_RDI_CTRL(rdi));
+}
+
+static void __csid_configure_top(struct csid_device *csid)
+{
+	u32 val;
+
+	/* csid lite doesn't need to configure top register */
+	if (csid->res->is_lite)
+		return;
+
+	/* CSID top is a new function in Titan780.
+	 * CSID can connect to VFE & SFE(Sensor Front End).
+	 * This connection is controlled by CSID top.
+	 * Only enable VFE path in current driver.
+	 */
+	val = OUTPUT_IFE_EN | INTERNAL_CSID;
+	writel(val, csid->camss->csid_top_base + CSID_TOP_IO_PATH_CFG0(csid->id));
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
+	val |= 1 << RDI_CFG0_TIMESTAMP_STB_SEL;
+	/* note: for non-RDI path, this should be format->decode_format */
+	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
+	val |= vc << RDI_CFG0_VC;
+	val |= format->data_type << RDI_CFG0_DT;
+	val |= dt_id << RDI_CFG0_DT_ID;
+
+	writel(val, csid->base + CSID_RDI_CFG0(vc));
+
+	val = 1 << RDI_CFG1_PACKING_FORMAT;
+	val |= 1 << RDI_CFG1_PIX_STORE;
+	val |= 1 << RDI_CFG1_DROP_H_EN;
+	val |= 1 << RDI_CFG1_DROP_V_EN;
+	val |= 1 << RDI_CFG1_CROP_H_EN;
+	val |= 1 << RDI_CFG1_CROP_V_EN;
+
+	writel(val, csid->base + CSID_RDI_CFG1(vc));
+
+	val = 0;
+	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(vc));
+
+	val = 1;
+	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(vc));
+
+	val = 0;
+	writel(val, csid->base + CSID_RDI_CTRL(vc));
+
+	val = readl(csid->base + CSID_RDI_CFG0(vc));
+
+	if (enable)
+		val |= 1 << RDI_CFG0_EN;
+	writel(val, csid->base + CSID_RDI_CFG0(vc));
+}
+
+static void csid_configure_stream(struct csid_device *csid, u8 enable)
+{
+	u8 i;
+
+	/* Loop through all enabled VCs and configure stream for each */
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
+		if (csid->phy.en_vc & BIT(i)) {
+			__csid_configure_top(csid);
+			__csid_configure_rdi_stream(csid, enable, i);
+			__csid_configure_rx(csid, &csid->phy, i);
+			__csid_ctrl_rdi(csid, enable, i);
+		}
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
+	val = readl(csid->base + CSID_TOP_IRQ_STATUS);
+	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
+	reset_done = val & BIT(TOP_IRQ_STATUS_RESET_DONE);
+
+	val = readl(csid->base + CSID_CSI2_RX_IRQ_STATUS);
+	writel(val, csid->base + CSID_CSI2_RX_IRQ_CLEAR);
+
+	buf_done_val = readl(csid->base + CSID_BUF_DONE_IRQ_STATUS);
+	writel(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+
+	/* Read and clear IRQ status for each enabled RDI channel */
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
+		if (csid->phy.en_vc & BIT(i)) {
+			val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
+			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
+
+			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i)) {
+				/* For Titan 780, Buf Done IRQ&REG has been moved to CSID from VFE.
+				 * Once CSID received Buf Done, need notify this event to VFE.
+				 * Trigger VFE to handle Buf Done process.
+				 */
+				camss_buf_done(csid->camss, csid->id, i);
+			}
+		}
+
+	val = 1 << IRQ_CMD_CLEAR;
+	writel(val, csid->base + CSID_IRQ_CMD);
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
+	writel(1, csid->base + CSID_TOP_IRQ_CLEAR);
+	writel(1, csid->base + CSID_IRQ_CMD);
+	writel(1, csid->base + CSID_TOP_IRQ_MASK);
+
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
+		if (csid->phy.en_vc & BIT(i)) {
+			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
+						csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+			writel(0x1 << IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
+			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
+						csid->base + CSID_BUF_DONE_IRQ_MASK);
+		}
+
+	/* preserve registers */
+	val = (0x1 << RST_LOCATION) | (0x1 << RST_MODE);
+	writel(val, csid->base + CSID_RST_CFG);
+
+	val = (0x1 << SELECT_HW_RST) | (0x1 << SELECT_IRQ_RST);
+	writel(val, csid->base + CSID_RST_CMD);
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
+static void csid_subdev_reg_update(struct csid_device *csid, int port_id, bool is_clear)
+{
+	if (is_clear) {
+		csid->reg_update &= ~REG_UPDATE_RDI(csid, port_id);
+	} else {
+		csid->reg_update |= REG_UPDATE_RDI(csid, port_id);
+		writel(csid->reg_update, csid->base + CSID_REG_UPDATE_CMD);
+	}
+}
+
+static void csid_subdev_init(struct csid_device *csid)
+{
+	/* nop */
+}
+
+const struct csid_hw_ops csid_ops_gen3 = {
+	/* No testgen pattern hw in csid gen3 HW */
+	.configure_testgen_pattern = NULL,
+	.configure_stream = csid_configure_stream,
+	.hw_version = csid_hw_version,
+	.isr = csid_isr,
+	.reset = csid_reset,
+	.src_pad_code = csid_src_pad_code,
+	.subdev_init = csid_subdev_init,
+	.reg_update = csid_subdev_reg_update,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.h b/drivers/media/platform/qcom/camss/camss-csid-gen3.h
new file mode 100644
index 000000000000..43aa0d8d89b9
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * camss-csid-gen3.h
+ *
+ * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module Generation 3
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
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 5806df7e7a7c..8ce08929d91f 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -838,7 +838,7 @@ static void csid_try_format(struct csid_device *csid,
 		break;
 
 	case MSM_CSID_PAD_SRC:
-		if (csid->testgen_mode->cur.val == 0) {
+		if (!csid->testgen_mode || csid->testgen_mode->cur.val == 0) {
 			/* Test generator is disabled, */
 			/* keep pad formats in sync */
 			u32 code = fmt->code;
@@ -1042,6 +1042,7 @@ static int csid_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 static int csid_set_test_pattern(struct csid_device *csid, s32 value)
 {
 	struct csid_testgen_config *tg = &csid->testgen;
+	const struct csid_hw_ops *hw_ops = csid->res->hw_ops;
 
 	/* If CSID is linked to CSIPHY, do not allow to enable test generator */
 	if (value && media_pad_remote_pad_first(&csid->pads[MSM_CSID_PAD_SINK]))
@@ -1049,7 +1050,10 @@ static int csid_set_test_pattern(struct csid_device *csid, s32 value)
 
 	tg->enabled = !!value;
 
-	return csid->res->hw_ops->configure_testgen_pattern(csid, value);
+	if (hw_ops->configure_testgen_pattern)
+		return -EOPNOTSUPP;
+	else
+		return hw_ops->configure_testgen_pattern(csid, value);
 }
 
 /*
@@ -1121,6 +1125,19 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 		csid->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
 		if (IS_ERR(csid->base))
 			return PTR_ERR(csid->base);
+
+		/* CSID "top" is a new function in new version HW,
+		 * CSID can connect to VFE & SFE(Sensor Front End).
+		 * this connection is controlled by CSID "top" registers.
+		 * There is only one CSID "top" region for all CSIDs.
+		 */
+		if (!csid_is_lite(csid) && res->reg[1] && !camss->csid_top_base) {
+			camss->csid_top_base =
+				devm_platform_ioremap_resource_byname(pdev, res->reg[1]);
+
+			if (IS_ERR(camss->csid_top_base))
+				return PTR_ERR(camss->csid_top_base);
+		}
 	}
 
 	/* Interrupt */
@@ -1267,7 +1284,7 @@ static int csid_link_setup(struct media_entity *entity,
 
 		/* If test generator is enabled */
 		/* do not allow a link from CSIPHY to CSID */
-		if (csid->testgen_mode->cur.val != 0)
+		if (csid->testgen_mode && csid->testgen_mode->cur.val != 0)
 			return -EBUSY;
 
 		sd = media_entity_to_v4l2_subdev(remote->entity);
@@ -1366,15 +1383,20 @@ int msm_csid_register_entity(struct csid_device *csid,
 		return ret;
 	}
 
-	csid->testgen_mode = v4l2_ctrl_new_std_menu_items(&csid->ctrls,
-				&csid_ctrl_ops, V4L2_CID_TEST_PATTERN,
-				csid->testgen.nmodes, 0, 0,
-				csid->testgen.modes);
-
-	if (csid->ctrls.error) {
-		dev_err(dev, "Failed to init ctrl: %d\n", csid->ctrls.error);
-		ret = csid->ctrls.error;
-		goto free_ctrl;
+	if (csid->res->hw_ops->configure_testgen_pattern) {
+		csid->testgen_mode =
+			v4l2_ctrl_new_std_menu_items(&csid->ctrls,
+						     &csid_ctrl_ops,
+						     V4L2_CID_TEST_PATTERN,
+						     csid->testgen.nmodes, 0,
+						     0, csid->testgen.modes);
+
+		if (csid->ctrls.error) {
+			dev_err(dev, "Failed to init ctrl: %d\n",
+				csid->ctrls.error);
+			ret = csid->ctrls.error;
+			goto free_ctrl;
+		}
 	}
 
 	csid->subdev.ctrl_handler = &csid->ctrls;
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index f52209b96583..2715707dcdb4 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -152,6 +152,14 @@ struct csid_hw_ops {
 	 * @csid: CSID device
 	 */
 	void (*subdev_init)(struct csid_device *csid);
+
+	/*
+	 * reg_update - receive message from other sub device
+	 * @csid: CSID device
+	 * @port_id: Port id
+	 * @is_clear: Indicate if it is clearing reg update or setting reg update
+	 */
+	void (*reg_update)(struct csid_device *csid, int port_id, bool is_clear);
 };
 
 struct csid_subdev_resources {
@@ -168,6 +176,7 @@ struct csid_device {
 	struct media_pad pads[MSM_CSID_PADS_NUM];
 	void __iomem *base;
 	u32 irq;
+	u32 reg_update;
 	char irq_name[30];
 	struct camss_clock *clock;
 	int nclocks;
@@ -228,6 +237,7 @@ extern const struct csid_formats csid_formats_gen2;
 extern const struct csid_hw_ops csid_ops_4_1;
 extern const struct csid_hw_ops csid_ops_4_7;
 extern const struct csid_hw_ops csid_ops_gen2;
+extern const struct csid_hw_ops csid_ops_gen3;
 
 /*
  * csid_is_lite - Check if CSID is CSID lite.
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1cdd40f49c27..7ee102948dc4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1588,6 +1588,84 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 	}
 };
 
+static const struct camss_subdev_resources csid_res_8550[] = {
+	/* CSID0 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "csid", "csiphy_rx" },
+		.clock_rate = { { 400000000, 480000000, 480000000, 480000000, 480000000 },
+				{ 400000000, 480000000, 480000000, 480000000, 480000000 } },
+		.reg = { "csid0", "csid_top" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_gen3,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "csid", "csiphy_rx" },
+		.clock_rate = { { 400000000, 480000000, 480000000, 480000000, 480000000 },
+				{ 400000000, 480000000, 480000000, 480000000, 480000000 } },
+		.reg = { "csid1", "csid_top" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_gen3,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID2 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "csid", "csiphy_rx" },
+		.clock_rate = { { 400000000, 480000000, 480000000, 480000000, 480000000 },
+				{ 400000000, 480000000, 480000000, 480000000, 480000000 } },
+		.reg = { "csid2", "csid_top" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_gen3,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID3 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000, 480000000, 480000000, 480000000, 480000000 },
+				{ 400000000, 480000000, 480000000, 480000000, 480000000 } },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_gen3,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID4 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000, 480000000, 480000000, 480000000, 480000000 },
+				{ 400000000, 480000000, 480000000, 480000000, 480000000 } },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_gen3,
+			.formats = &csid_formats_gen2
+		}
+	}
+};
+
 static const struct resources_icc icc_res_sm8550[] = {
 	{
 		.name = "ahb",
@@ -1768,6 +1846,17 @@ void camss_pm_domain_off(struct camss *camss, int id)
 	}
 }
 
+void camss_buf_done(struct camss *camss, int hw_id, int port_id)
+{
+	struct vfe_device *vfe;
+
+	if (hw_id < camss->res->vfe_num) {
+		vfe = &(camss->vfe[hw_id]);
+
+		vfe->res->hw_ops->vfe_buf_done(vfe, port_id);
+	}
+}
+
 static int vfe_parent_dev_ops_get(struct camss *camss, int id)
 {
 	int ret = -EINVAL;
@@ -2578,9 +2667,11 @@ static const struct camss_resources sm8550_resources = {
 	.version = CAMSS_8550,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8550,
+	.csid_res = csid_res_8550,
 	.icc_res = icc_res_sm8550,
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8550),
+	.csid_num = ARRAY_SIZE(csid_res_8550),
 	.link_entities = camss_link_entities
 };
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 5568ab32d5d7..d6b6558a82b9 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -117,6 +117,7 @@ struct camss {
 	struct device_link *genpd_link;
 	struct icc_path *icc_path[ICC_SM8250_COUNT];
 	const struct camss_resources *res;
+	void __iomem *csid_top_base;
 };
 
 struct camss_camera_interface {
@@ -155,5 +156,6 @@ void camss_pm_domain_off(struct camss *camss, int id);
 int camss_vfe_get(struct camss *camss, int id);
 void camss_vfe_put(struct camss *camss, int id);
 void camss_delete(struct camss *camss);
+void camss_buf_done(struct camss *camss, int hw_id, int port_id);
 
 #endif /* QC_MSM_CAMSS_H */
-- 
2.34.1


