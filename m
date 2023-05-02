Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70D366F444F
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 14:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233920AbjEBMyN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 May 2023 08:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233513AbjEBMyL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 May 2023 08:54:11 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03E83CE
        for <linux-media@vger.kernel.org>; Tue,  2 May 2023 05:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683032050; x=1714568050;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2X6TGfjfdebEXPi36TQE8UWih7e+tQJ9YVWejKLc/ck=;
  b=RfbPO6nfkwV3b6+SxLC6PJwSmpwx+6egbgSKk5G8sK/TT/yC4cGA0xf9
   QZfnaCsMkzYz6NFwI+SPSBbmimOmT6kbaZF4+gipM3/Jz7Ie1+xXOx58D
   ZIIM6Bi1YgQPTGBurT7R8nU6YapAIdcusomm0fHB5lZQ4Pg71FBlQT3ty
   +/EJmmDQkS5VJSz5r1Uykpo1E+KH7xZC54jLmh+KDN55De+OegFxTHXMm
   MtEsKk41Xf30xgyIlQbGFVoP7HdVSSFLjC6VzbSW3q/90PktBG7ejj1oY
   rztlv+rEN0559LtpGjcHcjDKK9kChfg0ui+AFZgAywHMlGIJR11kpUDWn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="434706050"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="434706050"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 05:54:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="690269580"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="690269580"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 05:54:09 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id DB8F61203DA;
        Tue,  2 May 2023 15:54:06 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1ptpU8-0031KW-MR; Tue, 02 May 2023 15:52:00 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     jacopo.mondi@ideasonboard.com
Subject: [PATCH 1/1] media: i2c: ov5670: Fix conditions for clock access
Date:   Tue,  2 May 2023 15:51:50 +0300
Message-Id: <20230502125150.720051-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Leftovers from the earlier fix. Fix also the conditions for reading the
clock-frequency property as well as accessing the clock.

Fixes: 8df08ba4a331 ("media: ov5670: Fix probe on ACPI")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov5670.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index c5e783a06f06c..5437cf32a7b3a 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2661,9 +2661,9 @@ static int ov5670_probe(struct i2c_client *client)
 	}
 
 	ov5670->xvclk = devm_clk_get_optional(&client->dev, NULL);
-	if (!IS_ERR_OR_NULL(ov5670->xvclk))
+	if (!IS_ERR(ov5670->xvclk))
 		input_clk = clk_get_rate(ov5670->xvclk);
-	else if (PTR_ERR(ov5670->xvclk) == -ENOENT)
+	else if (!ov5670->xvclk)
 		device_property_read_u32(&client->dev, "clock-frequency",
 					 &input_clk);
 	else
-- 
2.30.2

