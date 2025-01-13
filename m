Return-Path: <linux-media+bounces-24668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C84B8A0AE78
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 05:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BDB23A68E2
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 04:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3551D5CF2;
	Mon, 13 Jan 2025 04:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dZSceDmc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFE01BBBE3;
	Mon, 13 Jan 2025 04:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736742799; cv=none; b=Gax1Dc8Pt/qdr2+ERhOebP6tqJkeMowJYM9MgRaXY3U90XyirHy3vEvHIEoGORAyuuw0fZo9weF1ujUyXGEjfWC1wbltHm5y9/vSv0BXwwrv32sjJ0cbOdrgS5brzZgBYpOYw1hMQG5mScAv5MIxbQTisBMcQGICwnPi4pSIDIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736742799; c=relaxed/simple;
	bh=RdEmbyMsCXz045vIZPQ8jLHoxzrSYjF9XI7OvxX0Ue0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mr2gR12uWm9wFpVuhABB/uCKx7SO6CgSsNWXAg25yzxG6H1DBPZ23lW/7DENG9bf93HNB6N9GRGJ7GbjuLv/SOy5Mo/lDqPJk7ePxLeTvXd+Hxo2R0KQAXeZ2QBvK5U6e/1q1ra3gLt7bDCo1FmywM6btw4GRf3aaKhOhuJ6TVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dZSceDmc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50CLq19B002138;
	Mon, 13 Jan 2025 04:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TRT0i2bvbK+TgVYK/H7BGKLzYG8IeeNbCgyeMiBFNWI=; b=dZSceDmcH08Hz2A0
	MQN0zi1jtq/B4Xo3uM/pgXwnZgSFaZzYyVErNY4x2IdEw37A3RSIgHxT3c9IBGVZ
	E+OShj5RQfWrxqtX9vqg7DpRRmEdyhoTMg/tMzMPq9noBWEcm+j8StiPiPJ/46Hk
	4/im2Qg9lzd9gyM8Vzox2DPMayYK7u9x4kqaq56GPAWpvr432UF6ddZeL3nzh3oY
	b+gOtyeNg+3IJXN5zfhozx+fS8nEewNPMwg2e2QCO9ebFUoo7WF+TaWADVTwALT1
	dulxjNuXUv6s/VWznXVk6SzcIgYL22LonDiIjB4yLg/ufidifYjmPy50XhU4lBtW
	nbF2KQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 443hkjb5bp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 04:33:13 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D4XCME021322
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 04:33:12 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 12 Jan 2025 20:33:06 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>,
        <hverkuil@xs4all.nl>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
Subject: [PATCH v9 16/16] media: qcom: camss: Add support for VFE 780
Date: Mon, 13 Jan 2025 10:01:33 +0530
Message-ID: <20250113043133.1387162-17-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113043133.1387162-1-quic_depengs@quicinc.com>
References: <20250113043133.1387162-1-quic_depengs@quicinc.com>
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
X-Proofpoint-GUID: MjvB-LSToi4f6af7vNtps8jqyMQij_B6
X-Proofpoint-ORIG-GUID: MjvB-LSToi4f6af7vNtps8jqyMQij_B6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130036

Add support for VFE found on SM8550 (Titan 780). This implementation is
based on the titan 480 implementation. It supports the normal and lite
VFE.

Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../media/platform/qcom/camss/camss-vfe-780.c | 159 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
 drivers/media/platform/qcom/camss/camss.c     | 121 +++++++++++++
 5 files changed, 284 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-780.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 9a723e8712a2..f6db5b3b5ace 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -17,6 +17,7 @@ qcom-camss-objs += \
 		camss-vfe-4-8.o \
 		camss-vfe-17x.o \
 		camss-vfe-480.o \
+		camss-vfe-780.o \
 		camss-vfe-gen1.o \
 		camss-vfe.o \
 		camss-video.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
new file mode 100644
index 000000000000..b9812d70f91b
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v780 (SM8550)
+ *
+ * Copyright (c) 2024 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+
+#include "camss.h"
+#include "camss-vfe.h"
+
+#define BUS_REG_BASE			(vfe_is_lite(vfe) ? 0x200 : 0xC00)
+
+#define VFE_BUS_WM_CGC_OVERRIDE		(BUS_REG_BASE + 0x08)
+#define		WM_CGC_OVERRIDE_ALL		(0x7FFFFFF)
+
+#define VFE_BUS_WM_TEST_BUS_CTRL	(BUS_REG_BASE + 0xDC)
+
+#define VFE_BUS_WM_CFG(n)		(BUS_REG_BASE + 0x200 + (n) * 0x100)
+#define		WM_CFG_EN			BIT(0)
+#define		WM_VIR_FRM_EN			BIT(1)
+#define		WM_CFG_MODE			BIT(16)
+#define VFE_BUS_WM_IMAGE_ADDR(n)	(BUS_REG_BASE + 0x204 + (n) * 0x100)
+#define VFE_BUS_WM_FRAME_INCR(n)	(BUS_REG_BASE + 0x208 + (n) * 0x100)
+#define VFE_BUS_WM_IMAGE_CFG_0(n)	(BUS_REG_BASE + 0x20c + (n) * 0x100)
+#define		WM_IMAGE_CFG_0_DEFAULT_WIDTH	(0xFFFF)
+#define VFE_BUS_WM_IMAGE_CFG_2(n)	(BUS_REG_BASE + 0x214 + (n) * 0x100)
+#define		WM_IMAGE_CFG_2_DEFAULT_STRIDE	(0xFFFF)
+#define VFE_BUS_WM_PACKER_CFG(n)	(BUS_REG_BASE + 0x218 + (n) * 0x100)
+
+#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)	(BUS_REG_BASE + 0x230 + (n) * 0x100)
+#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)	(BUS_REG_BASE + 0x234 + (n) * 0x100)
+#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)		(BUS_REG_BASE + 0x238 + (n) * 0x100)
+#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(BUS_REG_BASE + 0x23c + (n) * 0x100)
+
+#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + 0x260 + (n) * 0x100)
+#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + 0x264 + (n) * 0x100)
+
+/*
+ * Bus client mapping:
+ *
+ * Full VFE:
+ * 23 = RDI0, 24 = RDI1, 25 = RDI2
+ *
+ * VFE LITE:
+ * 0 = RDI0, 1 = RDI1, 2 = RDI3, 4 = RDI4
+ */
+#define RDI_WM(n)			((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
+
+static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
+{
+	struct v4l2_pix_format_mplane *pix =
+		&line->video_out.active_fmt.fmt.pix_mp;
+
+	wm = RDI_WM(wm);
+
+	/* no clock gating at bus input */
+	writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
+
+	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
+
+	writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
+	       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
+	writel((WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF),
+	       vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
+	writel(WM_IMAGE_CFG_2_DEFAULT_STRIDE,
+	       vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
+	writel(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
+
+	/* no dropped frames, one irq per frame */
+	writel(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
+	writel(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
+	writel(0, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(wm));
+	writel(1, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(wm));
+
+	writel(1, vfe->base + VFE_BUS_WM_MMU_PREFETCH_CFG(wm));
+	writel(0xFFFFFFFF, vfe->base + VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(wm));
+
+	writel(WM_CFG_EN | WM_CFG_MODE, vfe->base + VFE_BUS_WM_CFG(wm));
+}
+
+static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
+{
+	wm = RDI_WM(wm);
+	writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
+}
+
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
+			  struct vfe_line *line)
+{
+	wm = RDI_WM(wm);
+	writel((addr >> 8) & 0xFFFFFFFF, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
+
+	dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n",
+		wm, addr);
+}
+
+static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	int port_id = line_id;
+
+	camss_reg_update(vfe->camss, vfe->id, port_id, false);
+}
+
+static inline void vfe_reg_update_clear(struct vfe_device *vfe,
+					enum vfe_line_id line_id)
+{
+	int port_id = line_id;
+
+	camss_reg_update(vfe->camss, vfe->id, port_id, true);
+}
+
+static const struct camss_video_ops vfe_video_ops_780 = {
+	.queue_buffer = vfe_queue_buffer_v2,
+	.flush_buffers = vfe_flush_buffers,
+};
+
+static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
+{
+	vfe->video_ops = vfe_video_ops_780;
+}
+
+static void vfe_global_reset(struct vfe_device *vfe)
+{
+	vfe_isr_reset_ack(vfe);
+}
+
+static irqreturn_t vfe_isr(int irq, void *dev)
+{
+	/* nop */
+	return IRQ_HANDLED;
+}
+
+static int vfe_halt(struct vfe_device *vfe)
+{
+	/* rely on vfe_disable_output() to stop the VFE */
+	return 0;
+}
+
+const struct vfe_hw_ops vfe_ops_780 = {
+	.global_reset = vfe_global_reset,
+	.hw_version = vfe_hw_version,
+	.isr = vfe_isr,
+	.pm_domain_off = vfe_pm_domain_off,
+	.pm_domain_on = vfe_pm_domain_on,
+	.reg_update = vfe_reg_update,
+	.reg_update_clear = vfe_reg_update_clear,
+	.subdev_init = vfe_subdev_init,
+	.vfe_disable = vfe_disable,
+	.vfe_enable = vfe_enable_v2,
+	.vfe_halt = vfe_halt,
+	.vfe_wm_start = vfe_wm_start,
+	.vfe_wm_stop = vfe_wm_stop,
+	.vfe_buf_done = vfe_buf_done,
+	.vfe_wm_update = vfe_wm_update,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2a037860b09f..9ffa6bc72cf1 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -345,6 +345,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8250:
 	case CAMSS_8280XP:
 	case CAMSS_845:
+	case CAMSS_8550:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
 		{
@@ -1970,6 +1971,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	case CAMSS_8250:
 	case CAMSS_8280XP:
 	case CAMSS_845:
+	case CAMSS_8550:
 		ret = 16;
 		break;
 	default:
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index fcbf4f609129..9dec5bc0d1b1 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -243,6 +243,7 @@ extern const struct vfe_hw_ops vfe_ops_4_7;
 extern const struct vfe_hw_ops vfe_ops_4_8;
 extern const struct vfe_hw_ops vfe_ops_170;
 extern const struct vfe_hw_ops vfe_ops_480;
+extern const struct vfe_hw_ops vfe_ops_780;
 
 int vfe_get(struct vfe_device *vfe);
 void vfe_put(struct vfe_device *vfe);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index e9519fb99f06..f4fbf0d73dd1 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2127,6 +2127,125 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 	}
 };
 
+static const struct camss_subdev_resources vfe_res_8550[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", "vfe0_fast_ahb",
+			   "vfe0", "cpas_vfe0", "camnoc_axi" },
+		.clock_rate = { { 0 },
+				{ 80000000 },
+				{ 300000000, 400000000 },
+				{ 300000000, 400000000 },
+				{ 466000000, 594000000, 675000000, 785000000 },
+				{ 300000000, 400000000 },
+				{ 300000000, 400000000 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_780,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", "vfe1_fast_ahb",
+			   "vfe1", "cpas_vfe1", "camnoc_axi" },
+		.clock_rate = {	{ 0 },
+				{ 80000000 },
+				{ 300000000, 400000000 },
+				{ 300000000, 400000000 },
+				{ 466000000, 594000000, 675000000, 785000000 },
+				{ 300000000, 400000000 },
+				{ 300000000, 400000000 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_780,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", "vfe2_fast_ahb",
+			   "vfe2", "cpas_vfe2", "camnoc_axi" },
+		.clock_rate = {	{ 0 },
+				{ 80000000 },
+				{ 300000000, 400000000 },
+				{ 300000000, 400000000 },
+				{ 466000000, 594000000, 675000000, 785000000 },
+				{ 300000000, 400000000 },
+				{ 300000000, 400000000 } },
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.has_pd = true,
+			.pd_name = "ife2",
+			.hw_ops = &vfe_ops_780,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE3 lite */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", "vfe_lite_ahb",
+			   "vfe_lite", "cpas_ife_lite", "camnoc_axi" },
+		.clock_rate = {	{ 0 },
+				{ 80000000 },
+				{ 300000000, 400000000 },
+				{ 300000000, 400000000 },
+				{ 400000000, 480000000 },
+				{ 300000000, 400000000 },
+				{ 300000000, 400000000 } },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_780,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE4 lite */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", "vfe_lite_ahb",
+			   "vfe_lite", "cpas_ife_lite", "camnoc_axi" },
+		.clock_rate = {	{ 0 },
+				{ 80000000 },
+				{ 300000000, 400000000 },
+				{ 300000000, 400000000 },
+				{ 400000000, 480000000 },
+				{ 300000000, 400000000 },
+				{ 300000000, 400000000 } },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_780,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
 static const struct resources_icc icc_res_sm8550[] = {
 	{
 		.name = "ahb",
@@ -3181,11 +3300,13 @@ static const struct camss_resources sm8550_resources = {
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8550,
 	.csid_res = csid_res_8550,
+	.vfe_res = vfe_res_8550,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.icc_res = icc_res_sm8550,
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8550),
 	.csid_num = ARRAY_SIZE(csid_res_8550),
+	.vfe_num = ARRAY_SIZE(vfe_res_8550),
 	.link_entities = camss_link_entities
 };
 
-- 
2.34.1


