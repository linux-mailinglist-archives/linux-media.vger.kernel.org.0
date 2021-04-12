Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 885BD35C556
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 13:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240585AbhDLLfz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 07:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240555AbhDLLfx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 07:35:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D95DC061574
        for <linux-media@vger.kernel.org>; Mon, 12 Apr 2021 04:35:35 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FC005A9;
        Mon, 12 Apr 2021 13:35:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618227333;
        bh=TjoYqNetn11GfLjAMQ4zR2wP5e7uatM7ASJwjuM6mkU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZhXhUPLR0w2FOuq9TbSy/bzifV4i33soyGXi1BbvT7s7I+2hmUaBfMM5azSXebOpb
         jw0a9exwRoGhc00lJqy+pwLaQNAdRW1zjUrf+d1ZlFi3SN3dQkSjt8eC6lSpT47xN/
         9IXFxJsD7LxJGCIojUX3ijLrsRG2TEQ9xgiFqZI0=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 20/28] media: ti-vpe: cal: add vc and datatype fields to cal_ctx
Date:   Mon, 12 Apr 2021 14:34:49 +0300
Message-Id: <20210412113457.328012-21-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation for supporting multiple virtual channels and datatypes,
add vc and datatype fields to cal_ctx, initialize them to the currently
used values, and use those fields when writing to the register.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 6 ++++--
 drivers/media/platform/ti-vpe/cal.h | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 0fef892854ef..91d2139adc9b 100644
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
@@ -926,6 +926,8 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 	ctx->dma_ctx = inst;
 	ctx->ppi_ctx = inst;
 	ctx->cport = inst;
+	ctx->vc = 0;
+	ctx->datatype = 1;	/* datatype filter disabled */
 
 	ret = cal_ctx_v4l2_init(ctx);
 	if (ret)
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 409b7276a1fa..8aa93c92193a 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -223,6 +223,8 @@ struct cal_ctx {
 	u8			cport;
 	u8			ppi_ctx;
 	u8			pix_proc;
+	u8			vc;
+	u8			datatype;
 
 	bool use_pix_proc;
 };
-- 
2.25.1

