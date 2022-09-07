Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76EA05B0DB8
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 22:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbiIGUEw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 16:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbiIGUEt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 16:04:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D6351BEAF
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 13:04:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D7D5907;
        Wed,  7 Sep 2022 22:04:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662581084;
        bh=gRAsPlMnO5Vlxin88PFJ5n6Za2/sfgS5C9fYMdvJedQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qyGHBZ7jkOoYxNneLSlgTYZ94dQZUv2L2v+zui37QibvdqEz5ASekG7joQSUrMQpU
         ZAaoHINHqVYeMwEJz1L9zPSRC2KuVxm8qcJdyje7/fTzXAhfBsM16AvGfPUz8VSCsS
         5KhSzF46VqlgGxIz32QmOLqBA2RplzW3Sg3f1cIk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH 3/6] staging: media: imx: Drop imx_media_subdev_bound()
Date:   Wed,  7 Sep 2022 23:04:21 +0300
Message-Id: <20220907200424.32136-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220907200424.32136-1-laurent.pinchart@ideasonboard.com>
References: <20220907200424.32136-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx_media_subdev_bound() function is a no-op, and the async notifier
.bound() operation is optional. Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-dev-common.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
index e6d6ed3b1161..8f7ced3a9cca 100644
--- a/drivers/staging/media/imx/imx-media-dev-common.c
+++ b/drivers/staging/media/imx/imx-media-dev-common.c
@@ -19,18 +19,6 @@ static inline struct imx_media_dev *notifier2dev(struct v4l2_async_notifier *n)
 	return container_of(n, struct imx_media_dev, notifier);
 }
 
-/* async subdev bound notifier */
-static int imx_media_subdev_bound(struct v4l2_async_notifier *notifier,
-				  struct v4l2_subdev *sd,
-				  struct v4l2_async_subdev *asd)
-{
-	struct imx_media_dev *imxmd = notifier2dev(notifier);
-
-	dev_dbg(imxmd->md.dev, "subdev %s bound\n", sd->name);
-
-	return 0;
-}
-
 /*
  * Create the missing media links from the CSI-2 receiver.
  * Called after all async subdevs have bound.
@@ -337,7 +325,6 @@ static void imx_media_notify(struct v4l2_subdev *sd, unsigned int notification,
 }
 
 static const struct v4l2_async_notifier_operations imx_media_notifier_ops = {
-	.bound = imx_media_subdev_bound,
 	.complete = imx_media_probe_complete,
 };
 
-- 
Regards,

Laurent Pinchart

