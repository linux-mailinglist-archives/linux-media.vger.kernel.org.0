Return-Path: <linux-media+bounces-14787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAA492BF5B
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 18:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1FF11F23CA7
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 16:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C3B1AB8FB;
	Tue,  9 Jul 2024 16:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S9q8vR55"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7B719E7EC;
	Tue,  9 Jul 2024 16:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720541279; cv=none; b=OGNHVMQfo/1AsFa+QLlxpygZvDK5DNolDfpENV3J7xVInzPF2kTRF1M3rfnob0ZAkctFuh2wW0bO+GyckhVlzPOKwXgYJikPATIR7wP/fOC5GmhtFwihXfFxJ8v4jF8stx2pIx8gtSBsch9Ea2WuQ7LdFGLnxhqCVsszceaZGPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720541279; c=relaxed/simple;
	bh=XIRehF3KJ1SPSe4iPFD0VICWxKCkG8PGIa+M/gUeLXA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XRAFqqbuYc14qt5PNtyhGKlgPHtAEMOIQRcqI2lp7J5aHaTJzk9EjsVjquVDK0fbaTKrrVr8KzS2x/V5ThQJcpfFpa1c+WUAtp2LnFdRSNoM0D57gvwCxJquMEyDpCSTSPDs6/X9ljd97CQE/BKsSL5MjKO4xHUmxP1DdQ29qY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S9q8vR55; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469CbmON022205;
	Tue, 9 Jul 2024 16:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PlAUhvpXUew8Rq2+iaY8CCZ3
	v1jcwBj4W5eYaJQ0flg=; b=S9q8vR55WaJsBDNqJ/zteHQIyxy0kcwch1DJBLyl
	zBSk/1t/oDwRfqOB19c/LorodipZOyd7F2iem86DY5Rzm6mHjPm4F6CRwryPfjam
	2YXNCBflku4k74vqH0DSYpkRiEx0eimjdpvMwtGYMwG2VzKDTu400F0f+A0vrRd1
	y92z4UCM1VV8JajyIxUZrLLfMfz13AORmn9scHj1Y+AO2cAwdCcS9SdBI/APQ3ac
	a3MdyZr0Q8vyCzuz5CG+ZIqx4T/dCtpy4pZO3yoq+ESnoJaoKiye4vN3icox2pSD
	CyfN4/n/rTrLMP48uvEVKi6ELCKrpRjNGC3ilphPw/svbA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406y3hep3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 16:07:53 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469G7qbY012396
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 16:07:52 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 09:07:46 -0700
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
Subject: [PATCH 10/13] media: qcom: camss: Add support for VFE hardware version Titan 780
Date: Tue, 9 Jul 2024 21:36:53 +0530
Message-ID: <20240709160656.31146-11-quic_depengs@quicinc.com>
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
X-Proofpoint-ORIG-GUID: kXk3kgHbJM7FFOkZq8CQGQ7dh7C4cqXK
X-Proofpoint-GUID: kXk3kgHbJM7FFOkZq8CQGQ7dh7C4cqXK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_05,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090106

Add support for VFE found on SM8550 (Titan 780). This implementation is
based on the titan 480 implementation. It supports the normal and lite
VFE.

Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../media/platform/qcom/camss/camss-vfe-780.c | 404 ++++++++++++++++++
 2 files changed, 405 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-780.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index c336e4c1a399..a83b7a8dcef7 100644
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
index 000000000000..abef2d5b9c2e
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -0,0 +1,404 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-vfe-780.c
+ *
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
+#define VFE_HW_VERSION			(vfe_is_lite(vfe) ? 0x1000 : 0x0)
+
+#define VFE_IRQ_CMD			(vfe_is_lite(vfe) ? 0x1038 : 0x30)
+#define     IRQ_CMD_GLOBAL_CLEAR	BIT(0)
+
+#define VFE_IRQ_MASK(n)			((vfe_is_lite(vfe) ? 0x1024 : 0x34) + (n) * 4)
+#define	    IRQ_MASK_0_BUS_TOP_IRQ	(vfe_is_lite(vfe) ? BIT(0) | BIT(1) | BIT(2) : \
+						BIT(0) | BIT(4) | BIT(18))
+#define	    IRQ_MASK_1_BUS_TOP_IRQ(n)	(vfe_is_lite(vfe) ? BIT(2 * n + 2) | BIT(2 * n + 3) : \
+						BIT(2 * n + 8) | BIT(2 * n + 9))
+#define VFE_IRQ_CLEAR(n)		((vfe_is_lite(vfe) ? 0x102C : 0x3C) + (n) * 4)
+#define VFE_IRQ_STATUS(n)		((vfe_is_lite(vfe) ? 0x101C : 0x44) + (n) * 4)
+
+#define BUS_REG_BASE			(vfe_is_lite(vfe) ? 0x1200 : 0xC00)
+
+#define VFE_BUS_WM_CGC_OVERRIDE		(BUS_REG_BASE + 0x08)
+#define		WM_CGC_OVERRIDE_ALL	(0x7FFFFFF)
+
+#define VFE_BUS_WM_TEST_BUS_CTRL	(BUS_REG_BASE + 0xDC)
+
+#define VFE_BUS_WM_CFG(n)		(BUS_REG_BASE + 0x200 + (n) * 0x100)
+#define		WM_CFG_EN			(0)
+#define		WM_VIR_FRM_EN		(1)
+#define		WM_CFG_MODE			(16)
+#define			MODE_QCOM_PLAIN	(0)
+#define			MODE_MIPI_RAW	(1)
+#define VFE_BUS_WM_IMAGE_ADDR(n)	(BUS_REG_BASE + 0x204 + (n) * 0x100)
+#define VFE_BUS_WM_FRAME_INCR(n)	(BUS_REG_BASE + 0x208 + (n) * 0x100)
+#define VFE_BUS_WM_IMAGE_CFG_0(n)	(BUS_REG_BASE + 0x20c + (n) * 0x100)
+#define                WM_IMAGE_CFG_0_DEFAULT_WIDTH    (0xFFFF)
+#define VFE_BUS_WM_IMAGE_CFG_1(n)	(BUS_REG_BASE + 0x210 + (n) * 0x100)
+#define VFE_BUS_WM_IMAGE_CFG_2(n)	(BUS_REG_BASE + 0x214 + (n) * 0x100)
+#define                WM_IMAGE_CFG_2_DEFAULT_STRIDE    (0xFFFF)
+#define VFE_BUS_WM_PACKER_CFG(n)	(BUS_REG_BASE + 0x218 + (n) * 0x100)
+#define VFE_BUS_WM_HEADER_ADDR(n)	(BUS_REG_BASE + 0x220 + (n) * 0x100)
+#define VFE_BUS_WM_HEADER_INCR(n)	(BUS_REG_BASE + 0x224 + (n) * 0x100)
+#define VFE_BUS_WM_HEADER_CFG(n)	(BUS_REG_BASE + 0x228 + (n) * 0x100)
+
+#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)	(BUS_REG_BASE + 0x230 + (n) * 0x100)
+#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)	(BUS_REG_BASE + 0x234 + (n) * 0x100)
+#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)		(BUS_REG_BASE + 0x238 + (n) * 0x100)
+#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(BUS_REG_BASE + 0x23c + (n) * 0x100)
+
+#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)	(BUS_REG_BASE + 0x260 + (n) * 0x100)
+#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + 0x264 + (n) * 0x100)
+#define VFE_BUS_WM_SYSTEM_CACHE_CFG(n)	(BUS_REG_BASE + 0x268 + (n) * 0x100)
+
+/* for titan 780, each bus client is hardcoded to a specific path */
+#define RDI_WM(n)			((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
+
+#define MAX_VFE_OUTPUT_LINES	4
+#define MAX_VFE_ACT_BUF	1
+
+static u32 vfe_hw_version(struct vfe_device *vfe)
+{
+	u32 hw_version = readl_relaxed(vfe->base + VFE_HW_VERSION);
+
+	u32 gen = (hw_version >> 28) & 0xF;
+	u32 rev = (hw_version >> 16) & 0xFFF;
+	u32 step = hw_version & 0xFFFF;
+
+	dev_info(vfe->camss->dev, "VFE HW Version = %u.%u.%u\n", gen, rev, step);
+
+	return hw_version;
+}
+
+static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
+{
+	struct v4l2_pix_format_mplane *pix =
+		&line->video_out.active_fmt.fmt.pix_mp;
+
+	wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
+
+	/* no clock gating at bus input */
+	writel_relaxed(0, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
+
+	writel_relaxed(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
+
+	writel_relaxed(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
+		       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
+	writel_relaxed((WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF),
+		       vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
+	writel_relaxed(WM_IMAGE_CFG_2_DEFAULT_STRIDE,
+		       vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
+	writel_relaxed(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
+
+	/* no dropped frames, one irq per frame */
+	writel_relaxed(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
+	writel_relaxed(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
+	writel_relaxed(0, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(wm));
+	writel_relaxed(1, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(wm));
+
+	writel_relaxed(1, vfe->base + VFE_BUS_WM_MMU_PREFETCH_CFG(wm));
+	writel_relaxed(0xFFFFFFFF, vfe->base + VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(wm));
+
+	writel_relaxed(1 << WM_CFG_EN | MODE_MIPI_RAW << WM_CFG_MODE,
+		vfe->base + VFE_BUS_WM_CFG(wm));
+}
+
+static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
+{
+	wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
+	writel_relaxed(0, vfe->base + VFE_BUS_WM_CFG(wm));
+}
+
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u64 addr,
+			  struct vfe_line *line)
+{
+	wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
+	writel_relaxed((addr >> 8) & 0xFFFFFFFF, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
+
+	dev_dbg(vfe->camss->dev, "%s wm:%d, image buf addr:0x%llx\n",
+			__func__, wm, addr);
+}
+
+static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	/* TODO: Add register update support */
+}
+
+static inline void vfe_reg_update_clear(struct vfe_device *vfe,
+					enum vfe_line_id line_id)
+{
+	/* TODO: Add register update clear support */
+}
+
+/*
+ * vfe_isr - VFE module interrupt handler
+ * @irq: Interrupt line
+ * @dev: VFE device
+ *
+ * Return IRQ_HANDLED on success
+ */
+static irqreturn_t vfe_isr(int irq, void *dev)
+{
+	/* Buf Done has beem moved to CSID in Titan 780.
+	 * Disable VFE related IRQ.
+	 * Clear the contents of this function.
+	 * Return IRQ_HANDLED.
+	 */
+	return IRQ_HANDLED;
+}
+
+/*
+ * vfe_halt - Trigger halt on VFE module and wait to complete
+ * @vfe: VFE device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int vfe_halt(struct vfe_device *vfe)
+{
+	/* rely on vfe_disable_output() to stop the VFE */
+	return 0;
+}
+
+static int vfe_get_output(struct vfe_line *line)
+{
+	struct vfe_device *vfe = to_vfe(line);
+	struct vfe_output *output;
+	unsigned long flags;
+
+	spin_lock_irqsave(&vfe->output_lock, flags);
+
+	output = &line->output;
+	if (output->state > VFE_OUTPUT_RESERVED) {
+		dev_err(vfe->camss->dev, "Output is running\n");
+		goto error;
+	}
+
+	output->wm_num = 1;
+
+	/* Correspondence between VFE line number and WM number.
+	 * line 0 -> RDI 0, line 1 -> RDI1, line 2 -> RDI2, line 3 -> PIX/RDI3
+	 * Note this 1:1 mapping will not work for PIX streams.
+	 */
+	output->wm_idx[0] = line->id;
+	vfe->wm_output_map[line->id] = line->id;
+
+	output->drop_update_idx = 0;
+
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+	return 0;
+
+error:
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+	output->state = VFE_OUTPUT_OFF;
+
+	return -EINVAL;
+}
+
+static int vfe_enable_output(struct vfe_line *line)
+{
+	struct vfe_device *vfe = to_vfe(line);
+	struct vfe_output *output = &line->output;
+	unsigned long flags;
+	unsigned int i;
+
+	spin_lock_irqsave(&vfe->output_lock, flags);
+
+	vfe_reg_update_clear(vfe, line->id);
+
+	if (output->state > VFE_OUTPUT_RESERVED) {
+		dev_err(vfe->camss->dev, "Output is not in reserved state %d\n",
+			output->state);
+		spin_unlock_irqrestore(&vfe->output_lock, flags);
+		return -EINVAL;
+	}
+
+	WARN_ON(output->gen2.active_num);
+
+	output->state = VFE_OUTPUT_ON;
+
+	output->sequence = 0;
+
+	vfe_wm_start(vfe, output->wm_idx[0], line);
+
+	for (i = 0; i < MAX_VFE_ACT_BUF; i++) {
+		output->buf[i] = vfe_buf_get_pending(output);
+		if (!output->buf[i])
+			break;
+		output->gen2.active_num++;
+		vfe_wm_update(vfe, output->wm_idx[0], output->buf[i]->addr[0], line);
+
+		vfe_reg_update(vfe, line->id);
+	}
+
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+	return 0;
+}
+
+/*
+ * vfe_enable - Enable streaming on VFE line
+ * @line: VFE line
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int vfe_enable(struct vfe_line *line)
+{
+	struct vfe_device *vfe = to_vfe(line);
+	int ret;
+
+	mutex_lock(&vfe->stream_lock);
+
+	vfe->stream_count++;
+
+	mutex_unlock(&vfe->stream_lock);
+
+	ret = vfe_get_output(line);
+	if (ret < 0)
+		goto error_get_output;
+
+	ret = vfe_enable_output(line);
+	if (ret < 0)
+		goto error_enable_output;
+
+	vfe->was_streaming = 1;
+
+	return 0;
+
+error_enable_output:
+	vfe_put_output(line);
+
+error_get_output:
+	mutex_lock(&vfe->stream_lock);
+
+	vfe->stream_count--;
+
+	mutex_unlock(&vfe->stream_lock);
+
+	return ret;
+}
+
+/*
+ * vfe_buf_done - Process write master done interrupt
+ * @vfe: VFE Device
+ * @wm: Write master id
+ */
+static void vfe_buf_done(struct vfe_device *vfe, int wm)
+{
+	struct vfe_line *line = &vfe->line[vfe->wm_output_map[wm]];
+	struct camss_buffer *ready_buf;
+	struct vfe_output *output;
+	unsigned long flags;
+	u32 index;
+	u64 ts = ktime_get_ns();
+
+	spin_lock_irqsave(&vfe->output_lock, flags);
+
+	if (vfe->wm_output_map[wm] == VFE_LINE_NONE) {
+		dev_err_ratelimited(vfe->camss->dev,
+			"Received wm done for unmapped index\n");
+		goto out_unlock;
+	}
+	output = &vfe->line[vfe->wm_output_map[wm]].output;
+
+	ready_buf = output->buf[0];
+	if (!ready_buf) {
+		dev_err_ratelimited(vfe->camss->dev,
+			"Missing ready buf %d!\n", output->state);
+		goto out_unlock;
+	}
+
+	ready_buf->vb.vb2_buf.timestamp = ts;
+	ready_buf->vb.sequence = output->sequence++;
+
+	index = 0;
+	output->buf[0] = output->buf[1];
+	if (output->buf[0])
+		index = 1;
+
+	output->buf[index] = vfe_buf_get_pending(output);
+
+	if (output->buf[index]) {
+		vfe_wm_update(vfe, output->wm_idx[0], output->buf[index]->addr[0], line);
+		vfe_reg_update(vfe, line->id);
+	} else
+		output->gen2.active_num--;
+
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+	vb2_buffer_done(&ready_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+
+	return;
+
+out_unlock:
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+}
+
+/*
+ * vfe_queue_buffer - Add empty buffer
+ * @vid: Video device structure
+ * @buf: Buffer to be enqueued
+ *
+ * Add an empty buffer - depending on the current number of buffers it will be
+ * put in pending buffer queue or directly given to the hardware to be filled.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int vfe_queue_buffer(struct camss_video *vid,
+			    struct camss_buffer *buf)
+{
+	struct vfe_line *line = container_of(vid, struct vfe_line, video_out);
+	struct vfe_device *vfe = to_vfe(line);
+	struct vfe_output *output;
+	unsigned long flags;
+
+	output = &line->output;
+
+	spin_lock_irqsave(&vfe->output_lock, flags);
+
+	if (output->state == VFE_OUTPUT_ON &&
+		output->gen2.active_num < MAX_VFE_ACT_BUF) {
+		output->buf[output->gen2.active_num++] = buf;
+		vfe_wm_update(vfe, output->wm_idx[0], buf->addr[0], line);
+		vfe_reg_update(vfe, line->id);
+	} else {
+		vfe_buf_add_pending(output, buf);
+	}
+
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+	return 0;
+}
+
+static const struct camss_video_ops vfe_video_ops_780 = {
+	.queue_buffer = vfe_queue_buffer,
+	.flush_buffers = vfe_flush_buffers,
+};
+
+static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
+{
+	vfe->video_ops = vfe_video_ops_780;
+}
+
+const struct vfe_hw_ops vfe_ops_780 = {
+	.global_reset = NULL,
+	.hw_version = vfe_hw_version,
+	.isr = vfe_isr,
+	.pm_domain_off = vfe_pm_domain_off,
+	.pm_domain_on = vfe_pm_domain_on,
+	.subdev_init = vfe_subdev_init,
+	.vfe_disable = vfe_disable,
+	.vfe_enable = vfe_enable,
+	.vfe_halt = vfe_halt,
+	.vfe_wm_stop = vfe_wm_stop,
+};
-- 
2.34.1


