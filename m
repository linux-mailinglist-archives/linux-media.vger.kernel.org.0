Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3B662103D6
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 08:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgGAGV5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 02:21:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57956 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727098AbgGAGV4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 02:21:56 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F41B3556;
        Wed,  1 Jul 2020 08:21:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1593584514;
        bh=ZXmZeOMlyIK5uh+kb+tTJmBOVLqlNieOxSIOw+OWs1I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dMlHG/Z950kh4Tl86nTO7d8tksyPJPdIp8z9BYZl8O+sjpPg+w74t4OkX46v5xyYW
         j5V3bYW/8Phqw2he2twe2TpP6Hf977W8P9srJw6qPk9YhE3f6vCaLYggQSRWSIbeSW
         72GfL0CWUS7NNfzRamO5bx0m3jgh4cjWBV2JfLsY=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v4 4/4] media: v4l2-async: Log message in case of heterogeneous fwnode match
Date:   Wed,  1 Jul 2020 09:21:40 +0300
Message-Id: <20200701062140.12953-5-laurent.pinchart+renesas@ideasonboard.com>
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
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Changes since v2:

- Use dev_warn() and dev_notice()
- Fix typo
---
 drivers/media/v4l2-core/v4l2-async.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 60833822ee89..e3ab003a6c85 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -77,6 +77,7 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
 	struct fwnode_handle *dev_fwnode;
 	bool asd_fwnode_is_ep;
 	bool sd_fwnode_is_ep;
+	struct device *dev;
 
 	/*
 	 * Both the subdev and the async subdev can provide either an endpoint
@@ -114,7 +115,28 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
 
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

