Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12009756CB1
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 21:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbjGQTEV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jul 2023 15:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbjGQTEV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jul 2023 15:04:21 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D2B1116
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 12:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689620659; x=1721156659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vUJgLVuefccyl5iWYmMG8BnGDe0LVE+4RXcXa9Iyzjc=;
  b=Sr/rl2mS67BbyjRWTFFn5x4YE2VOBkv1LC2z/zHhkLlPpfvkaroBPCMO
   QsPhCSkYOeVi6DuJxVGlIkUIbMwHvEIGrSPpHP2KBUKmsKc1ehq7OhUBo
   28i/TQQ/vKmhzjQ0huiEmqIF+9M6PlYuyMYLnoRUn8kvNpp7FYZgU/r2A
   gx0nlCN8aaC3h2lJcUMtv/cmnQMmflGwvRCV/V1IWH4PCa7YC19OmtxkD
   bc/U268PySR/QUGBnKDCpW56/GO30+kv9QPfeJo4nF+IhvDVohKzru2TX
   N/nADL4NZEbvlnfAVKs3S051+zwr10FwV7PgH4vZw+m/PpPh/V/mNiH23
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="369567822"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="369567822"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 12:04:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="673641217"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="673641217"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 12:04:17 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 09A5111FBBC;
        Mon, 17 Jul 2023 22:04:15 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qLTV8-004sCt-2O;
        Mon, 17 Jul 2023 22:03:18 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH v2 2/2] media: MAINTAINERS: Split sensors and lens drivers, add documentation
Date:   Mon, 17 Jul 2023 22:03:08 +0300
Message-Id: <20230717190308.1161664-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230717190308.1161664-1-sakari.ailus@linux.intel.com>
References: <20230717190308.1161664-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Split lens drivers from camera sensor into a new section. This makes it
easier to maintain the list.

Also add documentation related files under the camera sensor entry. Add
the word "CAMERA" to the subject as well since there are many other kinds
of sensors.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5d00c879ea5ae..430c0a1762d3a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22289,10 +22289,20 @@ F:	drivers/media/v4l2-core/v4l2-fwnode.c
 F:	include/media/v4l2-async.h
 F:	include/media/v4l2-fwnode.h
 
-V4L2 SENSOR AND LENS DRIVERS
+V4L2 LENS DRIVERS
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	drivers/media/i2c/dw*
+F:	drivers/media/i2c/ak*
+F:	drivers/media/i2c/lm*
+
+V4L2 CAMERA SENSOR DRIVERS
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/driver-api/media/camera-sensor.rst
+F:	Documentation/driver-api/media/tx-rx.rst
 F:	drivers/media/i2c/ar*
 F:	drivers/media/i2c/hi*
 F:	drivers/media/i2c/imx*
@@ -22301,9 +22311,6 @@ F:	drivers/media/i2c/og*
 F:	drivers/media/i2c/ov*
 F:	drivers/media/i2c/s5*
 F:	drivers/media/i2c/st-vgxy61.c
-F:	drivers/media/i2c/dw*
-F:	drivers/media/i2c/ak*
-F:	drivers/media/i2c/lm*
 
 VF610 NAND DRIVER
 M:	Stefan Agner <stefan@agner.ch>
-- 
2.39.2

