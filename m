Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0A0E5214B2
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241454AbiEJMDp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240353AbiEJMDn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFE7546163
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:46 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A19112B9;
        Tue, 10 May 2022 13:59:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183973;
        bh=uhFYqlxRyJRQAdfliGJQT40i74qJsxgVla750D6q6kc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y+gHXfMAgyJCEle/s+pyKsCrEZci0ho9ZCk7hTL5HsI4UXyBznMg8bJb+GDBVoqBt
         OcUcASg5C+DmQYbbu0xDdJvdUX3Y6mjAlTR1yU7UZ2tGz8kf74FSYuGWUkJ9/qyxHy
         E4WSGl6r6xAntQjlYO/ozaHdHOokR3Ve0UyRwHfM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: [PATCH 27/50] staging: media: imx: imx7-media-csi: Decouple from imx_media_buffer
Date:   Tue, 10 May 2022 14:58:36 +0300
Message-Id: <20220510115859.19777-28-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Decouple from the imx_media_buffer structure defined in shared helpers
by duplicating it in the imx7-media-csi driver. No functional change
intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 41 ++++++++++++++--------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index b116f6ab96f0..bd1bc3fada2e 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -171,6 +171,19 @@ enum imx_csi_model {
 	IMX7_CSI_IMX8MQ,
 };
 
+struct imx7_csi_vb2_buffer {
+	struct vb2_v4l2_buffer vbuf;
+	struct list_head list;
+};
+
+static inline struct imx7_csi_vb2_buffer *
+to_imx7_csi_vb2_buffer(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	return container_of(vbuf, struct imx7_csi_vb2_buffer, vbuf);
+}
+
 struct imx7_csi {
 	struct device *dev;
 
@@ -209,7 +222,7 @@ struct imx7_csi {
 	spinlock_t q_lock;			/* Protect ready_q */
 
 	/* Buffers and streaming state */
-	struct imx_media_buffer *active_vb2_buf[2];
+	struct imx7_csi_vb2_buffer *active_vb2_buf[2];
 	struct imx_media_dma_buf underrun_buf;
 
 	bool is_streaming;
@@ -355,11 +368,11 @@ static void imx7_csi_update_buf(struct imx7_csi *csi, dma_addr_t phys,
 		imx7_csi_reg_write(csi, phys, CSI_CSIDMASA_FB1);
 }
 
-static struct imx_media_buffer *imx7_csi_video_next_buf(struct imx7_csi *csi);
+static struct imx7_csi_vb2_buffer *imx7_csi_video_next_buf(struct imx7_csi *csi);
 
 static void imx7_csi_setup_vb2_buf(struct imx7_csi *csi)
 {
-	struct imx_media_buffer *buf;
+	struct imx7_csi_vb2_buffer *buf;
 	struct vb2_buffer *vb2_buf;
 	dma_addr_t phys[2];
 	int i;
@@ -382,7 +395,7 @@ static void imx7_csi_setup_vb2_buf(struct imx7_csi *csi)
 static void imx7_csi_dma_unsetup_vb2_buf(struct imx7_csi *csi,
 					 enum vb2_buffer_state return_status)
 {
-	struct imx_media_buffer *buf;
+	struct imx7_csi_vb2_buffer *buf;
 	int i;
 
 	/* return any remaining active frames with return_status */
@@ -652,7 +665,7 @@ static void imx7_csi_error_recovery(struct imx7_csi *csi)
 static void imx7_csi_vb2_buf_done(struct imx7_csi *csi)
 {
 	struct imx_media_video_dev *vdev = &csi->vdev;
-	struct imx_media_buffer *done, *next;
+	struct imx7_csi_vb2_buffer *done, *next;
 	struct vb2_buffer *vb;
 	dma_addr_t phys;
 
@@ -997,7 +1010,7 @@ static int imx7_csi_video_queue_setup(struct vb2_queue *vq,
 
 static int imx7_csi_video_buf_init(struct vb2_buffer *vb)
 {
-	struct imx_media_buffer *buf = to_imx_media_vb(vb);
+	struct imx7_csi_vb2_buffer *buf = to_imx7_csi_vb2_buffer(vb);
 
 	INIT_LIST_HEAD(&buf->list);
 
@@ -1024,7 +1037,7 @@ static int imx7_csi_video_buf_prepare(struct vb2_buffer *vb)
 static void imx7_csi_video_buf_queue(struct vb2_buffer *vb)
 {
 	struct imx7_csi *csi = vb2_get_drv_priv(vb->vb2_queue);
-	struct imx_media_buffer *buf = to_imx_media_vb(vb);
+	struct imx7_csi_vb2_buffer *buf = to_imx7_csi_vb2_buffer(vb);
 	unsigned long flags;
 
 	spin_lock_irqsave(&csi->q_lock, flags);
@@ -1073,7 +1086,7 @@ static int imx7_csi_video_start_streaming(struct vb2_queue *vq,
 					  unsigned int count)
 {
 	struct imx7_csi *csi = vb2_get_drv_priv(vq);
-	struct imx_media_buffer *buf, *tmp;
+	struct imx7_csi_vb2_buffer *buf, *tmp;
 	unsigned long flags;
 	int ret;
 
@@ -1115,8 +1128,8 @@ static int imx7_csi_video_start_streaming(struct vb2_queue *vq,
 static void imx7_csi_video_stop_streaming(struct vb2_queue *vq)
 {
 	struct imx7_csi *csi = vb2_get_drv_priv(vq);
-	struct imx_media_buffer *frame;
-	struct imx_media_buffer *tmp;
+	struct imx7_csi_vb2_buffer *frame;
+	struct imx7_csi_vb2_buffer *tmp;
 	unsigned long flags;
 
 	mutex_lock(&csi->mdev.graph_mutex);
@@ -1205,16 +1218,16 @@ static const struct v4l2_file_operations imx7_csi_video_fops = {
  * Video Capture Device - Init & Cleanup
  */
 
-static struct imx_media_buffer *imx7_csi_video_next_buf(struct imx7_csi *csi)
+static struct imx7_csi_vb2_buffer *imx7_csi_video_next_buf(struct imx7_csi *csi)
 {
-	struct imx_media_buffer *buf = NULL;
+	struct imx7_csi_vb2_buffer *buf = NULL;
 	unsigned long flags;
 
 	spin_lock_irqsave(&csi->q_lock, flags);
 
 	/* get next queued buffer */
 	if (!list_empty(&csi->ready_q)) {
-		buf = list_entry(csi->ready_q.next, struct imx_media_buffer,
+		buf = list_entry(csi->ready_q.next, struct imx7_csi_vb2_buffer,
 				 list);
 		list_del(&buf->list);
 	}
@@ -1336,7 +1349,7 @@ static int imx7_csi_video_init(struct imx7_csi *csi)
 	vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	vq->drv_priv = csi;
-	vq->buf_struct_size = sizeof(struct imx_media_buffer);
+	vq->buf_struct_size = sizeof(struct imx7_csi_vb2_buffer);
 	vq->ops = &imx7_csi_video_qops;
 	vq->mem_ops = &vb2_dma_contig_memops;
 	vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-- 
Regards,

Laurent Pinchart

