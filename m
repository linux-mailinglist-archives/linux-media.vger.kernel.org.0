Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3E2773DAD6
	for <lists+linux-media@lfdr.de>; Mon, 26 Jun 2023 11:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbjFZJJF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jun 2023 05:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjFZJI0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jun 2023 05:08:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C53B5
        for <linux-media@vger.kernel.org>; Mon, 26 Jun 2023 02:05:43 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qDiAC-00089o-19; Mon, 26 Jun 2023 11:05:36 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qDiAB-00AAYX-4l; Mon, 26 Jun 2023 11:05:35 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qDiAA-00HVGL-DC; Mon, 26 Jun 2023 11:05:34 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] media: i2c: ov01a10: Switch back to use struct i2c_driver::probe
Date:   Mon, 26 Jun 2023 11:05:33 +0200
Message-Id: <20230626090533.556406-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=784; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=sSCqoGBjHVP6QO0JpBUsbJDdrd9zSt/1tLxAOS+dxNQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkmVTcK+renwGsLM3W4zsiZNjXSkpCS3viiiqP3 WwsPlMeEGCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZJlU3AAKCRCPgPtYfRL+ TgNKCACAQuOdOW2w7FBlenvK/DV/fTYRbs5JHdYR4+mooHcb6F0We/3rD4DppMpdhAHcAOZ9wlU xlDkKg5muDnxXB5Y+mlq4+22y4YRL9lAe108D5sLh4d1qzDk8i2cSodZLw+NRUsvmxixAIvEl6W AIbqWxYOLVojJ++aS7TfHtu5TV3CuS8fmKjVfZjQoo2R07j2OXaF1WoCu0/RMeW3BT3JQ+ef8u3 M21lVes7ORGT6P498HsMk5vOlnbIUzmGOQIgKEo0hK8CvNVGuWVq6pwLeNGIXHdZNXzmFXB9Mw/ cWcJfPR8MG4buzb26lt6fTLu+aoAW+BiJWIR0mXU6ExVFD7l
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

struct i2c_driver::probe_new is about to go away. Switch the driver to
use the probe callback with the same prototype.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/media/i2c/ov01a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index de5bc19e715b..2b9e1b3a3bf4 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -992,7 +992,7 @@ static struct i2c_driver ov01a10_i2c_driver = {
 		.pm = &ov01a10_pm_ops,
 		.acpi_match_table = ACPI_PTR(ov01a10_acpi_ids),
 	},
-	.probe_new = ov01a10_probe,
+	.probe = ov01a10_probe,
 	.remove = ov01a10_remove,
 };
 

base-commit: cde0edf98f75221f299486e27a317aa02dc1cf7c
-- 
2.39.2

