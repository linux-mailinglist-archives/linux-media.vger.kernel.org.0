Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A836525F27
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 12:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379136AbiEMJrS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 05:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355822AbiEMJrP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 05:47:15 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132832A7C22
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 02:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652435233; x=1683971233;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oIe1JJ2R0kGPilTCIE56pH2H3zQzrWWpQNjK7JPuSOc=;
  b=oI10nsgtala6Vcvk7tgJy/jBA0r2hq2ezOaTeUJIyV/KStFlrAsc3hyQ
   wEU/4upllNx2cegDBLj83tablxvc58pSVRUltbZ4bj5rMeB6m+1NpPzlI
   Tn5sod7ZPuAnbZdb0nnxgrbeITK9Lk7FQ4vdnX8jdxKIGCgNpvSI0xfIR
   MAMNhE/cu79ShR2XHWXlewX8hsSActtr/H9LAdFcxyqIb8D419p/dfXfA
   5xKXMFcx/AQHPa4mC7QvIuU51Btvh9+spGvwyGWjfCcBcPbKl+D5uH/Md
   HRgbNGn4CwrWIBk4ghGBsqpOAhIA7wS7rTUbiuX7ZSc0CONQs2LnfpwMJ
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="252312236"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="252312236"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 02:47:12 -0700
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="567131925"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 02:47:10 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 1CE7E2048D;
        Fri, 13 May 2022 12:47:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1npRt5-0000YN-G5; Fri, 13 May 2022 12:47:07 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl,
        Daniel Scally <djrscally@gmail.com>
Subject: [PATCH 1/1] ov7251: Fix multiple problems in s_stream callback
Date:   Fri, 13 May 2022 12:47:07 +0300
Message-Id: <20220513094707.2082-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The s_stream callback had several issues:

- If pm_runtime_get_sync() fails, the usage_count is not put.

- The mutex wasn't unlocked and the sensor wasn't suspended if
  s_stream(subdev, 1) failed.

Fixes: ("media: i2c: Add pm_runtime support to ov7251")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov7251.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 4867dc86cd2e4..603a4c7049e69 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1340,7 +1340,7 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
 	if (enable) {
 		ret = pm_runtime_get_sync(ov7251->dev);
 		if (ret < 0)
-			goto unlock_out;
+			goto err_power_down;
 
 		ret = ov7251_pll_configure(ov7251);
 		if (ret) {
@@ -1372,12 +1372,12 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
 		pm_runtime_put(ov7251->dev);
 	}
 
-unlock_out:
 	mutex_unlock(&ov7251->lock);
 	return ret;
 
 err_power_down:
-	pm_runtime_put_noidle(ov7251->dev);
+	pm_runtime_put(ov7251->dev);
+	mutex_unlock(&ov7251->lock);
 	return ret;
 }
 
-- 
2.30.2

