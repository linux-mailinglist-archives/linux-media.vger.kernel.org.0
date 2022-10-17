Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B85B2600CDA
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 12:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbiJQKu3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 06:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbiJQKu2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 06:50:28 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BC44578A6
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 03:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666003827; x=1697539827;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YbOkvYQsW6PZagmDC7OK7DxiFj39y/xfaq0GxBZAnLM=;
  b=LzAyPOlitzS3mpYyTbY4fj3hRDVkFcd6vKJWga/6gmhLDLXFfAb3gi8Y
   eqXxLfmyyhJZEZF7T2xtpj7pLSYPobudqk1fIa1mBnHmLYRjboNN7B3jt
   gslpA6ED53+Q0MryhcopAvILpvUdcphaAI9K/WcVBSc4tSkjc+NaKc6BK
   SiDppzqVcS8CrF+keAGLRW7tYdDjfD+7a8LKeyU/a5tU+rKqUNcjlX6Lw
   FU7xxcGRG8DHidjCNIg3AL0kHSTw25b1R/xZBFOrudn9PKW2LEzFZ/aZE
   7p/mQkby32rP507DwqxkVUaUF0rfnId048eP+Vm/R1LDecT3DBiJFG4NM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="304505419"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; 
   d="scan'208";a="304505419"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2022 03:50:26 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="803307511"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; 
   d="scan'208";a="803307511"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2022 03:50:25 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 3AE4A20310;
        Mon, 17 Oct 2022 13:50:23 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1okNhc-000FGx-EA; Mon, 17 Oct 2022 13:50:36 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Bingbu Cao <bingbu.cao@linux.intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: [PATCH 1/1] dw9768: Enable low-power probe on ACPI
Date:   Mon, 17 Oct 2022 13:50:36 +0300
Message-Id: <20221017105036.58662-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for low-power probe to the driver. Also fix runtime PM API
usage in the driver.

Much of the hassle comes from different factors affecting device power
states during probe for ACPI and DT.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Fixes: 859891228e56 ("media: i2c: dw9768: Add DW9768 VCM driver")
---
Hi folks,

I think I don't have the hardware so this is untested (apart from
compiling). Testing would be appreciated.

Much of the ugliness comes from having to test between DT and ACPI as DT
has no means to tell the device should not be powered on during probe. To
be added once someone needs it I guess.

 drivers/media/i2c/dw9768.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
index c086580efac78..60ae0adf51744 100644
--- a/drivers/media/i2c/dw9768.c
+++ b/drivers/media/i2c/dw9768.c
@@ -414,6 +414,7 @@ static int dw9768_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct dw9768 *dw9768;
+	bool full_power;
 	unsigned int i;
 	int ret;
 
@@ -469,13 +470,23 @@ static int dw9768_probe(struct i2c_client *client)
 
 	dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
 
+	/*
+	 * Figure out whether we're going to power up the device here. Generally
+	 * this is done if CONFIG_PM is disabled in a DT system or the device is
+	 * to be powered on in an ACPI system. Similarly for power off in
+	 * remove.
+	 */
 	pm_runtime_enable(dev);
-	if (!pm_runtime_enabled(dev)) {
+	full_power = (is_acpi_node(dev_fwnode(dev)) &&
+		      acpi_dev_state_d0(dev)) ||
+		     (is_of_node(dev_fwnode(dev)) && !pm_runtime_enabled(dev));
+	if (full_power) {
 		ret = dw9768_runtime_resume(dev);
 		if (ret < 0) {
 			dev_err(dev, "failed to power on: %d\n", ret);
 			goto err_clean_entity;
 		}
+		pm_runtime_set_active(dev);
 	}
 
 	ret = v4l2_async_register_subdev(&dw9768->sd);
@@ -484,14 +495,17 @@ static int dw9768_probe(struct i2c_client *client)
 		goto err_power_off;
 	}
 
+	pm_runtime_idle(dev);
+
 	return 0;
 
 err_power_off:
-	if (pm_runtime_enabled(dev))
-		pm_runtime_disable(dev);
-	else
+	if (full_power) {
 		dw9768_runtime_suspend(dev);
+		pm_runtime_set_suspended(dev);
+	}
 err_clean_entity:
+	pm_runtime_disable(dev);
 	media_entity_cleanup(&dw9768->sd.entity);
 err_free_handler:
 	v4l2_ctrl_handler_free(&dw9768->ctrls);
@@ -503,14 +517,17 @@ static int dw9768_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct dw9768 *dw9768 = sd_to_dw9768(sd);
+	struct device *dev = &client->dev;
 
 	v4l2_async_unregister_subdev(&dw9768->sd);
 	v4l2_ctrl_handler_free(&dw9768->ctrls);
 	media_entity_cleanup(&dw9768->sd.entity);
-	pm_runtime_disable(&client->dev);
-	if (!pm_runtime_status_suspended(&client->dev))
-		dw9768_runtime_suspend(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	if ((is_acpi_node(dev_fwnode(dev)) && acpi_dev_state_d0(dev)) ||
+	    (is_of_node(dev_fwnode(dev)) && !pm_runtime_enabled(dev))) {
+		dw9768_runtime_suspend(dev);
+		pm_runtime_set_suspended(dev);
+	}
+	pm_runtime_disable(dev);
 
 	return 0;
 }
-- 
2.30.2

