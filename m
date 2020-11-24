Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 588EC2C21B5
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 10:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731509AbgKXJig (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 04:38:36 -0500
Received: from retiisi.eu ([95.216.213.190]:45006 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731490AbgKXJie (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 04:38:34 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 3EB1B634CA1;
        Tue, 24 Nov 2020 11:37:52 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH 16/30] ccs: Move limit value real to integer conversion from read to access time
Date:   Tue, 24 Nov 2020 11:32:12 +0200
Message-Id: <20201124093226.23737-17-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201124093226.23737-1-sakari.ailus@linux.intel.com>
References: <20201124093226.23737-1-sakari.ailus@linux.intel.com>
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
index 70b4d2180971..57efc34fc67d 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -130,6 +130,7 @@ static u32 ccs_get_limit(struct ccs_sensor *sensor,
 			 unsigned int limit, unsigned int offset)
 {
 	void *ptr;
+	u32 val;
 	int ret;
 
 	ret = ccs_limit_ptr(sensor, limit, offset, &ptr);
@@ -138,16 +139,20 @@ static u32 ccs_get_limit(struct ccs_sensor *sensor,
 
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
@@ -188,7 +193,7 @@ static int ccs_read_all_limits(struct ccs_sensor *sensor)
 		     j++, reg += width, ptr += width) {
 			u32 val;
 
-			ret = ccs_read_addr(sensor, reg, &val);
+			ret = ccs_read_addr_noconv(sensor, reg, &val);
 			if (ret)
 				goto out_err;
 
-- 
2.27.0

