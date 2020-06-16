Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E92CE1FBD10
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 19:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731003AbgFPRc6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 13:32:58 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:40860 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730978AbgFPRc5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 13:32:57 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id EE0E43C00BA;
        Tue, 16 Jun 2020 19:32:54 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id RkBGNM8CkM4J; Tue, 16 Jun 2020 19:32:48 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id EABF03C0022;
        Tue, 16 Jun 2020 19:32:48 +0200 (CEST)
Received: from vmlxhi-121.localdomain (10.72.92.132) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 16 Jun
 2020 19:32:48 +0200
From:   Michael Rodin <mrodin@de.adit-jv.com>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Michael Rodin <mrodin@de.adit-jv.com>, <michael@rodin.online>,
        <efriedrich@de.adit-jv.com>, <erosca@de.adit-jv.com>,
        Steve Longerbeam <steve_longerbeam@mentor.com>
Subject: [PATCH] media: rcar-vin: Move media_device_register to async completion
Date:   Tue, 16 Jun 2020 19:31:36 +0200
Message-ID: <1592328696-84533-1-git-send-email-mrodin@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.72.92.132]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Steve Longerbeam <steve_longerbeam@mentor.com>

The media_device is registered during driver probe, before async
completion, so it is possible for .link_notify to be called before
all devices are bound.

Fix this by moving media_device_register() to rvin_group_notify_complete().
This ensures that all devices are now bound (the rcar-csi2 subdevices and
and video capture devices) before .link_notify can be called.

Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 7440c89..e70f83b 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -253,7 +253,6 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
 	struct media_device *mdev = &group->mdev;
 	const struct of_device_id *match;
 	struct device_node *np;
-	int ret;
 
 	mutex_init(&group->lock);
 
@@ -266,7 +265,6 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
 	vin_dbg(vin, "found %u enabled VIN's in DT", group->count);
 
 	mdev->dev = vin->dev;
-	mdev->ops = &rvin_media_ops;
 
 	match = of_match_node(vin->dev->driver->of_match_table,
 			      vin->dev->of_node);
@@ -278,11 +276,7 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
 
 	media_device_init(mdev);
 
-	ret = media_device_register(&group->mdev);
-	if (ret)
-		rvin_group_cleanup(group);
-
-	return ret;
+	return 0;
 }
 
 static void rvin_group_release(struct kref *kref)
@@ -688,6 +682,8 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 		return ret;
 	}
 
+	vin->group->mdev.ops = &rvin_media_ops;
+
 	/* Register all video nodes for the group. */
 	for (i = 0; i < RCAR_VIN_NUM; i++) {
 		if (vin->group->vin[i] &&
@@ -736,8 +732,10 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 		}
 	}
 	mutex_unlock(&vin->group->lock);
+	if (ret)
+		return ret;
 
-	return ret;
+	return media_device_register(&vin->group->mdev);
 }
 
 static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
-- 
2.7.4

