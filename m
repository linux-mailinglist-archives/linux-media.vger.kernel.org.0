Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DABF174266A
	for <lists+linux-media@lfdr.de>; Thu, 29 Jun 2023 14:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbjF2M2G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jun 2023 08:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232226AbjF2M13 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jun 2023 08:27:29 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23BFF3A8E
        for <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 05:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688041648; x=1719577648;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=r9Gl4fS+xYYUN2ePZi1fYbS0Zt8SYJYCO88ngdoVEog=;
  b=Uo5LoUpG4PrKpOV4XDg8exaSgdEJvmUtgS2qhG0hJN14xpJqNlo6/Tvz
   t25FsLATCmcVLgT1VQ6H/PeGU07dqGcOd+TaGD/rhoyXRtud9lLKcVQrt
   oxuf8LiIu2rXQ2JfXy8qN6OujvizUTMydlHbTkSebvf8CzfoR7zd3nCph
   r1BM7JRFnhc0EsuExPvOHeKYr61uHmO4xgj6SxKLAm7+Z3UGuldnhZK+t
   d/C5fUU6atM4Cf4p4vrorJb5PmwYNw0iQ9Lnis/erTrb3muYd/Yv2CNwb
   T78DzNHGVUrmHgx5TaaxA9d9tXfSQ+PQT3vGXXcpLCWntnw7SmVwJL84A
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="365555389"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="365555389"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 05:27:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="963972660"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="963972660"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 05:27:25 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id B0C8C1206E6;
        Thu, 29 Jun 2023 15:27:22 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qEqji-003sX6-0r;
        Thu, 29 Jun 2023 15:26:58 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Scally <dan.scally@ideasonboard.com>, hverkuil@xs4all.nl
Subject: [PATCH v2 1/1] media: i2c: Select V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API for sensors
Date:   Thu, 29 Jun 2023 15:26:48 +0300
Message-Id: <20230629122648.924600-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
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
---
since v1:

- Select MEDIA_CONTROLLER, don't depend on it.

 drivers/media/i2c/Kconfig | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 815c83135021c..c7ffaa79abeb9 100644
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

