Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572A52B7CE2
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 12:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbgKRLik (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 06:38:40 -0500
Received: from retiisi.eu ([95.216.213.190]:53500 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726596AbgKRLib (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 06:38:31 -0500
Received: from lanttu.localdomain (lanttu.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::c1:2])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 62D28634CA3;
        Wed, 18 Nov 2020 13:38:17 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH 08/29] smiapp: Use MIPI CCS version and manufacturer ID information
Date:   Wed, 18 Nov 2020 13:30:50 +0200
Message-Id: <20201118113111.2548-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201118113111.2548-1-sakari.ailus@linux.intel.com>
References: <20201118113111.2548-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Read MIPI CCS manufacturer and version information, and use the CCS IDs
over SMIA whenever they are set.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 76 +++++++++++++++++++-------
 drivers/media/i2c/smiapp/smiapp.h      | 20 ++++---
 2 files changed, 68 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 75862e7647f8..bc9c80221d2f 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -2356,9 +2356,14 @@ smiapp_sysfs_ident_read(struct device *dev, struct device_attribute *attr,
 	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
 	struct smiapp_module_info *minfo = &sensor->minfo;
 
-	return snprintf(buf, PAGE_SIZE, "%2.2x%4.4x%2.2x\n",
-			minfo->manufacturer_id, minfo->model_id,
-			minfo->revision_number_major) + 1;
+	if (minfo->mipi_manufacturer_id)
+		return snprintf(buf, PAGE_SIZE, "%4.4x%4.4x%2.2x\n",
+				minfo->mipi_manufacturer_id, minfo->model_id,
+				minfo->revision_number_major) + 1;
+	else
+		return snprintf(buf, PAGE_SIZE, "%2.2x%4.4x%2.2x\n",
+				minfo->smia_manufacturer_id, minfo->model_id,
+				minfo->revision_number_major) + 1;
 }
 
 static DEVICE_ATTR(ident, S_IRUGO, smiapp_sysfs_ident_read, NULL);
@@ -2377,8 +2382,11 @@ static int smiapp_identify_module(struct smiapp_sensor *sensor)
 	minfo->name = SMIAPP_NAME;
 
 	/* Module info */
-	rval = smiapp_read_8only(sensor, SMIAPP_REG_U8_MANUFACTURER_ID,
-				 &minfo->manufacturer_id);
+	rval = ccs_read(sensor, MODULE_MANUFACTURER_ID,
+			&minfo->mipi_manufacturer_id);
+	if (!rval && !minfo->mipi_manufacturer_id)
+		rval = smiapp_read_8only(sensor, SMIAPP_REG_U8_MANUFACTURER_ID,
+					 &minfo->smia_manufacturer_id);
 	if (!rval)
 		rval = smiapp_read_8only(sensor, SMIAPP_REG_U16_MODEL_ID,
 					 &minfo->model_id);
@@ -2404,9 +2412,12 @@ static int smiapp_identify_module(struct smiapp_sensor *sensor)
 
 	/* Sensor info */
 	if (!rval)
+		rval = ccs_read(sensor, SENSOR_MANUFACTURER_ID,
+				&minfo->sensor_mipi_manufacturer_id);
+	if (!rval && !minfo->sensor_mipi_manufacturer_id)
 		rval = smiapp_read_8only(sensor,
 					 SMIAPP_REG_U8_SENSOR_MANUFACTURER_ID,
-					 &minfo->sensor_manufacturer_id);
+					 &minfo->sensor_smia_manufacturer_id);
 	if (!rval)
 		rval = smiapp_read_8only(sensor,
 					 SMIAPP_REG_U16_SENSOR_MODEL_ID,
@@ -2422,9 +2433,11 @@ static int smiapp_identify_module(struct smiapp_sensor *sensor)
 
 	/* SMIA */
 	if (!rval)
+		rval = ccs_read(sensor, MIPI_CCS_VERSION, &minfo->ccs_version);
+	if (!rval && !minfo->ccs_version)
 		rval = smiapp_read_8only(sensor, SMIAPP_REG_U8_SMIA_VERSION,
 					 &minfo->smia_version);
-	if (!rval)
+	if (!rval && !minfo->ccs_version)
 		rval = smiapp_read_8only(sensor, SMIAPP_REG_U8_SMIAPP_VERSION,
 					 &minfo->smiapp_version);
 
@@ -2433,38 +2446,62 @@ static int smiapp_identify_module(struct smiapp_sensor *sensor)
 		return -ENODEV;
 	}
 
-	dev_dbg(&client->dev, "module 0x%2.2x-0x%4.4x\n",
-		minfo->manufacturer_id, minfo->model_id);
+	if (minfo->mipi_manufacturer_id)
+		dev_dbg(&client->dev, "MIPI CCS module 0x%4.4x-0x%4.4x\n",
+			minfo->mipi_manufacturer_id, minfo->model_id);
+	else
+		dev_dbg(&client->dev, "SMIA module 0x%2.2x-0x%4.4x\n",
+			minfo->smia_manufacturer_id, minfo->model_id);
 
 	dev_dbg(&client->dev,
 		"module revision 0x%2.2x-0x%2.2x date %2.2d-%2.2d-%2.2d\n",
 		minfo->revision_number_major, minfo->revision_number_minor,
 		minfo->module_year, minfo->module_month, minfo->module_day);
 
-	dev_dbg(&client->dev, "sensor 0x%2.2x-0x%4.4x\n",
-		minfo->sensor_manufacturer_id, minfo->sensor_model_id);
+	if (minfo->sensor_mipi_manufacturer_id)
+		dev_dbg(&client->dev, "MIPI CCS sensor 0x%4.4x-0x%4.4x\n",
+			minfo->sensor_mipi_manufacturer_id,
+			minfo->sensor_model_id);
+	else
+		dev_dbg(&client->dev, "SMIA sensor 0x%2.2x-0x%4.4x\n",
+			minfo->sensor_smia_manufacturer_id,
+			minfo->sensor_model_id);
 
 	dev_dbg(&client->dev,
 		"sensor revision 0x%2.2x firmware version 0x%2.2x\n",
 		minfo->sensor_revision_number, minfo->sensor_firmware_version);
 
-	dev_dbg(&client->dev, "smia version %2.2d smiapp version %2.2d\n",
-		minfo->smia_version, minfo->smiapp_version);
+	if (minfo->ccs_version)
+		dev_dbg(&client->dev, "MIPI CCS version %u.%u",
+			(minfo->ccs_version & CCS_MIPI_CCS_VERSION_MAJOR_MASK)
+			>> CCS_MIPI_CCS_VERSION_MAJOR_SHIFT,
+			(minfo->ccs_version & CCS_MIPI_CCS_VERSION_MINOR_MASK));
+	else
+		dev_dbg(&client->dev,
+			"smia version %2.2d smiapp version %2.2d\n",
+			minfo->smia_version, minfo->smiapp_version);
 
 	/*
 	 * Some modules have bad data in the lvalues below. Hope the
 	 * rvalues have better stuff. The lvalues are module
 	 * parameters whereas the rvalues are sensor parameters.
 	 */
-	if (!minfo->manufacturer_id && !minfo->model_id) {
-		minfo->manufacturer_id = minfo->sensor_manufacturer_id;
+	if (minfo->sensor_smia_manufacturer_id &&
+	    !minfo->smia_manufacturer_id && !minfo->model_id) {
+		minfo->smia_manufacturer_id =
+			minfo->sensor_smia_manufacturer_id;
 		minfo->model_id = minfo->sensor_model_id;
 		minfo->revision_number_major = minfo->sensor_revision_number;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(smiapp_module_idents); i++) {
-		if (smiapp_module_idents[i].manufacturer_id
-		    != minfo->manufacturer_id)
+		if (smiapp_module_idents[i].mipi_manufacturer_id &&
+		    smiapp_module_idents[i].mipi_manufacturer_id
+		    != minfo->mipi_manufacturer_id)
+			continue;
+		if (smiapp_module_idents[i].smia_manufacturer_id &&
+		    smiapp_module_idents[i].smia_manufacturer_id
+		    != minfo->smia_manufacturer_id)
 			continue;
 		if (smiapp_module_idents[i].model_id != minfo->model_id)
 			continue;
@@ -2488,9 +2525,8 @@ static int smiapp_identify_module(struct smiapp_sensor *sensor)
 		dev_warn(&client->dev,
 			 "no quirks for this module; let's hope it's fully compliant\n");
 
-	dev_dbg(&client->dev, "the sensor is called %s, ident %2.2x%4.4x%2.2x\n",
-		minfo->name, minfo->manufacturer_id, minfo->model_id,
-		minfo->revision_number_major);
+	dev_dbg(&client->dev, "the sensor is called %s\n",
+		minfo->name);
 
 	return 0;
 }
diff --git a/drivers/media/i2c/smiapp/smiapp.h b/drivers/media/i2c/smiapp/smiapp.h
index 7cef97db7f47..b1d0e3d71630 100644
--- a/drivers/media/i2c/smiapp/smiapp.h
+++ b/drivers/media/i2c/smiapp/smiapp.h
@@ -91,8 +91,9 @@ struct smiapp_quirk;
 #define SMIAPP_MODULE_IDENT_FLAG_REV_LE		(1 << 0)
 
 struct smiapp_module_ident {
-	u8 manufacturer_id;
+	u16 mipi_manufacturer_id;
 	u16 model_id;
+	u8 smia_manufacturer_id;
 	u8 revision_number_major;
 
 	u8 flags;
@@ -102,7 +103,8 @@ struct smiapp_module_ident {
 };
 
 struct smiapp_module_info {
-	u32 manufacturer_id;
+	u32 smia_manufacturer_id;
+	u32 mipi_manufacturer_id;
 	u32 model_id;
 	u32 revision_number_major;
 	u32 revision_number_minor;
@@ -111,13 +113,15 @@ struct smiapp_module_info {
 	u32 module_month;
 	u32 module_day;
 
-	u32 sensor_manufacturer_id;
+	u32 sensor_smia_manufacturer_id;
+	u32 sensor_mipi_manufacturer_id;
 	u32 sensor_model_id;
 	u32 sensor_revision_number;
 	u32 sensor_firmware_version;
 
 	u32 smia_version;
 	u32 smiapp_version;
+	u32 ccs_version;
 
 	u32 smiapp_profile;
 
@@ -126,7 +130,7 @@ struct smiapp_module_info {
 };
 
 #define SMIAPP_IDENT_FQ(manufacturer, model, rev, fl, _name, _quirk)	\
-	{ .manufacturer_id = manufacturer,				\
+	{ .smia_manufacturer_id = manufacturer,				\
 	  .model_id = model,						\
 	  .revision_number_major = rev,					\
 	  .flags = fl,							\
@@ -134,7 +138,7 @@ struct smiapp_module_info {
 	  .quirk = _quirk, }
 
 #define SMIAPP_IDENT_LQ(manufacturer, model, rev, _name, _quirk)	\
-	{ .manufacturer_id = manufacturer,				\
+	{ .smia_manufacturer_id = manufacturer,				\
 	  .model_id = model,						\
 	  .revision_number_major = rev,					\
 	  .flags = SMIAPP_MODULE_IDENT_FLAG_REV_LE,			\
@@ -142,14 +146,14 @@ struct smiapp_module_info {
 	  .quirk = _quirk, }
 
 #define SMIAPP_IDENT_L(manufacturer, model, rev, _name)			\
-	{ .manufacturer_id = manufacturer,				\
+	{ .smia_manufacturer_id = manufacturer,				\
 	  .model_id = model,						\
 	  .revision_number_major = rev,					\
 	  .flags = SMIAPP_MODULE_IDENT_FLAG_REV_LE,			\
 	  .name = _name, }
 
 #define SMIAPP_IDENT_Q(manufacturer, model, rev, _name, _quirk)		\
-	{ .manufacturer_id = manufacturer,				\
+	{ .smia_manufacturer_id = manufacturer,				\
 	  .model_id = model,						\
 	  .revision_number_major = rev,					\
 	  .flags = 0,							\
@@ -157,7 +161,7 @@ struct smiapp_module_info {
 	  .quirk = _quirk, }
 
 #define SMIAPP_IDENT(manufacturer, model, rev, _name)			\
-	{ .manufacturer_id = manufacturer,				\
+	{ .smia_manufacturer_id = manufacturer,				\
 	  .model_id = model,						\
 	  .revision_number_major = rev,					\
 	  .flags = 0,							\
-- 
2.27.0

