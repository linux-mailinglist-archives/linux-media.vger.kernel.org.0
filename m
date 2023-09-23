Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6F27AC3B9
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 18:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232017AbjIWQhC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 12:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232019AbjIWQhB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 12:37:01 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E379A19E;
        Sat, 23 Sep 2023 09:36:54 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.03,171,1694703600"; 
   d="scan'208";a="180728102"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Sep 2023 01:36:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.12])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CD9DC401DDFD;
        Sun, 24 Sep 2023 01:36:51 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Biju Das <biju.das.au@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/3] media: tvp541x: Drop CONFIG_OF ifdeffery
Date:   Sat, 23 Sep 2023 17:36:40 +0100
Message-Id: <20230923163641.31685-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230923163641.31685-1-biju.das.jz@bp.renesas.com>
References: <20230923163641.31685-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop of_match_ptr() from tvp514x_driver and get rid of ugly CONFIG_OF
if check. This slightly increases the size of tvp514x_driver on non-OF
system and shouldn't be an issue.

Add mod_devicetable.h include.

It also allows, in case if needed, to enumerate this device via ACPI with
PRP0001 magic.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
v1->v2:
 * Added Rb tag from Jacopo.
---
 drivers/media/i2c/tvp514x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/tvp514x.c b/drivers/media/i2c/tvp514x.c
index 4d0ffaa312c5..569a9437ec86 100644
--- a/drivers/media/i2c/tvp514x.c
+++ b/drivers/media/i2c/tvp514x.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/videodev2.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/v4l2-mediabus.h>
 #include <linux/of.h>
@@ -1190,7 +1191,6 @@ static const struct i2c_device_id tvp514x_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, tvp514x_id);
 
-#if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id tvp514x_of_match[] = {
 	{ .compatible = "ti,tvp5146", .data = tvp5146_init_reg_seq },
 	{ .compatible = "ti,tvp5146m2", .data = tvp514xm_init_reg_seq },
@@ -1199,11 +1199,10 @@ static const struct of_device_id tvp514x_of_match[] = {
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, tvp514x_of_match);
-#endif
 
 static struct i2c_driver tvp514x_driver = {
 	.driver = {
-		.of_match_table = of_match_ptr(tvp514x_of_match),
+		.of_match_table = tvp514x_of_match,
 		.name = TVP514X_MODULE_NAME,
 	},
 	.probe = tvp514x_probe,
-- 
2.25.1

