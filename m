Return-Path: <linux-media+bounces-22737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 482649E5A8C
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 17:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0372A288344
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 16:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248E0222593;
	Thu,  5 Dec 2024 15:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JK01s03x"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AD522D4D9;
	Thu,  5 Dec 2024 15:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733414230; cv=none; b=lel0c+xqiuFh6MDASx5nGEyiIVz9QoyRdmyYRSrJyg2SxE/yOxaPrakVH+b9GEaqvgimv4sLCa3+Vni/ICxEULBF/WxzxykOLo4u+gGIYmYmZ9ekifE0xzY0KPd1swcMut697mJk8WFAKzwhIDSH41TyrF6CfhwAFzQJLLLozKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733414230; c=relaxed/simple;
	bh=65U3OEzw4cwL92A2MAC2FEBgnVklG18GxxLbFEq7OLA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ezaBvBP+Ei7suhCsxxQKlGstZ1wbGV7YPb0SawET/v7f3RlqxsDI2vV98TqgIfGKCO3q2lvPjOi8WT+Hjkfr46rPNtZx7tBguqzh1nLA250QBbc3vclSXlr0MR2wuoz6FDMy9aoGxYFgjeKxdXXsWAoLEHXeU21tW++nz9GqUpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JK01s03x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5FEhtb003235;
	Thu, 5 Dec 2024 15:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31UhLXcpWBrsQOiUlHZhbRaRgumjBZkCVcm2FY1dh34=; b=JK01s03xz8g07OGT
	xg1dQW1U2ENIZ8rITu74/OLyLzrbBInlpeTqF3hfVCRUZia+PLd7uoAulBVbAmI4
	+rKxku2q3LwFbPqssONuMZlP5+HYQdqvCQQDyFjKTuN6STkuM5F92blBXK4V1a/4
	x+BhW6tKWTJmY7eFb0BUhSCeXUk9nCDviu36dj1Bj3wYfhr9DmarzeY3pJUWiyyh
	XlF0NlsbOsCUz4B9KnnZNi64W9Z/5T+mtmC+OUJXJnNpCnCj0iv1Qk7Qy8ur5Rlu
	WEu6I6ZFwXp8qC5DB/E9UfqbIXzeGlgByUe7KD0bv6iLHtLOIpSI9IQMPg0+JUU2
	GFLBNQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ben884jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 15:57:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5Fv3jH018267
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 15:57:03 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 07:56:56 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
Subject: [PATCH 15/16] media: qcom: camss: Add CSID 780 support for sm8550
Date: Thu, 5 Dec 2024 21:25:37 +0530
Message-ID: <20241205155538.250743-16-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205155538.250743-1-quic_depengs@quicinc.com>
References: <20241205155538.250743-1-quic_depengs@quicinc.com>
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
X-Proofpoint-ORIG-GUID: xPVYFWecc00_g8fUp1w7fk1xoM6v36qn
X-Proofpoint-GUID: xPVYFWecc00_g8fUp1w7fk1xoM6v36qn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050116

The CSID in sm8550 is version 780, it has new register offset
and new functionality. The buf done irq, register update and
reset are moved to CSID 780.

Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../platform/qcom/camss/camss-csid-780.c      | 333 ++++++++++++++++++
 .../platform/qcom/camss/camss-csid-780.h      |  25 ++
 .../media/platform/qcom/camss/camss-csid.h    |   1 +
 drivers/media/platform/qcom/camss/camss.c     |  85 +++++
 5 files changed, 445 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-780.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-780.h

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index e636968a1126..9a723e8712a2 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -7,6 +7,7 @@ qcom-camss-objs += \
 		camss-csid-4-1.o \
 		camss-csid-4-7.o \
 		camss-csid-gen2.o \
+		camss-csid-780.o \
 		camss-csiphy-2ph-1-0.o \
 		camss-csiphy-3ph-1-0.o \
 		camss-csiphy.o \
diff --git a/drivers/media/platform/qcom/camss/camss-csid-780.c b/drivers/media/platform/qcom/camss/camss-csid-780.c
new file mode 100644
index 000000000000..bde24a93d01e
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-csid-780.c
@@ -0,0 +1,333 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
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
+#include "camss-csid-780.h"
+
+#define CSID_IO_PATH_CFG0(csid)		(0x4 * (csid))
+#define		OUTPUT_IFE_EN			0x100
+#define		INTERNAL_CSID			1
+
+#define CSID_RST_CFG			0xC
+#define		RST_MODE			BIT(0)
+#define		RST_LOCATION			BIT(4)
+
+#define CSID_RST_CMD			0x10
+#define		SELECT_HW_RST			BIT(0)
+#define		SELECT_IRQ_RST			BIT(2)
+
+#define CSID_IRQ_CMD			0x14
+#define		IRQ_CMD_CLEAR			BIT(0)
+
+#define CSID_RUP_AUP_CMD		0x18
+#define		CSID_RUP_AUP_RDI(rdi)		((BIT(4) | BIT(20)) << (rdi))
+
+#define CSID_TOP_IRQ_STATUS		0x7C
+#define		 TOP_IRQ_STATUS_RESET_DONE	BIT(0)
+
+#define CSID_TOP_IRQ_MASK		0x80
+#define CSID_TOP_IRQ_CLEAR		0x84
+#define CSID_TOP_IRQ_SET		0x88
+
+#define CSID_CSI2_RX_IRQ_STATUS		0x9C
+#define CSID_CSI2_RX_IRQ_MASK		0xA0
+#define CSID_CSI2_RX_IRQ_CLEAR		0xA4
+#define CSID_CSI2_RX_IRQ_SET		0xA8
+
+#define CSID_BUF_DONE_IRQ_STATUS	0x8C
+#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET	(csid_is_lite(csid) ? 1 : 14)
+#define CSID_BUF_DONE_IRQ_MASK		0x90
+#define CSID_BUF_DONE_IRQ_CLEAR		0x94
+#define CSID_BUF_DONE_IRQ_SET		0x98
+
+#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)	(0xEC + 0x10 * (rdi))
+#define		RUP_DONE_IRQ_STATUS		BIT(23)
+
+#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)	(0xF4 + 0x10 * (rdi))
+#define CSID_CSI2_RDIN_IRQ_SET(rdi)	(0xF8 + 0x10 * (rdi))
+
+#define CSID_CSI2_RX_CFG0		0x200
+#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES	0
+#define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
+#define		CSI2_RX_CFG0_PHY_NUM_SEL	20
+
+#define CSID_CSI2_RX_CFG1		0x204
+#define		CSI2_RX_CFG1_ECC_CORRECTION_EN	BIT(0)
+#define		CSI2_RX_CFG1_VC_MODE		BIT(2)
+
+#define CSID_RDI_CFG0(rdi)		(0x500 + 0x100 * (rdi))
+#define		RDI_CFG0_TIMESTAMP_EN		BIT(6)
+#define		RDI_CFG0_TIMESTAMP_STB_SEL	BIT(8)
+#define		RDI_CFG0_DECODE_FORMAT		12
+#define		RDI_CFG0_DT			16
+#define		RDI_CFG0_VC			22
+#define		RDI_CFG0_DT_ID			27
+#define		RDI_CFG0_EN			BIT(31)
+
+#define CSID_RDI_CTRL(rdi)		(0x504 + 0x100 * (rdi))
+#define		RDI_CTRL_START_CMD		BIT(0)
+
+#define CSID_RDI_CFG1(rdi)		(0x510 + 0x100 * (rdi))
+#define		RDI_CFG1_DROP_H_EN		BIT(5)
+#define		RDI_CFG1_DROP_V_EN		BIT(6)
+#define		RDI_CFG1_CROP_H_EN		BIT(7)
+#define		RDI_CFG1_CROP_V_EN		BIT(8)
+#define		RDI_CFG1_PIX_STORE		BIT(10)
+#define		RDI_CFG1_PACKING_FORMAT_MIPI	BIT(15)
+
+#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)	(0x548 + 0x100 * (rdi))
+#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)	(0x54C + 0x100 * (rdi))
+
+#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX	1
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
+	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
+	if (vc > 3)
+		val |= CSI2_RX_CFG1_VC_MODE;
+
+	writel(val, csid->base + CSID_CSI2_RX_CFG1);
+}
+
+static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
+{
+	int val = 0;
+
+	if (enable)
+		val = RDI_CTRL_START_CMD;
+
+	writel(val, csid->base + CSID_RDI_CTRL(rdi));
+}
+
+static void __csid_configure_wrapper(struct csid_device *csid)
+{
+	u32 val;
+
+	/* csid lite doesn't need to configure top register */
+	if (csid->res->is_lite)
+		return;
+
+	val = OUTPUT_IFE_EN | INTERNAL_CSID;
+	writel(val, csid->camss->csid_wrapper_base + CSID_IO_PATH_CFG0(csid->id));
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
+	val = RDI_CFG0_TIMESTAMP_EN;
+	val |= RDI_CFG0_TIMESTAMP_STB_SEL;
+	/* note: for non-RDI path, this should be format->decode_format */
+	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
+	val |= vc << RDI_CFG0_VC;
+	val |= format->data_type << RDI_CFG0_DT;
+	val |= dt_id << RDI_CFG0_DT_ID;
+
+	writel(val, csid->base + CSID_RDI_CFG0(vc));
+
+	val = RDI_CFG1_PACKING_FORMAT_MIPI;
+	val |= RDI_CFG1_PIX_STORE;
+	val |= RDI_CFG1_DROP_H_EN;
+	val |= RDI_CFG1_DROP_V_EN;
+	val |= RDI_CFG1_CROP_H_EN;
+	val |= RDI_CFG1_CROP_V_EN;
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
+		val |= RDI_CFG0_EN;
+	writel(val, csid->base + CSID_RDI_CFG0(vc));
+}
+
+static void csid_configure_stream(struct csid_device *csid, u8 enable)
+{
+	u8 i;
+
+	__csid_configure_wrapper(csid);
+
+	/* Loop through all enabled VCs and configure stream for each */
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
+		if (csid->phy.en_vc & BIT(i)) {
+			__csid_configure_rdi_stream(csid, enable, i);
+			__csid_configure_rx(csid, &csid->phy, i);
+			__csid_ctrl_rdi(csid, enable, i);
+		}
+}
+
+static void csid_subdev_reg_update(struct csid_device *csid, int port_id, bool clear)
+{
+	if (clear) {
+		csid->reg_update &= ~CSID_RUP_AUP_RDI(port_id);
+	} else {
+		csid->reg_update |= CSID_RUP_AUP_RDI(port_id);
+		writel(csid->reg_update, csid->base + CSID_RUP_AUP_CMD);
+	}
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
+	reset_done = val & TOP_IRQ_STATUS_RESET_DONE;
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
+			if (val & RUP_DONE_IRQ_STATUS)
+				/* clear the reg update bit */
+				csid_subdev_reg_update(csid, i, true);
+
+			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i)) {
+				/*
+				 * For Titan 780, bus done and RUP IRQ have been moved to
+				 * CSID from VFE. Once CSID received bus done, need notify
+				 * VFE of this event. Trigger VFE to handle bus done process.
+				 */
+				camss_buf_done(csid->camss, csid->id, i);
+			}
+		}
+
+	val = IRQ_CMD_CLEAR;
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
+			       csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+			writel(IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
+			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
+			       csid->base + CSID_BUF_DONE_IRQ_MASK);
+		}
+
+	/* preserve registers */
+	val = RST_LOCATION | RST_MODE;
+	writel(val, csid->base + CSID_RST_CFG);
+
+	val = SELECT_HW_RST | SELECT_IRQ_RST;
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
+static void csid_subdev_init(struct csid_device *csid)
+{
+	/* nop */
+}
+
+const struct csid_hw_ops csid_ops_780 = {
+	/* No testgen pattern hw in csid 780 HW */
+	.configure_testgen_pattern = NULL,
+	.configure_stream = csid_configure_stream,
+	.hw_version = csid_hw_version,
+	.isr = csid_isr,
+	.reset = csid_reset,
+	.src_pad_code = csid_src_pad_code,
+	.subdev_init = csid_subdev_init,
+	.reg_update = csid_subdev_reg_update,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-csid-780.h b/drivers/media/platform/qcom/camss/camss-csid-780.h
new file mode 100644
index 000000000000..7d9f88d0fc58
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-csid-780.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * camss-csid-780.h
+ *
+ * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module Generation 3
+ *
+ * Copyright (c) 2024 Qualcomm Technologies, Inc.
+ */
+#ifndef QC_MSM_CAMSS_CSID_780_H
+#define QC_MSM_CAMSS_CSID_780_H
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
+#define PLAIN_FORMAT_PLAIN8	0x0 /* supports DPCM, UNCOMPRESSED_6/8_BIT */
+#define PLAIN_FORMAT_PLAIN16	0x1 /* supports DPCM, UNCOMPRESSED_10/16_BIT */
+#define PLAIN_FORMAT_PLAIN32	0x2 /* supports UNCOMPRESSED_20_BIT */
+
+#endif /* QC_MSM_CAMSS_CSID_780_H */
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 1369e7ea7219..4776166f3d8f 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -237,6 +237,7 @@ extern const struct csid_formats csid_formats_gen2;
 extern const struct csid_hw_ops csid_ops_4_1;
 extern const struct csid_hw_ops csid_ops_4_7;
 extern const struct csid_hw_ops csid_ops_gen2;
+extern const struct csid_hw_ops csid_ops_780;
 
 /*
  * csid_is_lite - Check if CSID is CSID lite.
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 75073841156f..c0e336f3916b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1741,6 +1741,88 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 	}
 };
 
+static const struct resources_wrapper csid_wrapper_res_sm8550 = {
+	.reg = "csid_wrapper",
+};
+
+static const struct camss_subdev_resources csid_res_8550[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "csid", "csiphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_780,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "csid", "csiphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_780,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID2 */
+	{
+		.regulators = {},
+		.clock = { "csid", "csiphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_780,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID3 */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_780,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID4 */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_780,
+			.formats = &csid_formats_gen2
+		}
+	}
+};
+
 static const struct resources_icc icc_res_sm8550[] = {
 	{
 		.name = "ahb",
@@ -2778,9 +2860,12 @@ static const struct camss_resources sm8550_resources = {
 	.version = CAMSS_8550,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8550,
+	.csid_res = csid_res_8550,
+	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.icc_res = icc_res_sm8550,
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8550),
+	.csid_num = ARRAY_SIZE(csid_res_8550),
 	.link_entities = camss_link_entities
 };
 
-- 
2.34.1


