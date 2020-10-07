Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9585D285AD4
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727963AbgJGIqE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727915AbgJGIqB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:01 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BBB5C061755
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 01:46:01 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 71E69634C93
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:16 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 010/106] smiapp: Use CCS limits in reading data format descriptors
Date:   Wed,  7 Oct 2020 11:44:30 +0300
Message-Id: <20201007084557.25843-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CCS limits have the information so use it instead.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index af94df9dbc7d..0f703860af0e 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -842,10 +842,7 @@ static int smiapp_get_mbus_formats(struct smiapp_sensor *sensor)
 	unsigned int i, pixel_order;
 	int rval;
 
-	rval = smiapp_read(
-		sensor, SMIAPP_REG_U8_DATA_FORMAT_MODEL_TYPE, &type);
-	if (rval)
-		return rval;
+	type = CCS_LIM(sensor, DATA_FORMAT_MODEL_TYPE);
 
 	dev_dbg(&client->dev, "data_format_model_type %d\n", type);
 
@@ -863,11 +860,11 @@ static int smiapp_get_mbus_formats(struct smiapp_sensor *sensor)
 		pixel_order_str[pixel_order]);
 
 	switch (type) {
-	case SMIAPP_DATA_FORMAT_MODEL_TYPE_NORMAL:
+	case CCS_DATA_FORMAT_MODEL_TYPE_NORMAL:
 		n = SMIAPP_DATA_FORMAT_MODEL_TYPE_NORMAL_N;
 		break;
-	case SMIAPP_DATA_FORMAT_MODEL_TYPE_EXTENDED:
-		n = SMIAPP_DATA_FORMAT_MODEL_TYPE_EXTENDED_N;
+	case CCS_DATA_FORMAT_MODEL_TYPE_EXTENDED:
+		n = CCS_LIM_DATA_FORMAT_DESCRIPTOR_MAX_N + 1;
 		break;
 	default:
 		return -EINVAL;
@@ -879,11 +876,7 @@ static int smiapp_get_mbus_formats(struct smiapp_sensor *sensor)
 	for (i = 0; i < n; i++) {
 		unsigned int fmt, j;
 
-		rval = smiapp_read(
-			sensor,
-			SMIAPP_REG_U16_DATA_FORMAT_DESCRIPTOR(i), &fmt);
-		if (rval)
-			return rval;
+		fmt = CCS_LIM_AT(sensor, DATA_FORMAT_DESCRIPTOR, i);
 
 		dev_dbg(&client->dev, "%u: bpp %u, compressed %u\n",
 			i, fmt >> 8, (u8)fmt);
@@ -895,7 +888,10 @@ static int smiapp_get_mbus_formats(struct smiapp_sensor *sensor)
 			if (f->pixel_order != SMIAPP_PIXEL_ORDER_GRBG)
 				continue;
 
-			if (f->width != fmt >> 8 || f->compressed != (u8)fmt)
+			if (f->width != fmt >>
+			    CCS_DATA_FORMAT_DESCRIPTOR_UNCOMPRESSED_SHIFT ||
+			    f->compressed !=
+			    (fmt & CCS_DATA_FORMAT_DESCRIPTOR_COMPRESSED_MASK))
 				continue;
 
 			dev_dbg(&client->dev, "jolly good! %d\n", j);
-- 
2.27.0

