Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE6181892DF
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 01:25:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbgCRAZY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 20:25:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59890 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgCRAZY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 20:25:24 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA15DD9B;
        Wed, 18 Mar 2020 01:25:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584491122;
        bh=AsZOXmDiLbgJ/+2+f7+NZq7I0JLo+kXl55wBUTjt9KA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cJKrazMRm9ZUkdvhwBkjY5LXNQOTni+shhTGKPPrLfldDIP7mMzxap8G0qxidqgG7
         eLrr5x5OK4PPk965PenoycxUNERV2fKyvvvpjwoRH2pO0SLMxyY8kw8aoFGYBgEybj
         p74FT9xdb+jBJ2oG2uFwj9d56w6m3JNLasPyGe1A=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/4] media: v4l2-async: Pass notifier pointer to match functions
Date:   Wed, 18 Mar 2020 02:25:05 +0200
Message-Id: <20200318002507.30336-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200318002507.30336-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200318002507.30336-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The notifier is useful to match functions to access information about
the device matching a subdev. This will be used to print messages using
the correct struct device and driver name.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 995e5464cba7..224b39a7aeb1 100644
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
@@ -114,7 +116,8 @@ static bool match_fwnode(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
 	return dev_fwnode == other_fwnode;
 }
 
-static bool match_custom(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
+static bool match_custom(struct v4l2_async_notifier *notifier,
+			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
 {
 	if (!asd->match.custom.match)
 		/* Match always */
@@ -131,7 +134,8 @@ static struct v4l2_async_subdev *
 v4l2_async_find_match(struct v4l2_async_notifier *notifier,
 		      struct v4l2_subdev *sd)
 {
-	bool (*match)(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd);
+	bool (*match)(struct v4l2_async_notifier *notifier,
+		      struct v4l2_subdev *sd, struct v4l2_async_subdev *asd);
 	struct v4l2_async_subdev *asd;
 
 	list_for_each_entry(asd, &notifier->waiting, list) {
@@ -156,7 +160,7 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
 		}
 
 		/* match cannot be NULL here */
-		if (match(sd, asd))
+		if (match(notifier, sd, asd))
 			return asd;
 	}
 
-- 
Regards,

Laurent Pinchart

