Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34DF7758641
	for <lists+linux-media@lfdr.de>; Tue, 18 Jul 2023 22:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbjGRUqL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jul 2023 16:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbjGRUqJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jul 2023 16:46:09 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8590E19A4
        for <linux-media@vger.kernel.org>; Tue, 18 Jul 2023 13:45:56 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qLrZt-00014R-Pf; Tue, 18 Jul 2023 22:45:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qLrZs-000S1T-61; Tue, 18 Jul 2023 22:45:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qLrZr-005wCi-Db; Tue, 18 Jul 2023 22:45:47 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] media: Switch three more drivers back to use struct i2c_driver::probe()
Date:   Tue, 18 Jul 2023 22:45:41 +0200
Message-Id: <20230718204541.3955386-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2519; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=NLc/hIyTXBXQFNjGGA4p4wWg9v3+ZI+8MhtcBuN7g8I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBktvnyIigMYMadIwcHjb831nDbkC1ZnwUkE3Tie u6qWqJj8CyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZLb58gAKCRCPgPtYfRL+ Tk5VB/9ZzUEaoE7hJWsPeIVzyw6EZmGfZUGV3t7+vLub1HzUSTYnG/tReLLhuKI08+CvgNGAllq 3SqreRIMOPmDo5Em89kdSPPMj6g0tpcewSe9E7PG1l2mdSJLiWGvcOw2jsGGYnTJ7oBCCnrrXdO +GPWgcV5Y8cq+oxzkcBN4P51aULDJo9WmaX/QqbQLAcvPrqGAMX5B3LzeAJpYYabs6Cc5RgKAvF WcwFZT0N48kqKwQWsmxWVhOLU5yOG8fxTtmz0ualBm2Ot6ng/ZHPQI5tzsNIr7tOVbTLf43iF2q CrfDvd1CXMtGBIlixE9aq9auCHGUOkqG2HsvTO7lzSQPaTI1
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,HEXHASH_WORD,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

struct i2c_driver::probe_new() is about to go away. Since I converted
all drivers below drivers/media use struct i2c_driver::probe, three more
drivers were added in the following commits that use .probe_new():

	6363db1c9d45 media: i2c: add DS90UB953 driver
	c158d0d4ff15 media: i2c: add DS90UB913 driver
	afe267f2d368 media: i2c: add DS90UB960 driver

Switch these driver to use the probe callback.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

these three drivers are currently added in next and introduce new usages
of .probe_new which I intend to remove after the next -rc1.

To reduce the amount of patches that are necessary to apply together
with the patch that drops .probe_new() it would be great if you make
sure that this patch makes it in before v6.6-rc1.

Thanks
Uwe

 drivers/media/i2c/ds90ub913.c | 2 +-
 drivers/media/i2c/ds90ub953.c | 2 +-
 drivers/media/i2c/ds90ub960.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 203f7cceae23..4dae5afa9fa9 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -889,7 +889,7 @@ static const struct of_device_id ub913_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, ub913_dt_ids);
 
 static struct i2c_driver ds90ub913_driver = {
-	.probe_new	= ub913_probe,
+	.probe		= ub913_probe,
 	.remove		= ub913_remove,
 	.id_table	= ub913_id,
 	.driver = {
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 1e3827a60029..87a7420366ea 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -1382,7 +1382,7 @@ static const struct of_device_id ub953_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, ub953_dt_ids);
 
 static struct i2c_driver ds90ub953_driver = {
-	.probe_new	= ub953_probe,
+	.probe		= ub953_probe,
 	.remove		= ub953_remove,
 	.id_table	= ub953_id,
 	.driver = {
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index e101bcf2356a..548c257f922f 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -4034,7 +4034,7 @@ static const struct of_device_id ub960_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, ub960_dt_ids);
 
 static struct i2c_driver ds90ub960_driver = {
-	.probe_new	= ub960_probe,
+	.probe		= ub960_probe,
 	.remove		= ub960_remove,
 	.id_table	= ub960_id,
 	.driver = {

base-commit: 6363db1c9d45a54ddc1582423b74b5f9935b5958
-- 
2.39.2

