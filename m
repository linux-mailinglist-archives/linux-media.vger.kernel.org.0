Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79704743D24
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 16:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbjF3OEM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 10:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232342AbjF3OEK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 10:04:10 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07FBABC
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 07:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688133850; x=1719669850;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wxh0uajhldwiM3MC67X8eFLmxsyAEtyclzIBCmbKzI4=;
  b=Ggdf3Of7yg4n6b5+SUy9jqqt3eReUd89cGDxY+ttW9a5UQjrRermZh+I
   DAvcHRROaEIY7xeOinmnu1hzEU2P8A4kPvredf2dxLLtviZzicDcBLGcL
   8h3Z5JI5B82X77di/3zYBf90M43mwzeovS6gW4Pbnbh2A9WuCQZT5nklH
   ucDS5kldUW0xeD0Rky2r0JftMP3u2bjoP/HuA0tfs6i0QQaZpkl4/Z6xS
   Sl2WpCJ/qpvK6d6tpxHag+8bgoy6bDnjfvfapzrl8feXW3p8UT4VpyX0R
   LiyaCgmuLxEVD3QLC31ag3ursGQ4rKb8XMO6t8dkXcJgqpSxxahEC0Fl/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="352220862"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="352220862"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 07:04:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="783086517"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="783086517"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 07:03:59 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 3433612075E;
        Fri, 30 Jun 2023 17:03:56 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 1/2] media: i2c: Select V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API for sensors
Date:   Fri, 30 Jun 2023 17:03:53 +0300
Message-Id: <20230630140354.111404-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630140354.111404-1-sakari.ailus@linux.intel.com>
References: <20230630140354.111404-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Select V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API for all sensor drivers. This
also adds the options to drivers that don't specifically need them, these
are still seldom used drivers using old APIs. The upside is that these
should now all compile --- many drivers have had missing dependencies.

The "menu" is replaced by selectable "menuconfig" to select the needed
V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API options.

Also select MEDIA_CONTROLLER which VIDEO_V4L2_SUBDEV_API effectively
depends on.

Reported-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Cc: stable@vger.kernel.org # for >= 6.1
---
 drivers/media/i2c/Kconfig | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 815c83135021..c7ffaa79abeb 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -25,8 +25,15 @@ config VIDEO_IR_I2C
 # V4L2 I2C drivers that are related with Camera support
 #
 
-menu "Camera sensor devices"
-	visible if MEDIA_CAMERA_SUPPORT
+menuconfig VIDEO_CAMERA_SENSOR
+	bool "Camera sensor devices"
+	depends on MEDIA_CAMERA_SUPPORT
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	default y
+
+if VIDEO_CAMERA_SENSOR
 
 config VIDEO_APTINA_PLL
 	tristate
@@ -810,7 +817,7 @@ config VIDEO_ST_VGXY61
 source "drivers/media/i2c/ccs/Kconfig"
 source "drivers/media/i2c/et8ek8/Kconfig"
 
-endmenu
+endif
 
 menu "Lens drivers"
 	visible if MEDIA_CAMERA_SUPPORT
-- 
2.39.2

