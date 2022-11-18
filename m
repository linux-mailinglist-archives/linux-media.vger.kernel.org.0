Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A08D663063E
	for <lists+linux-media@lfdr.de>; Sat, 19 Nov 2022 01:09:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236091AbiKSAJM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Nov 2022 19:09:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237456AbiKSAIc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Nov 2022 19:08:32 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC268B84B
        for <linux-media@vger.kernel.org>; Fri, 18 Nov 2022 15:32:36 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8m-0002p7-KH; Fri, 18 Nov 2022 23:47:20 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8j-0058WA-Jx; Fri, 18 Nov 2022 23:47:18 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8j-0000BT-Bo; Fri, 18 Nov 2022 23:47:17 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Abylay Ospan <aospan@netup.ru>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 305/606] media: dvb-frontends/helene: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:40:39 +0100
Message-Id: <20221118224540.619276-306-uwe@kleine-koenig.org>
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
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

The probe function doesn't make use of the i2c_device_id * parameter so it
can be trivially converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/media/dvb-frontends/helene.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/helene.c b/drivers/media/dvb-frontends/helene.c
index 8c1310c6b0bc..e4bbf6a51a2b 100644
--- a/drivers/media/dvb-frontends/helene.c
+++ b/drivers/media/dvb-frontends/helene.c
@@ -1063,8 +1063,7 @@ struct dvb_frontend *helene_attach(struct dvb_frontend *fe,
 }
 EXPORT_SYMBOL(helene_attach);
 
-static int helene_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
+static int helene_probe(struct i2c_client *client)
 {
 	struct helene_config *config = client->dev.platform_data;
 	struct dvb_frontend *fe = config->fe;
@@ -1111,7 +1110,7 @@ static struct i2c_driver helene_driver = {
 	.driver = {
 		.name = "helene",
 	},
-	.probe    = helene_probe,
+	.probe_new = helene_probe,
 	.id_table = helene_id,
 };
 module_i2c_driver(helene_driver);
-- 
2.38.1

