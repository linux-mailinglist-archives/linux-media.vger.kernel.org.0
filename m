Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F79E244057
	for <lists+linux-media@lfdr.de>; Thu, 13 Aug 2020 23:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgHMVGV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 17:06:21 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:24942 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726427AbgHMVGV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 17:06:21 -0400
X-Halon-ID: d4d2c1fc-dda8-11ea-a39b-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac52a8.dip0.t-ipconnect.de [84.172.82.168])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id d4d2c1fc-dda8-11ea-a39b-005056917f90;
        Thu, 13 Aug 2020 23:06:18 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] rcar-vin: Register media device when all sub-devices bound
Date:   Thu, 13 Aug 2020 23:06:02 +0200
Message-Id: <20200813210602.3983805-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813210602.3983805-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200813210602.3983805-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The media device is not usable by userspace before all devices involved
in capture are present in the system. Move registering of the media
device to the async complete callback.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 1cbbcc9008e39627..04c9b33fde68f5a3 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -243,7 +243,6 @@ static struct rvin_group *rvin_group_data;
 
 static void rvin_group_cleanup(struct rvin_group *group)
 {
-	media_device_unregister(&group->mdev);
 	media_device_cleanup(&group->mdev);
 	mutex_destroy(&group->lock);
 }
@@ -253,7 +252,6 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
 	struct media_device *mdev = &group->mdev;
 	const struct of_device_id *match;
 	struct device_node *np;
-	int ret;
 
 	mutex_init(&group->lock);
 
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
@@ -682,6 +676,10 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 	unsigned int i;
 	int ret;
 
+	ret = media_device_register(&vin->group->mdev);
+	if (ret)
+		return ret;
+
 	ret = v4l2_device_register_subdev_nodes(&vin->v4l2_dev);
 	if (ret) {
 		vin_err(vin, "Failed to register subdev nodes\n");
@@ -762,6 +760,8 @@ static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
 	}
 
 	mutex_unlock(&vin->group->lock);
+
+	media_device_unregister(&vin->group->mdev);
 }
 
 static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
-- 
2.28.0

