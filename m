Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCC85285ADB
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbgJGIqJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:09 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57070 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727976AbgJGIqG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:06 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id A4945634C8D
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:18 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 041/106] ccs: Move limit value real to integer conversion from read to access time
Date:   Wed,  7 Oct 2020 11:44:54 +0300
Message-Id: <20201007084557.25843-34-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of converting the limit values at register read time, do that at
access time instead.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index e01a5584b8b0..5b7f142b2432 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -124,6 +124,7 @@ static u32 ccs_get_limit(struct ccs_sensor *sensor,
 			 unsigned int limit, unsigned int offset)
 {
 	void *ptr;
+	u32 val;
 	int ret;
 
 	ret = ccs_limit_ptr(sensor, limit, offset, &ptr);
@@ -132,16 +133,20 @@ static u32 ccs_get_limit(struct ccs_sensor *sensor,
 
 	switch (ccs_reg_width(ccs_limits[ccs_limit_offsets[limit].info].reg)) {
 	case sizeof(u8):
-		return *(u8 *)ptr;
+		val = *(u8 *)ptr;
+		break;
 	case sizeof(u16):
-		return *(u16 *)ptr;
+		val = *(u16 *)ptr;
+		break;
 	case sizeof(u32):
-		return *(u32 *)ptr;
+		val = *(u32 *)ptr;
+		break;
+	default:
+		WARN_ON(1);
+		return 0;
 	}
 
-	WARN_ON(1);
-
-	return 0;
+	return ccs_reg_conv(sensor, ccs_limits[limit].reg, val);
 }
 
 #define CCS_LIM(sensor, limit) \
@@ -182,7 +187,7 @@ static int ccs_read_all_limits(struct ccs_sensor *sensor)
 		     j++, reg += width, ptr += width) {
 			u32 val;
 
-			ret = ccs_read_addr(sensor, reg, &val);
+			ret = ccs_read_addr_noconv(sensor, reg, &val);
 			if (ret)
 				goto out_err;
 
-- 
2.27.0

