Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D72B81F8B99
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728168AbgFOABL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728159AbgFOABG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:06 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CAD6B197E;
        Mon, 15 Jun 2020 02:00:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179233;
        bh=5t8kMNyzl3KESR46qUn3/bnf2ejb1B7wLgU9zrUueAM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ef0jHd9ZOEDJMmdg+/fgIwc8w4wHAEPjU6vFLmKWK+SCGzVdqLrNfEJ6cwKM8k1Ry
         v4K0MrJrJXasQOw9YHvgzpT3JWTE0FN/R9xfvZgB3NSxkpoX2hPOQFtlGHM1+rIHf6
         K0PNm9Qf80VlkRjprdLwI9z/hFN8kXxiiLGbllxw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 048/107] media: ti-vpe: cal: Hardcode virtual channel to 0
Date:   Mon, 15 Jun 2020 02:58:45 +0300
Message-Id: <20200614235944.17716-49-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Using the endpoint reg value to pass the CSI-2 source virtual channel ID
in DT is a hack, isn't documented in the DT bindings, and isn't used in
neither upstream DT nor TI official overlays. Hardcode the virtual
channel to 0 to simplify reworking the code, proper virtual channel
support will be implemented later.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 52b4fa1ff7a5..c1866e58e9ec 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -325,7 +325,6 @@ struct cal_ctx {
 	struct vb2_queue	vb_vidq;
 	unsigned int		index;
 	unsigned int		cport;
-	unsigned int		virtual_channel;
 
 	/* Pointer pointing to current v4l2_buffer */
 	struct cal_buffer	*cur_frm;
@@ -1035,8 +1034,7 @@ static void cal_ctx_csi2_config(struct cal_ctx *ctx)
 	 *  0x1E: YUV422 2 pixels = 4 bytes
 	 */
 	set_field(&val, 0x1, CAL_CSI2_CTX_DT_MASK);
-	/* Virtual Channel from the CSI2 sensor usually 0! */
-	set_field(&val, ctx->virtual_channel, CAL_CSI2_CTX_VC_MASK);
+	set_field(&val, 0, CAL_CSI2_CTX_VC_MASK);
 	set_field(&val, ctx->v_fmt.fmt.pix.height, CAL_CSI2_CTX_LINES_MASK);
 	set_field(&val, CAL_CSI2_CTX_ATT_PIX, CAL_CSI2_CTX_ATT_MASK);
 	set_field(&val, CAL_CSI2_CTX_PACK_MODE_LINE,
@@ -2140,11 +2138,7 @@ static int of_cal_create_instance(struct cal_ctx *ctx, int inst)
 		goto cleanup_exit;
 	}
 
-	/* Store Virtual Channel number */
-	ctx->virtual_channel = endpoint->base.id;
-
 	ctx_dbg(3, ctx, "Port:%d v4l2-endpoint: CSI2\n", inst);
-	ctx_dbg(3, ctx, "Virtual Channel=%d\n", ctx->virtual_channel);
 	ctx_dbg(3, ctx, "flags=0x%08x\n", endpoint->bus.mipi_csi2.flags);
 	ctx_dbg(3, ctx, "clock_lane=%d\n", endpoint->bus.mipi_csi2.clock_lane);
 	ctx_dbg(3, ctx, "num_data_lanes=%d\n",
-- 
Regards,

Laurent Pinchart

