Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0526C9532
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232446AbjCZOcr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232365AbjCZOcg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:36 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE91261B1
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ6-0007mj-4E; Sun, 26 Mar 2023 16:32:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ4-006rZc-S6; Sun, 26 Mar 2023 16:32:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQ3-0088UG-9G; Sun, 26 Mar 2023 16:32:27 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alain Volmat <alain.volmat@foss.st.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 008/117] media: stih-cec: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:30:35 +0200
Message-Id: <20230326143224.572654-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1739; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=oysvyHhF1RsezmNGArgGVCyDvKBVEIhYUQ1ZumlOgsc=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhSFsPqXGrzNJ9emHn7WlR2dtXruJNP3yz/kPJM88eLtm kk8gu9ndjIaszAwcjHIiimy2DeuybSqkovsXPvvMswgViaQKQxcnAIwEfki9l/Mh6fLp4g9VJz1 KnhPnHyZYeLs68UFvae2L10TkOYdlX+3wmnuVm32VVazN/OmFq5ufSHo46MkzbXPsyfOpYT3Tnb 8z+LzOiHra7p+i/xl1TEIeDh5vRCPknLCxIm+auuTmV4+jGisefWgOdeY7+6mrPcOxpz/qnUsV1 p/XGbaLsWoljlXVPt01u4slmkN5h3xE1OXfBV9mxR7eoVz7t96/b2/cuTEl0owJ52WYWh9UnAs7 +NKU66E5kuHyrzLMmUdjAP3H4n7mntNdLOJj5LPM+/gHc1VXCpbVide0XqRd7bqvtavVxIlwgZy O0vOm284wDFPqeK33ZXFrx47cbsn2crpTv6/vn/CSeHHAA==
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
 drivers/media/cec/platform/sti/stih-cec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/cec/platform/sti/stih-cec.c b/drivers/media/cec/platform/sti/stih-cec.c
index 4edbdd09535d..a20fc5c0c88d 100644
--- a/drivers/media/cec/platform/sti/stih-cec.c
+++ b/drivers/media/cec/platform/sti/stih-cec.c
@@ -364,14 +364,12 @@ static int stih_cec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int stih_cec_remove(struct platform_device *pdev)
+static void stih_cec_remove(struct platform_device *pdev)
 {
 	struct stih_cec *cec = platform_get_drvdata(pdev);
 
 	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
 	cec_unregister_adapter(cec->adap);
-
-	return 0;
 }
 
 static const struct of_device_id stih_cec_match[] = {
@@ -384,7 +382,7 @@ MODULE_DEVICE_TABLE(of, stih_cec_match);
 
 static struct platform_driver stih_cec_pdrv = {
 	.probe	= stih_cec_probe,
-	.remove = stih_cec_remove,
+	.remove_new = stih_cec_remove,
 	.driver = {
 		.name		= CEC_NAME,
 		.of_match_table	= stih_cec_match,
-- 
2.39.2

