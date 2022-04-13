Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 244C54FF7AC
	for <lists+linux-media@lfdr.de>; Wed, 13 Apr 2022 15:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233808AbiDMNer (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Apr 2022 09:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233587AbiDMNep (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Apr 2022 09:34:45 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A903153A48
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 06:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649856744; x=1681392744;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FX2PBFI7OvsVgR+UCJ4ISAf/jLYZYXI6xy7eUbHOjRQ=;
  b=CUYj3gC1iTnorM4DZ9CvzR6PiidSP/VHwocwknwZUL5Ipni7BVzb+vbE
   5HuPsZs3mPzL63QJs7N6jQ4VeBiCYRhl6BslkXsvTIMvUrB9drgH91rAO
   X3IwHRCx9ADE58d3woJxXcKBCmVi0GDSo1TjQF3aMemgN4qbI+r4wREac
   PrqYI8rZHfE2Nq0GruF+vm39icllx2iH3q9Z+XfWW7GQtEUf1WQVXjD2Q
   gFI+9NTCGtcyH9VbYHf718NtTb5s2tL7MDAOr/VcyrWjuMGFHdVYx6Ql7
   envFTBbvU0ahje9SiQFekj3aORjvLKL5gJkIKywTi/Zadh6fMsBPvVnl0
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="262841785"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="262841785"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 06:32:15 -0700
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="590751896"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 06:32:14 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id D273B2030F;
        Wed, 13 Apr 2022 16:32:11 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1ned7T-002byc-T7; Wed, 13 Apr 2022 16:33:15 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     tfiga@chromium.org, bingbu.cao@intel.com
Subject: [PATCH 1/1] Revert "media: dw9768: activate runtime PM and turn off device"
Date:   Wed, 13 Apr 2022 16:33:15 +0300
Message-Id: <20220413133315.622593-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This reverts commit c09d776eaa060534a1663e3b89d842db3e1d9076.

Revert the commit as it breaks runtime PM support on OF based systems.
More fixes to the driver are needed.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/dw9768.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
index 65c6acf3ced9a..c086580efac78 100644
--- a/drivers/media/i2c/dw9768.c
+++ b/drivers/media/i2c/dw9768.c
@@ -469,11 +469,6 @@ static int dw9768_probe(struct i2c_client *client)
 
 	dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
 
-	/*
-	 * Device is already turned on by i2c-core with ACPI domain PM.
-	 * Attempt to turn off the device to satisfy the privacy LED concerns.
-	 */
-	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 	if (!pm_runtime_enabled(dev)) {
 		ret = dw9768_runtime_resume(dev);
@@ -488,7 +483,6 @@ static int dw9768_probe(struct i2c_client *client)
 		dev_err(dev, "failed to register V4L2 subdev: %d", ret);
 		goto err_power_off;
 	}
-	pm_runtime_idle(dev);
 
 	return 0;
 
-- 
2.30.2

