Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 957166911FF
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 21:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbjBIUM5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 15:12:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjBIUM4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 15:12:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD5B2D171
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 12:12:55 -0800 (PST)
Received: from uno.localdomain (mob-176-242-40-117.net.vodafone.it [176.242.40.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A772A9CA;
        Thu,  9 Feb 2023 21:12:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675973573;
        bh=XNJy0Z0MmhZs7tePJiQexWJ3ea9DjdTZ9ihszHxrTTI=;
        h=From:To:Cc:Subject:Date:From;
        b=dpCeUEpGWmmkmSbsrX4JxUvVU4VH2PTcxiaIS1TyzcebJvcTd8Hsqtu/3Vp8vmmEt
         YUH4FBu6qk2vL+uIhIz3Gh85tt7tlPpjKAIIyNm5bVZ9ixmi9s2QAvxErMauaJ+LoH
         1u7ADkNhTcYMNFeS5KoKKVfXFJfLMC3/TWpxwbaA=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        Dan Carpenter <error27@gmail.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] media: i2c: ov5670: Properly handle !CONFIG_HAVE_CLK
Date:   Thu,  9 Feb 2023 21:12:35 +0100
Message-Id: <20230209201235.206188-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov5670 driver tries to get a reference to the xvclk provider by using
the common cock framework and deflects to parsing the "clock-frequency"
property in case the clock provider is not specified in the firmware
interface, detected by checking if ov5670->xvclk == PTR_ERR(-ENOENT).

However, as reported by the Smatch static checker, if CONFIG_HAVE_CLK is
not enabled, devm_clk_get() returns 0 which when passed to PTR_ERR()
means success causing the driver to fail without propagating any error
code up.

Explicitly handle the case where ov5670->xvclk it set to NULL, forcing
the code to parse the "clock-frequency" property in case CONFIG_HAVE_CLK
is not enabled, as suggested by Dan Carpenter.

Reported-by: Dan Carpenter <error27@gmail.com>
Suggested-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Patch based on Sakari's master branch.

As the patch series has not landed in Mauro's tree, I've not added a
Fixes: tag yet.
---
 drivers/media/i2c/ov5670.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index f79d908f4531..275ae24316fe 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2663,7 +2663,7 @@ static int ov5670_probe(struct i2c_client *client)
 	ov5670->xvclk = devm_clk_get(&client->dev, NULL);
 	if (!IS_ERR_OR_NULL(ov5670->xvclk))
 		input_clk = clk_get_rate(ov5670->xvclk);
-	else if (PTR_ERR(ov5670->xvclk) == -ENOENT)
+	else if (!ov5670->xvclk || PTR_ERR(ov5670->xvclk) == -ENOENT)
 		device_property_read_u32(&client->dev, "clock-frequency",
 					 &input_clk);
 	else
--
2.39.0

