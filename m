Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E26A573D17
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 21:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbiGMTZl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 15:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbiGMTZk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 15:25:40 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8700C2C67E
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 12:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657740339; x=1689276339;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wwK0mStAy2Nk9wUn83nScx8BTvZ/RBS4QjRDdN6+IS8=;
  b=Znk6wy2Y027wAkWVVOkMw/l0QzaS9KEcM58BtXbA0JtbGCTCk+vkjyI9
   IWN+6dZzG+JMQMAzTJc/Zz5h8aUfqO7NIbtZdI26/d1ydq9EgZfE0ozNt
   K1/5dX5aaUlN9ZEHl/9gUssWXV9IT7H3KhDRmZm++CGLgPbkT+fQRjncj
   wJNukvguQdqYDs+DCJn2jUNodetTcs/5+Jl6UFpbF8drVQog0b/xGsEjJ
   yf+whpBedppfabasNEg/P4bEPbKi8JzYXIeuCsk91NzynqLiHl+K267KR
   Noy02Hxve7C0ghzZpBmqMuHsfQAeibOouQsymRsCyKIReNdMicCCH6HTg
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="284081492"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="284081492"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2022 12:25:39 -0700
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="628435127"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2022 12:25:37 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 9BE31200FD;
        Wed, 13 Jul 2022 22:25:35 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1oBhzQ-000vyF-Pd; Wed, 13 Jul 2022 22:25:40 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH 1/1] media: sunxi: Depend on GENERIC_PHY_MIPI_DPHY
Date:   Wed, 13 Jul 2022 22:25:40 +0300
Message-Id: <20220713192540.222794-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The sun6i-mipi-csi2 and sun6i-a83t-mipi-csi2 drivers depend on the generic
MIPI D-PHY support. Select it. This fixes a linking problem when either of
these drivers is enabled and GENERIC_PHY_MIPI_DPHY is disabled.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig      | 1 +
 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
index b1712f5873fd9..eb982466abd30 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
@@ -8,6 +8,7 @@ config VIDEO_SUN6I_MIPI_CSI2
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	select PHY_SUN6I_MIPI_DPHY
+	select GENERIC_PHY_MIPI_DPHY
 	select REGMAP_MMIO
 	help
 	   Support for the Allwinner A31 MIPI CSI-2 controller, also found on
diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig
index 5854f8388c92a..789d58ee12ea9 100644
--- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig
@@ -8,5 +8,6 @@ config VIDEO_SUN8I_A83T_MIPI_CSI2
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	select REGMAP_MMIO
+	select GENERIC_PHY_MIPI_DPHY
 	help
 	   Support for the Allwinner A83T MIPI CSI-2 controller and D-PHY.
-- 
2.30.2

