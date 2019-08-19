Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC0991AD9
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 03:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbfHSBpK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Aug 2019 21:45:10 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4727 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726028AbfHSBpK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Aug 2019 21:45:10 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 0DA083501E5C5DAA8C76;
        Mon, 19 Aug 2019 09:45:08 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Mon, 19 Aug 2019
 09:45:02 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>
CC:     <yi.zhang@huawei.com>, <zhengbin13@huawei.com>
Subject: [PATCH v2] media: mc-device.c: fix memleak in media_device_register_entity
Date:   Mon, 19 Aug 2019 09:51:30 +0800
Message-ID: <1566179490-15413-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In media_device_register_entity, if media_graph_walk_init fails,
need to free the previously memory.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/media/mc/mc-device.c | 65 ++++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index e19df51..da80883 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -575,6 +575,38 @@ static void media_device_release(struct media_devnode *devnode)
 	dev_dbg(devnode->parent, "Media device released\n");
 }

+static void __media_device_unregister_entity(struct media_entity *entity)
+{
+	struct media_device *mdev = entity->graph_obj.mdev;
+	struct media_link *link, *tmp;
+	struct media_interface *intf;
+	unsigned int i;
+
+	ida_free(&mdev->entity_internal_idx, entity->internal_idx);
+
+	/* Remove all interface links pointing to this entity */
+	list_for_each_entry(intf, &mdev->interfaces, graph_obj.list) {
+		list_for_each_entry_safe(link, tmp, &intf->links, list) {
+			if (link->entity == entity)
+				__media_remove_intf_link(link);
+		}
+	}
+
+	/* Remove all data links that belong to this entity */
+	__media_entity_remove_links(entity);
+
+	/* Remove all pads that belong to this entity */
+	for (i = 0; i < entity->num_pads; i++)
+		media_gobj_destroy(&entity->pads[i].graph_obj);
+
+	/* Remove the entity */
+	media_gobj_destroy(&entity->graph_obj);
+
+	/* invoke entity_notify callbacks to handle entity removal?? */
+
+	entity->graph_obj.mdev = NULL;
+}
+
 /**
  * media_device_register_entity - Register an entity with a media device
  * @mdev:	The media device
@@ -632,6 +664,7 @@ int __must_check media_device_register_entity(struct media_device *mdev,
 		 */
 		ret = media_graph_walk_init(&new, mdev);
 		if (ret) {
+			__media_device_unregister_entity(entity);
 			mutex_unlock(&mdev->graph_mutex);
 			return ret;
 		}
@@ -644,38 +677,6 @@ int __must_check media_device_register_entity(struct media_device *mdev,
 }
 EXPORT_SYMBOL_GPL(media_device_register_entity);

-static void __media_device_unregister_entity(struct media_entity *entity)
-{
-	struct media_device *mdev = entity->graph_obj.mdev;
-	struct media_link *link, *tmp;
-	struct media_interface *intf;
-	unsigned int i;
-
-	ida_free(&mdev->entity_internal_idx, entity->internal_idx);
-
-	/* Remove all interface links pointing to this entity */
-	list_for_each_entry(intf, &mdev->interfaces, graph_obj.list) {
-		list_for_each_entry_safe(link, tmp, &intf->links, list) {
-			if (link->entity == entity)
-				__media_remove_intf_link(link);
-		}
-	}
-
-	/* Remove all data links that belong to this entity */
-	__media_entity_remove_links(entity);
-
-	/* Remove all pads that belong to this entity */
-	for (i = 0; i < entity->num_pads; i++)
-		media_gobj_destroy(&entity->pads[i].graph_obj);
-
-	/* Remove the entity */
-	media_gobj_destroy(&entity->graph_obj);
-
-	/* invoke entity_notify callbacks to handle entity removal?? */
-
-	entity->graph_obj.mdev = NULL;
-}
-
 void media_device_unregister_entity(struct media_entity *entity)
 {
 	struct media_device *mdev = entity->graph_obj.mdev;
--
2.7.4

