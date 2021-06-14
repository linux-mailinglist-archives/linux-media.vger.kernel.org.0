Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A779B3A65B7
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236005AbhFNLmB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:42:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58264 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235967AbhFNLiT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:38:19 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 986A25E9F;
        Mon, 14 Jun 2021 13:24:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669848;
        bh=1aBk2KaljTVneofsXN2IK3KCLk+LjZPh+YkdKhoW/tY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D9aB/ews5Bi1pbtOpfesRaBzHHpCNYhLBAKg5hx9cCA8Jp9h70ShLfSu9Tw1zp3iW
         bwTku46t/Rj4TAZ5VJOusj/y4c21xDPS6ICUr3kk5OtkxDFVQziP1Ekf6Sn93XJiI4
         Ej56c+d6yjkuHwnTVQApha9aU9I2x99Mfy24q3FA=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 16/35] media: ti-vpe: cal: disable csi2 ctx and pix proc at ctx_stop
Date:   Mon, 14 Jun 2021 14:23:26 +0300
Message-Id: <20210614112345.2032435-17-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
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
index 759dc414a5bb..8d3e46899ad6 100644
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

