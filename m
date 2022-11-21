Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 043D6632B16
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 18:34:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbiKURen (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 12:34:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbiKURel (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 12:34:41 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF49CD968
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 09:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669052080; x=1700588080;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M8teOk2/o8bj6n8UYd/cKGpwKm6Q2865nrCnvZIw7Ms=;
  b=FwEp+GiK0NXgcXNheuv/c1jHCAwpRRQqgtIgoRVd/f1SzUww3fQjpL+c
   Xu9+v49Kl6w6R88NLuzrVW9Ews7rNMAgnUB9nDVtR0xviC7jZiZMP1kxa
   07KrB0n5uc4qVkKdQerdsoPj0ELg2T2t5HJpH4TJph7GkXQWjtl+R140/
   1m8h7F8COwwkqshki9mKHwBbsrQx0r0qqLWNYIHEoYxnnQTaxNBt/KCVC
   pYFtCVKP9P9QVEDMNVVZYV93mTl+5TYWWvYMy3zLu8DW1+n4wWPK3aQP7
   UkKv9HzcHhihzDgmrc/TnGYrDV59rgQ/crdP1rBvcQJzROTShqXDa8VMI
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="315438010"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; 
   d="scan'208";a="315438010"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 09:34:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="618900724"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; 
   d="scan'208";a="618900724"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 09:34:39 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 9396F20116;
        Mon, 21 Nov 2022 19:34:36 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1oxAh3-0006Jv-Fj; Mon, 21 Nov 2022 19:34:53 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Shawn Tu <shawnx.tu@intel.com>
Subject: [PATCH 1/1] ov08x40: remove() now returns void
Date:   Mon, 21 Nov 2022 19:34:53 +0200
Message-Id: <20221121173453.24250-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The return type of the driver's remove() callback is now void. This driver
got merged while the return type got changed tree-wide. Fix this.

Fixes: 38fc5136ac16 ("media: i2c: Add ov08x40 image sensor driver")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov08x40.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index b4ade17a83f5e..72ae7fba94eb0 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -3281,7 +3281,7 @@ static int ov08x40_probe(struct i2c_client *client)
 	return ret;
 }
 
-static int ov08x40_remove(struct i2c_client *client)
+static void ov08x40_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct ov08x40 *ov08x = to_ov08x40(sd);
@@ -3292,8 +3292,6 @@ static int ov08x40_remove(struct i2c_client *client)
 
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
-
-	return 0;
 }
 
 static const struct dev_pm_ops ov08x40_pm_ops = {
-- 
2.30.2

