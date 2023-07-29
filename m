Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6013767E42
	for <lists+linux-media@lfdr.de>; Sat, 29 Jul 2023 12:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbjG2KmW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jul 2023 06:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjG2KmV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jul 2023 06:42:21 -0400
Received: from mgamail.intel.com (unknown [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A916F3590
        for <linux-media@vger.kernel.org>; Sat, 29 Jul 2023 03:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690627340; x=1722163340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qFmp+7Top5s5+j5MHiM45tv473i7nnQlEXWxPdCq6f0=;
  b=Rube9Y3SFSMifhPck5H5dwmM3273N/gPYL7vA6rgnHiZL/gCGDvm1oxl
   e7CS/uSSQmRPk4Rg10Ze0RbcWas+v6qPbtUxjr+g7gE+gymQAoS9kdrwG
   DR1rxnz8hdGQ405yRWevStWYtUXdiKGFdT7j3rv02QKbw8e8VkuJbuqzX
   EM3y84uHuwYPyNqd8ueVxkZWqcxgzTkZ3dqAIlaIS3YlXOvRQK/1MPMvu
   k3tzq7a1vIQC+aQYYLsFUvOwGLnm3PXFIommhjp92DqK/NqeajuET84iw
   8hqmGtwPBsQWYd6iKfaFqBAV5JwCkmp/6UDHMuycwKf1D414t2h5/hlyb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="353658552"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="353658552"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 03:42:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="901568532"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="901568532"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 03:42:19 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id D23B211FACB;
        Sat, 29 Jul 2023 13:42:16 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qPhNc-004yyz-0Y;
        Sat, 29 Jul 2023 13:41:00 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hdegoede@redhat.com
Subject: [PATCH 2/2] media: Kconfig: ov5693: Correct CCI dependency
Date:   Sat, 29 Jul 2023 13:40:50 +0300
Message-Id: <20230729104050.1187715-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230729104050.1187715-1-sakari.ailus@linux.intel.com>
References: <20230729104050.1187715-1-sakari.ailus@linux.intel.com>
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

The Kconfig parts of the original patch converting the OV5693 to use V4L2
CCI was mis-merged. Correct this.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202307271639.6vSx9BOA-lkp@intel.com/
Fixes: 9f4204c422f6 ("media: ov5693: Convert to new CCI register access helpers")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index f3453a5da970..07cdf9590a14 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -426,6 +426,7 @@ config VIDEO_OV5675
 
 config VIDEO_OV5693
 	tristate "OmniVision OV5693 sensor support"
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5693 camera.
@@ -657,7 +658,6 @@ config VIDEO_DW9768
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
-	select V4L2_CCI_I2C
 	help
 	  This is a driver for the DW9768 camera lens voice coil.
 	  DW9768 is a 10 bit DAC with 100mA output current sink
-- 
2.39.2

