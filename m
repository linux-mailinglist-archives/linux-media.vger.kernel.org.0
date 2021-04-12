Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD9635C546
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 13:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240516AbhDLLfe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 07:35:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52586 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240510AbhDLLfd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 07:35:33 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 735203F0;
        Mon, 12 Apr 2021 13:35:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618227315;
        bh=d3BA4yowOTeNyXcdgFovk+43uAeOM711xHtniZHTzyA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VYkk1Rm8if2ro8XoGMOBZP28CXzWytPd8AoEkIpP8XYcQDjL8QVamUKn8xS59kcD/
         uPDuuwc/iVvIssjOqa6z4K2k/2+DHpBq/05esLl5/W9qCUO2MxIB2aw+/yxet7ZPkc
         0kRKfXlahnkVSdryhQnsGcmslTgyTjp3WvkqtDr4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 05/28] media: ti-vpe: cal: move global config from cal_ctx_wr_dma_config to runtime resume
Date:   Mon, 12 Apr 2021 14:34:34 +0300
Message-Id: <20210412113457.328012-6-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
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
---
 drivers/media/platform/ti-vpe/cal.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index a5340b583592..b539a9afb3f5 100644
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
@@ -1125,6 +1114,7 @@ static int cal_runtime_resume(struct device *dev)
 {
 	struct cal_dev *cal = dev_get_drvdata(dev);
 	unsigned int i;
+	u32 val;
 
 	if (cal->data->flags & DRA72_CAL_PRE_ES2_LDO_DISABLE) {
 		/*
@@ -1141,6 +1131,17 @@ static int cal_runtime_resume(struct device *dev)
 	 */
 	cal_write(cal, CAL_HL_IRQENABLE_SET(0), CAL_HL_IRQ_OCPO_ERR_MASK);
 
+	val = cal_read(cal, CAL_CTRL);
+	cal_set_field(&val, CAL_CTRL_BURSTSIZE_BURST128,
+		      CAL_CTRL_BURSTSIZE_MASK);
+	cal_set_field(&val, 0xF, CAL_CTRL_TAGCNT_MASK);
+	cal_set_field(&val, CAL_CTRL_POSTED_WRITES_NONPOSTED,
+		      CAL_CTRL_POSTED_WRITES_MASK);
+	cal_set_field(&val, 0xFF, CAL_CTRL_MFLAGL_MASK);
+	cal_set_field(&val, 0xFF, CAL_CTRL_MFLAGH_MASK);
+	cal_write(cal, CAL_CTRL, val);
+	cal_dbg(3, cal, "CAL_CTRL = 0x%08x\n", cal_read(cal, CAL_CTRL));
+
 	return 0;
 }
 
-- 
2.25.1

