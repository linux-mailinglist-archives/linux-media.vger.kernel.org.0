Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40F7F6C9576
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232450AbjCZOdi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232457AbjCZOcu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2543859DB
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:49 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQI-0008Qd-5v; Sun, 26 Mar 2023 16:32:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQF-006rd9-9r; Sun, 26 Mar 2023 16:32:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQC-0088X0-HR; Sun, 26 Mar 2023 16:32:36 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 051/117] media: rcar_drif: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:18 +0200
Message-Id: <20230326143224.572654-54-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=nwKCJTOdxQv7E7M26+wkLn98oSNhE7D9Vkt7wczeeVg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbEK/1kkf6o5gM9he+H8/sE9QVvHxSzHMUWj 1F3uqRa1SCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWxAAKCRCPgPtYfRL+ TqggB/429FZpW1zigRZFsRKsuXBXU3GZQqCRMsaILtA23xmYgBYOBM5uyGOR8+/vY8F7lZaM0Qb tQYTzNl4suGeQmKTXMiLsULULaWxS+i0zp1DdWAz8PHdCiHfWQUhmBBVPOVYl7NA4k6LHAmHIhu lYyKoS15UKShVdEvuY1udzoKOyBZazbXJOCKArn1uLVSR5RlJyKvq7mVf9z4BgEdSpCXztFencO S3mDZ6JGlX9VODDlQJIgx1dpSFUrCtUvI8k5z0Mol5z+Gb4E9GOqq69LkIRBHWkBp5Dg5iGnlmQ Vf3B2taDEKtbzFk24hJsc3lSc5WasFgHUGTy9Lh6huWHojNQ
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
 drivers/media/platform/renesas/rcar_drif.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index 3fec41f6e964..3a92f4535c18 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -1433,19 +1433,17 @@ static int rcar_drif_probe(struct platform_device *pdev)
 }
 
 /* DRIF channel remove */
-static int rcar_drif_remove(struct platform_device *pdev)
+static void rcar_drif_remove(struct platform_device *pdev)
 {
 	struct rcar_drif *ch = platform_get_drvdata(pdev);
 	struct rcar_drif_sdr *sdr = ch->sdr;
 
 	/* Channel 0 will be the SDR instance */
 	if (ch->num)
-		return 0;
+		return;
 
 	/* SDR instance */
 	rcar_drif_sdr_remove(sdr);
-
-	return 0;
 }
 
 /* FIXME: Implement suspend/resume support */
@@ -1476,7 +1474,7 @@ static struct platform_driver rcar_drif_driver = {
 		.pm = &rcar_drif_pm_ops,
 		},
 	.probe = rcar_drif_probe,
-	.remove = rcar_drif_remove,
+	.remove_new = rcar_drif_remove,
 };
 
 module_platform_driver(rcar_drif_driver);
-- 
2.39.2

