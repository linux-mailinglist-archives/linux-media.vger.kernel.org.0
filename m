Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F27D70F9E5
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 17:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235495AbjEXPQ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 11:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235342AbjEXPQ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 11:16:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF2DA9
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 08:16:56 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q1qEP-0005az-P2; Wed, 24 May 2023 17:16:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q1qEO-002W9T-FA; Wed, 24 May 2023 17:16:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q1qEN-007b3g-Mx; Wed, 24 May 2023 17:16:51 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        kernel@pengutronix.de
Subject: [PATCH v2 3/5] media: staging: max96712: Switch i2c driver back to use .probe()
Date:   Wed, 24 May 2023 17:16:44 +0200
Message-Id: <20230524151646.486847-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230524151646.486847-1-u.kleine-koenig@pengutronix.de>
References: <20230524151646.486847-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=990; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=oPLWahjlHd+uQ03zJLVx8P/MD+Hw39p5eyAguTH68Ec=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkbipYzposSy0elOAyvfnkLupsA79VSf2h62hzX 9zf9kTQLqqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZG4qWAAKCRCPgPtYfRL+ TrwhB/48JRpQ0C6ojALRHnlpL+ZUbbozHZP8t75GhAPue3Ujd/bCA3xYFPTR2XqasRhXTYmsXUI FDlv3EQRb+fymCAtzhkqfgKoeRIwWfAr5aV6QcHjshUhXvcNrDwt6DPssaZBjShGg9pwpOTRTo6 ASujxyC8Ba5QC196McDHBNvyPyshDthLmRWCaBlKq8tPB09s2bEJ02eGhcTkm74vdvS8HH9KbDj 7PRD1lo4pMNwtM33LTRpMTUVy2yCGeImAbxz9hnl5GdM71CkhFJeue8UFAZ47FgZ3cqFgboeidl mXEEWNgZYmVWoh3mT3+pLPXrsgC71jxbgPoSSR2d+AzKwRV7
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
back to (the new) .probe() to be able to eventually drop .probe_new() from
struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/staging/media/max96712/max96712.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 99b333b68198..77943bdf3fb9 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -427,7 +427,7 @@ static struct i2c_driver max96712_i2c_driver = {
 		.name = "max96712",
 		.of_match_table	= of_match_ptr(max96712_of_table),
 	},
-	.probe_new = max96712_probe,
+	.probe = max96712_probe,
 	.remove = max96712_remove,
 };
 
-- 
2.39.2

