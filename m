Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE8ED6305C6
	for <lists+linux-media@lfdr.de>; Sat, 19 Nov 2022 00:58:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232682AbiKRX6t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Nov 2022 18:58:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237137AbiKRX44 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Nov 2022 18:56:56 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 849492CDDC
        for <linux-media@vger.kernel.org>; Fri, 18 Nov 2022 15:28:41 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA9A-0003qe-J0; Fri, 18 Nov 2022 23:47:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA98-0058ei-6Y; Fri, 18 Nov 2022 23:47:43 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA98-0000JS-2R; Fri, 18 Nov 2022 23:47:42 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 411/606] media: usb: go7007: s2250-board: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:42:25 +0100
Message-Id: <20221118224540.619276-412-uwe@kleine-koenig.org>
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
 drivers/media/usb/go7007/s2250-board.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/go7007/s2250-board.c b/drivers/media/usb/go7007/s2250-board.c
index 2f45188bf9d4..29dfcc6d0b0a 100644
--- a/drivers/media/usb/go7007/s2250-board.c
+++ b/drivers/media/usb/go7007/s2250-board.c
@@ -494,8 +494,7 @@ static const struct v4l2_subdev_ops s2250_ops = {
 
 /* --------------------------------------------------------------------------*/
 
-static int s2250_probe(struct i2c_client *client,
-		       const struct i2c_device_id *id)
+static int s2250_probe(struct i2c_client *client)
 {
 	struct i2c_client *audio;
 	struct i2c_adapter *adapter = client->adapter;
@@ -621,7 +620,7 @@ static struct i2c_driver s2250_driver = {
 	.driver = {
 		.name	= "s2250",
 	},
-	.probe		= s2250_probe,
+	.probe_new	= s2250_probe,
 	.remove		= s2250_remove,
 	.id_table	= s2250_id,
 };
-- 
2.38.1

