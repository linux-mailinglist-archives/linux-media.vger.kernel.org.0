Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF23E3A65D2
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235719AbhFNLmX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235768AbhFNLlX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:41:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C147DC061146
        for <linux-media@vger.kernel.org>; Mon, 14 Jun 2021 04:38:11 -0700 (PDT)
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75E5D5EA7;
        Mon, 14 Jun 2021 13:24:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669850;
        bh=k8agkwwOfTMbDPXqK9Oe5CF7uOjnMIp0vsZpjtmAk+w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cZ9ljjHi3HLgTdW18NkaFZfc+BOOeaFhoosuDwsAhe+R+RuHMSCj88bgKQLRkYTYl
         1nq4UG+yPtLlYxAud1V2swdtyoe/GyyvxLoiHTr6HPjtnc9pD7YFICFzsmiDk2MaK8
         6c2T0FaB2gB5zCEFG+XDuPFJr8LOSrwnBTHV/q7g=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 20/35] media: ti-vpe: cal: add vc and datatype fields to cal_ctx
Date:   Mon, 14 Jun 2021 14:23:30 +0300
Message-Id: <20210614112345.2032435-21-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation for supporting multiple virtual channels and datatypes,
add vc and datatype fields to cal_ctx, initialize them to the currently
used values, and use those fields when writing to the register.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c      | 6 ++++--
 drivers/media/platform/ti-vpe/cal.h      | 2 ++
 drivers/media/platform/ti-vpe/cal_regs.h | 2 ++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index cd8ec0413463..2d05fb3993d8 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -335,8 +335,8 @@ static void cal_ctx_csi2_config(struct cal_ctx *ctx)
 	 *  0x2A: RAW8   1 pixel  = 1 byte
 	 *  0x1E: YUV422 2 pixels = 4 bytes
 	 */
-	cal_set_field(&val, 0x1, CAL_CSI2_CTX_DT_MASK);
-	cal_set_field(&val, 0, CAL_CSI2_CTX_VC_MASK);
+	cal_set_field(&val, ctx->datatype, CAL_CSI2_CTX_DT_MASK);
+	cal_set_field(&val, ctx->vc, CAL_CSI2_CTX_VC_MASK);
 	cal_set_field(&val, ctx->v_fmt.fmt.pix.height, CAL_CSI2_CTX_LINES_MASK);
 	cal_set_field(&val, CAL_CSI2_CTX_ATT_PIX, CAL_CSI2_CTX_ATT_MASK);
 	cal_set_field(&val, CAL_CSI2_CTX_PACK_MODE_LINE,
@@ -927,6 +927,8 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 	ctx->dma_ctx = inst;
 	ctx->csi2_ctx = inst;
 	ctx->cport = inst;
+	ctx->vc = 0;
+	ctx->datatype = CAL_CSI2_CTX_DT_ANY;
 
 	ret = cal_ctx_v4l2_init(ctx);
 	if (ret)
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index d7cc399f47da..def0c9a3657d 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -223,6 +223,8 @@ struct cal_ctx {
 	u8			cport;
 	u8			csi2_ctx;
 	u8			pix_proc;
+	u8			vc;
+	u8			datatype;
 
 	bool			use_pix_proc;
 };
diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
index 7eeceeeb303e..40e4f972fcb7 100644
--- a/drivers/media/platform/ti-vpe/cal_regs.h
+++ b/drivers/media/platform/ti-vpe/cal_regs.h
@@ -414,6 +414,8 @@
 #define CAL_CSI2_VC_IRQ_ECC_CORRECTION_IRQ_MASK(n)	BIT(5 + ((n) * 8))
 
 #define CAL_CSI2_CTX_DT_MASK		GENMASK(5, 0)
+#define CAL_CSI2_CTX_DT_DISABLED	0
+#define CAL_CSI2_CTX_DT_ANY		1
 #define CAL_CSI2_CTX_VC_MASK		GENMASK(7, 6)
 #define CAL_CSI2_CTX_CPORT_MASK		GENMASK(12, 8)
 #define CAL_CSI2_CTX_ATT_MASK		BIT(13)
-- 
2.25.1

