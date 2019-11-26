Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 945AA109B53
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 10:37:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727569AbfKZJhl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 04:37:41 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34701 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727479AbfKZJhk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 04:37:40 -0500
Received: by mail-wm1-f66.google.com with SMTP id j18so1937831wmk.1
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2019 01:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u1by8ZZCXHXcRVYxgvIFeXukv45RqjhkxvSYIKvsQ8w=;
        b=B0td/X/dd4Uq9eBWJ/qZUFtOcOtOI2YxrjKSOqFXuB3xpBnqJvrcMV2Z/WyiGcWmEh
         +jKhwGTLzXWovUknnC5Fdts6pVJvpMYbw9YzlAuY4FxFtp3SnwlkzIh32JXt2ng1Vd33
         aQsS2BaP7iQ5inKh7yl1gmapH5sCqtK9N7lVmZ9T5nBxBbGTy+x+SNY+yrHkBA2LY/Ga
         m2X0KhuHvl2oljSoYk7lGyQXuuQ4Vk8e04YgLcrC3RYeEzGFGhpRkzFpTX1bbK+Ftxb4
         DkSPyjtrVYsYDXCnRZUvMAALjt3P+M8cMvcOY3zRa7i3ix8HO8gH0z02jCRBnDXHIxtg
         aSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u1by8ZZCXHXcRVYxgvIFeXukv45RqjhkxvSYIKvsQ8w=;
        b=emCyWud62nnc/6fO8z756dNcvUcBDK2mG3/NnzlxuzNH0giFuXOwisMwxuypWkit1S
         7HBy0z6/gDjx9ZkjnTsrXM8StManFtBaCiWmvdL/fMdlPMmXE1aFjOrTog8l1pyoUfsy
         jzugPci7AE2soBhlP3+YYh2eO5gXBhSeqdXRUwRh8PxPABucrBxfC/k7Fh9/L1m3hCNY
         wv9r946E0/Xw9VZVaNyZlzcpDq1xJ7lTlCjfqMFaRLR7Cs6fjRoSj0RcJ1imi1+we+Go
         zCXYiah5YNFCjFZ3F0vQsdopA8jTih1rbSP2lq8xG3bGjvOZAD9YtGEe/HDZVN2NxB2h
         MXYA==
X-Gm-Message-State: APjAAAWj/LiqHg9OqKGLRvTEg0MOGcW1bc5HKsyQCA0fLNq5narxD2Eg
        dMDVt4HZLngkbagVBIYF2f+dlA==
X-Google-Smtp-Source: APXvYqxJpJjm2AeWVaU+kwrToax6R9oEnDaQdlz3xjITpyakptZxOSsBXZ2fE6JsQfAfVMowyHFOHw==
X-Received: by 2002:a1c:9917:: with SMTP id b23mr3295201wme.42.1574761056546;
        Tue, 26 Nov 2019 01:37:36 -0800 (PST)
Received: from bender.baylibre.local (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id y67sm2464082wmy.31.2019.11.26.01.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 01:37:36 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Maxime Jourdan <mjourdan@baylibre.com>
Subject: [PATCH v2 1/3] media: v4l2-mem2mem: mark DONE any OUTPUT queued buffer after CMD_STOP
Date:   Tue, 26 Nov 2019 10:37:31 +0100
Message-Id: <20191126093733.32404-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191126093733.32404-1-narmstrong@baylibre.com>
References: <20191126093733.32404-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If a decoder needs a minimal buffer count to be queued on it's CAPTURE
queue, if a CMD_STOP is sent after a STREAMON but before all the required
buffers are queued, it should comply to the drain sequence and mark the
last queued buffer with V4L2_BUF_FLAG_LAST and mark it done to be dequeued.

This introduces a v4l2-mem2mem ioctl decoder command to track the command
sent to the decoder, and should be called by the affected drivers.

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Suggested-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 61 +++++++++++++++++++++++++-
 include/media/v4l2-mem2mem.h           | 14 ++++++
 2 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 1afd9c6ad908..b09616f9f102 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -556,6 +556,28 @@ int v4l2_m2m_querybuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_querybuf);
 
+static void v4l2_m2m_flag_last_buf_done(struct vb2_queue *q)
+{
+	struct vb2_buffer *vb;
+	struct vb2_v4l2_buffer *vbuf;
+	unsigned int i;
+
+	if (WARN_ON(q->is_output))
+		return;
+	if (list_empty(&q->queued_list))
+		return;
+
+	vb = list_first_entry(&q->queued_list, struct vb2_buffer, queued_entry);
+	for (i = 0; i < vb->num_planes; i++)
+		vb2_set_plane_payload(vb, i, 0);
+
+	vb->state = VB2_BUF_STATE_ACTIVE;
+	atomic_inc(&q->owned_by_drv_count);
+	vbuf = to_vb2_v4l2_buffer(vb);
+	vbuf->flags |= V4L2_BUF_FLAG_LAST;
+	vb2_buffer_done(vb, VB2_BUF_STATE_DONE);
+}
+
 int v4l2_m2m_qbuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 		  struct v4l2_buffer *buf)
 {
@@ -570,11 +592,22 @@ int v4l2_m2m_qbuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 			__func__);
 		return -EPERM;
 	}
+
 	ret = vb2_qbuf(vq, vdev->v4l2_dev->mdev, buf);
-	if (!ret && !(buf->flags & V4L2_BUF_FLAG_IN_REQUEST))
+	if (ret)
+		return ret;
+
+	/*
+	 * If the capture queue isn't streaming and we were asked to
+	 * stop, DONE the buffer instantly and flag as LAST
+	 */
+	if (!V4L2_TYPE_IS_OUTPUT(vq->type) && m2m_ctx->stopped &&
+	    vb2_is_streaming(vq) && !vb2_start_streaming_called(vq))
+		v4l2_m2m_flag_last_buf_done(vq);
+	else if ((buf->flags & V4L2_BUF_FLAG_IN_REQUEST))
 		v4l2_m2m_try_schedule(m2m_ctx);
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_qbuf);
 
@@ -1225,6 +1258,30 @@ int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_try_decoder_cmd);
 
+int v4l2_m2m_decoder_cmd(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
+			 struct v4l2_decoder_cmd *dc)
+{
+	if (dc->cmd != V4L2_DEC_CMD_STOP && dc->cmd != V4L2_DEC_CMD_START)
+		return -EINVAL;
+
+	if (dc->cmd == V4L2_DEC_CMD_STOP)
+		m2m_ctx->stopped = true;
+	else
+		m2m_ctx->stopped = false;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_decoder_cmd);
+
+int v4l2_m2m_ioctl_decoder_cmd(struct file *file, void *priv,
+			       struct v4l2_decoder_cmd *dc)
+{
+	struct v4l2_fh *fh = file->private_data;
+
+	return v4l2_m2m_decoder_cmd(file, fh->m2m_ctx, dc);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_decoder_cmd);
+
 int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *fh,
 					     struct v4l2_decoder_cmd *dc)
 {
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 1d85e24791e4..4c083cffdd86 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -98,6 +98,8 @@ struct v4l2_m2m_ctx {
 
 	bool				new_frame;
 
+	bool				stopped;
+
 	/* internal use only */
 	struct v4l2_m2m_dev		*m2m_dev;
 
@@ -312,6 +314,16 @@ int v4l2_m2m_streamon(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 int v4l2_m2m_streamoff(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 		       enum v4l2_buf_type type);
 
+/**
+ * v4l2_m2m_decoder_cmd() - execute a decoder command
+ *
+ * @file: pointer to struct &file
+ * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
+ * @dc: pointer to the decoder command
+ */
+int v4l2_m2m_decoder_cmd(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
+			 struct v4l2_decoder_cmd *dc);
+
 /**
  * v4l2_m2m_poll() - poll replacement, for destination buffers only
  *
@@ -704,6 +716,8 @@ int v4l2_m2m_ioctl_streamon(struct file *file, void *fh,
 				enum v4l2_buf_type type);
 int v4l2_m2m_ioctl_streamoff(struct file *file, void *fh,
 				enum v4l2_buf_type type);
+int v4l2_m2m_ioctl_decoder_cmd(struct file *file, void *fh,
+			       struct v4l2_decoder_cmd *dc);
 int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *fh,
 				   struct v4l2_encoder_cmd *ec);
 int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
-- 
2.22.0

