Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10DB4202780
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2020 02:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbgFUABF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jun 2020 20:01:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60820 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728487AbgFUABA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jun 2020 20:01:00 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 084FF817;
        Sun, 21 Jun 2020 02:00:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592697658;
        bh=xL7Z3dlthTSbX3QsBLv5V9+b5Jk3V3uW/jBZqT8KO3g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IjJY9OVHyoAHTPcazSz0jPXc1ClVhAA5XHREXbXs9K861743Lxans2Se4LSuZdqVX
         /RpT4r6pKi13hPlTNKE4t6X6Wi3uNFydsFYBTFMUeltac7GZ8SsvXjIISZnBNMDOJm
         /3joVaQILdAxmUokGgDRRSj/P7ucwqLqSrc4Y15I=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v3 3/3] media: v4l2-async: Log message in case of heterogeneous fwnode match
Date:   Sun, 21 Jun 2020 03:00:28 +0300
Message-Id: <20200621000028.4591-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200621000028.4591-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200621000028.4591-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When a notifier supplies a device fwnode and a subdev supplies an
endpoint fwnode, incorrect matches may occur if multiple subdevs
correspond to the same device fwnode. This can't be handled
transparently in the framework, and requires the notifier to switch to
endpoint fwnodes. Log a message to notify of this problem. A second
message is added to help accelerating the transition to endpoint
matching.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
Changes since v2:

- Use dev_warn() and dev_notice()
- Fix typo
---
 drivers/media/v4l2-core/v4l2-async.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 1599f89c2436..242e0d93e4f0 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -77,6 +77,7 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
 	struct fwnode_handle *dev_fwnode;
 	bool asd_fwnode_is_ep;
 	bool sd_fwnode_is_ep;
+	struct device *dev;
 
 	/*
 	 * Both the subdev and the async subdev can provide either an endpoint
@@ -116,7 +117,28 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
 
 	fwnode_handle_put(dev_fwnode);
 
-	return dev_fwnode == other_fwnode;
+	if (dev_fwnode != other_fwnode)
+		return false;
+
+	/*
+	 * We have a heterogeneous match. Retrieve the struct device of the side
+	 * that matched on a device fwnode to print its driver name.
+	 */
+	if (sd_fwnode_is_ep)
+		dev = notifier->v4l2_dev ? notifier->v4l2_dev->dev
+		    : notifier->sd->dev;
+	else
+		dev = sd->dev;
+
+	if (dev && dev->driver) {
+		if (sd_fwnode_is_ep)
+			dev_warn(dev, "Driver %s uses device fwnode, incorrect match may occur\n",
+				 dev->driver->name);
+		dev_notice(dev, "Consider updating driver %s to match on endpoints\n",
+			   dev->driver->name);
+	}
+
+	return true;
 }
 
 static bool match_custom(struct v4l2_async_notifier *notifier,
-- 
Regards,

Laurent Pinchart

