Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54D6BD1BBE
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 00:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732344AbfJIW1q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 18:27:46 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:8650 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731150AbfJIW1q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Oct 2019 18:27:46 -0400
X-Halon-ID: db391102-eae3-11e9-837a-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.88.101])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id db391102-eae3-11e9-837a-0050569116f7;
        Thu, 10 Oct 2019 00:26:37 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/2] rcar-vin: Add support for V4L2_FIELD_SEQ_{TB,BT}
Date:   Thu, 10 Oct 2019 00:27:34 +0200
Message-Id: <20191009222734.1911060-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009222734.1911060-1-niklas.soderlund+renesas@ragnatech.se>
References: <20191009222734.1911060-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The hardware does not support capturing the field types
V4L2_FIELD_SEQ_TB and V4L2_FIELD_SEQ_BT. To capture in these formats the
driver needs to adjust the offset of the capture buffer and capture
twice to each vb2 buffer.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-dma.c  | 57 ++++++++++++++++++---
 drivers/media/platform/rcar-vin/rcar-v4l2.c |  7 ++-
 drivers/media/platform/rcar-vin/rcar-vin.h  | 19 +++++++
 3 files changed, 74 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index a9fffadc268e96ba..c46f6e90627d45fd 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -534,7 +534,7 @@ static void rvin_crop_scale_comp_gen2(struct rvin_dev *vin)
 
 	/* Set scaling coefficient */
 	crop_height = vin->crop.height;
-	if (V4L2_FIELD_IS_INTERLACED(vin->format.field))
+	if (V4L2_FIELD_HAS_BOTH(vin->format.field))
 		crop_height *= 2;
 
 	ys = 0;
@@ -625,6 +625,8 @@ static int rvin_setup(struct rvin_dev *vin)
 	case V4L2_FIELD_INTERLACED_BT:
 		vnmc = VNMC_IM_FULL | VNMC_FOC;
 		break;
+	case V4L2_FIELD_SEQ_TB:
+	case V4L2_FIELD_SEQ_BT:
 	case V4L2_FIELD_NONE:
 		vnmc = VNMC_IM_ODD_EVEN;
 		progressive = true;
@@ -839,15 +841,23 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin, int slot)
 	struct rvin_buffer *buf;
 	struct vb2_v4l2_buffer *vbuf;
 	dma_addr_t phys_addr;
+	int prev;
 
 	/* A already populated slot shall never be overwritten. */
 	if (WARN_ON(vin->buf_hw[slot].buffer != NULL))
 		return;
 
-	vin_dbg(vin, "Filling HW slot: %d\n", slot);
+	prev = (slot == 0 ? HW_BUFFER_NUM : slot) - 1;
 
-	if (list_empty(&vin->buf_list)) {
+	if (vin->buf_hw[prev].type == HALF_TOP) {
+		vbuf = vin->buf_hw[prev].buffer;
+		vin->buf_hw[slot].buffer = vbuf;
+		vin->buf_hw[slot].type = HALF_BOTTOM;
+		phys_addr = vin->buf_hw[prev].phys + vin->format.sizeimage /
+			(vin->format.pixelformat == V4L2_PIX_FMT_NV16 ? 4 : 2);
+	} else if (list_empty(&vin->buf_list)) {
 		vin->buf_hw[slot].buffer = NULL;
+		vin->buf_hw[slot].type = FULL;
 		phys_addr = vin->scratch_phys;
 	} else {
 		/* Keep track of buffer we give to HW */
@@ -856,10 +866,18 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin, int slot)
 		list_del_init(to_buf_list(vbuf));
 		vin->buf_hw[slot].buffer = vbuf;
 
+		vin->buf_hw[slot].type =
+			V4L2_FIELD_IS_SEQUENTIAL(vin->format.field) ?
+			HALF_TOP : FULL;
+
 		/* Setup DMA */
 		phys_addr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
 	}
 
+	vin_dbg(vin, "Filling HW slot: %d type: %d buffer: %p\n",
+		slot, vin->buf_hw[slot].type, vin->buf_hw[slot].buffer);
+
+	vin->buf_hw[slot].phys = phys_addr;
 	rvin_set_slot_addr(vin, slot, phys_addr);
 }
 
@@ -867,6 +885,11 @@ static int rvin_capture_start(struct rvin_dev *vin)
 {
 	int slot, ret;
 
+	for (slot = 0; slot < HW_BUFFER_NUM; slot++) {
+		vin->buf_hw[slot].buffer = NULL;
+		vin->buf_hw[slot].type = FULL;
+	}
+
 	for (slot = 0; slot < HW_BUFFER_NUM; slot++)
 		rvin_fill_hw_slot(vin, slot);
 
@@ -951,6 +974,16 @@ static irqreturn_t rvin_irq(int irq, void *data)
 
 	/* Capture frame */
 	if (vin->buf_hw[slot].buffer) {
+		/*
+		 * Nothing to do but refill the hardware slot if
+		 * capture only filled first half of vb2 buffer.
+		 */
+		if (vin->buf_hw[slot].type == HALF_TOP) {
+			vin->buf_hw[slot].buffer = NULL;
+			rvin_fill_hw_slot(vin, slot);
+			goto done;
+		}
+
 		vin->buf_hw[slot].buffer->field =
 			rvin_get_active_field(vin, vnms);
 		vin->buf_hw[slot].buffer->sequence = vin->sequence;
@@ -978,14 +1011,22 @@ static void return_all_buffers(struct rvin_dev *vin,
 			       enum vb2_buffer_state state)
 {
 	struct rvin_buffer *buf, *node;
-	int i;
+	struct vb2_v4l2_buffer *freed[HW_BUFFER_NUM];
+	unsigned int i, n;
 
 	for (i = 0; i < HW_BUFFER_NUM; i++) {
-		if (vin->buf_hw[i].buffer) {
-			vb2_buffer_done(&vin->buf_hw[i].buffer->vb2_buf,
-					state);
-			vin->buf_hw[i].buffer = NULL;
+		freed[i] = vin->buf_hw[i].buffer;
+		vin->buf_hw[i].buffer = NULL;
+
+		for (n = 0; n < i; n++) {
+			if (freed[i] == freed[n]) {
+				freed[i] = NULL;
+				break;
+			}
 		}
+
+		if (freed[i])
+			vb2_buffer_done(&freed[i]->vb2_buf, state);
 	}
 
 	list_for_each_entry_safe(buf, node, &vin->buf_list, list) {
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 9a9b89c0dc0b3be4..cbdb0a43aa439830 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -90,7 +90,10 @@ static u32 rvin_format_bytesperline(struct rvin_dev *vin,
 	if (WARN_ON(!fmt))
 		return -EINVAL;
 
-	align = pix->pixelformat == V4L2_PIX_FMT_NV16 ? 0x20 : 0x10;
+	if (V4L2_FIELD_IS_SEQUENTIAL(pix->field))
+		align = 0x80;
+	else
+		align = pix->pixelformat == V4L2_PIX_FMT_NV16 ? 0x20 : 0x10;
 
 	return ALIGN(pix->width, align) * fmt->bpp;
 }
@@ -118,6 +121,8 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
 	case V4L2_FIELD_INTERLACED_BT:
 	case V4L2_FIELD_INTERLACED:
 	case V4L2_FIELD_ALTERNATE:
+	case V4L2_FIELD_SEQ_TB:
+	case V4L2_FIELD_SEQ_BT:
 		break;
 	default:
 		pix->field = RVIN_DEFAULT_FIELD;
diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index 9031fe7f569b908e..8d48894bc49e4db6 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -60,6 +60,23 @@ enum rvin_dma_state {
 	STOPPING,
 };
 
+/**
+ * enum rvin_buffer_type
+ *
+ * Describes how a buffer is given to the hardware. To be able
+ * to capture SEQ_TB/BT it's needed to capture to the same vb2
+ * buffer twice so the type of buffer needs to be kept.
+ *
+ * FULL - One capture fills the whole vb2 buffer
+ * HALF_TOP- One capture fills the top half of the vb2 buffer
+ * HALF_BOTTOM - One capture fills the bottom half of the vb2 buffer
+ */
+enum rvin_buffer_type {
+	FULL,
+	HALF_TOP,
+	HALF_BOTTOM,
+};
+
 /**
  * struct rvin_video_format - Data format stored in memory
  * @fourcc:	Pixelformat
@@ -204,6 +221,8 @@ struct rvin_dev {
 	spinlock_t qlock;
 	struct {
 		struct vb2_v4l2_buffer *buffer;
+		enum rvin_buffer_type type;
+		dma_addr_t phys;
 	} buf_hw[HW_BUFFER_NUM];
 	struct list_head buf_list;
 	unsigned int sequence;
-- 
2.23.0

