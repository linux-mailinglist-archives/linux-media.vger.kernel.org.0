Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE8A4285B20
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbgJGIqI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:08 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57052 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727915AbgJGIqF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:05 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 1E0C5634C8E
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:18 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 034/106] ccs: Combine revision number major and minor into one
Date:   Wed,  7 Oct 2020 11:44:47 +0300
Message-Id: <20201007084557.25843-27-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The module revision number major and minor are both 8 bits while the
sensor revision number is 16 bits. Combine the module revision into one
number.

This also adds printing the lowest 8 bits of the module version through
the sysfs attribute.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c  | 25 ++++++++++++++-----------
 drivers/media/i2c/ccs/ccs-quirk.c |  2 +-
 drivers/media/i2c/ccs/ccs.h       |  3 +--
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 19ff15eda246..34e86ddbb06a 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2421,11 +2421,11 @@ ccs_sysfs_ident_read(struct device *dev, struct device_attribute *attr,
 	if (minfo->mipi_manufacturer_id)
 		return snprintf(buf, PAGE_SIZE, "%4.4x%4.4x%2.2x\n",
 				minfo->mipi_manufacturer_id, minfo->model_id,
-				minfo->revision_number_major) + 1;
+				minfo->revision_number) + 1;
 	else
 		return snprintf(buf, PAGE_SIZE, "%2.2x%4.4x%2.2x\n",
 				minfo->smia_manufacturer_id, minfo->model_id,
-				minfo->revision_number_major) + 1;
+				minfo->revision_number) + 1;
 }
 
 static DEVICE_ATTR(ident, S_IRUGO, ccs_sysfs_ident_read, NULL);
@@ -2439,6 +2439,7 @@ static int ccs_identify_module(struct ccs_sensor *sensor)
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	struct ccs_module_info *minfo = &sensor->minfo;
 	unsigned int i;
+	u32 rev;
 	int rval = 0;
 
 	/* Module info */
@@ -2454,11 +2455,13 @@ static int ccs_identify_module(struct ccs_sensor *sensor)
 	if (!rval)
 		rval = ccs_read_addr_8only(sensor,
 					   CCS_R_MODULE_REVISION_NUMBER_MAJOR,
-					   &minfo->revision_number_major);
-	if (!rval)
+					   &rev);
+	if (!rval) {
 		rval = ccs_read_addr_8only(sensor,
 					   CCS_R_MODULE_REVISION_NUMBER_MINOR,
-					   &minfo->revision_number_minor);
+					   &minfo->revision_number);
+		minfo->revision_number |= rev << 8;
+	}
 	if (!rval)
 		rval = ccs_read_addr_8only(sensor, CCS_R_MODULE_DATE_YEAR,
 					   &minfo->module_year);
@@ -2513,9 +2516,9 @@ static int ccs_identify_module(struct ccs_sensor *sensor)
 			minfo->smia_manufacturer_id, minfo->model_id);
 
 	dev_dbg(&client->dev,
-		"module revision 0x%2.2x-0x%2.2x date %2.2d-%2.2d-%2.2d\n",
-		minfo->revision_number_major, minfo->revision_number_minor,
-		minfo->module_year, minfo->module_month, minfo->module_day);
+		"module revision 0x%4.4x date %2.2d-%2.2d-%2.2d\n",
+		minfo->revision_number, minfo->module_year, minfo->module_month,
+		minfo->module_day);
 
 	if (minfo->sensor_mipi_manufacturer_id)
 		dev_dbg(&client->dev, "MIPI CCS sensor 0x%4.4x-0x%4.4x\n",
@@ -2553,7 +2556,7 @@ static int ccs_identify_module(struct ccs_sensor *sensor)
 		minfo->smia_manufacturer_id =
 			minfo->sensor_smia_manufacturer_id;
 		minfo->model_id = minfo->sensor_model_id;
-		minfo->revision_number_major = minfo->sensor_revision_number;
+		minfo->revision_number = minfo->sensor_revision_number;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(ccs_module_idents); i++) {
@@ -2570,11 +2573,11 @@ static int ccs_identify_module(struct ccs_sensor *sensor)
 		if (ccs_module_idents[i].flags
 		    & CCS_MODULE_IDENT_FLAG_REV_LE) {
 			if (ccs_module_idents[i].revision_number_major
-			    < minfo->revision_number_major)
+			    < (minfo->revision_number >> 8))
 				continue;
 		} else {
 			if (ccs_module_idents[i].revision_number_major
-			    != minfo->revision_number_major)
+			    != (minfo->revision_number >> 8))
 				continue;
 		}
 
diff --git a/drivers/media/i2c/ccs/ccs-quirk.c b/drivers/media/i2c/ccs/ccs-quirk.c
index facec28f8447..07c5733b4244 100644
--- a/drivers/media/i2c/ccs/ccs-quirk.c
+++ b/drivers/media/i2c/ccs/ccs-quirk.c
@@ -35,7 +35,7 @@ static int ccs_write_addr_8s(struct ccs_sensor *sensor,
 
 static int jt8ew9_limits(struct ccs_sensor *sensor)
 {
-	if (sensor->minfo.revision_number_major < 0x03)
+	if (sensor->minfo.revision_number < 0x0300)
 		sensor->frame_skip = 1;
 
 	/* Below 24 gain doesn't have effect at all, */
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 2d1e8339f663..ad2ff5a74424 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -107,8 +107,7 @@ struct ccs_module_info {
 	u32 smia_manufacturer_id;
 	u32 mipi_manufacturer_id;
 	u32 model_id;
-	u32 revision_number_major;
-	u32 revision_number_minor;
+	u32 revision_number;
 
 	u32 module_year;
 	u32 module_month;
-- 
2.27.0

