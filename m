Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6580349FEF
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 13:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbfFRL7P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 07:59:15 -0400
Received: from retiisi.org.uk ([95.216.213.190]:36888 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726023AbfFRL7P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 07:59:15 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1001])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 17F82634C80;
        Tue, 18 Jun 2019 14:58:49 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Robert Jarzmik <robert.jarzmik@free.fr>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: [PATCH 1/2] mt9m111: No need to check for the regulator
Date:   Tue, 18 Jun 2019 14:59:09 +0300
Message-Id: <20190618115910.17272-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190618115910.17272-1-sakari.ailus@linux.intel.com>
References: <20190618115910.17272-1-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The regulator_get() function returns a regulator when it succeeds. There's
no need to check whether the regulator is NULL later on.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/mt9m111.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index 746d1345b505..bb19f8c346cb 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -984,11 +984,9 @@ static int mt9m111_power_on(struct mt9m111 *mt9m111)
 	if (ret < 0)
 		return ret;
 
-	if (mt9m111->regulator) {
-		ret = regulator_enable(mt9m111->regulator);
-		if (ret < 0)
-			return ret;
-	}
+	ret = regulator_enable(mt9m111->regulator);
+	if (ret < 0)
+		return ret;
 
 	ret = mt9m111_resume(mt9m111);
 	if (ret < 0) {
@@ -1002,8 +1000,7 @@ static int mt9m111_power_on(struct mt9m111 *mt9m111)
 static void mt9m111_power_off(struct mt9m111 *mt9m111)
 {
 	mt9m111_suspend(mt9m111);
-	if (mt9m111->regulator)
-		regulator_disable(mt9m111->regulator);
+	regulator_disable(mt9m111->regulator);
 	v4l2_clk_disable(mt9m111->clk);
 }
 
-- 
2.11.0

