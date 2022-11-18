Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59DE563080B
	for <lists+linux-media@lfdr.de>; Sat, 19 Nov 2022 01:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236895AbiKSAnP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Nov 2022 19:43:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237975AbiKSAmE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Nov 2022 19:42:04 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACBB0C80F4
        for <linux-media@vger.kernel.org>; Fri, 18 Nov 2022 15:45:06 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8w-0003E6-T6; Fri, 18 Nov 2022 23:47:30 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8u-0058Zp-6m; Fri, 18 Nov 2022 23:47:29 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8u-0000FJ-6c; Fri, 18 Nov 2022 23:47:28 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Oltean <olteanv@gmail.com>,
        Corey Minyard <cminyard@mvista.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 349/606] media: i2c/msp3400-driver: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:41:23 +0100
Message-Id: <20221118224540.619276-350-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

.probe_new() doesn't get the i2c_device_id * parameter, so determine
that explicitly in the probe function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/media/i2c/msp3400-driver.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400-driver.c
index 4ce7a15a9884..12032e28b428 100644
--- a/drivers/media/i2c/msp3400-driver.c
+++ b/drivers/media/i2c/msp3400-driver.c
@@ -663,8 +663,9 @@ static const char * const opmode_str[] = {
 	[OPMODE_AUTOSELECT] = "autodetect and autoselect",
 };
 
-static int msp_probe(struct i2c_client *client, const struct i2c_device_id *id)
+static int msp_probe(struct i2c_client *client)
 {
+	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	struct msp_state *state;
 	struct v4l2_subdev *sd;
 	struct v4l2_ctrl_handler *hdl;
@@ -891,7 +892,7 @@ static struct i2c_driver msp_driver = {
 		.name	= "msp3400",
 		.pm	= &msp3400_pm_ops,
 	},
-	.probe		= msp_probe,
+	.probe_new	= msp_probe,
 	.remove		= msp_remove,
 	.id_table	= msp_id,
 };
-- 
2.38.1

