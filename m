Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54AD349F538
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 09:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347366AbiA1Ieo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 03:34:44 -0500
Received: from retiisi.eu ([95.216.213.190]:59028 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347335AbiA1Iem (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 03:34:42 -0500
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id C3295634C93;
        Fri, 28 Jan 2022 10:34:37 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v2 1/4] mc: Remove redundant documentation
Date:   Fri, 28 Jan 2022 10:33:06 +0200
Message-Id: <20220128083309.213122-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220128083309.213122-1-sakari.ailus@linux.intel.com>
References: <20220128083309.213122-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove redundant kerneldoc documentation in mc-device.c. The functions are
already documented in media-device.h.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-device.c | 15 ---------------
 1 file changed, 15 deletions(-)

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
-- 
2.30.2

