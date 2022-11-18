Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42F5963058B
	for <lists+linux-media@lfdr.de>; Sat, 19 Nov 2022 00:56:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237054AbiKRX4G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Nov 2022 18:56:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236976AbiKRXzA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Nov 2022 18:55:00 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A60EBE846
        for <linux-media@vger.kernel.org>; Fri, 18 Nov 2022 15:28:02 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA93-0003Vu-5p; Fri, 18 Nov 2022 23:47:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA91-0058bl-0y; Fri, 18 Nov 2022 23:47:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA90-0000Gy-K1; Fri, 18 Nov 2022 23:47:34 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Petr Machata <petrm@nvidia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Corey Minyard <cminyard@mvista.com>,
        Miguel Ojeda <ojeda@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 371/606] media: i2c/saa7185: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:41:45 +0100
Message-Id: <20221118224540.619276-372-uwe@kleine-koenig.org>
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
 drivers/media/i2c/saa7185.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/saa7185.c b/drivers/media/i2c/saa7185.c
index 266462325d30..c78f2e95ba37 100644
--- a/drivers/media/i2c/saa7185.c
+++ b/drivers/media/i2c/saa7185.c
@@ -290,8 +290,7 @@ static const struct v4l2_subdev_ops saa7185_ops = {
 
 /* ----------------------------------------------------------------------- */
 
-static int saa7185_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
+static int saa7185_probe(struct i2c_client *client)
 {
 	int i;
 	struct saa7185 *encoder;
@@ -344,7 +343,7 @@ static struct i2c_driver saa7185_driver = {
 	.driver = {
 		.name	= "saa7185",
 	},
-	.probe		= saa7185_probe,
+	.probe_new	= saa7185_probe,
 	.remove		= saa7185_remove,
 	.id_table	= saa7185_id,
 };
-- 
2.38.1

