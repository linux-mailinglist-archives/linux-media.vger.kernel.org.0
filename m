Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6CA3715BB0
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 12:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjE3KZ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 06:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjE3KZh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 06:25:37 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D3001738
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 03:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685442217; x=1716978217;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EJ85U5OcjDDxtqXEwvMi9EnfSOII2jrAgXVr8Swk/kI=;
  b=HtawnYJpN7Njg2GPzo+/NvI1uk3QzRw68FCnA8JZD3I4PzHuV5M/3iYU
   twX5e0J3pCxatNBRu8q6HilTdyMEuhiUGmxvOuM6vS0kLn43q4DZE/XGJ
   VI8WPMQnXYJVqsfTo4owTizc5/Amb1rN1DC3X42LVBZ5gVQvEAafeQRsA
   84PX/4YJdsqsrINkE3WUQbroFV5IUMb1eYPI6w0aXm3yX8D2WIUCX1iCv
   otcy/dmBy/yPVQZYeDImPBkfpJ7xM/Dfp891MjJ9wzUel+1xMF/DRGnS/
   SSVxUrO+63z61WvOIWRQtZOjn8OoCqvgDSXu6OsKBvk0HOE5zm5lJLraT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="418358785"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="418358785"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 03:22:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="706369716"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="706369716"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 03:22:10 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 3CAC1120C29;
        Tue, 30 May 2023 13:22:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q3wTw-00C6zX-HK; Tue, 30 May 2023 13:21:36 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 1/1] media: tc358746: Address compiler warnings
Date:   Tue, 30 May 2023 13:21:26 +0300
Message-Id: <20230530102126.2886766-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
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

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202305301627.fLT3Bkds-lkp@intel.com/
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
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

