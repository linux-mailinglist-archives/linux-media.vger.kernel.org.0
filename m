Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2FD86D0689
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 15:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbjC3NZt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 09:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231698AbjC3NZr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 09:25:47 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF41B778
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 06:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680182726; x=1711718726;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OoIKXH0XxFY3mgbj/bPnHN9t8NphrPjsFwfQbr4oyjg=;
  b=W/PcaTHTV1DOwyarG8LXwSYBT6yK0NizP86/D/VeHIaS7HdECCwkVhhE
   eYUVUSzWdtRWp408lhEplDKBJeyPMPW9M7Cd+v0KSukh0pw2gDkd/WD7a
   GmInf7/4kRDq8MCjtFh4ReFvu2Ua0J0/DuYKDnmeCAlOyfgNgx0BZq4hm
   Vg0j07PivAcIsoV7lcZLzNddCKPjAvDYKgow9jAz/w84GHzRc6her769U
   u6iBLle8x1i4yL9IKS4+c8RPNLecTI33DdHcwj07GQdXIMZzCW7l9UqqI
   UkgLN2rCF0FXhDUmeJJ48WBcIsPVTWKb1nGPWQzWOc1HKtiMEqfjjW/W3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="368945589"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="368945589"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 06:25:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="634914338"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="634914338"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 06:25:24 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 45467122457;
        Thu, 30 Mar 2023 16:25:21 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1phsG9-00DiMN-BP; Thu, 30 Mar 2023 16:24:09 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     jacopo.mondi@ideasonboard.com
Subject: [PATCH v2 1/1] media: ov5670: Fix probe on ACPI
Date:   Thu, 30 Mar 2023 16:23:59 +0300
Message-Id: <20230330132359.3268738-1-sakari.ailus@linux.intel.com>
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

Use devm_clk_get_optional() to obtain NULL instead of -ENOENT.

Fixes: 8004c91e2095 ("media: i2c: ov5670: Use common clock framework")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
since v1:

- Use devm_clk_get_optional instead.

 drivers/media/i2c/ov5670.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index f79d908f4531b..c5e783a06f06c 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2660,7 +2660,7 @@ static int ov5670_probe(struct i2c_client *client)
 		goto error_print;
 	}
 
-	ov5670->xvclk = devm_clk_get(&client->dev, NULL);
+	ov5670->xvclk = devm_clk_get_optional(&client->dev, NULL);
 	if (!IS_ERR_OR_NULL(ov5670->xvclk))
 		input_clk = clk_get_rate(ov5670->xvclk);
 	else if (PTR_ERR(ov5670->xvclk) == -ENOENT)
-- 
2.30.2

