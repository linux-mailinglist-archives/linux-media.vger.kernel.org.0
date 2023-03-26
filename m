Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31A0A6C957B
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232587AbjCZOdn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbjCZOcw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:32:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6DB7A8F
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:32:50 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQL-00008q-St; Sun, 26 Mar 2023 16:32:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQJ-006rej-IW; Sun, 26 Mar 2023 16:32:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRQH-0088Ye-Pm; Sun, 26 Mar 2023 16:32:41 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 075/117] media: hva-v4l2: Convert to platform remove callback returning void
Date:   Sun, 26 Mar 2023 16:31:42 +0200
Message-Id: <20230326143224.572654-78-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1803; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=VH1GFq87cVh/dqGErqwrfNw1QtS26SgE3khLKsXZ7O0=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhSFsPvzHDfst82JN/1+7ukslmX3r9r8udolIGuRduf6n rMsdv5cnYzGLAyMXAyyYoos9o1rMq2q5CI71/67DDOIlQlkCgMXpwBMRJOf/a/AiQvFnhsXdk3P WRAhFlcZ9znpVlfz1/uLJ7ly2KlrLNPjEdXnPVnktSPXV8FD2uo/cx7f+U/8J3hkRSwXGnG13RB V95zBoiOVsH5W0UOJrD6BK3wBTM67RK5u12Xb32fq9T2I+aS3kuUfYblrq/+Gvygy/y0actFi09 5T598EdLtfYjFqnuEbV8XTaNeTopMn3aD/3HU+d3WbS3cGb6ZXuFyL4rrzZ/8UVusdbqqsuGjT0 pmh02+u05ax6dxp02hRAXF9mwUvZu+fleGjnPK6u2pipE0ARy+fvdKMW3aCUWFPBJs+73SV/CH6 gIfVYXHZkRlcDkxxlzdXnzBddnbtXx/Xw+8O7RJ/FgsA
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
 drivers/media/platform/st/sti/hva/hva-v4l2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/st/sti/hva/hva-v4l2.c b/drivers/media/platform/st/sti/hva/hva-v4l2.c
index bb34d6997d99..3a848ca32a0e 100644
--- a/drivers/media/platform/st/sti/hva/hva-v4l2.c
+++ b/drivers/media/platform/st/sti/hva/hva-v4l2.c
@@ -1422,7 +1422,7 @@ static int hva_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int hva_remove(struct platform_device *pdev)
+static void hva_remove(struct platform_device *pdev)
 {
 	struct hva_dev *hva = platform_get_drvdata(pdev);
 	struct device *dev = hva_to_dev(hva);
@@ -1440,8 +1440,6 @@ static int hva_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&hva->v4l2_dev);
 
 	dev_info(dev, "%s %s removed\n", HVA_PREFIX, pdev->name);
-
-	return 0;
 }
 
 /* PM ops */
@@ -1461,7 +1459,7 @@ MODULE_DEVICE_TABLE(of, hva_match_types);
 
 static struct platform_driver hva_driver = {
 	.probe  = hva_probe,
-	.remove = hva_remove,
+	.remove_new = hva_remove,
 	.driver = {
 		.name		= HVA_NAME,
 		.of_match_table	= hva_match_types,
-- 
2.39.2

