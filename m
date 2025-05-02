Return-Path: <linux-media+bounces-31586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AF9AA737F
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:27:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4D9B4E3001
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 13:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E683D257AD5;
	Fri,  2 May 2025 13:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZkHyJ+aL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB4D256C82;
	Fri,  2 May 2025 13:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746192220; cv=none; b=JJ4zgzdPOP5x7FXKzWWyDmkfHjUXrpmHl8u6+/gmAedA/irMNaj2++PIiz1aMc8ojaM9sd6hz6O47hDC2lG03F5mt3sN89A2huoAgdE8WKiZ50ybkEuRSfqnKwrzut3RbP9/8+aqKQWOpizpZCY8BkwMT6xBh7FGINeDbmBpXmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746192220; c=relaxed/simple;
	bh=P1qUfy5DwbjdTPzm6cFRZfdf0/YqBMm7FUVqVpgMLEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H5oel89WRnezrgSfnOY0773zuXJXTEtf3cE9oDhnimQj97IzBDfZ2E6zhE8e2SMsBJnzBoh6NIVIPYRuCIc9urlegZrmt8wPxzUGdN2V/8+9poU5ktuqvN+fmjyL6lSbXyzBlBu/xw32vS6wACYiKWSh+dm15ZHQw0PbCgr/wXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZkHyJ+aL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.109] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02C59353;
	Fri,  2 May 2025 15:23:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746192207;
	bh=P1qUfy5DwbjdTPzm6cFRZfdf0/YqBMm7FUVqVpgMLEc=;
	h=From:Date:Subject:To:Cc:From;
	b=ZkHyJ+aLSwLP8a50QbiQNehUwbkseivhwIawc07nqmqvitktwHfzWlCuhkl3VcUbO
	 gYWJfnrPwpGuowiwRvz1j1cyFrCEaWlzcK90lbxSZ4XYPrapofKoNlI/JI7DNgBbgu
	 mxijQ5V5LtQk3n/VVA+x/zljrTrPzBwPrArZP3cs=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Fri, 02 May 2025 15:23:10 +0200
Subject: [PATCH v8] media: vsp1: Add VSPX support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-b4-vspx-v8-1-b2a7592668dd@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAD7HFGgC/yXMyw6DIBCF4Vchsy4JEFDrqzQuBGZ0Fl4KakyM7
 15Sl9/JyX9BxsSYoRUXJDw48zIXNC8BYeznASXHYjDKOOWUkd7KI6+nfKvQaOeJqhihvNeExOe
 /9OkeJ/zuJbg9I/g+owzLNPHWCh2tJlvXsSKC7r5/oaCcN4kAAAA=
X-Change-ID: 20250502-b4-vspx-90c815bff6dd
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=29554;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=P1qUfy5DwbjdTPzm6cFRZfdf0/YqBMm7FUVqVpgMLEc=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBoFMdWJBBkNmqKhcgbaQ5lKM3wuSh42pjoDYocV
 +YonIT6n5GJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaBTHVgAKCRByNAaPFqFW
 PEwrD/9tspoxtBkIemTABszdCqvIa8CvTHYQeRo6wxfwGKJ26jE6DiaCg6957oWI0v+H71rMO49
 iiJKV2FsaKI3j2SHyXgebEcvoHPKyzjOVtHWC/ufDzw+h2qFP6iUBYzCow21AiDphcLEF5Ym+AL
 pRasxj+4NfaljTunGXAB8Z0Z1IEpOi0p45FEkBynrOzw62tdu7BOUVKHw32iEOGe+WughN1RdyV
 JHlC4EhEx4Roku0/mlRgChEafgWF7eLYyHMkhzYAProEg5+62NOVIU3nIFBRKHiYhqHKbbHFtmr
 oQnFciHz6zEgAkAJhNBBJFgBBbxsRDgYIYwL3ow5mnf/jGp/1bA62ZuijgPjT7mA5pCSfeqG3Ws
 q97IZfHil1Av7vKRf3fAGfKJlNou9XyL6l0gTYOw58UASl56oGwQIpt18FqaPdw8O7HXNpEZNbK
 wgFZhC38joiGidAEp0AsreCy7rAgKaVVxe0BP5ZUOQNm+fspIen1fDiuflO1ooMt/5NhaN4tS31
 xfUsECck3pVCoTB+4mt73ghcZz7Sk9zvZlM/mSbezVUKfUzyfDYf+bGogwOVZXIzqwqzAzhaxNl
 J2MMXTBwT4FfBSCa+tTr/ja+HEXTNgdtnwdrEx/NeAdBmpQ4oaY8SS1lrgXl5uxrkWLJTBtzbeg
 2iZ9Ub3XmHogFvQ==
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
 drivers/media/platform/renesas/vsp1/vsp1_vspx.c | 664 ++++++++++++++++++++++++
 drivers/media/platform/renesas/vsp1/vsp1_vspx.h |  16 +
 include/media/vsp1.h                            |  75 +++
 7 files changed, 770 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/Makefile b/drivers/media/platform/renesas/vsp1/Makefile
index de8c802e1d1a..2057c8f7be47 100644
--- a/drivers/media/platform/renesas/vsp1/Makefile
+++ b/drivers/media/platform/renesas/vsp1/Makefile
@@ -6,5 +6,6 @@ vsp1-y					+= vsp1_clu.o vsp1_hsit.o vsp1_lut.o
 vsp1-y					+= vsp1_brx.o vsp1_sru.o vsp1_uds.o
 vsp1-y					+= vsp1_hgo.o vsp1_hgt.o vsp1_histo.o
 vsp1-y					+= vsp1_iif.o vsp1_lif.o vsp1_uif.o
+vsp1-y					+= vsp1_vspx.o
 
 obj-$(CONFIG_VIDEO_RENESAS_VSP1)	+= vsp1.o
diff --git a/drivers/media/platform/renesas/vsp1/vsp1.h b/drivers/media/platform/renesas/vsp1/vsp1.h
index 263024639dd2..1872e403f26b 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1.h
@@ -110,6 +110,7 @@ struct vsp1_device {
 	struct media_entity_operations media_ops;
 
 	struct vsp1_drm *drm;
+	struct vsp1_vspx *vspx;
 };
 
 int vsp1_device_get(struct vsp1_device *vsp1);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index d13e9b31aa7c..e338ab8af292 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -38,6 +38,7 @@
 #include "vsp1_uds.h"
 #include "vsp1_uif.h"
 #include "vsp1_video.h"
+#include "vsp1_vspx.h"
 
 /* -----------------------------------------------------------------------------
  * Interrupt Handling
@@ -488,7 +489,10 @@ static int vsp1_create_entities(struct vsp1_device *vsp1)
 
 		ret = media_device_register(mdev);
 	} else {
-		ret = vsp1_drm_init(vsp1);
+		if (vsp1->info->version == VI6_IP_VERSION_MODEL_VSPX_GEN4)
+			ret = vsp1_vspx_init(vsp1);
+		else
+			ret = vsp1_drm_init(vsp1);
 	}
 
 done:
@@ -846,6 +850,13 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
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
index 86e47c2d991f..10cfbcd1b6e0 100644
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
index 000000000000..6edb5e4929d9
--- /dev/null
+++ b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
@@ -0,0 +1,664 @@
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
+ * @vspx_lock: protect access to the VSPX configuration and the jobs queue
+ * @enabled: the enable flag
+ * @jobs: jobs queue
+ * @vspx_frame_end: frame end callback
+ * @frame_end_data: data for the frame end callback
+ */
+struct vsp1_vspx_pipeline {
+	struct vsp1_pipeline pipe;
+	struct vsp1_partition partition;
+
+	/* Protects the pipeline configuration */
+	spinlock_t vspx_lock;
+	bool enabled;
+
+	struct list_head jobs;
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
+ * struct vsp1_vspx_job - VSPX transfer job
+ * @dl: display list populated by vsp1_isp_job_prepare()
+ * @job_queue: list handle
+ */
+struct vsp1_vspx_job {
+	struct vsp1_dl_list *dl;
+	struct list_head job_queue;
+};
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
+static const struct v4l2_pix_format_mplane vspx_default_fmt = {
+	.width = 1920,
+	.height = 1080,
+	.pixelformat = V4L2_PIX_FMT_SRGGB8,
+	.field = V4L2_FIELD_NONE,
+	.num_planes = 1,
+	.plane_fmt = {
+		[0] = {
+			.sizeimage = 1920 * 1080,
+			.bytesperline = 1920,
+		},
+	},
+};
+
+/*
+ * Apply the given width, height and fourcc to the subdevice inside the
+ * VSP1 entity.
+ */
+static int vsp1_vspx_rwpf_set_subdev_fmt(struct vsp1_device *vsp1,
+					 struct vsp1_rwpf *rwpf,
+					 u32 isp_fourcc,
+					 unsigned int width,
+					 unsigned int height)
+{
+	struct vsp1_entity *ent = &rwpf->entity;
+	const struct vsp1_format_info *fmtinfo;
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
+	fmtinfo = vsp1_get_format_info(vsp1, vspx_fourcc);
+	rwpf->fmtinfo = fmtinfo;
+
+	format.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	format.pad = RWPF_PAD_SINK;
+	format.format.width = width;
+	format.format.height = height;
+	format.format.field = V4L2_FIELD_NONE;
+	format.format.code = fmtinfo->mbus;
+
+	return v4l2_subdev_call(&ent->subdev, pad, set_fmt, NULL, &format);
+}
+
+/* Configure RPF0 for ConfigDMA and RAW image transfer. */
+static int vsp1_vspx_rpf0_configure(struct vsp1_device *vsp1,
+				    dma_addr_t addr, u32 isp_fourcc,
+				    unsigned int width, unsigned int height,
+				    unsigned int stride,
+				    unsigned int iif_sink_pad,
+				    struct vsp1_dl_list *dl,
+				    struct vsp1_dl_body *dlb)
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
+	vsp1_pipeline_calculate_partition(pipe, &pipe->part_table[0],
+					  width, 0);
+
+	rpf0->format.plane_fmt[0].bytesperline = stride;
+
+	/*
+	 * Connect RPF0 to the IIF sink pad corresponding to the config or image
+	 * path.
+	 */
+	rpf0->entity.sink_pad = iif_sink_pad;
+
+	pipe->part_table[0].rpf[0].width = width;
+	pipe->part_table[0].rpf[0].height = height;
+
+	rpf0->mem.addr[0] = addr;
+	rpf0->mem.addr[1] = 0;
+	rpf0->mem.addr[2] = 0;
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
+ *
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
+ *
+ * The VSPX accesses memory through an FCPX instance. When allocating memory
+ * buffers that will have to be accessed by the VSPX the 'struct device' of
+ * the FCPX should be used. Use this function to get a reference to it.
+ *
+ * @dev: The VSP1 struct device
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
+ *
+ * Allocate a buffer that will be later accessed by the VSPX. Buffers allocated
+ * using vsp1_isp_alloc_buffer() shall be released with a call to
+ * vsp1_isp_free_buffer().
+ *
+ * @dev: The VSP1 struct device
+ * @size: The size of the buffer to be allocated by the VSPX
+ * @buffer_desc: The allocated buffer descriptor, will be filled with the
+ *		 buffer CPU-mapped address, the bus address and the allocated
+ *		 buffer size
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
+ *
+ * Release memory in the VSPX address space allocated by
+ * vsp1_isp_alloc_buffer().
+ *
+ * @dev: The VSP1 struct device
+ * @buffer_desc: The descriptor of the buffer to release as returned by
+ *		 vsp1_isp_alloc_buffer()
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
+ *
+ * Start the VSPX and prepare for accepting buffer transfer job requests.
+ *
+ * @dev: The VSP1 struct device
+ * @frame_end: The frame end callback description
+ *
+ * Return: %0 on success or a negative error code on failure
+ */
+int vsp1_isp_start_streaming(struct device *dev,
+			     struct vsp1_vspx_frame_end *frame_end)
+{
+	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
+	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
+	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
+	unsigned long flags;
+	u32 value;
+	int ret;
+
+	spin_lock_irqsave(&vspx_pipe->vspx_lock, flags);
+
+	if (vspx_pipe->enabled) {
+		spin_unlock_irqrestore(&vspx_pipe->vspx_lock, flags);
+		return 0;
+	}
+
+	if (!frame_end) {
+		spin_unlock_irqrestore(&vspx_pipe->vspx_lock, flags);
+		return -EINVAL;
+	}
+
+	vspx_pipe->vspx_frame_end = frame_end->vspx_frame_end;
+	vspx_pipe->frame_end_data = frame_end->frame_end_data;
+
+	/* Make sure VSPX is not active. */
+	value = vsp1_read(vsp1, VI6_CMD(0));
+	if (value & VI6_CMD_STRCMD) {
+		dev_err(vsp1->dev,
+			"%s: Starting of WPF0 already reserved\n", __func__);
+		spin_unlock_irqrestore(&vspx_pipe->vspx_lock, flags);
+		return -EBUSY;
+	}
+
+	value = vsp1_read(vsp1, VI6_STATUS);
+	if (value & VI6_STATUS_SYS_ACT(0)) {
+		dev_err(vsp1->dev,
+			"%s: WPF0 has not entered idle state\n", __func__);
+		spin_unlock_irqrestore(&vspx_pipe->vspx_lock, flags);
+		return -EBUSY;
+	}
+
+	vspx_pipe->enabled = true;
+
+	spin_unlock_irqrestore(&vspx_pipe->vspx_lock, flags);
+
+	/* Enable the VSP1 and prepare for streaming. */
+	vsp1_pipeline_dump(pipe, "VSPX job");
+
+	ret = vsp1_device_get(vsp1);
+	if (ret < 0) {
+		guard(spinlock_irqsave)(&vspx_pipe->vspx_lock);
+		vspx_pipe->enabled = false;
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vsp1_isp_start_streaming);
+
+/**
+ * vsp1_isp_stop_streaming - Stop the VSPX
+ *
+ * @dev: The VSP1 struct device
+ */
+void vsp1_isp_stop_streaming(struct device *dev)
+{
+	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
+	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
+	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
+	unsigned long flags;
+
+	spin_lock_irqsave(&vspx_pipe->vspx_lock, flags);
+
+	if (!vspx_pipe->enabled) {
+		spin_unlock_irqrestore(&vspx_pipe->vspx_lock, flags);
+		return;
+	}
+
+	vspx_pipe->enabled = false;
+
+	pipe->state = VSP1_PIPELINE_STOPPED;
+	vsp1_pipeline_stop(pipe);
+	vspx_pipe->vspx_frame_end = NULL;
+	vsp1_dlm_reset(pipe->output->dlm);
+
+	spin_unlock_irqrestore(&vspx_pipe->vspx_lock, flags);
+
+	vsp1_device_put(vsp1);
+}
+EXPORT_SYMBOL_GPL(vsp1_isp_stop_streaming);
+
+/**
+ * vsp1_vspx_job_prepare - Prepare a new buffer transfer job
+ *
+ * Prepare a new buffer transfer job by populating a display list that will be
+ * later executed by a call to vsp1_isp_job_run().
+ *
+ * The newly created job is appended to the queue of pending jobs. All pending
+ * jobs must be released after stopping the streaming operations with a call
+ * to vsp1_isp_jobs_release().
+ *
+ * @dev: The VSP1 struct device
+ * @job: The job description
+ *
+ * Return: %0 on success or a negative error code on failure
+ */
+int vsp1_isp_job_prepare(struct device *dev,
+			 const struct vsp1_isp_job_desc *desc)
+{
+	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
+	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
+	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
+	const struct v4l2_pix_format_mplane *pix_mp;
+	struct vsp1_dl_list *second_dl = NULL;
+	struct vsp1_vspx_job *job;
+	struct vsp1_dl_body *dlb;
+	struct vsp1_dl_list *dl;
+	int ret;
+
+	/* Memory will be released when the job is consumed. */
+	job = kmalloc(sizeof(*job), GFP_KERNEL);
+	if (!job)
+		return -ENOMEM;
+
+	/*
+	 * Transfer the buffers described in the job: an optional ConfigDMA
+	 * parameters buffer and a RAW image.
+	 */
+
+	job->dl = vsp1_dl_list_get(pipe->output->dlm);
+	if (!job->dl) {
+		ret = -ENOMEM;
+		goto error_free_job;
+	}
+
+	dl = job->dl;
+	dlb = vsp1_dl_list_get_body0(dl);
+
+	/* Disable RPF1. */
+	vsp1_dl_body_write(dlb, vsp1->rpf[1]->entity.route->reg,
+			   VI6_DPR_NODE_UNUSED);
+
+	/* Configure IIF routing and enable IIF function */
+	vsp1_entity_route_setup(pipe->iif, pipe, dlb);
+	vsp1_entity_configure_stream(pipe->iif, pipe->iif->state, pipe,
+				     dl, dlb);
+
+	/* Configure WPF0 to enable RPF0 as source*/
+	vsp1_entity_route_setup(&pipe->output->entity, pipe, dlb);
+	vsp1_entity_configure_stream(&pipe->output->entity,
+				     pipe->output->entity.state, pipe,
+				     dl, dlb);
+
+	if (desc->config.pairs) {
+		/*
+		 * Configure RPF0 for config data. Transfer the number of
+		 * configuration pairs plus 2 words for the header.
+		 */
+		ret = vsp1_vspx_rpf0_configure(vsp1, desc->config.mem,
+					       V4L2_META_FMT_GENERIC_8,
+					       desc->config.pairs * 2 + 2, 1,
+					       desc->config.pairs * 2 + 2,
+					       VSPX_IIF_SINK_PAD_CONFIG,
+					       dl, dlb);
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
+	pix_mp = &desc->img.fmt.fmt.pix_mp;
+	ret = vsp1_vspx_rpf0_configure(vsp1, desc->img.mem,
+				       pix_mp->pixelformat,
+				       pix_mp->width, pix_mp->height,
+				       pix_mp->plane_fmt[0].bytesperline,
+				       VSPX_IIF_SINK_PAD_IMG, dl, dlb);
+	if (ret)
+		goto error_put_dl;
+
+	if (second_dl)
+		vsp1_dl_list_add_chain(job->dl, second_dl);
+
+	scoped_guard(spinlock_irqsave, &vspx_pipe->vspx_lock) {
+		list_add_tail(&job->job_queue, &vspx_pipe->jobs);
+	}
+
+	return 0;
+
+error_put_dl:
+	if (second_dl)
+		vsp1_dl_list_put(second_dl);
+	vsp1_dl_list_put(job->dl);
+error_free_job:
+	kfree(job);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(vsp1_isp_job_prepare);
+
+/**
+ * vsp1_isp_job_run - Run the first pending transfer job
+ *
+ * Extract the first available job from the pending job queue and execute the
+ * display list there contained. The ISP driver shall call this function when a
+ * new transfer of a ConfigDMA parameters buffer and RAW image is required.
+ *
+ * @dev: The VSP1 struct device
+ *
+ * Return: %0 on success or a negative error code on failure
+ */
+int vsp1_isp_job_run(struct device *dev)
+{
+	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
+	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
+	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
+	struct vsp1_vspx_job *job;
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
+	scoped_guard(spinlock_irqsave, &vspx_pipe->vspx_lock) {
+
+		job = list_first_entry_or_null(&vspx_pipe->jobs,
+					       struct vsp1_vspx_job,
+					       job_queue);
+		if (!job)
+			return -ENODEV;
+
+		list_del(&job->job_queue);
+
+		/* Apply the display list. */
+		vsp1_dl_list_commit(job->dl, 0);
+		kfree(job);
+	}
+
+	scoped_guard(spinlock_irqsave, &pipe->irqlock) {
+		/*
+		 * Operating the vsp1_pipe in singleshot mode requires to
+		 * manually set the pipeline state to stopped.
+		 */
+		pipe->state = VSP1_PIPELINE_STOPPED;
+		vsp1_pipeline_run(pipe);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vsp1_isp_job_run);
+
+/**
+ * vsp1_isp_jobs_release - Release all pending VSPX jobs
+ *
+ * Release jobs prepared by a call to vsp1_vspx_job_prepare() and not yet
+ * processed. Pending jobs shall be released after streaming has been stopped.
+ *
+ * @dev: The VSP1 struct device
+ */
+void vsp1_isp_jobs_release(struct device *dev)
+{
+	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
+	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
+	struct vsp1_vspx_job *job, *tmp;
+
+	guard(spinlock_irqsave)(&vspx_pipe->vspx_lock);
+
+	list_for_each_entry_safe(job, tmp, &vspx_pipe->jobs, job_queue) {
+		list_del(&job->job_queue);
+		vsp1_dl_list_put(job->dl);
+		kfree(job);
+	}
+}
+EXPORT_SYMBOL_GPL(vsp1_isp_jobs_release);
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
+	INIT_LIST_HEAD(&vspx_pipe->jobs);
+	spin_lock_init(&vspx_pipe->vspx_lock);
+
+	/*
+	 * Initialize RPF0 as input for VSPX and use it unconditionally for
+	 * now.
+	 */
+	pipe->inputs[0] = vsp1->rpf[0];
+	pipe->inputs[0]->entity.pipe = pipe;
+	pipe->inputs[0]->entity.sink = &vsp1->iif->entity;
+	vsp1_vspx_rwpf_set_subdev_fmt(vsp1, pipe->inputs[0],
+				      vspx_default_fmt.pixelformat,
+				      vspx_default_fmt.width,
+				      vspx_default_fmt.height);
+	list_add(&pipe->inputs[0]->entity.list_pipe, &pipe->entities);
+
+	pipe->iif = &vsp1->iif->entity;
+	pipe->iif->pipe = pipe;
+	pipe->iif->sink = &vsp1->wpf[0]->entity;
+	pipe->iif->sink_pad = RWPF_PAD_SINK;
+	list_add_tail(&pipe->iif->list_pipe, &pipe->entities);
+
+	pipe->output = vsp1->wpf[0];
+	pipe->output->entity.pipe = pipe;
+	vsp1_vspx_rwpf_set_subdev_fmt(vsp1, pipe->output,
+				      vspx_default_fmt.pixelformat,
+				      vspx_default_fmt.width,
+				      vspx_default_fmt.height);
+	list_add_tail(&pipe->output->entity.list_pipe, &pipe->entities);
+
+	return 0;
+}
+
+void vsp1_vspx_cleanup(struct vsp1_device *vsp1)
+{
+	vsp1_isp_jobs_release(vsp1->dev);
+}
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_vspx.h b/drivers/media/platform/renesas/vsp1/vsp1_vspx.h
new file mode 100644
index 000000000000..f871bf9e7dec
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
index 48f4a5023d81..6843e8e85520 100644
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
@@ -117,4 +121,75 @@ void vsp1_du_atomic_flush(struct device *dev, unsigned int pipe_index,
 int vsp1_du_map_sg(struct device *dev, struct sg_table *sgt);
 void vsp1_du_unmap_sg(struct device *dev, struct sg_table *sgt);
 
+/* -----------------------------------------------------------------------------
+ * VSP1 ISP interface
+ */
+
+/**
+ * struct vsp1_isp_buffer_desc - Describe a buffer allocated by VSPX
+ *
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
+ *
+ * Describe a transfer request for the VSPX to perform on behalf of the ISP.
+ * The transfer job descriptor contains an optional ConfigDMA buffer and
+ * one RAW image buffer. Set config.pairs to 0 if no ConfigDMA buffer should
+ * be transferred.
+ *
+ * @config: ConfigDMA buffer
+ * @config.pairs: number of reg-value pairs in the ConfigDMA buffer
+ * @config.mem: bus address of the ConfigDMA buffer
+ * @img: RAW image buffer
+ * @img.fmt: RAW image format
+ * @img.mem: bus address of the RAW image buffer
+ */
+struct vsp1_isp_job_desc {
+	struct {
+		unsigned int pairs;
+		dma_addr_t mem;
+	} config;
+	struct {
+		struct v4l2_format fmt;
+		dma_addr_t mem;
+	} img;
+};
+
+/**
+ * struct vsp1_vspx_frame_end - VSPX frame end callback data
+ *
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
+			 const struct vsp1_isp_job_desc *desc);
+int vsp1_isp_job_run(struct device *dev);
+void vsp1_isp_jobs_release(struct device *dev);
+
 #endif /* __MEDIA_VSP1_H__ */

---
base-commit: 1d41f477d6ff5f5eb0b78b37644ffac0785602c9
change-id: 20250502-b4-vspx-90c815bff6dd

Best regards,
-- 
Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>


