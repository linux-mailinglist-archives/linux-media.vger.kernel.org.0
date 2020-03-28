Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9541966CE
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2020 15:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgC1Oo1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Mar 2020 10:44:27 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43120 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbgC1Oo1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Mar 2020 10:44:27 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A67BB292552
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH] vim2m: Remove unneeded buffer lock
Date:   Sat, 28 Mar 2020 11:44:16 -0300
Message-Id: <20200328144416.15912-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This spinlock is used solely to call v4l2_m2m_buf_done().

Since buffers are obtained only after being removed
from the ready queue, there's no concurrent access, and
so no need for synchronization.

Remove the spinlock to make sure no one copies this pattern.

Some archaeology shows this is a small leftover from ancient code.
This driver (then called m2m_testdev) used the videobuf1 framework;
commit d80ee38cd845 ("[media] v4l: mem2mem: port m2m_testdev to vb2")
converted it to videobuf2. The spinlock was then no longer needed,
and this simply went unnoticed.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/platform/vim2m.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/platform/vim2m.c b/drivers/media/platform/vim2m.c
index ac6717fbb764..a776bb8e0e09 100644
--- a/drivers/media/platform/vim2m.c
+++ b/drivers/media/platform/vim2m.c
@@ -216,7 +216,6 @@ struct vim2m_ctx {
 
 	struct mutex		vb_mutex;
 	struct delayed_work	work_run;
-	spinlock_t		irqlock;
 
 	/* Abort requested by m2m */
 	int			aborting;
@@ -622,7 +621,6 @@ static void device_work(struct work_struct *w)
 	struct vim2m_ctx *curr_ctx;
 	struct vim2m_dev *vim2m_dev;
 	struct vb2_v4l2_buffer *src_vb, *dst_vb;
-	unsigned long flags;
 
 	curr_ctx = container_of(w, struct vim2m_ctx, work_run.work);
 
@@ -638,10 +636,8 @@ static void device_work(struct work_struct *w)
 
 	curr_ctx->num_processed++;
 
-	spin_lock_irqsave(&curr_ctx->irqlock, flags);
 	v4l2_m2m_buf_done(src_vb, VB2_BUF_STATE_DONE);
 	v4l2_m2m_buf_done(dst_vb, VB2_BUF_STATE_DONE);
-	spin_unlock_irqrestore(&curr_ctx->irqlock, flags);
 
 	if (curr_ctx->num_processed == curr_ctx->translen
 	    || curr_ctx->aborting) {
@@ -1084,7 +1080,6 @@ static void vim2m_stop_streaming(struct vb2_queue *q)
 {
 	struct vim2m_ctx *ctx = vb2_get_drv_priv(q);
 	struct vb2_v4l2_buffer *vbuf;
-	unsigned long flags;
 
 	cancel_delayed_work_sync(&ctx->work_run);
 
@@ -1097,9 +1092,7 @@ static void vim2m_stop_streaming(struct vb2_queue *q)
 			return;
 		v4l2_ctrl_request_complete(vbuf->vb2_buf.req_obj.req,
 					   &ctx->hdl);
-		spin_lock_irqsave(&ctx->irqlock, flags);
 		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
-		spin_unlock_irqrestore(&ctx->irqlock, flags);
 	}
 }
 
@@ -1226,7 +1219,6 @@ static int vim2m_open(struct file *file)
 	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(dev->m2m_dev, ctx, &queue_init);
 
 	mutex_init(&ctx->vb_mutex);
-	spin_lock_init(&ctx->irqlock);
 	INIT_DELAYED_WORK(&ctx->work_run, device_work);
 
 	if (IS_ERR(ctx->fh.m2m_ctx)) {
-- 
2.26.0.rc2

