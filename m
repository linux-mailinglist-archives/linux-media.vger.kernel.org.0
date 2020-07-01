Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 779FF2103D5
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 08:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbgGAGV5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 02:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgGAGV4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 02:21:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E4FC061755;
        Tue, 30 Jun 2020 23:21:55 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56FC4D83;
        Wed,  1 Jul 2020 08:21:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1593584513;
        bh=XFNL4yaRoByikUqTn6IyHh34f5D/gBVXyD4G49C2vj8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vC7O3rdEn6lqf9SbN8Hi72tVPoKB0kJXjpEcOwf5HOpjGUbhDoazky/TbhYRoeQDZ
         6R+4Ul+cixlEJL76IcESP/m76BXKLDHoEiUcjo+XX+PB3PT8QFQbOzkNLH71wVa3wH
         mP8hggSpRsLxD33FYeepLdygaI4ZsGnDTyqrXDek=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v4 3/4] media: v4l2-async: Pass notifier pointer to match functions
Date:   Wed,  1 Jul 2020 09:21:39 +0300
Message-Id: <20200701062140.12953-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200701062140.12953-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200701062140.12953-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The notifier is useful to match functions to access information about
the device matching a subdev. This will be used to print messages using
the correct struct device and driver name.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/v4l2-core/v4l2-async.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index e9c3d41c9449..60833822ee89 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -50,7 +50,8 @@ static int v4l2_async_notifier_call_complete(struct v4l2_async_notifier *n)
 	return n->ops->complete(n);
 }
 
-static bool match_i2c(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
+static bool match_i2c(struct v4l2_async_notifier *notifier,
+		      struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
 {
 #if IS_ENABLED(CONFIG_I2C)
 	struct i2c_client *client = i2c_verify_client(sd->dev);
@@ -63,13 +64,14 @@ static bool match_i2c(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
 #endif
 }
 
-static bool match_devname(struct v4l2_subdev *sd,
-			  struct v4l2_async_subdev *asd)
+static bool match_devname(struct v4l2_async_notifier *notifier,
+			  struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
 {
 	return !strcmp(asd->match.device_name, dev_name(sd->dev));
 }
 
-static bool match_fwnode(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
+static bool match_fwnode(struct v4l2_async_notifier *notifier,
+			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
 {
 	struct fwnode_handle *other_fwnode;
 	struct fwnode_handle *dev_fwnode;
@@ -115,7 +117,8 @@ static bool match_fwnode(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
 	return dev_fwnode == other_fwnode;
 }
 
-static bool match_custom(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
+static bool match_custom(struct v4l2_async_notifier *notifier,
+			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
 {
 	if (!asd->match.custom.match)
 		/* Match always */
@@ -132,7 +135,8 @@ static struct v4l2_async_subdev *
 v4l2_async_find_match(struct v4l2_async_notifier *notifier,
 		      struct v4l2_subdev *sd)
 {
-	bool (*match)(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd);
+	bool (*match)(struct v4l2_async_notifier *notifier,
+		      struct v4l2_subdev *sd, struct v4l2_async_subdev *asd);
 	struct v4l2_async_subdev *asd;
 
 	list_for_each_entry(asd, &notifier->waiting, list) {
@@ -157,7 +161,7 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
 		}
 
 		/* match cannot be NULL here */
-		if (match(sd, asd))
+		if (match(notifier, sd, asd))
 			return asd;
 	}
 
-- 
Regards,

Laurent Pinchart

