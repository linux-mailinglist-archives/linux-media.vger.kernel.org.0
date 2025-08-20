Return-Path: <linux-media+bounces-40459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0221B2E265
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 18:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B8423BD0D9
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF3F3314C7;
	Wed, 20 Aug 2025 16:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VFHsKdWN";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="OvTKxUqt"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A918732BF2D
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 16:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755707401; cv=none; b=EF6jbJGCiqphmKzonbzv619O0miZzbODX7tc932QvT7JEMg9qQ077AlkPS/cZVRn981hrUNwT+YbFUSQwEkRmOftIpTIafQmWKIq7siFO04Wg0YkHLOPyr3ZhEejYyMk0K+mVDAiIl2hA4WLfIo9QmOgxCuguOApbexDGRwpqSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755707401; c=relaxed/simple;
	bh=rGpspVxhSNOfNYJcQmYWjT78tub2GfjShRMsUYKMZGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hcJPEVrNaUuZnHy+C5rW5B2x1KuHa970/jbcZPnufX1Q+3JL7to8OQyTBXEuk0Q4P/UFraNiYSXRdSF8agqFfB93llvADDR6zpxvM0IlWXdZRZRockInj4fr/NOyibxBYtquxzSqf50/DOZJlyGbQvkPVxUqzZJjMifm72vVXy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VFHsKdWN; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OvTKxUqt; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4c6X3g5FF9z9vMs;
	Wed, 20 Aug 2025 18:29:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755707391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DIcJXdY0bFOT+K5fxLDoNnlzrIjJ8KNGGAkp25jXns0=;
	b=VFHsKdWNItDfUTvE68vx6ei2gdB20WBIeJlmbaKup6cmFzcRD8QWEgrK+SGoaiXJHmG2Kd
	iPdTMXgh0iDZBEqRzh+lzFUQsLlFbdaI4YYdbyUSGapWXPr7Mwt/Br2ZOGPHDY2batxBJj
	xzU2Qd6kUsnwFanbkjS4vqeklbUbI7dyJwkb9ANNx0xa1Vz03usMt41iTWKbOEP08L5M82
	yF6vAmsFJL4n9rTTFw6mOZgTMS16h3vTnTVzI/onWO3/fnrzMb3OG/E2EW7VzWlK1eoGZi
	qVHnMkZA+Tmya7YqOi+93RiwTcBevd6Dp6/H1Pe8eE7yci6S0OnCVcwA6/YKfw==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755707389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DIcJXdY0bFOT+K5fxLDoNnlzrIjJ8KNGGAkp25jXns0=;
	b=OvTKxUqt4oP+waZA2q9EhhmDKB6kUFOnsF8WZvqfopnmsjvcnLndZmFlH8c5+90wr08PtV
	nC386+xfxenQrMjLPB1NZqCdXxy8n6EGS5cw7N4nyHU19qx10TVTB0mTn8CPLG+oZRRYTZ
	Rdw+EafXbCx5009LvywQkxKWEVM1qimYteBmHSTrko0HOo+FTVMXJMD287PB1aTg2BlnQc
	szwsG+XWyy9fblqBNHa5a3zIA/p11ZUc7oPLDJdYfpfVTEZMDNUQqTKVCRtRynkKO3da5r
	akyy3NgNYSRiu2SY8zfd6xKx3GGd2HdaeCh+PH74cCkdA/cWgSNIB8C3sJ2MkQ==
To: linux-media@vger.kernel.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: imx-jpeg: Fix JPEG encoder ready race condition
Date: Wed, 20 Aug 2025 18:29:25 +0200
Message-ID: <20250820162938.209892-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 1ff6a9bf43c2ac3d2b1
X-MBO-RS-META: di1e7ameqb8sumcpdd3daidariamhnpu

The current mxc_jpeg_job_ready() implementation works for JPEG decode
side of this IP, it does not work at all for the JPEG encode side. The
JPEG encode side does not change ctx->source_change at all, therefore
the mxc_jpeg_source_change() always returns right away and the encode
side somehow works.

However, this is susceptible to a race condition between mxc_jpeg_dec_irq()
and mxc_jpeg_start_streaming(), where mxc_jpeg_start_streaming() might
start decoding another frame before mxc_jpeg_dec_irq() indicates completion
of encoding of current frame. Add new state, MXC_JPEG_ENC_DONE, which is
set in three locations, first when streaming starts to indicate the encoder
is ready to start processing a frame, second in mxc_jpeg_dec_irq() when the
encoder finishes encoding current frame, and third in mxc_jpeg_dec_irq() in
case of an error so the encoder can proceed with encoding another frame.

Update mxc_jpeg_job_ready() to check whether the encoder is in this new
MXC_JPEG_ENC_DONE state before reporting the encoder is ready to encode
new frame.

Fixes: b4e1fb8643da ("media: imx-jpeg: Support dynamic resolution change")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ming Qian <ming.qian@oss.nxp.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-media@vger.kernel.org
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 18 ++++++++++++++++--
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h |  1 +
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index df3ccdf767baf..aef1d6473eb8d 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -1009,6 +1009,7 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 
 		dev_err(dev, "Encoder/decoder error, dec_ret = 0x%08x, status=0x%08x",
 			dec_ret, ret);
+		ctx->enc_state = MXC_JPEG_ENC_DONE;
 		mxc_jpeg_clr_desc(reg, slot);
 		mxc_jpeg_sw_reset(reg);
 		buf_state = VB2_BUF_STATE_ERROR;
@@ -1062,9 +1063,16 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 
 buffers_done:
 	mxc_jpeg_job_finish(ctx, buf_state, false);
-	spin_unlock(&jpeg->hw_lock);
 	cancel_delayed_work(&ctx->task_timer);
+
+	if (jpeg->mode == MXC_JPEG_ENCODE && ctx->enc_state == MXC_JPEG_ENCODING)
+		ctx->enc_state = MXC_JPEG_ENC_DONE;
+
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
+
+	spin_unlock(&jpeg->hw_lock);
+
+
 	return IRQ_HANDLED;
 job_unlock:
 	spin_unlock(&jpeg->hw_lock);
@@ -1488,8 +1496,12 @@ static bool mxc_jpeg_source_change(struct mxc_jpeg_ctx *ctx,
 static int mxc_jpeg_job_ready(void *priv)
 {
 	struct mxc_jpeg_ctx *ctx = priv;
+	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
 
-	return ctx->source_change ? 0 : 1;
+	if (jpeg->mode == MXC_JPEG_ENCODE)
+		return ctx->enc_state == MXC_JPEG_ENC_DONE;
+	else
+		return ctx->source_change ? 0 : 1;
 }
 
 static void mxc_jpeg_device_run_timeout(struct work_struct *work)
@@ -1713,6 +1725,8 @@ static int mxc_jpeg_start_streaming(struct vb2_queue *q, unsigned int count)
 
 	if (ctx->mxc_jpeg->mode == MXC_JPEG_DECODE && V4L2_TYPE_IS_CAPTURE(q->type))
 		ctx->source_change = 0;
+	if (ctx->mxc_jpeg->mode == MXC_JPEG_ENCODE)
+		ctx->enc_state = MXC_JPEG_ENC_DONE;
 	dev_dbg(ctx->mxc_jpeg->dev, "Start streaming ctx=%p", ctx);
 	q_data->sequence = 0;
 
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
index 44e46face6d1d..7f0910fc9b47e 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
@@ -35,6 +35,7 @@
 enum mxc_jpeg_enc_state {
 	MXC_JPEG_ENCODING	= 0, /* jpeg encode phase */
 	MXC_JPEG_ENC_CONF	= 1, /* jpeg encoder config phase */
+	MXC_JPEG_ENC_DONE	= 2, /* jpeg encoder done/ready phase */
 };
 
 enum mxc_jpeg_mode {
-- 
2.50.1


