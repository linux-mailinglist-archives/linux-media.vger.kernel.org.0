Return-Path: <linux-media+bounces-17127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F23F96426F
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 12:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B74EB26697
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 10:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4C618FC93;
	Thu, 29 Aug 2024 10:58:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097DE18FC70
	for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 10:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724929107; cv=none; b=N24AcWvJ0ItkDfyRHna16tiSd3g1Y++8XeuI4XVuBhHjGptmIbBDDsY87875DJjAB4MfbVtbVI+wmAbgCuasrA/ddBA2QkbfxyecZ0ik7+JBxdYF5L/VHmC/VHSn7EPhgaOSO+gjb+rgrs3v8uwFcjcQZUhqbo5DgbL+G1dS+mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724929107; c=relaxed/simple;
	bh=b7hAnTXb6v6EfVyR/DTJvxjBiLhOZDYrDvhSY9GnO6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e0oP6eMMSFqyQMYfNylz4mQeulTHvukyRgHK3CcRIAe6GzoVtXUc3i0CZ5Ta8y5kdXqVGiH+Nquv0NuhlFJZ2qWAJf5TTHqPz+r8humY37SYdBTeFQXZVOF+eDGUH/Zd9H+50HS/WcqqCBInxx7zCxyepdiKRKWUQIj7d7T0gx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B84DC4CEC1;
	Thu, 29 Aug 2024 10:58:24 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 2/3] media: vicodec: add support for manual completion
Date: Thu, 29 Aug 2024 12:55:38 +0200
Message-ID: <03fc9e1d4e920b6cc9b09e1b9abdbe5551ba1b5b.1724928939.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1724928939.git.hverkuil-cisco@xs4all.nl>
References: <cover.1724928939.git.hverkuil-cisco@xs4all.nl>
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
 .../media/test-drivers/vicodec/vicodec-core.c | 21 +++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 846e90c06291..2870fa3b529c 100644
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
@@ -1523,8 +1525,12 @@ static void vicodec_return_bufs(struct vb2_queue *q, u32 state)
 			vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 		if (vbuf == NULL)
 			return;
-		v4l2_ctrl_request_complete(vbuf->vb2_buf.req_obj.req,
-					   &ctx->hdl);
+		if (ctx->is_stateless && V4L2_TYPE_IS_OUTPUT(q->type)) {
+			struct media_request *req = vbuf->vb2_buf.req_obj.req;
+
+			v4l2_ctrl_request_complete(req, &ctx->hdl);
+			media_request_manual_complete(req);
+		}
 		spin_lock(ctx->lock);
 		v4l2_m2m_buf_done(vbuf, state);
 		spin_unlock(ctx->lock);
@@ -1677,6 +1683,7 @@ static void vicodec_buf_request_complete(struct vb2_buffer *vb)
 	struct vicodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 
 	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->hdl);
+	media_request_manual_complete(vb->req_obj.req);
 }
 
 
@@ -2001,6 +2008,12 @@ static int vicodec_request_validate(struct media_request *req)
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
@@ -2021,7 +2034,7 @@ static const struct video_device vicodec_videodev = {
 
 static const struct media_device_ops vicodec_m2m_media_ops = {
 	.req_validate	= vicodec_request_validate,
-	.req_queue	= v4l2_m2m_request_queue,
+	.req_queue	= vicodec_request_queue,
 };
 
 static const struct v4l2_m2m_ops m2m_ops = {
-- 
2.43.0


