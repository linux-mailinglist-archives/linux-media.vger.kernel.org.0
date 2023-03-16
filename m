Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55D5B6BCCB9
	for <lists+linux-media@lfdr.de>; Thu, 16 Mar 2023 11:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbjCPK0Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Mar 2023 06:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231290AbjCPKZy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Mar 2023 06:25:54 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B92A95A1A4
        for <linux-media@vger.kernel.org>; Thu, 16 Mar 2023 03:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678962340; x=1710498340;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1i7XezwgB3h0wbYD3ftMKoam0rY2DAj2DouV5mn33Zo=;
  b=WfTH8rbf7FLE9oEuwD/5dj26+r+Z55vbSIvOyakUoZVlN8Ki5D2vYq1U
   vPR5/vZHrsLcgSa9Dq2v9IFDh+HdeRYAnnErr04i3VsMDZMSbATZgLnp/
   /DVa4f0hH5uWQ5i7gg3MeXRvcTweDlBDRCDV+gtzu70ZoDhOfgl7T5E/S
   aY6bTwA/foXkurOYHJianfjH7KqTCZH0T1T3lw8CECmVGgUGBpsrqDCHL
   kxICNbCIXZ1Y/ULKTcdOb6FkwFhcqONlGzkWJdB5HZe4ewDyCsKrYskTx
   24bfYlujuhGwF4EmVyzOjb3vwDTKprOpraqk3swmcC4Sb1172IlDJC4LC
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="317599254"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="317599254"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 03:25:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="673104375"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="673104375"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 03:25:09 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 04ED21218FF;
        Thu, 16 Mar 2023 12:25:07 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pckmP-00GW6D-PC; Thu, 16 Mar 2023 12:24:17 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Luca Weiss <luca@z3ntu.xyz>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 1/1] ov2685: Select VIDEO_V4L2_SUBDEV_API
Date:   Thu, 16 Mar 2023 12:24:07 +0200
Message-Id: <20230316102407.3936592-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VIDEO_V4L2_SUBDEV_API is required for v4l2_subdev_get_pad_*() functions.
Select it.

Fixes: ("media: i2c: ov2685: Add .get_selection() support")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index c3d5952ca27e6..f07fc7ea84f1a 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -462,6 +462,7 @@ config VIDEO_OV2685
 	tristate "OmniVision OV2685 sensor support"
 	depends on VIDEO_DEV && I2C
 	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
-- 
2.30.2

