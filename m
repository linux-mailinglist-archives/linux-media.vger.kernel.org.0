Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB4572E8D7
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 18:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234413AbjFMQw0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 12:52:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234509AbjFMQwV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 12:52:21 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA9219BF
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 09:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686675139; x=1718211139;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ujmXU585GqZM/pEJH2BNE4vA/9et5/zfhUp+xGGEBls=;
  b=kRzhYE6NtQETcC9mAoIzgyIyfSJYYxFkDD/v6F6311lQhMyV28vggBDA
   3t3d0sM//U3EMNZPicjqKYsQSfUNUNimIqKnDjJa/vYvmn/ep7AbMe/E7
   GHRF6bGj8KmJD3MTPQa8DGQcZPjtWvm+0uxkZmgVZHu46WbuKT+UIGb0n
   R2vft3Luazqti8HXbVlaP/tmouflzn7rslkA8KXdDFDwdMQLaZYNWYxlq
   N3FdGPXYhXJTlKH1SMmiQHL2hhMJa/Nt7cazgVJq0RCgUWRWD4ZIDXwvR
   +0iaTuqOKzxRyQJKLRSYJ5PnDqYEPON8X5syr8DCrHFIFRsrQ9T3eQAZB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="343082622"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="343082622"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 09:52:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="856175851"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="856175851"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 09:52:17 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 16C3B120C1C;
        Tue, 13 Jun 2023 19:52:15 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q97El-000T6c-Ce; Tue, 13 Jun 2023 19:51:19 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH 1/1] media: staging: atomisp: select V4L2_FWNODE
Date:   Tue, 13 Jun 2023 19:51:09 +0300
Message-Id: <20230613165109.111837-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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

Select V4L2_FWNODE as the driver depends on it.

Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Fixes: aa31f6514047 ("media: atomisp: allow building the driver again")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/atomisp/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/media/atomisp/Kconfig
index c9bff98e5309a..e9b168ba97bf1 100644
--- a/drivers/staging/media/atomisp/Kconfig
+++ b/drivers/staging/media/atomisp/Kconfig
@@ -13,6 +13,7 @@ config VIDEO_ATOMISP
 	tristate "Intel Atom Image Signal Processor Driver"
 	depends on VIDEO_DEV && INTEL_ATOMISP
 	depends on PMIC_OPREGION
+	select V4L2_FWNODE
 	select IOSF_MBI
 	select VIDEOBUF2_VMALLOC
 	select VIDEO_V4L2_SUBDEV_API
-- 
2.30.2

