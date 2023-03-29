Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7F996CECC1
	for <lists+linux-media@lfdr.de>; Wed, 29 Mar 2023 17:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbjC2PXL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Mar 2023 11:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbjC2PXK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Mar 2023 11:23:10 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 218291995
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 08:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680103388; x=1711639388;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Rt94+HvVbY+DTDFA+AEuOKciXmzngbz4PUourZhIqa4=;
  b=NdjJ9toRIROdseyeMClHrK7DxasRmhAwWSNBuof98ck/Cgh+BTCsezYI
   bH01IeCqT7TfOwVUnu1FKNkpeRJmYqobqHwGOVcMf2Wsp5gwyRdkLQyx9
   CkejC8OpVw1WDGiGmJfSSNfO8wk/0eJUkTpVA49zenKUTvuBiavF7brQj
   pjTJoHlAnPth0pSdSZBhLjCG/GjJHS55qGRn/CeghDW4scOOBNBeHf28p
   6aNzW5B402pLkir8AjuuQqvwXshteZSCQcYcb8NYlPaBqN7NlXPFnmnVo
   nGntj2KDaqRbmy5CACfXhRLsQqYUc5DcR/DWTZID9TvIrpNt21htAvu3z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="368679587"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="368679587"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 08:22:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="808270510"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="808270510"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 08:22:14 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 4BAA51224D2;
        Wed, 29 Mar 2023 18:22:11 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     jacopo.mondi@ideasonboard.com
Subject: [PATCH 1/1] media: ov5670: Fix probe on ACPI
Date:   Wed, 29 Mar 2023 18:22:10 +0300
Message-Id: <20230329152210.1554736-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

devm_clk_get() will return either an error or NULL, which the driver
handles, continuing to use the clock of reading the value of the
clock-frequency property.

However, the value of ov5670->xvclk is left as-is and the other clock
framework functions aren't capable of handling error values.

Assign ov5670->xvclk to NULL if the clock cannot be found (apart from probe
deferral case).

Fixes: 8004c91e2095 ("media: i2c: ov5670: Use common clock framework")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov5670.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index f79d908f4531..50c73ad86e21 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2661,14 +2661,16 @@ static int ov5670_probe(struct i2c_client *client)
 	}
 
 	ov5670->xvclk = devm_clk_get(&client->dev, NULL);
-	if (!IS_ERR_OR_NULL(ov5670->xvclk))
+	if (!IS_ERR_OR_NULL(ov5670->xvclk)) {
 		input_clk = clk_get_rate(ov5670->xvclk);
-	else if (PTR_ERR(ov5670->xvclk) == -ENOENT)
+	} else if (PTR_ERR(ov5670->xvclk) == -ENOENT) {
 		device_property_read_u32(&client->dev, "clock-frequency",
 					 &input_clk);
-	else
+		ov5670->xvclk = NULL;
+	} else {
 		return dev_err_probe(&client->dev, PTR_ERR(ov5670->xvclk),
 				     "error getting clock\n");
+	}
 
 	if (input_clk != OV5670_XVCLK_FREQ) {
 		dev_err(&client->dev,
-- 
2.30.2

