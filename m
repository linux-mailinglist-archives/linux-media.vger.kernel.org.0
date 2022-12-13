Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 547D964B894
	for <lists+linux-media@lfdr.de>; Tue, 13 Dec 2022 16:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235718AbiLMPgW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Dec 2022 10:36:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236239AbiLMPgL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Dec 2022 10:36:11 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99FAA220EE
        for <linux-media@vger.kernel.org>; Tue, 13 Dec 2022 07:36:07 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p57K9-0003Lg-Fz; Tue, 13 Dec 2022 16:36:05 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p57K8-004HIP-3s; Tue, 13 Dec 2022 16:36:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p57K8-004nw0-0z; Tue, 13 Dec 2022 16:36:04 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 2/4] media: ti/davinci: vpbe_venc: Drop empty platform remove function
Date:   Tue, 13 Dec 2022 16:35:51 +0100
Message-Id: <20221213153553.648871-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213153553.648871-1-u.kleine-koenig@pengutronix.de>
References: <20221213153553.648871-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=867; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=EDLtuUL32n2FHnDqTAjCS8eEBXP8AGLbLhFASEjBQJE=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjmJvM1s9x+brhXv62Eh/Pb0GqcJJ98HoUaInBJO6S ZtCkqQ6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5ibzAAKCRDB/BR4rcrsCblTB/ wMUthXxHWm6oXYyYT90vKDB0Esp7FJexWn9sGj7Tq2tFndeqabmzxqUS00hS+u/u0MOBK3n8itztmR tzoGCSZ7ClQ9tErasmXimcz9rgX4JVEf0k/NHo0vRPwSYgA9kqboociunMOQWnuZo6wWGMiRIKBi7d rScx5f5AmRt0XJr49hLJ3uTdW4EqEUzU3hAqkx5WXvbX0d2IxRe6i9eL70JYyLDicrLQ8cHKW7E7MC mKO9MC9FprKvixjaALq1vNJWnDZntNkmnKK8d8fd/hl7kNq7hFPmGIOnJijp6+RmcdyghKu7WZ1yfz E/hBIS0/uPd7jOdkyA2IzxTK6DFHWV
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A remove callback just returning 0 is equivalent to no remove callback
at all. So drop the useless function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/media/platform/ti/davinci/vpbe_venc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/platform/ti/davinci/vpbe_venc.c b/drivers/media/platform/ti/davinci/vpbe_venc.c
index 4c8e31de12b1..6bde6517cba5 100644
--- a/drivers/media/platform/ti/davinci/vpbe_venc.c
+++ b/drivers/media/platform/ti/davinci/vpbe_venc.c
@@ -655,14 +655,8 @@ static int venc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int venc_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static struct platform_driver venc_driver = {
 	.probe		= venc_probe,
-	.remove		= venc_remove,
 	.driver		= {
 		.name	= MODULE_NAME,
 	},
-- 
2.38.1

