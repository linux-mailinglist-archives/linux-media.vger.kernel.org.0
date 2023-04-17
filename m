Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8AE46E4408
	for <lists+linux-media@lfdr.de>; Mon, 17 Apr 2023 11:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbjDQJhO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Apr 2023 05:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbjDQJgx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Apr 2023 05:36:53 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 201263AA1
        for <linux-media@vger.kernel.org>; Mon, 17 Apr 2023 02:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681724185; x=1713260185;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BO+0/OblhrWzXRgNE44YC4DeSUI3qFYSbtiSH0s9cWo=;
  b=UmH13v4xkUuIKIjiCBcBDzLGy4Znblp8RPpAi1U123S5dkayPiiUaUIu
   qQXLLU4rRUHVyOBGlPNPkTpaMBkdFQ3uK5Fk468z4o+/+m0sSjOz3JLfT
   zxlO+XXhEtz32SrM2TObc/JfLftIqgb6J6HyYMhlo+hn1D3Lfuk3k6kHD
   wcXLnyk4QHKdBYtXs4Ff/9If/3OSQsflm0rbYV10MHn3aO8YBvsY3pkA1
   I6BPD+qf+jaeDhaDZUY4WmolU1v6sOV6/0rbH8zAIaD8OQgnA8Ag4fIrO
   XFdPlGw2dq9jT9jmlbm7TLasRA2YeXrvCwiiEw4R3Hg7DPS1iGYcZRV/p
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="333643566"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="333643566"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 02:31:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="640898784"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="640898784"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 02:31:53 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id A910612227A;
        Mon, 17 Apr 2023 12:31:50 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1poLBZ-00Ez4W-L9; Mon, 17 Apr 2023 12:30:09 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     bingbu.cao@intel.com
Subject: [PATCH 1/1] media: ipu3-cio2: Fix container_of() macro wrapper arguments
Date:   Mon, 17 Apr 2023 12:29:59 +0300
Message-Id: <20230417092959.3571307-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The argument of the to_sensor_asd() is called the same as the field name
for the container_of() macro, so it only works if the argument name is
"asd". Fix it.

Also switch to container_of_const().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index fa53d0835c89c..39ad1309a61b5 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1374,7 +1374,8 @@ struct sensor_async_subdev {
 	struct csi2_bus_info csi2;
 };
 
-#define to_sensor_asd(asd)	container_of(asd, struct sensor_async_subdev, asd)
+#define to_sensor_asd(__asd)	\
+	container_of_const(__asd, struct sensor_async_subdev, asd)
 
 /* The .bound() notifier callback when a match is found */
 static int cio2_notifier_bound(struct v4l2_async_notifier *notifier,
-- 
2.30.2

