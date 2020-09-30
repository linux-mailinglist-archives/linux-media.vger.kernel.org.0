Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4332727ECFA
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731198AbgI3Paa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:30:30 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44644 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730722AbgI3P3C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:02 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id E23F9634C93
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:46 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 009/100] smiapp: Obtain frame descriptor from CCS limits
Date:   Wed, 30 Sep 2020 18:27:27 +0300
Message-Id: <20200930152858.8471-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Obtain the frame descriptor from the CCS limits, instead of reading them
directly from the frame descriptor registers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 70 +++++++++++---------------
 1 file changed, 30 insertions(+), 40 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index a7cbd9029caa..af94df9dbc7d 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -228,34 +228,29 @@ static int ccs_read_all_limits(struct smiapp_sensor *sensor)
 static int smiapp_read_frame_fmt(struct smiapp_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
-	u32 fmt_model_type, fmt_model_subtype, ncol_desc, nrow_desc;
+	u8 fmt_model_type, fmt_model_subtype, ncol_desc, nrow_desc;
 	unsigned int i;
 	int pixel_count = 0;
 	int line_count = 0;
-	int rval;
-
-	rval = smiapp_read(sensor, SMIAPP_REG_U8_FRAME_FORMAT_MODEL_TYPE,
-			   &fmt_model_type);
-	if (rval)
-		return rval;
 
-	rval = smiapp_read(sensor, SMIAPP_REG_U8_FRAME_FORMAT_MODEL_SUBTYPE,
-			   &fmt_model_subtype);
-	if (rval)
-		return rval;
+	fmt_model_type = CCS_LIM(sensor, FRAME_FORMAT_MODEL_TYPE);
+	fmt_model_subtype = CCS_LIM(sensor, FRAME_FORMAT_MODEL_SUBTYPE);
 
 	ncol_desc = (fmt_model_subtype
-		     & SMIAPP_FRAME_FORMAT_MODEL_SUBTYPE_NCOLS_MASK)
-		>> SMIAPP_FRAME_FORMAT_MODEL_SUBTYPE_NCOLS_SHIFT;
+		     & CCS_FRAME_FORMAT_MODEL_SUBTYPE_COLUMNS_MASK)
+		>> CCS_FRAME_FORMAT_MODEL_SUBTYPE_COLUMNS_SHIFT;
 	nrow_desc = fmt_model_subtype
-		& SMIAPP_FRAME_FORMAT_MODEL_SUBTYPE_NROWS_MASK;
+		& CCS_FRAME_FORMAT_MODEL_SUBTYPE_ROWS_MASK;
 
 	dev_dbg(&client->dev, "format_model_type %s\n",
-		fmt_model_type == SMIAPP_FRAME_FORMAT_MODEL_TYPE_2BYTE
+		fmt_model_type == CCS_FRAME_FORMAT_MODEL_TYPE_2_BYTE
 		? "2 byte" :
-		fmt_model_type == SMIAPP_FRAME_FORMAT_MODEL_TYPE_4BYTE
+		fmt_model_type == CCS_FRAME_FORMAT_MODEL_TYPE_4_BYTE
 		? "4 byte" : "is simply bad");
 
+	dev_dbg(&client->dev, "%u column and %u row descriptors\n",
+		ncol_desc, nrow_desc);
+
 	for (i = 0; i < ncol_desc + nrow_desc; i++) {
 		u32 desc;
 		u32 pixelcode;
@@ -264,29 +259,24 @@ static int smiapp_read_frame_fmt(struct smiapp_sensor *sensor)
 		char *what;
 		u32 reg;
 
-		if (fmt_model_type == SMIAPP_FRAME_FORMAT_MODEL_TYPE_2BYTE) {
-			reg = SMIAPP_REG_U16_FRAME_FORMAT_DESCRIPTOR_2(i);
-			rval = smiapp_read(sensor, reg,	&desc);
-			if (rval)
-				return rval;
+		if (fmt_model_type == CCS_FRAME_FORMAT_MODEL_TYPE_2_BYTE) {
+			desc = CCS_LIM_AT(sensor, FRAME_FORMAT_DESCRIPTOR, i);
 
 			pixelcode =
 				(desc
-				 & SMIAPP_FRAME_FORMAT_DESC_2_PIXELCODE_MASK)
-				>> SMIAPP_FRAME_FORMAT_DESC_2_PIXELCODE_SHIFT;
-			pixels = desc & SMIAPP_FRAME_FORMAT_DESC_2_PIXELS_MASK;
+				 & CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_MASK)
+				>> CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_SHIFT;
+			pixels = desc & CCS_FRAME_FORMAT_DESCRIPTOR_PIXELS_MASK;
 		} else if (fmt_model_type
-			   == SMIAPP_FRAME_FORMAT_MODEL_TYPE_4BYTE) {
-			reg = SMIAPP_REG_U32_FRAME_FORMAT_DESCRIPTOR_4(i);
-			rval = smiapp_read(sensor, reg, &desc);
-			if (rval)
-				return rval;
+			   == CCS_FRAME_FORMAT_MODEL_TYPE_4_BYTE) {
+			desc = CCS_LIM_AT(sensor, FRAME_FORMAT_DESCRIPTOR_4, i);
 
 			pixelcode =
 				(desc
-				 & SMIAPP_FRAME_FORMAT_DESC_4_PIXELCODE_MASK)
-				>> SMIAPP_FRAME_FORMAT_DESC_4_PIXELCODE_SHIFT;
-			pixels = desc & SMIAPP_FRAME_FORMAT_DESC_4_PIXELS_MASK;
+				 & CCS_FRAME_FORMAT_DESCRIPTOR_4_PCODE_MASK)
+				>> CCS_FRAME_FORMAT_DESCRIPTOR_4_PCODE_SHIFT;
+			pixels = desc &
+				CCS_FRAME_FORMAT_DESCRIPTOR_4_PIXELS_MASK;
 		} else {
 			dev_dbg(&client->dev,
 				"invalid frame format model type %d\n",
@@ -300,19 +290,19 @@ static int smiapp_read_frame_fmt(struct smiapp_sensor *sensor)
 			which = "rows";
 
 		switch (pixelcode) {
-		case SMIAPP_FRAME_FORMAT_DESC_PIXELCODE_EMBEDDED:
+		case CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_EMBEDDED:
 			what = "embedded";
 			break;
-		case SMIAPP_FRAME_FORMAT_DESC_PIXELCODE_DUMMY:
+		case CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_DUMMY_PIXEL:
 			what = "dummy";
 			break;
-		case SMIAPP_FRAME_FORMAT_DESC_PIXELCODE_BLACK:
+		case CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_BLACK_PIXEL:
 			what = "black";
 			break;
-		case SMIAPP_FRAME_FORMAT_DESC_PIXELCODE_DARK:
+		case CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_DARK_PIXEL:
 			what = "dark";
 			break;
-		case SMIAPP_FRAME_FORMAT_DESC_PIXELCODE_VISIBLE:
+		case CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_VISIBLE_PIXEL:
 			what = "visible";
 			break;
 		default:
@@ -326,7 +316,7 @@ static int smiapp_read_frame_fmt(struct smiapp_sensor *sensor)
 
 		if (i < ncol_desc) {
 			if (pixelcode ==
-			    SMIAPP_FRAME_FORMAT_DESC_PIXELCODE_VISIBLE)
+			    CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_VISIBLE_PIXEL)
 				sensor->visible_pixel_start = pixel_count;
 			pixel_count += pixels;
 			continue;
@@ -334,13 +324,13 @@ static int smiapp_read_frame_fmt(struct smiapp_sensor *sensor)
 
 		/* Handle row descriptors */
 		switch (pixelcode) {
-		case SMIAPP_FRAME_FORMAT_DESC_PIXELCODE_EMBEDDED:
+		case CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_EMBEDDED:
 			if (sensor->embedded_end)
 				break;
 			sensor->embedded_start = line_count;
 			sensor->embedded_end = line_count + pixels;
 			break;
-		case SMIAPP_FRAME_FORMAT_DESC_PIXELCODE_VISIBLE:
+		case CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_VISIBLE_PIXEL:
 			sensor->image_start = line_count;
 			break;
 		}
-- 
2.27.0

