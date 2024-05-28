Return-Path: <linux-media+bounces-12097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 551608D1DDD
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 16:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68D742842BF
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 14:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00BF816F8FC;
	Tue, 28 May 2024 14:05:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCA516D9CB
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 14:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716905131; cv=none; b=c3r4DPZEF0J9mEIq0GJ1OiePYeaUxBQXdyTwqDWP7IYPM1m4Ssos5MPTcRoRop9/UE5J3oJs8QYW/SyYAcNrT0sKFwCZinUVv7qcgR2JSH4KGKJUfPGQrbJ++I3ZHEGgVoeqZR/6u1UjCnaPt62Fxx9K5SuCPQFPApS+/5nfeaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716905131; c=relaxed/simple;
	bh=KMkdEdU8o72Ct2GB2KF6MerU5LyvWsC5U49cBSHet2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uzn+atcspa/HNa1An5PDlcuT0U8Rw0wKq5N2yg1fUvx5/6QjCURhZX5MpVfpyyMVXAjafZ3SNsMREymwM2n0CrOwVa/HNLtSey8dXWEx57YEFKdtmYuisbLdsYN2oh1zLzdO64T0bgukPQv5qbKECz7xrFLJc8HibwGwTwlYc0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1sBxS0-0005wE-Pd; Tue, 28 May 2024 16:05:16 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Tue, 28 May 2024 16:05:14 +0200
Subject: [PATCH 2/2] media: rockchip: rga: fix sequence number handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-rk3568-rga-v1-2-b946e55d9d37@pengutronix.de>
References: <20240528-rk3568-rga-v1-0-b946e55d9d37@pengutronix.de>
In-Reply-To: <20240528-rk3568-rga-v1-0-b946e55d9d37@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Michael Tretter <m.tretter@pengutronix.de>, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 kernel@pengutronix.de
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

The RGA driver didn't set the sequence numbers of the returned buffers.

Keep track of the CAPTURE and OUTPUT sequence numbers, and set the
sequence numbers in the source and destination buffers.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 5 +++++
 drivers/media/platform/rockchip/rga/rga.c     | 4 ++++
 drivers/media/platform/rockchip/rga/rga.h     | 3 +++
 3 files changed, 12 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 77c7535893e3..48bb45ec0230 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -205,6 +205,11 @@ static int rga_buf_start_streaming(struct vb2_queue *q, unsigned int count)
 		return ret;
 	}
 
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
+		ctx->osequence = 0;
+	else
+		ctx->csequence = 0;
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 00fdfa9e10bc..0e768f3e9eda 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -43,6 +43,8 @@ static void device_run(void *prv)
 	rga->curr = ctx;
 
 	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	src->sequence = ctx->osequence++;
+
 	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 
 	rga_hw_start(rga, vb_to_rga(src), vb_to_rga(dst));
@@ -75,6 +77,8 @@ static irqreturn_t rga_isr(int irq, void *prv)
 
 		v4l2_m2m_buf_copy_metadata(src, dst, true);
 
+		dst->sequence = ctx->csequence++;
+
 		v4l2_m2m_buf_done(src, VB2_BUF_STATE_DONE);
 		v4l2_m2m_buf_done(dst, VB2_BUF_STATE_DONE);
 		v4l2_m2m_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx);
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 3502dff6055c..8105bb2efe57 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -57,6 +57,9 @@ struct rga_ctx {
 	struct rga_frame out;
 	struct v4l2_ctrl_handler ctrl_handler;
 
+	int osequence;
+	int csequence;
+
 	/* Control values */
 	u32 op;
 	u32 hflip;

-- 
2.39.2


