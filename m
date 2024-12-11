Return-Path: <linux-media+bounces-23212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AC99ECE56
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 15:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2732A16B1F9
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 14:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC3D0246343;
	Wed, 11 Dec 2024 14:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BmfQYnvs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84780246325;
	Wed, 11 Dec 2024 14:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733926190; cv=none; b=u4v1Q03DuoS4xAArqpaBepSvnocYiEDrG7VBOSN8O8Rc9kf0B1AN6l5HYOz7XIGGJdI4cxSqSgVIFlZFlgwSSJqBcjB2Ch0sgf8D6WBn1vvMcvgnkwMb9qbIWYxA/Eb2sPkqRhRtdrh6KNYQ2+P4Q2u5MavVw8KpfMHIJ9jJEuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733926190; c=relaxed/simple;
	bh=ClNhQ+m60Vl62CRVShhUbB8xDN2iLPte3EHhmj33pDI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X0mh2pKP/R4MffHonklAVvz/9idS5eG20lOOGWMkk+/ir6JUS43Xn4HTmfq1HH7RCvqOmKjqnxDyJLh6QVhdKsRmCyoAIJBjdH2296s8ZlIBPhTA6inINcWhal6dfXq7nZtgbeO/iImWr15EVjLXmRN5rPahlHd5uYk/uU4zfLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BmfQYnvs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB8BeHo006109;
	Wed, 11 Dec 2024 14:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yloky09RIw0iQXMHoWf65ydgiEDOQ0/zO3AyG18i0L0=; b=BmfQYnvsxEw2U1lQ
	gVL9gmAPABs2IyCkYIiAqlSBoSpi6GStFCVu8fAuqf0rHSk39avpqesSBwDVtooC
	ihWpf0c+eNxCN4+Mu7hXZbcGU3wpsf+7/oksXB53u7vCsvNuORIwa2yDrVqAgA9U
	XwjeBvTlQwDRiOgIcNRZy+Uo423uG2X+q+6iH7waeSlHzguJRMg3GZAYw1oDAlqm
	TVHrk8Zp4NxMpYzzVmWLRvmYrcZB1j6T3/pnjtFZHCxl76FhELzbt5ETzX2N4cg4
	8DmbcTCviRSbYvY6eeH4uIQafXNdi//CmxHuSZF9/3ugBVKIX/W9r5NYIMEQfBB/
	kNTZrQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f70w12f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 14:09:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BBE9hsJ019678
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 14:09:43 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Dec 2024 06:09:36 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
Subject: [PATCH 16/16] media: qcom: camss: Add support for VFE 780
Date: Wed, 11 Dec 2024 19:37:38 +0530
Message-ID: <20241211140738.3835588-17-quic_depengs@quicinc.com>
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
X-Proofpoint-GUID: 6iDjbql2Cif2KryPwqt4JSk9S5pTdbRy
X-Proofpoint-ORIG-GUID: 6iDjbql2Cif2KryPwqt4JSk9S5pTdbRy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110101

Add support for VFE found on SM8550 (Titan 780). This implementation is
based on the titan 480 implementation. It supports the normal and lite
VFE.

Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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
index 1c9b6569fbe5..c95b127a7e2e 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -344,6 +344,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_845:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
+	case CAMSS_8550:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
 		{
@@ -1964,6 +1965,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	case CAMSS_845:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
+	case CAMSS_8550:
 		ret = 16;
 		break;
 	default:
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 977710d6655e..2a2e2d82dd51 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -242,6 +242,7 @@ extern const struct vfe_hw_ops vfe_ops_4_7;
 extern const struct vfe_hw_ops vfe_ops_4_8;
 extern const struct vfe_hw_ops vfe_ops_170;
 extern const struct vfe_hw_ops vfe_ops_480;
+extern const struct vfe_hw_ops vfe_ops_780;
 
 int vfe_get(struct vfe_device *vfe);
 void vfe_put(struct vfe_device *vfe);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c0e336f3916b..e8cc96d3d0d2 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1823,6 +1823,125 @@ static const struct camss_subdev_resources csid_res_8550[] = {
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
@@ -2861,11 +2980,13 @@ static const struct camss_resources sm8550_resources = {
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


