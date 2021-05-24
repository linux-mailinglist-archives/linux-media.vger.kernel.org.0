Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D96938E4EE
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 13:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232683AbhEXLLG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 07:11:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33776 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232699AbhEXLK6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 07:10:58 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E372F29ED;
        Mon, 24 May 2021 13:09:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621854565;
        bh=aYSudZSZeG0nd+xsiqT7UIgusIQ3MceTnlwf69IWO5A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G2GKpEEC1gcPm8UME8MTTIfUCCyb5+4Pb3Kn0fLA117XdZNSH5bi1N9AdXU2SFrm4
         W2p9B1R26SMFHE6xgoqV0oOrMTIOyTMA/6TziyFaFlFa4nsSKP3IliKkkvO2oEhFNf
         tMRDpHK3PNSC9xT//NSQ6Av+IQM1Jg2Ce3/TUNrY=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 16/38] media: ti-vpe: cal: disable csi2 ctx and pix proc at ctx_stop
Date:   Mon, 24 May 2021 14:08:47 +0300
Message-Id: <20210524110909.672432-17-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Disable CSI2 context and pix proc in cal_ctx_stop() to ensure they are
not used if the same context is used later on a different PHY or without
pix proc.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 0568677674b4..f47d2fa31a39 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -484,6 +484,12 @@ void cal_ctx_stop(struct cal_ctx *ctx)
 		  CAL_HL_IRQ_WDMA_START_MASK(ctx->dma_ctx));
 
 	ctx->dma.state = CAL_DMA_STOPPED;
+
+	/* Disable CSI2 context */
+	cal_write(ctx->cal, CAL_CSI2_CTX(ctx->phy->instance, ctx->csi2_ctx), 0);
+
+	/* Disable pix proc */
+	cal_write(ctx->cal, CAL_PIX_PROC(ctx->pix_proc), 0);
 }
 
 /* ------------------------------------------------------------------
-- 
2.25.1

