Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8AB0434BB7
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 14:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbhJTNBw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 09:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhJTNBv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 09:01:51 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87D2BC06161C
        for <linux-media@vger.kernel.org>; Wed, 20 Oct 2021 05:59:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mdBBv-00024B-2F; Wed, 20 Oct 2021 14:59:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mdBBu-00062B-BV; Wed, 20 Oct 2021 14:59:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mdBBu-00040x-Ag; Wed, 20 Oct 2021 14:59:34 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Sean Young <sean@mess.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] media: rc: ir-spi: Drop empty spi_driver remove callback
Date:   Wed, 20 Oct 2021 14:59:32 +0200
Message-Id: <20211020125932.23335-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=ux6Aj4A6AxVpSBuGkagKtXWP4I/3dddbUHyrGQogUjE=; m=H2CYebE0C3w0pEIPV6p+i3ENgo2xahs3TAXJZPt6zAw=; p=Bf5pxNM5jUrecA5/VwCg+9qSQccm5zHxB7D849+mvuQ=; g=82d7d40266ce2d12f4beb86d4aaf4e2c95fff830
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFwErEACgkQwfwUeK3K7Anv/wf/RFT IJ6wAnRN+AqzmqGxLKJZH+CYncpAMOxDsuNI0TjITtyxd5WQyCb3sS/EHy2HY08scBkiF86H7MDQx iWi2RgewjiShPf76f9sXUI+KB+8LsVMANSshtkCV9GhNqzJpuDFM/gDa5u75OpNg6gDjzcJrMe+St EWap6qbH6VG7aRiyr0VMzvCXnVLXGdyyUCAgHgn5akgFaTHDxXZTcGHCGMTxU31vWSOam9JMeA+u2 LvH0nH8Em7m4PFOC/lvepSP4/6cj/dkRtOZq7GX2MGTbOaZYI8NH3yyHljcylAgxViBUlvNkFhrEm 0g3lMv2dDtnHvSQ3kqRCLTdB38NSrTw==
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
 drivers/media/rc/ir-spi.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/rc/ir-spi.c b/drivers/media/rc/ir-spi.c
index c58f2d38a458..51aa55a84bb5 100644
--- a/drivers/media/rc/ir-spi.c
+++ b/drivers/media/rc/ir-spi.c
@@ -152,11 +152,6 @@ static int ir_spi_probe(struct spi_device *spi)
 	return devm_rc_register_device(&spi->dev, idata->rc);
 }
 
-static int ir_spi_remove(struct spi_device *spi)
-{
-	return 0;
-}
-
 static const struct of_device_id ir_spi_of_match[] = {
 	{ .compatible = "ir-spi-led" },
 	{},
@@ -165,7 +160,6 @@ MODULE_DEVICE_TABLE(of, ir_spi_of_match);
 
 static struct spi_driver ir_spi_driver = {
 	.probe = ir_spi_probe,
-	.remove = ir_spi_remove,
 	.driver = {
 		.name = IR_SPI_DRIVER_NAME,
 		.of_match_table = ir_spi_of_match,
-- 
2.30.2

