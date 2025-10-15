Return-Path: <linux-media+bounces-44520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDD7BDD387
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3CEB2352EEC
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B5B314A8A;
	Wed, 15 Oct 2025 07:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PbceIz7k"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5F82FB96C
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 07:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514848; cv=none; b=Nx4iNpmj+J3eRmO5pSSj+VrasApZSG1mWQkgttf0X/LQrnPh3uzSlmCRYYaubUw9HXb2ByBxO/JvToaJTPfzDa3UMMYu1/5nu3BNAWqJJd9ooEB0Qdpx1Nb7w+m+SZRpoChy+2VnTkqrWy6BozgmPmyeFoPRxy+mHeL4P+QHiUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514848; c=relaxed/simple;
	bh=adv2d8j1P/13SwqApWE47e+BYEQ/LhazFFvathXS5o0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K1535CTOCKVmVNvQvZp0j/lG7JRVgMn74gpfkNCZQui1P2qybz/3ySb0STyt7W5KAtMFKk2Xg6Z0Yrl1i7inxueti0vxojaqrqNvOczXcNR/nG2vCOLmGdBUAP7P/28Xipd/TmBYNWiH672xya8fSOqE/XG3044RXxKnP+AWhr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PbceIz7k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 909B4EB7;
	Wed, 15 Oct 2025 09:52:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514744;
	bh=adv2d8j1P/13SwqApWE47e+BYEQ/LhazFFvathXS5o0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PbceIz7kGRTxRE+jG+VCFvCXyPbkK1tUMvE5SNcqr2XFeE+ooeuCVSNtQvizM35qr
	 oXwRofxe9N6eo7SWhH7xz6jryEZt23NWJyJnj+Oru8BI4z4mMvOSau1RESjLuiWqWE
	 6ogxNeTL5eK6i793MgwT6a3BlvMAJ4IK9HdoYbkY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Stefan Klug <stefan.klug@ideasonboard.com>
Subject: [PATCH v2 01/25] media: v4l2-mem2mem: Document that v4l2_m2m_get_vq() never returns NULL
Date: Wed, 15 Oct 2025 10:53:24 +0300
Message-ID: <20251015075353.22625-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
References: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Stefan Klug <stefan.klug@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 12 +-----------
 include/media/v4l2-mem2mem.h           |  3 +++
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 21acd9bc8607..9fa8833e445f 100644
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
 
@@ -1285,8 +1279,6 @@ void v4l2_m2m_buf_queue(struct v4l2_m2m_ctx *m2m_ctx,
 	unsigned long flags;
 
 	q_ctx = get_queue_ctx(m2m_ctx, vbuf->vb2_buf.vb2_queue->type);
-	if (!q_ctx)
-		return;
 
 	spin_lock_irqsave(&q_ctx->rdy_spinlock, flags);
 	list_add_tail(&b->list, &q_ctx->rdy_queue);
@@ -1388,8 +1380,6 @@ int v4l2_m2m_ioctl_remove_bufs(struct file *file, void *priv,
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
 	struct vb2_queue *q = v4l2_m2m_get_vq(fh->m2m_ctx, remove->type);
 
-	if (!q)
-		return -EINVAL;
 	if (q->type != remove->type)
 		return -EINVAL;
 
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 500f81f399df..c82445929c68 100644
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


