Return-Path: <linux-media+bounces-29160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAAFA77D9C
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 16:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFBBC188DFA1
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 14:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA02205AC0;
	Tue,  1 Apr 2025 14:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mOL2VZoX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC07204C20;
	Tue,  1 Apr 2025 14:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517351; cv=none; b=EHULEgOpMSnysTTSWLlj0v+ABOurg6xUL7dvFb0oAQLXx1XrZn3aq1vkEadz8X+0zr1pTgpx6oGS9RSDkGlBux00/e4qSQ2qPa+cq/3D8V8jGUGFk5b6vitEV25L1/LovUOxg10wl192wwe2Agbghc7DlKoqmV1szmjRbyekEjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517351; c=relaxed/simple;
	bh=ffuC5MMpcY2zXF2XPT7tVPI79Wwee2oWw/OvOYr8uZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QKrAIYY2nd2U1g32Pp2736MDGMozLV+G1anXQPWq0dmZ+37HZHy8w7snfk/YJ/sjt7Qc8XpgnL/ZMFruhW4C/nDz5vtdpEhP4vTVynkTXPkRdXzE84IJMU6vORvHx+NrWuRO+AR1TUgIH/Y3JaNPtR2uXEu4z9Oz5bU09d+Imls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mOL2VZoX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.101] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42BB21BC1;
	Tue,  1 Apr 2025 16:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743517221;
	bh=ffuC5MMpcY2zXF2XPT7tVPI79Wwee2oWw/OvOYr8uZk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mOL2VZoXTTNm2XpTYFiLGDTlZOMV1fUMTXPrvyqjWfnay6UUYw1+y1nw2lwiVPkcy
	 tz5rw4ZywAarYNmQ+bQTPesnHZP1sKLctTsWhcxbLcpP0pqTZVFgw6yoqwh/lHmbvr
	 SnFfCcnGqGVo1gtx+gIvqOxOEbaSQv19Du0zvGb0=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Tue, 01 Apr 2025 16:22:05 +0200
Subject: [PATCH v7 5/5] media: vsp1: Add VSPX support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-v4h-iif-v7-5-cc547c0bddd5@ideasonboard.com>
References: <20250401-v4h-iif-v7-0-cc547c0bddd5@ideasonboard.com>
In-Reply-To: <20250401-v4h-iif-v7-0-cc547c0bddd5@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=26148;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=ffuC5MMpcY2zXF2XPT7tVPI79Wwee2oWw/OvOYr8uZk=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn6/aRMUFg4Ki4nrMJPxYn/8E5qmFbaTuNgtCMS
 Vkiw77u9nuJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ+v2kQAKCRByNAaPFqFW
 PHQND/oDR47H4vwVltvxg+ux+/uMJzVv/MXqTlcRyQwucnlKi89xAtRVF/KZ9ipo+Lwl1PcA4K6
 OVJMhc7qDqKtEqiIG115i82XMCjtXrijvSiFYTcqp0yN9kITmFpahb3DfISdyfR7sr6x4CdCytT
 rhYc1+dLGUT18VMZ2/RvDBGjWuQ9zB6bAhJZfHzhicb1K0cB9IaNIWJGs5dUo5wy39OA06v77z+
 l6auPv4vmWQsAd7a4SjF8pkdq5rsabGR8g2ecGJ1KMd3LmTYPd7q59d9hKBNChGcYVBXi0QcX0C
 IKPpAX0bbJ38cOGf/GxjOMK5LThtUcMFLngmdqehk+uXSO9dP6ewQZo32ExtfhRX3xENJSIa0TM
 uwjykVIvDvOWDeuQtt3zfD/PEIpuAWVNLy970QwXRFnh4Gdn065hf6qEnHJPbKXNrvxZ9dlkInM
 IXkECCU4lbBty+kdgjmkxvMbMEZ0N21ByH2wkGlJanAU5xMeplqId2OuB18BfrBvXSpYF74YYop
 TtMnsd8al76w8UM92ED9ZfGiRnacqCmMiVlbEdrokZAPiPMNqKSvEPkZxfI70zeP5eSBl3BLKW8
 EyH9DS7URNUCKL2Kvr3F07zWd3JiAvnYTRKG+o3e0rmim4Jv5aJesOS0xhU70GlHxXIJI4h44A8
 LH0VAj5rERw6Nfg==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add support for VSPX, a specialized version of the VSP2 that
transfer data to the ISP. The VSPX is composed by two RPF units
to read data from external memory and an IIF instance that performs
transfer towards the ISP.

The VSPX is supported through a newly introduced vsp1_vspx.c file that
exposes two interfaces: vsp1_vspx interface, declared in vsp1_vspx.h
for the vsp1 core to initialize and cleanup the VSPX, and a vsp1_isp
interface, declared in include/media/vsp1.h for the ISP driver to
control the VSPX operations.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/Makefile    |   1 +
 drivers/media/platform/renesas/vsp1/vsp1.h      |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_drv.c  |  13 +-
 drivers/media/platform/renesas/vsp1/vsp1_regs.h |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_vspx.c | 604 ++++++++++++++++++++++++
 drivers/media/platform/renesas/vsp1/vsp1_vspx.h |  86 ++++
 include/media/vsp1.h                            |  73 +++
 7 files changed, 778 insertions(+), 1 deletion(-)

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
index 000000000000..db9707f2b532
--- /dev/null
+++ b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
@@ -0,0 +1,604 @@
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
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/slab.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-subdev.h>
+#include <media/vsp1.h>
+
+#include "vsp1.h"
+#include "vsp1_dl.h"
+#include "vsp1_iif.h"
+#include "vsp1_pipe.h"
+#include "vsp1_rwpf.h"
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
+	int ret;
+
+	switch (isp_fourcc) {
+	case V4L2_PIX_FMT_GREY:
+		/* 8 bit RAW Bayer */
+		vspx_fourcc = V4L2_PIX_FMT_RGB332;
+		break;
+	case V4L2_PIX_FMT_Y10:
+	case V4L2_PIX_FMT_Y12:
+	case V4L2_PIX_FMT_Y16:
+		/* 10, 12 and 16 bit RAW Bayer */
+		vspx_fourcc = V4L2_PIX_FMT_RGB565;
+		break;
+	case V4L2_PIX_FMT_XBGR32:
+		/* ConfigDMA */
+		vspx_fourcc = V4L2_PIX_FMT_XBGR32;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	fmtinfo = vsp1_get_format_info(vsp1, vspx_fourcc);
+	if (!fmtinfo) {
+		dev_dbg(vsp1->dev, "Unsupported pixel format %08x\n",
+			vspx_fourcc);
+		return -EINVAL;
+	}
+
+	rwpf->fmtinfo = fmtinfo;
+
+	format.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	format.pad = RWPF_PAD_SINK;
+	format.format.width = width;
+	format.format.height = height;
+	format.format.field = V4L2_FIELD_NONE;
+	format.format.code = fmtinfo->mbus;
+
+	ret = v4l2_subdev_call(&ent->subdev, pad, set_fmt, NULL, &format);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+/*
+ * Configure RPF0 for ConfigDMA or RAW image transfer.
+ */
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
+static void vsp1_vspx_pipeline_frame_end(struct vsp1_pipeline *pipe,
+					 unsigned int completion)
+{
+	struct vsp1_vspx_pipeline *vspx_pipe = to_vsp1_vspx_pipeline(pipe);
+	struct vsp1_vspx *vspx = to_vsp1_vspx(vspx_pipe);
+
+	if (vspx_pipe->vspx_frame_end)
+		vspx_pipe->vspx_frame_end(vspx_pipe->frame_end_data);
+
+	/*
+	 * Set the pipeline state to stopped to ensure the next call to
+	 * vsp1_pipeline_run() actually starts the VSPX.
+	 */
+	scoped_guard(spinlock_irqsave, &pipe->irqlock) {
+		pipe->state = VSP1_PIPELINE_STOPPED;
+	}
+
+	scoped_guard(spinlock_irqsave, &vspx_pipe->vspx_lock) {
+		vspx_pipe->processing = false;
+	}
+
+	/* Try schedule a new job from the queue. */
+	vsp1_isp_job_run(vspx->vsp1->dev);
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
+ * The VSPX access memory through an FCPX instance. When allocating memory
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
+ * vsp1_isp_alloc_buffers - Allocate buffers in the VSPX address space
+ *
+ * Allocate buffers that will be later accessed by the VSPX.
+ *
+ * @dev: The VSP1 struct device
+ * @size: The size of the buffer to be allocated by the VSPX
+ * @buffer_desc: The allocated buffer description, will be filled with the
+ *		 buffer CPU-mapped address and the bus address
+ *
+ * Return: %0 on success or a negative error code on failure
+ */
+int vsp1_isp_alloc_buffers(struct device *dev, size_t size,
+			   struct vsp1_isp_buffer_desc *buffer_desc)
+{
+	struct device *bus_master = vsp1_isp_get_bus_master(dev);
+
+	if (IS_ERR_OR_NULL(bus_master))
+		return -ENODEV;
+
+	buffer_desc->cpu_addr = dma_alloc_coherent(bus_master, size,
+						   &buffer_desc->dma_addr,
+						   GFP_KERNEL);
+	if (IS_ERR_OR_NULL(buffer_desc->cpu_addr))
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vsp1_isp_alloc_buffers);
+
+/**
+ * vsp1_isp_configure - Configure the VSPX with the RAW image format
+ *
+ * Apply to the VSPX RPF/WPF the size of the RAW image that will be transferred
+ * to the ISP.
+ *
+ * @dev: The VSP1 struct device
+ * @fmt: The RAW image format description
+ *
+ * Return: %0 on success or a negative error code on failure
+ */
+int vsp1_isp_configure(struct device *dev,
+		       const struct v4l2_pix_format_mplane *fmt)
+{
+	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
+	struct vsp1_vspx_pipeline *vspx_pipe;
+	struct vsp1_pipeline *pipe;
+	int ret;
+
+	vspx_pipe = &vsp1->vspx->pipe;
+	pipe = &vspx_pipe->pipe;
+
+	/*
+	 * Apply the same format to the RPF0 and WPF0 so that the partition
+	 * calculation results in a single partition.
+	 */
+	ret = vsp1_vspx_rwpf_set_subdev_fmt(vsp1, pipe->inputs[0],
+					    fmt->pixelformat, fmt->width,
+					    fmt->height);
+	if (ret)
+		return ret;
+
+	ret = vsp1_vspx_rwpf_set_subdev_fmt(vsp1, pipe->output, fmt->pixelformat,
+					    fmt->width, fmt->height);
+	if (ret)
+		return ret;
+
+	vsp1_pipeline_calculate_partition(pipe, &pipe->part_table[0],
+					  fmt->width, 0);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vsp1_isp_configure);
+
+static void vsp1_vspx_release_jobs(struct vsp1_device *vsp1)
+{
+	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
+	struct vsp1_vspx_job *job, *tmp;
+
+	guard(spinlock_irqsave)(&vspx_pipe->jobs_lock);
+
+	list_for_each_entry_safe(job, tmp, &vspx_pipe->jobs, job_queue) {
+		list_del(&job->job_queue);
+		vsp1_dl_list_put(job->dl);
+		kfree(job);
+	}
+}
+
+/**
+ * vsp1_isp_start_streaming - Start processing VSPX jobs
+ *
+ * Start the VSPX and prepare for accepting buffer transfer job requests.
+ *
+ * @dev: The VSP1 struct device
+ * @frame_end: The frame end callback description
+ * @enable: The enable/disable streaming flag
+ *
+ * Return: %0 on success or a negative error code on failure
+ */
+int vsp1_isp_start_streaming(struct device *dev,
+			     struct vsp1_vspx_frame_end *frame_end,
+			     bool enable)
+{
+	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
+	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
+	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
+	u32 value;
+	int ret;
+
+	scoped_guard(spinlock_irqsave, &vspx_pipe->vspx_lock) {
+		if (vspx_pipe->enabled == enable)
+			return 0;
+
+		vspx_pipe->enabled = enable;
+	}
+
+	if (!enable) {
+		pipe->state = VSP1_PIPELINE_STOPPED;
+		vsp1_pipeline_stop(pipe);
+		vsp1_vspx_release_jobs(vsp1);
+		vspx_pipe->processing = false;
+		vspx_pipe->vspx_frame_end = NULL;
+		vsp1_dlm_reset(pipe->output->dlm);
+		vsp1_device_put(vsp1);
+		return 0;
+	}
+
+	if (!frame_end) {
+		ret = -EINVAL;
+		goto error_stop_pipe;
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
+		ret = -EBUSY;
+		goto error_stop_pipe;
+	}
+
+	value = vsp1_read(vsp1, VI6_STATUS);
+	if (value & VI6_STATUS_SYS_ACT(0)) {
+		dev_err(vsp1->dev,
+			"%s: WPF0 has not entered idle state\n", __func__);
+		ret = -EBUSY;
+		goto error_stop_pipe;
+	}
+
+	/* Enable the VSP1 and prepare for streaming. */
+	vsp1_pipeline_dump(pipe, "VSPX job");
+
+	ret = vsp1_device_get(vsp1);
+	if (ret < 0)
+		goto error_stop_pipe;
+
+	return 0;
+
+error_stop_pipe:
+	scoped_guard(spinlock_irqsave, &vspx_pipe->vspx_lock) {
+		vspx_pipe->enabled = false;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(vsp1_isp_start_streaming);
+
+/**
+ * vsp1_vspx_job_prepare - Prepare a display list with the content of the buffer
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
+	/*
+	 * Populate a display list and append it to the jobs queue.
+	 * Memory is released when the job is consumed.
+	 */
+	job = kmalloc(sizeof(*job), GFP_KERNEL);
+	if (!job)
+		return -ENOMEM;
+
+	/*
+	 * Transfer the buffers described in the job: (optional) ConfigDMA and
+	 * RAW image.
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
+					       V4L2_PIX_FMT_XBGR32,
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
+	scoped_guard(spinlock_irqsave, &vspx_pipe->jobs_lock) {
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
+ * vsp1_isp_job_run - Run a buffer transfer on behalf of the ISP
+ *
+ * @dev: The VSP1 struct device
+ */
+void vsp1_isp_job_run(struct device *dev)
+{
+	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
+	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
+	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
+	struct vsp1_vspx_job *job;
+
+	scoped_guard(spinlock_irqsave, &vspx_pipe->vspx_lock) {
+
+		if (vspx_pipe->processing)
+			return;
+
+		/* Extract one job, if available, from the jobs list. */
+		scoped_guard(spinlock_irqsave, &vspx_pipe->jobs_lock) {
+			job = list_first_entry_or_null(&vspx_pipe->jobs,
+						       struct vsp1_vspx_job,
+						       job_queue);
+			if (!job)
+				return;
+
+			list_del(&job->job_queue);
+		}
+
+		vspx_pipe->processing = true;
+		vsp1_dl_list_commit(job->dl, 0);
+		kfree(job);
+	}
+
+	/* Trigger VSPX processing by setting VI6_CMD[STRCMD]. */
+	scoped_guard(spinlock_irqsave, &pipe->irqlock) {
+		vsp1_pipeline_run(pipe);
+	}
+}
+EXPORT_SYMBOL_GPL(vsp1_isp_job_run);
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
+	vspx_pipe->processing = false;
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
+	spin_lock_init(&vspx_pipe->jobs_lock);
+
+	/*
+	 * Initialize RPF0 as inputs for VSPX and use it unconditionally for
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
+	list_add(&pipe->iif->list_pipe, &pipe->entities);
+
+	pipe->output = vsp1->wpf[0];
+	pipe->output->entity.pipe = pipe;
+	vsp1_vspx_rwpf_set_subdev_fmt(vsp1, pipe->output,
+				      vspx_default_fmt.pixelformat,
+				      vspx_default_fmt.width,
+				      vspx_default_fmt.height);
+	list_add(&pipe->output->entity.list_pipe, &pipe->entities);
+
+	return 0;
+}
+
+void vsp1_vspx_cleanup(struct vsp1_device *vsp1)
+{
+	struct vsp1_vspx_pipeline *vspx_pipe;
+
+	vspx_pipe = &vsp1->vspx->pipe;
+
+	vsp1_vspx_release_jobs(vsp1);
+}
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_vspx.h b/drivers/media/platform/renesas/vsp1/vsp1_vspx.h
new file mode 100644
index 000000000000..2f68f043075e
--- /dev/null
+++ b/drivers/media/platform/renesas/vsp1/vsp1_vspx.h
@@ -0,0 +1,86 @@
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
+#include <linux/container_of.h>
+#include <linux/list.h>
+#include <linux/spinlock.h>
+
+#include <media/vsp1.h>
+
+#include "vsp1.h"
+#include "vsp1_pipe.h"
+
+/* Pixel format for ConfigDMA buffers. */
+#define V4L2_META_FMT_RCAR_V4H	v4l2_fourcc('R', 'C', 'A', '4')
+
+/*
+ * struct vsp1_vspx_pipeline - VSPX pipeline
+ * @pipe: the VSP1 pipeline
+ * @partition: the pre-calculated partition used by the pipeline
+ * @vspx_lock: protect access to the VSPX configuration
+ * @processing: VSPX busy flag
+ * @jobs_lock: protect the jobs queue
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
+	bool processing;
+	bool enabled;
+
+	/* Protects the jobs list */
+	spinlock_t jobs_lock;
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
+ * @dl: Display list populated by vsp1_isp_job_prepare
+ * @job_queue: List handle
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
+static inline struct vsp1_vspx *
+to_vsp1_vspx(struct vsp1_vspx_pipeline *vspx_pipe)
+{
+	return container_of(vspx_pipe, struct vsp1_vspx, pipe);
+}
+
+int vsp1_vspx_init(struct vsp1_device *vsp1);
+void vsp1_vspx_cleanup(struct vsp1_device *vsp1);
+
+#endif /* __VSP1_VSPX_H__ */
diff --git a/include/media/vsp1.h b/include/media/vsp1.h
index 48f4a5023d81..68e4d9891dff 100644
--- a/include/media/vsp1.h
+++ b/include/media/vsp1.h
@@ -9,12 +9,17 @@
 #ifndef __MEDIA_VSP1_H__
 #define __MEDIA_VSP1_H__
 
+#include <linux/list.h>
 #include <linux/scatterlist.h>
 #include <linux/types.h>
 #include <linux/videodev2.h>
 
 struct device;
 
+/*******************************************************************************
+ * VSP1 DU interface
+ */
+
 int vsp1_du_init(struct device *dev);
 
 #define VSP1_DU_STATUS_COMPLETE		BIT(0)
@@ -117,4 +122,72 @@ void vsp1_du_atomic_flush(struct device *dev, unsigned int pipe_index,
 int vsp1_du_map_sg(struct device *dev, struct sg_table *sgt);
 void vsp1_du_unmap_sg(struct device *dev, struct sg_table *sgt);
 
+/*******************************************************************************
+ * VSP1 ISP interface
+ */
+
+/**
+ * struct vsp1_isp_buffer_desc - Describe a buffer allocated by VSPX
+ *
+ * @cpu_addr: CPU-mapped address of a buffer allocated by VSPX
+ * @dma_addr: bus address of a buffer allocated by VSPX
+ */
+struct vsp1_isp_buffer_desc {
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
+int vsp1_isp_alloc_buffers(struct device *dev, size_t size,
+			   struct vsp1_isp_buffer_desc *buffer_desc);
+int vsp1_isp_configure(struct device *dev,
+		       const struct v4l2_pix_format_mplane *fmt);
+int vsp1_isp_start_streaming(struct device *dev,
+			     struct vsp1_vspx_frame_end *frame_end,
+			     bool enable);
+int vsp1_isp_job_prepare(struct device *dev,
+			 const struct vsp1_isp_job_desc *desc);
+void vsp1_isp_job_run(struct device *dev);
+
 #endif /* __MEDIA_VSP1_H__ */

-- 
2.48.1


