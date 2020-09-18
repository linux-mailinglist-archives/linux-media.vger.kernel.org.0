Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8A0026EE75
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 04:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgIRC2m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 22:28:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:44122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729217AbgIRCPW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 22:15:22 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 54E0123A01;
        Fri, 18 Sep 2020 02:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600395320;
        bh=coEGVUznuFfa6GSztzmYsJ5ao0RL88SvQOSVc9PE6jw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sP5OeykcZMgzmAkGfRW+r8KdcB0Jf3eXfpof2axxETUmc2oi4gPtPLJJWHCxEaVx9
         9Ts3Gz/hrjMIj2misBxlUVuvKdcs1MpsD7O2fFhgVe/sZk7tWlxDbBa3AqbT27RAD/
         64KlS+fAiw2L35rdUCim1bMP55Ed6eyBIS4ZLBB0=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Nikhil Devshatwar <nikhil.nd@ti.com>,
        Benoit Parrot <bparrot@ti.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 21/90] media: ti-vpe: cal: Restrict DMA to avoid memory corruption
Date:   Thu, 17 Sep 2020 22:13:46 -0400
Message-Id: <20200918021455.2067301-21-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918021455.2067301-1-sashal@kernel.org>
References: <20200918021455.2067301-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Nikhil Devshatwar <nikhil.nd@ti.com>

[ Upstream commit 6e72eab2e7b7a157d554b8f9faed7676047be7c1 ]

When setting DMA for video capture from CSI channel, if the DMA size
is not given, it ends up writing as much data as sent by the camera.

This may lead to overwriting the buffers causing memory corruption.
Observed green lines on the default framebuffer.

Restrict the DMA to maximum height as specified in the S_FMT ioctl.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/ti-vpe/cal.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 563b9636ab63b..803e0794ca131 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -690,12 +690,13 @@ static void pix_proc_config(struct cal_ctx *ctx)
 }
 
 static void cal_wr_dma_config(struct cal_ctx *ctx,
-			      unsigned int width)
+			      unsigned int width, unsigned int height)
 {
 	u32 val;
 
 	val = reg_read(ctx->dev, CAL_WR_DMA_CTRL(ctx->csi2_port));
 	set_field(&val, ctx->csi2_port, CAL_WR_DMA_CTRL_CPORT_MASK);
+	set_field(&val, height, CAL_WR_DMA_CTRL_YSIZE_MASK);
 	set_field(&val, CAL_WR_DMA_CTRL_DTAG_PIX_DAT,
 		  CAL_WR_DMA_CTRL_DTAG_MASK);
 	set_field(&val, CAL_WR_DMA_CTRL_MODE_CONST,
@@ -1321,7 +1322,8 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	csi2_lane_config(ctx);
 	csi2_ctx_config(ctx);
 	pix_proc_config(ctx);
-	cal_wr_dma_config(ctx, ctx->v_fmt.fmt.pix.bytesperline);
+	cal_wr_dma_config(ctx, ctx->v_fmt.fmt.pix.bytesperline,
+			  ctx->v_fmt.fmt.pix.height);
 	cal_wr_dma_addr(ctx, addr);
 	csi2_ppi_enable(ctx);
 
-- 
2.25.1

