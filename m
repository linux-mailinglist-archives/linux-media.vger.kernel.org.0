Return-Path: <linux-media+bounces-43982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F53BC62ED
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2C1CE4E8C8D
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B992C0271;
	Wed,  8 Oct 2025 17:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TtDYV66/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10C42BE033
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 17:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945865; cv=none; b=A2FeuCIusoKcvKO55QU9YTf5ly2IXuZoVT0Zzpc1krvm0p4/pa5gBO9dZb6owTZFEIkr7YBZRY6gHI2BHwJ5uyfAhhQBMxMKUBZTCVZhku+0vCmklPpctwgSNs4DS1jLW8bsvQfojJQzCQjPFosrSPr63LMlTtpTfz52mCvDDWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945865; c=relaxed/simple;
	bh=CoLwSWlIdcj+TkeAGbOkohY8NrAGSWbGUOQdKbp9inU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HDZYm7XQ6jAgwqcmApzpq/MmXGdR9CNS3/Cml3XIqyW8Oay+vJaj3k4j2Ony+Nq9RaK/ay2qjWPHxNFH2dP8cXs7+567pHknEZ6Tw67PDRYW44GkTSySh01VfUNfQanczCbSHKazKoclpV0uhVBt0YT9Gq18RPimssqJEdjH3NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TtDYV66/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EAB61191B;
	Wed,  8 Oct 2025 19:49:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945767;
	bh=CoLwSWlIdcj+TkeAGbOkohY8NrAGSWbGUOQdKbp9inU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TtDYV66/GJZzoX+OuqvHBwFWlB3evTYhkaD36w9M1o65ART+bFIQkHQoCefU057H3
	 GVvAsHnuHoT8siKoPEzHOiPof3eDUjwb5Lt5dzFQJqNT/9V0bhXlFpCKTkJpB+W1ZK
	 frfp/uai4YX3JzdU4nZec8dBrR5sVlzew6XxprRU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 01/25] media: v4l2-mem2mem: Document that v4l2_m2m_get_vq() never returns NULL
Date: Wed,  8 Oct 2025 20:50:28 +0300
Message-ID: <20251008175052.19925-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_m2m_get_vq() never returns a NULL pointer, as the internal
get_queue_ctx() helper always returns a non-NULL pointer. Many drivers
check the return value against NULL, due to a combination of old code
and cargo-cult programming. Even v4l2-mem2mem.c contains unneeded NULL
checks.

Clarify the API by documenting explicitly that a NULL check is not
needed, and simplify the code by removing the unneeded NULL checks from
v4l2-mem2mem.c.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 12 +-----------
 include/media/v4l2-mem2mem.h           |  3 +++
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index eb22d6172462..b5e241629dfb 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -123,13 +123,7 @@ static struct v4l2_m2m_queue_ctx *get_queue_ctx(struct v4l2_m2m_ctx *m2m_ctx,
 struct vb2_queue *v4l2_m2m_get_vq(struct v4l2_m2m_ctx *m2m_ctx,
 				       enum v4l2_buf_type type)
 {
-	struct v4l2_m2m_queue_ctx *q_ctx;
-
-	q_ctx = get_queue_ctx(m2m_ctx, type);
-	if (!q_ctx)
-		return NULL;
-
-	return &q_ctx->q;
+	return &get_queue_ctx(m2m_ctx, type)->q;
 }
 EXPORT_SYMBOL(v4l2_m2m_get_vq);
 
@@ -1289,8 +1283,6 @@ void v4l2_m2m_buf_queue(struct v4l2_m2m_ctx *m2m_ctx,
 	unsigned long flags;
 
 	q_ctx = get_queue_ctx(m2m_ctx, vbuf->vb2_buf.vb2_queue->type);
-	if (!q_ctx)
-		return;
 
 	spin_lock_irqsave(&q_ctx->rdy_spinlock, flags);
 	list_add_tail(&b->list, &q_ctx->rdy_queue);
@@ -1392,8 +1384,6 @@ int v4l2_m2m_ioctl_remove_bufs(struct file *file, void *priv,
 	struct v4l2_fh *fh = file->private_data;
 	struct vb2_queue *q = v4l2_m2m_get_vq(fh->m2m_ctx, remove->type);
 
-	if (!q)
-		return -EINVAL;
 	if (q->type != remove->type)
 		return -EINVAL;
 
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 2e55a13ed3bb..670e8ec60450 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -153,6 +153,9 @@ void *v4l2_m2m_get_curr_priv(struct v4l2_m2m_dev *m2m_dev);
  *
  * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
  * @type: type of the V4L2 buffer, as defined by enum &v4l2_buf_type
+ *
+ * This function returns the capture queue when @type is a capture type, and the
+ * output queue otherwise. It never returns a NULL pointer.
  */
 struct vb2_queue *v4l2_m2m_get_vq(struct v4l2_m2m_ctx *m2m_ctx,
 				       enum v4l2_buf_type type);
-- 
Regards,

Laurent Pinchart


