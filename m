Return-Path: <linux-media+bounces-34087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6E9ACEA9E
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 09:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82BB33A554F
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 07:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CACB1F181F;
	Thu,  5 Jun 2025 07:05:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6002C3242
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 07:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107145; cv=none; b=BuOIwDCDhU7s107ErFaKLLdwPIye+eGRpe3XfpbpsYXOGUIiSPvr3+ANtGANVA426VhIx3Eh9SPU61bJtrs34g8k5bI/1P2WlY0JbB9NSMEWHPbQY2z9sihD61mTJQXSNO0VOXynB0y/Z2Rn8qVL2sQIcFbqHwXt6jeGwBxaPfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107145; c=relaxed/simple;
	bh=mJYwX1Y4VKxoYyFzGefJNyzjnKEMQhhsla+UDc8NJT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W0cg7U0mx1SrXbH1DXOFwmvENXjR4ZxcvglpHDCCw0CXYPvYf8Tfs1ED/21NnIdB5TpROU9aoTT3YfjYViAkoHBACnVPyLTDDIOE+hKOmXucI2pSFYxxpAfr1bWmyMGFYMhpp6E48nZGYNwu6tuwpNNM0huw12CPff32s697tKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D033C4CEF3;
	Thu,  5 Jun 2025 07:05:44 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 1/5] media: dvb-core: dmxdevfilter must always flush bufs
Date: Thu,  5 Jun 2025 08:57:35 +0200
Message-ID: <55408ef4a28b85370bfd88c29f9267979f15d9f8.1749106659.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1749106659.git.hverkuil@xs4all.nl>
References: <cover.1749106659.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the buffers are being filled until full, which works fine
for the transport stream, but not when reading sections, those have
to be returned to userspace immediately, otherwise dvbv5-scan will
just wait forever.

Add a 'flush' argument to dvb_vb2_fill_buffer to indicate whether
the buffer must be flushed or wait until it is full.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/dvb-core/dmxdev.c  | 8 ++++----
 drivers/media/dvb-core/dvb_vb2.c | 5 +++--
 include/media/dvb_vb2.h          | 6 ++++--
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 1e985f943944..e4cf5e6bb542 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -396,11 +396,11 @@ static int dvb_dmxdev_section_callback(const u8 *buffer1, size_t buffer1_len,
 	if (dvb_vb2_is_streaming(&dmxdevfilter->vb2_ctx)) {
 		ret = dvb_vb2_fill_buffer(&dmxdevfilter->vb2_ctx,
 					  buffer1, buffer1_len,
-					  buffer_flags);
+					  buffer_flags, true);
 		if (ret == buffer1_len)
 			ret = dvb_vb2_fill_buffer(&dmxdevfilter->vb2_ctx,
 						  buffer2, buffer2_len,
-						  buffer_flags);
+						  buffer_flags, true);
 	} else {
 		ret = dvb_dmxdev_buffer_write(&dmxdevfilter->buffer,
 					      buffer1, buffer1_len);
@@ -451,10 +451,10 @@ static int dvb_dmxdev_ts_callback(const u8 *buffer1, size_t buffer1_len,
 
 	if (dvb_vb2_is_streaming(ctx)) {
 		ret = dvb_vb2_fill_buffer(ctx, buffer1, buffer1_len,
-					  buffer_flags);
+					  buffer_flags, false);
 		if (ret == buffer1_len)
 			ret = dvb_vb2_fill_buffer(ctx, buffer2, buffer2_len,
-						  buffer_flags);
+						  buffer_flags, false);
 	} else {
 		if (buffer->error) {
 			spin_unlock(&dmxdevfilter->dev->lock);
diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
index 29edaaff7a5c..7444bbc2f24d 100644
--- a/drivers/media/dvb-core/dvb_vb2.c
+++ b/drivers/media/dvb-core/dvb_vb2.c
@@ -249,7 +249,8 @@ int dvb_vb2_is_streaming(struct dvb_vb2_ctx *ctx)
 
 int dvb_vb2_fill_buffer(struct dvb_vb2_ctx *ctx,
 			const unsigned char *src, int len,
-			enum dmx_buffer_flags *buffer_flags)
+			enum dmx_buffer_flags *buffer_flags,
+			bool flush)
 {
 	unsigned long flags = 0;
 	void *vbuf = NULL;
@@ -306,7 +307,7 @@ int dvb_vb2_fill_buffer(struct dvb_vb2_ctx *ctx,
 		}
 	}
 
-	if (ctx->nonblocking && ctx->buf) {
+	if (flush && ctx->buf) {
 		vb2_set_plane_payload(&ctx->buf->vb, 0, ll);
 		vb2_buffer_done(&ctx->buf->vb, VB2_BUF_STATE_DONE);
 		list_del(&ctx->buf->list);
diff --git a/include/media/dvb_vb2.h b/include/media/dvb_vb2.h
index 8cb88452cd6c..0fbbfc65157e 100644
--- a/include/media/dvb_vb2.h
+++ b/include/media/dvb_vb2.h
@@ -124,7 +124,7 @@ static inline int dvb_vb2_release(struct dvb_vb2_ctx *ctx)
 	return 0;
 };
 #define dvb_vb2_is_streaming(ctx) (0)
-#define dvb_vb2_fill_buffer(ctx, file, wait, flags) (0)
+#define dvb_vb2_fill_buffer(ctx, file, wait, flags, flush) (0)
 
 static inline __poll_t dvb_vb2_poll(struct dvb_vb2_ctx *ctx,
 				    struct file *file,
@@ -166,10 +166,12 @@ int dvb_vb2_is_streaming(struct dvb_vb2_ctx *ctx);
  * @buffer_flags:
  *		pointer to buffer flags as defined by &enum dmx_buffer_flags.
  *		can be NULL.
+ * @flush:	flush the buffer, even if it isn't full.
  */
 int dvb_vb2_fill_buffer(struct dvb_vb2_ctx *ctx,
 			const unsigned char *src, int len,
-			enum dmx_buffer_flags *buffer_flags);
+			enum dmx_buffer_flags *buffer_flags,
+			bool flush);
 
 /**
  * dvb_vb2_poll - Wrapper to vb2_core_streamon() for Digital TV
-- 
2.47.2


