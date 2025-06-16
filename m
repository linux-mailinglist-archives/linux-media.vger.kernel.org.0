Return-Path: <linux-media+bounces-34903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F18ADB00B
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 14:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AD6F16DE7F
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 12:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8602E427F;
	Mon, 16 Jun 2025 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iiI/F0d4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6C32E424D;
	Mon, 16 Jun 2025 12:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750076319; cv=none; b=uEKBF3Drr5wFDICHtX5PAWb/ziPVLsPh70Ik5loX7o/GygjWe2MLpqtHCRpPqaffCQ3mz5oynhmseirnnjLAfMeUyTErHgBK5r+rQZ1QhEdBsp9DhJpbryTnju/LXN83GKML2Lkqao8UpaCJVYbf/Ga9fUQE7pOGkFUCurEJ4Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750076319; c=relaxed/simple;
	bh=gf7vBb2cNrNaruXM2wu4ntQprZ63vs93RbsBq1OXdtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eeqxB6IWhNagfSfY5A/LBSiZDf627a0yhnznX8lxhLQv0FXpBx/3ub9xDjX6BYsPAtGOQcbvWbLPx6qJ2XTY1hMKI17Qr4INjtbTF8qxqybz41HL2AHkmqUYZRfAbUDPgnppaYMs3vo8GT5bp5s4hIVggOXUUG18xVEtaqRPYUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iiI/F0d4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-141-184.net.vodafone.it [5.90.141.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 548D522A;
	Mon, 16 Jun 2025 14:18:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750076303;
	bh=gf7vBb2cNrNaruXM2wu4ntQprZ63vs93RbsBq1OXdtQ=;
	h=From:Date:Subject:To:Cc:From;
	b=iiI/F0d4A4Rs9b5ih55CzFYt/rQBuSG6uxAcGvCmzOJdzz0qask9IJsWZ+6sWEc3+
	 9hrqVgqLzYpTMCnChi2PXtfEMwhGTHH1LEbDv1DvKKRZtPy7kribxBg1nSaP6f7Kfy
	 6ibDMhmFwms1gxAHjaMW62YlAn/kA3muefZw9sIg=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Mon, 16 Jun 2025 14:18:14 +0200
Subject: [PATCH v11] media: vsp1: Add VSPX support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-b4-vspx-v11-1-69af6398c185@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAIULUGgC/3WOzW4CIRSFX2XCujQXlD9XfY/GBXChsnCYwpRoz
 Ly7OC40qS7Pyfm+ey+khpJCJbvhQkpoqaY89sDYx0D8wY4/gSbsBeHABQjg1G1pq9OJGvCaCRe
 jRCR9PZUQ02lVfe/vuYTfv26c7yVxtgbq8/GY5t2wRe43qEAZE8ltf0h1zuW8ftL0Cvy72TRl1
 HGrhOFSasSvhMHWPLpsC35296pq5hmXD9x0HBUKsMCicvINzuCJ5+bBM+gC4NZ4BwBabF4IlmW
 5AnxFoOdWAQAA
X-Change-ID: 20250502-b4-vspx-90c815bff6dd
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=31579;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=gf7vBb2cNrNaruXM2wu4ntQprZ63vs93RbsBq1OXdtQ=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoUAuWjL3hy9vYo5SKTXOn2SpdQP64BuzlRzG7D
 SzfBtODtOmJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaFALlgAKCRByNAaPFqFW
 POgYD/9+xZjRAmMf+rvUtuL8S0ZHHdLNGMHltFEvp7PpqaWJbjldkOmAwSyIz37GLbH/DcvlCFk
 w7lPWyiZEDWyvtXF/p4vhGMYO2Q9Yr0FV3FccXbB7OyFOY0glY9uukZ4HUdq3V3Brqh+eNN2V+2
 75QUNMurRk22MF9cAKCyocXEnjPYEDvUJZlcIKYaZLKxAy+pa7JjIiU/JhCdghq9kGbZiT3/F33
 dM/zq0mKcztdIlMb5oCKeNrArIkrx23xQ6hvv23srKUON4NW6d6IiCLtEdTUJw1DQQ9I71ax5BR
 d/CMBiaC8OFDXJrzzbvxGiAcbgn1AqDu20PceIBJlyDb4fbWaVxRJMLLokrO7DJlSfSHflib1je
 I65nZshphz6K3sgGOKIZyjUnLtf01aWK7z2c5ReIoggZh3VTH+iaGV8RW5x715/Z5Em+R8vvNih
 +QaPSQEvg9kBwR5Jlo5dlymsDMu0UFVjCc/Vu3u2bXw03kognspTUDxRJts1ReTdtnHn7V3v4ed
 1Cm2Pq29x0oP/vRWZqlgS09VDkwHfEE3wA5lysO3uTFtAzhB/hN9B6UMx6Y1eyQ9FBZxJvUKW2x
 6Uvl4DdMfYzh2gpQgNDKCKpoghuhw7U5Xd38ZmFuprS/OsBr/0K/QFT8JPP6xdACJJMpivkL3UX
 xd53toaPaQoY4+Q==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add support for VSPX, a specialized version of the VSP2 that
transfers data to the ISP. The VSPX is composed of two RPF units
to read data from external memory and an IIF instance that performs
transfer towards the ISP.

The VSPX is supported through a newly introduced vsp1_vspx.c file that
exposes two interfaces: vsp1_vspx interface, declared in vsp1_vspx.h
for the vsp1 core to initialize and cleanup the VSPX, and a vsp1_isp
interface, declared in include/media/vsp1.h for the ISP driver to
control the VSPX operations.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
The VSPX is a VSP2 function that reads data from external memory using
two RPF instances and feed it to the ISP.

The VSPX includes an IIF unit (ISP InterFace) modeled in the vsp1 driver
as a new, simple, entity type.

IIF is part of VSPX, a version of the VSP2 IP specialized for ISP
interfacing. To prepare to support VSPX, support IIF first by
introducing a new entity and by adjusting the RPF/WPF drivers to
operate correctly when an IIF is present.

Changes in v11:
- Rework vspx locking:
  - Introduce a mutex to protect start/stop streaming sequence
  - use a spinlock to protect the 'enabled' flag as it is contended with
    the ISP irq context
  - Use spinlock_irq when appropriate (start/stop streaming)
- Refuse ConfigDMA with less than 17 pairs
- Use format mplane to configure the image buffer
- Refuse jobs when the VSPX is stopped by returning an error
- Expand API documentation
- Link to v10: https://lore.kernel.org/r/20250529-b4-vspx-v10-1-02a9cb000853@ideasonboard.com

Changes in v10:
- Properly stop the VSP1 pipeline by setting the pipeline in STOPPED
  state at frame end time
- Prevent new jobs from being scheduled after the pipe has been stopped
- Link to v9: https://lore.kernel.org/r/20250506-b4-vspx-v9-1-d7d50a01f7b6@ideasonboard.com

Changes in v9:
- Address Laurent's comment on style and comments
- Rework job preparation/queueing
  - Remove the VSPX job queue
  - Move the display list to be part of struct vsp1_isp_job_desc
- Rename main spinlock
- Rework start/stop procedures
- Link to v8: https://lore.kernel.org/r/20250502-b4-vspx-v8-1-b2a7592668dd@ideasonboard.com

Changes in v8:
- Remove patches already collected by Laurent in
  [GIT PULL FOR v6.16] Renesas media drivers changes

- Rebased on
  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git #renesas-next

- Changes to the VSPX interface towards the ISP
  - Split start/stop_streaming
  - Add vsp1_isp_jobs_release() to release pending jobs
  - Add vsp1_isp_free_buffer()
  - Remove vsp1_isp_configure() and compute partitions on job creation

- Driver changes
  - Drop irq-driver flow
    The VSPX used to schedule new jobs as soon as processing the last
    one is done. This doesn't work well with the R-Car ISP design
    for two reasons:
    - The ISP needs per-job registers programming
    - The ISP and VSPX job queues have to stay in sync

- Minors
  - Remove the jobs_lock as a single lock is fine
  - Protect against VSPX/ISP irq races in job_run() by checking the
    VSPX 'busy' register and remove the 'processing' flag
  - Manually set the pipeline state to STOPPED before scheduling a new
    job without waiting for frame_end

Changes in v7:
- Include VSPX driver in the series
- Use existing VSP1 formats and remove patches extending formats on RPF
- Rework VSPX driver to split jobs creation and scheduling in two
  different API entry points
- Fix VSPX stride using the user provided bytesperline and using the
  buffer size for ConfigDMA buffers
- Link to v6: https://lore.kernel.org/r/20250321-v4h-iif-v6-0-361e9043026a@ideasonboard.com

Changes in v6:
- Little cosmetic change as suggested by Laurent
- Collect tags
- Link to v5: https://lore.kernel.org/r/20250319-v4h-iif-v5-0-0a10456d792c@ideasonboard.com

Changes in v5:
- Drop additional empty line 5/6
- Link to v4: https://lore.kernel.org/r/20250318-v4h-iif-v4-0-10ed4c41c195@ideasonboard.com

Changes in v4:
- Fix SWAP bits for RAW10, RAW12 and RAW16
- Link to v3: https://lore.kernel.org/r/20250317-v4h-iif-v3-0-63aab8982b50@ideasonboard.com

Changes in v3:
- Drop 2/6 from v2
- Add 5/7 to prepare for a new implementation of 6/7
- Individual changelog per patch
- Add 7/7
- Link to v2: https://lore.kernel.org/r/20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com

Changes in v2:
- Collect tags
- Address review comments from Laurent, a lot of tiny changes here and
  there but no major redesign worth an entry in the patchset changelog
---
 drivers/media/platform/renesas/vsp1/Makefile    |   1 +
 drivers/media/platform/renesas/vsp1/vsp1.h      |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_drv.c  |  13 +-
 drivers/media/platform/renesas/vsp1/vsp1_regs.h |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_vspx.c | 622 ++++++++++++++++++++++++
 drivers/media/platform/renesas/vsp1/vsp1_vspx.h |  16 +
 include/media/vsp1.h                            |  89 ++++
 7 files changed, 742 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/Makefile b/drivers/media/platform/renesas/vsp1/Makefile
index de8c802e1d1a16aabe1326fc8c27be33ad2b2e10..2057c8f7be477a13a4598103427e1ddd28cc5a51 100644
--- a/drivers/media/platform/renesas/vsp1/Makefile
+++ b/drivers/media/platform/renesas/vsp1/Makefile
@@ -6,5 +6,6 @@ vsp1-y					+= vsp1_clu.o vsp1_hsit.o vsp1_lut.o
 vsp1-y					+= vsp1_brx.o vsp1_sru.o vsp1_uds.o
 vsp1-y					+= vsp1_hgo.o vsp1_hgt.o vsp1_histo.o
 vsp1-y					+= vsp1_iif.o vsp1_lif.o vsp1_uif.o
+vsp1-y					+= vsp1_vspx.o
 
 obj-$(CONFIG_VIDEO_RENESAS_VSP1)	+= vsp1.o
diff --git a/drivers/media/platform/renesas/vsp1/vsp1.h b/drivers/media/platform/renesas/vsp1/vsp1.h
index f97a1a31bfab3a23371d13978e59596ec63a37fe..94de2e85792e6623555617ca23f65ac1a9af9e4e 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1.h
@@ -111,6 +111,7 @@ struct vsp1_device {
 	struct media_entity_operations media_ops;
 
 	struct vsp1_drm *drm;
+	struct vsp1_vspx *vspx;
 };
 
 int vsp1_device_get(struct vsp1_device *vsp1);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 8270a9d207cb19c3a08911a408f5039d7d2924b6..d4b7088786395dac34ca3e2078b6e2c306988114 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -38,6 +38,7 @@
 #include "vsp1_uds.h"
 #include "vsp1_uif.h"
 #include "vsp1_video.h"
+#include "vsp1_vspx.h"
 
 /* -----------------------------------------------------------------------------
  * Interrupt Handling
@@ -490,7 +491,10 @@ static int vsp1_create_entities(struct vsp1_device *vsp1)
 
 		ret = media_device_register(mdev);
 	} else {
-		ret = vsp1_drm_init(vsp1);
+		if (vsp1->info->version == VI6_IP_VERSION_MODEL_VSPX_GEN4)
+			ret = vsp1_vspx_init(vsp1);
+		else
+			ret = vsp1_drm_init(vsp1);
 	}
 
 done:
@@ -851,6 +855,13 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.uif_count = 2,
 		.wpf_count = 1,
 		.num_bru_inputs = 5,
+	}, {
+		.version = VI6_IP_VERSION_MODEL_VSPX_GEN4,
+		.model = "VSP2-X",
+		.gen = 4,
+		.features = VSP1_HAS_IIF,
+		.rpf_count = 2,
+		.wpf_count = 1,
 	},
 };
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
index 86e47c2d991fb4e0719b63c4ccb29340610ac24f..10cfbcd1b6e0b3a9c0a8daaa990babfaeb8dde0c 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
@@ -799,6 +799,7 @@
 #define VI6_IP_VERSION_MODEL_VSPDL_GEN3	(0x19 << 8)
 #define VI6_IP_VERSION_MODEL_VSPBS_GEN3	(0x1a << 8)
 #define VI6_IP_VERSION_MODEL_VSPD_GEN4	(0x1c << 8)
+#define VI6_IP_VERSION_MODEL_VSPX_GEN4	(0x1d << 8)
 /* RZ/G2L SoCs have no version register, So use 0x80 as the model version */
 #define VI6_IP_VERSION_MODEL_VSPD_RZG2L	(0x80 << 8)
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_vspx.c b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
new file mode 100644
index 0000000000000000000000000000000000000000..f6bdd51259f4a92f53f6291af9a04ca7d78cb765
--- /dev/null
+++ b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
@@ -0,0 +1,622 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * vsp1_vspx.c  --  R-Car Gen 4 VSPX
+ *
+ * Copyright (C) 2025 Ideas On Board Oy
+ * Copyright (C) 2025 Renesas Electronics Corporation
+ */
+
+#include "vsp1_vspx.h"
+
+#include <linux/cleanup.h>
+#include <linux/container_of.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/list.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-subdev.h>
+#include <media/vsp1.h>
+
+#include "vsp1_dl.h"
+#include "vsp1_iif.h"
+#include "vsp1_pipe.h"
+#include "vsp1_rwpf.h"
+
+/*
+ * struct vsp1_vspx_pipeline - VSPX pipeline
+ * @pipe: the VSP1 pipeline
+ * @partition: the pre-calculated partition used by the pipeline
+ * @mutex: protects the streaming start/stop sequences
+ * @lock: protect access to the enabled flag
+ * @enabled: the enable flag
+ * @vspx_frame_end: frame end callback
+ * @frame_end_data: data for the frame end callback
+ */
+struct vsp1_vspx_pipeline {
+	struct vsp1_pipeline pipe;
+	struct vsp1_partition partition;
+
+	/* Protects the pipeline start/stop streaming routines */
+	struct mutex mutex;
+	/*
+	 * Protects the enable flag.
+	 *
+	 * The enabled flag is contended between the start/stop streaming
+	 * routines and the job_run one, which cannot take a mutex as it is
+	 * called from the ISP irq context.
+	 */
+	spinlock_t lock;
+	bool enabled;
+
+	void (*vspx_frame_end)(void *frame_end_data);
+	void *frame_end_data;
+};
+
+static inline struct vsp1_vspx_pipeline *
+to_vsp1_vspx_pipeline(struct vsp1_pipeline *pipe)
+{
+	return container_of(pipe, struct vsp1_vspx_pipeline, pipe);
+}
+
+/*
+ * struct vsp1_vspx - VSPX device
+ * @vsp1: the VSP1 device
+ * @pipe: the VSPX pipeline
+ */
+struct vsp1_vspx {
+	struct vsp1_device *vsp1;
+	struct vsp1_vspx_pipeline pipe;
+};
+
+/* Apply the given width, height and fourcc to the RWPF's subdevice */
+static int vsp1_vspx_rwpf_set_subdev_fmt(struct vsp1_device *vsp1,
+					 struct vsp1_rwpf *rwpf,
+					 u32 isp_fourcc,
+					 unsigned int width,
+					 unsigned int height)
+{
+	struct vsp1_entity *ent = &rwpf->entity;
+	struct v4l2_subdev_format format = {};
+	u32 vspx_fourcc;
+
+	switch (isp_fourcc) {
+	case V4L2_PIX_FMT_GREY:
+		/* 8 bit RAW Bayer image. */
+		vspx_fourcc = V4L2_PIX_FMT_RGB332;
+		break;
+	case V4L2_PIX_FMT_Y10:
+	case V4L2_PIX_FMT_Y12:
+	case V4L2_PIX_FMT_Y16:
+		/* 10, 12 and 16 bit RAW Bayer image. */
+		vspx_fourcc = V4L2_PIX_FMT_RGB565;
+		break;
+	case V4L2_META_FMT_GENERIC_8:
+		/* ConfigDMA parameters buffer. */
+		vspx_fourcc = V4L2_PIX_FMT_XBGR32;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	rwpf->fmtinfo = vsp1_get_format_info(vsp1, vspx_fourcc);
+
+	format.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	format.pad = RWPF_PAD_SINK;
+	format.format.width = width;
+	format.format.height = height;
+	format.format.field = V4L2_FIELD_NONE;
+	format.format.code = rwpf->fmtinfo->mbus;
+
+	return v4l2_subdev_call(&ent->subdev, pad, set_fmt, NULL, &format);
+}
+
+/* Configure the RPF->IIF->WPF pipeline for ConfigDMA or RAW image transfer. */
+static int vsp1_vspx_pipeline_configure(struct vsp1_device *vsp1,
+					dma_addr_t addr, u32 isp_fourcc,
+					unsigned int width, unsigned int height,
+					unsigned int stride,
+					unsigned int iif_sink_pad,
+					struct vsp1_dl_list *dl,
+					struct vsp1_dl_body *dlb)
+{
+	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
+	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
+	struct vsp1_rwpf *rpf0 = pipe->inputs[0];
+	int ret;
+
+	ret = vsp1_vspx_rwpf_set_subdev_fmt(vsp1, rpf0, isp_fourcc, width,
+					    height);
+	if (ret)
+		return ret;
+
+	ret = vsp1_vspx_rwpf_set_subdev_fmt(vsp1, pipe->output, isp_fourcc,
+					    width, height);
+	if (ret)
+		return ret;
+
+	vsp1_pipeline_calculate_partition(pipe, &pipe->part_table[0], width, 0);
+	rpf0->format.plane_fmt[0].bytesperline = stride;
+	rpf0->format.num_planes = 1;
+	rpf0->mem.addr[0] = addr;
+
+	/*
+	 * Connect RPF0 to the IIF sink pad corresponding to the config or image
+	 * path.
+	 */
+	rpf0->entity.sink_pad = iif_sink_pad;
+
+	vsp1_entity_route_setup(&rpf0->entity, pipe, dlb);
+	vsp1_entity_configure_stream(&rpf0->entity, rpf0->entity.state, pipe,
+				     dl, dlb);
+	vsp1_entity_configure_partition(&rpf0->entity, pipe,
+					&pipe->part_table[0], dl, dlb);
+
+	return 0;
+}
+
+/* -----------------------------------------------------------------------------
+ * Interrupt handling
+ */
+
+static void vsp1_vspx_pipeline_frame_end(struct vsp1_pipeline *pipe,
+					 unsigned int completion)
+{
+	struct vsp1_vspx_pipeline *vspx_pipe = to_vsp1_vspx_pipeline(pipe);
+
+	scoped_guard(spinlock_irqsave, &pipe->irqlock) {
+		/*
+		 * Operating the vsp1_pipe in singleshot mode requires to
+		 * manually set the pipeline state to stopped when a transfer
+		 * is completed.
+		 */
+		pipe->state = VSP1_PIPELINE_STOPPED;
+	}
+
+	if (vspx_pipe->vspx_frame_end)
+		vspx_pipe->vspx_frame_end(vspx_pipe->frame_end_data);
+}
+
+/* -----------------------------------------------------------------------------
+ * ISP Driver API (include/media/vsp1.h)
+ */
+
+/**
+ * vsp1_isp_init() - Initialize the VSPX
+ * @dev: The VSP1 struct device
+ *
+ * Return: %0 on success or a negative error code on failure
+ */
+int vsp1_isp_init(struct device *dev)
+{
+	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
+
+	if (!vsp1)
+		return -EPROBE_DEFER;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vsp1_isp_init);
+
+/**
+ * vsp1_isp_get_bus_master - Get VSPX bus master
+ * @dev: The VSP1 struct device
+ *
+ * The VSPX accesses memory through an FCPX instance. When allocating memory
+ * buffers that will have to be accessed by the VSPX the 'struct device' of
+ * the FCPX should be used. Use this function to get a reference to it.
+ *
+ * Return: a pointer to the bus master's device
+ */
+struct device *vsp1_isp_get_bus_master(struct device *dev)
+{
+	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
+
+	if (!vsp1)
+		return ERR_PTR(-ENODEV);
+
+	return vsp1->bus_master;
+}
+EXPORT_SYMBOL_GPL(vsp1_isp_get_bus_master);
+
+/**
+ * vsp1_isp_alloc_buffer - Allocate a buffer in the VSPX address space
+ * @dev: The VSP1 struct device
+ * @size: The size of the buffer to be allocated by the VSPX
+ * @buffer_desc: The buffer descriptor. Will be filled with the buffer
+ *		 CPU-mapped address, the bus address and the size of the
+ *		 allocated buffer
+ *
+ * Allocate a buffer that will be later accessed by the VSPX. Buffers allocated
+ * using vsp1_isp_alloc_buffer() shall be released with a call to
+ * vsp1_isp_free_buffer(). This function is used by the ISP driver to allocate
+ * memory for the ConfigDMA parameters buffer.
+ *
+ * Return: %0 on success or a negative error code on failure
+ */
+int vsp1_isp_alloc_buffer(struct device *dev, size_t size,
+			  struct vsp1_isp_buffer_desc *buffer_desc)
+{
+	struct device *bus_master = vsp1_isp_get_bus_master(dev);
+
+	if (IS_ERR_OR_NULL(bus_master))
+		return -ENODEV;
+
+	buffer_desc->cpu_addr = dma_alloc_coherent(bus_master, size,
+						   &buffer_desc->dma_addr,
+						   GFP_KERNEL);
+	if (!buffer_desc->cpu_addr)
+		return -ENOMEM;
+
+	buffer_desc->size = size;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vsp1_isp_alloc_buffer);
+
+/**
+ * vsp1_isp_free_buffer - Release a buffer allocated by vsp1_isp_alloc_buffer()
+ * @dev: The VSP1 struct device
+ * @buffer_desc: The descriptor of the buffer to release as returned by
+ *		 vsp1_isp_alloc_buffer()
+ *
+ * Release memory in the VSPX address space allocated by
+ * vsp1_isp_alloc_buffer().
+ */
+void vsp1_isp_free_buffer(struct device *dev,
+			  struct vsp1_isp_buffer_desc *buffer_desc)
+{
+	struct device *bus_master = vsp1_isp_get_bus_master(dev);
+
+	if (IS_ERR_OR_NULL(bus_master))
+		return;
+
+	dma_free_coherent(bus_master, buffer_desc->size, buffer_desc->cpu_addr,
+			  buffer_desc->dma_addr);
+}
+
+/**
+ * vsp1_isp_start_streaming - Start processing VSPX jobs
+ * @dev: The VSP1 struct device
+ * @frame_end: The frame end callback description
+ *
+ * Start the VSPX and prepare for accepting buffer transfer job requests.
+ * A single call to this function is allowed. Attempting to start an already
+ * started VSPX instance is an error.
+ *
+ * Return: %0 on success or a negative error code on failure
+ */
+int vsp1_isp_start_streaming(struct device *dev,
+			     struct vsp1_vspx_frame_end *frame_end)
+{
+	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
+	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
+	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
+	u32 value;
+	int ret;
+
+	if (!frame_end)
+		return -EINVAL;
+
+	mutex_lock(&vspx_pipe->mutex);
+
+	scoped_guard(spinlock_irq, &vspx_pipe->lock) {
+		if (vspx_pipe->enabled) {
+			ret = -EBUSY;
+			goto error_unlock;
+		}
+	}
+
+	vspx_pipe->vspx_frame_end = frame_end->vspx_frame_end;
+	vspx_pipe->frame_end_data = frame_end->frame_end_data;
+
+	/* Enable the VSP1 and prepare for streaming. */
+	vsp1_pipeline_dump(pipe, "VSPX job");
+
+	ret = vsp1_device_get(vsp1);
+	if (ret < 0)
+		goto error_unlock;
+
+	/*
+	 * Make sure VSPX is not active. This should never happen in normal
+	 * usage
+	 */
+	value = vsp1_read(vsp1, VI6_CMD(0));
+	if (value & VI6_CMD_STRCMD) {
+		dev_err(vsp1->dev,
+			"%s: Starting of WPF0 already reserved\n", __func__);
+		ret = -EBUSY;
+		goto error_put;
+	}
+
+	value = vsp1_read(vsp1, VI6_STATUS);
+	if (value & VI6_STATUS_SYS_ACT(0)) {
+		dev_err(vsp1->dev,
+			"%s: WPF0 has not entered idle state\n", __func__);
+		ret = -EBUSY;
+		goto error_put;
+	}
+
+	scoped_guard(spinlock_irq, &vspx_pipe->lock) {
+		vspx_pipe->enabled = true;
+	}
+
+	mutex_unlock(&vspx_pipe->mutex);
+
+	return 0;
+
+error_put:
+	vsp1_device_put(vsp1);
+error_unlock:
+	mutex_unlock(&vspx_pipe->mutex);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(vsp1_isp_start_streaming);
+
+/**
+ * vsp1_isp_stop_streaming - Stop the VSPX
+ * @dev: The VSP1 struct device
+ *
+ * Stop the VSPX operation by stopping the vsp1 pipeline and waiting for the
+ * last frame in transfer, if any, to complete.
+ *
+ * A single call to this function is allowed. Attempting to stop an already
+ * stopped VSPX instance is a nop.
+ */
+void vsp1_isp_stop_streaming(struct device *dev)
+{
+	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
+	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
+	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
+
+	mutex_lock(&vspx_pipe->mutex);
+
+	scoped_guard(spinlock_irq, &vspx_pipe->lock) {
+		if (!vspx_pipe->enabled) {
+			mutex_unlock(&vspx_pipe->mutex);
+			return;
+		}
+
+		vspx_pipe->enabled = false;
+	}
+
+	WARN_ON_ONCE(vsp1_pipeline_stop(pipe));
+
+	vspx_pipe->vspx_frame_end = NULL;
+	vsp1_dlm_reset(pipe->output->dlm);
+	vsp1_device_put(vsp1);
+
+	mutex_unlock(&vspx_pipe->mutex);
+}
+EXPORT_SYMBOL_GPL(vsp1_isp_stop_streaming);
+
+/**
+ * vsp1_isp_job_prepare - Prepare a new buffer transfer job
+ * @dev: The VSP1 struct device
+ * @job: The job description
+ *
+ * Prepare a new buffer transfer job by populating a display list that will be
+ * later executed by a call to vsp1_isp_job_run().
+ * All pending jobs must be released after stopping the streaming operations
+ * with a call to vsp1_isp_job_release().
+ *
+ * In order for the VSPX to accept new jobs to prepare the VSPX must have been
+ * started.
+ *
+ * Return: %0 on success or a negative error code on failure
+ */
+int vsp1_isp_job_prepare(struct device *dev, struct vsp1_isp_job_desc *job)
+{
+	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
+	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
+	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
+	const struct v4l2_pix_format_mplane *pix_mp;
+	struct vsp1_dl_list *second_dl = NULL;
+	struct vsp1_dl_body *dlb;
+	struct vsp1_dl_list *dl;
+	int ret;
+
+	/*
+	 * Transfer the buffers described in the job: an optional ConfigDMA
+	 * parameters buffer and a RAW image.
+	 */
+
+	job->dl = vsp1_dl_list_get(pipe->output->dlm);
+	if (!job->dl)
+		return -ENOMEM;
+
+	dl = job->dl;
+	dlb = vsp1_dl_list_get_body0(dl);
+
+	/* Configure IIF routing and enable IIF function. */
+	vsp1_entity_route_setup(pipe->iif, pipe, dlb);
+	vsp1_entity_configure_stream(pipe->iif, pipe->iif->state, pipe,
+				     dl, dlb);
+
+	/* Configure WPF0 to enable RPF0 as source. */
+	vsp1_entity_route_setup(&pipe->output->entity, pipe, dlb);
+	vsp1_entity_configure_stream(&pipe->output->entity,
+				     pipe->output->entity.state, pipe,
+				     dl, dlb);
+
+	if (job->config.pairs) {
+		/* Writing less than 17 pairs corrupts the output images ( < 16
+		 * pairs) or freezes the VSPX operations (= 16 paris). Only
+		 * allow more than 16 pairs to be written.
+		 */
+		if (job->config.pairs <= 16) {
+			ret = -EINVAL;
+			goto error_put_dl;
+		}
+
+		/*
+		 * Configure RPF0 for ConfigDMA data. Transfer the number of
+		 * configuration pairs plus 2 words for the header.
+		 */
+		ret = vsp1_vspx_pipeline_configure(vsp1, job->config.mem,
+						   V4L2_META_FMT_GENERIC_8,
+						   job->config.pairs * 2 + 2, 1,
+						   job->config.pairs * 2 + 2,
+						   VSPX_IIF_SINK_PAD_CONFIG,
+						   dl, dlb);
+		if (ret)
+			goto error_put_dl;
+
+		second_dl = vsp1_dl_list_get(pipe->output->dlm);
+		if (!second_dl) {
+			ret = -ENOMEM;
+			goto error_put_dl;
+		}
+
+		dl = second_dl;
+		dlb = vsp1_dl_list_get_body0(dl);
+	}
+
+	/* Configure RPF0 for RAW image transfer. */
+	pix_mp = &job->img.fmt;
+	ret = vsp1_vspx_pipeline_configure(vsp1, job->img.mem,
+					   pix_mp->pixelformat,
+					   pix_mp->width, pix_mp->height,
+					   pix_mp->plane_fmt[0].bytesperline,
+					   VSPX_IIF_SINK_PAD_IMG, dl, dlb);
+	if (ret)
+		goto error_put_dl;
+
+	if (second_dl)
+		vsp1_dl_list_add_chain(job->dl, second_dl);
+
+	return 0;
+
+error_put_dl:
+	if (second_dl)
+		vsp1_dl_list_put(second_dl);
+	vsp1_dl_list_put(job->dl);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(vsp1_isp_job_prepare);
+
+/**
+ * vsp1_isp_job_run - Run a buffer transfer job
+ * @dev: The VSP1 struct device
+ * @job: The job to be run
+ *
+ * Run the display list contained in the job description provided by the caller.
+ * The job must have been prepared with a call to vsp1_isp_job_prepare() and
+ * the job's display list shall be valid.
+ *
+ * Jobs can be run only on VSPX instances which have not been stopped. Requests
+ * to run a job after the VSPX has been stopped are ignored and the job
+ * resources shall be released with a call to vsp1_isp_job_release().
+ *
+ * Return: %0 on success or a negative error code on failure
+ */
+int vsp1_isp_job_run(struct device *dev, struct vsp1_isp_job_desc *job)
+{
+	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
+	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
+	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
+	u32 value;
+
+	/* Make sure VSPX is not busy processing a frame. */
+	value = vsp1_read(vsp1, VI6_CMD(0));
+	if (value) {
+		dev_err(vsp1->dev,
+			"%s: Starting of WPF0 already reserved\n", __func__);
+		return -EBUSY;
+	}
+
+	scoped_guard(spinlock, &vspx_pipe->lock) {
+		/*
+		 * If a new job is scheduled when the VSPX is stopped, do
+		 * not run it.
+		 */
+		if (!vspx_pipe->enabled)
+			return -EINVAL;
+
+		vsp1_dl_list_commit(job->dl, 0);
+	}
+
+	scoped_guard(spinlock_irqsave, &pipe->irqlock) {
+		vsp1_pipeline_run(pipe);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vsp1_isp_job_run);
+
+/**
+ * vsp1_isp_job_release - Release a non processed transfer job
+ * @dev: The VSP1 struct device
+ * @job: The job to release
+ *
+ * Release a job prepared by a call to vsp1_isp_job_prepare() and not yet
+ * run. All pending jobs shall be released after streaming has been stopped.
+ */
+void vsp1_isp_job_release(struct device *dev,
+			  struct vsp1_isp_job_desc *job)
+{
+	vsp1_dl_list_put(job->dl);
+}
+EXPORT_SYMBOL_GPL(vsp1_isp_job_release);
+
+/* -----------------------------------------------------------------------------
+ * Initialization and cleanup
+ */
+
+int vsp1_vspx_init(struct vsp1_device *vsp1)
+{
+	struct vsp1_vspx_pipeline *vspx_pipe;
+	struct vsp1_pipeline *pipe;
+
+	vsp1->vspx = devm_kzalloc(vsp1->dev, sizeof(*vsp1->vspx), GFP_KERNEL);
+	if (!vsp1->vspx)
+		return -ENOMEM;
+
+	vsp1->vspx->vsp1 = vsp1;
+
+	vspx_pipe = &vsp1->vspx->pipe;
+	vspx_pipe->enabled = false;
+
+	pipe = &vspx_pipe->pipe;
+
+	vsp1_pipeline_init(pipe);
+
+	pipe->partitions = 1;
+	pipe->part_table = &vspx_pipe->partition;
+	pipe->interlaced = false;
+	pipe->frame_end = vsp1_vspx_pipeline_frame_end;
+
+	mutex_init(&vspx_pipe->mutex);
+	spin_lock_init(&vspx_pipe->lock);
+
+	/*
+	 * Initialize RPF0 as input for VSPX and use it unconditionally for
+	 * now.
+	 */
+	pipe->inputs[0] = vsp1->rpf[0];
+	pipe->inputs[0]->entity.pipe = pipe;
+	pipe->inputs[0]->entity.sink = &vsp1->iif->entity;
+	list_add_tail(&pipe->inputs[0]->entity.list_pipe, &pipe->entities);
+
+	pipe->iif = &vsp1->iif->entity;
+	pipe->iif->pipe = pipe;
+	pipe->iif->sink = &vsp1->wpf[0]->entity;
+	pipe->iif->sink_pad = RWPF_PAD_SINK;
+	list_add_tail(&pipe->iif->list_pipe, &pipe->entities);
+
+	pipe->output = vsp1->wpf[0];
+	pipe->output->entity.pipe = pipe;
+	list_add_tail(&pipe->output->entity.list_pipe, &pipe->entities);
+
+	return 0;
+}
+
+void vsp1_vspx_cleanup(struct vsp1_device *vsp1)
+{
+	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
+
+	mutex_destroy(&vspx_pipe->mutex);
+}
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_vspx.h b/drivers/media/platform/renesas/vsp1/vsp1_vspx.h
new file mode 100644
index 0000000000000000000000000000000000000000..f871bf9e7dece112c89bf493729cf627731be1d2
--- /dev/null
+++ b/drivers/media/platform/renesas/vsp1/vsp1_vspx.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * vsp1_vspx.h  --  R-Car Gen 4 VSPX
+ *
+ * Copyright (C) 2025 Ideas On Board Oy
+ * Copyright (C) 2025 Renesas Electronics Corporation
+ */
+#ifndef __VSP1_VSPX_H__
+#define __VSP1_VSPX_H__
+
+#include "vsp1.h"
+
+int vsp1_vspx_init(struct vsp1_device *vsp1);
+void vsp1_vspx_cleanup(struct vsp1_device *vsp1);
+
+#endif /* __VSP1_VSPX_H__ */
diff --git a/include/media/vsp1.h b/include/media/vsp1.h
index 4ea6352fd63fec152593133845f684e0c32f34d4..c9cdb3774a088f1c1fc48babad43cfd9774cedba 100644
--- a/include/media/vsp1.h
+++ b/include/media/vsp1.h
@@ -15,6 +15,10 @@
 
 struct device;
 
+/* -----------------------------------------------------------------------------
+ * VSP1 DU interface
+ */
+
 int vsp1_du_init(struct device *dev);
 
 #define VSP1_DU_STATUS_COMPLETE		BIT(0)
@@ -121,4 +125,89 @@ void vsp1_du_atomic_flush(struct device *dev, unsigned int pipe_index,
 int vsp1_du_map_sg(struct device *dev, struct sg_table *sgt);
 void vsp1_du_unmap_sg(struct device *dev, struct sg_table *sgt);
 
+/* -----------------------------------------------------------------------------
+ * VSP1 ISP interface
+ */
+
+/**
+ * struct vsp1_isp_buffer_desc - Describe a buffer allocated by VSPX
+ * @size: Byte size of the buffer allocated by VSPX
+ * @cpu_addr: CPU-mapped address of a buffer allocated by VSPX
+ * @dma_addr: bus address of a buffer allocated by VSPX
+ */
+struct vsp1_isp_buffer_desc {
+	size_t size;
+	void *cpu_addr;
+	dma_addr_t dma_addr;
+};
+
+/**
+ * struct vsp1_isp_job_desc - Describe a VSPX buffer transfer request
+ * @config: ConfigDMA buffer descriptor
+ * @config.pairs: number of reg-value pairs in the ConfigDMA buffer
+ * @config.mem: bus address of the ConfigDMA buffer
+ * @img: RAW image buffer descriptor
+ * @img.fmt: RAW image format
+ * @img.mem: bus address of the RAW image buffer
+ * @dl: pointer to the display list populated by the VSPX driver in the
+ *      vsp1_isp_job_prepare() function
+ *
+ * Describe a transfer request for the VSPX to perform on behalf of the ISP.
+ * The job descriptor contains an optional ConfigDMA buffer and one RAW image
+ * buffer. Set config.pairs to 0 if no ConfigDMA buffer should be transferred.
+ * The minimum number of config.pairs that can be written using ConfigDMA is 17.
+ * A number of pairs < 16 corrupts the output image. A number of pairs == 16
+ * freezes the VSPX operation. If the ISP driver wants has to write less than
+ * 17 pairs it shall pad the buffer with writes directed to registers that have
+ * no effect or avoid using ConfigDMA at all for such small write sequences.
+ *
+ * The ISP driver shall pass an instance this type to the vsp1_isp_job_prepare()
+ * function that will populate the display list pointer @dl using the @config
+ * and @img descriptors. When the job has to be run on the VSPX, the descriptor
+ * shall be passed to vsp1_isp_job_run() which consumes the display list.
+ *
+ * Job descriptors not yet run shall be released with a call to
+ * vsp1_isp_job_release() when stopping the streaming in order to properly
+ * release the resources acquired by vsp1_isp_job_prepare().
+ */
+struct vsp1_dl_list;
+struct vsp1_isp_job_desc {
+	struct {
+		unsigned int pairs;
+		dma_addr_t mem;
+	} config;
+	struct {
+		struct v4l2_pix_format_mplane fmt;
+		dma_addr_t mem;
+	} img;
+	struct vsp1_dl_list *dl;
+};
+
+/**
+ * struct vsp1_vspx_frame_end - VSPX frame end callback data
+ * @vspx_frame_end: Frame end callback. Called after a transfer job has been
+ *		    completed. If the job includes both a ConfigDMA and a
+ *		    RAW image, the callback is called after both have been
+ *		    transferred
+ * @frame_end_data: Frame end callback data, passed to vspx_frame_end
+ */
+struct vsp1_vspx_frame_end {
+	void (*vspx_frame_end)(void *data);
+	void *frame_end_data;
+};
+
+int vsp1_isp_init(struct device *dev);
+struct device *vsp1_isp_get_bus_master(struct device *dev);
+int vsp1_isp_alloc_buffer(struct device *dev, size_t size,
+			  struct vsp1_isp_buffer_desc *buffer_desc);
+void vsp1_isp_free_buffer(struct device *dev,
+			  struct vsp1_isp_buffer_desc *buffer_desc);
+int vsp1_isp_start_streaming(struct device *dev,
+			     struct vsp1_vspx_frame_end *frame_end);
+void vsp1_isp_stop_streaming(struct device *dev);
+int vsp1_isp_job_prepare(struct device *dev,
+			 struct vsp1_isp_job_desc *job);
+int vsp1_isp_job_run(struct device *dev, struct vsp1_isp_job_desc *job);
+void vsp1_isp_job_release(struct device *dev,  struct vsp1_isp_job_desc *job);
+
 #endif /* __MEDIA_VSP1_H__ */

---
base-commit: 4d2c3d70799f5eb210003613766bbd113bbebc1a
change-id: 20250502-b4-vspx-90c815bff6dd

Best regards,
-- 
Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>


