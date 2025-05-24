Return-Path: <linux-media+bounces-33318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBF3AC2F97
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 13:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0F7AA20E9A
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 11:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437A81EB18F;
	Sat, 24 May 2025 11:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TcJnif5+"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3D21E260D;
	Sat, 24 May 2025 11:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748087530; cv=none; b=YiZhRA5NagXNucncr1RRJINrijfLH98bZ6CLSMsAus7GsDQHpQakq6ZNwJeAuaBMeyM7XBf183kHT/nVeQO+2Y5g4N3eCFvz9qFFIuUWONDi/ySEcMuLKxjP1gVfr+9Bu+Wqvk0BvZR1FuKxpFoCBcadZEfAkt0UWTXamYaF2yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748087530; c=relaxed/simple;
	bh=YvTOp7iwVQIuvxViuLfUj8pKmfX5CCUE2k/w8iMY2Pc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rA/Bx4YZ+dR35zCk8AsuHw6rXVLC1noetMqZbIBoIS5Jo78MCC5WkK3uklgApd0bkzAwtAKKdKXyxL3IbeRHAde6k8DF9xu+DzKFexqiFTUEaF1KQf3qiblCUPhIBzzbBOnsCNhO8Qn/MihwKvtdQi/pfyoKp9oIn1+meF4jeGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=TcJnif5+; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7b53194e389511f082f7f7ac98dee637-20250524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=E2T2trIDYfrr3L9SizRtMxFSCpWDMGQjF/Qiyy7560Y=;
	b=TcJnif5+6/okWbj4VTKeC1dY5yvAh4z/U0H4Yejfr5eGhjk6sFMqc/a+x0hVHnpc+LVA459wJB12TBtjrodNUPF5zHhbdoA3srwx1qKmdzlfN7d7M5rTtTpdIjXff/H7h1F51wmtv0yFhvIRC1ysrILk5KtzpGyo87Ddij4IDJY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:97a3295b-5974-4e6c-afcc-a4aca1cfb5ea,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:32b91059-eac4-4b21-88a4-d582445d304a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7b53194e389511f082f7f7ac98dee637-20250524
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 784957796; Sat, 24 May 2025 19:51:51 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 24 May 2025 19:51:49 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 24 May 2025 19:51:49 +0800
From: Olivia Wen <olivia.wen@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Olivia Wen <olivia.wen@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<teddy.chen@mediatek.com>, <yunkec@chromium.org>
Subject: [PATCH v1 09/10] media: mediatek: isp: Add image processing flow
Date: Sat, 24 May 2025 19:50:01 +0800
Message-ID: <20250524115144.3832748-10-olivia.wen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250524115144.3832748-1-olivia.wen@mediatek.com>
References: <20250524115144.3832748-1-olivia.wen@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The ImgSys driver is implemented as a series of patches, with this patch
focusing on the image processing flow for the MediaTek ImgSys driver.
It is a crucial part of the ImgSys architecture, controlling the flow of
operations from the user applications to the hardware. The ImgSys driver
manages various components (e.g. SCP, CMDQ) and processes to ensure
efficient image processing.

Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
---
 .../mediatek/isp/isp_7x/imgsys/Makefile       |   2 +
 .../isp/isp_7x/imgsys/mtk_header_desc.h       | 101 ++++
 .../isp/isp_7x/imgsys/mtk_imgsys-dev.c        |  61 +++
 .../isp/isp_7x/imgsys/mtk_imgsys-dev.h        | 139 +++++-
 .../isp/isp_7x/imgsys/mtk_imgsys-gce_work.c   |  82 +++
 .../isp/isp_7x/imgsys/mtk_imgsys-gce_work.h   |  37 ++
 .../isp/isp_7x/imgsys/mtk_imgsys-sys.c        | 468 +++++++++++++++++-
 .../isp/isp_7x/imgsys/mtk_imgsys-v4l2.c       | 128 ++++-
 .../isp/isp_7x/imgsys/mtk_imgsys-work_buf.c   | 113 +++++
 .../isp/isp_7x/imgsys/mtk_imgsys-work_buf.h   |  55 ++
 10 files changed, 1169 insertions(+), 17 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-gce_work.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-gce_work.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-work_buf.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-work_buf.h

diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile
index 29c18c773fdc..3aa53e8bfc6d 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile
@@ -2,6 +2,8 @@
 #
 
 mtk_imgsys_util-objs := \
+mtk_imgsys-work_buf.o \
+mtk_imgsys-gce_work.o \
 mtk_imgsys-cmdq.o \
 mtk_imgsys-scp.o \
 mtk_imgsys-module_main.o \
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_header_desc.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_header_desc.h
index 50c2e3c3395b..673e84aad362 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_header_desc.h
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_header_desc.h
@@ -9,6 +9,39 @@
 
 #include <linux/videodev2.h>
 
+#define IMGBUF_MAX_PLANES	3 /* Maximum number of planes in an image buffer */
+#define IMG_MAX_HW_DMAS		72 /* Maximum number of hardware DMAs */
+
+/**
+ * struct v4l2_ext_plane - Extended plane information
+ * @offset: Offset within the DMA buffer
+ * @phyaddr: Physical address of the DMA buffer
+ * @isp_addr: ISP (Image Signal Processor) address
+ * @size: Size of the plane
+ */
+struct v4l2_ext_plane {
+	union {
+		struct {
+			__u32 offset;    /* Offset within the DMA buffer */
+			__u64 phyaddr;   /* Physical address of the DMA buffer */
+		} dma_buf;
+	} m;
+	__u64 isp_addr;           /* ISP (Image Signal Processor) address */
+	__u64 size;               /* Size of the plane */
+};
+
+/**
+ * struct v4l2_ext_buffer - Extended V4L2 buffer
+ * @planes: Array of extended plane information
+ * @num_planes: Number of planes
+ * @reserved: Reserved for future use
+ */
+struct v4l2_ext_buffer {
+	struct v4l2_ext_plane	planes[IMGBUF_MAX_PLANES];
+	__u32			num_planes;
+	__u64			reserved[2];
+};
+
 /**
  * struct mtk_imgsys_crop - Crop parameters for MediaTek Image System
  * @c: Rectangle defining the crop area
@@ -25,4 +58,72 @@ struct mtk_imgsys_crop {
 	struct v4l2_fract   height_subpix; /* Sub-pixel adjustment for the height */
 };
 
+/**
+ * struct plane_pix_format - Pixel format for a single plane
+ * @sizeimage: Size of the image in bytes
+ * @bytesperline: Number of bytes per line
+ */
+struct plane_pix_format {
+	__u32 sizeimage;
+	__u32 bytesperline;
+} __packed;
+
+/**
+ * struct pix_format_mplane - Multi-plane pixel format
+ * @width: Width of the image
+ * @height: Height of the image
+ * @pixelformat: Pixel format identifier
+ * @plane_fmt: Array of pixel formats for each plane
+ */
+struct pix_format_mplane {
+	__u32 width;
+	__u32 height;
+	__u32 pixelformat;
+	struct plane_pix_format plane_fmt[IMGBUF_MAX_PLANES];
+} __packed;
+
+/**
+ * struct frameparams - Frame parameters for MediaTek Image System
+ * @buf: Extended buffer information
+ * @fmt: Multi-plane pixel format
+ * @crop: Crop parameters
+ * @rotation: Rotation angle
+ * @hflip: Horizontal flip flag
+ * @vflip: Vertical flip flag
+ * @resizeratio: Resize ratio
+ */
+struct frameparams {
+	struct v4l2_ext_buffer buf;          /* Extended buffer information */
+	struct pix_format_mplane fmt;        /* Multi-plane pixel format */
+	struct mtk_imgsys_crop crop;         /* Crop parameters */
+	__u32 rotation;                      /* Rotation angle */
+	__u32 hflip;                         /* Horizontal flip flag */
+	__u32 vflip;                         /* Vertical flip flag */
+	__u8  resizeratio;                   /* Resize ratio */
+};
+
+/**
+ * struct header_desc_norm - Header description for normal camera case
+ * @fparams_num: Number of frame parameters
+ * @fparams: Frame parameters
+ */
+struct header_desc_norm {
+	__u32 fparams_num;
+	struct frameparams fparams;
+};
+
+/**
+ * struct singlenode_desc_norm - Single node description for normal camera case
+ * @dmas_enable: Array indicating enabled DMA channels
+ * @dmas: Array of DMA header descriptions
+ * @tuning_meta: Tuning metadata header description
+ * @ctrl_meta: Control metadata header description
+ */
+struct singlenode_desc_norm {
+	__u8 dmas_enable[IMG_MAX_HW_DMAS];
+	struct header_desc_norm dmas[IMG_MAX_HW_DMAS];
+	struct header_desc_norm tuning_meta;
+	struct header_desc_norm ctrl_meta;
+};
+
 #endif
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.c
index 28a35a3226a2..a52f1cf93d47 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.c
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.c
@@ -83,6 +83,67 @@ int mtk_imgsys_pipe_next_job_id(struct mtk_imgsys_pipe *pipe)
 	return (global_job_id & 0x0000FFFF) | (pipe->desc->id << 16);
 }
 
+struct mtk_imgsys_request *
+mtk_imgsys_pipe_get_running_job(struct mtk_imgsys_pipe *pipe, int id)
+{
+	struct mtk_imgsys_request *req;
+	unsigned long flag;
+
+	spin_lock_irqsave(&pipe->running_job_lock, flag);
+	list_for_each_entry(req,
+			    &pipe->pipe_job_running_list, list) {
+		if (req->id == id) {
+			spin_unlock_irqrestore(&pipe->running_job_lock, flag);
+			return req;
+		}
+	}
+	spin_unlock_irqrestore(&pipe->running_job_lock, flag);
+
+	return NULL;
+}
+
+void mtk_imgsys_pipe_remove_job(struct mtk_imgsys_request *req)
+{
+	unsigned long flag;
+
+	spin_lock_irqsave(&req->imgsys_pipe->running_job_lock, flag);
+	list_del(&req->list);
+	req->imgsys_pipe->num_jobs--;
+	spin_unlock_irqrestore(&req->imgsys_pipe->running_job_lock, flag);
+
+	dev_dbg(req->imgsys_pipe->imgsys_dev->dev,
+		"%s:%s:req->id(%d),num of running jobs(%d) entry(%p)\n", __func__,
+		req->imgsys_pipe->desc->name, req->id,
+		req->imgsys_pipe->num_jobs, &req->list);
+}
+
+void mtk_imgsys_pipe_job_finish(struct mtk_imgsys_request *req,
+				enum vb2_buffer_state vbf_state)
+{
+	struct mtk_imgsys_pipe *pipe = req->imgsys_pipe;
+	int i;
+
+	if (req->req.state != MEDIA_REQUEST_STATE_QUEUED) {
+		dev_info(pipe->imgsys_dev->dev, "%s: req %d 0x%lx flushed in state(%d)", __func__,
+			 req->request_fd, (unsigned long)&req->req, req->req.state);
+		return;
+	}
+
+	for (i = 0; i < pipe->desc->total_queues; i++) {
+		struct mtk_imgsys_dev_buffer *dev_buf = req->buf_map[i];
+		struct mtk_imgsys_video_device *node;
+
+		if (!dev_buf)
+			continue;
+
+		node = mtk_imgsys_vbq_to_node(dev_buf->vbb.vb2_buf.vb2_queue);
+		spin_lock(&node->buf_list_lock);
+		list_del(&dev_buf->list);
+		spin_unlock(&node->buf_list_lock);
+		vb2_buffer_done(&dev_buf->vbb.vb2_buf, vbf_state);
+	}
+}
+
 void mtk_imgsys_pipe_debug_job(struct mtk_imgsys_pipe *pipe,
 			       struct mtk_imgsys_request *req)
 {
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.h
index b8c30cb32b97..effee4a3b616 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.h
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.h
@@ -25,6 +25,8 @@
 #include <media/videobuf2-v4l2.h>
 #include "mtk_imgsys-module_ops.h"
 #include "mtk_header_desc.h"
+#include "mtk-img-ipi.h"
+#include "mtk_imgsys-work_buf.h"
 
 #define MTK_IMGSYS_MEDIA_MODEL_NAME	"MTK-ISP-DIP-V4L2"
 
@@ -38,6 +40,31 @@
 #define MTK_IMGSYS_CAPTURE_MAX_WIDTH		5376U
 #define MTK_IMGSYS_CAPTURE_MAX_HEIGHT		4032U
 
+/**
+ * MTK_IMGSYS_JOB_TIMEOUT_MS - Defines the job timeout in milliseconds.
+ *
+ * This macro calculates the timeout for image system jobs based on the frame rate
+ * (30 frames per second) and the number of working buffers. The timeout is set to
+ * three times the duration of all working buffers.
+ */
+#define MTK_IMGSYS_JOB_TIMEOUT_MS	(1000 / 30 * IMGSYS_WORKING_BUF_NUM * 3)
+
+/**
+ * struct mtk_imgsys_hw_working_buf_list - Represents a list of hardware
+ * working buffers
+ *
+ * @list: List head for linking multiple buffer lists
+ * @lock: Spinlock to protect the list
+ *
+ * This structure represents a list of hardware working buffers used in the
+ * MediaTek Image System. It includes a list head for linking multiple buffer
+ * lists and a spinlock to protect the list from concurrent access.
+ */
+struct mtk_imgsys_hw_working_buf_list {
+	struct list_head list;
+	spinlock_t lock; /* protect the list of working buf */
+};
+
 /**
  * struct mtk_imgsys_dev_format - Device format for MediaTek Image System
  * @fmt: Pointer to the Image System format structure
@@ -274,6 +301,7 @@ struct mtk_imgsys_pipe {
  * @imgsys_pipe: Image system pipeline configuration structure.
  * @cust_pipes: Pointer to custom pipeline descriptors.
  * @modules: Pointer to image system module operations.
+ * @num_mods: Number of modules in the image system.
  * @clks: Array of clock bulk data for managing multiple clocks.
  * @num_clks: Number of clocks in the clock array.
  * @larbs: Array of device pointers for managing LARB (local arbiter).
@@ -281,9 +309,18 @@ struct mtk_imgsys_pipe {
  * @scp: Pointer to the SCP (System Control Processor) structure.
  * @rproc_handle: Handle for remote processor interface.
  * @smem_dev: Device structure for shared memory operations.
- * @num_mods: Number of modules in the image system.
+ * @working_bufs: Array of hardware working buffers.
+ * @free_working_bufs: List of free working buffers.
+ * @composer_wq: Workqueue for composing tasks in image processing.
+ * @runner_wq: Workqueue for running tasks in image processing.
+ * @gcecb_wq: Workqueue for handling GCE callback tasks.
+ * @work_pool: Pool of GCE callback work structures.
+ * @flushing_waitq: Wait queue for flushing operations.
+ * @num_composing: Atomic counter for tracking composing operations.
+ * @imgsys_enqueue_cnt: Atomic counter for enqueued image system requests.
  * @init_kref: Reference counter for initialization tracking.
  * @hw_op_lock: Mutex for serializing hardware operations.
+ * @sem: Semaphore to limit the maximum number of requests sent to SCP.
  * @stream_cnt: Counter for active streams, increased on stream on.
  */
 struct mtk_imgsys_dev {
@@ -298,6 +335,7 @@ struct mtk_imgsys_dev {
 	const struct mtk_imgsys_pipe_desc *cust_pipes;
 	/* Imgsys Moudles Information */
 	const struct module_ops *modules;
+	int num_mods;
 	/* Clock Information */
 	struct clk_bulk_data *clks;
 	int num_clks;
@@ -308,11 +346,22 @@ struct mtk_imgsys_dev {
 	struct mtk_scp *scp;
 	struct rproc *rproc_handle;
 	struct device *smem_dev;
-	/* Number of modules */
-	int num_mods;
+	/* Working Buffers */
+	struct mtk_imgsys_hw_working_buf *working_bufs;
+	struct mtk_imgsys_hw_working_buf_list free_working_bufs;
+	/* Workqueues for ImgSys */
+	struct workqueue_struct *composer_wq;
+	struct workqueue_struct *runner_wq;
+	/* GCE (Generic Command Engine) Callback Workqueue */
+	struct workqueue_struct *gcecb_wq;
+	struct gce_cb_work_pool *work_pool;
 	/* Synchronization and Flow Control */
+	wait_queue_head_t flushing_waitq;
+	atomic_t num_composing;
+	atomic_t imgsys_enqueue_cnt;
 	struct kref init_kref;
 	struct mutex hw_op_lock; /* Protect HW operations */
+	struct semaphore sem;
 	int stream_cnt;
 };
 
@@ -360,10 +409,74 @@ struct mtk_imgsys_request {
 	struct mtk_imgsys_dev_buffer **buf_map;
 	struct list_head list;
 	struct req_frameparam img_fparam;
+	struct work_struct composer_work;
+	struct work_struct runner_work;
+	struct mtk_imgsys_hw_working_buf *working_buf;
+	struct swfrm_info *swfrm_info;
 	atomic_t buf_count;
 	int request_fd;
 };
 
+/**
+ * struct swfrm_info - Information about software frame
+ * @req_sbuf_goft: GCE buffer offset
+ * @req_sbuf_kva: GCE buffer virtual address
+ * @swfrminfo_ridx: Ring index of the swfrminfo (referenced by SCP)
+ * @request_fd: Enqueued request file descriptor in V4L2 kernel framework
+ * @request_no: Request number from middleware
+ * @frame_no: Frame number from middleware
+ * @frm_owner: Frame owner identifier from middleware
+ * @fps: Frames per second
+ * @cb_frmcnt: Frame counter
+ * @total_taskcnt: Total task count
+ * @req_vaddr: Kernel request virtual address
+ * @sync_id: Synchronization identifier for camera/image synchronization
+ * @total_frmnum: Total frame number in the current request
+ * @user_info: Array of user information from SCP to kernel
+ * @is_earlycb: Indicates if the request is separated by early callback hint
+ * @earlycb_idx: Frame index for early callback
+ * @is_lastfrm: Indicates if the request is separated by last frame
+ * @group_id: Group identifier for selecting GCE thread
+ * @req: Pointer to mtk_imgsys_request
+ * @pipe: Pointer to pipe mtk_imgsys_pipe
+ * @fail_uinfo_idx: Failed index in user_info
+ * @hw_hang: Indicates if the current failure is caused by hardware hang
+ * @ndd_swfrm_info: Pointer to NDD (Normal data dump) software frame information
+ *
+ * This structure contains detailed information about a software frame,
+ * including various identifiers, addresses, and status flags.
+ */
+struct swfrm_info {
+	u32 req_sbuf_goft;
+	void *req_sbuf_kva;
+	int swfrminfo_ridx;
+	int request_fd;
+	int request_no;
+	int frame_no;
+	u64 frm_owner;
+	int fps;
+	int cb_frmcnt;
+	int total_taskcnt;
+	u64 req_vaddr;
+	int sync_id;
+	int total_frmnum;
+	struct img_swfrm_info user_info[TMAX];
+	u8 is_earlycb;
+	int earlycb_idx;
+	u8 is_lastfrm;
+	s8 group_id;
+	void *req;
+	void *pipe;
+	u32 fail_uinfo_idx;
+	s8 hw_hang;
+	void *ndd_swfrm_info;
+} __attribute((__packed__));
+static inline struct mtk_imgsys_pipe*
+mtk_imgsys_dev_get_pipe(struct mtk_imgsys_dev *imgsys_dev)
+{
+	return &imgsys_dev->imgsys_pipe;
+}
+
 static inline struct mtk_imgsys_video_device*
 mtk_imgsys_file_to_node(struct file *file)
 {
@@ -401,6 +514,18 @@ mtk_imgsys_media_req_to_imgsys_req(struct media_request *req)
 	return container_of(req, struct mtk_imgsys_request, req);
 }
 
+static inline struct mtk_imgsys_request*
+mtk_imgsys_composer_work_to_req(struct work_struct *composer_work)
+{
+	return container_of(composer_work, struct mtk_imgsys_request, composer_work);
+}
+
+static inline struct mtk_imgsys_request*
+mtk_imgsys_runner_work_to_req(struct work_struct *runner_work)
+{
+	return container_of(runner_work, struct mtk_imgsys_request, runner_work);
+}
+
 static inline int mtk_imgsys_buf_is_meta(u32 type)
 {
 	return type == V4L2_BUF_TYPE_META_CAPTURE ||
@@ -413,8 +538,16 @@ int mtk_imgsys_pipe_init(struct mtk_imgsys_dev *imgsys_dev,
 
 int mtk_imgsys_pipe_release(struct mtk_imgsys_pipe *pipe);
 
+struct mtk_imgsys_request *
+mtk_imgsys_pipe_get_running_job(struct mtk_imgsys_pipe *pipe, int id);
+
+void mtk_imgsys_pipe_remove_job(struct mtk_imgsys_request *req);
+
 int mtk_imgsys_pipe_next_job_id(struct mtk_imgsys_pipe *pipe);
 
+void mtk_imgsys_pipe_job_finish(struct mtk_imgsys_request *req,
+				enum vb2_buffer_state vbf_state);
+
 void mtk_imgsys_pipe_debug_job(struct mtk_imgsys_pipe *pipe,
 			       struct mtk_imgsys_request *req);
 
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-gce_work.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-gce_work.c
new file mode 100644
index 000000000000..ef86410e3d23
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-gce_work.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "mtk_imgsys-scp.h"
+#include "mtk_imgsys-gce_work.h"
+
+static void cmdq_cb_done_worker(struct work_struct *work)
+{
+	struct mtk_imgsys_pipe *pipe;
+	struct swfrm_info *gwfrm_info = NULL;
+	struct gce_cb_work *gwork;
+	struct img_sw_buffer swbuf_data = {0};
+
+	gwork = container_of(work, struct gce_cb_work, work);
+	gwfrm_info = gwork->req_sbuf_kva;
+
+	pipe = gwork->pipe;
+	if (!pipe->streaming)
+		return;
+
+	/* send to SCP after frame done & del node from list */
+	swbuf_data.offset = gwfrm_info->req_sbuf_goft;
+	imgsys_scp_send(pipe->imgsys_dev, IPI_IMGSYS_DEQUE_DONE_ID,
+			&swbuf_data, sizeof(struct img_sw_buffer),
+			gwork->reqfd, 1);
+
+	gce_cb_work_free(pipe->imgsys_dev->work_pool, gwork);
+}
+
+int gce_cb_work_pool_init(struct mtk_imgsys_dev *imgsys_dev)
+{
+	int i;
+	struct gce_cb_work_pool *work_pool;
+
+	work_pool = kmalloc(sizeof(*work_pool), GFP_KERNEL);
+	if (!work_pool)
+		return -ENOMEM;
+	imgsys_dev->work_pool = work_pool;
+
+	spin_lock_init(&work_pool->lock);
+	INIT_LIST_HEAD(&work_pool->free_list);
+
+	for (i = 0; i < MTK_IMGSYS_GCE_CB_MAX_WORK_ITEMS; i++) {
+		INIT_WORK(&work_pool->work_items[i].work, cmdq_cb_done_worker);
+		atomic_set(&work_pool->work_items[i].state, WORK_INIT);
+		work_pool->work_items[i].work_idx = i;
+		list_add_tail(&work_pool->work_items[i].list, &work_pool->free_list);
+	}
+	return 0;
+}
+
+struct gce_cb_work *gce_cb_work_allocate(struct gce_cb_work_pool *pool)
+{
+	struct gce_cb_work *gwork = NULL;
+
+	spin_lock(&pool->lock);
+	if (list_empty(&pool->free_list)) {
+		spin_unlock(&pool->lock);
+		return NULL;
+	}
+
+	gwork = list_first_entry(&pool->free_list, struct gce_cb_work, list);
+	list_del(&gwork->list);
+	spin_unlock(&pool->lock);
+
+	atomic_set(&gwork->state, WORK_ALLOC);
+
+	return gwork;
+}
+
+void gce_cb_work_free(struct gce_cb_work_pool *pool, struct gce_cb_work *gwork)
+{
+	atomic_set(&gwork->state, WORK_FREE);
+
+	spin_lock(&pool->lock);
+	list_add_tail(&gwork->list, &pool->free_list);
+	spin_unlock(&pool->lock);
+}
+
+void gce_cb_work_pool_release(struct mtk_imgsys_dev *imgsys_dev)
+{
+	kfree(imgsys_dev->work_pool);
+}
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-gce_work.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-gce_work.h
new file mode 100644
index 000000000000..ba80b952f38e
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-gce_work.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _MTK_IMGSYS_GCE_WORK_H_
+#define _MTK_IMGSYS_GCE_WORK_H_
+
+#define MTK_IMGSYS_GCE_CB_MAX_WORK_ITEMS	60
+
+enum mtk_imgsys_gce_cb_work_state {
+	WORK_INIT,
+	WORK_ALLOC,
+	WORK_COMPLETED,
+	WORK_FREE
+};
+
+struct gce_cb_work {
+	struct work_struct work;
+	atomic_t state;
+	u32 work_idx;
+	u32 reqfd;
+	void *req_sbuf_kva;
+	void *pipe;
+	struct list_head list;
+	wait_queue_head_t wait_queue;
+};
+
+struct gce_cb_work_pool {
+	struct gce_cb_work work_items[MTK_IMGSYS_GCE_CB_MAX_WORK_ITEMS];
+	struct list_head free_list;
+	spinlock_t lock; /* protect the free_list */
+};
+
+int gce_cb_work_pool_init(struct mtk_imgsys_dev *imgsys_dev);
+struct gce_cb_work *gce_cb_work_allocate(struct gce_cb_work_pool *pool);
+void gce_cb_work_free(struct gce_cb_work_pool *pool, struct gce_cb_work *gwork);
+void gce_cb_work_pool_release(struct mtk_imgsys_dev *imgsys_dev);
+
+#endif /* _MTK_IMGSYS_GCE_WORK_H_ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c
index 184f0e3a4d3b..36088a5bda8e 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c
@@ -3,17 +3,261 @@
  * Copyright (c) 2021 MediaTek Inc.
  *
  * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *         Holmes Chiou <holmes.chiou@mediatek.com>
  *
  */
 
 #include <linux/pm_runtime.h>
 #include "mtk_imgsys-sys.h"
 #include "mtk_imgsys-dev.h"
+#include "mtk_imgsys-scp.h"
 #include "mtk_imgsys-cmdq.h"
+#include "mtk_imgsys-work_buf.h"
+#include "mtk_imgsys-gce_work.h"
+#include "mtk_header_desc.h"
+#include "mtk_imgsys_v4l2_vnode.h"
+
+#define FRAME_STATE_INIT		0
+#define FRAME_STATE_HW_TIMEOUT		1
+
+static void mtk_imgsys_notify(struct mtk_imgsys_request *req, uint64_t frm_owner)
+{
+	struct mtk_imgsys_dev *imgsys_dev = req->imgsys_pipe->imgsys_dev;
+	struct mtk_imgsys_pipe *pipe = req->imgsys_pipe;
+	struct req_frameparam *iparam = &req->img_fparam;
+	enum vb2_buffer_state vbf_state;
+
+	if (!mtk_imgsys_pipe_get_running_job(pipe, req->id))
+		goto out;
+
+	if (iparam->state != FRAME_STATE_HW_TIMEOUT)
+		vbf_state = VB2_BUF_STATE_DONE;
+	else
+		vbf_state = VB2_BUF_STATE_ERROR;
+
+	atomic_dec(&imgsys_dev->num_composing);
+
+	mtk_imgsys_hw_working_buf_free(imgsys_dev, req->working_buf);
+	req->working_buf = NULL;
+	mtk_imgsys_pipe_remove_job(req);
+	if (vbf_state == VB2_BUF_STATE_DONE)
+		mtk_imgsys_pipe_job_finish(req, vbf_state);
+
+	wake_up(&imgsys_dev->flushing_waitq);
+	dev_dbg(imgsys_dev->dev,
+		"%s:%s:(reqfd-%d) , frame_no(%d) frm_owner(%s) finished\n",
+		__func__, pipe->desc->name, req->request_fd, iparam->frame_no,
+		((char *)(&frm_owner)));
+
+out:
+	media_request_put(&req->req);
+}
+
+static void imgsys_cmdq_cb_func(struct imgsys_cmdq_cb_data data)
+{
+	struct mtk_imgsys_pipe *pipe;
+	struct mtk_imgsys_request *req;
+	struct mtk_imgsys_dev *imgsys_dev;
+	struct swfrm_info *swfrminfo_cb;
+	struct gce_cb_work *gwork;
+
+	swfrminfo_cb = data.data;
+	pipe = (struct mtk_imgsys_pipe *)swfrminfo_cb->pipe;
+	if (!pipe->streaming) {
+		pr_info("%s pipe already streamoff\n", __func__);
+		return;
+	}
+
+	req = (struct mtk_imgsys_request *)(swfrminfo_cb->req);
+	if (!req) {
+		pr_info("%s NULL request Address\n", __func__);
+		return;
+	}
+
+	imgsys_dev = req->imgsys_pipe->imgsys_dev;
+	dev_dbg(imgsys_dev->dev, "%s:(reqfd-%d)frame_no(%d) +", __func__,
+		req->request_fd,
+		req->img_fparam.frame_no);
+
+	if (swfrminfo_cb->hw_hang >= 0)
+		req->img_fparam.state = FRAME_STATE_HW_TIMEOUT;
+
+	mtk_imgsys_notify(req, swfrminfo_cb->frm_owner);
+
+	if (swfrminfo_cb->hw_hang < 0) {
+		gwork = gce_cb_work_allocate(imgsys_dev->work_pool);
+		if (!gwork)
+			return;
+
+		gwork->reqfd = swfrminfo_cb->request_fd;
+		gwork->req_sbuf_kva = swfrminfo_cb->req_sbuf_kva;
+		gwork->pipe = swfrminfo_cb->pipe;
+		init_waitqueue_head(&gwork->wait_queue);
+
+		queue_work(req->imgsys_pipe->imgsys_dev->gcecb_wq, &gwork->work);
+	}
+}
+
+static void imgsys_runner_func(struct work_struct *work)
+{
+	struct mtk_imgsys_request *req = mtk_imgsys_runner_work_to_req(work);
+	struct mtk_imgsys_dev *imgsys_dev = req->imgsys_pipe->imgsys_dev;
+	struct swfrm_info *frm_info;
+	int ret;
+
+	frm_info = req->swfrm_info;
+
+	ret = imgsys_cmdq_sendtask(imgsys_dev, frm_info, imgsys_cmdq_cb_func);
+	if (ret)
+		dev_info(imgsys_dev->dev,
+			 "%s: imgsys_cmdq_sendtask fail(%d)\n", __func__, ret);
+}
+
+/* processing IPI_IMGSYS_FRAME_ID, share data is struct img_sw_buffer*/
+static void imgsys_scp_handler(void *data, unsigned int len, void *priv)
+{
+	struct share_buf *scp_msg = (struct share_buf *)data;
+	struct mtk_imgsys_pipe *pipe;
+	struct mtk_imgsys_request *req;
+	struct mtk_imgsys_dev *imgsys_dev = (struct mtk_imgsys_dev *)priv;
+	struct img_sw_buffer *swbuf_data;
+	struct swfrm_info *swfrm_info;
+	int i = 0;
+	void *gce_virt;
+	int total_framenum = 0;
+
+	if (!data) {
+		WARN_ONCE(!data, "%s: failed due to NULL data\n", __func__);
+		return;
+	}
+
+	/* this function just handles id IPI_IMGSYS_FRAME_ID */
+	if (scp_msg->id != IPI_IMGSYS_FRAME_ID) {
+		dev_dbg(imgsys_dev->dev,
+			"%s: get invalid IPI ID(%d)\n", __func__, scp_msg->id);
+		return;
+	}
+
+	if (WARN_ONCE(scp_msg->len != sizeof(struct img_sw_buffer),
+		      "%s: len(%d) not match img_sw_buffer\n", __func__, len))
+		return;
+
+	swbuf_data = (struct img_sw_buffer *)scp_msg->share_data;
+	gce_virt = imgsys_scp_get_reserve_mem_virt(IMG_MEM_G_ID);
+	if (!gce_virt) {
+		pr_info("%s: invalid gce_virt(%p)\n",
+			__func__, gce_virt);
+		return;
+	}
+
+	swfrm_info = (struct swfrm_info *)(gce_virt + (swbuf_data->offset));
+	if ((int)swbuf_data->offset < 0 ||
+	    swbuf_data->offset > imgsys_scp_get_reserve_mem_size(IMG_MEM_G_ID)) {
+		pr_info("%s: invalid swbuf_data->offset(%d), max(%llu)\n",
+			__func__, swbuf_data->offset,
+			(u64)imgsys_scp_get_reserve_mem_size(IMG_MEM_G_ID));
+		return;
+	}
+
+	swfrm_info->req_sbuf_goft = swbuf_data->offset;
+	swfrm_info->req_sbuf_kva = gce_virt + (swbuf_data->offset);
+
+	pipe = mtk_imgsys_dev_get_pipe(imgsys_dev);
+	if (!pipe) {
+		dev_info(imgsys_dev->dev,
+			 "%s: get invalid img_ipi_frameparam from firmware\n",
+			 __func__);
+		return;
+	}
+
+	req = (struct mtk_imgsys_request *)(uintptr_t)swfrm_info->req_vaddr;
+	if (!req) {
+		WARN_ONCE(!req, "%s: frame_no(%d) is lost\n", __func__, req->id);
+		return;
+	}
+
+	if (!req->working_buf) {
+		dev_dbg(imgsys_dev->dev,
+			"%s: (reqfd-%d) composing\n",
+			__func__, req->request_fd);
+	}
+
+	swfrm_info->req = (void *)req;
+	swfrm_info->pipe = (void *)pipe;
+	swfrm_info->cb_frmcnt = 0;
+	swfrm_info->total_taskcnt = 0;
+	swfrm_info->hw_hang = -1;
+	total_framenum = swfrm_info->total_frmnum;
+
+	if (total_framenum < 0 || total_framenum > TMAX) {
+		dev_info(imgsys_dev->dev,
+			 "%s:unexpected total_framenum (%d -> %d), MAX (%d/%d)\n",
+			 __func__, swfrm_info->total_frmnum,
+			 total_framenum,
+			 TMAX, TMAX);
+		return;
+	}
+
+	for (i = 0 ; i < total_framenum ; i++) {
+		swfrm_info->user_info[i].g_swbuf =
+			gce_virt + (swfrm_info->user_info[i].sw_goft);
+	}
+
+	req->swfrm_info = swfrm_info;
+
+	up(&imgsys_dev->sem);
+
+	INIT_WORK(&req->runner_work, imgsys_runner_func);
+	queue_work(req->imgsys_pipe->imgsys_dev->runner_wq,
+		   &req->runner_work);
+}
+
+static int mtk_imgsys_hw_flush_pipe_jobs(struct mtk_imgsys_pipe *pipe)
+{
+	struct mtk_imgsys_request *req;
+	struct list_head job_list = LIST_HEAD_INIT(job_list);
+	unsigned long flag;
+	int num;
+	int ret;
+
+	spin_lock_irqsave(&pipe->running_job_lock, flag);
+	list_splice_init(&pipe->pipe_job_running_list, &job_list);
+	pipe->num_jobs = 0;
+	spin_unlock_irqrestore(&pipe->running_job_lock, flag);
+
+	num = atomic_read(&pipe->imgsys_dev->num_composing);
+	ret = wait_event_timeout(pipe->imgsys_dev->flushing_waitq, !(num),
+				 msecs_to_jiffies(MTK_IMGSYS_JOB_TIMEOUT_MS));
+	if (!ret && num) {
+		dev_info(pipe->imgsys_dev->dev,
+			 "flushing is aborted, num(%d)\n", num);
+		return -EINVAL;
+	}
+
+	list_for_each_entry(req, &job_list, list)
+		mtk_imgsys_pipe_job_finish(req, VB2_BUF_STATE_ERROR);
+
+	dev_dbg(pipe->imgsys_dev->dev,
+		"%s: wakeup num(%d)\n", __func__, num);
+	return 0;
+}
+
+static void module_uninit(struct kref *kref)
+{
+	struct mtk_imgsys_dev *imgsys_dev;
+	int i;
+
+	imgsys_dev = container_of(kref, struct mtk_imgsys_dev, init_kref);
+
+	for (i = 0; i < (imgsys_dev->num_mods); i++)
+		if (imgsys_dev->modules[i].uninit)
+			imgsys_dev->modules[i].uninit(imgsys_dev);
+}
 
 static int mtk_imgsys_hw_connect(struct mtk_imgsys_dev *imgsys_dev)
 {
 	int ret, i;
+	struct img_init_info info;
 
 	ret = pm_runtime_get_sync(imgsys_dev->dev);
 	if (ret < 0) {
@@ -23,38 +267,228 @@ static int mtk_imgsys_hw_connect(struct mtk_imgsys_dev *imgsys_dev)
 
 	/* Set default value for hardware modules */
 	for (i = 0; i < (imgsys_dev->num_mods); i++)
-		imgsys_dev->modules[i].init(imgsys_dev);
+		if (imgsys_dev->modules[i].init)
+			imgsys_dev->modules[i].init(imgsys_dev);
 
 	kref_init(&imgsys_dev->init_kref);
 
+	ret = imgsys_scp_alloc_reserve_mem(imgsys_dev);
+	if (ret) {
+		dev_err(imgsys_dev->dev, "%s: imgsys_scp_alloc_reserve_mem failed %d\n",
+			__func__, ret);
+		return -EBUSY;
+	}
+
+	/* IMGSYS HW INIT */
+	memset(&info, 0, sizeof(info));
+	info.header_version = HEADER_VER;
+	info.frameparam_size = sizeof(struct img_ipi_frameparam);
+
+	imgsys_scp_get_reserve_mem_info(&info);
+
+	imgsys_scp_init(imgsys_dev, imgsys_scp_handler);
+
+	ret = imgsys_scp_send(imgsys_dev, IPI_IMGSYS_INIT_ID,
+			      (void *)&info, sizeof(info), 0, 1);
+
+	if (ret) {
+		dev_err(imgsys_dev->dev, "%s: send IPI_IMGSYS_INIT_ID failed %d\n",
+			__func__, ret);
+		return -EBUSY;
+	}
+
 	/* calling cmdq stream on */
 	imgsys_cmdq_streamon(imgsys_dev);
+
 	return 0;
 }
 
-static void module_uninit(struct kref *kref)
+static void mtk_imgsys_hw_disconnect(struct mtk_imgsys_dev *imgsys_dev)
 {
-	struct mtk_imgsys_dev *imgsys_dev;
+	int ret;
+	struct img_init_info info = {0};
+
+	imgsys_scp_send(imgsys_dev, IPI_IMGSYS_DEINIT_ID,
+			(void *)&info, sizeof(info), 0, 1);
+
+	imgsys_scp_deinit(imgsys_dev);
+	/* calling cmdq stream off */
+	imgsys_cmdq_streamoff(imgsys_dev);
+
+	/* RELEASE IMGSYS WORKING BUFFER FIRST */
+	ret = imgsys_scp_free_reserve_mem(imgsys_dev);
+	if (ret) {
+		dev_info(imgsys_dev->dev,
+			 "%s: imgsys_scp_free_reserve_mem failed(%d)\n",
+			 __func__, ret);
+	}
+
+	pm_runtime_put_sync(imgsys_dev->dev);
+
+	kref_put(&imgsys_dev->init_kref, module_uninit);
+}
+
+static void imgsys_fill_img_buf(struct mtk_imgsys_dev_buffer *dev_buf,
+				struct header_desc_norm *desc_norm,
+				struct mtk_imgsys_request *req)
+{
+	struct frameparams *buf_info = &desc_norm->fparams;
 	int i;
 
-	imgsys_dev = container_of(kref, struct mtk_imgsys_dev, init_kref);
+	desc_norm->fparams_num = 1;
 
-	for (i = 0; i < (imgsys_dev->num_mods); i++)
-		if (imgsys_dev->modules[i].uninit)
-			imgsys_dev->modules[i].uninit(imgsys_dev);
+	buf_info->buf.num_planes = dev_buf->fmt.fmt.pix_mp.num_planes;
+	buf_info->fmt.width = dev_buf->fmt.fmt.pix_mp.width;
+	buf_info->fmt.height = dev_buf->fmt.fmt.pix_mp.height;
+	buf_info->fmt.pixelformat = dev_buf->fmt.fmt.pix_mp.pixelformat;
+	buf_info->crop = dev_buf->crop;
+	buf_info->rotation = dev_buf->rotation;
+	buf_info->hflip = dev_buf->hflip;
+	buf_info->vflip = dev_buf->vflip;
+	buf_info->resizeratio = dev_buf->resize_ratio;
+
+	for (i = 0; i < buf_info->buf.num_planes; i++) {
+		buf_info->buf.planes[i].m.dma_buf.offset =
+			dev_buf->vbb.planes[i].data_offset;
+		buf_info->buf.planes[i].isp_addr = dev_buf->isp_daddr[i];
+		buf_info->buf.planes[i].size = dev_buf->vbb.vb2_buf.planes[i].length;
+		buf_info->fmt.plane_fmt[i].sizeimage =
+			dev_buf->vbb.vb2_buf.planes[i].min_length;
+		buf_info->fmt.plane_fmt[i].bytesperline =
+			dev_buf->fmt.fmt.pix_mp.plane_fmt[i].bytesperline;
+	}
 }
 
-static void mtk_imgsys_hw_disconnect(struct mtk_imgsys_dev *imgsys_dev)
+static void imgsys_fill_meta_buf(struct mtk_imgsys_dev_buffer *dev_buf,
+				 struct header_desc_norm *desc_norm,
+				 struct mtk_imgsys_request *req)
 {
-	/* calling cmdq stream off */
-	imgsys_cmdq_streamoff(imgsys_dev);
-	kref_put(&imgsys_dev->init_kref, module_uninit);
+	struct frameparams *buf_info = &desc_norm->fparams;
+
+	memset(&buf_info->buf, 0, sizeof(buf_info->buf));
+
+	desc_norm->fparams_num = 1;
+
+	buf_info->buf.num_planes = 1;
+
+	buf_info->fmt.width = dev_buf->fmt.fmt.meta.buffersize;
+	buf_info->fmt.height = 1;
+	buf_info->fmt.pixelformat = dev_buf->fmt.fmt.meta.dataformat;
+	buf_info->fmt.plane_fmt[0].sizeimage = dev_buf->fmt.fmt.meta.buffersize;
+	buf_info->fmt.plane_fmt[0].bytesperline = dev_buf->fmt.fmt.meta.buffersize;
+	buf_info->buf.planes[0].isp_addr = dev_buf->isp_daddr[0];
+	buf_info->buf.planes[0].size = dev_buf->vbb.vb2_buf.planes[0].length;
+	buf_info->buf.planes[0].m.dma_buf.phyaddr = dev_buf->scp_daddr[0];
+}
+
+static void imgsys_fill_buf_info(int idx, struct mtk_imgsys_dev_buffer *dev_buf,
+				 struct singlenode_desc_norm *sd_norm,
+				 struct mtk_imgsys_request *req)
+{
+	if (!dev_buf)
+		return;
+
+	if (idx < 0 || idx >= IMG_MAX_HW_DMAS)
+		return;
+
+	sd_norm->dmas_enable[idx] = 1;
+
+	switch (idx) {
+	case MTK_IMGSYS_VIDEO_NODE_ID_TUNING_OUT:
+		imgsys_fill_meta_buf(dev_buf, &sd_norm->tuning_meta, req);
+		break;
+	case MTK_IMGSYS_VIDEO_NODE_ID_CTRLMETA_OUT:
+		imgsys_fill_meta_buf(dev_buf, &sd_norm->ctrl_meta, req);
+		break;
+	case MTK_IMGSYS_VIDEO_NODE_ID_METAI_OUT:
+	case MTK_IMGSYS_VIDEO_NODE_ID_FEO_CAPTURE:
+	case MTK_IMGSYS_VIDEO_NODE_ID_IMGSTATO_CAPTURE:
+		imgsys_fill_meta_buf(dev_buf, &sd_norm->dmas[idx], req);
+		break;
+	default:
+		imgsys_fill_img_buf(dev_buf, &sd_norm->dmas[idx], req);
+		break;
+	}
+}
+
+static void imgsys_fill_singledev_buf(struct mtk_imgsys_request *req)
+{
+	struct mtk_imgsys_hw_working_buf *buf = req->working_buf;
+	int i;
+
+	if (!buf)
+		return;
+
+	memset(buf->sd_norm, 0, sizeof(*buf->sd_norm));
+	for (i = 0; i < req->imgsys_pipe->desc->total_queues; i++)
+		imgsys_fill_buf_info(i, req->buf_map[i], buf->sd_norm, req);
+}
+
+static void imgsys_composer_workfunc(struct work_struct *work)
+{
+	struct mtk_imgsys_request *req = mtk_imgsys_composer_work_to_req(work);
+	struct mtk_imgsys_dev *imgsys_dev = req->imgsys_pipe->imgsys_dev;
+	struct img_ipi_param ipi_param;
+	int ret;
+
+	imgsys_fill_singledev_buf(req);
+
+	dev_dbg(imgsys_dev->dev,
+		"%s:(reqfd-%d) to send frame_no(%d)\n",
+		__func__, req->request_fd,
+		req->img_fparam.frame_no);
+	media_request_get(&req->req);
+
+	if (down_interruptible(&imgsys_dev->sem))
+		return;
+
+	ipi_param.req_addr_va = (u64)(uintptr_t)req;
+	ipi_param.frm_param.offset = 0;
+	ipi_param.frm_param.scp_addr = req->working_buf->scp_daddr;
+
+	mutex_lock(&imgsys_dev->hw_op_lock);
+	atomic_inc(&imgsys_dev->num_composing);
+
+	ret = imgsys_scp_send(imgsys_dev, IPI_IMGSYS_FRAME_ID,
+			      &ipi_param, sizeof(ipi_param),
+			      req->request_fd, 0);
+
+	if (ret) {
+		dev_info(imgsys_dev->dev,
+			 "frame_no(%d) send SCP_IPI_DIP_FRAME failed %d\n",
+			 req->img_fparam.frame_no, ret);
+		mtk_imgsys_pipe_remove_job(req);
+		mtk_imgsys_hw_working_buf_free(imgsys_dev, req->working_buf);
+		req->working_buf = NULL;
+		mtk_imgsys_pipe_job_finish(req, VB2_BUF_STATE_ERROR);
+		wake_up(&imgsys_dev->flushing_waitq);
+	}
+	mutex_unlock(&imgsys_dev->hw_op_lock);
+
+	dev_dbg(imgsys_dev->dev, "%s:(reqfd-%d) sent\n", __func__,
+		req->request_fd);
 }
 
 void mtk_imgsys_hw_enqueue(struct mtk_imgsys_dev *imgsys_dev,
 			   struct mtk_imgsys_request *req)
 {
-	/* Function implementation will be provided in subsequent patches */
+	struct req_frameparam *frameparam = &req->img_fparam;
+
+	req->working_buf = mtk_imgsys_hw_working_buf_alloc(imgsys_dev);
+	if (!req->working_buf) {
+		dev_info(imgsys_dev->dev,
+			 "%s:req(%p): no free working buffer available\n",
+			 req->imgsys_pipe->desc->name, req);
+		return;
+	}
+
+	frameparam->state = FRAME_STATE_INIT;
+	frameparam->frame_no =
+			atomic_inc_return(&imgsys_dev->imgsys_enqueue_cnt);
+
+	INIT_WORK(&req->composer_work, imgsys_composer_workfunc);
+	queue_work(req->imgsys_pipe->imgsys_dev->composer_wq,
+		   &req->composer_work);
 }
 
 int mtk_imgsys_hw_streamon(struct mtk_imgsys_pipe *pipe)
@@ -72,10 +506,13 @@ int mtk_imgsys_hw_streamon(struct mtk_imgsys_pipe *pipe)
 			mutex_unlock(&imgsys_dev->hw_op_lock);
 			return ret;
 		}
+		INIT_LIST_HEAD(&pipe->pipe_job_running_list);
 	}
 	imgsys_dev->stream_cnt++;
+	atomic_set(&imgsys_dev->num_composing, 0);
 	mutex_unlock(&imgsys_dev->hw_op_lock);
 
+	pipe->streaming = 1;
 	dev_dbg(pipe->imgsys_dev->dev,
 		"%s:%s: stream on, id(%d), stream cnt(%d)\n",
 		__func__, pipe->desc->name, pipe->desc->id, imgsys_dev->stream_cnt);
@@ -86,11 +523,18 @@ int mtk_imgsys_hw_streamon(struct mtk_imgsys_pipe *pipe)
 int mtk_imgsys_hw_streamoff(struct mtk_imgsys_pipe *pipe)
 {
 	struct mtk_imgsys_dev *imgsys_dev = pipe->imgsys_dev;
+	int ret;
 
 	dev_dbg(pipe->imgsys_dev->dev,
 		"%s:%s: stream off, id(%d), stream cnt(%d)\n",
 		__func__, pipe->desc->name, pipe->desc->id, imgsys_dev->stream_cnt);
 
+	pipe->streaming = 0;
+
+	ret = mtk_imgsys_hw_flush_pipe_jobs(pipe);
+	if (ret)
+		return ret;
+
 	mutex_lock(&imgsys_dev->hw_op_lock);
 	imgsys_dev->stream_cnt--;
 	if (!imgsys_dev->stream_cnt)
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c
index e25f17b98649..ea2ce03c2619 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c
@@ -5,6 +5,7 @@
  * Author: Frederic Chen <frederic.chen@mediatek.com>
  *
  */
+
 #include <linux/platform_device.h>
 #include <linux/of_platform.h>
 #include <linux/of_device.h>
@@ -12,6 +13,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/dma-mapping.h>
 #include <linux/vmalloc.h>
+#include <linux/remoteproc/mtk_scp.h>
 #include <linux/videodev2.h>
 #include <media/videobuf2-dma-contig.h>
 #include <media/v4l2-ioctl.h>
@@ -29,6 +31,9 @@
 #include "mtk_imgsys_v4l2_vnode.h"
 #include "mtk_imgsys-dev.h"
 #include "mtk_imgsys-sys.h"
+#include "mtk_imgsys-cmdq.h"
+#include "mtk_imgsys-work_buf.h"
+#include "mtk_imgsys-gce_work.h"
 
 #define IMGSYS_MAX_BUFFERS	256
 #define IMGSYS_SUSPEND_TIME 3000 /* ms */
@@ -1467,6 +1472,77 @@ static void mtk_imgsys_dev_v4l2_release(struct mtk_imgsys_dev *imgsys_dev)
 	mtk_imgsys_dev_media_unregister(imgsys_dev);
 }
 
+static int mtk_imgsys_res_init(struct platform_device *pdev,
+			       struct mtk_imgsys_dev *imgsys_dev)
+{
+	int ret;
+
+	imgsys_dev->gcecb_wq =
+		alloc_ordered_workqueue("%s",
+					__WQ_LEGACY | WQ_MEM_RECLAIM |
+					WQ_FREEZABLE,
+					"imgsys_mdp_callback");
+	if (!imgsys_dev->gcecb_wq) {
+		dev_err(imgsys_dev->dev,
+			"%s: unable to alloc mdpcb workqueue\n", __func__);
+		return -ENOMEM;
+	}
+
+	imgsys_dev->composer_wq =
+		alloc_ordered_workqueue("%s",
+					__WQ_LEGACY | WQ_MEM_RECLAIM |
+					WQ_FREEZABLE | WQ_HIGHPRI,
+					"imgsys_composer");
+	if (!imgsys_dev->composer_wq) {
+		dev_err(imgsys_dev->dev,
+			"%s: unable to alloc composer workqueue\n", __func__);
+		ret = -ENOMEM;
+		goto destroy_gcecb_wq;
+	}
+
+	imgsys_dev->runner_wq =
+		alloc_ordered_workqueue("%s",
+					__WQ_LEGACY | WQ_MEM_RECLAIM |
+					WQ_FREEZABLE | WQ_HIGHPRI,
+					"imgsys_runner");
+	if (!imgsys_dev->runner_wq) {
+		dev_err(imgsys_dev->dev,
+			"%s: unable to alloc runner workqueue\n", __func__);
+		ret = -ENOMEM;
+		goto destroy_composer_wq;
+	}
+
+	init_waitqueue_head(&imgsys_dev->flushing_waitq);
+
+	return 0;
+
+destroy_composer_wq:
+	destroy_workqueue(imgsys_dev->composer_wq);
+
+destroy_gcecb_wq:
+	destroy_workqueue(imgsys_dev->gcecb_wq);
+
+	return ret;
+}
+
+static void mtk_imgsys_res_release(struct mtk_imgsys_dev *imgsys_dev)
+{
+	flush_workqueue(imgsys_dev->gcecb_wq);
+	destroy_workqueue(imgsys_dev->gcecb_wq);
+	imgsys_dev->gcecb_wq = NULL;
+
+	flush_workqueue(imgsys_dev->composer_wq);
+	destroy_workqueue(imgsys_dev->composer_wq);
+	imgsys_dev->composer_wq = NULL;
+
+	flush_workqueue(imgsys_dev->runner_wq);
+	destroy_workqueue(imgsys_dev->runner_wq);
+	imgsys_dev->runner_wq = NULL;
+
+	atomic_set(&imgsys_dev->num_composing, 0);
+	atomic_set(&imgsys_dev->imgsys_enqueue_cnt, 0);
+}
+
 static int mtk_imgsys_of_rproc(struct mtk_imgsys_dev *imgsys,
 			       struct platform_device *pdev)
 {
@@ -1519,6 +1595,8 @@ static int mtk_imgsys_probe(struct platform_device *pdev)
 	imgsys_dev->num_mods = data->mod_num;
 	imgsys_dev->stream_cnt = 0;
 	mutex_init(&imgsys_dev->hw_op_lock);
+	atomic_set(&imgsys_dev->imgsys_enqueue_cnt, 0);
+	atomic_set(&imgsys_dev->num_composing, 0);
 
 	/* Get Clocks */
 	imgsys_dev->clks = data->clks;
@@ -1592,6 +1670,33 @@ static int mtk_imgsys_probe(struct platform_device *pdev)
 		goto err_free_larb_alloc;
 	}
 
+	/* Initializing resource for ImgSys */
+	ret = mtk_imgsys_res_init(pdev, imgsys_dev);
+	if (ret) {
+		dev_info(imgsys_dev->dev,
+			 "%s: mtk_imgsys_res_init failed(%d)\n", __func__, ret);
+
+		ret = -EBUSY;
+		goto err_release_deinit_v4l2;
+	}
+
+	ret = mtk_imgsys_hw_working_buf_pool_init(imgsys_dev);
+	if (ret) {
+		dev_info(&pdev->dev, "working buffer init failed(%d)\n", ret);
+		goto err_release_deinit_v4l2;
+	}
+
+	/* Initializing resource for CMDQ driver */
+	imgsys_cmdq_init(imgsys_dev);
+
+	sema_init(&imgsys_dev->sem, MTK_IMGSYS_GCE_CB_MAX_WORK_ITEMS);
+
+	ret = gce_cb_work_pool_init(imgsys_dev);
+	if (ret) {
+		dev_info(&pdev->dev, "gce callback work pool init failed(%d)\n", ret);
+		goto err_release_working_buf_pool;
+	}
+
 	/* Enable power*/
 	pm_runtime_set_autosuspend_delay(&pdev->dev, IMGSYS_SUSPEND_TIME);
 	pm_runtime_use_autosuspend(&pdev->dev);
@@ -1600,11 +1705,15 @@ static int mtk_imgsys_probe(struct platform_device *pdev)
 	ret = platform_driver_register(&mtk_imgsys_larb_driver);
 	if (ret) {
 		dev_info(imgsys_dev->dev, "register mtk_imgsys_larb_driver fail\n");
-		goto err_release_deinit_v4l2;
+		goto err_free_gce_cb_work_pool_alloc;
 	}
 
 	return 0;
 
+err_free_gce_cb_work_pool_alloc:
+	gce_cb_work_pool_release(imgsys_dev);
+err_release_working_buf_pool:
+	mtk_imgsys_hw_working_buf_pool_release(imgsys_dev);
 err_release_deinit_v4l2:
 	mtk_imgsys_dev_v4l2_release(imgsys_dev);
 err_free_larb_alloc:
@@ -1618,17 +1727,32 @@ static void mtk_imgsys_remove(struct platform_device *pdev)
 {
 	struct mtk_imgsys_dev *imgsys_dev = dev_get_drvdata(&pdev->dev);
 
+	mtk_imgsys_res_release(imgsys_dev);
 	pm_runtime_disable(&pdev->dev);
 	platform_driver_unregister(&mtk_imgsys_larb_driver);
 	mtk_imgsys_dev_v4l2_release(imgsys_dev);
+	mtk_imgsys_hw_working_buf_pool_release(imgsys_dev);
+	gce_cb_work_pool_release(imgsys_dev);
 	mutex_destroy(&imgsys_dev->hw_op_lock);
+	imgsys_cmdq_release(imgsys_dev);
 	devm_kfree(&pdev->dev, imgsys_dev->larbs);
 	devm_kfree(&pdev->dev, imgsys_dev);
 }
 
 static int __maybe_unused mtk_imgsys_pm_suspend(struct device *dev)
 {
-	int ret;
+	struct mtk_imgsys_dev *imgsys_dev = dev_get_drvdata(dev);
+	int ret, num;
+
+	num = atomic_read(&imgsys_dev->num_composing);
+	ret = wait_event_timeout(imgsys_dev->flushing_waitq, !(num),
+				 msecs_to_jiffies(MTK_IMGSYS_JOB_TIMEOUT_MS));
+	if (!ret && num) {
+		dev_info(dev, "%s: flushing SCP job timeout, num(%d)\n",
+			 __func__, num);
+
+		return -EBUSY;
+	}
 
 	if (pm_runtime_suspended(dev)) {
 		dev_info(dev, "%s: pm_runtime_suspended is true, no action\n",
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-work_buf.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-work_buf.c
new file mode 100644
index 000000000000..5f220bbe8f3f
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-work_buf.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ *
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *         Holmes Chiou <holmes.chiou@mediatek.com>
+ *
+ */
+
+#include "mtk_imgsys-work_buf.h"
+
+int mtk_imgsys_hw_working_buf_pool_init(struct mtk_imgsys_dev *imgsys_dev)
+{
+	struct mtk_imgsys_hw_working_buf *buf;
+	void *sd;
+	dma_addr_t scp_addr, isp_daddr;
+	size_t size = sizeof(struct singlenode_desc_norm);
+	int i;
+
+	if (imgsys_dev->working_bufs)
+		return 0;
+
+	INIT_LIST_HEAD(&imgsys_dev->free_working_bufs.list);
+	spin_lock_init(&imgsys_dev->free_working_bufs.lock);
+
+	imgsys_dev->working_bufs = kmalloc_array(IMGSYS_WORKING_BUF_NUM, sizeof(*buf), GFP_KERNEL);
+	if (!imgsys_dev->working_bufs)
+		return -ENOMEM;
+
+	sd = dma_alloc_coherent(imgsys_dev->smem_dev,
+				size * IMGSYS_WORKING_BUF_NUM,
+				&scp_addr, GFP_KERNEL);
+	if (!sd)
+		goto err_alloc;
+
+	isp_daddr = dma_map_resource(imgsys_dev->dev,
+				     scp_addr,
+				     size * IMGSYS_WORKING_BUF_NUM,
+				     DMA_TO_DEVICE, 0);
+	if (!isp_daddr)
+		goto err_map;
+
+	for (i = 0; i < IMGSYS_WORKING_BUF_NUM; i++) {
+		buf = &imgsys_dev->working_bufs[i];
+
+		buf->sd_norm = sd;
+		buf->isp_daddr = isp_daddr;
+		buf->scp_daddr = scp_addr;
+
+		sd += size;
+		isp_daddr += size;
+		scp_addr += size;
+
+		list_add_tail(&buf->list,
+			      &imgsys_dev->free_working_bufs.list);
+	}
+
+	return 0;
+
+err_map:
+	dma_free_coherent(imgsys_dev->dev,
+			  sizeof(struct singlenode_desc_norm),
+			  sd, scp_addr);
+err_alloc:
+	kfree(imgsys_dev->working_bufs);
+
+	return -ENOMEM;
+}
+
+struct mtk_imgsys_hw_working_buf*
+mtk_imgsys_hw_working_buf_alloc(struct mtk_imgsys_dev *imgsys_dev)
+{
+	struct mtk_imgsys_hw_working_buf *working_buf;
+
+	spin_lock(&imgsys_dev->free_working_bufs.lock);
+	if (list_empty(&imgsys_dev->free_working_bufs.list)) {
+		spin_unlock(&imgsys_dev->free_working_bufs.lock);
+		return NULL;
+	}
+
+	working_buf = list_first_entry(&imgsys_dev->free_working_bufs.list,
+				       struct mtk_imgsys_hw_working_buf,
+				       list);
+	list_del(&working_buf->list);
+	spin_unlock(&imgsys_dev->free_working_bufs.lock);
+
+	return working_buf;
+}
+
+void mtk_imgsys_hw_working_buf_free(struct mtk_imgsys_dev *imgsys_dev,
+				    struct mtk_imgsys_hw_working_buf *working_buf)
+{
+	if (!working_buf)
+		return;
+
+	spin_lock(&imgsys_dev->free_working_bufs.lock);
+	list_add_tail(&working_buf->list,
+		      &imgsys_dev->free_working_bufs.list);
+	spin_unlock(&imgsys_dev->free_working_bufs.lock);
+}
+
+void mtk_imgsys_hw_working_buf_pool_release(struct mtk_imgsys_dev *imgsys_dev)
+{
+	struct mtk_imgsys_hw_working_buf *buf = &imgsys_dev->working_bufs[0];
+
+	dma_unmap_resource(imgsys_dev->dev, buf->isp_daddr,
+			   sizeof(struct singlenode_desc_norm) * IMGSYS_WORKING_BUF_NUM,
+			   DMA_TO_DEVICE, 0);
+	dma_free_coherent(imgsys_dev->dev,
+			  sizeof(struct singlenode_desc_norm) * IMGSYS_WORKING_BUF_NUM,
+			  buf->sd_norm, buf->scp_daddr);
+	kfree(imgsys_dev->working_bufs);
+}
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-work_buf.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-work_buf.h
new file mode 100644
index 000000000000..d54b02e6dfa8
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-work_buf.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ *
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *         Holmes Chiou <holmes.chiou@mediatek.com>
+ *
+ */
+
+#ifndef _MTK_IMGSYS_WORK_BUF_H_
+#define _MTK_IMGSYS_WORK_BUF_H_
+
+#include <linux/clk.h>
+#include <linux/dma-buf.h>
+#include <linux/scatterlist.h>
+#include "mtk_header_desc.h"
+#include "mtk_imgsys-dev.h"
+
+#define IMGSYS_WORKING_BUF_NUM		32
+
+/**
+ * struct mtk_imgsys_hw_working_buf - Represents a hardware working buffer
+ * @sd_norm: Pointer to the single node descriptor normalized structure
+ * @dbuf: Pointer to the DMA buffer
+ * @attach: Pointer to the DMA buffer attachment
+ * @sgt: Pointer to the scatter-gather table
+ * @scp_daddr: Physical address for SCP (System Control Processor)
+ * @isp_daddr: Virtual address for ISP (Image Signal Processor)
+ * @list: List head for linking multiple buffers
+ *
+ * This structure represents a hardware working buffer used in the MediaTek
+ * Image System. It includes pointers to various buffer-related structures
+ * and addresses, as well as a list head for linking multiple buffers.
+ */
+struct mtk_imgsys_hw_working_buf {
+	struct singlenode_desc_norm *sd_norm;
+	struct dma_buf *dbuf;
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
+	dma_addr_t scp_daddr;
+	dma_addr_t isp_daddr;
+	struct list_head list;
+};
+
+int mtk_imgsys_hw_working_buf_pool_init(struct mtk_imgsys_dev *imgsys_dev);
+
+struct mtk_imgsys_hw_working_buf*
+mtk_imgsys_hw_working_buf_alloc(struct mtk_imgsys_dev *imgsys_dev);
+
+void mtk_imgsys_hw_working_buf_free(struct mtk_imgsys_dev *imgsys_dev,
+				    struct mtk_imgsys_hw_working_buf *working_buf);
+
+void mtk_imgsys_hw_working_buf_pool_release(struct mtk_imgsys_dev *imgsys_dev);
+
+#endif /* _MTK_IMGSYS_WORK_BUF_H_ */
-- 
2.45.2


