Return-Path: <linux-media+bounces-21117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4B09C1843
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:44:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7D371F22A45
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 08:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E951DF987;
	Fri,  8 Nov 2024 08:44:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38061DF271
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 08:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731055488; cv=none; b=feWCMA/emPAz6WzVpg8T7D8vWapgu+XJwYuWzLIbY8D+ya5IOgPza5McevdOR2Q6o1jfs1U5wrSB1h3aYSPyDLSsq/wJMgnRIoW6u5GPGXqNoodW7Ecb4XDVIUbS0BbE4AIphr/Fjmjn05KNWJHsAoa6SnnnGlDCXrP/6/XE4EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731055488; c=relaxed/simple;
	bh=A/0r9O/dbNwcMzzK6XELoQwO5ud72rHxwBj+Po0X72E=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Ao05KWncdcMVP61uXUAnKlQnG7DJtXaEUh/RNrwux+r/sdTrk44TJzBRIvkcu1fjN6hUPvbStZOsbVdRUZ6su1mdKcM7rs9/JomBg5VqaB8FF6WboBOD5R5/uIEFGc3Q2z4EW/Wcq1vbfyLn0bnFmmYolwy+8p2mBEsSuJx/yWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B55C4CECD;
	Fri,  8 Nov 2024 08:44:47 +0000 (UTC)
Message-ID: <4d8762ba-2b72-485f-936c-1c9bd8a200e2@xs4all.nl>
Date: Fri, 8 Nov 2024 09:44:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv4] media: vicodec: add V4L2_CID_MIN_BUFFERS_FOR_* controls
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Stateful codecs must support the V4L2_CID_MIN_BUFFERS_FOR_OUTPUT
and V4L2_CID_MIN_BUFFERS_FOR_CAPTURE controls. The vicodec driver
was missing support for these controls. Add them.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
Change since v3: use if-else construct as suggested by Sakari

Change since v2: set min_reqbufs_allocation to the same value
as used for V4L2_CID_MIN_BUFFERS_FOR_OUTPUT/CAPTURE.

Change since v1: V4L2_CID_MIN_BUFFERS_FOR_OUTPUT was already
supported, so that patch led to duplicated controls. That's now
fixed.
---
 .../media/test-drivers/vicodec/vicodec-core.c | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 00c84a06f343..88800969ae27 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -43,6 +43,8 @@ MODULE_PARM_DESC(debug, " activates debug info");
 #define MIN_WIDTH		640U
 #define MAX_HEIGHT		2160U
 #define MIN_HEIGHT		360U
+/* Recommended number of buffers for the stateful codecs */
+#define VICODEC_REC_BUFS	2

 #define dprintk(dev, fmt, arg...) \
 	v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: " fmt, __func__, ## arg)
@@ -1705,12 +1707,14 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->ops = &vicodec_qops;
 	src_vq->mem_ops = &vb2_vmalloc_memops;
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
-	if (ctx->is_enc)
+	if (ctx->is_enc) {
 		src_vq->lock = &ctx->dev->stateful_enc.mutex;
-	else if (ctx->is_stateless)
+		src_vq->min_reqbufs_allocation = VICODEC_REC_BUFS;
+	} else if (ctx->is_stateless) {
 		src_vq->lock = &ctx->dev->stateless_dec.mutex;
-	else
+	} else {
 		src_vq->lock = &ctx->dev->stateful_dec.mutex;
+	}
 	src_vq->supports_requests = ctx->is_stateless;
 	src_vq->requires_requests = ctx->is_stateless;
 	ret = vb2_queue_init(src_vq);
@@ -1728,6 +1732,8 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->mem_ops = &vb2_vmalloc_memops;
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock = src_vq->lock;
+	if (!ctx->is_stateless && !ctx->is_enc)
+		dst_vq->min_reqbufs_allocation = VICODEC_REC_BUFS;

 	return vb2_queue_init(dst_vq);
 }
@@ -1852,11 +1858,16 @@ static int vicodec_open(struct file *file)
 			  1, 31, 1, 20);
 	v4l2_ctrl_new_std(hdl, &vicodec_ctrl_ops, V4L2_CID_FWHT_P_FRAME_QP,
 			  1, 31, 1, 20);
-	if (ctx->is_enc)
-		v4l2_ctrl_new_std(hdl, &vicodec_ctrl_ops,
-				  V4L2_CID_MIN_BUFFERS_FOR_OUTPUT, 1, 1, 1, 1);
+
 	if (ctx->is_stateless)
 		v4l2_ctrl_new_custom(hdl, &vicodec_ctrl_stateless_state, NULL);
+	else
+		v4l2_ctrl_new_std(hdl, &vicodec_ctrl_ops, ctx->is_enc ?
+				  V4L2_CID_MIN_BUFFERS_FOR_OUTPUT :
+				  V4L2_CID_MIN_BUFFERS_FOR_CAPTURE,
+				  VICODEC_REC_BUFS, VICODEC_REC_BUFS, 1,
+				  VICODEC_REC_BUFS);
+
 	if (hdl->error) {
 		rc = hdl->error;
 		v4l2_ctrl_handler_free(hdl);
-- 
2.45.2


