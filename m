Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D77E719A81
	for <lists+linux-media@lfdr.de>; Thu,  1 Jun 2023 13:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbjFALHe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jun 2023 07:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbjFALHd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jun 2023 07:07:33 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE337123
        for <linux-media@vger.kernel.org>; Thu,  1 Jun 2023 04:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685617651; x=1717153651;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TT1VfvYOSFv1x5VpN3BQdaL7f7R8hjYGqAcHfBkH+YU=;
  b=NffcfT66rkTyoa8R1FOllM0N2F7caBZWeefh21xUMyt/ebAbryGlY9zB
   b/3cG/FRERYzbvrSqxJIwL0smzbrxYZKSN4TsMCm6+rD9sXmEMvSDdE9N
   yv6ICpix0b0kf77abbRcMzeaf0k3ZGoTP7mfy3W53IMCuLK2asj1ZmV/7
   /bY2P7EDtl9d/Saubri55bgpvCcX8aG2KKqjBziAVpVd8v21ZfRPCv9eS
   YD5XZ5wqiKiK6rR3X6MvQAERE2gwiyV5a9wKBAJAU4DImHojxsBT7SdlT
   qE5WW3VWv6YVbhYFpZWYWT0YW00ybAHNNezyart96OtqAQZ8cmJkry/hX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="335144157"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="335144157"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 04:07:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="851636039"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="851636039"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 04:07:30 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id DCC181202B1;
        Thu,  1 Jun 2023 14:07:27 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q4g8q-00E6Un-Or; Thu, 01 Jun 2023 14:06:52 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl
Subject: [PATCH v2 1/1] media: tc358746: Address compiler warnings
Date:   Thu,  1 Jun 2023 14:06:42 +0300
Message-Id: <20230601110642.3361516-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Address these compiler warnings by initialising the m_best and p_best
values to 0 and 1 respectively (as latter is used as a divisor):

   drivers/media/i2c/tc358746.c: In function 'tc358746_find_pll_settings':
>> drivers/media/i2c/tc358746.c:817:13: warning: 'p_best' is used uninitialized
[-Wuninitialized]
     817 |         u16 p_best, p;
         |             ^~~~~~
>> drivers/media/i2c/tc358746.c:816:13: warning: 'm_best' is used uninitialized
[-Wuninitialized]
     816 |         u16 m_best, mul;
         |             ^~~~~~

The warnings may well be a false positive but it is difficult for a
compiler to find out whether that truly is the case.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202305301627.fLT3Bkds-lkp@intel.com/
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v1:

- Note that this may be a false positive.

 drivers/media/i2c/tc358746.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index ec1a193ba161a..25fbce5cabdaa 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -813,8 +813,8 @@ static unsigned long tc358746_find_pll_settings(struct tc358746 *tc358746,
 	u32 min_delta = 0xffffffff;
 	u16 prediv_max = 17;
 	u16 prediv_min = 1;
-	u16 m_best, mul;
-	u16 p_best, p;
+	u16 m_best = 0, mul;
+	u16 p_best = 1, p;
 	u8 postdiv;
 
 	if (fout > 1000 * HZ_PER_MHZ) {
-- 
2.30.2

