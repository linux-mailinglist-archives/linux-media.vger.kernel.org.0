Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25C8A4EDA92
	for <lists+linux-media@lfdr.de>; Thu, 31 Mar 2022 15:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236876AbiCaNdd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Mar 2022 09:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234284AbiCaNdc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Mar 2022 09:33:32 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F2D1DA8CE
        for <linux-media@vger.kernel.org>; Thu, 31 Mar 2022 06:31:45 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nZuto-0001am-0t; Thu, 31 Mar 2022 15:31:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nZuto-0007f9-GQ; Thu, 31 Mar 2022 15:31:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nZutm-000FRI-AK; Thu, 31 Mar 2022 15:31:38 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] media: i2c: dw9714: Return zero in remove callback
Date:   Thu, 31 Mar 2022 15:31:32 +0200
Message-Id: <20220331133132.296971-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=922; h=from:subject; bh=ecGsgBoBdZ/F3utMElHBK8ToCQYQcrzUdxuo8Zc6SP4=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiRa0xfqnQaQb9bNOl0ux214f0S5moZsi5NskjVkMF 7273lwSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYkWtMQAKCRDB/BR4rcrsCc8eB/ 0R6VdW4/lP3a69Py5FLj3aIS6aD1QCkMQbtuTKIHy8jwPrN1mZp2PoKnjM7XbvfEqQ1yF89tvmw8UT da0A4yYIsnTYkxquWxjkcKIlBDb+UFvY6clvbdU2wM7c3VnrxnQI0ywsbPym8YwP7PnIYpq5XABL+A 66qvfYSLNAB/quf4clHIG+L0IshhPhLr5YZZ1TEJtcLqKmIherqYF2ee4lcVN4MHXHPJqNFgdhxXkE AREM54My07ixP6V1xx8XEAA+EhZa4Vz/ulhUioAhgai4UREz4Av25hOBFZXSuH2V0nX8kWNYa4Qhzr wwwSuCIuIdctoddlc6LlL21XP9sm8U
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

The only effect of returning an error code in an i2c remove callback is
that the i2c core emits a generic warning and still removes the device.

So even if disabling the regulator fails it's sensible to further cleanup
and then return zero to only emit a single error message.

This patch is a preparation for making i2c remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/media/i2c/dw9714.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
index cd7008ad8f2f..982ed8afebf5 100644
--- a/drivers/media/i2c/dw9714.c
+++ b/drivers/media/i2c/dw9714.c
@@ -201,7 +201,6 @@ static int dw9714_remove(struct i2c_client *client)
 		if (ret) {
 			dev_err(&client->dev,
 				"Failed to disable vcc: %d\n", ret);
-			return ret;
 		}
 	}
 	pm_runtime_set_suspended(&client->dev);
-- 
2.35.1

