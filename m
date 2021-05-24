Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9825938E4E8
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 13:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232694AbhEXLK6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 07:10:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33776 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232665AbhEXLKy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 07:10:54 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83D47182C;
        Mon, 24 May 2021 13:09:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621854561;
        bh=fWGZFWN5+U0n63CdGWDy3nJ34Xex2vtAsUJOIw7B2zg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uP96VXx2MAsXo3mTWAxNfqoGUU/CJC4c8MuJ5PrgGGhQwSyz0nbmfQncwewSnhzcp
         4dZauCCaGDP0ihl7yKdxQwaOqNZtPbxG3R5t3BfogqQjoO1+O1FXnEip3NvV32Abij
         pShNFFebl5iC5HqjXP4yLdHoUSRzC2IaVXTVMub4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 10/38] media: ti-vpe: cal: Add pixel processing context
Date:   Mon, 24 May 2021 14:08:41 +0300
Message-Id: <20210524110909.672432-11-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CAL has 4 pixel processing contexts (PIX PROC) of which the driver
currently uses pix proc 0 for PHY0, and pix proc 1 for PHY1 (as the
driver supports only a single source per PHY).

Add a pix_proc field to cal_ctx to allow us to use different pix proc
contexts in the future

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 9 +++++----
 drivers/media/platform/ti-vpe/cal.h | 1 +
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 98739f9200ff..7f5ce6f9d874 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -355,16 +355,16 @@ static void cal_ctx_pix_proc_config(struct cal_ctx *ctx)
 		break;
 	}
 
-	val = cal_read(ctx->cal, CAL_PIX_PROC(ctx->index));
+	val = cal_read(ctx->cal, CAL_PIX_PROC(ctx->pix_proc));
 	cal_set_field(&val, extract, CAL_PIX_PROC_EXTRACT_MASK);
 	cal_set_field(&val, CAL_PIX_PROC_DPCMD_BYPASS, CAL_PIX_PROC_DPCMD_MASK);
 	cal_set_field(&val, CAL_PIX_PROC_DPCME_BYPASS, CAL_PIX_PROC_DPCME_MASK);
 	cal_set_field(&val, pack, CAL_PIX_PROC_PACK_MASK);
 	cal_set_field(&val, ctx->cport, CAL_PIX_PROC_CPORT_MASK);
 	cal_set_field(&val, 1, CAL_PIX_PROC_EN_MASK);
-	cal_write(ctx->cal, CAL_PIX_PROC(ctx->index), val);
-	ctx_dbg(3, ctx, "CAL_PIX_PROC(%d) = 0x%08x\n", ctx->index,
-		cal_read(ctx->cal, CAL_PIX_PROC(ctx->index)));
+	cal_write(ctx->cal, CAL_PIX_PROC(ctx->pix_proc), val);
+	ctx_dbg(3, ctx, "CAL_PIX_PROC(%u) = 0x%08x\n", ctx->pix_proc,
+		cal_read(ctx->cal, CAL_PIX_PROC(ctx->pix_proc)));
 }
 
 static void cal_ctx_wr_dma_config(struct cal_ctx *ctx)
@@ -857,6 +857,7 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 	ctx->index = inst;
 	ctx->csi2_ctx = inst;
 	ctx->cport = inst;
+	ctx->pix_proc = inst;
 
 	ret = cal_ctx_v4l2_init(ctx);
 	if (ret)
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index bcc3378b6b41..9475dc80559b 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -220,6 +220,7 @@ struct cal_ctx {
 	u8			index;
 	u8			cport;
 	u8			csi2_ctx;
+	u8			pix_proc;
 };
 
 extern unsigned int cal_debug;
-- 
2.25.1

