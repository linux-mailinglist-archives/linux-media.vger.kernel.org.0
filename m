Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0A18767F6F
	for <lists+linux-media@lfdr.de>; Sat, 29 Jul 2023 15:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjG2N2K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jul 2023 09:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjG2N2J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jul 2023 09:28:09 -0400
Received: from mgamail.intel.com (unknown [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 590EB3A96
        for <linux-media@vger.kernel.org>; Sat, 29 Jul 2023 06:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690637287; x=1722173287;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ozEeFfGkjJrNOeNw6xjgBdiU2XqRrAR4Kcvl9aeqUbY=;
  b=LI6QDqv9t8oWvuxv/0doy39bWLdoCEbgHYI10XL+gV6iSp9x23+cG3KU
   e9BeIpFgr4mpJGyZ++SYlj4pd/3wdw5WuYXqku7xr9si9SXvGdA6t61Xn
   PEFhf3wvH1Hghm/sYD/hPEVvMJwAU7xSXE7Ea3xlqP2MdkV/T90d2yzOC
   nCc99K7NcIBtZc0Qwm9/u/SZMQvJBKhwFTWerQATddcQI32wzYLCwCxwr
   MWJFOet0amQOrRvLnfty7ZskdpL06CnFwoS8hpC1Zdn8N42wIASCBRgV6
   LVHgRu/AHMAV0CCYAQlfFLWiPPIFPRQR+kdfQjAT1fl8dwFcOGw/tFMj2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="367647606"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="367647606"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 06:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="871123820"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 06:28:08 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id AB1EE11F863;
        Sat, 29 Jul 2023 16:28:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qPjy2-004z2v-2V;
        Sat, 29 Jul 2023 16:26:46 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 1/1] media: v4l: async: Avoid a goto in loop implementation
Date:   Sat, 29 Jul 2023 16:26:36 +0300
Message-Id: <20230729132636.1187965-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace a goto-based loop by a while loop.

Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index f465a0964adf..091e8cf4114b 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -820,20 +820,16 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 		if (!v4l2_dev)
 			continue;
 
-again:
-		asc = v4l2_async_find_match(notifier, sd);
-		if (!asc)
-			continue;
-
-		ret = v4l2_async_match_notify(notifier, v4l2_dev, sd, asc);
-		if (ret)
-			goto err_unbind;
-
-		ret = v4l2_async_nf_try_complete(notifier);
-		if (ret)
-			goto err_unbind;
-
-		goto again;
+		while ((asc = v4l2_async_find_match(notifier, sd))) {
+			ret = v4l2_async_match_notify(notifier, v4l2_dev, sd,
+						      asc);
+			if (ret)
+				goto err_unbind;
+
+			ret = v4l2_async_nf_try_complete(notifier);
+			if (ret)
+				goto err_unbind;
+		}
 	}
 
 	/* None matched, wait for hot-plugging */
-- 
2.39.2

