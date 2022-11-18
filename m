Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7525F63054D
	for <lists+linux-media@lfdr.de>; Sat, 19 Nov 2022 00:53:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237047AbiKRXxK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Nov 2022 18:53:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237076AbiKRXwP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Nov 2022 18:52:15 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA129C7585
        for <linux-media@vger.kernel.org>; Fri, 18 Nov 2022 15:27:29 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA99-0003nR-AT; Fri, 18 Nov 2022 23:47:43 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA97-0058e7-2s; Fri, 18 Nov 2022 23:47:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA97-0000JB-3A; Fri, 18 Nov 2022 23:47:41 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Akihiro Tsukada <tskd08@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
        Vladimir Oltean <olteanv@gmail.com>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 406/606] media: tuners/qm1d1c0042: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:42:20 +0100
Message-Id: <20221118224540.619276-407-uwe@kleine-koenig.org>
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
 drivers/media/tuners/qm1d1c0042.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/tuners/qm1d1c0042.c b/drivers/media/tuners/qm1d1c0042.c
index 2d60bf501fb5..f9be7a721d2c 100644
--- a/drivers/media/tuners/qm1d1c0042.c
+++ b/drivers/media/tuners/qm1d1c0042.c
@@ -401,8 +401,7 @@ static const struct dvb_tuner_ops qm1d1c0042_ops = {
 };
 
 
-static int qm1d1c0042_probe(struct i2c_client *client,
-			    const struct i2c_device_id *id)
+static int qm1d1c0042_probe(struct i2c_client *client)
 {
 	struct qm1d1c0042_state *state;
 	struct qm1d1c0042_config *cfg;
@@ -444,7 +443,7 @@ static struct i2c_driver qm1d1c0042_driver = {
 	.driver = {
 		.name	= "qm1d1c0042",
 	},
-	.probe		= qm1d1c0042_probe,
+	.probe_new	= qm1d1c0042_probe,
 	.remove		= qm1d1c0042_remove,
 	.id_table	= qm1d1c0042_id,
 };
-- 
2.38.1

