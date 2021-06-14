Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EBB53A64E6
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234811AbhFNLa3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:30:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58158 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235329AbhFNL2L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:28:11 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 832782A66;
        Mon, 14 Jun 2021 13:24:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669843;
        bh=aQzFzOExEj6xbAVOHIGV4KEaUJNtH7bHxGD59IElboE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qbKPnefrAUfoAL3w05eYJn60GMWfMrNaYK/KnrQQWmsFRe8xC85XJCtzeHKRzAvge
         m8yggxP10eFrZskvIgtnmsvl54naP64XHo3PCOfS7JiTOZlM+64oxSvHt7HMkjBmdA
         vFOwZwYB1Zi+hnaBfEAMpn49stZUvOVoszPfQydw=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 05/35] media: ti-vpe: cal: move global config from cal_ctx_wr_dma_config to runtime resume
Date:   Mon, 14 Jun 2021 14:23:15 +0300
Message-Id: <20210614112345.2032435-6-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For some reason CAL_CTRL is written at the end of cal_ctx_wr_dma_config.
CAL_CTRL is a global (for CAL) register, so it should be independent of
contexts.

Move the code to cal_runtime_resume().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 9446933b9189..2f70725a567b 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -403,17 +403,6 @@ static void cal_ctx_wr_dma_config(struct cal_ctx *ctx)
 	cal_write(ctx->cal, CAL_WR_DMA_XSIZE(ctx->index), val);
 	ctx_dbg(3, ctx, "CAL_WR_DMA_XSIZE(%d) = 0x%08x\n", ctx->index,
 		cal_read(ctx->cal, CAL_WR_DMA_XSIZE(ctx->index)));
-
-	val = cal_read(ctx->cal, CAL_CTRL);
-	cal_set_field(&val, CAL_CTRL_BURSTSIZE_BURST128,
-		      CAL_CTRL_BURSTSIZE_MASK);
-	cal_set_field(&val, 0xF, CAL_CTRL_TAGCNT_MASK);
-	cal_set_field(&val, CAL_CTRL_POSTED_WRITES_NONPOSTED,
-		      CAL_CTRL_POSTED_WRITES_MASK);
-	cal_set_field(&val, 0xFF, CAL_CTRL_MFLAGL_MASK);
-	cal_set_field(&val, 0xFF, CAL_CTRL_MFLAGH_MASK);
-	cal_write(ctx->cal, CAL_CTRL, val);
-	ctx_dbg(3, ctx, "CAL_CTRL = 0x%08x\n", cal_read(ctx->cal, CAL_CTRL));
 }
 
 void cal_ctx_set_dma_addr(struct cal_ctx *ctx, dma_addr_t addr)
@@ -1127,6 +1116,7 @@ static int cal_runtime_resume(struct device *dev)
 {
 	struct cal_dev *cal = dev_get_drvdata(dev);
 	unsigned int i;
+	u32 val;
 
 	if (cal->data->flags & DRA72_CAL_PRE_ES2_LDO_DISABLE) {
 		/*
@@ -1143,6 +1133,17 @@ static int cal_runtime_resume(struct device *dev)
 	 */
 	cal_write(cal, CAL_HL_IRQENABLE_SET(0), CAL_HL_IRQ_OCPO_ERR_MASK);
 
+	val = cal_read(cal, CAL_CTRL);
+	cal_set_field(&val, CAL_CTRL_BURSTSIZE_BURST128,
+		      CAL_CTRL_BURSTSIZE_MASK);
+	cal_set_field(&val, 0xf, CAL_CTRL_TAGCNT_MASK);
+	cal_set_field(&val, CAL_CTRL_POSTED_WRITES_NONPOSTED,
+		      CAL_CTRL_POSTED_WRITES_MASK);
+	cal_set_field(&val, 0xff, CAL_CTRL_MFLAGL_MASK);
+	cal_set_field(&val, 0xff, CAL_CTRL_MFLAGH_MASK);
+	cal_write(cal, CAL_CTRL, val);
+	cal_dbg(3, cal, "CAL_CTRL = 0x%08x\n", cal_read(cal, CAL_CTRL));
+
 	return 0;
 }
 
-- 
2.25.1

