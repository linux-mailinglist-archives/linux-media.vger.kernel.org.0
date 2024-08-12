Return-Path: <linux-media+bounces-16151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDA094F00A
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 16:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B47491C2201D
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 14:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761C218A6B0;
	Mon, 12 Aug 2024 14:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hvEzgTKP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DD118952D;
	Mon, 12 Aug 2024 14:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723473748; cv=none; b=V4Dqhk/NZ9njvic3oBmF+6i9ovmeM2771+aJxB9+YXfPHJFAJlzMX8kcG6yozZN26LIHUnt4wSXBGn5xkq4RXqaGMmQYI6ngGnfKeiPxXtfEfGqMbTNUPLW/LBlcoRglqiCXlj+vkTjS/KCA8BOjR3HAmV0InXc/7xwPKypMH+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723473748; c=relaxed/simple;
	bh=1OzSDFID/VwPp6a+ibm46MYgXB+G/m4sXVr3iXciXm0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ECU0rB+/pHYTWemnO7sxuCw5dZlvPLRirtNFcVkerYwvlpObN5uuyclVg54z4C9blrnGfyOgECADBUhVL7Yxueci8/urJGJfV0kb4itCoZLvO19nakBqrbZBXxVIREAyLwsH7vTHTTCJh9nUfc1xukFU4D6yHk3AnCNRbyZyg44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hvEzgTKP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47CDSZiJ017492;
	Mon, 12 Aug 2024 14:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5m+IFT6rHcUnNdCSmvvFPoAmP/bNavc3gq6/OV8Rtsc=; b=hvEzgTKPHhh2itZ9
	1C6Ws/EReXnCyteiVmQiAV6dS62DOD6vd0e5b0Ms9BvvFTLlNXzqJ+nd29nPUvlg
	dWWmJ3zZnkAr1JKpUcoK7Q29fXrrJuKj/0qoTebXQTIizPX+vgenF3gmtCMgpFNX
	N1jdacV0Hh6fBWgVM2bpahvznQC1g2zLh2ZdQsqGUnc84H6KWgJoYfDjNH5oXQRN
	UORdNQ97lCDLHyeIKQmGNC1NfAeR3Y4StJw9CS8zHaC++IWK5yjLc5hRANquetea
	C+fnywdEavyfVuZFGXRmVyadpCEKaUWCzSQQS6zDg9tFxA6hwUpdq8SBwilJekUC
	swggHA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x1d4cf61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 14:42:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47CEgJfX031826
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 14:42:19 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 12 Aug 2024 07:42:13 -0700
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <quic_depengs@quicinc.com>
Subject: [PATCH 09/13] media: qcom: camss: vfe: Move common code into vfe core
Date: Mon, 12 Aug 2024 20:11:27 +0530
Message-ID: <20240812144131.369378-10-quic_depengs@quicinc.com>
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
X-Proofpoint-ORIG-GUID: eaEmA8MeetmKyJj9UTjz3EngFi3UtbtX
X-Proofpoint-GUID: eaEmA8MeetmKyJj9UTjz3EngFi3UtbtX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_04,2024-08-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120109

Some v4l2 buffer related logic functions can be moved to vfe core as
common code, then the vfe driver of different hw version can reuse them,
this also can avoid adding duplicate code for new version supporting.

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
---
 .../media/platform/qcom/camss/camss-vfe-17x.c | 112 +-------
 .../media/platform/qcom/camss/camss-vfe-4-1.c |   9 -
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  11 -
 .../media/platform/qcom/camss/camss-vfe-4-8.c |  11 -
 .../media/platform/qcom/camss/camss-vfe-480.c | 258 +----------------
 drivers/media/platform/qcom/camss/camss-vfe.c | 264 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.h |  58 +++-
 7 files changed, 340 insertions(+), 383 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index 380c99321030..e5ee7e717b3b 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -14,8 +14,6 @@
 #include "camss.h"
 #include "camss-vfe.h"
 
-#define VFE_HW_VERSION				(0x000)
-
 #define VFE_GLOBAL_RESET_CMD			(0x018)
 #define		GLOBAL_RESET_CMD_CORE		BIT(0)
 #define		GLOBAL_RESET_CMD_CAMIF		BIT(1)
@@ -176,20 +174,6 @@
 #define VFE_BUS_WM_FRAME_INC(n)			(0x2258 + (n) * 0x100)
 #define VFE_BUS_WM_BURST_LIMIT(n)		(0x225c + (n) * 0x100)
 
-static u32 vfe_hw_version(struct vfe_device *vfe)
-{
-	u32 hw_version = readl_relaxed(vfe->base + VFE_HW_VERSION);
-
-	u32 gen = (hw_version >> 28) & 0xF;
-	u32 rev = (hw_version >> 16) & 0xFFF;
-	u32 step = hw_version & 0xFFFF;
-
-	dev_dbg(vfe->camss->dev, "VFE HW Version = %u.%u.%u\n",
-		gen, rev, step);
-
-	return hw_version;
-}
-
 static inline void vfe_reg_set(struct vfe_device *vfe, u32 reg, u32 set_bits)
 {
 	u32 bits = readl_relaxed(vfe->base + reg);
@@ -438,62 +422,6 @@ static int vfe_get_output(struct vfe_line *line)
 	return -EINVAL;
 }
 
-static int vfe_enable_output(struct vfe_line *line)
-{
-	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output = &line->output;
-	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
-	struct media_entity *sensor;
-	unsigned long flags;
-	unsigned int frame_skip = 0;
-	unsigned int i;
-
-	sensor = camss_find_sensor(&line->subdev.entity);
-	if (sensor) {
-		struct v4l2_subdev *subdev = media_entity_to_v4l2_subdev(sensor);
-
-		v4l2_subdev_call(subdev, sensor, g_skip_frames, &frame_skip);
-		/* Max frame skip is 29 frames */
-		if (frame_skip > VFE_FRAME_DROP_VAL - 1)
-			frame_skip = VFE_FRAME_DROP_VAL - 1;
-	}
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-
-	ops->reg_update_clear(vfe, line->id);
-
-	if (output->state > VFE_OUTPUT_RESERVED) {
-		dev_err(vfe->camss->dev, "Output is not in reserved state %d\n",
-			output->state);
-		spin_unlock_irqrestore(&vfe->output_lock, flags);
-		return -EINVAL;
-	}
-
-	WARN_ON(output->gen2.active_num);
-
-	output->state = VFE_OUTPUT_ON;
-
-	output->sequence = 0;
-	output->wait_reg_update = 0;
-	reinit_completion(&output->reg_update);
-
-	vfe_wm_start(vfe, output->wm_idx[0], line);
-
-	for (i = 0; i < 2; i++) {
-		output->buf[i] = vfe_buf_get_pending(output);
-		if (!output->buf[i])
-			break;
-		output->gen2.active_num++;
-		vfe_wm_update(vfe, output->wm_idx[0], output->buf[i]->addr[0], line);
-	}
-
-	ops->reg_update(vfe, line->id);
-
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	return 0;
-}
-
 /*
  * vfe_enable - Enable streaming on VFE line
  * @line: VFE line
@@ -518,7 +446,7 @@ static int vfe_enable(struct vfe_line *line)
 	if (ret < 0)
 		goto error_get_output;
 
-	ret = vfe_enable_output(line);
+	ret = vfe_enable_output_v2(line);
 	if (ret < 0)
 		goto error_enable_output;
 
@@ -627,40 +555,6 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 }
 
-/*
- * vfe_queue_buffer - Add empty buffer
- * @vid: Video device structure
- * @buf: Buffer to be enqueued
- *
- * Add an empty buffer - depending on the current number of buffers it will be
- * put in pending buffer queue or directly given to the hardware to be filled.
- *
- * Return 0 on success or a negative error code otherwise
- */
-static int vfe_queue_buffer(struct camss_video *vid,
-			    struct camss_buffer *buf)
-{
-	struct vfe_line *line = container_of(vid, struct vfe_line, video_out);
-	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output;
-	unsigned long flags;
-
-	output = &line->output;
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-
-	if (output->state == VFE_OUTPUT_ON && output->gen2.active_num < 2) {
-		output->buf[output->gen2.active_num++] = buf;
-		vfe_wm_update(vfe, output->wm_idx[0], buf->addr[0], line);
-	} else {
-		vfe_buf_add_pending(output, buf);
-	}
-
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	return 0;
-}
-
 static const struct vfe_isr_ops vfe_isr_ops_170 = {
 	.reset_ack = vfe_isr_reset_ack,
 	.halt_ack = vfe_isr_halt_ack,
@@ -671,7 +565,7 @@ static const struct vfe_isr_ops vfe_isr_ops_170 = {
 };
 
 static const struct camss_video_ops vfe_video_ops_170 = {
-	.queue_buffer = vfe_queue_buffer,
+	.queue_buffer = vfe_queue_buffer_v2,
 	.flush_buffers = vfe_flush_buffers,
 };
 
@@ -695,5 +589,7 @@ const struct vfe_hw_ops vfe_ops_170 = {
 	.vfe_enable = vfe_enable,
 	.vfe_halt = vfe_halt,
 	.violation_read = vfe_violation_read,
+	.vfe_wm_start = vfe_wm_start,
 	.vfe_wm_stop = vfe_wm_stop,
+	.vfe_wm_update = vfe_wm_update,
 };
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 1bd3a6ef1d04..6930799f77c2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -210,15 +210,6 @@
 #define MSM_VFE_VFE0_UB_SIZE 1023
 #define MSM_VFE_VFE0_UB_SIZE_RDI (MSM_VFE_VFE0_UB_SIZE / 3)
 
-static u32 vfe_hw_version(struct vfe_device *vfe)
-{
-	u32 hw_version = readl_relaxed(vfe->base + VFE_0_HW_VERSION);
-
-	dev_dbg(vfe->camss->dev, "VFE HW Version = 0x%08x\n", hw_version);
-
-	return hw_version;
-}
-
 static u16 vfe_get_ub_size(u8 vfe_id)
 {
 	if (vfe_id == 0)
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index ce0719106bd3..76729607db02 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -18,8 +18,6 @@
 #include "camss-vfe-gen1.h"
 
 
-#define VFE_0_HW_VERSION		0x000
-
 #define VFE_0_GLOBAL_RESET_CMD		0x018
 #define VFE_0_GLOBAL_RESET_CMD_CORE	BIT(0)
 #define VFE_0_GLOBAL_RESET_CMD_CAMIF	BIT(1)
@@ -254,15 +252,6 @@
 #define MSM_VFE_VFE1_UB_SIZE 1535
 #define MSM_VFE_VFE1_UB_SIZE_RDI (MSM_VFE_VFE1_UB_SIZE / 3)
 
-static u32 vfe_hw_version(struct vfe_device *vfe)
-{
-	u32 hw_version = readl_relaxed(vfe->base + VFE_0_HW_VERSION);
-
-	dev_dbg(vfe->camss->dev, "VFE HW Version = 0x%08x\n", hw_version);
-
-	return hw_version;
-}
-
 static u16 vfe_get_ub_size(u8 vfe_id)
 {
 	if (vfe_id == 0)
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
index 6b59c8107a3c..b2f7d855d8dd 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
@@ -17,8 +17,6 @@
 #include "camss-vfe.h"
 #include "camss-vfe-gen1.h"
 
-#define VFE_0_HW_VERSION		0x000
-
 #define VFE_0_GLOBAL_RESET_CMD		0x018
 #define VFE_0_GLOBAL_RESET_CMD_CORE	BIT(0)
 #define VFE_0_GLOBAL_RESET_CMD_CAMIF	BIT(1)
@@ -247,15 +245,6 @@
 #define MSM_VFE_VFE1_UB_SIZE 1535
 #define MSM_VFE_VFE1_UB_SIZE_RDI (MSM_VFE_VFE1_UB_SIZE / 3)
 
-static u32 vfe_hw_version(struct vfe_device *vfe)
-{
-	u32 hw_version = readl_relaxed(vfe->base + VFE_0_HW_VERSION);
-
-	dev_dbg(vfe->camss->dev, "VFE HW Version = 0x%08x\n", hw_version);
-
-	return hw_version;
-}
-
 static inline void vfe_reg_clr(struct vfe_device *vfe, u32 reg, u32 clr_bits)
 {
 	u32 bits = readl_relaxed(vfe->base + reg);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index dc2735476c82..e6d3b27de323 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -15,8 +15,6 @@
 #include "camss.h"
 #include "camss-vfe.h"
 
-#define VFE_HW_VERSION			(0x00)
-
 #define VFE_GLOBAL_RESET_CMD		(vfe_is_lite(vfe) ? 0x0c : 0x1c)
 #define	    GLOBAL_RESET_HW_AND_REG	(vfe_is_lite(vfe) ? BIT(1) : BIT(0))
 
@@ -92,19 +90,6 @@ static inline int bus_irq_mask_0_comp_done(struct vfe_device *vfe, int n)
 
 #define MAX_VFE_OUTPUT_LINES	4
 
-static u32 vfe_hw_version(struct vfe_device *vfe)
-{
-	u32 hw_version = readl_relaxed(vfe->base + VFE_HW_VERSION);
-
-	u32 gen = (hw_version >> 28) & 0xF;
-	u32 rev = (hw_version >> 16) & 0xFFF;
-	u32 step = hw_version & 0xFFFF;
-
-	dev_dbg(vfe->camss->dev, "VFE HW Version = %u.%u.%u\n", gen, rev, step);
-
-	return hw_version;
-}
-
 static void vfe_global_reset(struct vfe_device *vfe)
 {
 	writel_relaxed(IRQ_MASK_0_RESET_ACK, vfe->base + VFE_IRQ_MASK(0));
@@ -167,18 +152,16 @@ static inline void vfe_reg_update_clear(struct vfe_device *vfe,
 	vfe->reg_update &= ~REG_UPDATE_RDI(vfe, line_id);
 }
 
-static void vfe_enable_irq_common(struct vfe_device *vfe)
-{
-	/* enable reset ack IRQ and top BUS status IRQ */
-	writel_relaxed(IRQ_MASK_0_RESET_ACK | IRQ_MASK_0_BUS_TOP_IRQ,
-		       vfe->base + VFE_IRQ_MASK(0));
-}
-
-static void vfe_enable_lines_irq(struct vfe_device *vfe)
+static void vfe_enable_irq(struct vfe_device *vfe)
 {
 	int i;
 	u32 bus_irq_mask = 0;
 
+	if (!vfe->stream_count)
+		/* enable reset ack IRQ and top BUS status IRQ */
+		writel(IRQ_MASK_0_RESET_ACK | IRQ_MASK_0_BUS_TOP_IRQ,
+		       vfe->base + VFE_IRQ_MASK(0));
+
 	for (i = 0; i < MAX_VFE_OUTPUT_LINES; i++) {
 		/* Enable IRQ for newly added lines, but also keep already running lines's IRQ */
 		if (vfe->line[i].output.state == VFE_OUTPUT_RESERVED ||
@@ -188,11 +171,10 @@ static void vfe_enable_lines_irq(struct vfe_device *vfe)
 			}
 	}
 
-	writel_relaxed(bus_irq_mask, vfe->base + VFE_BUS_IRQ_MASK(0));
+	writel(bus_irq_mask, vfe->base + VFE_BUS_IRQ_MASK(0));
 }
 
 static void vfe_isr_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id);
-static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm);
 
 /*
  * vfe_isr - VFE module interrupt handler
@@ -226,7 +208,7 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 				vfe_isr_reg_update(vfe, i);
 
 			if (status & BUS_IRQ_MASK_0_COMP_DONE(vfe, RDI_COMP_GROUP(i)))
-				vfe_isr_wm_done(vfe, i);
+				vfe_buf_done(vfe, i);
 		}
 	}
 
@@ -245,132 +227,6 @@ static int vfe_halt(struct vfe_device *vfe)
 	return 0;
 }
 
-static int vfe_get_output(struct vfe_line *line)
-{
-	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output;
-	unsigned long flags;
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-
-	output = &line->output;
-	if (output->state > VFE_OUTPUT_RESERVED) {
-		dev_err(vfe->camss->dev, "Output is running\n");
-		goto error;
-	}
-
-	output->wm_num = 1;
-
-	/* Correspondence between VFE line number and WM number.
-	 * line 0 -> RDI 0, line 1 -> RDI1, line 2 -> RDI2, line 3 -> PIX/RDI3
-	 * Note this 1:1 mapping will not work for PIX streams.
-	 */
-	output->wm_idx[0] = line->id;
-	vfe->wm_output_map[line->id] = line->id;
-
-	output->drop_update_idx = 0;
-
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	return 0;
-
-error:
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-	output->state = VFE_OUTPUT_OFF;
-
-	return -EINVAL;
-}
-
-static int vfe_enable_output(struct vfe_line *line)
-{
-	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output = &line->output;
-	unsigned long flags;
-	unsigned int i;
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-
-	vfe_reg_update_clear(vfe, line->id);
-
-	if (output->state > VFE_OUTPUT_RESERVED) {
-		dev_err(vfe->camss->dev, "Output is not in reserved state %d\n",
-			output->state);
-		spin_unlock_irqrestore(&vfe->output_lock, flags);
-		return -EINVAL;
-	}
-
-	WARN_ON(output->gen2.active_num);
-
-	output->state = VFE_OUTPUT_ON;
-
-	output->sequence = 0;
-	output->wait_reg_update = 0;
-	reinit_completion(&output->reg_update);
-
-	vfe_wm_start(vfe, output->wm_idx[0], line);
-
-	for (i = 0; i < 2; i++) {
-		output->buf[i] = vfe_buf_get_pending(output);
-		if (!output->buf[i])
-			break;
-		output->gen2.active_num++;
-		vfe_wm_update(vfe, output->wm_idx[0], output->buf[i]->addr[0], line);
-	}
-
-	vfe_reg_update(vfe, line->id);
-
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	return 0;
-}
-
-/*
- * vfe_enable - Enable streaming on VFE line
- * @line: VFE line
- *
- * Return 0 on success or a negative error code otherwise
- */
-static int vfe_enable(struct vfe_line *line)
-{
-	struct vfe_device *vfe = to_vfe(line);
-	int ret;
-
-	mutex_lock(&vfe->stream_lock);
-
-	if (!vfe->stream_count)
-		vfe_enable_irq_common(vfe);
-
-	vfe->stream_count++;
-
-	vfe_enable_lines_irq(vfe);
-
-	mutex_unlock(&vfe->stream_lock);
-
-	ret = vfe_get_output(line);
-	if (ret < 0)
-		goto error_get_output;
-
-	ret = vfe_enable_output(line);
-	if (ret < 0)
-		goto error_enable_output;
-
-	vfe->was_streaming = 1;
-
-	return 0;
-
-error_enable_output:
-	vfe_put_output(line);
-
-error_get_output:
-	mutex_lock(&vfe->stream_lock);
-
-	vfe->stream_count--;
-
-	mutex_unlock(&vfe->stream_lock);
-
-	return ret;
-}
-
 /*
  * vfe_isr_reg_update - Process reg update interrupt
  * @vfe: VFE Device
@@ -394,97 +250,8 @@ static void vfe_isr_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 }
 
-/*
- * vfe_isr_wm_done - Process write master done interrupt
- * @vfe: VFE Device
- * @wm: Write master id
- */
-static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
-{
-	struct vfe_line *line = &vfe->line[vfe->wm_output_map[wm]];
-	struct camss_buffer *ready_buf;
-	struct vfe_output *output;
-	unsigned long flags;
-	u32 index;
-	u64 ts = ktime_get_ns();
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-
-	if (vfe->wm_output_map[wm] == VFE_LINE_NONE) {
-		dev_err_ratelimited(vfe->camss->dev,
-				    "Received wm done for unmapped index\n");
-		goto out_unlock;
-	}
-	output = &vfe->line[vfe->wm_output_map[wm]].output;
-
-	ready_buf = output->buf[0];
-	if (!ready_buf) {
-		dev_err_ratelimited(vfe->camss->dev,
-				    "Missing ready buf %d!\n", output->state);
-		goto out_unlock;
-	}
-
-	ready_buf->vb.vb2_buf.timestamp = ts;
-	ready_buf->vb.sequence = output->sequence++;
-
-	index = 0;
-	output->buf[0] = output->buf[1];
-	if (output->buf[0])
-		index = 1;
-
-	output->buf[index] = vfe_buf_get_pending(output);
-
-	if (output->buf[index])
-		vfe_wm_update(vfe, output->wm_idx[0], output->buf[index]->addr[0], line);
-	else
-		output->gen2.active_num--;
-
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	vb2_buffer_done(&ready_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
-
-	return;
-
-out_unlock:
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-}
-
-/*
- * vfe_queue_buffer - Add empty buffer
- * @vid: Video device structure
- * @buf: Buffer to be enqueued
- *
- * Add an empty buffer - depending on the current number of buffers it will be
- * put in pending buffer queue or directly given to the hardware to be filled.
- *
- * Return 0 on success or a negative error code otherwise
- */
-static int vfe_queue_buffer(struct camss_video *vid,
-			    struct camss_buffer *buf)
-{
-	struct vfe_line *line = container_of(vid, struct vfe_line, video_out);
-	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output;
-	unsigned long flags;
-
-	output = &line->output;
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-
-	if (output->state == VFE_OUTPUT_ON && output->gen2.active_num < 2) {
-		output->buf[output->gen2.active_num++] = buf;
-		vfe_wm_update(vfe, output->wm_idx[0], buf->addr[0], line);
-	} else {
-		vfe_buf_add_pending(output, buf);
-	}
-
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	return 0;
-}
-
 static const struct camss_video_ops vfe_video_ops_480 = {
-	.queue_buffer = vfe_queue_buffer,
+	.queue_buffer = vfe_queue_buffer_v2,
 	.flush_buffers = vfe_flush_buffers,
 };
 
@@ -494,6 +261,7 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 }
 
 const struct vfe_hw_ops vfe_ops_480 = {
+	.enable_irq = vfe_enable_irq,
 	.global_reset = vfe_global_reset,
 	.hw_version = vfe_hw_version,
 	.isr = vfe_isr,
@@ -501,7 +269,11 @@ const struct vfe_hw_ops vfe_ops_480 = {
 	.pm_domain_on = vfe_pm_domain_on,
 	.subdev_init = vfe_subdev_init,
 	.vfe_disable = vfe_disable,
-	.vfe_enable = vfe_enable,
+	.vfe_enable = vfe_enable_v2,
 	.vfe_halt = vfe_halt,
+	.vfe_wm_start = vfe_wm_start,
 	.vfe_wm_stop = vfe_wm_stop,
+	.vfe_wm_update = vfe_wm_update,
+	.reg_update = vfe_reg_update,
+	.reg_update_clear = vfe_reg_update_clear,
 };
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 83c5a36d071f..f6650694f47e 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -32,6 +32,11 @@
 
 #define SCALER_RATIO_MAX 16
 
+#define VFE_HW_VERSION		0x0
+#define		HW_VERSION_STEPPING	0
+#define		HW_VERSION_REVISION	16
+#define		HW_VERSION_GENERATION	28
+
 static const struct camss_format_info formats_rdi_8x16[] = {
 	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_UYVY, 1,
 	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
@@ -402,6 +407,265 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	return 0;
 }
 
+/*
+ * vfe_hw_version - Process write master done interrupt
+ * @vfe: VFE Device
+ *
+ * Return vfe hw version
+ */
+u32 vfe_hw_version(struct vfe_device *vfe)
+{
+	u32 hw_version = readl_relaxed(vfe->base + VFE_HW_VERSION);
+
+	u32 gen = (hw_version >> HW_VERSION_GENERATION) & 0xF;
+	u32 rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
+	u32 step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
+
+	dev_info(vfe->camss->dev, "VFE:%d HW Version = %u.%u.%u\n",
+		 vfe->id, gen, rev, step);
+
+	return hw_version;
+}
+
+/*
+ * vfe_buf_done - Process write master done interrupt
+ * @vfe: VFE Device
+ * @wm: Write master id
+ */
+void vfe_buf_done(struct vfe_device *vfe, int wm)
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
+				    "Received wm done for unmapped index\n");
+		goto out_unlock;
+	}
+	output = &vfe->line[vfe->wm_output_map[wm]].output;
+
+	ready_buf = output->buf[0];
+	if (!ready_buf) {
+		dev_err_ratelimited(vfe->camss->dev,
+				    "Missing ready buf %d!\n", output->state);
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
+		vfe->res->hw_ops->vfe_wm_update(vfe, output->wm_idx[0],
+						output->buf[index]->addr[0],
+						line);
+		vfe->res->hw_ops->reg_update(vfe, line->id);
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
+int vfe_enable_output_v2(struct vfe_line *line)
+{
+	struct vfe_device *vfe = to_vfe(line);
+	struct vfe_output *output = &line->output;
+	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
+	struct media_entity *sensor;
+	unsigned long flags;
+	unsigned int frame_skip = 0;
+	unsigned int i;
+
+	sensor = camss_find_sensor(&line->subdev.entity);
+	if (sensor) {
+		struct v4l2_subdev *subdev = media_entity_to_v4l2_subdev(sensor);
+
+		v4l2_subdev_call(subdev, sensor, g_skip_frames, &frame_skip);
+		/* Max frame skip is 29 frames */
+		if (frame_skip > VFE_FRAME_DROP_VAL - 1)
+			frame_skip = VFE_FRAME_DROP_VAL - 1;
+	}
+
+	spin_lock_irqsave(&vfe->output_lock, flags);
+
+	ops->reg_update_clear(vfe, line->id);
+
+	if (output->state > VFE_OUTPUT_RESERVED) {
+		dev_err(vfe->camss->dev,
+			"Output is not in reserved state %d\n",
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
+	output->wait_reg_update = 0;
+	reinit_completion(&output->reg_update);
+
+	ops->vfe_wm_start(vfe, output->wm_idx[0], line);
+
+	for (i = 0; i < 2; i++) {
+		output->buf[i] = vfe_buf_get_pending(output);
+		if (!output->buf[i])
+			break;
+		output->gen2.active_num++;
+		ops->vfe_wm_update(vfe, output->wm_idx[0],
+				   output->buf[i]->addr[0], line);
+		ops->reg_update(vfe, line->id);
+	}
+
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+	return 0;
+}
+
+/*
+ * vfe_queue_buffer_v2 - Add empty buffer
+ * @vid: Video device structure
+ * @buf: Buffer to be enqueued
+ *
+ * Add an empty buffer - depending on the current number of buffers it will be
+ * put in pending buffer queue or directly given to the hardware to be filled.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+int vfe_queue_buffer_v2(struct camss_video *vid,
+			struct camss_buffer *buf)
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
+		output->gen2.active_num < 2) {
+		output->buf[output->gen2.active_num++] = buf;
+		vfe->res->hw_ops->vfe_wm_update(vfe, output->wm_idx[0],
+						buf->addr[0], line);
+		vfe->res->hw_ops->reg_update(vfe, line->id);
+	} else {
+		vfe_buf_add_pending(output, buf);
+	}
+
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+	return 0;
+}
+
+/*
+ * vfe_enable_v2 - Enable streaming on VFE line
+ * @line: VFE line
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+int vfe_enable_v2(struct vfe_line *line)
+{
+	struct vfe_device *vfe = to_vfe(line);
+	int ret;
+
+	mutex_lock(&vfe->stream_lock);
+
+	if (vfe->res->hw_ops->enable_irq)
+		vfe->res->hw_ops->enable_irq(vfe);
+
+	vfe->stream_count++;
+
+	mutex_unlock(&vfe->stream_lock);
+
+	ret = vfe_get_output_v2(line);
+	if (ret < 0)
+		goto error_get_output;
+
+	ret = vfe_enable_output_v2(line);
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
+ * vfe_get_output_v2 - Get vfe output port for corresponding VFE line
+ * @line: VFE line
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+int vfe_get_output_v2(struct vfe_line *line)
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
 int vfe_reset(struct vfe_device *vfe)
 {
 	unsigned long time;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 10e2cc3c0b83..fcbf4f609129 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -99,7 +99,7 @@ struct vfe_line {
 struct vfe_device;
 
 struct vfe_hw_ops {
-	void (*enable_irq_common)(struct vfe_device *vfe);
+	void (*enable_irq)(struct vfe_device *vfe);
 	void (*global_reset)(struct vfe_device *vfe);
 	u32 (*hw_version)(struct vfe_device *vfe);
 	irqreturn_t (*isr)(int irq, void *dev);
@@ -114,7 +114,12 @@ struct vfe_hw_ops {
 	int (*vfe_enable)(struct vfe_line *line);
 	int (*vfe_halt)(struct vfe_device *vfe);
 	void (*violation_read)(struct vfe_device *vfe);
+	void (*vfe_wm_start)(struct vfe_device *vfe, u8 wm,
+			     struct vfe_line *line);
 	void (*vfe_wm_stop)(struct vfe_device *vfe, u8 wm);
+	void (*vfe_buf_done)(struct vfe_device *vfe, int port_id);
+	void (*vfe_wm_update)(struct vfe_device *vfe, u8 wm, u32 addr,
+			      struct vfe_line *line);
 };
 
 struct vfe_isr_ops {
@@ -252,4 +257,55 @@ void vfe_put(struct vfe_device *vfe);
  */
 bool vfe_is_lite(struct vfe_device *vfe);
 
+/*
+ * vfe_hw_version - Process write master done interrupt
+ * @vfe: VFE Device
+ *
+ * Return vfe hw version
+ */
+u32 vfe_hw_version(struct vfe_device *vfe);
+/*
+ * vfe_enable - Enable streaming on VFE line
+ * @line: VFE line
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+int vfe_enable_v2(struct vfe_line *line);
+
+/*
+ * vfe_buf_done - Process write master done interrupt
+ * @vfe: VFE Device
+ * @wm: Write master id
+ */
+void vfe_buf_done(struct vfe_device *vfe, int wm);
+
+/*
+ * vfe_get_output_v2 - Get vfe output line
+ * line: VFE line
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+int vfe_get_output_v2(struct vfe_line *line);
+
+/*
+ * vfe_enable_output_v2 - Enable vfe output line
+ * line: VFE line
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+int vfe_enable_output_v2(struct vfe_line *line);
+
+/*
+ * vfe_queue_buffer_v2 - Add empty buffer
+ * @vid: Video device structure
+ * @buf: Buffer to be enqueued
+ *
+ * Add an empty buffer - depending on the current number of buffers it will be
+ * put in pending buffer queue or directly given to the hardware to be filled.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+int vfe_queue_buffer_v2(struct camss_video *vid,
+			struct camss_buffer *buf);
+
 #endif /* QC_MSM_CAMSS_VFE_H */
-- 
2.34.1


