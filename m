Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F13982740EB
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 13:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgIVLeS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 07:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgIVLeQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 07:34:16 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE13C061755
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2020 04:34:16 -0700 (PDT)
Received: from guri.fritz.box (p200300c7cf13ec005877be1094b7a29d.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:5877:be10:94b7:a29d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2A71029B4CE;
        Tue, 22 Sep 2020 12:34:14 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v3 11/12] media: staging: rkisp1: use the right variants of spin_lock
Date:   Tue, 22 Sep 2020 13:34:01 +0200
Message-Id: <20200922113402.12442-12-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
References: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When locking, use either 'spin_lock' or 'spin_lock_irq'
according to the context. There is nowhere need to
use 'spin_lock_irqsave'.
Outside of irq context, always use 'spin_lock_irq'
to be on the safe side.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 15 ++++++--------
 drivers/staging/media/rkisp1/rkisp1-params.c  | 20 ++++++++-----------
 2 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 1c762a369b63..012c0825a386 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -626,9 +626,8 @@ static void rkisp1_handle_buffer(struct rkisp1_capture *cap)
 {
 	struct rkisp1_isp *isp = &cap->rkisp1->isp;
 	struct rkisp1_buffer *curr_buf;
-	unsigned long flags;
 
-	spin_lock_irqsave(&cap->buf.lock, flags);
+	spin_lock(&cap->buf.lock);
 	curr_buf = cap->buf.curr;
 
 	if (curr_buf) {
@@ -641,7 +640,7 @@ static void rkisp1_handle_buffer(struct rkisp1_capture *cap)
 	}
 
 	rkisp1_set_next_buf(cap);
-	spin_unlock_irqrestore(&cap->buf.lock, flags);
+	spin_unlock(&cap->buf.lock);
 }
 
 void rkisp1_capture_isr(struct rkisp1_device *rkisp1)
@@ -716,7 +715,6 @@ static void rkisp1_vb2_buf_queue(struct vb2_buffer *vb)
 		container_of(vbuf, struct rkisp1_buffer, vb);
 	struct rkisp1_capture *cap = vb->vb2_queue->drv_priv;
 	const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
-	unsigned long flags;
 	unsigned int i;
 
 	memset(ispbuf->buff_addr, 0, sizeof(ispbuf->buff_addr));
@@ -741,9 +739,9 @@ static void rkisp1_vb2_buf_queue(struct vb2_buffer *vb)
 		swap(ispbuf->buff_addr[RKISP1_PLANE_CR],
 		     ispbuf->buff_addr[RKISP1_PLANE_CB]);
 
-	spin_lock_irqsave(&cap->buf.lock, flags);
+	spin_lock_irq(&cap->buf.lock);
 	list_add_tail(&ispbuf->queue, &cap->buf.queue);
-	spin_unlock_irqrestore(&cap->buf.lock, flags);
+	spin_unlock_irq(&cap->buf.lock);
 }
 
 static int rkisp1_vb2_buf_prepare(struct vb2_buffer *vb)
@@ -769,10 +767,9 @@ static int rkisp1_vb2_buf_prepare(struct vb2_buffer *vb)
 static void rkisp1_return_all_buffers(struct rkisp1_capture *cap,
 				      enum vb2_buffer_state state)
 {
-	unsigned long flags;
 	struct rkisp1_buffer *buf;
 
-	spin_lock_irqsave(&cap->buf.lock, flags);
+	spin_lock_irq(&cap->buf.lock);
 	if (cap->buf.curr) {
 		vb2_buffer_done(&cap->buf.curr->vb.vb2_buf, state);
 		cap->buf.curr = NULL;
@@ -787,7 +784,7 @@ static void rkisp1_return_all_buffers(struct rkisp1_capture *cap,
 		list_del(&buf->queue);
 		vb2_buffer_done(&buf->vb.vb2_buf, state);
 	}
-	spin_unlock_irqrestore(&cap->buf.lock, flags);
+	spin_unlock_irq(&cap->buf.lock);
 }
 
 /*
diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index f0258b4258ed..986d293201e6 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -1300,16 +1300,15 @@ static void rkisp1_params_config_parameter(struct rkisp1_params *params)
 	else
 		rkisp1_csm_config(params, false);
 
-	spin_lock(&params->config_lock);
+	spin_lock_irq(&params->config_lock);
 
 	/* apply the first buffer if there is one already */
 	if (params->is_streaming)
 		rkisp1_params_apply_params_cfg(params, 0);
 
-	spin_unlock(&params->config_lock);
+	spin_unlock_irq(&params->config_lock);
 }
 
-/* Not called when the camera active, thus not isr protection. */
 void rkisp1_params_configure(struct rkisp1_params *params,
 			     enum rkisp1_fmt_raw_pat_type bayer_pat,
 			     enum v4l2_quantization quantization)
@@ -1442,12 +1441,11 @@ static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
 		container_of(vbuf, struct rkisp1_buffer, vb);
 	struct vb2_queue *vq = vb->vb2_queue;
 	struct rkisp1_params *params = vq->drv_priv;
-	unsigned long flags;
 
 	params_buf->vaddr = vb2_plane_vaddr(vb, 0);
-	spin_lock_irqsave(&params->config_lock, flags);
+	spin_lock_irq(&params->config_lock);
 	list_add_tail(&params_buf->queue, &params->params);
-	spin_unlock_irqrestore(&params->config_lock, flags);
+	spin_unlock_irq(&params->config_lock);
 }
 
 static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
@@ -1465,7 +1463,6 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
 	struct rkisp1_params *params = vq->drv_priv;
 	struct rkisp1_buffer *buf;
 	struct list_head tmp_list;
-	unsigned long flags;
 
 	INIT_LIST_HEAD(&tmp_list);
 
@@ -1474,10 +1471,10 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
 	 * and then we can iterate it and call vb2_buffer_done
 	 * without holding the lock
 	 */
-	spin_lock_irqsave(&params->config_lock, flags);
+	spin_lock_irq(&params->config_lock);
 	params->is_streaming = false;
 	list_cut_position(&tmp_list, &params->params, params->params.prev);
-	spin_unlock_irqrestore(&params->config_lock, flags);
+	spin_unlock_irq(&params->config_lock);
 
 	list_for_each_entry(buf, &tmp_list, queue)
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
@@ -1487,11 +1484,10 @@ static int
 rkisp1_params_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 {
 	struct rkisp1_params *params = queue->drv_priv;
-	unsigned long flags;
 
-	spin_lock_irqsave(&params->config_lock, flags);
+	spin_lock_irq(&params->config_lock);
 	params->is_streaming = true;
-	spin_unlock_irqrestore(&params->config_lock, flags);
+	spin_unlock_irq(&params->config_lock);
 
 	return 0;
 }
-- 
2.17.1

