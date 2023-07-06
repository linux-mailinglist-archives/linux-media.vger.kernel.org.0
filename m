Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9514B7498A7
	for <lists+linux-media@lfdr.de>; Thu,  6 Jul 2023 11:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbjGFJjg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jul 2023 05:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjGFJjf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jul 2023 05:39:35 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63FB01725
        for <linux-media@vger.kernel.org>; Thu,  6 Jul 2023 02:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688636374; x=1720172374;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=12hiQCm4K7hfnBzxnMdA2iC1kTijhoqaIaFJUkQwhm0=;
  b=Y0erQ1lFIOvGChVPXAheZGkq9yrqHTLNcRpndwlXq0MDw/J6T8OfsswP
   bRrCEPAtyOWSzCCZO1DUE8aYJdLOrKe/bn3LM6jUgMThlmzW2vJM7XlQp
   B37TjGtxMPo03qP0Bh1fh4ztE0hIteWPppOtbyQaJYzjtsst07SsceG9y
   7JqS/r8URVFWEh+rT8EifmDKjd+ydl8gHuS5NMSAFW0PEHTVpj8Khzu6Z
   1xLmNvf9iReRIVhsqOW8cspymGq98KTkEQcbNw6EFdLbAHftSv9lfCCCG
   i+SPRxYcILpj8A+FgJy9rHuOrVnL1/zZS2S+s/ncMwlcrgYr4PwqjfLHb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="353393400"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="353393400"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 02:39:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="722741538"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="722741538"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 02:39:31 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E2F0111FB8E;
        Thu,  6 Jul 2023 12:33:54 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 1/2] media: i2c: Add a camera sensor top level menu
Date:   Thu,  6 Jul 2023 12:33:51 +0300
Message-Id: <20230706093352.193513-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230706093352.193513-1-sakari.ailus@linux.intel.com>
References: <20230706093352.193513-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
depends on, and add the I2C dependency to the menu.

Reported-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: stable@vger.kernel.org # for >= 6.1
---
 drivers/media/i2c/Kconfig | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 815c83135021..ad955bfa6f01 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -25,8 +25,15 @@ config VIDEO_IR_I2C
 # V4L2 I2C drivers that are related with Camera support
 #
 
-menu "Camera sensor devices"
-	visible if MEDIA_CAMERA_SUPPORT
+menuconfig VIDEO_CAMERA_SENSOR
+	bool "Camera sensor devices"
+	depends on MEDIA_CAMERA_SUPPORT && I2C
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

