Return-Path: <linux-media+bounces-34075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0A8ACE593
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 22:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 116FA189B791
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 20:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E470233714;
	Wed,  4 Jun 2025 20:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ilFs5Qbp"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC21227E94;
	Wed,  4 Jun 2025 20:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749067811; cv=none; b=Kh9P/w9Y53RvFT37neb76mvkTmzDwcTQLjhtrhM34Z2xNQkOgfr1jQL79P0Up2JEOE3A3fP4Lif2UAMcVF56MwMvb2C8va791G1CFh7e+SrovxUZFZNlm/ABRvPaRFuz8fXOeu08gG0fneNdTJLm9WVby9Cr28SnR+nEQ1wxaTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749067811; c=relaxed/simple;
	bh=WoCQoCxfZMDeUFZcKpyAMMWvReEUdUT+5X/64RM4JlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a9y/YH2b5L9OBN/kyjyEt8vF+oMkvInEt2xzai5XlP+8h95zUsNpxjCXDZ+QnriGNb7zqA1oDc1Pa3J867iVmKmLZotaqnx7DcctADOklQbyEo5OEmn8ojnU36Ibv2Oh/YyFuRMJF2067ysXHIw6I1Txkzciw/zmOVVgI086oeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ilFs5Qbp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749067801;
	bh=WoCQoCxfZMDeUFZcKpyAMMWvReEUdUT+5X/64RM4JlQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ilFs5QbpnMIrutQuLSN44BI7zgUPkbs5Sx7c9Eor1RyEJOiBH358ItSXpcyW3inA3
	 ddr4l3rGqEMAUM0Kr0MwVwgrS9E5LkX3M6xPxYK3dwJnNsLxwGeBd+6OcTeekXQaX/
	 K387NTt86n7xBhp4fIlvvOoVug3TthVTagoPA4kZs4XUell23E7QCyqeL6MbAcTASS
	 drsMFErFG6NU5CwgtT+hs5JoMZw4JHWVOK99xyy62GaR93KAQegiXB8+tRrDWftJC+
	 YCUVQYAl2KWvRonSUCxBkJpPvUJjaITy9rzdFAK+/RJu5BkCoyPN90oeeEM1x9Au2t
	 4e31jBYpVeW5A==
Received: from [192.168.13.145] (unknown [IPv6:2606:6d00:10:5285::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 11CE217E1045;
	Wed,  4 Jun 2025 22:09:59 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Wed, 04 Jun 2025 16:09:36 -0400
Subject: [PATCH v3 2/5] media: vicodec: add support for manual completion
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-2-603db4749d90@collabora.com>
References: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
In-Reply-To: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com, 
 linux-media@vger.kernel.org, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2

From: Hans Verkuil <hverkuil@xs4all.nl>

Manually complete the requests: this tests the manual completion
code.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/test-drivers/vicodec/vicodec-core.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index c45f5cf12ded3c8b57483b148bf7bbffb8a458c5..88cb6e6a713f08bd4f412ca2940b1309bb87513b 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -448,8 +448,10 @@ static void device_run(void *priv)
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
@@ -1525,8 +1527,12 @@ static void vicodec_return_bufs(struct vb2_queue *q, u32 state)
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
@@ -1679,6 +1685,7 @@ static void vicodec_buf_request_complete(struct vb2_buffer *vb)
 	struct vicodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 
 	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->hdl);
+	media_request_manual_complete(vb->req_obj.req);
 }
 
 
@@ -2010,6 +2017,12 @@ static int vicodec_request_validate(struct media_request *req)
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
@@ -2030,7 +2043,7 @@ static const struct video_device vicodec_videodev = {
 
 static const struct media_device_ops vicodec_m2m_media_ops = {
 	.req_validate	= vicodec_request_validate,
-	.req_queue	= v4l2_m2m_request_queue,
+	.req_queue	= vicodec_request_queue,
 };
 
 static const struct v4l2_m2m_ops m2m_ops = {

-- 
2.49.0


