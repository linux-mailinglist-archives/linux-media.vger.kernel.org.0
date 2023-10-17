Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 625AA7CBD53
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 10:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232644AbjJQI07 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 04:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjJQI05 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 04:26:57 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 890BB93
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 01:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697531216; x=1729067216;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=240Q3u3Neqa/4tHMjpfgT1f/zP4Lqh96Z9t6wEeOKXI=;
  b=dofQIVw20eazxonXxjaGgA8sVw+fBGyQW0Yp/ZvFrvZdbDMc0OImztUu
   LcGKFn56dzAk+v/+qWcSQDeRCiqOw/s7apawi54onbnvmd81YIyUJ6BUB
   34Tn17fmUnt9vNUBlPXjeNrQkrnVGt3XrB2Bx+/0pVnTEyaY8lq67DQ+M
   WUgGwewoQZoCBP0pn/j86rZn5ooJDRQ7arQC9maEDkg2IX5RBv67rGt6r
   VNeodHzqoPFq1xg/SKQdBisiIQwSHsTiZ4z3W9f3daBDM+UkGFDfNfVnU
   Ehl3XE8ukk4+12QbuFM48XNt2nG+qG1U7QNLfP5D++MoPYRw5qw/Yicl+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="416811606"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="416811606"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 01:26:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="1003272047"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="1003272047"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 01:26:55 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id C71F711F89D
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 11:26:52 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qsfOy-001orR-1A
        for linux-media@vger.kernel.org;
        Tue, 17 Oct 2023 11:26:08 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: ccs: Ensure control handlers have been set up after probe
Date:   Tue, 17 Oct 2023 11:25:58 +0300
Message-Id: <20231017082558.433829-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the sensor remains powered on after probe when it is needed again and
the runtime PM usage_count is incremented, the control handler setup for
neither control handler is run.

As this is, in most cases, a needless operation in probe, track the status
of sensor power handling after probe and set up control handlers even if
the device was already active right after probe.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 5 ++++-
 drivers/media/i2c/ccs/ccs.h      | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 12e6f0a26fc8..31769ff95d67 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1878,9 +1878,11 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
 		goto error;
 
 	/* Device was already active, so don't set controls */
-	if (rval == 1)
+	if (rval == 1 && !sensor->handler_setup_needed)
 		return 0;
 
+	sensor->handler_setup_needed = false;
+
 	/* Restore V4L2 controls to the previously suspended device */
 	rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->ctrl_handler);
 	if (rval)
@@ -3532,6 +3534,7 @@ static int ccs_probe(struct i2c_client *client)
 
 	sensor->streaming = false;
 	sensor->dev_init_done = true;
+	sensor->handler_setup_needed = true;
 
 	rval = ccs_write_msr_regs(sensor);
 	if (rval)
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 9c3587b2fbe7..2c013d96adcc 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -236,6 +236,7 @@ struct ccs_sensor {
 
 	bool streaming;
 	bool dev_init_done;
+	bool handler_setup_needed;
 	u8 compressed_min_bpp;
 
 	struct ccs_module_info minfo;
-- 
2.39.2

