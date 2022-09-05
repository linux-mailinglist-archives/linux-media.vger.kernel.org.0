Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D97C45ACF6E
	for <lists+linux-media@lfdr.de>; Mon,  5 Sep 2022 12:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237191AbiIEKAb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Sep 2022 06:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237090AbiIEKA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Sep 2022 06:00:26 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369C740E12
        for <linux-media@vger.kernel.org>; Mon,  5 Sep 2022 03:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662372023; x=1693908023;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=L9J/4sjFK7hEHQcooQAP4m9upW9xWShMJzoNhfJzIgw=;
  b=EEBldMfAMzAyZJlZCHVY4iTepb1RYaHrJ8aFHMLmxdh8hQtjU2h4s77A
   XN9UI+iSgbqsJ49nWBsBJQdyyod6q/lCPhnbSHYhq51enafxMlBx13tKN
   vREFnHIg2ibK4MhKQ5PlyWUFTK/4gX7vry4Ni46WcG2VrcUF6E9BpBvFb
   JMqAY8iQb4SL7TZMtnKn7ZFQWtXSbzfS5KBAobDAWauSZ1SlZ+43vUnCv
   X5XOJweRLwhPPcJqwZ27lfs+OM9lhq/qkiOawKALe0mopOpERzEzsmlg4
   6p6SpYLJl73286JsmBi+HsfHepHHDDyeY/5CBN0KmFnRJFbE+YcKtDYsY
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="296357875"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="296357875"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 03:00:20 -0700
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="643747365"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 03:00:19 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 4989E202BE;
        Mon,  5 Sep 2022 13:00:17 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1oV8uV-00Dfv4-0Z; Mon, 05 Sep 2022 13:00:55 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 1/1] sun6i-mipi-csi2: Depend on PHY_SUN6I_MIPI_DPHY
Date:   Mon,  5 Sep 2022 13:00:54 +0300
Message-Id: <20220905100054.3259357-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PHY_SUN6I_MIPI_DPHY is not a freely selectable option and so may not
always be available. Depend on it instead.

Fixes: 94d7fd9692b5 ("media: sunxi: Depend on GENERIC_PHY_MIPI_DPHY")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
index eb982466abd30..4d072abdfb705 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
@@ -4,10 +4,10 @@ config VIDEO_SUN6I_MIPI_CSI2
 	depends on V4L_PLATFORM_DRIVERS && VIDEO_DEV
 	depends on ARCH_SUNXI || COMPILE_TEST
 	depends on PM && COMMON_CLK
+	depends on PHY_SUN6I_MIPI_DPHY
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
-	select PHY_SUN6I_MIPI_DPHY
 	select GENERIC_PHY_MIPI_DPHY
 	select REGMAP_MMIO
 	help
-- 
2.30.2

