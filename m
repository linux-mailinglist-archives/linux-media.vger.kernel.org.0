Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 107AF1892DC
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 01:25:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbgCRAZZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 20:25:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59906 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbgCRAZY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 20:25:24 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89787130D;
        Wed, 18 Mar 2020 01:25:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584491123;
        bh=r6drN6vvFeLxBEjgbV7lLPzr3gKiF6W/cjDjK8JfyMk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=K7mqSZQJpen1CANrSIXWe9XcswldTfhkKVYj9oQeHV4k+nvZ8ysjgm6F8E16r0IbY
         YlugKF95R0uE91V1gQ5xyOX6IbS6ixsfQ8y64LCrtzorWO//2+mgcbDQuVLu/WDPFu
         wbvqPheXlSuGFRV+KcDhDAN5x5CZ2M3jkxpSvX7g=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/4] media: v4l2-async: Log message in case of heterogenous fwnode match
Date:   Wed, 18 Mar 2020 02:25:06 +0200
Message-Id: <20200318002507.30336-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200318002507.30336-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200318002507.30336-1-laurent.pinchart+renesas@ideasonboard.com>
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
---
 drivers/media/v4l2-core/v4l2-async.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 224b39a7aeb1..9f393a7be455 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -77,6 +77,7 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
 	struct fwnode_handle *dev_fwnode;
 	bool asd_fwnode_is_ep;
 	bool sd_fwnode_is_ep;
+	struct device *dev;
 	const char *name;
 
 	/*
@@ -113,7 +114,28 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
 
 	fwnode_handle_put(dev_fwnode);
 
-	return dev_fwnode == other_fwnode;
+	if (dev_fwnode != other_fwnode)
+		return false;
+
+	/*
+	 * We have an heterogenous match. Retrieve the struct device of the
+	 * side that matched on a device fwnode to print its driver name.
+	 */
+	if (sd_fwnode_is_ep)
+		dev = notifier->v4l2_dev ? notifier->v4l2_dev->dev
+		    : notifier->sd->dev;
+	else
+		dev = sd->dev;
+
+	if (dev && dev->driver) {
+		if (sd_fwnode_is_ep)
+			dev_info(dev, "Driver %s uses device fwnode, incorrect match may occur\n",
+				 dev->driver->name);
+		dev_info(dev, "Consider updating driver %s to match on endpoints\n",
+			 dev->driver->name);
+	}
+
+	return true;
 }
 
 static bool match_custom(struct v4l2_async_notifier *notifier,
-- 
Regards,

Laurent Pinchart

