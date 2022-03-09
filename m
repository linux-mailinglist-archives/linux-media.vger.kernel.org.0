Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CDE94D3810
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 18:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235440AbiCIQof (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 11:44:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237524AbiCIQkX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 11:40:23 -0500
Received: from hillosipuli.retiisi.eu (retiisi.eu [95.216.213.190])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBDF814D700
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 08:33:16 -0800 (PST)
Received: from lanttu.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::c1:2])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 455A8634C91;
        Wed,  9 Mar 2022 18:33:11 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v3 1/5] mc: Remove redundant documentation
Date:   Wed,  9 Mar 2022 18:31:08 +0200
Message-Id: <20220309163112.11708-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220309163112.11708-1-sakari.ailus@linux.intel.com>
References: <20220309163112.11708-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove redundant kerneldoc documentation in mc-device.c. The functions are
already documented in media-device.h, where non-redundant documentation is
also moved.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/mc/mc-device.c | 15 ---------------
 include/media/media-device.h |  6 ++++++
 2 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index cf5e459b1d96..094647fdb866 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -608,11 +608,6 @@ static void __media_device_unregister_entity(struct media_entity *entity)
 	entity->graph_obj.mdev = NULL;
 }
 
-/**
- * media_device_register_entity - Register an entity with a media device
- * @mdev:	The media device
- * @entity:	The entity
- */
 int __must_check media_device_register_entity(struct media_device *mdev,
 					      struct media_entity *entity)
 {
@@ -691,16 +686,6 @@ void media_device_unregister_entity(struct media_entity *entity)
 }
 EXPORT_SYMBOL_GPL(media_device_unregister_entity);
 
-/**
- * media_device_init() - initialize a media device
- * @mdev:	The media device
- *
- * The caller is responsible for initializing the media device before
- * registration. The following fields must be set:
- *
- * - dev must point to the parent device
- * - model must be filled with the device model name
- */
 void media_device_init(struct media_device *mdev)
 {
 	INIT_LIST_HEAD(&mdev->entities);
diff --git a/include/media/media-device.h b/include/media/media-device.h
index 1345e6da688a..7d5b212792a5 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -219,6 +219,12 @@ static inline __must_check int media_entity_enum_init(
  * So drivers need to first initialize the media device, register any entity
  * within the media device, create pad to pad links and then finally register
  * the media device by calling media_device_register() as a final step.
+ *
+ * The caller is responsible for initializing the media device before
+ * registration. The following fields must be set:
+ *
+ * - dev must point to the parent device
+ * - model must be filled with the device model name
  */
 void media_device_init(struct media_device *mdev);
 
-- 
2.30.2

