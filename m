Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1462C633F
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 11:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729180AbgK0KiL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 05:38:11 -0500
Received: from retiisi.eu ([95.216.213.190]:44914 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728941AbgK0KiK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 05:38:10 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id D4323634CA1;
        Fri, 27 Nov 2020 12:37:16 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH v2 15/29] smiapp: Remove quirk function for writing a single 8-bit register
Date:   Fri, 27 Nov 2020 12:33:11 +0200
Message-Id: <20201127103325.29814-16-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201127103325.29814-1-sakari.ailus@linux.intel.com>
References: <20201127103325.29814-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This function is no longer needed as the smiapp_write() function can be
used to write 8-bit registers with plain register addresses.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-quirk.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-quirk.c b/drivers/media/i2c/smiapp/smiapp-quirk.c
index 24630c7650d2..9422eb61b424 100644
--- a/drivers/media/i2c/smiapp/smiapp-quirk.c
+++ b/drivers/media/i2c/smiapp/smiapp-quirk.c
@@ -14,11 +14,6 @@
 
 #include "smiapp.h"
 
-static int smiapp_write_8(struct smiapp_sensor *sensor, u16 reg, u8 val)
-{
-	return smiapp_write(sensor, reg, val);
-}
-
 static int smiapp_write_8s(struct smiapp_sensor *sensor,
 			   const struct smiapp_reg_8 *regs, int len)
 {
@@ -26,7 +21,7 @@ static int smiapp_write_8s(struct smiapp_sensor *sensor,
 	int rval;
 
 	for (; len > 0; len--, regs++) {
-		rval = smiapp_write_8(sensor, regs->reg, regs->val);
+		rval = smiapp_write(sensor, regs->reg, regs->val);
 		if (rval < 0) {
 			dev_err(&client->dev,
 				"error %d writing reg 0x%4.4x, val 0x%2.2x",
@@ -170,7 +165,7 @@ static int jt8ev1_post_poweron(struct smiapp_sensor *sensor)
 
 static int jt8ev1_pre_streamon(struct smiapp_sensor *sensor)
 {
-	return smiapp_write_8(sensor, 0x3328, 0x00);
+	return smiapp_write(sensor, 0x3328, 0x00);
 }
 
 static int jt8ev1_post_streamoff(struct smiapp_sensor *sensor)
@@ -178,7 +173,7 @@ static int jt8ev1_post_streamoff(struct smiapp_sensor *sensor)
 	int rval;
 
 	/* Workaround: allows fast standby to work properly */
-	rval = smiapp_write_8(sensor, 0x3205, 0x04);
+	rval = smiapp_write(sensor, 0x3205, 0x04);
 	if (rval < 0)
 		return rval;
 
@@ -186,11 +181,11 @@ static int jt8ev1_post_streamoff(struct smiapp_sensor *sensor)
 	usleep_range(2000, 2050);
 
 	/* Restore it */
-	rval = smiapp_write_8(sensor, 0x3205, 0x00);
+	rval = smiapp_write(sensor, 0x3205, 0x00);
 	if (rval < 0)
 		return rval;
 
-	return smiapp_write_8(sensor, 0x3328, 0x80);
+	return smiapp_write(sensor, 0x3328, 0x80);
 }
 
 static int jt8ev1_init(struct smiapp_sensor *sensor)
-- 
2.27.0

