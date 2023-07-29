Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56820767E44
	for <lists+linux-media@lfdr.de>; Sat, 29 Jul 2023 12:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbjG2KmX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jul 2023 06:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbjG2KmW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jul 2023 06:42:22 -0400
Received: from mgamail.intel.com (unknown [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 837C43598
        for <linux-media@vger.kernel.org>; Sat, 29 Jul 2023 03:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690627341; x=1722163341;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=y8KfxXeSfVy6jj0mQyrFTO6bNANEDqbw6U5JjH7p1SM=;
  b=OKvuo96vOXZOksVY6oWlD4qrVedowMJgXS8aZxzDpYvs/HIPSeF5PISC
   vOCq+FILPqKlmOhp1NAV1oR+5BEsEAuJg2wj6TTzflfJPhV75xvu8HU7E
   s1PBc8ONZBW9zFGcRHDt9BeyyyPF7EOT3gWHtG1o8J7QQ835SvAAROcmj
   V8wm6SqnaZw5oUZ0JD/lPH3ASpblH1AUnoaFIXqTCoGr/vbmlkHxI5XOI
   CJckam1vTzQEI9zPcmDgYCT0UlJkhgvZ95rd6PQqYj+Ybl9js+u3mn7ce
   CH1il8Y81sFaJa9Ar4O1dFXQNJ71PHgCKi+0beBCa1rtDwO8PSdcCMzII
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="353658555"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="353658555"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 03:42:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="901568534"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="901568534"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 03:42:19 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id D0D3911F9B6;
        Sat, 29 Jul 2023 13:42:16 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qPhNc-004yyv-0R;
        Sat, 29 Jul 2023 13:41:00 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hdegoede@redhat.com
Subject: [PATCH 1/2] media: Kconfig: imx290: Correct CCI dependency
Date:   Sat, 29 Jul 2023 13:40:49 +0300
Message-Id: <20230729104050.1187715-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Kconfig parts of the original patch converting the IMX290 to use V4L2
CCI was mis-merged. Correct this.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202307271517.dPa1bTSi-lkp@intel.com/
Fixes: be02a09c84ad ("media: imx290: Convert to new CCI register access helpers")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 24cbf35c6fe1..f3453a5da970 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -125,6 +125,7 @@ config VIDEO_IMX274
 config VIDEO_IMX290
 	tristate "Sony IMX290 sensor support"
 	select REGMAP_I2C
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX290 camera sensor.
@@ -934,7 +935,6 @@ config VIDEO_ADV748X
 	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_I2C
 	select V4L2_FWNODE
-	select V4L2_CCI_I2C
 	help
 	  V4L2 subdevice driver for the Analog Devices
 	  ADV7481 and ADV7482 HDMI/Analog video decoders.
-- 
2.39.2

