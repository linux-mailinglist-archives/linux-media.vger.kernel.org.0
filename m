Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A39BA66AE38
	for <lists+linux-media@lfdr.de>; Sat, 14 Jan 2023 22:46:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbjANVqz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Jan 2023 16:46:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbjANVqx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Jan 2023 16:46:53 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 279009EDF
        for <linux-media@vger.kernel.org>; Sat, 14 Jan 2023 13:46:53 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60B594D4;
        Sat, 14 Jan 2023 22:46:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673732811;
        bh=LRwmcIW6Ah7ntLrkFJ8toA78wdjHooJ87bA3rwTN5y4=;
        h=From:To:Cc:Subject:Date:From;
        b=R5NtdULt6x3FVJGlcwRb76nsGe/mnHsonZCMRpnDzSkap/EbAM67bZVpnQAJ9s6iv
         2GVf94pvbDhcnojWDAulNG9u54aeNjxkm7Fd1OcEfzXj7hB0RKZiYhvaLOt4D+PcJK
         yk617DrZpI8ro6S80nLvBNIfe6n5pxnqAasHqHXk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [PATCH] media: max9286: Free control handler
Date:   Sat, 14 Jan 2023 23:46:50 +0200
Message-Id: <20230114214650.2984-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
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

The control handler is leaked in some probe-time error paths, as well as
in the remove path. Fix it.

Fixes: 66d8c9d2422d ("media: i2c: Add MAX9286 driver")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 701038d6d19b..13a986b88588 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1122,6 +1122,7 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
 static void max9286_v4l2_unregister(struct max9286_priv *priv)
 {
 	fwnode_handle_put(priv->sd.fwnode);
+	v4l2_ctrl_handler_free(&priv->ctrls);
 	v4l2_async_unregister_subdev(&priv->sd);
 	max9286_v4l2_notifier_unregister(priv);
 }
-- 
Regards,

Laurent Pinchart

