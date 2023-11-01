Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0CF7DDD96
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 09:12:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbjKAIMk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 04:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjKAIMj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 04:12:39 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB2E1B4
        for <linux-media@vger.kernel.org>; Wed,  1 Nov 2023 01:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698826353; x=1730362353;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CCMXLkXzbNbE/lDOiB2De5krIOpwB1GYyvL1yyEk4Og=;
  b=iwhfoDgh+7iJpSGlZATop7YJmYc4qFOGIWlqwKNi7gi+7pOXgGCZJ9To
   t7YTsxuwZDAFCBSc8AsNq1bBIEWIIPpoON7qANkM9SUT2avSc1ZG1pm+o
   yRgbByGMoc9ntbIJo4mmp00bC8UPqPKeYe5YxKGH7qqJ9mkA7LfSNrNRf
   cTbCtzzGvp/MlyYH4nKdB7SoN+52BA8Kmz1Snro7S6rE1BknzggsZBI7d
   WW+KwVJ4YEbO124ohN7zeaAOI8P9087E0UbB6MKazbr8+2gcTu/3nuOgY
   d7MD6u9tRpuY5w2L2k+Pxn7wa99BlzA5Aw6d19ACYdQh8BQB6q98SISKD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="373501050"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="373501050"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 01:12:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="710714888"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="710714888"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 01:12:29 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 1758711F929;
        Wed,  1 Nov 2023 10:05:46 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     "Cao, Bingbu" <bingbu.cao@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        hverkuil@xs4all.nl
Subject: [PATCH 1/1] media: Documentation: Initialisation finishes before subdev registration
Date:   Wed,  1 Nov 2023 10:05:46 +0200
Message-Id: <20231101080546.1145527-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document that sub-device initialisation needs to complete before the async
sub-device is registered as there is no further driver action needed
before the sensor becomes accessible via the UAPI.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/camera-sensor.rst | 3 ++-
 Documentation/driver-api/media/v4l2-subdev.rst   | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index 6456145f96ed..c675ce77c4d6 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -60,7 +60,8 @@ management over the pipeline.
 Camera sensor drivers are responsible for controlling the power state of the
 device they otherwise control as well. They shall use runtime PM to manage
 power states. Runtime PM shall be enabled at probe time and disabled at remove
-time. Drivers should enable runtime PM autosuspend.
+time. Drivers should enable runtime PM autosuspend. Note that runtime PM has to
+be enabled before registering the sensor's async sub-device.
 
 The runtime PM handlers shall handle clocks, regulators, GPIOs, and other
 system resources required to power the sensor up and down. For drivers that
diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index e56b50b3f203..b22d1b075fd6 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -195,6 +195,10 @@ performed using the :c:func:`v4l2_async_unregister_subdev` call. Subdevices
 registered this way are stored in a global list of subdevices, ready to be
 picked up by bridge drivers.
 
+Note that all sensor initialisation has to complete before registering the async
+sub-device, including enabling runtime PM. This is because the sensor becomes
+accessible via the UAPI without further action by the sensor driver.
+
 Asynchronous sub-device notifiers
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.39.2

