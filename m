Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC333A653C
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235905AbhFNLgB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:36:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58260 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235599AbhFNLd7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:33:59 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDDD15D56;
        Mon, 14 Jun 2021 13:24:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669846;
        bh=hP5iYCASfTIVH9uEeLXe/TRnAVL4aKkUa0UiwjsmWqc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fgipUXsAHJhF7NGLGt45beSKlrzMxhWOOzCH38Lmtb6fK7eP9n/+amUY0KVCITBmX
         4EmOn/XjTpqxU96gm0O1zx2lhQ3kYls/U01L5TlNeDc3cVctkU7aPz+UDBOsJTFf8q
         PKTeJ10CH6UNWT4raD6cHxW64/zebi39iHM/A+M0=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 10/35] media: ti-vpe: cal: Add pixel processing context
Date:   Mon, 14 Jun 2021 14:23:20 +0300
Message-Id: <20210614112345.2032435-11-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
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
index 02b0cb30b31b..3e3bd3dbe444 100644
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

