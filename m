Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C501F8B68
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbgFOAAQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728034AbgFOAAQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:16 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91259E41;
        Mon, 15 Jun 2020 02:00:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179211;
        bh=TkfglAym3S39GmfNoYclF/sqEj9adB08j0W6TdLB56Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D/9mM9SJYzMcqOJCWHBAcIY3kvQsQOxxXoaDrR79A1AC943XG+26ZV7MwzAKhANjm
         YOkKszkD011wg2w6YzsPd78tM+lFDbXXPN3ZSJlcjsWID+90kJyzMMJw7Kv80wB3nY
         lRzsK5jkt+EGRJreJmAaLLXreD3+OV2Z35CI3jzU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 003/107] media: ti-vpe: cal: Decouple CSI2 port and CPORT
Date:   Mon, 15 Jun 2020 02:58:00 +0300
Message-Id: <20200614235944.17716-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CPORT mentioned in the CAL documentation has nothing to do with the
CSI-2 ports. It's a remnant of CSI-3 support (or an attempt to achieve
it), and now only serves as an arbitraty tag value used to associate
data samples with contexts. Add a cport field to the cal_ctx structure
and use it instead of the CSI-2 port number where a CPORT is required by
the hardware. The value of the cport field is currently the same as the
csi2_port field, so there's no functional change, but this will help
reworking CPORT and CSI-2 port handling separately.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 88fed930ed50..201ef3585a48 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -409,6 +409,7 @@ struct cal_ctx {
 	struct vb2_queue	vb_vidq;
 	unsigned int		seq_count;
 	unsigned int		csi2_port;
+	unsigned int		cport;
 	unsigned int		virtual_channel;
 
 	/* Pointer pointing to current v4l2_buffer */
@@ -971,7 +972,7 @@ static void csi2_ctx_config(struct cal_ctx *ctx)
 	u32 val;
 
 	val = reg_read(ctx->dev, CAL_CSI2_CTX0(ctx->csi2_port));
-	set_field(&val, ctx->csi2_port, CAL_CSI2_CTX_CPORT_MASK);
+	set_field(&val, ctx->cport, CAL_CSI2_CTX_CPORT_MASK);
 	/*
 	 * DT type: MIPI CSI-2 Specs
 	 *   0x1: All - DT filter is disabled
@@ -1036,7 +1037,7 @@ static void pix_proc_config(struct cal_ctx *ctx)
 	set_field(&val, CAL_PIX_PROC_DPCMD_BYPASS, CAL_PIX_PROC_DPCMD_MASK);
 	set_field(&val, CAL_PIX_PROC_DPCME_BYPASS, CAL_PIX_PROC_DPCME_MASK);
 	set_field(&val, pack, CAL_PIX_PROC_PACK_MASK);
-	set_field(&val, ctx->csi2_port, CAL_PIX_PROC_CPORT_MASK);
+	set_field(&val, ctx->cport, CAL_PIX_PROC_CPORT_MASK);
 	set_field(&val, 1, CAL_PIX_PROC_EN_MASK);
 	reg_write(ctx->dev, CAL_PIX_PROC(ctx->csi2_port), val);
 	ctx_dbg(3, ctx, "CAL_PIX_PROC(%d) = 0x%08x\n", ctx->csi2_port,
@@ -1049,7 +1050,7 @@ static void cal_wr_dma_config(struct cal_ctx *ctx,
 	u32 val;
 
 	val = reg_read(ctx->dev, CAL_WR_DMA_CTRL(ctx->csi2_port));
-	set_field(&val, ctx->csi2_port, CAL_WR_DMA_CTRL_CPORT_MASK);
+	set_field(&val, ctx->cport, CAL_WR_DMA_CTRL_CPORT_MASK);
 	set_field(&val, height, CAL_WR_DMA_CTRL_YSIZE_MASK);
 	set_field(&val, CAL_WR_DMA_CTRL_DTAG_PIX_DAT,
 		  CAL_WR_DMA_CTRL_DTAG_MASK);
@@ -2221,6 +2222,7 @@ static struct cal_ctx *cal_create_instance(struct cal_dev *dev, int inst)
 
 	/* Store the instance id */
 	ctx->csi2_port = inst + 1;
+	ctx->cport = inst + 1;
 
 	ret = of_cal_create_instance(ctx, inst);
 	if (ret) {
-- 
Regards,

Laurent Pinchart

