Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29ADF6D4C24
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 17:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232946AbjDCPkb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 11:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231416AbjDCPk3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 11:40:29 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E01602D47
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 08:40:28 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI8-0004cC-Gm; Mon, 03 Apr 2023 17:40:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI7-008ib7-RN; Mon, 03 Apr 2023 17:40:19 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI7-00AHx9-0l; Mon, 03 Apr 2023 17:40:19 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 11/24] staging: media: imx8mq-mipi-csi2: Convert to platform remove callback returning void
Date:   Mon,  3 Apr 2023 17:40:01 +0200
Message-Id: <20230403154014.2564054-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1999; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=BtEupVcCCs7RO1/F1BhIdgmaaCRS1Hi4HokSIQLkgic=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvNBWzJPSO90ZsLptRzns82L5qn/LE0Y/2q7e 76i2+H4qRyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzQQAKCRCPgPtYfRL+ TsZpB/4v/W0DpX6l95huhebk1ypvr/q3/3/4xTiCnFeGyuUTOgYOemjEdkfCHrjC68uYmXqEjs5 6LCXVf04pJZIN4gQS32XZ28d4dXXaSuZvKtxOYYoCgYQJdoa13yiYo/wCc96LGnEpRtaz7vpDXh cdFw6TVmpEueaSOSpfYKNDDGLCn2m1vNR4aLilP2cnbqywwcQw7ghPIfTFsxkcWB2qEKDeNSEkA o+5zXpyh8o1aKBxHW8sDP13CkGnbaMA4Pa4y34sqX9tSI4ODe8JV499FLJfPwqXZaFjJto/yds9 ps9HkYh4ihIXBihHiaGf1k0Z10TpzrG2L8+Fen8A4Elw4AGx
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/staging/media/imx/imx8mq-mipi-csi2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
index 83194328d010..4317f6b71892 100644
--- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
@@ -961,7 +961,7 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int imx8mq_mipi_csi_remove(struct platform_device *pdev)
+static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
 {
 	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
 	struct csi_state *state = mipi_sd_to_csi2_state(sd);
@@ -976,8 +976,6 @@ static int imx8mq_mipi_csi_remove(struct platform_device *pdev)
 	mutex_destroy(&state->lock);
 	pm_runtime_set_suspended(&pdev->dev);
 	imx8mq_mipi_csi_release_icc(pdev);
-
-	return 0;
 }
 
 static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
@@ -988,7 +986,7 @@ MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);
 
 static struct platform_driver imx8mq_mipi_csi_driver = {
 	.probe		= imx8mq_mipi_csi_probe,
-	.remove		= imx8mq_mipi_csi_remove,
+	.remove_new	= imx8mq_mipi_csi_remove,
 	.driver		= {
 		.of_match_table = imx8mq_mipi_csi_of_match,
 		.name		= MIPI_CSI2_DRIVER_NAME,
-- 
2.39.2

