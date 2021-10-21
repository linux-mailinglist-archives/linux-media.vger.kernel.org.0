Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF6B2435AD7
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 08:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbhJUG2S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 02:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbhJUG2O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 02:28:14 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AAA8C06161C
        for <linux-media@vger.kernel.org>; Wed, 20 Oct 2021 23:25:58 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mdRWT-0001zb-Ad; Thu, 21 Oct 2021 08:25:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mdRWQ-0007cC-Eu; Thu, 21 Oct 2021 08:25:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mdRWQ-0007dB-E1; Thu, 21 Oct 2021 08:25:50 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] [media] s5c73m3: Drop empty spi_driver remove callback
Date:   Thu, 21 Oct 2021 08:25:47 +0200
Message-Id: <20211021062547.51989-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=/D+7aW9uYxIjsK7eR2QnpmyCFDg24Qy6sofiIZ7onyI=; m=H2CYebE0C3w0pEIPV6p+i3ENgo2xahs3TAXJZPt6zAw=; p=RdtggItrGuaf9lCEVRzZZ+icKTrDSQ+7aEVYLPxRUes=; g=1e76930734b69ac6455741b0c71e24634ea7ac2c
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFxB+cACgkQwfwUeK3K7AkCIwgAi3x PyH3L160T20BuWrXuvtdIcWsrPmsel/umXiHUvbv/DoTDaFOcWLmkWuswjXEmGwA7GTcIfPo3HQxm iSWPX/oXy6ivZV4i1AQVX6/GYP4nSjeSwYn3DyPlX7PUUZOWPi7lv54bhZ4lLpDi9aMFO5c97BV3s ULzpSTI+FpT6o2BExYwM1wHwTxtA6WVC/nRxeOMmP8bsMQf9LDNv/KC2yJJEA4UBHa21K4wT+IC4m H8ntOs185FH3AR+AUdR91OsHSXBjKyv6vnT/6hCGcLBcGrUXTNBhBZZ2Bx+YpfpCqVjVLv0Ucf6Qw By1cF2CVDx62ZVuDp94KOhOza/ObPPw==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A driver with a remove callback that just returns 0 behaves identically
to a driver with no remove callback at all. So simplify accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/media/i2c/s5c73m3/s5c73m3-spi.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-spi.c b/drivers/media/i2c/s5c73m3/s5c73m3-spi.c
index c102c6bbc118..7fe61187a2f8 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-spi.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-spi.c
@@ -130,16 +130,10 @@ static int s5c73m3_spi_probe(struct spi_device *spi)
 	return 0;
 }
 
-static int s5c73m3_spi_remove(struct spi_device *spi)
-{
-	return 0;
-}
-
 int s5c73m3_register_spi_driver(struct s5c73m3 *state)
 {
 	struct spi_driver *spidrv = &state->spidrv;
 
-	spidrv->remove = s5c73m3_spi_remove;
 	spidrv->probe = s5c73m3_spi_probe;
 	spidrv->driver.name = S5C73M3_SPI_DRV_NAME;
 	spidrv->driver.of_match_table = s5c73m3_spi_ids;
-- 
2.30.2

