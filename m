Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCDF64B897
	for <lists+linux-media@lfdr.de>; Tue, 13 Dec 2022 16:36:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235971AbiLMPgY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Dec 2022 10:36:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236243AbiLMPgP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Dec 2022 10:36:15 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 478E8220E0
        for <linux-media@vger.kernel.org>; Tue, 13 Dec 2022 07:36:13 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p57K9-0003Lx-RJ; Tue, 13 Dec 2022 16:36:05 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p57K8-004HIV-El; Tue, 13 Dec 2022 16:36:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p57K8-004nw7-CC; Tue, 13 Dec 2022 16:36:04 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] media: chips-media/imx-vdoa: Drop empty platform remove function
Date:   Tue, 13 Dec 2022 16:35:53 +0100
Message-Id: <20221213153553.648871-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213153553.648871-1-u.kleine-koenig@pengutronix.de>
References: <20221213153553.648871-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=/7fToy7rqe/2jP0AO5M34YTnTR18gC5uFkAcXO6dHgI=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjmJvTj4FLEgp8SWn0Um7KpPxJG56HogXDM/gOnp9/ Z2OnTJ+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5ib0wAKCRDB/BR4rcrsCRLoB/ 96Qd62SKdunblF4u1JGNCWd+3yr/lqkfVjBJohDbN3ZlSzCntmzsl7KyCZQosE1BO2YnfemZi8DAoY auSvT/cIhnxqEZactBaSXa64GZcoGDaUaeXHGTTOhh9LFykjESndcVcdrFU1fa2dOUnWI+zTZ9onn8 rSOBIpe/idcdpRpXoOXDzHXJDcFzv6KK76WPjSeNRM6Two2fjOH4a2nGY/gG4kZS6AnTQxJbABGQyr /z8GGvvXFy4JPyEFltWpeYwpKZfzfhrcKNLwi7HJL9eG70sh2CwmIP1x8WM0Mav0LjZS0x9Mq6EpbH msu0tvT47tk3SMCJqHyaDTgWhy6IZ/
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
 drivers/media/platform/chips-media/imx-vdoa.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/platform/chips-media/imx-vdoa.c b/drivers/media/platform/chips-media/imx-vdoa.c
index c70871bae193..c3561fcecb98 100644
--- a/drivers/media/platform/chips-media/imx-vdoa.c
+++ b/drivers/media/platform/chips-media/imx-vdoa.c
@@ -324,11 +324,6 @@ static int vdoa_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int vdoa_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static const struct of_device_id vdoa_dt_ids[] = {
 	{ .compatible = "fsl,imx6q-vdoa" },
 	{}
@@ -337,7 +332,6 @@ MODULE_DEVICE_TABLE(of, vdoa_dt_ids);
 
 static struct platform_driver vdoa_driver = {
 	.probe		= vdoa_probe,
-	.remove		= vdoa_remove,
 	.driver		= {
 		.name	= VDOA_NAME,
 		.of_match_table = vdoa_dt_ids,
-- 
2.38.1

