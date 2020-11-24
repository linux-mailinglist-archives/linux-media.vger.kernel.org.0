Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 315602C21C6
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 10:40:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731199AbgKXJiu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 04:38:50 -0500
Received: from retiisi.eu ([95.216.213.190]:45026 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731143AbgKXJid (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 04:38:33 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id A4A0D634C93;
        Tue, 24 Nov 2020 11:37:51 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH 09/30] ccs: Combine revision number major and minor into one
Date:   Tue, 24 Nov 2020 11:32:05 +0200
Message-Id: <20201124093226.23737-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201124093226.23737-1-sakari.ailus@linux.intel.com>
References: <20201124093226.23737-1-sakari.ailus@linux.intel.com>
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
index 6fb546ca08f3..17287a8f539c 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2427,11 +2427,11 @@ ccs_sysfs_ident_read(struct device *dev, struct device_attribute *attr,
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
@@ -2445,6 +2445,7 @@ static int ccs_identify_module(struct ccs_sensor *sensor)
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	struct ccs_module_info *minfo = &sensor->minfo;
 	unsigned int i;
+	u32 rev;
 	int rval = 0;
 
 	/* Module info */
@@ -2460,11 +2461,13 @@ static int ccs_identify_module(struct ccs_sensor *sensor)
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
@@ -2519,9 +2522,9 @@ static int ccs_identify_module(struct ccs_sensor *sensor)
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
@@ -2559,7 +2562,7 @@ static int ccs_identify_module(struct ccs_sensor *sensor)
 		minfo->smia_manufacturer_id =
 			minfo->sensor_smia_manufacturer_id;
 		minfo->model_id = minfo->sensor_model_id;
-		minfo->revision_number_major = minfo->sensor_revision_number;
+		minfo->revision_number = minfo->sensor_revision_number;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(ccs_module_idents); i++) {
@@ -2576,11 +2579,11 @@ static int ccs_identify_module(struct ccs_sensor *sensor)
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

