Return-Path: <linux-media+bounces-16571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 699A5959EC1
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 15:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B8491F227AB
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 13:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6561A286C;
	Wed, 21 Aug 2024 13:34:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635C219ABBC
	for <linux-media@vger.kernel.org>; Wed, 21 Aug 2024 13:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724247261; cv=none; b=CSUdF8xQ8dbOZiFfUMm9j8nFfzr5gGyCBON7Px6611PpgA2CsroqK7jXrExV4sI3RlbqnLSTre2T3Qc8HsvZNUxbT/ymupHma3u/4JDJeYrKoyQMJNQqjCDuQocXxUHrv6Ge3z3mt+dor8dnXtnkJDb0voL5pjqLyScUG+9WM8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724247261; c=relaxed/simple;
	bh=nKUPhaq4GxE8p5GtBaWmKCXk1bZjsEz+PkBuNYH76Hk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KUR0eUZykNmIsDIFgo/0Hrf5Ey35nHKQNJpvWLdfSVP4xQVXTLGyvbOFyz1p6mpDhr7GsCMaqsjtDxfhd6YD9IaXM6KxVv5QUsvOmheyDKqpkSAiPoAxAjlzj4un1/G8l+TwR4cz+5ODUX1TK6cFSGlR/XXe6vEq7y+4+8t/qBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396A9C4AF0C;
	Wed, 21 Aug 2024 13:34:20 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 2/3] vicodec: add support for manual completion
Date: Wed, 21 Aug 2024 15:14:02 +0200
Message-ID: <7537a3d505258d6264301c0c54977eb1871ff0b9.1724246043.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1724246043.git.hverkuil-cisco@xs4all.nl>
References: <cover.1724246043.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Manually complete the requests: this tests the manual completion
code.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vicodec/vicodec-core.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 3e011fe62ae1..ef7cf79b686a 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -446,8 +446,10 @@ static void device_run(void *priv)
 	ctx->comp_magic_cnt = 0;
 	ctx->comp_has_frame = false;
 	spin_unlock(ctx->lock);
-	if (ctx->is_stateless && src_req)
+	if (ctx->is_stateless && src_req) {
 		v4l2_ctrl_request_complete(src_req, &ctx->hdl);
+		media_request_manual_complete(src_req);
+	}
 
 	if (ctx->is_enc)
 		v4l2_m2m_job_finish(dev->stateful_enc.m2m_dev, ctx->fh.m2m_ctx);
@@ -1527,6 +1529,7 @@ static void vicodec_return_bufs(struct vb2_queue *q, u32 state)
 			return;
 		v4l2_ctrl_request_complete(vbuf->vb2_buf.req_obj.req,
 					   &ctx->hdl);
+		media_request_manual_complete(vbuf->vb2_buf.req_obj.req);
 		spin_lock(ctx->lock);
 		v4l2_m2m_buf_done(vbuf, state);
 		spin_unlock(ctx->lock);
@@ -1679,6 +1682,7 @@ static void vicodec_buf_request_complete(struct vb2_buffer *vb)
 	struct vicodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 
 	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->hdl);
+	media_request_manual_complete(vb->req_obj.req);
 }
 
 
@@ -2003,6 +2007,12 @@ static int vicodec_request_validate(struct media_request *req)
 	return vb2_request_validate(req);
 }
 
+static void vicodec_request_queue(struct media_request *req)
+{
+	media_request_mark_manual_completion(req);
+	v4l2_m2m_request_queue(req);
+}
+
 static const struct v4l2_file_operations vicodec_fops = {
 	.owner		= THIS_MODULE,
 	.open		= vicodec_open,
@@ -2023,7 +2033,7 @@ static const struct video_device vicodec_videodev = {
 
 static const struct media_device_ops vicodec_m2m_media_ops = {
 	.req_validate	= vicodec_request_validate,
-	.req_queue	= v4l2_m2m_request_queue,
+	.req_queue	= vicodec_request_queue,
 };
 
 static const struct v4l2_m2m_ops m2m_ops = {
-- 
2.43.0


