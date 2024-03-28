Return-Path: <linux-media+bounces-6702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7111876027
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 09:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED3361F270C5
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 08:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A5A524B2;
	Fri,  8 Mar 2024 08:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YnHcEnFe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F6A23759
	for <linux-media@vger.kernel.org>; Fri,  8 Mar 2024 08:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709887863; cv=none; b=VsXHVKKwqI34mFCoJGEum3k+d5VlHHVeDaE6JC28leYpCpY6HcJ/Ven81eOwsxl8ccvl9z21V9X0an61uOkq7B6VkDOLT+Xm4EfFVpxSgfr2YQDM58vDGoSmPOM18mqhCT6OEMaeC8vLeZaC9QRUls+oUPW5+Gn1Gd9P4bB2UWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709887863; c=relaxed/simple;
	bh=4hOQINivdpF+JE5Q+nzlz5SujUnk2bRZsu7heuzVw84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DURo7AQ2lkvotKhZKWGfy0FDZc2EkaTXzr/D3CWZ7u8NPvAM8DBThm9nk/xqPwMNxKyvUq9y7oNtb95CM41LsyHYd9Dh+kjmIP7aZoqGiHJGs0kTVXEo3AJr1cWO04XRZ3iyZRwiTpaM2KkpKxA3tN+i2PgFH3cakGE3RZG/7xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YnHcEnFe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CA022D6B;
	Fri,  8 Mar 2024 09:50:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709887830;
	bh=4hOQINivdpF+JE5Q+nzlz5SujUnk2bRZsu7heuzVw84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YnHcEnFe1tMl9Vvl8Fj/HqJuLvlGZns1cj6D6Z99qI/C2vIiUVEbMi6Ou8mdJ6LL9
	 p0Fy1yik5o5VTPf1Y7d5njI3/j5SxeB28wDjIUjExGzc2/lYXjNZwqEiDzZdZv4adB
	 5ls3M6Nd9K7zYvxf75iNaCu+tIg0OS5lBRKz1Mfs=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v4 8/9] media: raspberrypi: Add support for PiSP BE
Date: Fri,  8 Mar 2024 09:50:26 +0100
Message-ID: <20240308085028.44388-9-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240308085028.44388-1-jacopo.mondi@ideasonboard.com>
References: <20240308085028.44388-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Naushir Patuck <naush@raspberrypi.com>

Add support for the Raspberry Pi PiSP Back End.

The driver has been upported from the Raspberry Pi kernel at revision
f74893f8a0c2 ("drivers: media: pisp_be: Update seqeuence numbers of the
buffers").

The ISP documentation is available at:
https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf

Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 MAINTAINERS                                   |    8 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/raspberrypi/Kconfig    |    5 +
 drivers/media/platform/raspberrypi/Makefile   |    3 +
 .../platform/raspberrypi/pisp_be/Kconfig      |   13 +
 .../platform/raspberrypi/pisp_be/Makefile     |    6 +
 .../platform/raspberrypi/pisp_be/pisp_be.c    | 1859 +++++++++++++++++
 .../raspberrypi/pisp_be/pisp_be_formats.h     |  519 +++++
 .../linux/media/raspberrypi/pisp_be_config.h  |  531 +++++
 .../linux/media/raspberrypi/pisp_common.h     |  199 ++
 11 files changed, 3145 insertions(+)
 create mode 100644 drivers/media/platform/raspberrypi/Kconfig
 create mode 100644 drivers/media/platform/raspberrypi/Makefile
 create mode 100644 drivers/media/platform/raspberrypi/pisp_be/Kconfig
 create mode 100644 drivers/media/platform/raspberrypi/pisp_be/Makefile
 create mode 100644 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
 create mode 100644 drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h
 create mode 100644 include/uapi/linux/media/raspberrypi/pisp_be_config.h
 create mode 100644 include/uapi/linux/media/raspberrypi/pisp_common.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 83b7d3745336..39ce55e4c327 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18361,6 +18361,14 @@ F:	drivers/ras/
 F:	include/linux/ras.h
 F:	include/ras/ras_event.h
 
+RASPBERRY PI PISP BACK END
+M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+L:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
+F:	drivers/media/platform/raspberrypi/pisp_be/
+
 RC-CORE / LIRC FRAMEWORK
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 91e54215de3a..58368fd15126 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -77,6 +77,7 @@ source "drivers/media/platform/nuvoton/Kconfig"
 source "drivers/media/platform/nvidia/Kconfig"
 source "drivers/media/platform/nxp/Kconfig"
 source "drivers/media/platform/qcom/Kconfig"
+source "drivers/media/platform/raspberrypi/Kconfig"
 source "drivers/media/platform/renesas/Kconfig"
 source "drivers/media/platform/rockchip/Kconfig"
 source "drivers/media/platform/samsung/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 3296ec1ebe16..ba7acc32f07f 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -20,6 +20,7 @@ obj-y += nuvoton/
 obj-y += nvidia/
 obj-y += nxp/
 obj-y += qcom/
+obj-y += raspberrypi/
 obj-y += renesas/
 obj-y += rockchip/
 obj-y += samsung/
diff --git a/drivers/media/platform/raspberrypi/Kconfig b/drivers/media/platform/raspberrypi/Kconfig
new file mode 100644
index 000000000000..e928f979019e
--- /dev/null
+++ b/drivers/media/platform/raspberrypi/Kconfig
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+comment "Raspberry Pi media platform drivers"
+
+source "drivers/media/platform/raspberrypi/pisp_be/Kconfig"
diff --git a/drivers/media/platform/raspberrypi/Makefile b/drivers/media/platform/raspberrypi/Makefile
new file mode 100644
index 000000000000..c0d1a2dab486
--- /dev/null
+++ b/drivers/media/platform/raspberrypi/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-y += pisp_be/
diff --git a/drivers/media/platform/raspberrypi/pisp_be/Kconfig b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
new file mode 100644
index 000000000000..e3cbc3063342
--- /dev/null
+++ b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
@@ -0,0 +1,13 @@
+config VIDEO_RASPBERRYPI_PISP_BE
+	tristate "Raspberry Pi PiSP Backend (BE) ISP driver"
+	depends on V4L_PLATFORM_DRIVERS
+	depends on VIDEO_DEV && PM
+	select VIDEO_V4L2_SUBDEV_API
+	select MEDIA_CONTROLLER
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_FWNODE
+	help
+	  Say Y here to enable support for the PiSP Backend (BE) ISP driver.
+
+	  To compile this driver as a module, choose M here. The module will be
+	  called pisp-be.
diff --git a/drivers/media/platform/raspberrypi/pisp_be/Makefile b/drivers/media/platform/raspberrypi/pisp_be/Makefile
new file mode 100644
index 000000000000..a70bf5716824
--- /dev/null
+++ b/drivers/media/platform/raspberrypi/pisp_be/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for Raspberry Pi PiSP Backend driver
+#
+pisp-be-objs := pisp_be.o
+obj-$(CONFIG_VIDEO_RASPBERRYPI_PISP_BE) += pisp-be.o
diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
new file mode 100644
index 000000000000..46f8b326c73d
--- /dev/null
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -0,0 +1,1859 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PiSP Back End driver.
+ * Copyright (c) 2021-2022 Raspberry Pi Limited.
+ *
+ */
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/lockdep.h>
+#include <linux/media/raspberrypi/pisp_be_config.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-vmalloc.h>
+
+#include "pisp_be_formats.h"
+
+/* Maximum number of config buffers possible */
+#define PISP_BE_NUM_CONFIG_BUFFERS VB2_MAX_FRAME
+
+/*
+ * We want to support 2 independent instances allowing 2 simultaneous users
+ * of the ISP-BE (of course they share hardware, platform resources and mutex).
+ * Each such instance comprises a group of device nodes representing input
+ * and output queues, and a media controller device node to describe them.
+ */
+#define PISPBE_NUM_NODE_GROUPS 2
+
+#define PISPBE_NAME "pispbe"
+
+/* Some ISP-BE registers */
+#define PISP_BE_VERSION_REG		0x0
+#define PISP_BE_CONTROL_REG		0x4
+#define PISP_BE_CONTROL_COPY_CONFIG	BIT(1)
+#define PISP_BE_CONTROL_QUEUE_JOB	BIT(0)
+#define PISP_BE_CONTROL_NUM_TILES(n)	((n) << 16)
+#define PISP_BE_TILE_ADDR_LO_REG	0x8
+#define PISP_BE_TILE_ADDR_HI_REG	0xc
+#define PISP_BE_STATUS_REG		0x10
+#define PISP_BE_STATUS_QUEUED		BIT(0)
+#define PISP_BE_BATCH_STATUS_REG	0x14
+#define PISP_BE_INTERRUPT_EN_REG	0x18
+#define PISP_BE_INTERRUPT_STATUS_REG	0x1c
+#define PISP_BE_AXI_REG			0x20
+#define PISP_BE_CONFIG_BASE_REG		0x40
+#define PISP_BE_IO_ADDR_LOW(n)		(PISP_BE_CONFIG_BASE_REG + 8 * (n))
+#define PISP_BE_IO_ADDR_HIGH(n)		(PISP_BE_IO_ADDR_LOW((n)) + 4)
+#define PISP_BE_GLOBAL_BAYER_ENABLE	0xb0
+#define PISP_BE_GLOBAL_RGB_ENABLE	0xb4
+#define N_HW_ADDRESSES			13
+#define N_HW_ENABLES			2
+
+#define PISP_BE_VERSION_2712		0x02252700
+#define PISP_BE_VERSION_MINOR_BITS	0xf
+
+/*
+ * This maps our nodes onto the inputs/outputs of the actual PiSP Back End.
+ * Be wary of the word "OUTPUT" which is used ambiguously here. In a V4L2
+ * context it means an input to the hardware (source image or metadata).
+ * Elsewhere it means an output from the hardware.
+ */
+enum pispbe_node_ids {
+	MAIN_INPUT_NODE,
+	TDN_INPUT_NODE,
+	STITCH_INPUT_NODE,
+	OUTPUT0_NODE,
+	OUTPUT1_NODE,
+	TDN_OUTPUT_NODE,
+	STITCH_OUTPUT_NODE,
+	CONFIG_NODE,
+	PISPBE_NUM_NODES
+};
+
+struct pispbe_node_description {
+	const char *ent_name;
+	enum v4l2_buf_type buf_type;
+	unsigned int caps;
+};
+
+static const struct pispbe_node_description node_desc[PISPBE_NUM_NODES] = {
+	/* MAIN_INPUT_NODE */
+	{
+		.ent_name = PISPBE_NAME "-input",
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.caps = V4L2_CAP_VIDEO_OUTPUT_MPLANE,
+	},
+	/* TDN_INPUT_NODE */
+	{
+		.ent_name = PISPBE_NAME "-tdn_input",
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.caps = V4L2_CAP_VIDEO_OUTPUT_MPLANE,
+	},
+	/* STITCH_INPUT_NODE */
+	{
+		.ent_name = PISPBE_NAME "-stitch_input",
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.caps = V4L2_CAP_VIDEO_OUTPUT_MPLANE,
+	},
+	/* OUTPUT0_NODE */
+	{
+		.ent_name = PISPBE_NAME "-output0",
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE,
+	},
+	/* OUTPUT1_NODE */
+	{
+		.ent_name = PISPBE_NAME "-output1",
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE,
+	},
+	/* TDN_OUTPUT_NODE */
+	{
+		.ent_name = PISPBE_NAME "-tdn_output",
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE,
+	},
+	/* STITCH_OUTPUT_NODE */
+	{
+		.ent_name = PISPBE_NAME "-stitch_output",
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE,
+	},
+	/* CONFIG_NODE */
+	{
+		.ent_name = PISPBE_NAME "-config",
+		.buf_type = V4L2_BUF_TYPE_META_OUTPUT,
+		.caps = V4L2_CAP_META_OUTPUT,
+	}
+};
+
+#define NODE_DESC_IS_OUTPUT(desc) ( \
+	((desc)->buf_type == V4L2_BUF_TYPE_META_OUTPUT) || \
+	((desc)->buf_type == V4L2_BUF_TYPE_VIDEO_OUTPUT) || \
+	((desc)->buf_type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE))
+
+#define NODE_IS_META(node) ( \
+	((node)->buf_type == V4L2_BUF_TYPE_META_OUTPUT))
+#define NODE_IS_OUTPUT(node) ( \
+	((node)->buf_type == V4L2_BUF_TYPE_META_OUTPUT) || \
+	((node)->buf_type == V4L2_BUF_TYPE_VIDEO_OUTPUT) || \
+	((node)->buf_type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE))
+#define NODE_IS_CAPTURE(node) ( \
+	((node)->buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE) || \
+	((node)->buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE))
+#define NODE_IS_MPLANE(node) ( \
+	((node)->buf_type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) || \
+	((node)->buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE))
+
+/*
+ * Structure to describe a single node /dev/video<N> which represents a single
+ * input or output queue to the PiSP Back End device.
+ */
+struct pispbe_node {
+	unsigned int id;
+	int vfl_dir;
+	enum v4l2_buf_type buf_type;
+	struct video_device vfd;
+	struct media_pad pad;
+	struct media_intf_devnode *intf_devnode;
+	struct media_link *intf_link;
+	struct pispbe_node_group *node_group;
+	/* Video device lock */
+	struct mutex node_lock;
+	/* vb2_queue lock */
+	struct mutex queue_lock;
+	/* Protect pispbe_node->ready_queue and pispbe_buffer->ready_list */
+	spinlock_t ready_lock;
+	struct list_head ready_queue;
+	struct vb2_queue queue;
+	struct v4l2_format format;
+	const struct pisp_be_format *pisp_format;
+};
+
+/* For logging only, use the entity name with "pispbe" and separator removed */
+#define NODE_NAME(node) \
+		(node_desc[(node)->id].ent_name + sizeof(PISPBE_NAME))
+
+/*
+ * Node group structure, which comprises all the input and output nodes that a
+ * single PiSP client will need, along with its own v4l2 and media devices.
+ */
+struct pispbe_node_group {
+	unsigned int id;
+	struct v4l2_device v4l2_dev;
+	struct v4l2_subdev sd;
+	struct pispbe_dev *pispbe;
+	struct media_device mdev;
+	struct pispbe_node node[PISPBE_NUM_NODES];
+	u32 streaming_map; /* bitmap of which nodes are streaming */
+	struct media_pad pad[PISPBE_NUM_NODES]; /* output pads first */
+	struct pisp_be_tiles_config *config;
+	dma_addr_t config_dma_addr;
+	unsigned int sequence;
+};
+
+/* Records details of the jobs currently running or queued on the h/w. */
+struct pispbe_job {
+	struct pispbe_node_group *node_group;
+	/*
+	 * An array of buffer pointers - remember it's source buffers first,
+	 * then captures, then metadata last.
+	 */
+	struct pispbe_buffer *buf[PISPBE_NUM_NODES];
+};
+
+/* Records a job configuration and memory addresses. */
+struct pispbe_job_descriptor {
+	dma_addr_t hw_dma_addrs[N_HW_ADDRESSES];
+	struct pisp_be_tiles_config *config;
+	u32 hw_enables[N_HW_ENABLES];
+	dma_addr_t tiles;
+};
+
+/*
+ * Structure representing the entire PiSP Back End device, comprising several
+ * node groups which share platform resources and a mutex for the actual HW.
+ */
+struct pispbe_dev {
+	struct device *dev;
+	struct pispbe_node_group node_group[PISPBE_NUM_NODE_GROUPS];
+	int hw_busy; /* non-zero if a job is queued or is being started */
+	struct pispbe_job queued_job, running_job;
+	void __iomem *be_reg_base;
+	struct clk *clk;
+	int irq;
+	u32 hw_version;
+	u8 done, started;
+	spinlock_t hw_lock; /* protects "hw_busy" flag and streaming_map */
+};
+
+static u32 pispbe_rd(struct pispbe_dev *pispbe, unsigned int offset)
+{
+	return readl(pispbe->be_reg_base + offset);
+}
+
+static void pispbe_wr(struct pispbe_dev *pispbe, unsigned int offset, u32 val)
+{
+	writel(val, pispbe->be_reg_base + offset);
+}
+
+/*
+ * Queue a job to the h/w. If the h/w is idle it will begin immediately.
+ * Caller must ensure it is "safe to queue", i.e. we don't already have a
+ * queued, unstarted job.
+ */
+static void pispbe_queue_job(struct pispbe_dev *pispbe,
+			     struct pispbe_job_descriptor *job)
+{
+	unsigned int begin, end;
+
+	if (pispbe_rd(pispbe, PISP_BE_STATUS_REG) & PISP_BE_STATUS_QUEUED)
+		dev_err(pispbe->dev, "ERROR: not safe to queue new job!\n");
+
+	/*
+	 * Write configuration to hardware. DMA addresses and enable flags
+	 * are passed separately, because the driver needs to sanitize them,
+	 * and we don't want to modify (or be vulnerable to modifications of)
+	 * the mmap'd buffer.
+	 */
+	for (unsigned int u = 0; u < N_HW_ADDRESSES; ++u) {
+		pispbe_wr(pispbe, PISP_BE_IO_ADDR_LOW(u),
+			  lower_32_bits(job->hw_dma_addrs[u]));
+		pispbe_wr(pispbe, PISP_BE_IO_ADDR_HIGH(u),
+			  upper_32_bits(job->hw_dma_addrs[u]));
+	}
+	pispbe_wr(pispbe, PISP_BE_GLOBAL_BAYER_ENABLE, job->hw_enables[0]);
+	pispbe_wr(pispbe, PISP_BE_GLOBAL_RGB_ENABLE, job->hw_enables[1]);
+
+	/*
+	 * Everything else is as supplied by the user. Buffer sizes not
+	 * checked!
+	 */
+	begin =	offsetof(struct pisp_be_config, global.bayer_order)
+	      / sizeof(u32);
+	end = offsetof(struct pisp_be_config, axi) / sizeof(u32);
+	for (unsigned int u = begin; u < end; u++)
+		pispbe_wr(pispbe, PISP_BE_CONFIG_BASE_REG + 4 * u,
+			  ((u32 *)job->config)[u]);
+
+	/* Read back the addresses -- an error here could be fatal */
+	for (unsigned int u = 0; u < N_HW_ADDRESSES; ++u) {
+		unsigned int offset = PISP_BE_IO_ADDR_LOW(u);
+		u64 along = pispbe_rd(pispbe, offset);
+
+		along += ((u64)pispbe_rd(pispbe, offset + 4)) << 32;
+		if (along != (u64)(job->hw_dma_addrs[u])) {
+			dev_err(pispbe->dev,
+				"ISP BE config error: check if ISP RAMs enabled?\n");
+			return;
+		}
+	}
+
+	/*
+	 * Write tile pointer to hardware. The IOMMU should prevent
+	 * out-of-bounds offsets reaching non-ISP buffers.
+	 */
+	pispbe_wr(pispbe, PISP_BE_TILE_ADDR_LO_REG, lower_32_bits(job->tiles));
+	pispbe_wr(pispbe, PISP_BE_TILE_ADDR_HI_REG, upper_32_bits(job->tiles));
+
+	/* Enqueue the job */
+	pispbe_wr(pispbe, PISP_BE_CONTROL_REG,
+		  PISP_BE_CONTROL_COPY_CONFIG | PISP_BE_CONTROL_QUEUE_JOB |
+		  PISP_BE_CONTROL_NUM_TILES(job->config->num_tiles));
+}
+
+struct pispbe_buffer {
+	struct vb2_v4l2_buffer vb;
+	struct list_head ready_list;
+	unsigned int config_index;
+};
+
+static int pispbe_get_planes_addr(dma_addr_t addr[3], struct pispbe_buffer *buf,
+				  struct pispbe_node *node)
+{
+	unsigned int num_planes = node->format.fmt.pix_mp.num_planes;
+	unsigned int plane_factor = 0;
+	unsigned int size;
+	unsigned int p;
+
+	if (!buf || !node->pisp_format)
+		return 0;
+
+	/*
+	 * Determine the base plane size. This will not be the same
+	 * as node->format.fmt.pix_mp.plane_fmt[0].sizeimage for a single
+	 * plane buffer in an mplane format.
+	 */
+	size = node->format.fmt.pix_mp.plane_fmt[0].bytesperline
+	     * node->format.fmt.pix_mp.height;
+
+	for (p = 0; p < num_planes && p < PISPBE_MAX_PLANES; p++) {
+		addr[p] = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, p);
+		plane_factor += node->pisp_format->plane_factor[p];
+	}
+
+	for (; p < PISPBE_MAX_PLANES && node->pisp_format->plane_factor[p]; p++) {
+		/*
+		 * Calculate the address offset of this plane as needed
+		 * by the hardware. This is specifically for non-mplane
+		 * buffer formats, where there are 3 image planes, e.g.
+		 * for the V4L2_PIX_FMT_YUV420 format.
+		 */
+		addr[p] = addr[0] + ((size * plane_factor) >> 3);
+		plane_factor += node->pisp_format->plane_factor[p];
+	}
+
+	return num_planes;
+}
+
+static dma_addr_t pispbe_get_addr(struct pispbe_buffer *buf)
+{
+	if (buf)
+		return vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
+	return 0;
+}
+
+static void pispbe_xlate_addrs(dma_addr_t addrs[N_HW_ADDRESSES],
+			       u32 hw_enables[N_HW_ENABLES],
+			       struct pisp_be_tiles_config *config,
+			       struct pispbe_buffer *buf[PISPBE_NUM_NODES],
+			       struct pispbe_node_group *node_group)
+{
+	int ret;
+
+	/* Take a copy of the "enable" bitmaps so we can modify them. */
+	hw_enables[0] = config->config.global.bayer_enables;
+	hw_enables[1] = config->config.global.rgb_enables;
+
+	/*
+	 * Main input first. There are 3 address pointers, corresponding to up
+	 * to 3 planes.
+	 */
+	ret = pispbe_get_planes_addr(addrs, buf[MAIN_INPUT_NODE],
+				     &node_group->node[MAIN_INPUT_NODE]);
+	if (ret <= 0) {
+		/*
+		 * This shouldn't happen; pispbe_schedule_internal should insist
+		 * on an input.
+		 */
+		dev_warn(node_group->pispbe->dev, "ISP-BE missing input\n");
+		hw_enables[0] = 0;
+		hw_enables[1] = 0;
+		return;
+	}
+
+	/*
+	 * Now TDN/Stitch inputs and outputs. These are single-plane and only
+	 * used with Bayer input. Input enables must match the requirements
+	 * of the processing stages, otherwise the hardware can lock up!
+	 */
+	if (hw_enables[0] & PISP_BE_BAYER_ENABLE_INPUT) {
+		addrs[3] = pispbe_get_addr(buf[TDN_INPUT_NODE]);
+		if (addrs[3] == 0 ||
+		    !(hw_enables[0] & PISP_BE_BAYER_ENABLE_TDN_INPUT) ||
+		    !(hw_enables[0] & PISP_BE_BAYER_ENABLE_TDN) ||
+		    (config->config.tdn.reset & 1)) {
+			hw_enables[0] &= ~(PISP_BE_BAYER_ENABLE_TDN_INPUT |
+					   PISP_BE_BAYER_ENABLE_TDN_DECOMPRESS);
+			if (!(config->config.tdn.reset & 1))
+				hw_enables[0] &= ~PISP_BE_BAYER_ENABLE_TDN;
+		}
+
+		addrs[4] = pispbe_get_addr(buf[STITCH_INPUT_NODE]);
+		if (addrs[4] == 0 ||
+		    !(hw_enables[0] & PISP_BE_BAYER_ENABLE_STITCH_INPUT) ||
+		    !(hw_enables[0] & PISP_BE_BAYER_ENABLE_STITCH)) {
+			hw_enables[0] &=
+				~(PISP_BE_BAYER_ENABLE_STITCH_INPUT |
+				  PISP_BE_BAYER_ENABLE_STITCH_DECOMPRESS |
+				  PISP_BE_BAYER_ENABLE_STITCH);
+		}
+
+		addrs[5] = pispbe_get_addr(buf[TDN_OUTPUT_NODE]);
+		if (addrs[5] == 0)
+			hw_enables[0] &= ~(PISP_BE_BAYER_ENABLE_TDN_COMPRESS |
+					   PISP_BE_BAYER_ENABLE_TDN_OUTPUT);
+
+		addrs[6] = pispbe_get_addr(buf[STITCH_OUTPUT_NODE]);
+		if (addrs[6] == 0)
+			hw_enables[0] &=
+				~(PISP_BE_BAYER_ENABLE_STITCH_COMPRESS |
+				  PISP_BE_BAYER_ENABLE_STITCH_OUTPUT);
+	} else {
+		/* No Bayer input? Disable entire Bayer pipe (else lockup) */
+		hw_enables[0] = 0;
+	}
+
+	/* Main image output channels. */
+	for (unsigned int i = 0; i < PISP_BACK_END_NUM_OUTPUTS; i++) {
+		ret = pispbe_get_planes_addr(addrs + 7 + 3 * i,
+					     buf[OUTPUT0_NODE + i],
+					     &node_group->node[OUTPUT0_NODE + i]);
+		if (ret <= 0)
+			hw_enables[1] &= ~(PISP_BE_RGB_ENABLE_OUTPUT0 << i);
+	}
+}
+
+/*
+ * Prepare a job description to be submitted to the HW.
+ *
+ * To schedule a job, we need all streaming nodes (apart from Output0,
+ * Output1, Tdn and Stitch) to have a buffer ready, which must
+ * include at least a config buffer and a main input image.
+ *
+ * For Output0, Output1, Tdn and Stitch, a buffer only needs to be
+ * available if the blocks are enabled in the config.
+ *
+ * Needs to be called with hw_lock held.
+ *
+ * Returns 0 if a job has been successfully prepared, < 0 otherwise.
+ */
+static int pispbe_prepare_job(struct pispbe_node_group *node_group,
+			      struct pispbe_job_descriptor *job)
+{
+	struct pispbe_buffer *buf[PISPBE_NUM_NODES] = {};
+	struct pispbe_dev *pispbe = node_group->pispbe;
+	unsigned int config_index;
+	struct pispbe_node *node;
+	unsigned long flags;
+
+	lockdep_assert_held(&pispbe->hw_lock);
+
+	memset(job, 0, sizeof(struct pispbe_job_descriptor));
+
+	if (((BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE)) &
+		node_group->streaming_map) !=
+			(BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE)))
+		return -ENODEV;
+
+	node = &node_group->node[CONFIG_NODE];
+	spin_lock_irqsave(&node->ready_lock, flags);
+	buf[CONFIG_NODE] = list_first_entry_or_null(&node->ready_queue,
+						    struct pispbe_buffer,
+						    ready_list);
+	if (buf[CONFIG_NODE]) {
+		list_del(&buf[CONFIG_NODE]->ready_list);
+		pispbe->queued_job.buf[CONFIG_NODE] = buf[CONFIG_NODE];
+	}
+	spin_unlock_irqrestore(&node->ready_lock, flags);
+
+	/* Exit early if no config buffer has been queued. */
+	if (!buf[CONFIG_NODE])
+		return -ENODEV;
+
+	config_index = buf[CONFIG_NODE]->vb.vb2_buf.index;
+	job->config = &node_group->config[config_index];
+	job->tiles = node_group->config_dma_addr
+		   + config_index * sizeof(struct pisp_be_tiles_config)
+		   + offsetof(struct pisp_be_tiles_config, tiles);
+
+	/* remember: srcimages, captures then metadata */
+	for (unsigned int i = 0; i < PISPBE_NUM_NODES; i++) {
+		unsigned int bayer_en =
+			job->config->config.global.bayer_enables;
+		unsigned int rgb_en =
+			job->config->config.global.rgb_enables;
+		bool ignore_buffers = false;
+
+		/* Config node is handled outside the loop above. */
+		if (i == CONFIG_NODE)
+			continue;
+
+		buf[i] = NULL;
+		if (!(node_group->streaming_map & BIT(i)))
+			continue;
+
+		if ((!(rgb_en & PISP_BE_RGB_ENABLE_OUTPUT0) &&
+		     i == OUTPUT0_NODE) ||
+		    (!(rgb_en & PISP_BE_RGB_ENABLE_OUTPUT1) &&
+		     i == OUTPUT1_NODE) ||
+		    (!(bayer_en & PISP_BE_BAYER_ENABLE_TDN_INPUT) &&
+		     i == TDN_INPUT_NODE) ||
+		    (!(bayer_en & PISP_BE_BAYER_ENABLE_TDN_OUTPUT) &&
+		     i == TDN_OUTPUT_NODE) ||
+		    (!(bayer_en & PISP_BE_BAYER_ENABLE_STITCH_INPUT) &&
+		     i == STITCH_INPUT_NODE) ||
+		    (!(bayer_en & PISP_BE_BAYER_ENABLE_STITCH_OUTPUT) &&
+		     i == STITCH_OUTPUT_NODE)) {
+			/*
+			 * Ignore Output0/Output1/Tdn/Stitch buffer check if the
+			 * global enables aren't set for these blocks. If a
+			 * buffer has been provided, we dequeue it back to the
+			 * user with the other in-use buffers.
+			 */
+			ignore_buffers = true;
+		}
+
+		node = &node_group->node[i];
+
+		/* Pull a buffer from each V4L2 queue to form the queued job */
+		spin_lock_irqsave(&node->ready_lock, flags);
+		buf[i] = list_first_entry_or_null(&node->ready_queue,
+						  struct pispbe_buffer,
+						  ready_list);
+		if (buf[i]) {
+			list_del(&buf[i]->ready_list);
+			pispbe->queued_job.buf[i] = buf[i];
+		}
+		spin_unlock_irqrestore(&node->ready_lock, flags);
+
+		if (!buf[i] && !ignore_buffers)
+			goto err_return_buffers;
+	}
+
+	pispbe->queued_job.node_group = node_group;
+
+	/* Convert buffers to DMA addresses for the hardware */
+	pispbe_xlate_addrs(job->hw_dma_addrs, job->hw_enables,
+			   job->config, buf, node_group);
+
+	return 0;
+
+err_return_buffers:
+	for (unsigned int i = 0; i < PISPBE_NUM_NODES; i++) {
+		struct pispbe_node *n =  &node_group->node[i];
+
+		if (!buf[i])
+			continue;
+
+		/* Return the buffer to the ready_list queue */
+		spin_lock_irqsave(&n->ready_lock, flags);
+		list_add(&buf[i]->ready_list, &n->ready_queue);
+		spin_unlock_irqrestore(&n->ready_lock, flags);
+	}
+
+	memset(&pispbe->queued_job, 0, sizeof(pispbe->queued_job));
+
+	return -ENODEV;
+}
+
+static void pispbe_schedule(struct pispbe_dev *pispbe,
+			    struct pispbe_node_group *node_group,
+			    bool clear_hw_busy)
+{
+	struct pispbe_job_descriptor job;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pispbe->hw_lock, flags);
+
+	if (clear_hw_busy)
+		pispbe->hw_busy = 0;
+
+	if (pispbe->hw_busy)
+		goto unlock_and_return;
+
+	for (unsigned int i = 0; i < PISPBE_NUM_NODE_GROUPS; i++) {
+		int ret;
+
+		/* Schedule jobs only for a specific group. */
+		if (node_group &&
+		    &pispbe->node_group[i] != node_group)
+			continue;
+
+		/*
+		 * Prepare a job for this group, if the group is not ready
+		 * continue and try with the next one.
+		 */
+		ret = pispbe_prepare_job(&pispbe->node_group[i], &job);
+		if (ret)
+			continue;
+
+		/*
+		 * We can kick the job off without the hw_lock, as this can
+		 * never run again until hw_busy is cleared, which will happen
+		 * only when the following job has been queued and an interrupt
+		 * is rised.
+		 */
+		pispbe->hw_busy = 1;
+		spin_unlock_irqrestore(&pispbe->hw_lock, flags);
+
+		if (job.config->num_tiles <= 0 ||
+		    job.config->num_tiles > PISP_BACK_END_NUM_TILES ||
+		    !((job.hw_enables[0] | job.hw_enables[1]) &
+		      PISP_BE_BAYER_ENABLE_INPUT)) {
+			/*
+			 * Bad job. We can't let it proceed as it could lock up
+			 * the hardware, or worse!
+			 *
+			 * For now, just force num_tiles to 0, which causes the
+			 * H/W to do something bizarre but survivable. It
+			 * increments (started,done) counters by more than 1,
+			 * but we seem to survive...
+			 */
+			dev_err(pispbe->dev,
+				"Bad job: invalid number of tiles: %d\n",
+				job.config->num_tiles);
+			job.config->num_tiles = 0;
+		}
+
+		pispbe_queue_job(pispbe, &job);
+
+		return;
+	}
+
+unlock_and_return:
+	/* No job has been queued, just release the lock and return. */
+	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
+}
+
+static void pispbe_isr_jobdone(struct pispbe_dev *pispbe,
+			       struct pispbe_job *job)
+{
+	struct pispbe_buffer **buf = job->buf;
+	u64 ts = ktime_get_ns();
+
+	for (unsigned int i = 0; i < PISPBE_NUM_NODES; i++) {
+		if (buf[i]) {
+			buf[i]->vb.vb2_buf.timestamp = ts;
+			buf[i]->vb.sequence = job->node_group->sequence;
+			vb2_buffer_done(&buf[i]->vb.vb2_buf,
+					VB2_BUF_STATE_DONE);
+		}
+	}
+
+	job->node_group->sequence++;
+}
+
+static irqreturn_t pispbe_isr(int irq, void *dev)
+{
+	struct pispbe_dev *pispbe = (struct pispbe_dev *)dev;
+	bool can_queue_another = false;
+	u8 started, done;
+	u32 u;
+
+	u = pispbe_rd(pispbe, PISP_BE_INTERRUPT_STATUS_REG);
+	if (u == 0)
+		return IRQ_NONE;
+
+	pispbe_wr(pispbe, PISP_BE_INTERRUPT_STATUS_REG, u);
+	u = pispbe_rd(pispbe, PISP_BE_BATCH_STATUS_REG);
+	done = (uint8_t)u;
+	started = (uint8_t)(u >> 8);
+
+	/*
+	 * Be aware that done can go up by 2 and started by 1 when: a job that
+	 * we previously saw "start" now finishes, and we then queued a new job
+	 * which we see both start and finish "simultaneously".
+	 */
+	if (pispbe->running_job.node_group && pispbe->done != done) {
+		pispbe_isr_jobdone(pispbe, &pispbe->running_job);
+		memset(&pispbe->running_job, 0, sizeof(pispbe->running_job));
+		pispbe->done++;
+	}
+
+	if (pispbe->started != started) {
+		pispbe->started++;
+		can_queue_another = 1;
+
+		if (pispbe->done != done && pispbe->queued_job.node_group) {
+			pispbe_isr_jobdone(pispbe, &pispbe->queued_job);
+			pispbe->done++;
+		} else {
+			pispbe->running_job = pispbe->queued_job;
+		}
+
+		memset(&pispbe->queued_job, 0, sizeof(pispbe->queued_job));
+	}
+
+	if (pispbe->done != done || pispbe->started != started) {
+		dev_err(pispbe->dev,
+			"Job counters not matching: done = %u, expected %u - started = %u, expected %u\n",
+			pispbe->done, done, pispbe->started, started);
+		pispbe->started = started;
+		pispbe->done = done;
+	}
+
+	/* check if there's more to do before going to sleep */
+	pispbe_schedule(pispbe, NULL, can_queue_another);
+
+	return IRQ_HANDLED;
+}
+
+static int pisp_be_validate_config(struct pispbe_node_group *node_group,
+				   struct pisp_be_tiles_config *config)
+{
+	u32 bayer_enables = config->config.global.bayer_enables;
+	u32 rgb_enables = config->config.global.rgb_enables;
+	struct device *dev = node_group->pispbe->dev;
+	struct v4l2_format *fmt;
+	unsigned int bpl, size;
+
+	if (!(bayer_enables & PISP_BE_BAYER_ENABLE_INPUT) ==
+	    !(rgb_enables & PISP_BE_RGB_ENABLE_INPUT)) {
+		dev_err(dev, "%s: Not one input enabled\n", __func__);
+		return -EIO;
+	}
+
+	/* Ensure output config strides and buffer sizes match the V4L2 formats. */
+	fmt = &node_group->node[TDN_OUTPUT_NODE].format;
+	if (bayer_enables & PISP_BE_BAYER_ENABLE_TDN_OUTPUT) {
+		bpl = config->config.tdn_output_format.stride;
+		size = bpl * config->config.tdn_output_format.height;
+		if (fmt->fmt.pix_mp.plane_fmt[0].bytesperline < bpl) {
+			dev_err(dev, "%s: bpl mismatch on tdn_output\n",
+				__func__);
+			return -EINVAL;
+		}
+		if (fmt->fmt.pix_mp.plane_fmt[0].sizeimage < size) {
+			dev_err(dev, "%s: size mismatch on tdn_output\n",
+				__func__);
+			return -EINVAL;
+		}
+	}
+
+	fmt = &node_group->node[STITCH_OUTPUT_NODE].format;
+	if (bayer_enables & PISP_BE_BAYER_ENABLE_STITCH_OUTPUT) {
+		bpl = config->config.stitch_output_format.stride;
+		size = bpl * config->config.stitch_output_format.height;
+		if (fmt->fmt.pix_mp.plane_fmt[0].bytesperline < bpl) {
+			dev_err(dev, "%s: bpl mismatch on stitch_output\n",
+				__func__);
+			return -EINVAL;
+		}
+		if (fmt->fmt.pix_mp.plane_fmt[0].sizeimage < size) {
+			dev_err(dev, "%s: size mismatch on stitch_output\n",
+				__func__);
+			return -EINVAL;
+		}
+	}
+
+	for (unsigned int j = 0; j < PISP_BACK_END_NUM_OUTPUTS; j++) {
+		if (!(rgb_enables & PISP_BE_RGB_ENABLE_OUTPUT(j)))
+			continue;
+		if (config->config.output_format[j].image.format &
+		    PISP_IMAGE_FORMAT_WALLPAPER_ROLL)
+			continue; /* TODO: Size checks for wallpaper formats */
+
+		fmt = &node_group->node[OUTPUT0_NODE + j].format;
+		for (unsigned int i = 0; i < fmt->fmt.pix_mp.num_planes; i++) {
+			bpl = !i ? config->config.output_format[j].image.stride
+			    : config->config.output_format[j].image.stride2;
+			size = bpl * config->config.output_format[j].image.height;
+
+			if (config->config.output_format[j].image.format &
+						PISP_IMAGE_FORMAT_SAMPLING_420)
+				size >>= 1;
+			if (fmt->fmt.pix_mp.plane_fmt[i].bytesperline < bpl) {
+				dev_err(dev, "%s: bpl mismatch on output %d\n",
+					__func__, j);
+				return -EINVAL;
+			}
+			if (fmt->fmt.pix_mp.plane_fmt[i].sizeimage < size) {
+				dev_err(dev, "%s: size mismatch on output\n",
+					__func__);
+				return -EINVAL;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int pispbe_node_queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
+				   unsigned int *nplanes, unsigned int sizes[],
+				   struct device *alloc_devs[])
+{
+	struct pispbe_node *node = vb2_get_drv_priv(q);
+	struct pispbe_dev *pispbe = node->node_group->pispbe;
+
+	*nplanes = 1;
+	if (NODE_IS_MPLANE(node)) {
+		*nplanes = node->format.fmt.pix_mp.num_planes;
+		for (unsigned int i = 0; i < *nplanes; i++) {
+			unsigned int size =
+				node->format.fmt.pix_mp.plane_fmt[i].sizeimage;
+			if (sizes[i] && sizes[i] < size) {
+				dev_err(pispbe->dev, "%s: size %u < %u\n",
+					__func__, sizes[i], size);
+				return -EINVAL;
+			}
+			sizes[i] = size;
+		}
+	} else if (NODE_IS_META(node)) {
+		sizes[0] = node->format.fmt.meta.buffersize;
+		/*
+		 * Limit the config node buffer count to the number of internal
+		 * buffers allocated.
+		 */
+		if (node->id == CONFIG_NODE)
+			*nbuffers = min_t(unsigned int, *nbuffers,
+					  PISP_BE_NUM_CONFIG_BUFFERS);
+	}
+
+	dev_dbg(pispbe->dev,
+		"Image (or metadata) size %u, nbuffers %u for node %s\n",
+		sizes[0], *nbuffers, NODE_NAME(node));
+
+	return 0;
+}
+
+static int pispbe_node_buffer_prepare(struct vb2_buffer *vb)
+{
+	struct pispbe_node *node = vb2_get_drv_priv(vb->vb2_queue);
+	struct pispbe_dev *pispbe = node->node_group->pispbe;
+	unsigned long size = 0;
+	unsigned int num_planes = NODE_IS_MPLANE(node)
+				? node->format.fmt.pix_mp.num_planes : 1;
+
+	for (unsigned int i = 0; i < num_planes; i++) {
+		size = NODE_IS_MPLANE(node)
+			? node->format.fmt.pix_mp.plane_fmt[i].sizeimage
+			: node->format.fmt.meta.buffersize;
+
+		if (vb2_plane_size(vb, i) < size) {
+			dev_err(pispbe->dev,
+				"data will not fit into plane %d (%lu < %lu)\n",
+				i, vb2_plane_size(vb, i), size);
+			return -EINVAL;
+		}
+
+		vb2_set_plane_payload(vb, i, size);
+	}
+
+	if (node->id == CONFIG_NODE) {
+		void *dst = &node->node_group->config[vb->index];
+		void *src = vb2_plane_vaddr(vb, 0);
+
+		memcpy(dst, src, sizeof(struct pisp_be_tiles_config));
+		return pisp_be_validate_config(node->node_group, dst);
+	}
+
+	return 0;
+}
+
+static void pispbe_node_buffer_queue(struct vb2_buffer *buf)
+{
+	struct vb2_v4l2_buffer *vbuf =
+		container_of(buf, struct vb2_v4l2_buffer, vb2_buf);
+	struct pispbe_buffer *buffer =
+		container_of(vbuf, struct pispbe_buffer, vb);
+	struct pispbe_node *node = vb2_get_drv_priv(buf->vb2_queue);
+	struct pispbe_node_group *node_group = node->node_group;
+	struct pispbe_dev *pispbe = node->node_group->pispbe;
+	unsigned long flags;
+
+	dev_dbg(pispbe->dev, "%s: for node %s\n", __func__, NODE_NAME(node));
+	spin_lock_irqsave(&node->ready_lock, flags);
+	list_add_tail(&buffer->ready_list, &node->ready_queue);
+	spin_unlock_irqrestore(&node->ready_lock, flags);
+
+	/*
+	 * Every time we add a buffer, check if there's now some work for the hw
+	 * to do, but only for this client.
+	 */
+	pispbe_schedule(node_group->pispbe, node_group, false);
+}
+
+static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct pispbe_node *node = vb2_get_drv_priv(q);
+	struct pispbe_node_group *node_group = node->node_group;
+	struct pispbe_dev *pispbe = node_group->pispbe;
+	unsigned long flags;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(pispbe->dev);
+	if (ret < 0)
+		return ret;
+
+	spin_lock_irqsave(&pispbe->hw_lock, flags);
+	node->node_group->streaming_map |=  BIT(node->id);
+	node->node_group->sequence = 0;
+	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
+
+	dev_dbg(pispbe->dev, "%s: for node %s (count %u)\n",
+		__func__, NODE_NAME(node), count);
+	dev_dbg(pispbe->dev, "Nodes streaming for this group now 0x%x\n",
+		node->node_group->streaming_map);
+
+	/* Maybe we're ready to run. */
+	pispbe_schedule(node_group->pispbe, node_group, false);
+
+	return 0;
+}
+
+static void pispbe_node_stop_streaming(struct vb2_queue *q)
+{
+	struct pispbe_node *node = vb2_get_drv_priv(q);
+	struct pispbe_node_group *node_group = node->node_group;
+	struct pispbe_dev *pispbe = node_group->pispbe;
+	struct pispbe_buffer *buf;
+	unsigned long flags;
+
+	/*
+	 * Now this is a bit awkward. In a simple M2M device we could just wait
+	 * for all queued jobs to complete, but here there's a risk that a
+	 * partial set of buffers was queued and cannot be run. For now, just
+	 * cancel all buffers stuck in the "ready queue", then wait for any
+	 * running job.
+	 *
+	 * This may return buffers out of order.
+	 */
+	dev_dbg(pispbe->dev, "%s: for node %s\n", __func__, NODE_NAME(node));
+	spin_lock_irqsave(&pispbe->hw_lock, flags);
+	do {
+		unsigned long flags1;
+
+		spin_lock_irqsave(&node->ready_lock, flags1);
+		buf = list_first_entry_or_null(&node->ready_queue,
+					       struct pispbe_buffer,
+					       ready_list);
+		if (buf) {
+			list_del(&buf->ready_list);
+			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		}
+		spin_unlock_irqrestore(&node->ready_lock, flags1);
+	} while (buf);
+	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
+
+	vb2_wait_for_all_buffers(&node->queue);
+
+	spin_lock_irqsave(&pispbe->hw_lock, flags);
+	node_group->streaming_map &= ~BIT(node->id);
+	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
+
+	pm_runtime_mark_last_busy(pispbe->dev);
+	pm_runtime_put_autosuspend(pispbe->dev);
+
+	dev_dbg(pispbe->dev, "Nodes streaming for this group now 0x%x\n",
+		node_group->streaming_map);
+}
+
+static const struct vb2_ops pispbe_node_queue_ops = {
+	.queue_setup = pispbe_node_queue_setup,
+	.buf_prepare = pispbe_node_buffer_prepare,
+	.buf_queue = pispbe_node_buffer_queue,
+	.start_streaming = pispbe_node_start_streaming,
+	.stop_streaming = pispbe_node_stop_streaming,
+};
+
+static const struct v4l2_file_operations pispbe_fops = {
+	.owner          = THIS_MODULE,
+	.open           = v4l2_fh_open,
+	.release        = vb2_fop_release,
+	.poll           = vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap           = vb2_fop_mmap
+};
+
+static int pispbe_node_querycap(struct file *file, void *priv,
+				struct v4l2_capability *cap)
+{
+	struct pispbe_node *node = video_drvdata(file);
+	struct pispbe_dev *pispbe = node->node_group->pispbe;
+
+	strscpy(cap->driver, PISPBE_NAME, sizeof(cap->driver));
+	strscpy(cap->card, PISPBE_NAME, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
+		 dev_name(pispbe->dev));
+
+	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
+			    V4L2_CAP_VIDEO_OUTPUT_MPLANE |
+			    V4L2_CAP_STREAMING | V4L2_CAP_DEVICE_CAPS |
+			    V4L2_CAP_META_OUTPUT;
+	cap->device_caps = node->vfd.device_caps;
+
+	dev_dbg(pispbe->dev, "Caps for node %s: %x and %x (dev %x)\n",
+		NODE_NAME(node), cap->capabilities, cap->device_caps,
+		node->vfd.device_caps);
+
+	return 0;
+}
+
+static int pispbe_node_g_fmt_vid_cap(struct file *file, void *priv,
+				     struct v4l2_format *f)
+{
+	struct pispbe_node *node = video_drvdata(file);
+	struct pispbe_dev *pispbe = node->node_group->pispbe;
+
+	if (!NODE_IS_CAPTURE(node) || NODE_IS_META(node)) {
+		dev_err(pispbe->dev,
+			"Cannot get capture fmt for output node %s\n",
+			NODE_NAME(node));
+		return -EINVAL;
+	}
+	*f = node->format;
+	dev_dbg(pispbe->dev, "Get capture format for node %s\n",
+		NODE_NAME(node));
+
+	return 0;
+}
+
+static int pispbe_node_g_fmt_vid_out(struct file *file, void *priv,
+				     struct v4l2_format *f)
+{
+	struct pispbe_node *node = video_drvdata(file);
+	struct pispbe_dev *pispbe = node->node_group->pispbe;
+
+	if (NODE_IS_CAPTURE(node) || NODE_IS_META(node)) {
+		dev_err(pispbe->dev,
+			"Cannot get capture fmt for output node %s\n",
+			 NODE_NAME(node));
+		return -EINVAL;
+	}
+	*f = node->format;
+	dev_dbg(pispbe->dev, "Get output format for node %s\n",
+		NODE_NAME(node));
+
+	return 0;
+}
+
+static int pispbe_node_g_fmt_meta_out(struct file *file, void *priv,
+				      struct v4l2_format *f)
+{
+	struct pispbe_node *node = video_drvdata(file);
+	struct pispbe_dev *pispbe = node->node_group->pispbe;
+
+	if (!NODE_IS_META(node) || NODE_IS_CAPTURE(node)) {
+		dev_err(pispbe->dev,
+			"Cannot get capture fmt for meta output node %s\n",
+			NODE_NAME(node));
+		return -EINVAL;
+	}
+	*f = node->format;
+	dev_dbg(pispbe->dev, "Get output format for meta node %s\n",
+		NODE_NAME(node));
+	return 0;
+}
+
+static const struct pisp_be_format *pispbe_find_fmt(unsigned int fourcc)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(supported_formats); i++) {
+		if (supported_formats[i].fourcc == fourcc)
+			return &supported_formats[i];
+	}
+
+	return NULL;
+}
+
+static void pispbe_set_plane_params(struct v4l2_format *f,
+				    const struct pisp_be_format *fmt)
+{
+	unsigned int nplanes = f->fmt.pix_mp.num_planes;
+	unsigned int total_plane_factor = 0;
+
+	for (unsigned int i = 0; i < PISPBE_MAX_PLANES; i++)
+		total_plane_factor += fmt->plane_factor[i];
+
+	for (unsigned int i = 0; i < nplanes; i++) {
+		struct v4l2_plane_pix_format *p = &f->fmt.pix_mp.plane_fmt[i];
+		unsigned int bpl, plane_size;
+
+		bpl = (f->fmt.pix_mp.width * fmt->bit_depth) >> 3;
+		bpl = ALIGN(max(p->bytesperline, bpl), fmt->align);
+
+		plane_size = bpl * f->fmt.pix_mp.height *
+		      (nplanes > 1 ? fmt->plane_factor[i] : total_plane_factor);
+		/*
+		 * The shift is to divide out the plane_factor fixed point
+		 * scaling of 8.
+		 */
+		plane_size = max(p->sizeimage, plane_size >> 3);
+
+		p->bytesperline = bpl;
+		p->sizeimage = plane_size;
+	}
+}
+
+static int pispbe_try_format(struct v4l2_format *f, struct pispbe_node *node)
+{
+	struct pispbe_dev *pispbe = node->node_group->pispbe;
+	u32 pixfmt = f->fmt.pix_mp.pixelformat;
+	const struct pisp_be_format *fmt;
+	bool is_rgb;
+
+	dev_dbg(pispbe->dev,
+		"%s: [%s] req %ux%u %p4cc, planes %d\n",
+		__func__, NODE_NAME(node), f->fmt.pix_mp.width,
+		f->fmt.pix_mp.height, &pixfmt,
+		f->fmt.pix_mp.num_planes);
+
+	fmt = pispbe_find_fmt(pixfmt);
+	if (!fmt) {
+		dev_dbg(pispbe->dev,
+			"%s: [%s] Format not found, defaulting to YUV420\n",
+			__func__, NODE_NAME(node));
+		fmt = pispbe_find_fmt(V4L2_PIX_FMT_YUV420);
+	}
+
+	f->fmt.pix_mp.pixelformat = fmt->fourcc;
+	f->fmt.pix_mp.num_planes = fmt->num_planes;
+	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	f->fmt.pix_mp.width = max(min(f->fmt.pix_mp.width, 65536u),
+				  PISP_BACK_END_MIN_TILE_WIDTH);
+	f->fmt.pix_mp.height = max(min(f->fmt.pix_mp.height, 65536u),
+				   PISP_BACK_END_MIN_TILE_HEIGHT);
+
+	/*
+	 * Fill in the actual colour space when the requested one was
+	 * not supported. This also catches the case when the "default"
+	 * colour space was requested (as that's never in the mask).
+	 */
+	if (!(V4L2_COLORSPACE_MASK(f->fmt.pix_mp.colorspace) &
+	    fmt->colorspace_mask))
+		f->fmt.pix_mp.colorspace = fmt->colorspace_default;
+
+	/* In all cases, we only support the defaults for these: */
+	f->fmt.pix_mp.ycbcr_enc =
+		V4L2_MAP_YCBCR_ENC_DEFAULT(f->fmt.pix_mp.colorspace);
+	f->fmt.pix_mp.xfer_func =
+		V4L2_MAP_XFER_FUNC_DEFAULT(f->fmt.pix_mp.colorspace);
+
+	is_rgb = f->fmt.pix_mp.colorspace == V4L2_COLORSPACE_SRGB;
+	f->fmt.pix_mp.quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(is_rgb, f->fmt.pix_mp.colorspace,
+					      f->fmt.pix_mp.ycbcr_enc);
+
+	/* Set plane size and bytes/line for each plane. */
+	pispbe_set_plane_params(f, fmt);
+
+	for (unsigned int i = 0; i < f->fmt.pix_mp.num_planes; i++) {
+		dev_dbg(pispbe->dev,
+			"%s: [%s] calc plane %d, %ux%u, depth %u, bpl %u size %u\n",
+			__func__, NODE_NAME(node), i, f->fmt.pix_mp.width,
+			f->fmt.pix_mp.height, fmt->bit_depth,
+			f->fmt.pix_mp.plane_fmt[i].bytesperline,
+			f->fmt.pix_mp.plane_fmt[i].sizeimage);
+	}
+
+	return 0;
+}
+
+static int pispbe_node_try_fmt_vid_cap(struct file *file, void *priv,
+				       struct v4l2_format *f)
+{
+	struct pispbe_node *node = video_drvdata(file);
+	struct pispbe_dev *pispbe = node->node_group->pispbe;
+	int ret;
+
+	if (!NODE_IS_CAPTURE(node) || NODE_IS_META(node)) {
+		dev_err(pispbe->dev,
+			"Cannot set capture fmt for output node %s\n",
+			NODE_NAME(node));
+		return -EINVAL;
+	}
+
+	ret = pispbe_try_format(f, node);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int pispbe_node_try_fmt_vid_out(struct file *file, void *priv,
+				       struct v4l2_format *f)
+{
+	struct pispbe_node *node = video_drvdata(file);
+	struct pispbe_dev *pispbe = node->node_group->pispbe;
+	int ret;
+
+	if (!NODE_IS_OUTPUT(node) || NODE_IS_META(node)) {
+		dev_err(pispbe->dev,
+			"Cannot set capture fmt for output node %s\n",
+			NODE_NAME(node));
+		return -EINVAL;
+	}
+
+	ret = pispbe_try_format(f, node);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int pispbe_node_try_fmt_meta_out(struct file *file, void *priv,
+					struct v4l2_format *f)
+{
+	struct pispbe_node *node = video_drvdata(file);
+	struct pispbe_dev *pispbe = node->node_group->pispbe;
+
+	if (!NODE_IS_META(node) || NODE_IS_CAPTURE(node)) {
+		dev_err(pispbe->dev,
+			"Cannot set capture fmt for meta output node %s\n",
+			NODE_NAME(node));
+		return -EINVAL;
+	}
+
+	f->fmt.meta.dataformat = V4L2_META_FMT_RPI_BE_CFG;
+	f->fmt.meta.buffersize = sizeof(struct pisp_be_tiles_config);
+
+	return 0;
+}
+
+static int pispbe_node_s_fmt_vid_cap(struct file *file, void *priv,
+				     struct v4l2_format *f)
+{
+	struct pispbe_node *node = video_drvdata(file);
+	struct pispbe_dev *pispbe = node->node_group->pispbe;
+	int ret = pispbe_node_try_fmt_vid_cap(file, priv, f);
+
+	if (ret < 0)
+		return ret;
+
+	node->format = *f;
+	node->pisp_format = pispbe_find_fmt(f->fmt.pix_mp.pixelformat);
+
+	dev_dbg(pispbe->dev, "Set capture format for node %s to %p4cc\n",
+		NODE_NAME(node), &f->fmt.pix_mp.pixelformat);
+
+	return 0;
+}
+
+static int pispbe_node_s_fmt_vid_out(struct file *file, void *priv,
+				     struct v4l2_format *f)
+{
+	struct pispbe_node *node = video_drvdata(file);
+	struct pispbe_dev *pispbe = node->node_group->pispbe;
+	int ret = pispbe_node_try_fmt_vid_out(file, priv, f);
+
+	if (ret < 0)
+		return ret;
+
+	node->format = *f;
+	node->pisp_format = pispbe_find_fmt(f->fmt.pix_mp.pixelformat);
+
+	dev_dbg(pispbe->dev, "Set output format for node %s to %p4cc\n",
+		NODE_NAME(node), &f->fmt.pix_mp.pixelformat);
+
+	return 0;
+}
+
+static int pispbe_node_s_fmt_meta_out(struct file *file, void *priv,
+				      struct v4l2_format *f)
+{
+	struct pispbe_node *node = video_drvdata(file);
+	struct pispbe_dev *pispbe = node->node_group->pispbe;
+	int ret = pispbe_node_try_fmt_meta_out(file, priv, f);
+
+	if (ret < 0)
+		return ret;
+
+	node->format = *f;
+	node->pisp_format = &meta_out_supported_formats[0];
+
+	dev_dbg(pispbe->dev, "Set output format for meta node %s to %p4cc\n",
+		NODE_NAME(node), &f->fmt.meta.dataformat);
+
+	return 0;
+}
+
+static int pispbe_node_enum_fmt(struct file *file, void  *priv,
+				struct v4l2_fmtdesc *f)
+{
+	struct pispbe_node *node = video_drvdata(file);
+
+	if (f->type != node->queue.type)
+		return -EINVAL;
+
+	if (NODE_IS_META(node)) {
+		if (f->index)
+			return -EINVAL;
+
+		f->pixelformat = V4L2_META_FMT_RPI_BE_CFG;
+		f->flags = 0;
+		return 0;
+	}
+
+	if (f->index >= ARRAY_SIZE(supported_formats))
+		return -EINVAL;
+
+	f->pixelformat = supported_formats[f->index].fourcc;
+	f->flags = 0;
+
+	return 0;
+}
+
+static int pispbe_enum_framesizes(struct file *file, void *priv,
+				  struct v4l2_frmsizeenum *fsize)
+{
+	struct pispbe_node *node = video_drvdata(file);
+	struct pispbe_dev *pispbe = node->node_group->pispbe;
+
+	if (NODE_IS_META(node) || fsize->index)
+		return -EINVAL;
+
+	if (!pispbe_find_fmt(fsize->pixel_format)) {
+		dev_dbg(pispbe->dev, "Invalid pixel code: %x\n",
+			fsize->pixel_format);
+		return -EINVAL;
+	}
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = 32;
+	fsize->stepwise.max_width = 65535;
+	fsize->stepwise.step_width = 2;
+
+	fsize->stepwise.min_height = 32;
+	fsize->stepwise.max_height = 65535;
+	fsize->stepwise.step_height = 2;
+
+	return 0;
+}
+
+static int pispbe_node_streamon(struct file *file, void *priv,
+				enum v4l2_buf_type type)
+{
+	struct pispbe_node *node = video_drvdata(file);
+	struct pispbe_dev *pispbe = node->node_group->pispbe;
+
+	/* Do we need a node->stream_lock mutex? */
+
+	dev_dbg(pispbe->dev, "Stream on for node %s\n", NODE_NAME(node));
+
+	/* Do we care about the type? Each node has only one queue. */
+
+	INIT_LIST_HEAD(&node->ready_queue);
+
+	/* locking should be handled by the queue->lock? */
+	return vb2_streamon(&node->queue, type);
+}
+
+static int pispbe_node_streamoff(struct file *file, void *priv,
+				 enum v4l2_buf_type type)
+{
+	struct pispbe_node *node = video_drvdata(file);
+
+	return vb2_streamoff(&node->queue, type);
+}
+
+static const struct v4l2_ioctl_ops pispbe_node_ioctl_ops = {
+	.vidioc_querycap = pispbe_node_querycap,
+	.vidioc_g_fmt_vid_cap_mplane = pispbe_node_g_fmt_vid_cap,
+	.vidioc_g_fmt_vid_out_mplane = pispbe_node_g_fmt_vid_out,
+	.vidioc_g_fmt_meta_out = pispbe_node_g_fmt_meta_out,
+	.vidioc_try_fmt_vid_cap_mplane = pispbe_node_try_fmt_vid_cap,
+	.vidioc_try_fmt_vid_out_mplane = pispbe_node_try_fmt_vid_out,
+	.vidioc_try_fmt_meta_out = pispbe_node_try_fmt_meta_out,
+	.vidioc_s_fmt_vid_cap_mplane = pispbe_node_s_fmt_vid_cap,
+	.vidioc_s_fmt_vid_out_mplane = pispbe_node_s_fmt_vid_out,
+	.vidioc_s_fmt_meta_out = pispbe_node_s_fmt_meta_out,
+	.vidioc_enum_fmt_vid_cap = pispbe_node_enum_fmt,
+	.vidioc_enum_fmt_vid_out = pispbe_node_enum_fmt,
+	.vidioc_enum_fmt_meta_out = pispbe_node_enum_fmt,
+	.vidioc_enum_framesizes = pispbe_enum_framesizes,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_streamon = pispbe_node_streamon,
+	.vidioc_streamoff = pispbe_node_streamoff,
+};
+
+static const struct video_device pispbe_videodev = {
+	.name = PISPBE_NAME,
+	.vfl_dir = VFL_DIR_M2M, /* gets overwritten */
+	.fops = &pispbe_fops,
+	.ioctl_ops = &pispbe_node_ioctl_ops,
+	.minor = -1,
+	.release = video_device_release_empty,
+};
+
+static void pispbe_node_def_fmt(struct pispbe_node *node)
+{
+	if (NODE_IS_META(node) && NODE_IS_OUTPUT(node)) {
+		/* Config node */
+		struct v4l2_format *f = &node->format;
+
+		f->fmt.meta.dataformat = V4L2_META_FMT_RPI_BE_CFG;
+		f->fmt.meta.buffersize = sizeof(struct pisp_be_tiles_config);
+		f->type = node->buf_type;
+	} else {
+		struct v4l2_format f = {0};
+
+		f.fmt.pix_mp.pixelformat = V4L2_PIX_FMT_YUV420;
+		f.fmt.pix_mp.width = 1920;
+		f.fmt.pix_mp.height = 1080;
+		f.type = node->buf_type;
+		pispbe_try_format(&f, node);
+		node->format = f;
+	}
+
+	node->pisp_format = pispbe_find_fmt(node->format.fmt.pix_mp.pixelformat);
+}
+
+/*
+ * Initialise a struct pispbe_node and register it as /dev/video<N>
+ * to represent one of the PiSP Back End's input or output streams.
+ */
+static int pispbe_init_node(struct pispbe_node_group *node_group,
+			    unsigned int id)
+{
+	bool output = NODE_DESC_IS_OUTPUT(&node_desc[id]);
+	struct pispbe_node *node = &node_group->node[id];
+	struct media_entity *entity = &node->vfd.entity;
+	struct pispbe_dev *pispbe = node_group->pispbe;
+	struct video_device *vdev = &node->vfd;
+	struct vb2_queue *q = &node->queue;
+	int ret;
+
+	node->id = id;
+	node->node_group = node_group;
+	node->buf_type = node_desc[id].buf_type;
+
+	mutex_init(&node->node_lock);
+	mutex_init(&node->queue_lock);
+	INIT_LIST_HEAD(&node->ready_queue);
+	spin_lock_init(&node->ready_lock);
+
+	node->format.type = node->buf_type;
+	pispbe_node_def_fmt(node);
+
+	q->type = node->buf_type;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->drv_priv = node;
+	q->ops = &pispbe_node_queue_ops;
+	q->buf_struct_size = sizeof(struct pispbe_buffer);
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->dev = node->node_group->pispbe->dev;
+	/* get V4L2 to handle node->queue locking */
+	q->lock = &node->queue_lock;
+
+	ret = vb2_queue_init(q);
+	if (ret < 0) {
+		dev_err(pispbe->dev, "vb2_queue_init failed\n");
+		goto err_mutex_destroy;
+	}
+
+	*vdev = pispbe_videodev; /* default initialization */
+	strscpy(vdev->name, node_desc[id].ent_name, sizeof(vdev->name));
+	vdev->v4l2_dev = &node_group->v4l2_dev;
+	vdev->vfl_dir = output ? VFL_DIR_TX : VFL_DIR_RX;
+	/* get V4L2 to serialise our ioctls */
+	vdev->lock = &node->node_lock;
+	vdev->queue = &node->queue;
+	vdev->device_caps = V4L2_CAP_STREAMING | node_desc[id].caps;
+
+	node->pad.flags = output ? MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(entity, 1, &node->pad);
+	if (ret) {
+		dev_err(pispbe->dev,
+			"Failed to register media pads for %s device node\n",
+			NODE_NAME(node));
+		goto err_unregister_queue;
+	}
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(pispbe->dev,
+			"Failed to register video %s device node\n",
+			NODE_NAME(node));
+		goto err_unregister_queue;
+	}
+	video_set_drvdata(vdev, node);
+
+	if (output)
+		ret = media_create_pad_link(entity, 0, &node_group->sd.entity,
+					    id, MEDIA_LNK_FL_IMMUTABLE |
+					    MEDIA_LNK_FL_ENABLED);
+	else
+		ret = media_create_pad_link(&node_group->sd.entity, id, entity,
+					    0, MEDIA_LNK_FL_IMMUTABLE |
+					    MEDIA_LNK_FL_ENABLED);
+	if (ret)
+		goto err_unregister_video_dev;
+
+	dev_dbg(pispbe->dev, "%s device node registered as /dev/video%d\n",
+		NODE_NAME(node), node->vfd.num);
+
+	return 0;
+
+err_unregister_video_dev:
+	video_unregister_device(&node->vfd);
+err_unregister_queue:
+	vb2_queue_release(&node->queue);
+err_mutex_destroy:
+	mutex_destroy(&node->node_lock);
+	mutex_destroy(&node->queue_lock);
+	return ret;
+}
+
+static const struct v4l2_subdev_pad_ops pispbe_pad_ops = {
+	.link_validate = v4l2_subdev_link_validate_default,
+};
+
+static const struct v4l2_subdev_ops pispbe_sd_ops = {
+	.pad = &pispbe_pad_ops,
+};
+
+static int pispbe_init_subdev(struct pispbe_node_group *node_group)
+{
+	struct pispbe_dev *pispbe = node_group->pispbe;
+	struct v4l2_subdev *sd = &node_group->sd;
+	int ret;
+
+	v4l2_subdev_init(sd, &pispbe_sd_ops);
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	sd->owner = THIS_MODULE;
+	sd->dev = pispbe->dev;
+	strscpy(sd->name, PISPBE_NAME, sizeof(sd->name));
+
+	for (unsigned int i = 0; i < PISPBE_NUM_NODES; i++)
+		node_group->pad[i].flags =
+			NODE_DESC_IS_OUTPUT(&node_desc[i]) ?
+			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&sd->entity, PISPBE_NUM_NODES,
+				     node_group->pad);
+	if (ret)
+		goto error;
+
+	ret = v4l2_device_register_subdev(&node_group->v4l2_dev, sd);
+	if (ret)
+		goto error;
+
+	return 0;
+
+error:
+	media_entity_cleanup(&sd->entity);
+	return ret;
+}
+
+static int pispbe_init_group(struct pispbe_dev *pispbe, unsigned int id)
+{
+	struct pispbe_node_group *node_group = &pispbe->node_group[id];
+	unsigned int num_registered = 0;
+	struct v4l2_device *v4l2_dev;
+	struct media_device *mdev;
+	int ret;
+
+	node_group->id = id;
+	node_group->pispbe = pispbe;
+	node_group->streaming_map = 0;
+
+	dev_dbg(pispbe->dev, "Register nodes for group %u\n", id);
+
+	/* Register v4l2_device and media_device */
+	mdev = &node_group->mdev;
+	mdev->hw_revision = node_group->pispbe->hw_version;
+	mdev->dev = node_group->pispbe->dev;
+	strscpy(mdev->model, PISPBE_NAME, sizeof(mdev->model));
+	snprintf(mdev->bus_info, sizeof(mdev->bus_info),
+		 "platform:%s", dev_name(node_group->pispbe->dev));
+	media_device_init(mdev);
+
+	v4l2_dev = &node_group->v4l2_dev;
+	v4l2_dev->mdev = &node_group->mdev;
+	strscpy(v4l2_dev->name, PISPBE_NAME, sizeof(v4l2_dev->name));
+
+	ret = v4l2_device_register(pispbe->dev, &node_group->v4l2_dev);
+	if (ret)
+		goto err_media_dev_cleanup;
+
+	/* Register the PISPBE subdevice. */
+	ret = pispbe_init_subdev(node_group);
+	if (ret)
+		goto err_unregister_v4l2;
+
+	/* Create device video nodes */
+	for (; num_registered < PISPBE_NUM_NODES; num_registered++) {
+		ret = pispbe_init_node(node_group, num_registered);
+		if (ret)
+			goto err_unregister_nodes;
+	}
+
+	ret = media_device_register(mdev);
+	if (ret)
+		goto err_unregister_nodes;
+
+	node_group->config =
+		dma_alloc_coherent(pispbe->dev,
+				   sizeof(struct pisp_be_tiles_config) *
+					PISP_BE_NUM_CONFIG_BUFFERS,
+				   &node_group->config_dma_addr, GFP_KERNEL);
+	if (!node_group->config) {
+		dev_err(pispbe->dev, "Unable to allocate cached config buffers.\n");
+		ret = -ENOMEM;
+		goto err_unregister_mdev;
+	}
+
+	return 0;
+
+err_unregister_mdev:
+	media_device_unregister(mdev);
+err_unregister_nodes:
+	while (num_registered-- > 0) {
+		video_unregister_device(&node_group->node[num_registered].vfd);
+		vb2_queue_release(&node_group->node[num_registered].queue);
+	}
+	v4l2_device_unregister_subdev(&node_group->sd);
+	media_entity_cleanup(&node_group->sd.entity);
+err_unregister_v4l2:
+	v4l2_device_unregister(v4l2_dev);
+err_media_dev_cleanup:
+	media_device_cleanup(mdev);
+	return ret;
+}
+
+static void pispbe_destroy_node_group(struct pispbe_node_group *node_group)
+{
+	struct pispbe_dev *pispbe = node_group->pispbe;
+
+	if (node_group->config) {
+		dma_free_coherent(node_group->pispbe->dev,
+				  sizeof(struct pisp_be_tiles_config) *
+					PISP_BE_NUM_CONFIG_BUFFERS,
+				  node_group->config,
+				  node_group->config_dma_addr);
+	}
+
+	dev_dbg(pispbe->dev, "Unregister from media controller\n");
+
+	v4l2_device_unregister_subdev(&node_group->sd);
+	media_entity_cleanup(&node_group->sd.entity);
+	media_device_unregister(&node_group->mdev);
+
+	for (int i = PISPBE_NUM_NODES - 1; i >= 0; i--) {
+		video_unregister_device(&node_group->node[i].vfd);
+		vb2_queue_release(&node_group->node[i].queue);
+		mutex_destroy(&node_group->node[i].node_lock);
+		mutex_destroy(&node_group->node[i].queue_lock);
+	}
+
+	media_device_cleanup(&node_group->mdev);
+	v4l2_device_unregister(&node_group->v4l2_dev);
+}
+
+static int pispbe_runtime_suspend(struct device *dev)
+{
+	struct pispbe_dev *pispbe = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(pispbe->clk);
+
+	return 0;
+}
+
+static int pispbe_runtime_resume(struct device *dev)
+{
+	struct pispbe_dev *pispbe = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(pispbe->clk);
+	if (ret) {
+		dev_err(dev, "Unable to enable clock\n");
+		return ret;
+	}
+
+	dev_dbg(dev, "%s: Enabled clock, rate=%lu\n",
+		__func__, clk_get_rate(pispbe->clk));
+
+	return 0;
+}
+
+static int pispbe_hw_init(struct pispbe_dev *pispbe)
+{
+	u32 u;
+
+	/* Check the HW is present and has a known version */
+	u = pispbe_rd(pispbe, PISP_BE_VERSION_REG);
+	dev_dbg(pispbe->dev, "pispbe_probe: HW version:  0x%08x", u);
+	pispbe->hw_version = u;
+	if ((u & ~PISP_BE_VERSION_MINOR_BITS) != PISP_BE_VERSION_2712)
+		return -ENODEV;
+
+	/* Clear leftover interrupts */
+	pispbe_wr(pispbe, PISP_BE_INTERRUPT_STATUS_REG, 0xFFFFFFFFu);
+	u = pispbe_rd(pispbe, PISP_BE_BATCH_STATUS_REG);
+	dev_dbg(pispbe->dev, "pispbe_probe: BatchStatus: 0x%08x", u);
+	pispbe->done = (uint8_t)u;
+	pispbe->started = (uint8_t)(u >> 8);
+	u = pispbe_rd(pispbe, PISP_BE_STATUS_REG);
+	dev_dbg(pispbe->dev, "pispbe_probe: Status:      0x%08x", u);
+	if (u != 0 || pispbe->done != pispbe->started) {
+		dev_err(pispbe->dev, "pispbe_probe: HW is stuck or busy\n");
+		return -EBUSY;
+	}
+	/*
+	 * AXI QOS=0, CACHE=4'b0010, PROT=3'b011
+	 * Also set "chicken bits" 22:20 which enable sub-64-byte bursts
+	 * and AXI AWID/BID variability (on versions which support this).
+	 */
+	pispbe_wr(pispbe, PISP_BE_AXI_REG, 0x32703200u);
+
+	/* Enable both interrupt flags */
+	pispbe_wr(pispbe, PISP_BE_INTERRUPT_EN_REG, 0x00000003u);
+	return 0;
+}
+
+/*
+ * Probe the ISP-BE hardware block, as a single platform device.
+ * This will instantiate multiple "node groups" each with many device nodes.
+ */
+static int pispbe_probe(struct platform_device *pdev)
+{
+	unsigned int num_groups = 0;
+	struct pispbe_dev *pispbe;
+	int ret;
+
+	pispbe = devm_kzalloc(&pdev->dev, sizeof(*pispbe), GFP_KERNEL);
+	if (!pispbe)
+		return -ENOMEM;
+
+	dev_set_drvdata(&pdev->dev, pispbe);
+	pispbe->dev = &pdev->dev;
+	platform_set_drvdata(pdev, pispbe);
+
+	pispbe->be_reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pispbe->be_reg_base)) {
+		dev_err(&pdev->dev, "Failed to get ISP-BE registers address\n");
+		return PTR_ERR(pispbe->be_reg_base);
+	}
+
+	pispbe->irq = platform_get_irq(pdev, 0);
+	if (pispbe->irq <= 0) {
+		dev_err(&pdev->dev, "No IRQ resource\n");
+		return -EINVAL;
+	}
+
+	ret = devm_request_irq(&pdev->dev, pispbe->irq, pispbe_isr, 0,
+			       PISPBE_NAME, pispbe);
+	if (ret) {
+		dev_err(&pdev->dev, "Unable to request interrupt\n");
+		return ret;
+	}
+
+	ret = dma_set_mask_and_coherent(pispbe->dev, DMA_BIT_MASK(36));
+	if (ret)
+		return ret;
+
+	pispbe->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(pispbe->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(pispbe->clk),
+				     "Failed to get clock");
+
+	/* Hardware initialisation */
+	pm_runtime_set_autosuspend_delay(pispbe->dev, 200);
+	pm_runtime_use_autosuspend(pispbe->dev);
+	pm_runtime_enable(pispbe->dev);
+
+	ret = pm_runtime_resume_and_get(pispbe->dev);
+	if (ret)
+		goto pm_runtime_disable_err;
+
+	pispbe->hw_busy = 0;
+	spin_lock_init(&pispbe->hw_lock);
+	ret = pispbe_hw_init(pispbe);
+	if (ret)
+		goto pm_runtime_put_err;
+
+	/*
+	 * Initialise and register devices for each node_group, including media
+	 * device
+	 */
+	for (num_groups = 0;
+	     num_groups < PISPBE_NUM_NODE_GROUPS;
+	     num_groups++) {
+		ret = pispbe_init_group(pispbe, num_groups);
+		if (ret)
+			goto disable_nodes_err;
+	}
+
+	pm_runtime_mark_last_busy(pispbe->dev);
+	pm_runtime_put_autosuspend(pispbe->dev);
+
+	return 0;
+
+disable_nodes_err:
+	while (num_groups-- > 0)
+		pispbe_destroy_node_group(&pispbe->node_group[num_groups]);
+pm_runtime_put_err:
+	pm_runtime_put(pispbe->dev);
+pm_runtime_disable_err:
+	pm_runtime_dont_use_autosuspend(pispbe->dev);
+	pm_runtime_disable(pispbe->dev);
+
+	dev_err(&pdev->dev, "%s: returning %d", __func__, ret);
+
+	return ret;
+}
+
+static int pispbe_remove(struct platform_device *pdev)
+{
+	struct pispbe_dev *pispbe = platform_get_drvdata(pdev);
+
+	for (int i = PISPBE_NUM_NODE_GROUPS - 1; i >= 0; i--)
+		pispbe_destroy_node_group(&pispbe->node_group[i]);
+
+	pm_runtime_dont_use_autosuspend(pispbe->dev);
+	pm_runtime_disable(pispbe->dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops pispbe_pm_ops = {
+	SET_RUNTIME_PM_OPS(pispbe_runtime_suspend, pispbe_runtime_resume, NULL)
+};
+
+static const struct of_device_id pispbe_of_match[] = {
+	{
+		.compatible = "raspberrypi,pispbe",
+	},
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, pispbe_of_match);
+
+static struct platform_driver pispbe_pdrv = {
+	.probe		= pispbe_probe,
+	.remove		= pispbe_remove,
+	.driver		= {
+		.name	= PISPBE_NAME,
+		.of_match_table = pispbe_of_match,
+		.pm = &pispbe_pm_ops,
+	},
+};
+
+module_platform_driver(pispbe_pdrv);
+
+MODULE_DESCRIPTION("PiSP Back End driver");
+MODULE_AUTHOR("David Plowman <david.plowman@raspberrypi.com>");
+MODULE_AUTHOR("Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h b/drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h
new file mode 100644
index 000000000000..ebd320c9888c
--- /dev/null
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h
@@ -0,0 +1,519 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * PiSP Back End driver image format definitions.
+ *
+ * Copyright (c) 2021 Raspberry Pi Ltd
+ */
+
+#ifndef _PISP_BE_FORMATS_
+#define _PISP_BE_FORMATS_
+
+#include <linux/bits.h>
+#include <linux/videodev2.h>
+
+#define PISPBE_MAX_PLANES	3
+#define P3(x)			((x) * 8)
+
+struct pisp_be_format {
+	unsigned int fourcc;
+	unsigned int align;
+	unsigned int bit_depth;
+	/* 0P3 factor for plane sizing */
+	unsigned int plane_factor[PISPBE_MAX_PLANES];
+	unsigned int num_planes;
+	unsigned int colorspace_mask;
+	enum v4l2_colorspace colorspace_default;
+};
+
+#define V4L2_COLORSPACE_MASK(colorspace) BIT(colorspace)
+
+#define V4L2_COLORSPACE_MASK_JPEG	\
+	V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_JPEG)
+#define V4L2_COLORSPACE_MASK_SMPTE170M	\
+	V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_SMPTE170M)
+#define V4L2_COLORSPACE_MASK_REC709	\
+	V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_REC709)
+#define V4L2_COLORSPACE_MASK_SRGB	\
+	V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_SRGB)
+#define V4L2_COLORSPACE_MASK_RAW	\
+	V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_RAW)
+
+/*
+ * All three colour spaces SRGB, SMPTE170M and REC709 are fundamentally sRGB
+ * underneath (as near as makes no difference to us), just with different YCbCr
+ * encodings. Therefore the ISP can generate sRGB on its main output and any of
+ * the others on its low resolution output. Applications should, when using both
+ * outputs, program the colour spaces on them to be the same, matching whatever
+ * is requested for the low resolution output, even if the main output is
+ * producing an RGB format. In turn this requires us to allow all these colour
+ * spaces for every YUV/RGB output format.
+ */
+#define V4L2_COLORSPACE_MASK_ALL_SRGB (V4L2_COLORSPACE_MASK_JPEG	| \
+				       V4L2_COLORSPACE_MASK_SRGB	| \
+				       V4L2_COLORSPACE_MASK_SMPTE170M	| \
+				       V4L2_COLORSPACE_MASK_REC709)
+
+static const struct pisp_be_format supported_formats[] = {
+	/* Single plane YUV formats */
+	{
+		.fourcc		    = V4L2_PIX_FMT_YUV420,
+		/* 128 alignment to ensure U/V planes are 64 byte aligned. */
+		.align		    = 128,
+		.bit_depth	    = 8,
+		.plane_factor	    = { P3(1), P3(0.25), P3(0.25) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_YVU420,
+		/* 128 alignment to ensure U/V planes are 64 byte aligned. */
+		.align		    = 128,
+		.bit_depth	    = 8,
+		.plane_factor	    = { P3(1), P3(0.25), P3(0.25) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_NV12,
+		.align		    = 32,
+		.bit_depth	    = 8,
+		.plane_factor	    = { P3(1), P3(0.5) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_NV21,
+		.align		    = 32,
+		.bit_depth	    = 8,
+		.plane_factor	    = { P3(1), P3(0.5) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_YUYV,
+		.align		    = 64,
+		.bit_depth	    = 16,
+		.plane_factor	    = { P3(1) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_UYVY,
+		.align		    = 64,
+		.bit_depth	    = 16,
+		.plane_factor	    = { P3(1) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_YVYU,
+		.align		    = 64,
+		.bit_depth	    = 16,
+		.plane_factor	    = { P3(1) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_VYUY,
+		.align		    = 64,
+		.bit_depth	    = 16,
+		.plane_factor	    = { P3(1) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+	},
+	/* Multiplane YUV formats */
+	{
+		.fourcc		    = V4L2_PIX_FMT_YUV420M,
+		.align		    = 64,
+		.bit_depth	    = 8,
+		.plane_factor	    = { P3(1), P3(0.25), P3(0.25) },
+		.num_planes	    = 3,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_NV12M,
+		.align		    = 32,
+		.bit_depth	    = 8,
+		.plane_factor	    = { P3(1), P3(0.5) },
+		.num_planes	    = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_NV21M,
+		.align		    = 32,
+		.bit_depth	    = 8,
+		.plane_factor	    = { P3(1), P3(0.5) },
+		.num_planes	    = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_YVU420M,
+		.align		    = 64,
+		.bit_depth	    = 8,
+		.plane_factor	    = { P3(1), P3(0.25), P3(0.25) },
+		.num_planes	    = 3,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_YUV422M,
+		.align		    = 64,
+		.bit_depth	    = 8,
+		.plane_factor	    = { P3(1), P3(0.5), P3(0.5) },
+		.num_planes	    = 3,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_YVU422M,
+		.align		    = 64,
+		.bit_depth	    = 8,
+		.plane_factor	    = { P3(1), P3(0.5), P3(0.5) },
+		.num_planes	    = 3,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_YUV444M,
+		.align		    = 64,
+		.bit_depth	    = 8,
+		.plane_factor	    = { P3(1), P3(1), P3(1) },
+		.num_planes	    = 3,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_YVU444M,
+		.align		    = 64,
+		.bit_depth	    = 8,
+		.plane_factor	    = { P3(1), P3(1), P3(1) },
+		.num_planes	    = 3,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+	},
+	/* RGB formats */
+	{
+		.fourcc		    = V4L2_PIX_FMT_RGB24,
+		.align		    = 32,
+		.bit_depth	    = 24,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SRGB,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_BGR24,
+		.align		    = 32,
+		.bit_depth	    = 24,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SRGB,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_XBGR32,
+		.align		    = 64,
+		.bit_depth	    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SRGB,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_RGBX32,
+		.align		    = 64,
+		.bit_depth	    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SRGB,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_RGB48,
+		.align		    = 64,
+		.bit_depth	    = 48,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SRGB,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_BGR48,
+		.align		    = 64,
+		.bit_depth	    = 48,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SRGB,
+	},
+	/* Bayer formats - 8-bit */
+	{
+		.fourcc		    = V4L2_PIX_FMT_SRGGB8,
+		.bit_depth	    = 8,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_SBGGR8,
+		.bit_depth	    = 8,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_SGRBG8,
+		.bit_depth	    = 8,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_SGBRG8,
+		.bit_depth	    = 8,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	/* Bayer formats - 16-bit */
+	{
+		.fourcc		    = V4L2_PIX_FMT_SRGGB16,
+		.bit_depth	    = 16,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_SBGGR16,
+		.bit_depth	    = 16,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_SGRBG16,
+		.bit_depth	    = 16,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_SGBRG16,
+		.bit_depth	    = 16,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		/* Bayer formats unpacked to 16bpp */
+		/* 10 bit */
+		.fourcc		    = V4L2_PIX_FMT_SRGGB10,
+		.bit_depth	    = 16,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_SBGGR10,
+		.bit_depth	    = 16,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_SGRBG10,
+		.bit_depth	    = 16,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_SGBRG10,
+		.bit_depth	    = 16,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		/* 12 bit */
+		.fourcc		    = V4L2_PIX_FMT_SRGGB12,
+		.bit_depth	    = 16,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_SBGGR12,
+		.bit_depth	    = 16,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_SGRBG12,
+		.bit_depth	    = 16,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_SGBRG12,
+		.bit_depth	    = 16,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		/* 14 bit */
+		.fourcc		    = V4L2_PIX_FMT_SRGGB14,
+		.bit_depth	    = 16,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_SBGGR14,
+		.bit_depth	    = 16,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_SGRBG14,
+		.bit_depth	    = 16,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_SGBRG14,
+		.bit_depth	    = 16,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	/* Bayer formats - 16-bit PiSP Compressed */
+	{
+		.fourcc		    = V4L2_PIX_FMT_PISP_COMP1_BGGR,
+		.bit_depth	    = 8,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_PISP_COMP1_RGGB,
+		.bit_depth	    = 8,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_PISP_COMP1_GRBG,
+		.bit_depth	    = 8,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_PISP_COMP1_GBRG,
+		.bit_depth	    = 8,
+		.align		    = 32,
+		.plane_factor	    = { P3(1.0) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	/* Greyscale Formats */
+	{
+		.fourcc		= V4L2_PIX_FMT_GREY,
+		.bit_depth	= 8,
+		.align		= 32,
+		.num_planes	= 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_Y16,
+		.bit_depth	= 16,
+		.align		= 32,
+		.plane_factor	= { P3(1.0) },
+		.num_planes	= 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_PISP_COMP1_MONO,
+		.bit_depth	= 8,
+		.align		= 32,
+		.plane_factor	= { P3(1.0) },
+		.num_planes	= 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+	},
+};
+
+static const struct pisp_be_format meta_out_supported_formats[] = {
+	/* Configuration buffer format. */
+	{
+		.fourcc		    = V4L2_META_FMT_RPI_BE_CFG,
+	},
+};
+
+#endif /* _PISP_BE_FORMATS_ */
diff --git a/include/uapi/linux/media/raspberrypi/pisp_be_config.h b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
new file mode 100644
index 000000000000..623ac3948426
--- /dev/null
+++ b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
@@ -0,0 +1,531 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * PiSP Back End configuration definitions.
+ *
+ * Copyright (C) 2021 - Raspberry Pi Ltd
+ *
+ */
+#ifndef _UAPI_PISP_BE_CONFIG_H_
+#define _UAPI_PISP_BE_CONFIG_H_
+
+#include <linux/types.h>
+
+#include "pisp_common.h"
+
+/* byte alignment for inputs */
+#define PISP_BACK_END_INPUT_ALIGN 4u
+/* alignment for compressed inputs */
+#define PISP_BACK_END_COMPRESSED_ALIGN 8u
+/* minimum required byte alignment for outputs */
+#define PISP_BACK_END_OUTPUT_MIN_ALIGN 16u
+/* preferred byte alignment for outputs */
+#define PISP_BACK_END_OUTPUT_MAX_ALIGN 64u
+
+/* minimum allowed tile width anywhere in the pipeline */
+#define PISP_BACK_END_MIN_TILE_WIDTH 16u
+/* minimum allowed tile width anywhere in the pipeline */
+#define PISP_BACK_END_MIN_TILE_HEIGHT 16u
+
+#define PISP_BACK_END_NUM_OUTPUTS 2
+#define PISP_BACK_END_HOG_OUTPUT 1
+
+#define PISP_BACK_END_NUM_TILES 64
+
+enum pisp_be_bayer_enable {
+	PISP_BE_BAYER_ENABLE_INPUT = 0x000001,
+	PISP_BE_BAYER_ENABLE_DECOMPRESS = 0x000002,
+	PISP_BE_BAYER_ENABLE_DPC = 0x000004,
+	PISP_BE_BAYER_ENABLE_GEQ = 0x000008,
+	PISP_BE_BAYER_ENABLE_TDN_INPUT = 0x000010,
+	PISP_BE_BAYER_ENABLE_TDN_DECOMPRESS = 0x000020,
+	PISP_BE_BAYER_ENABLE_TDN = 0x000040,
+	PISP_BE_BAYER_ENABLE_TDN_COMPRESS = 0x000080,
+	PISP_BE_BAYER_ENABLE_TDN_OUTPUT = 0x000100,
+	PISP_BE_BAYER_ENABLE_SDN = 0x000200,
+	PISP_BE_BAYER_ENABLE_BLC = 0x000400,
+	PISP_BE_BAYER_ENABLE_STITCH_INPUT = 0x000800,
+	PISP_BE_BAYER_ENABLE_STITCH_DECOMPRESS = 0x001000,
+	PISP_BE_BAYER_ENABLE_STITCH = 0x002000,
+	PISP_BE_BAYER_ENABLE_STITCH_COMPRESS = 0x004000,
+	PISP_BE_BAYER_ENABLE_STITCH_OUTPUT = 0x008000,
+	PISP_BE_BAYER_ENABLE_WBG = 0x010000,
+	PISP_BE_BAYER_ENABLE_CDN = 0x020000,
+	PISP_BE_BAYER_ENABLE_LSC = 0x040000,
+	PISP_BE_BAYER_ENABLE_TONEMAP = 0x080000,
+	PISP_BE_BAYER_ENABLE_CAC = 0x100000,
+	PISP_BE_BAYER_ENABLE_DEBIN = 0x200000,
+	PISP_BE_BAYER_ENABLE_DEMOSAIC = 0x400000,
+};
+
+enum pisp_be_rgb_enable {
+	PISP_BE_RGB_ENABLE_INPUT = 0x000001,
+	PISP_BE_RGB_ENABLE_CCM = 0x000002,
+	PISP_BE_RGB_ENABLE_SAT_CONTROL = 0x000004,
+	PISP_BE_RGB_ENABLE_YCBCR = 0x000008,
+	PISP_BE_RGB_ENABLE_FALSE_COLOUR = 0x000010,
+	PISP_BE_RGB_ENABLE_SHARPEN = 0x000020,
+	/* Preferred colours would occupy 0x000040 */
+	PISP_BE_RGB_ENABLE_YCBCR_INVERSE = 0x000080,
+	PISP_BE_RGB_ENABLE_GAMMA = 0x000100,
+	PISP_BE_RGB_ENABLE_CSC0 = 0x000200,
+	PISP_BE_RGB_ENABLE_CSC1 = 0x000400,
+	PISP_BE_RGB_ENABLE_DOWNSCALE0 = 0x001000,
+	PISP_BE_RGB_ENABLE_DOWNSCALE1 = 0x002000,
+	PISP_BE_RGB_ENABLE_RESAMPLE0 = 0x008000,
+	PISP_BE_RGB_ENABLE_RESAMPLE1 = 0x010000,
+	PISP_BE_RGB_ENABLE_OUTPUT0 = 0x040000,
+	PISP_BE_RGB_ENABLE_OUTPUT1 = 0x080000,
+	PISP_BE_RGB_ENABLE_HOG = 0x200000
+};
+
+#define PISP_BE_RGB_ENABLE_CSC(i) (PISP_BE_RGB_ENABLE_CSC0 << (i))
+#define PISP_BE_RGB_ENABLE_DOWNSCALE(i) (PISP_BE_RGB_ENABLE_DOWNSCALE0 << (i))
+#define PISP_BE_RGB_ENABLE_RESAMPLE(i) (PISP_BE_RGB_ENABLE_RESAMPLE0 << (i))
+#define PISP_BE_RGB_ENABLE_OUTPUT(i) (PISP_BE_RGB_ENABLE_OUTPUT0 << (i))
+
+/*
+ * We use the enable flags to show when blocks are "dirty", but we need some
+ * extra ones too.
+ */
+enum pisp_be_dirty {
+	PISP_BE_DIRTY_GLOBAL = 0x0001,
+	PISP_BE_DIRTY_SH_FC_COMBINE = 0x0002,
+	PISP_BE_DIRTY_CROP = 0x0004
+};
+
+struct pisp_be_global_config {
+	__u32 bayer_enables;
+	__u32 rgb_enables;
+	__u8 bayer_order;
+	__u8 pad[3];
+} __attribute__((packed));
+
+struct pisp_be_input_buffer_config {
+	/* low 32 bits followed by high 32 bits (for each of up to 3 planes) */
+	__u32 addr[3][2];
+} __attribute__((packed));
+
+struct pisp_be_dpc_config {
+	__u8 coeff_level;
+	__u8 coeff_range;
+	__u8 pad;
+#define PISP_BE_DPC_FLAG_FOLDBACK 1
+	__u8 flags;
+} __attribute__((packed));
+
+struct pisp_be_geq_config {
+	__u16 offset;
+#define PISP_BE_GEQ_SHARPER BIT(15)
+#define PISP_BE_GEQ_SLOPE ((1 << 10) - 1)
+	/* top bit is the "sharper" flag, slope value is bottom 10 bits */
+	__u16 slope_sharper;
+	__u16 min;
+	__u16 max;
+} __attribute__((packed));
+
+struct pisp_be_tdn_input_buffer_config {
+	/* low 32 bits followed by high 32 bits */
+	__u32 addr[2];
+} __attribute__((packed));
+
+struct pisp_be_tdn_config {
+	__u16 black_level;
+	__u16 ratio;
+	__u16 noise_constant;
+	__u16 noise_slope;
+	__u16 threshold;
+	__u8 reset;
+	__u8 pad;
+} __attribute__((packed));
+
+struct pisp_be_tdn_output_buffer_config {
+	/* low 32 bits followed by high 32 bits */
+	__u32 addr[2];
+} __attribute__((packed));
+
+struct pisp_be_sdn_config {
+	__u16 black_level;
+	__u8 leakage;
+	__u8 pad;
+	__u16 noise_constant;
+	__u16 noise_slope;
+	__u16 noise_constant2;
+	__u16 noise_slope2;
+} __attribute__((packed));
+
+struct pisp_be_stitch_input_buffer_config {
+	/* low 32 bits followed by high 32 bits */
+	__u32 addr[2];
+} __attribute__((packed));
+
+#define PISP_BE_STITCH_STREAMING_LONG 0x8000
+#define PISP_BE_STITCH_EXPOSURE_RATIO_MASK 0x7fff
+
+struct pisp_be_stitch_config {
+	__u16 threshold_lo;
+	__u8 threshold_diff_power;
+	__u8 pad;
+
+	/* top bit indicates whether streaming input is the long exposure */
+	__u16 exposure_ratio;
+
+	__u8 motion_threshold_256;
+	__u8 motion_threshold_recip;
+} __attribute__((packed));
+
+struct pisp_be_stitch_output_buffer_config {
+	/* low 32 bits followed by high 32 bits */
+	__u32 addr[2];
+} __attribute__((packed));
+
+struct pisp_be_cdn_config {
+	__u16 thresh;
+	__u8 iir_strength;
+	__u8 g_adjust;
+} __attribute__((packed));
+
+#define PISP_BE_LSC_LOG_GRID_SIZE 5
+#define PISP_BE_LSC_GRID_SIZE (1 << PISP_BE_LSC_LOG_GRID_SIZE)
+#define PISP_BE_LSC_STEP_PRECISION 18
+
+struct pisp_be_lsc_config {
+	/* (1<<18) / grid_cell_width */
+	__u16 grid_step_x;
+	/* (1<<18) / grid_cell_height */
+	__u16 grid_step_y;
+	/* RGB gains jointly encoded in 32 bits */
+	__u32 lut_packed[PISP_BE_LSC_GRID_SIZE + 1]
+			   [PISP_BE_LSC_GRID_SIZE + 1];
+} __attribute__((packed));
+
+struct pisp_be_lsc_extra {
+	__u16 offset_x;
+	__u16 offset_y;
+} __attribute__((packed));
+
+#define PISP_BE_CAC_LOG_GRID_SIZE 3
+#define PISP_BE_CAC_GRID_SIZE (1 << PISP_BE_CAC_LOG_GRID_SIZE)
+#define PISP_BE_CAC_STEP_PRECISION 20
+
+struct pisp_be_cac_config {
+	/* (1<<20) / grid_cell_width */
+	__u16 grid_step_x;
+	/* (1<<20) / grid_cell_height */
+	__u16 grid_step_y;
+	/* [gridy][gridx][rb][xy] */
+	__s8 lut[PISP_BE_CAC_GRID_SIZE + 1][PISP_BE_CAC_GRID_SIZE + 1][2][2];
+} __attribute__((packed));
+
+struct pisp_be_cac_extra {
+	__u16 offset_x;
+	__u16 offset_y;
+} __attribute__((packed));
+
+#define PISP_BE_DEBIN_NUM_COEFFS 4
+
+struct pisp_be_debin_config {
+	__s8 coeffs[PISP_BE_DEBIN_NUM_COEFFS];
+	__s8 h_enable;
+	__s8 v_enable;
+	__s8 pad[2];
+} __attribute__((packed));
+
+#define PISP_BE_TONEMAP_LUT_SIZE 64
+
+struct pisp_be_tonemap_config {
+	__u16 detail_constant;
+	__u16 detail_slope;
+	__u16 iir_strength;
+	__u16 strength;
+	__u32 lut[PISP_BE_TONEMAP_LUT_SIZE];
+} __attribute__((packed));
+
+struct pisp_be_demosaic_config {
+	__u8 sharper;
+	__u8 fc_mode;
+	__u8 pad[2];
+} __attribute__((packed));
+
+struct pisp_be_ccm_config {
+	__s16 coeffs[9];
+	__u8 pad[2];
+	__s32 offsets[3];
+} __attribute__((packed));
+
+struct pisp_be_sat_control_config {
+	__u8 shift_r;
+	__u8 shift_g;
+	__u8 shift_b;
+	__u8 pad;
+} __attribute__((packed));
+
+struct pisp_be_false_colour_config {
+	__u8 distance;
+	__u8 pad[3];
+} __attribute__((packed));
+
+#define PISP_BE_SHARPEN_SIZE 5
+#define PISP_BE_SHARPEN_FUNC_NUM_POINTS 9
+
+struct pisp_be_sharpen_config {
+	__s8 kernel0[PISP_BE_SHARPEN_SIZE * PISP_BE_SHARPEN_SIZE];
+	__s8 pad0[3];
+	__s8 kernel1[PISP_BE_SHARPEN_SIZE * PISP_BE_SHARPEN_SIZE];
+	__s8 pad1[3];
+	__s8 kernel2[PISP_BE_SHARPEN_SIZE * PISP_BE_SHARPEN_SIZE];
+	__s8 pad2[3];
+	__s8 kernel3[PISP_BE_SHARPEN_SIZE * PISP_BE_SHARPEN_SIZE];
+	__s8 pad3[3];
+	__s8 kernel4[PISP_BE_SHARPEN_SIZE * PISP_BE_SHARPEN_SIZE];
+	__s8 pad4[3];
+	__u16 threshold_offset0;
+	__u16 threshold_slope0;
+	__u16 scale0;
+	__u16 pad5;
+	__u16 threshold_offset1;
+	__u16 threshold_slope1;
+	__u16 scale1;
+	__u16 pad6;
+	__u16 threshold_offset2;
+	__u16 threshold_slope2;
+	__u16 scale2;
+	__u16 pad7;
+	__u16 threshold_offset3;
+	__u16 threshold_slope3;
+	__u16 scale3;
+	__u16 pad8;
+	__u16 threshold_offset4;
+	__u16 threshold_slope4;
+	__u16 scale4;
+	__u16 pad9;
+	__u16 positive_strength;
+	__u16 positive_pre_limit;
+	__u16 positive_func[PISP_BE_SHARPEN_FUNC_NUM_POINTS];
+	__u16 positive_limit;
+	__u16 negative_strength;
+	__u16 negative_pre_limit;
+	__u16 negative_func[PISP_BE_SHARPEN_FUNC_NUM_POINTS];
+	__u16 negative_limit;
+	__u8 enables;
+	__u8 white;
+	__u8 black;
+	__u8 grey;
+} __attribute__((packed));
+
+struct pisp_be_sh_fc_combine_config {
+	__u8 y_factor;
+	__u8 c1_factor;
+	__u8 c2_factor;
+	__u8 pad;
+} __attribute__((packed));
+
+#define PISP_BE_GAMMA_LUT_SIZE 64
+
+struct pisp_be_gamma_config {
+	__u32 lut[PISP_BE_GAMMA_LUT_SIZE];
+} __attribute__((packed));
+
+struct pisp_be_crop_config {
+	__u16 offset_x, offset_y;
+	__u16 width, height;
+} __attribute__((packed));
+
+#define PISP_BE_RESAMPLE_FILTER_SIZE 96
+
+struct pisp_be_resample_config {
+	__u16 scale_factor_h, scale_factor_v;
+	__s16 coef[PISP_BE_RESAMPLE_FILTER_SIZE];
+} __attribute__((packed));
+
+struct pisp_be_resample_extra {
+	__u16 scaled_width;
+	__u16 scaled_height;
+	__s16 initial_phase_h[3];
+	__s16 initial_phase_v[3];
+} __attribute__((packed));
+
+struct pisp_be_downscale_config {
+	__u16 scale_factor_h;
+	__u16 scale_factor_v;
+	__u16 scale_recip_h;
+	__u16 scale_recip_v;
+} __attribute__((packed));
+
+struct pisp_be_downscale_extra {
+	__u16 scaled_width;
+	__u16 scaled_height;
+} __attribute__((packed));
+
+struct pisp_be_hog_config {
+	__u8 compute_signed;
+	__u8 channel_mix[3];
+	__u32 stride;
+} __attribute__((packed));
+
+struct pisp_be_axi_config {
+	__u8 r_qos; /* Read QoS */
+	__u8 r_cache_prot; /* Read { prot[2:0], cache[3:0] } */
+	__u8 w_qos; /* Write QoS */
+	__u8 w_cache_prot; /* Write { prot[2:0], cache[3:0] } */
+} __attribute__((packed));
+
+enum pisp_be_transform {
+	PISP_BE_TRANSFORM_NONE = 0x0,
+	PISP_BE_TRANSFORM_HFLIP = 0x1,
+	PISP_BE_TRANSFORM_VFLIP = 0x2,
+	PISP_BE_TRANSFORM_ROT180 =
+		(PISP_BE_TRANSFORM_HFLIP | PISP_BE_TRANSFORM_VFLIP)
+};
+
+struct pisp_be_output_format_config {
+	struct pisp_image_format_config image;
+	__u8 transform;
+	__u8 pad[3];
+	__u16 lo;
+	__u16 hi;
+	__u16 lo2;
+	__u16 hi2;
+} __attribute__((packed));
+
+struct pisp_be_output_buffer_config {
+	/* low 32 bits followed by high 32 bits (for each of 3 planes) */
+	__u32 addr[3][2];
+} __attribute__((packed));
+
+struct pisp_be_hog_buffer_config {
+	/* low 32 bits followed by high 32 bits */
+	__u32 addr[2];
+} __attribute__((packed));
+
+struct pisp_be_config {
+	/* I/O configuration: */
+	struct pisp_be_input_buffer_config input_buffer;
+	struct pisp_be_tdn_input_buffer_config tdn_input_buffer;
+	struct pisp_be_stitch_input_buffer_config stitch_input_buffer;
+	struct pisp_be_tdn_output_buffer_config tdn_output_buffer;
+	struct pisp_be_stitch_output_buffer_config stitch_output_buffer;
+	struct pisp_be_output_buffer_config
+				output_buffer[PISP_BACK_END_NUM_OUTPUTS];
+	struct pisp_be_hog_buffer_config hog_buffer;
+	/* Processing configuration: */
+	struct pisp_be_global_config global;
+	struct pisp_image_format_config input_format;
+	struct pisp_decompress_config decompress;
+	struct pisp_be_dpc_config dpc;
+	struct pisp_be_geq_config geq;
+	struct pisp_image_format_config tdn_input_format;
+	struct pisp_decompress_config tdn_decompress;
+	struct pisp_be_tdn_config tdn;
+	struct pisp_compress_config tdn_compress;
+	struct pisp_image_format_config tdn_output_format;
+	struct pisp_be_sdn_config sdn;
+	struct pisp_bla_config blc;
+	struct pisp_compress_config stitch_compress;
+	struct pisp_image_format_config stitch_output_format;
+	struct pisp_image_format_config stitch_input_format;
+	struct pisp_decompress_config stitch_decompress;
+	struct pisp_be_stitch_config stitch;
+	struct pisp_be_lsc_config lsc;
+	struct pisp_wbg_config wbg;
+	struct pisp_be_cdn_config cdn;
+	struct pisp_be_cac_config cac;
+	struct pisp_be_debin_config debin;
+	struct pisp_be_tonemap_config tonemap;
+	struct pisp_be_demosaic_config demosaic;
+	struct pisp_be_ccm_config ccm;
+	struct pisp_be_sat_control_config sat_control;
+	struct pisp_be_ccm_config ycbcr;
+	struct pisp_be_sharpen_config sharpen;
+	struct pisp_be_false_colour_config false_colour;
+	struct pisp_be_sh_fc_combine_config sh_fc_combine;
+	struct pisp_be_ccm_config ycbcr_inverse;
+	struct pisp_be_gamma_config gamma;
+	struct pisp_be_ccm_config csc[PISP_BACK_END_NUM_OUTPUTS];
+	struct pisp_be_downscale_config downscale[PISP_BACK_END_NUM_OUTPUTS];
+	struct pisp_be_resample_config resample[PISP_BACK_END_NUM_OUTPUTS];
+	struct pisp_be_output_format_config
+				output_format[PISP_BACK_END_NUM_OUTPUTS];
+	struct pisp_be_hog_config hog;
+	struct pisp_be_axi_config axi;
+	/* Non-register fields: */
+	struct pisp_be_lsc_extra lsc_extra;
+	struct pisp_be_cac_extra cac_extra;
+	struct pisp_be_downscale_extra
+				downscale_extra[PISP_BACK_END_NUM_OUTPUTS];
+	struct pisp_be_resample_extra resample_extra[PISP_BACK_END_NUM_OUTPUTS];
+	struct pisp_be_crop_config crop;
+	struct pisp_image_format_config hog_format;
+	__u32 dirty_flags_bayer; /* these use pisp_be_bayer_enable */
+	__u32 dirty_flags_rgb; /* use pisp_be_rgb_enable */
+	__u32 dirty_flags_extra; /* these use pisp_be_dirty_t */
+} __attribute__((packed));
+
+/*
+ * We also need a tile structure to describe the size of the tiles going
+ * through the pipeline.
+ */
+
+enum pisp_tile_edge {
+	PISP_LEFT_EDGE = (1 << 0),
+	PISP_RIGHT_EDGE = (1 << 1),
+	PISP_TOP_EDGE = (1 << 2),
+	PISP_BOTTOM_EDGE = (1 << 3)
+};
+
+struct pisp_tile {
+	__u8 edge; // enum pisp_tile_edge
+	__u8 pad0[3];
+	// 4 bytes
+	__u32 input_addr_offset;
+	__u32 input_addr_offset2;
+	__u16 input_offset_x;
+	__u16 input_offset_y;
+	__u16 input_width;
+	__u16 input_height;
+	// 20 bytes
+	__u32 tdn_input_addr_offset;
+	__u32 tdn_output_addr_offset;
+	__u32 stitch_input_addr_offset;
+	__u32 stitch_output_addr_offset;
+	// 36 bytes
+	__u32 lsc_grid_offset_x;
+	__u32 lsc_grid_offset_y;
+	// 44 bytes
+	__u32 cac_grid_offset_x;
+	__u32 cac_grid_offset_y;
+	// 52 bytes
+	__u16 crop_x_start[PISP_BACK_END_NUM_OUTPUTS];
+	__u16 crop_x_end[PISP_BACK_END_NUM_OUTPUTS];
+	__u16 crop_y_start[PISP_BACK_END_NUM_OUTPUTS];
+	__u16 crop_y_end[PISP_BACK_END_NUM_OUTPUTS];
+	// 68 bytes
+	/* Ordering is planes then branches */
+	__u16 downscale_phase_x[3 * PISP_BACK_END_NUM_OUTPUTS];
+	__u16 downscale_phase_y[3 * PISP_BACK_END_NUM_OUTPUTS];
+	// 92 bytes
+	__u16 resample_in_width[PISP_BACK_END_NUM_OUTPUTS];
+	__u16 resample_in_height[PISP_BACK_END_NUM_OUTPUTS];
+	// 100 bytes
+	/* Ordering is planes then branches */
+	__u16 resample_phase_x[3 * PISP_BACK_END_NUM_OUTPUTS];
+	__u16 resample_phase_y[3 * PISP_BACK_END_NUM_OUTPUTS];
+	// 124 bytes
+	__u16 output_offset_x[PISP_BACK_END_NUM_OUTPUTS];
+	__u16 output_offset_y[PISP_BACK_END_NUM_OUTPUTS];
+	__u16 output_width[PISP_BACK_END_NUM_OUTPUTS];
+	__u16 output_height[PISP_BACK_END_NUM_OUTPUTS];
+	// 140 bytes
+	__u32 output_addr_offset[PISP_BACK_END_NUM_OUTPUTS];
+	__u32 output_addr_offset2[PISP_BACK_END_NUM_OUTPUTS];
+	// 156 bytes
+	__u32 output_hog_addr_offset;
+	// 160 bytes
+} __attribute__((packed));
+
+struct pisp_be_tiles_config {
+	struct pisp_be_config config;
+	struct pisp_tile tiles[PISP_BACK_END_NUM_TILES];
+	int num_tiles;
+} __attribute__((packed));
+
+#endif /* _UAPI_PISP_BE_CONFIG_H_ */
diff --git a/include/uapi/linux/media/raspberrypi/pisp_common.h b/include/uapi/linux/media/raspberrypi/pisp_common.h
new file mode 100644
index 000000000000..b2522e29c976
--- /dev/null
+++ b/include/uapi/linux/media/raspberrypi/pisp_common.h
@@ -0,0 +1,199 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * RP1 PiSP common definitions.
+ *
+ * Copyright (C) 2021 - Raspberry Pi Ltd.
+ *
+ */
+#ifndef _UAPI_PISP_COMMON_H_
+#define _UAPI_PISP_COMMON_H_
+
+#include <linux/types.h>
+
+struct pisp_image_format_config {
+	/* size in pixels */
+	__u16 width;
+	__u16 height;
+	/* must match struct pisp_image_format below */
+	__u32 format;
+	__s32 stride;
+	/* some planar image formats will need a second stride */
+	__s32 stride2;
+} __attribute__((packed));
+
+enum pisp_bayer_order {
+	/*
+	 * Note how bayer_order&1 tells you if G is on the even pixels of the
+	 * checkerboard or not, and bayer_order&2 tells you if R is on the even
+	 * rows or is swapped with B. Note that if the top (of the 8) bits is
+	 * set, this denotes a monochrome or greyscale image, and the lower bits
+	 * should all be ignored.
+	 */
+	PISP_BAYER_ORDER_RGGB = 0,
+	PISP_BAYER_ORDER_GBRG = 1,
+	PISP_BAYER_ORDER_BGGR = 2,
+	PISP_BAYER_ORDER_GRBG = 3,
+	PISP_BAYER_ORDER_GREYSCALE = 128
+};
+
+enum pisp_image_format {
+	/*
+	 * Precise values are mostly tbd. Generally these will be portmanteau
+	 * values comprising bit fields and flags. This format must be shared
+	 * throughout the PiSP.
+	 */
+	PISP_IMAGE_FORMAT_BPS_8 = 0x00000000,
+	PISP_IMAGE_FORMAT_BPS_10 = 0x00000001,
+	PISP_IMAGE_FORMAT_BPS_12 = 0x00000002,
+	PISP_IMAGE_FORMAT_BPS_16 = 0x00000003,
+	PISP_IMAGE_FORMAT_BPS_MASK = 0x00000003,
+
+	PISP_IMAGE_FORMAT_PLANARITY_INTERLEAVED = 0x00000000,
+	PISP_IMAGE_FORMAT_PLANARITY_SEMI_PLANAR = 0x00000010,
+	PISP_IMAGE_FORMAT_PLANARITY_PLANAR = 0x00000020,
+	PISP_IMAGE_FORMAT_PLANARITY_MASK = 0x00000030,
+
+	PISP_IMAGE_FORMAT_SAMPLING_444 = 0x00000000,
+	PISP_IMAGE_FORMAT_SAMPLING_422 = 0x00000100,
+	PISP_IMAGE_FORMAT_SAMPLING_420 = 0x00000200,
+	PISP_IMAGE_FORMAT_SAMPLING_MASK = 0x00000300,
+
+	PISP_IMAGE_FORMAT_ORDER_NORMAL = 0x00000000,
+	PISP_IMAGE_FORMAT_ORDER_SWAPPED = 0x00001000,
+
+	PISP_IMAGE_FORMAT_SHIFT_0 = 0x00000000,
+	PISP_IMAGE_FORMAT_SHIFT_1 = 0x00010000,
+	PISP_IMAGE_FORMAT_SHIFT_2 = 0x00020000,
+	PISP_IMAGE_FORMAT_SHIFT_3 = 0x00030000,
+	PISP_IMAGE_FORMAT_SHIFT_4 = 0x00040000,
+	PISP_IMAGE_FORMAT_SHIFT_5 = 0x00050000,
+	PISP_IMAGE_FORMAT_SHIFT_6 = 0x00060000,
+	PISP_IMAGE_FORMAT_SHIFT_7 = 0x00070000,
+	PISP_IMAGE_FORMAT_SHIFT_8 = 0x00080000,
+	PISP_IMAGE_FORMAT_SHIFT_MASK = 0x000f0000,
+
+	PISP_IMAGE_FORMAT_UNCOMPRESSED = 0x00000000,
+	PISP_IMAGE_FORMAT_COMPRESSION_MODE_1 = 0x01000000,
+	PISP_IMAGE_FORMAT_COMPRESSION_MODE_2 = 0x02000000,
+	PISP_IMAGE_FORMAT_COMPRESSION_MODE_3 = 0x03000000,
+	PISP_IMAGE_FORMAT_COMPRESSION_MASK = 0x03000000,
+
+	PISP_IMAGE_FORMAT_HOG_SIGNED = 0x04000000,
+	PISP_IMAGE_FORMAT_HOG_UNSIGNED = 0x08000000,
+	PISP_IMAGE_FORMAT_INTEGRAL_IMAGE = 0x10000000,
+	PISP_IMAGE_FORMAT_WALLPAPER_ROLL = 0x20000000,
+	PISP_IMAGE_FORMAT_THREE_CHANNEL = 0x40000000,
+
+	/* Lastly a few specific instantiations of the above. */
+	PISP_IMAGE_FORMAT_SINGLE_16 = PISP_IMAGE_FORMAT_BPS_16,
+	PISP_IMAGE_FORMAT_THREE_16 = PISP_IMAGE_FORMAT_BPS_16 |
+				     PISP_IMAGE_FORMAT_THREE_CHANNEL
+};
+
+#define PISP_IMAGE_FORMAT_bps_8(fmt)                                           \
+	(((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) == PISP_IMAGE_FORMAT_BPS_8)
+#define PISP_IMAGE_FORMAT_bps_10(fmt)                                          \
+	(((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) == PISP_IMAGE_FORMAT_BPS_10)
+#define PISP_IMAGE_FORMAT_bps_12(fmt)                                          \
+	(((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) == PISP_IMAGE_FORMAT_BPS_12)
+#define PISP_IMAGE_FORMAT_bps_16(fmt)                                          \
+	(((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) == PISP_IMAGE_FORMAT_BPS_16)
+#define PISP_IMAGE_FORMAT_bps(fmt)                                             \
+	(((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) ?                                \
+	       8 + (2 << (((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) - 1)) : 8)
+#define PISP_IMAGE_FORMAT_shift(fmt)                                           \
+	(((fmt) & PISP_IMAGE_FORMAT_SHIFT_MASK) / PISP_IMAGE_FORMAT_SHIFT_1)
+#define PISP_IMAGE_FORMAT_three_channel(fmt)                                   \
+	((fmt) & PISP_IMAGE_FORMAT_THREE_CHANNEL)
+#define PISP_IMAGE_FORMAT_single_channel(fmt)                                  \
+	(!((fmt) & PISP_IMAGE_FORMAT_THREE_CHANNEL))
+#define PISP_IMAGE_FORMAT_compressed(fmt)                                      \
+	(((fmt) & PISP_IMAGE_FORMAT_COMPRESSION_MASK) !=                       \
+	 PISP_IMAGE_FORMAT_UNCOMPRESSED)
+#define PISP_IMAGE_FORMAT_sampling_444(fmt)                                    \
+	(((fmt) & PISP_IMAGE_FORMAT_SAMPLING_MASK) ==                          \
+	 PISP_IMAGE_FORMAT_SAMPLING_444)
+#define PISP_IMAGE_FORMAT_sampling_422(fmt)                                    \
+	(((fmt) & PISP_IMAGE_FORMAT_SAMPLING_MASK) ==                          \
+	 PISP_IMAGE_FORMAT_SAMPLING_422)
+#define PISP_IMAGE_FORMAT_sampling_420(fmt)                                    \
+	(((fmt) & PISP_IMAGE_FORMAT_SAMPLING_MASK) ==                          \
+	 PISP_IMAGE_FORMAT_SAMPLING_420)
+#define PISP_IMAGE_FORMAT_order_normal(fmt)                                    \
+	(!((fmt) & PISP_IMAGE_FORMAT_ORDER_SWAPPED))
+#define PISP_IMAGE_FORMAT_order_swapped(fmt)                                   \
+	((fmt) & PISP_IMAGE_FORMAT_ORDER_SWAPPED)
+#define PISP_IMAGE_FORMAT_interleaved(fmt)                                     \
+	(((fmt) & PISP_IMAGE_FORMAT_PLANARITY_MASK) ==                         \
+	 PISP_IMAGE_FORMAT_PLANARITY_INTERLEAVED)
+#define PISP_IMAGE_FORMAT_semiplanar(fmt)                                      \
+	(((fmt) & PISP_IMAGE_FORMAT_PLANARITY_MASK) ==                         \
+	 PISP_IMAGE_FORMAT_PLANARITY_SEMI_PLANAR)
+#define PISP_IMAGE_FORMAT_planar(fmt)                                          \
+	(((fmt) & PISP_IMAGE_FORMAT_PLANARITY_MASK) ==                         \
+	 PISP_IMAGE_FORMAT_PLANARITY_PLANAR)
+#define PISP_IMAGE_FORMAT_wallpaper(fmt)                                       \
+	((fmt) & PISP_IMAGE_FORMAT_WALLPAPER_ROLL)
+#define PISP_IMAGE_FORMAT_HOG(fmt)                                             \
+	((fmt) &                                                               \
+	 (PISP_IMAGE_FORMAT_HOG_SIGNED | PISP_IMAGE_FORMAT_HOG_UNSIGNED))
+
+#define PISP_WALLPAPER_WIDTH 128 /* in bytes */
+
+struct pisp_bla_config {
+	__u16 black_level_r;
+	__u16 black_level_gr;
+	__u16 black_level_gb;
+	__u16 black_level_b;
+	__u16 output_black_level;
+	__u8 pad[2];
+} __attribute__((packed));
+
+struct pisp_wbg_config {
+	__u16 gain_r;
+	__u16 gain_g;
+	__u16 gain_b;
+	__u8 pad[2];
+} __attribute__((packed));
+
+struct pisp_compress_config {
+	/* value subtracted from incoming data */
+	__u16 offset;
+	__u8 pad;
+	/* 1 => Companding; 2 => Delta (recommended); 3 => Combined (for HDR) */
+	__u8 mode;
+} __attribute__((packed));
+
+struct pisp_decompress_config {
+	/* value added to reconstructed data */
+	__u16 offset;
+	__u8 pad;
+	/* 1 => Companding; 2 => Delta (recommended); 3 => Combined (for HDR) */
+	__u8 mode;
+} __attribute__((packed));
+
+enum pisp_axi_flags {
+	/*
+	 * round down bursts to end at a 32-byte boundary, to align following
+	 * bursts
+	 */
+	PISP_AXI_FLAG_ALIGN = 128,
+	/* for FE writer: force WSTRB high, to pad output to 16-byte boundary */
+	PISP_AXI_FLAG_PAD = 64,
+	/* for FE writer: Use Output FIFO level to trigger "panic" */
+	PISP_AXI_FLAG_PANIC = 32,
+};
+
+struct pisp_axi_config {
+	/*
+	 * burst length minus one, which must be in the range 0:15; OR'd with
+	 * flags
+	 */
+	__u8 maxlen_flags;
+	/* { prot[2:0], cache[3:0] } fields, echoed on AXI bus */
+	__u8 cache_prot;
+	/* QoS field(s) (4x4 bits for FE writer; 4 bits for other masters) */
+	__u16 qos;
+} __attribute__((packed));
+
+#endif /* _UAPI_PISP_COMMON_H_ */
-- 
2.43.2


