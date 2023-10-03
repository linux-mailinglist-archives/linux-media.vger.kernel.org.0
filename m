Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1197B71A3
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 21:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231919AbjJCTUr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 15:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbjJCTUq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 15:20:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EB8FAD
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 12:20:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-209-177-105.ip.skylogicnet.com [213.209.177.105])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C249B741;
        Tue,  3 Oct 2023 21:18:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696360732;
        bh=PA0qXBP8TUX+3bnJtHOioc36P5HKqGn9hgdH5s7oPVU=;
        h=From:To:Cc:Subject:Date:From;
        b=ON6YxmFuduYi+XDVU7WSmZcPpqzLAwU852rbKBSaBrHqvAQbqFIhi9bv31UzJdIBB
         21MsaOK5Wpv6MOfyf1chsrSZwl0CmB3ENg7H0wNYLAOQrh0RqhcwfR2IrQXvI4IxxP
         69Y+YonBsep+joJ6DYWI8pYduDQUNYryqQthtblI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH] media: i2c: mt9m114: Fix missing error unwind in probe()
Date:   Tue,  3 Oct 2023 22:20:43 +0300
Message-ID: <20231003192043.27690-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Two paths in the probe function return directly instead of jumping to
error handling. Fix them.

Fixes: 23579d2f69cc ("media: i2c: Add driver for onsemi MT9M114 camera sensor")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
This patch applies on top of "[PATCH v4 2/2] media: i2c: Add driver for
onsemi MT9M114 camera sensor", which is already included in the "[GIT
PULL FOR 6.7] Camera sensor patches, preparation for enabling streams
API" pull request for v6.7. It targets the same kernel release.

The Fixes tag depends on that pull request being pulled instead of
cherry-picked, and the media tree not being rebased.
---
 drivers/media/i2c/mt9m114.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index dae675e52390..ac19078ceda3 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2367,7 +2367,7 @@ static int mt9m114_probe(struct i2c_client *client)
 
 	ret = mt9m114_clk_init(sensor);
 	if (ret)
-		return ret;
+		goto error_ep_free;
 
 	/*
 	 * Identify the sensor. The driver supports runtime PM, but needs to
@@ -2378,7 +2378,7 @@ static int mt9m114_probe(struct i2c_client *client)
 	ret = mt9m114_power_on(sensor);
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "Could not power on the device\n");
-		return ret;
+		goto error_ep_free;
 	}
 
 	ret = mt9m114_identify(sensor);
-- 
Regards,

Laurent Pinchart

