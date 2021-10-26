Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D28D43BB1E
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 21:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238908AbhJZTmu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 15:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236859AbhJZTmm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 15:42:42 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CACBC061570
        for <linux-media@vger.kernel.org>; Tue, 26 Oct 2021 12:40:18 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mfSIx-0007vf-EB; Tue, 26 Oct 2021 21:40:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mfSIv-0006FT-JL; Tue, 26 Oct 2021 21:40:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mfSIv-0001g4-IN; Tue, 26 Oct 2021 21:40:13 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] [media] tua9001: Improve messages in .remove's error path
Date:   Tue, 26 Oct 2021 21:40:10 +0200
Message-Id: <20211026194010.109029-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=zfYOg5NTTex8HkWYWxrp4SVY0XotkHQdlevTJZ6Bu/0=; m=iZUQg1RgsjhY+fB3JPOHR8TAjbuAMhlfLZtG4aWA1g4=; p=j3JjPiE8Z70C5G4gJbMunMp1YEXRD3Gaiv7yDBxcCtw=; g=76727060e6ac87b8a5f3bc203ca2a6d96158fecd
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmF4WZcACgkQwfwUeK3K7Ak1OwgAnVK nfqrcmunsNMyYxkGN+9qvb/6YZrV9x+l9p3uQWZH7aIJVI3/Hf87JEq7j1zjDvn7t9A3TS+0mjK56 i/fy311OUtZRUP7Pds6HJkHrtf3ruMuxGYtvhDY44ALWD0NE0wefELYM1xRVeAyBQmavLmWFGkMt1 5XdLycMt2wy/FfiQ/0m+WelcBJvyucs55p5p+hONWo/DHLGgFXCLamkaGj3DKsd6BtqhGGWVdD5hy AceMl/ZxwABuB9XH2wkSErav0yarTAdWFpEx11godmCgocsUQ0KkGYzg9AdDbFHNi68JUhNUQYp18 f2xI/7ivp6cmh2HVfOVScXN97Lis6cA==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If disabling the hardware fails the driver propagates the error code to
the i2c core. However this only results in a generic error message; the
device still disappears.

So instead emit a message that better describes the actual problem than
the i2c core's "remove failed (ESOMETHING), will be ignored" and return
0 to suppress the generic message.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/media/tuners/tua9001.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/tuners/tua9001.c b/drivers/media/tuners/tua9001.c
index 5e3625e75620..af7d5ea1f77e 100644
--- a/drivers/media/tuners/tua9001.c
+++ b/drivers/media/tuners/tua9001.c
@@ -240,14 +240,10 @@ static int tua9001_remove(struct i2c_client *client)
 				   DVB_FRONTEND_COMPONENT_TUNER,
 				   TUA9001_CMD_CEN, 0);
 		if (ret)
-			goto err_kfree;
+			dev_err(&client->dev, "Tuner disable failed (%pe)\n", ERR_PTR(ret));
 	}
 	kfree(dev);
 	return 0;
-err_kfree:
-	kfree(dev);
-	dev_dbg(&client->dev, "failed=%d\n", ret);
-	return ret;
 }
 
 static const struct i2c_device_id tua9001_id_table[] = {
-- 
2.30.2

