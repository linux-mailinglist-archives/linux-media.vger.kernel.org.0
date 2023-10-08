Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A12FF7BCD48
	for <lists+linux-media@lfdr.de>; Sun,  8 Oct 2023 10:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344509AbjJHIwI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sun, 8 Oct 2023 04:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234296AbjJHIwG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 Oct 2023 04:52:06 -0400
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15A59CA;
        Sun,  8 Oct 2023 01:52:04 -0700 (PDT)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id 9A4AB24E296;
        Sun,  8 Oct 2023 16:52:02 +0800 (CST)
Received: from EXMBX073.cuchost.com (172.16.6.83) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sun, 8 Oct
 2023 16:52:00 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX073.cuchost.com
 (172.16.6.83) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sun, 8 Oct
 2023 16:52:00 +0800
From:   Jack Zhu <jack.zhu@starfivetech.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        <bryan.odonoghue@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-staging@lists.linux.dev>,
        <jack.zhu@starfivetech.com>, <changhuang.liang@starfivetech.com>
Subject: [PATCH v10 6/8] media: staging: media: starfive: camss: Add capture driver
Date:   Sun, 8 Oct 2023 16:51:52 +0800
Message-ID: <20231008085154.6757-7-jack.zhu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231008085154.6757-1-jack.zhu@starfivetech.com>
References: <20231008085154.6757-1-jack.zhu@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX073.cuchost.com
 (172.16.6.83)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add capture driver for StarFive Camera Subsystem. It contains two video
devices: capture_yuv and capture_raw.

Signed-off-by: Jack Zhu <jack.zhu@starfivetech.com>
---
 drivers/staging/media/starfive/camss/Makefile |   1 +
 .../staging/media/starfive/camss/stf-camss.h  |   2 +
 .../media/starfive/camss/stf-capture.c        | 603 ++++++++++++++++++
 .../media/starfive/camss/stf-capture.h        |  87 +++
 4 files changed, 693 insertions(+)
 create mode 100644 drivers/staging/media/starfive/camss/stf-capture.c
 create mode 100644 drivers/staging/media/starfive/camss/stf-capture.h

diff --git a/drivers/staging/media/starfive/camss/Makefile b/drivers/staging/media/starfive/camss/Makefile
index 97e1522b21ae..005790202e7b 100644
--- a/drivers/staging/media/starfive/camss/Makefile
+++ b/drivers/staging/media/starfive/camss/Makefile
@@ -5,6 +5,7 @@
 
 starfive-camss-objs += \
 		stf-camss.o \
+		stf-capture.o \
 		stf-isp.o \
 		stf-isp-hw-ops.o \
 		stf-video.o
diff --git a/drivers/staging/media/starfive/camss/stf-camss.h b/drivers/staging/media/starfive/camss/stf-camss.h
index c7b0a34cd29b..e2b0cfb437bd 100644
--- a/drivers/staging/media/starfive/camss/stf-camss.h
+++ b/drivers/staging/media/starfive/camss/stf-camss.h
@@ -19,6 +19,7 @@
 #include <media/v4l2-device.h>
 
 #include "stf-isp.h"
+#include "stf-capture.h"
 
 enum stf_port_num {
 	STF_PORT_DVP = 0,
@@ -52,6 +53,7 @@ struct stfcamss {
 	struct media_pipeline pipe;
 	struct device *dev;
 	struct stf_isp_dev isp_dev;
+	struct stf_capture captures[STF_CAPTURE_NUM];
 	struct v4l2_async_notifier notifier;
 	void __iomem *syscon_base;
 	void __iomem *isp_base;
diff --git a/drivers/staging/media/starfive/camss/stf-capture.c b/drivers/staging/media/starfive/camss/stf-capture.c
new file mode 100644
index 000000000000..70c24b050a1b
--- /dev/null
+++ b/drivers/staging/media/starfive/camss/stf-capture.c
@@ -0,0 +1,603 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * stf_capture.c
+ *
+ * StarFive Camera Subsystem - capture device
+ *
+ * Copyright (C) 2021-2023 StarFive Technology Co., Ltd.
+ */
+
+#include "stf-camss.h"
+
+static const char * const stf_cap_names[] = {
+	"capture_raw",
+	"capture_yuv",
+};
+
+static const struct stfcamss_format_info stf_wr_fmts[] = {
+	{
+		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.pixelformat = V4L2_PIX_FMT_SRGGB10,
+		.planes = 1,
+		.vsub = { 1 },
+		.bpp = 10,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.pixelformat = V4L2_PIX_FMT_SGRBG10,
+		.planes = 1,
+		.vsub = { 1 },
+		.bpp = 10,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.pixelformat = V4L2_PIX_FMT_SGBRG10,
+		.planes = 1,
+		.vsub = { 1 },
+		.bpp = 10,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.pixelformat = V4L2_PIX_FMT_SBGGR10,
+		.planes = 1,
+		.vsub = { 1 },
+		.bpp = 10,
+	},
+};
+
+static const struct stfcamss_format_info stf_isp_fmts[] = {
+	{
+		.code = MEDIA_BUS_FMT_YUYV8_1_5X8,
+		.pixelformat = V4L2_PIX_FMT_NV12,
+		.planes = 2,
+		.vsub = { 1, 2 },
+		.bpp = 8,
+	},
+};
+
+static inline struct stf_capture *to_stf_capture(struct stfcamss_video *video)
+{
+	return container_of(video, struct stf_capture, video);
+}
+
+static void stf_set_raw_addr(struct stfcamss *stfcamss, dma_addr_t addr)
+{
+	stf_syscon_reg_write(stfcamss, VIN_START_ADDR_O, (long)addr);
+	stf_syscon_reg_write(stfcamss, VIN_START_ADDR_N, (long)addr);
+}
+
+static void stf_set_yuv_addr(struct stfcamss *stfcamss,
+			     dma_addr_t y_addr, dma_addr_t uv_addr)
+{
+	stf_isp_reg_write(stfcamss, ISP_REG_Y_PLANE_START_ADDR, y_addr);
+	stf_isp_reg_write(stfcamss, ISP_REG_UV_PLANE_START_ADDR, uv_addr);
+}
+
+static void stf_init_addrs(struct stfcamss_video *video)
+{
+	struct stf_capture *cap = to_stf_capture(video);
+	struct stf_v_buf *output = &cap->buffers;
+	dma_addr_t addr0, addr1;
+
+	output->active_buf = 0;
+
+	if (!output->buf[0])
+		return;
+
+	addr0 = output->buf[0]->addr[0];
+	addr1 = output->buf[0]->addr[1];
+
+	if (cap->type == STF_CAPTURE_RAW)
+		stf_set_raw_addr(video->stfcamss, addr0);
+	else if (cap->type == STF_CAPTURE_YUV)
+		stf_set_yuv_addr(video->stfcamss, addr0, addr1);
+}
+
+static struct stfcamss_buffer *stf_buf_get_pending(struct stf_v_buf *output)
+{
+	struct stfcamss_buffer *buffer = NULL;
+
+	if (!list_empty(&output->pending_bufs)) {
+		buffer = list_first_entry(&output->pending_bufs,
+					  struct stfcamss_buffer,
+					  queue);
+		list_del(&buffer->queue);
+	}
+
+	return buffer;
+}
+
+static void stf_cap_s_cfg(struct stfcamss_video *video)
+{
+	struct stf_capture *cap = to_stf_capture(video);
+	struct stf_v_buf *output = &cap->buffers;
+	unsigned long flags;
+
+	spin_lock_irqsave(&output->lock, flags);
+
+	output->state = STF_OUTPUT_IDLE;
+	output->buf[0] = stf_buf_get_pending(output);
+
+	if (!output->buf[0] && output->buf[1]) {
+		output->buf[0] = output->buf[1];
+		output->buf[1] = NULL;
+	}
+
+	if (output->buf[0])
+		output->state = STF_OUTPUT_SINGLE;
+
+	output->sequence = 0;
+	stf_init_addrs(video);
+
+	spin_unlock_irqrestore(&output->lock, flags);
+}
+
+static int stf_cap_s_cleanup(struct stfcamss_video *video)
+{
+	struct stf_capture *cap = to_stf_capture(video);
+	struct stf_v_buf *output = &cap->buffers;
+	unsigned long flags;
+
+	spin_lock_irqsave(&output->lock, flags);
+
+	output->state = STF_OUTPUT_OFF;
+
+	spin_unlock_irqrestore(&output->lock, flags);
+
+	return 0;
+}
+
+static void stf_wr_data_en(struct stfcamss_video *video)
+{
+	struct stf_capture *cap = to_stf_capture(video);
+	struct stfcamss *stfcamss = cap->video.stfcamss;
+
+	stf_syscon_reg_set_bit(stfcamss, VIN_CHANNEL_SEL_EN, U0_VIN_AXIWR0_EN);
+}
+
+static void stf_wr_irq_enable(struct stfcamss_video *video)
+{
+	struct stf_capture *cap = to_stf_capture(video);
+	struct stfcamss *stfcamss = cap->video.stfcamss;
+
+	stf_syscon_reg_clear_bit(stfcamss, VIN_INRT_PIX_CFG, U0_VIN_INTR_M);
+}
+
+static void stf_wr_irq_disable(struct stfcamss_video *video)
+{
+	struct stf_capture *cap = to_stf_capture(video);
+	struct stfcamss *stfcamss = cap->video.stfcamss;
+
+	stf_syscon_reg_set_bit(stfcamss, VIN_INRT_PIX_CFG, U0_VIN_INTR_CLEAN);
+	stf_syscon_reg_clear_bit(stfcamss, VIN_INRT_PIX_CFG, U0_VIN_INTR_CLEAN);
+	stf_syscon_reg_set_bit(stfcamss, VIN_INRT_PIX_CFG, U0_VIN_INTR_M);
+}
+
+static void stf_channel_set(struct stfcamss_video *video)
+{
+	struct stf_capture *cap = to_stf_capture(video);
+	struct stfcamss *stfcamss = cap->video.stfcamss;
+	u32 val;
+
+	if (cap->type == STF_CAPTURE_RAW) {
+		val = stf_syscon_reg_read(stfcamss, VIN_CHANNEL_SEL_EN);
+		val &= ~U0_VIN_CHANNEL_SEL_MASK;
+		val |= CHANNEL(0);
+		stf_syscon_reg_write(stfcamss, VIN_CHANNEL_SEL_EN, val);
+
+		val = stf_syscon_reg_read(stfcamss, VIN_INRT_PIX_CFG);
+		val &= ~U0_VIN_PIX_CT_MASK;
+		val |= PIX_CT(1);
+
+		val &= ~U0_VIN_PIXEL_HEIGH_BIT_SEL_MAKS;
+		val |= PIXEL_HEIGH_BIT_SEL(0);
+
+		val &= ~U0_VIN_PIX_CNT_END_MASK;
+		val |= PIX_CNT_END(IMAGE_MAX_WIDTH / 4 - 1);
+
+		stf_syscon_reg_write(stfcamss, VIN_INRT_PIX_CFG, val);
+	} else if (cap->type == STF_CAPTURE_YUV) {
+		val = stf_syscon_reg_read(stfcamss, VIN_CFG_REG);
+		val &= ~U0_VIN_MIPI_BYTE_EN_ISP0_MASK;
+		val |= U0_VIN_MIPI_BYTE_EN_ISP0(0);
+
+		val &= ~U0_VIN_MIPI_CHANNEL_SEL0_MASK;
+		val |= U0_VIN_MIPI_CHANNEL_SEL0(0);
+
+		val &= ~U0_VIN_PIX_NUM_MASK;
+		val |= U0_VIN_PIX_NUM(0);
+
+		val &= ~U0_VIN_P_I_MIPI_HAEDER_EN0_MASK;
+		val |= U0_VIN_P_I_MIPI_HAEDER_EN0(1);
+
+		stf_syscon_reg_write(stfcamss, VIN_CFG_REG, val);
+	}
+}
+
+static void stf_capture_start(struct stfcamss_video *video)
+{
+	struct stf_capture *cap = to_stf_capture(video);
+
+	stf_channel_set(video);
+	if (cap->type == STF_CAPTURE_RAW) {
+		stf_wr_irq_enable(video);
+		stf_wr_data_en(video);
+	}
+
+	stf_cap_s_cfg(video);
+}
+
+static void stf_capture_stop(struct stfcamss_video *video)
+{
+	struct stf_capture *cap = to_stf_capture(video);
+
+	if (cap->type == STF_CAPTURE_RAW)
+		stf_wr_irq_disable(video);
+
+	stf_cap_s_cleanup(video);
+}
+
+static void stf_capture_init(struct stfcamss *stfcamss, struct stf_capture *cap)
+{
+	cap->buffers.state = STF_OUTPUT_OFF;
+	cap->buffers.buf[0] = NULL;
+	cap->buffers.buf[1] = NULL;
+	cap->buffers.active_buf = 0;
+	atomic_set(&cap->buffers.frame_skip, 4);
+	INIT_LIST_HEAD(&cap->buffers.pending_bufs);
+	INIT_LIST_HEAD(&cap->buffers.ready_bufs);
+	spin_lock_init(&cap->buffers.lock);
+
+	cap->video.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	cap->video.stfcamss = stfcamss;
+	cap->video.bpl_alignment = 16 * 8;
+
+	if (cap->type == STF_CAPTURE_RAW) {
+		cap->video.formats = stf_wr_fmts;
+		cap->video.nformats = ARRAY_SIZE(stf_wr_fmts);
+		cap->video.bpl_alignment = 8;
+	} else if (cap->type == STF_CAPTURE_YUV) {
+		cap->video.formats = stf_isp_fmts;
+		cap->video.nformats = ARRAY_SIZE(stf_isp_fmts);
+		cap->video.bpl_alignment = 1;
+	}
+}
+
+static void stf_buf_add_ready(struct stf_v_buf *output,
+			      struct stfcamss_buffer *buffer)
+{
+	INIT_LIST_HEAD(&buffer->queue);
+	list_add_tail(&buffer->queue, &output->ready_bufs);
+}
+
+static struct stfcamss_buffer *stf_buf_get_ready(struct stf_v_buf *output)
+{
+	struct stfcamss_buffer *buffer = NULL;
+
+	if (!list_empty(&output->ready_bufs)) {
+		buffer = list_first_entry(&output->ready_bufs,
+					  struct stfcamss_buffer,
+					  queue);
+		list_del(&buffer->queue);
+	}
+
+	return buffer;
+}
+
+static void stf_buf_add_pending(struct stf_v_buf *output,
+				struct stfcamss_buffer *buffer)
+{
+	INIT_LIST_HEAD(&buffer->queue);
+	list_add_tail(&buffer->queue, &output->pending_bufs);
+}
+
+static void stf_buf_update_on_last(struct stf_v_buf *output)
+{
+	switch (output->state) {
+	case STF_OUTPUT_CONTINUOUS:
+		output->state = STF_OUTPUT_SINGLE;
+		output->active_buf = !output->active_buf;
+		break;
+	case STF_OUTPUT_SINGLE:
+		output->state = STF_OUTPUT_STOPPING;
+		break;
+	default:
+		break;
+	}
+}
+
+static void stf_buf_update_on_next(struct stf_v_buf *output)
+{
+	switch (output->state) {
+	case STF_OUTPUT_CONTINUOUS:
+		output->active_buf = !output->active_buf;
+		break;
+	case STF_OUTPUT_SINGLE:
+	default:
+		break;
+	}
+}
+
+static void stf_buf_update_on_new(struct stfcamss_video *video,
+				  struct stfcamss_buffer *new_buf)
+{
+	struct stf_capture *cap = to_stf_capture(video);
+	struct stf_v_buf *output = &cap->buffers;
+
+	switch (output->state) {
+	case STF_OUTPUT_SINGLE:
+		stf_buf_add_pending(output, new_buf);
+		break;
+	case STF_OUTPUT_IDLE:
+		if (!output->buf[0]) {
+			output->buf[0] = new_buf;
+			stf_init_addrs(video);
+			output->state = STF_OUTPUT_SINGLE;
+		} else {
+			stf_buf_add_pending(output, new_buf);
+		}
+		break;
+	case STF_OUTPUT_STOPPING:
+		if (output->last_buffer) {
+			output->buf[output->active_buf] = output->last_buffer;
+			output->last_buffer = NULL;
+		}
+
+		output->state = STF_OUTPUT_SINGLE;
+		stf_buf_add_pending(output, new_buf);
+		break;
+	case STF_OUTPUT_CONTINUOUS:
+	default:
+		stf_buf_add_pending(output, new_buf);
+		break;
+	}
+}
+
+static void stf_buf_flush(struct stf_v_buf *output, enum vb2_buffer_state state)
+{
+	struct stfcamss_buffer *buf;
+	struct stfcamss_buffer *t;
+
+	list_for_each_entry_safe(buf, t, &output->pending_bufs, queue) {
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+		list_del(&buf->queue);
+	}
+	list_for_each_entry_safe(buf, t, &output->ready_bufs, queue) {
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+		list_del(&buf->queue);
+	}
+}
+
+static void stf_buf_done(struct stf_v_buf *output)
+{
+	struct stfcamss_buffer *ready_buf;
+	u64 ts = ktime_get_ns();
+	unsigned long flags;
+
+	if (output->state == STF_OUTPUT_OFF ||
+	    output->state == STF_OUTPUT_RESERVED)
+		return;
+
+	spin_lock_irqsave(&output->lock, flags);
+
+	while ((ready_buf = stf_buf_get_ready(output))) {
+		ready_buf->vb.vb2_buf.timestamp = ts;
+		ready_buf->vb.sequence = output->sequence++;
+
+		vb2_buffer_done(&ready_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+	}
+
+	spin_unlock_irqrestore(&output->lock, flags);
+}
+
+static void stf_change_buffer(struct stf_v_buf *output)
+{
+	struct stf_capture *cap = container_of(output, struct stf_capture,
+					       buffers);
+	struct stfcamss *stfcamss = cap->video.stfcamss;
+	struct stfcamss_buffer *ready_buf;
+	dma_addr_t *new_addr;
+	unsigned long flags;
+	u32 active_index;
+
+	if (output->state == STF_OUTPUT_OFF ||
+	    output->state == STF_OUTPUT_STOPPING ||
+	    output->state == STF_OUTPUT_RESERVED ||
+	    output->state == STF_OUTPUT_IDLE)
+		return;
+
+	spin_lock_irqsave(&output->lock, flags);
+
+	active_index = output->active_buf;
+
+	ready_buf = output->buf[active_index];
+	if (!ready_buf) {
+		dev_dbg(stfcamss->dev, "missing ready buf %d %d.\n",
+			active_index, output->state);
+		active_index = !active_index;
+		ready_buf = output->buf[active_index];
+		if (!ready_buf) {
+			dev_dbg(stfcamss->dev,
+				"missing ready buf2 %d %d.\n",
+				active_index, output->state);
+			goto out_unlock;
+		}
+	}
+
+	/* Get next buffer */
+	output->buf[active_index] = stf_buf_get_pending(output);
+	if (!output->buf[active_index]) {
+		new_addr = ready_buf->addr;
+		stf_buf_update_on_last(output);
+	} else {
+		new_addr = output->buf[active_index]->addr;
+		stf_buf_update_on_next(output);
+	}
+
+	if (output->state == STF_OUTPUT_STOPPING) {
+		output->last_buffer = ready_buf;
+	} else {
+		if (cap->type == STF_CAPTURE_RAW)
+			stf_set_raw_addr(stfcamss, new_addr[0]);
+		else if (cap->type == STF_CAPTURE_YUV)
+			stf_set_yuv_addr(stfcamss, new_addr[0], new_addr[1]);
+
+		stf_buf_add_ready(output, ready_buf);
+	}
+
+out_unlock:
+	spin_unlock_irqrestore(&output->lock, flags);
+}
+
+irqreturn_t stf_wr_irq_handler(int irq, void *priv)
+{
+	struct stfcamss *stfcamss = priv;
+	struct stf_capture *cap = &stfcamss->captures[STF_CAPTURE_RAW];
+
+	if (atomic_dec_if_positive(&cap->buffers.frame_skip) < 0) {
+		stf_change_buffer(&cap->buffers);
+		stf_buf_done(&cap->buffers);
+	}
+
+	stf_syscon_reg_set_bit(stfcamss, VIN_INRT_PIX_CFG, U0_VIN_INTR_CLEAN);
+	stf_syscon_reg_clear_bit(stfcamss, VIN_INRT_PIX_CFG, U0_VIN_INTR_CLEAN);
+
+	return IRQ_HANDLED;
+}
+
+irqreturn_t stf_isp_irq_handler(int irq, void *priv)
+{
+	struct stfcamss *stfcamss = priv;
+	struct stf_capture *cap = &stfcamss->captures[STF_CAPTURE_YUV];
+	u32 status;
+
+	status = stf_isp_reg_read(stfcamss, ISP_REG_ISP_CTRL_0);
+	if (status & ISPC_ISP) {
+		if (status & ISPC_ENUO)
+			stf_buf_done(&cap->buffers);
+
+		stf_isp_reg_write(stfcamss, ISP_REG_ISP_CTRL_0,
+				  (status & ~ISPC_INT_ALL_MASK) |
+				  ISPC_ISP | ISPC_CSI | ISPC_SC);
+	}
+
+	return IRQ_HANDLED;
+}
+
+irqreturn_t stf_line_irq_handler(int irq, void *priv)
+{
+	struct stfcamss *stfcamss = priv;
+	struct stf_capture *cap = &stfcamss->captures[STF_CAPTURE_YUV];
+	u32 status;
+
+	status = stf_isp_reg_read(stfcamss, ISP_REG_ISP_CTRL_0);
+	if (status & ISPC_LINE) {
+		if (atomic_dec_if_positive(&cap->buffers.frame_skip) < 0) {
+			if ((status & ISPC_ENUO))
+				stf_change_buffer(&cap->buffers);
+		}
+
+		stf_isp_reg_set_bit(stfcamss, ISP_REG_CSIINTS,
+				    CSI_INTS_MASK, CSI_INTS(0x3));
+		stf_isp_reg_set_bit(stfcamss, ISP_REG_IESHD,
+				    SHAD_UP_M | SHAD_UP_EN, 0x3);
+
+		stf_isp_reg_write(stfcamss, ISP_REG_ISP_CTRL_0,
+				  (status & ~ISPC_INT_ALL_MASK) | ISPC_LINE);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int stf_queue_buffer(struct stfcamss_video *video,
+			    struct stfcamss_buffer *buf)
+{
+	struct stf_capture *cap = to_stf_capture(video);
+	struct stf_v_buf *v_bufs = &cap->buffers;
+	unsigned long flags;
+
+	spin_lock_irqsave(&v_bufs->lock, flags);
+	stf_buf_update_on_new(video, buf);
+	spin_unlock_irqrestore(&v_bufs->lock, flags);
+
+	return 0;
+}
+
+static int stf_flush_buffers(struct stfcamss_video *video,
+			     enum vb2_buffer_state state)
+{
+	struct stf_capture *cap = to_stf_capture(video);
+	struct stf_v_buf *v_bufs = &cap->buffers;
+	unsigned long flags;
+	unsigned int i;
+
+	spin_lock_irqsave(&v_bufs->lock, flags);
+
+	stf_buf_flush(v_bufs, state);
+
+	for (i = 0; i < ARRAY_SIZE(v_bufs->buf); i++) {
+		if (v_bufs->buf[i])
+			vb2_buffer_done(&v_bufs->buf[i]->vb.vb2_buf, state);
+
+		v_bufs->buf[i] = NULL;
+	}
+
+	if (v_bufs->last_buffer) {
+		vb2_buffer_done(&v_bufs->last_buffer->vb.vb2_buf, state);
+		v_bufs->last_buffer = NULL;
+	}
+
+	spin_unlock_irqrestore(&v_bufs->lock, flags);
+	return 0;
+}
+
+static const struct stfcamss_video_ops stf_capture_ops = {
+	.queue_buffer = stf_queue_buffer,
+	.flush_buffers = stf_flush_buffers,
+	.start_streaming = stf_capture_start,
+	.stop_streaming = stf_capture_stop,
+};
+
+static void stf_capture_unregister_one(struct stf_capture *cap)
+{
+	if (!video_is_registered(&cap->video.vdev))
+		return;
+
+	media_entity_cleanup(&cap->video.vdev.entity);
+	vb2_video_unregister_device(&cap->video.vdev);
+}
+
+void stf_capture_unregister(struct stfcamss *stfcamss)
+{
+	struct stf_capture *cap_raw = &stfcamss->captures[STF_CAPTURE_RAW];
+	struct stf_capture *cap_yuv = &stfcamss->captures[STF_CAPTURE_YUV];
+
+	stf_capture_unregister_one(cap_raw);
+	stf_capture_unregister_one(cap_yuv);
+}
+
+int stf_capture_register(struct stfcamss *stfcamss,
+			 struct v4l2_device *v4l2_dev)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(stfcamss->captures); i++) {
+		struct stf_capture *capture = &stfcamss->captures[i];
+
+		capture->type = i;
+		capture->video.ops = &stf_capture_ops;
+		stf_capture_init(stfcamss, capture);
+
+		ret = stf_video_register(&capture->video, v4l2_dev,
+					 stf_cap_names[i]);
+		if (ret < 0) {
+			dev_err(stfcamss->dev,
+				"Failed to register video node: %d\n", ret);
+			stf_capture_unregister(stfcamss);
+			return ret;
+		}
+	}
+
+	return 0;
+}
diff --git a/drivers/staging/media/starfive/camss/stf-capture.h b/drivers/staging/media/starfive/camss/stf-capture.h
new file mode 100644
index 000000000000..4a6c8f9b779b
--- /dev/null
+++ b/drivers/staging/media/starfive/camss/stf-capture.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * stf_capture.h
+ *
+ * Starfive Camera Subsystem driver
+ *
+ * Copyright (C) 2021-2023 StarFive Technology Co., Ltd.
+ */
+
+#ifndef STF_CAPTURE_H
+#define STF_CAPTURE_H
+
+#include "stf-video.h"
+
+#define VIN_CHANNEL_SEL_EN			0x14
+#define VIN_START_ADDR_N			0x18
+#define VIN_INRT_PIX_CFG			0x1c
+#define VIN_START_ADDR_O			0x20
+#define VIN_CFG_REG				0x24
+
+#define U0_VIN_CNFG_AXI_DVP_EN			BIT(2)
+
+#define U0_VIN_CHANNEL_SEL_MASK			GENMASK(3, 0)
+#define U0_VIN_AXIWR0_EN			BIT(4)
+#define CHANNEL(x)				((x) << 0)
+
+#define U0_VIN_INTR_CLEAN			BIT(0)
+#define U0_VIN_INTR_M				BIT(1)
+#define U0_VIN_PIX_CNT_END_MASK			GENMASK(12, 2)
+#define U0_VIN_PIX_CT_MASK			GENMASK(14, 13)
+#define U0_VIN_PIXEL_HEIGH_BIT_SEL_MAKS		GENMASK(16, 15)
+
+#define PIX_CNT_END(x)				((x) << 2)
+#define PIX_CT(x)				((x) << 13)
+#define PIXEL_HEIGH_BIT_SEL(x)			((x) << 15)
+
+#define U0_VIN_CNFG_DVP_HS_POS			BIT(1)
+#define U0_VIN_CNFG_DVP_SWAP_EN			BIT(2)
+#define U0_VIN_CNFG_DVP_VS_POS			BIT(3)
+#define U0_VIN_CNFG_GEN_EN_AXIRD		BIT(4)
+#define U0_VIN_CNFG_ISP_DVP_EN0			BIT(5)
+#define U0_VIN_MIPI_BYTE_EN_ISP0(n)		((n) << 6)
+#define U0_VIN_MIPI_CHANNEL_SEL0(n)		((n) << 8)
+#define U0_VIN_P_I_MIPI_HAEDER_EN0(n)		((n) << 12)
+#define U0_VIN_PIX_NUM(n)			((n) << 13)
+#define U0_VIN_MIPI_BYTE_EN_ISP0_MASK		GENMASK(7, 6)
+#define U0_VIN_MIPI_CHANNEL_SEL0_MASK		GENMASK(11, 8)
+#define U0_VIN_P_I_MIPI_HAEDER_EN0_MASK		BIT(12)
+#define U0_VIN_PIX_NUM_MASK			GENMASK(16, 13)
+
+enum stf_v_state {
+	STF_OUTPUT_OFF,
+	STF_OUTPUT_RESERVED,
+	STF_OUTPUT_SINGLE,
+	STF_OUTPUT_CONTINUOUS,
+	STF_OUTPUT_IDLE,
+	STF_OUTPUT_STOPPING
+};
+
+struct stf_v_buf {
+	int active_buf;
+	struct stfcamss_buffer *buf[2];
+	struct stfcamss_buffer *last_buffer;
+	struct list_head pending_bufs;
+	struct list_head ready_bufs;
+	enum stf_v_state state;
+	unsigned int sequence;
+	/* protects the above member variables */
+	spinlock_t lock;
+	atomic_t frame_skip;
+};
+
+struct stf_capture {
+	struct stfcamss_video video;
+	struct stf_v_buf buffers;
+	enum stf_capture_type type;
+};
+
+irqreturn_t stf_wr_irq_handler(int irq, void *priv);
+irqreturn_t stf_isp_irq_handler(int irq, void *priv);
+irqreturn_t stf_line_irq_handler(int irq, void *priv);
+int stf_capture_register(struct stfcamss *stfcamss,
+			 struct v4l2_device *v4l2_dev);
+void stf_capture_unregister(struct stfcamss *stfcamss);
+
+#endif
+
-- 
2.34.1

