Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 816D74D36F0
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 18:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237079AbiCIRPu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 12:15:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238961AbiCIRPS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 12:15:18 -0500
Received: from hillosipuli.retiisi.eu (retiisi.eu [95.216.213.190])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2DB2656F
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 09:12:07 -0800 (PST)
Received: from lanttu.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::c1:2])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id DFBC0634C90;
        Wed,  9 Mar 2022 19:12:04 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 1/1] media: Documentation: mc: Add media_device_{init,cleanup}
Date:   Wed,  9 Mar 2022 19:10:06 +0200
Message-Id: <20220309171006.12327-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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

Document that drivers must first initialise a media device before
registering it, and clean up once the media device is unregistered.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/mc-core.rst | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
index 57b5bbba944e..02481a2513b9 100644
--- a/Documentation/driver-api/media/mc-core.rst
+++ b/Documentation/driver-api/media/mc-core.rst
@@ -42,9 +42,16 @@ Allocation of the structure is handled by the media device driver, usually by
 embedding the :c:type:`media_device` instance in a larger driver-specific
 structure.
 
-Drivers register media device instances by calling
-:c:func:`__media_device_register()` via the macro ``media_device_register()``
-and unregistered by calling :c:func:`media_device_unregister()`.
+Drivers initialise media device instances by calling
+:c:func:`media_device_init()`. After initialising a media device instance, it is
+registered by calling :c:func:`__media_device_register()` via the macro
+``media_device_register()`` and unregistered by calling
+:c:func:`media_device_unregister()`. An initialised media device must be
+eventually cleaned up by calling :c:func:`media_device_cleanup()`.
+
+Note that it is not allowed to unregister a media device instance that was not
+previously registered, or clean up a media device instance that was not
+previously initialised.
 
 Entities
 ^^^^^^^^
-- 
2.30.2

