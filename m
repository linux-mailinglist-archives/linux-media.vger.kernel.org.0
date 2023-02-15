Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03F6D69802B
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 17:08:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbjBOQIE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 11:08:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbjBOQID (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 11:08:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55BC3B0D2
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 08:08:02 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF79010B;
        Wed, 15 Feb 2023 17:08:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676477281;
        bh=ahASdNV1JJWbZ+Oqv5egLPED/P/geO7N5k2S7kXpV5s=;
        h=From:To:Cc:Subject:Date:From;
        b=JXqeLf954sA8+2WNRoyVqQH8r6PvNlaqzp4wDRT4URfm74bDfH4nGHMzUSFI3XbWG
         CMUmpVP+2OOOX9+wUgJJ/o6wl0ZOKAdskutk+MxoTLuWuT86LdV5FqgIVH9SeYhxys
         YPKtccxlhTpJzm/BKtg6lWuElgiKwG+fjaZbUv00=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Mirela Rabulea <mirela.rabulea@nxp.com>, linux-imx@nxp.com,
        kernel@pengutronix.de
Subject: [PATCH] media: imx-jpeg: Fix incorrect indentation
Date:   Wed, 15 Feb 2023 18:08:00 +0200
Message-Id: <20230215160800.12621-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Variable initialization code in notify_src_chg() is incorrectly
indented. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index f085f14d676a..15966169f3cd 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -497,10 +497,9 @@ static void notify_eos(struct mxc_jpeg_ctx *ctx)
 static void notify_src_chg(struct mxc_jpeg_ctx *ctx)
 {
 	const struct v4l2_event ev = {
-			.type = V4L2_EVENT_SOURCE_CHANGE,
-			.u.src_change.changes =
-			V4L2_EVENT_SRC_CH_RESOLUTION,
-		};
+		.type = V4L2_EVENT_SOURCE_CHANGE,
+		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
+	};
 
 	dev_dbg(ctx->mxc_jpeg->dev, "Notify app event SRC_CH_RESOLUTION");
 	v4l2_event_queue_fh(&ctx->fh, &ev);

base-commit: 83e0f265aa8d0e37cc8e15d318b64da0ec03ff41
-- 
Regards,

Laurent Pinchart

