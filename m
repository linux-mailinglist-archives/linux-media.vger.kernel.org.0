Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59F797809AC
	for <lists+linux-media@lfdr.de>; Fri, 18 Aug 2023 12:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359826AbjHRKIE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Aug 2023 06:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376387AbjHRKHM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Aug 2023 06:07:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A89146A0
        for <linux-media@vger.kernel.org>; Fri, 18 Aug 2023 03:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692353165; x=1723889165;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XbikVz+P6ZW7j4iEprV33Nhu4+Z9m5AGySPzzs4cF8I=;
  b=egMWR39zRGs/0mw6x4p1yaxsBEWLRMe25rAo5KHE2qzGiJyltivLvHMA
   VeES9vqnPXNfubI1VMJJ2HivC3xjFa5jrBhgUvVE8V9PvtepmbtGCRIc7
   NzR2H12Dmv017eB3jM0wdEl1cbHbBO2TQj15iilFnLvXCk6rAnyiOY7OL
   Vz4hVmOgVxPqqtXUBxqXfWsThdGNQ1gml7s5x9hsMUXkacBpWjGheJSXD
   oK/xmqnxa5Wmkw+5XhwzVZJjrfn9cbDCafTb0thmbv2HKpfeKak1NJCVY
   MeaoezLt9Cay1H87z4/kwzgDU5bdACFv5nkefhMtZKldV3/S+XioCz01W
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="353368141"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="353368141"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 03:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="738073736"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="738073736"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 03:05:16 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id D9F2312035D;
        Fri, 18 Aug 2023 13:05:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qWwLT-00GD5P-20;
        Fri, 18 Aug 2023 13:04:43 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, wentong.wu@intel.com
Subject: [PATCH 1/1] media: pci: ivsc: Select build dependencies
Date:   Fri, 18 Aug 2023 13:04:33 +0300
Message-Id: <20230818100433.3863543-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Select MEDIA_CONTROLLER, VIDEO_V4L2_SUBDEV_API and V4L2_ASYNC as the IVSC
driver depends on all these.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308170227.ymiFlMbT-lkp@intel.com/
Fixes: 29006e196a56 ("media: pci: intel: ivsc: Add CSI submodule")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ivsc/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/pci/intel/ivsc/Kconfig b/drivers/media/pci/intel/ivsc/Kconfig
index 413053175df7..e9ecd0bd99bd 100644
--- a/drivers/media/pci/intel/ivsc/Kconfig
+++ b/drivers/media/pci/intel/ivsc/Kconfig
@@ -4,6 +4,9 @@
 config INTEL_VSC
 	tristate "Intel Visual Sensing Controller"
 	depends on INTEL_MEI && ACPI
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_ASYNC
 	help
 	  This adds support for Intel Visual Sensing Controller (IVSC).
 
-- 
2.39.2

