Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E42B970F9E8
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 17:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235051AbjEXPRX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 11:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232354AbjEXPRX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 11:17:23 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B83A9
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 08:17:21 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q1qEU-0005b5-LH; Wed, 24 May 2023 17:16:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q1qEO-002W9U-HE; Wed, 24 May 2023 17:16:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q1qEN-007b3d-H2; Wed, 24 May 2023 17:16:51 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>, Steven@pengutronix.de,
        Rostedt@pengutronix.de, Corey Minyard <cminyard@mvista.com>,
        Haowen Bai <baihaowen@meizu.com>, Tom Rix <trix@redhat.com>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        kernel@pengutronix.de
Subject: [PATCH v2 2/5] media: atomisp: Switch i2c drivers back to use .probe()
Date:   Wed, 24 May 2023 17:16:43 +0200
Message-Id: <20230524151646.486847-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230524151646.486847-1-u.kleine-koenig@pengutronix.de>
References: <20230524151646.486847-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4751; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=FHxmHrT2xCuAdCkjRHI8du0WO9v+q1DF74udhxYk4Nc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkbipXEzRPnGtorwg1YUHN1VVRGmqU9YLImg8ws QUh04cQHPyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZG4qVwAKCRCPgPtYfRL+ Tpp6B/49cHy5YuH+BKBIDHSKz9cAC95R6N1vbA74gMWcp/OII0MA5yQ7AzC9vOwQMM2AimPB01a slE1Mx0mMzkyKWot/bnLaWZzs8l2GP+cXFP01ZHrYJZ0rpqi84u7zKcPuF6SpN4YWuzAvBzVQE9 JIh4K6WwssctnHZQUJTzP24NK52WjHqTp/T6UiUNT3UpVog5eBvdM9lCf99eXBIdDcoxkXy10H/ eEq9sMfRzufbPb+rylZCqtX42Vh1c7CqDrquar7LDQEbAGjd+jmNSO6ZqI0srWniNC+Rbr77K1H zL86FN+FfmPyWB+92As0y0PGdLMwp7truBjxV9k+Ohc6k/tX
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
back to (the new) .probe() to be able to eventually drop .probe_new() from
struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c        | 2 +-
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c        | 2 +-
 drivers/staging/media/atomisp/i2c/atomisp-lm3554.c        | 2 +-
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c       | 2 +-
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c        | 2 +-
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c        | 2 +-
 drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 273155308fe3..21eb4234a081 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -483,7 +483,7 @@ static struct i2c_driver gc0310_driver = {
 		.pm = pm_sleep_ptr(&gc0310_pm_ops),
 		.acpi_match_table = gc0310_acpi_match,
 	},
-	.probe_new = gc0310_probe,
+	.probe = gc0310_probe,
 	.remove = gc0310_remove,
 };
 module_i2c_driver(gc0310_driver);
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index cb4c79b483ca..9fa390fbc5f3 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -864,7 +864,7 @@ static struct i2c_driver gc2235_driver = {
 		.name = "gc2235",
 		.acpi_match_table = gc2235_acpi_match,
 	},
-	.probe_new = gc2235_probe,
+	.probe = gc2235_probe,
 	.remove = gc2235_remove,
 };
 module_i2c_driver(gc2235_driver);
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
index c4ce4cd445d7..cf5d9317b11a 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
@@ -945,7 +945,7 @@ static struct i2c_driver lm3554_driver = {
 		.pm   = &lm3554_pm_ops,
 		.acpi_match_table = lm3554_acpi_match,
 	},
-	.probe_new = lm3554_probe,
+	.probe = lm3554_probe,
 	.remove = lm3554_remove,
 };
 module_i2c_driver(lm3554_driver);
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index 0e5a981dd331..1c6643c442ef 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -1600,7 +1600,7 @@ static struct i2c_driver mt9m114_driver = {
 		.name = "mt9m114",
 		.acpi_match_table = mt9m114_acpi_match,
 	},
-	.probe_new = mt9m114_probe,
+	.probe = mt9m114_probe,
 	.remove = mt9m114_remove,
 };
 module_i2c_driver(mt9m114_driver);
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 63de214916f5..b5d93a96d588 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -719,7 +719,7 @@ static struct i2c_driver ov2680_driver = {
 		.pm = pm_sleep_ptr(&ov2680_pm_ops),
 		.acpi_match_table = ov2680_acpi_match,
 	},
-	.probe_new = ov2680_probe,
+	.probe = ov2680_probe,
 	.remove = ov2680_remove,
 };
 module_i2c_driver(ov2680_driver);
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 5d2e6e2e72f0..6a72691ed5b7 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -1019,7 +1019,7 @@ static struct i2c_driver ov2722_driver = {
 		.name = "ov2722",
 		.acpi_match_table = ov2722_acpi_match,
 	},
-	.probe_new = ov2722_probe,
+	.probe = ov2722_probe,
 	.remove = ov2722_remove,
 };
 module_i2c_driver(ov2722_driver);
diff --git a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
index da8c3b1d3bcd..c94fe8e861a5 100644
--- a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
+++ b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
@@ -1794,7 +1794,7 @@ static struct i2c_driver ov5693_driver = {
 		.name = "ov5693",
 		.acpi_match_table = ov5693_acpi_match,
 	},
-	.probe_new = ov5693_probe,
+	.probe = ov5693_probe,
 	.remove = ov5693_remove,
 };
 module_i2c_driver(ov5693_driver);
-- 
2.39.2

