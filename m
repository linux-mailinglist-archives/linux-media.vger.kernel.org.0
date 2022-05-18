Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABB4D52BF54
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 18:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239589AbiERPyF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 11:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239620AbiERPyD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 11:54:03 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73F491CA079
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 08:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652889242; x=1684425242;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FAUHasJ7dKwSWlWl/MAFHH6bLU8NqhHAULwosmHvZBI=;
  b=BsqjgxDSkrmXRGu8jSjejztZliWQhZdsqseRN2MAlg3+oKEtC8v1pxNr
   +bzoUkJ+kai+Y/d294ovVLZ5ur0gs2spTimbg9SsLNcHg2zaXuTYZ+G9x
   5k9vyQUzsl2N4Q7ZWWDGMbolVoH84b5cBKtVpighR9k+tP2dhXtKpcYDa
   b6EU7Lswvy0zIUCM5P73wtvuLQruNN70pDF9zOHj8BWxZTa/fMglphiZE
   fs6R4H0uX85UU/OK5y4yruqWAkEicl/Mu0lKtefnpYEGmTw8jMWshMZXJ
   4QQPhIKigTOFm+FPEADhVjRmy3jE+MKaQxXFG7cJsykNR2y89sJ5dGPv0
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="271868736"
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; 
   d="scan'208";a="271868736"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2022 08:54:02 -0700
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; 
   d="scan'208";a="817501913"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2022 08:54:00 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 3E2D720387;
        Wed, 18 May 2022 18:53:58 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1nrM00-0003Lw-Sm; Wed, 18 May 2022 18:54:08 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl,
        Daniel Scally <djrscally@gmail.com>
Subject: [PATCH v2 1/1] ov7251: Fix multiple problems in s_stream callback
Date:   Wed, 18 May 2022 18:54:08 +0300
Message-Id: <20220518155408.12843-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The s_stream callback had several issues:

- If pm_runtime_get_sync() fails, the usage_count is not put.

- The sensor wasn't suspended if s_stream(subdev, 1) failed.

Fix this.

Fixes: ("media: i2c: Add pm_runtime support to ov7251")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov7251.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 0e7be15bc20a7..603a4c7049e69 100644
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
@@ -1372,12 +1372,11 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
 		pm_runtime_put(ov7251->dev);
 	}
 
-unlock_out:
 	mutex_unlock(&ov7251->lock);
 	return ret;
 
 err_power_down:
-	pm_runtime_put_noidle(ov7251->dev);
+	pm_runtime_put(ov7251->dev);
 	mutex_unlock(&ov7251->lock);
 	return ret;
 }
-- 
2.30.2

