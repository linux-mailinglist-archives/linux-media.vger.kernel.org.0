Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA79B4C30B3
	for <lists+linux-media@lfdr.de>; Thu, 24 Feb 2022 17:00:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbiBXQBH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 11:01:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbiBXQBG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 11:01:06 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF3E5184627
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 08:00:25 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1nNGXW-0002yf-Bc; Thu, 24 Feb 2022 17:00:22 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1nNGXV-0012fy-Pe; Thu, 24 Feb 2022 17:00:21 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1nNGXU-00B2ML-6g; Thu, 24 Feb 2022 17:00:20 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        p.zabel@pengutronix.de, Ian Arkver <ian.arkver.dev@gmail.com>,
        kernel@pengutronix.de, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] fixup! media: i2c: isl7998x: Add driver for Intersil ISL7998x
Date:   Thu, 24 Feb 2022 17:00:20 +0100
Message-Id: <20220224160020.2630632-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YheUuCShBA6jvn8a@paasikivi.fi.intel.com>
References: <YheUuCShBA6jvn8a@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
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

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/i2c/isl7998x.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
index df124a0b401c..67ff1f508717 100644
--- a/drivers/media/i2c/isl7998x.c
+++ b/drivers/media/i2c/isl7998x.c
@@ -551,12 +551,11 @@ static unsigned int isl7998x_norm_to_val(v4l2_std_id norm)
 {
 	unsigned int i;
 
-	if (norm == V4L2_STD_UNKNOWN)
-		return ISL7998X_REG_PX_DEC_SDT_STANDARD_UNKNOWN;
-
 	for (i = 0; i < ARRAY_SIZE(isl7998x_std_res); i++)
 		if (isl7998x_std_res[i].norm & norm)
 			break;
+	if (i == ARRAY_SIZE(isl7998x_std_res))
+		return ISL7998X_REG_PX_DEC_SDT_STANDARD_UNKNOWN;
 
 	return isl7998x_std_res[i].id;
 }
@@ -565,13 +564,12 @@ static const struct isl7998x_mode *isl7998x_norm_to_mode(v4l2_std_id norm)
 {
 	unsigned int i;
 
-	/* Use NTSC default resolution during standard detection */
-	if (norm == V4L2_STD_UNKNOWN)
-		return &supported_modes[1];
-
 	for (i = 0; i < ARRAY_SIZE(isl7998x_std_res); i++)
 		if (isl7998x_std_res[i].norm & norm)
 			break;
+	/* Use NTSC default resolution during standard detection */
+	if (i == ARRAY_SIZE(isl7998x_std_res))
+		return &supported_modes[1];
 
 	return isl7998x_std_res[i].mode;
 }
-- 
2.30.2

