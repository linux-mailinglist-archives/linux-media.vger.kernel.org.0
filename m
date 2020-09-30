Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6C927ECF8
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731195AbgI3Paa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:30:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730791AbgI3P3C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:02 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0751C061755
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 08:29:02 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id A24F3634C91
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:46 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 007/100] smiapp: Read CCS limit values
Date:   Wed, 30 Sep 2020 18:27:25 +0300
Message-Id: <20200930152858.8471-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Read limit and capability values into a driver allocated buffer. This will
later replace (most of) the existing SMIA limits.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 177 ++++++++++++++++++++++++-
 drivers/media/i2c/smiapp/smiapp.h      |   4 +
 2 files changed, 176 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 10900ac4aa1a..42df98740445 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -28,6 +28,7 @@
 #include <media/v4l2-device.h>
 
 #include "ccs-limits.h"
+#include "ccs-regs.h"
 #include "smiapp.h"
 
 #define SMIAPP_ALIGN_DIM(dim, flags)	\
@@ -102,6 +103,164 @@ static int smiapp_read_all_smia_limits(struct smiapp_sensor *sensor)
 	return 0;
 }
 
+static void ccs_assign_limit(void *ptr, unsigned int width, u32 val)
+{
+	switch (width) {
+	case sizeof(u8):
+		*(u8 *)ptr = val;
+		break;
+	case sizeof(u16):
+		*(u16 *)ptr = val;
+		break;
+	case sizeof(u32):
+		*(u32 *)ptr = val;
+		break;
+	}
+}
+
+static int ccs_limit_ptr(struct smiapp_sensor *sensor, unsigned int limit,
+			 unsigned int offset, void **__ptr)
+{
+	const struct ccs_limit *linfo;
+
+	if (WARN_ON(limit >= CCS_L_LAST))
+		return -EINVAL;
+
+	linfo = &ccs_limits[ccs_limit_offsets[limit].info];
+
+	if (WARN_ON(!sensor->ccs_limits) ||
+	    WARN_ON(offset + ccs_reg_width(linfo->reg) >
+		    ccs_limit_offsets[limit + 1].lim))
+		return -EINVAL;
+
+	*__ptr = sensor->ccs_limits + ccs_limit_offsets[limit].lim + offset;
+
+	return 0;
+}
+
+void ccs_replace_limit(struct smiapp_sensor *sensor,
+		       unsigned int limit, unsigned int offset, u32 val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
+	const struct ccs_limit *linfo;
+	void *ptr;
+	int ret;
+
+	ret = ccs_limit_ptr(sensor, limit, offset, &ptr);
+	if (ret)
+		return;
+
+	linfo = &ccs_limits[ccs_limit_offsets[limit].info];
+
+	dev_dbg(&client->dev, "quirk: 0x%8.8x \"%s\" %u = %d, 0x%x\n",
+		linfo->reg, linfo->name, offset, val, val);
+
+	ccs_assign_limit(ptr, ccs_reg_width(linfo->reg), val);
+}
+
+static u32 ccs_get_limit(struct smiapp_sensor *sensor,
+			 unsigned int limit, unsigned int offset)
+{
+	void *ptr;
+	int ret;
+
+	ret = ccs_limit_ptr(sensor, limit, offset, &ptr);
+	if (ret)
+		return 0;
+
+	switch (ccs_reg_width(ccs_limits[ccs_limit_offsets[limit].info].reg)) {
+	case sizeof(u8):
+		return *(u8 *)ptr;
+	case sizeof(u16):
+		return *(u16 *)ptr;
+	case sizeof(u32):
+		return *(u32 *)ptr;
+	}
+
+	WARN_ON(1);
+
+	return 0;
+}
+
+#define CCS_LIM(sensor, limit) \
+	ccs_get_limit(sensor, CCS_L_##limit, 0)
+
+#define CCS_LIM_AT(sensor, limit, offset)	\
+	ccs_get_limit(sensor, CCS_L_##limit, CCS_L_##limit##_OFFSET(offset))
+
+static int ccs_read_all_limits(struct smiapp_sensor *sensor)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
+	void *ptr, *alloc, *end;
+	unsigned int i, l;
+	int ret;
+
+	kfree(sensor->ccs_limits);
+	sensor->ccs_limits = NULL;
+
+	alloc = kzalloc(ccs_limit_offsets[CCS_L_LAST].lim, GFP_KERNEL);
+	if (!alloc)
+		return -ENOMEM;
+
+	end = alloc + ccs_limit_offsets[CCS_L_LAST].lim;
+
+	for (i = 0, l = 0, ptr = alloc; ccs_limits[i].size; i++) {
+		u32 reg = ccs_limits[i].reg;
+		unsigned int width = ccs_reg_width(reg);
+		unsigned int j;
+
+		if (l == CCS_L_LAST) {
+			dev_err(&client->dev,
+				"internal error --- end of limit array\n");
+			ret = -EINVAL;
+			goto out_err;
+		}
+
+		for (j = 0; j < ccs_limits[i].size / width;
+		     j++, reg += width, ptr += width) {
+			u32 val;
+
+			ret = smiapp_read(sensor, reg, &val);
+			if (ret)
+				goto out_err;
+
+			if (ptr + width > end) {
+				dev_err(&client->dev,
+					"internal error --- no room for regs\n");
+				ret = -EINVAL;
+				goto out_err;
+			}
+
+			ccs_assign_limit(ptr, width, val);
+
+			dev_dbg(&client->dev, "0x%8.8x \"%s\" = %u, 0x%x\n",
+				reg, ccs_limits[i].name, val, val);
+		}
+
+		if (ccs_limits[i].flags & CCS_L_FL_SAME_REG)
+			continue;
+
+		l++;
+		ptr = alloc + ccs_limit_offsets[l].lim;
+	}
+
+	if (l != CCS_L_LAST) {
+		dev_err(&client->dev,
+			"internal error --- insufficient limits\n");
+		ret = -EINVAL;
+		goto out_err;
+	}
+
+	sensor->ccs_limits = alloc;
+
+	return 0;
+
+out_err:
+	kfree(alloc);
+
+	return ret;
+}
+
 static int smiapp_read_frame_fmt(struct smiapp_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
@@ -2970,10 +3129,14 @@ static int smiapp_probe(struct i2c_client *client)
 		goto out_power_off;
 	}
 
+	rval = ccs_read_all_limits(sensor);
+	if (rval)
+		goto out_power_off;
+
 	rval = smiapp_read_frame_fmt(sensor);
 	if (rval) {
 		rval = -ENODEV;
-		goto out_power_off;
+		goto out_free_ccs_limits;
 	}
 
 	/*
@@ -2997,7 +3160,7 @@ static int smiapp_probe(struct i2c_client *client)
 	rval = smiapp_call_quirk(sensor, limits);
 	if (rval) {
 		dev_err(&client->dev, "limits quirks failed\n");
-		goto out_power_off;
+		goto out_free_ccs_limits;
 	}
 
 	if (SMIA_LIM(sensor, BINNING_CAPABILITY)) {
@@ -3007,7 +3170,7 @@ static int smiapp_probe(struct i2c_client *client)
 				   SMIAPP_REG_U8_BINNING_SUBTYPES, &val);
 		if (rval < 0) {
 			rval = -ENODEV;
-			goto out_power_off;
+			goto out_free_ccs_limits;
 		}
 		sensor->nbinning_subtypes = min_t(u8, val,
 						  SMIAPP_BINNING_SUBTYPES);
@@ -3017,7 +3180,7 @@ static int smiapp_probe(struct i2c_client *client)
 				sensor, SMIAPP_REG_U8_BINNING_TYPE_n(i), &val);
 			if (rval < 0) {
 				rval = -ENODEV;
-				goto out_power_off;
+				goto out_free_ccs_limits;
 			}
 			sensor->binning_subtypes[i] =
 				*(struct smiapp_binning_subtype *)&val;
@@ -3033,7 +3196,7 @@ static int smiapp_probe(struct i2c_client *client)
 	if (device_create_file(&client->dev, &dev_attr_ident) != 0) {
 		dev_err(&client->dev, "sysfs ident entry creation failed\n");
 		rval = -ENOENT;
-		goto out_power_off;
+		goto out_free_ccs_limits;
 	}
 
 	if (sensor->minfo.smiapp_version &&
@@ -3150,6 +3313,9 @@ static int smiapp_probe(struct i2c_client *client)
 out_cleanup:
 	smiapp_cleanup(sensor);
 
+out_free_ccs_limits:
+	kfree(sensor->ccs_limits);
+
 out_power_off:
 	smiapp_power_off(&client->dev);
 	mutex_destroy(&sensor->mutex);
@@ -3176,6 +3342,7 @@ static int smiapp_remove(struct i2c_client *client)
 	}
 	smiapp_cleanup(sensor);
 	mutex_destroy(&sensor->mutex);
+	kfree(sensor->ccs_limits);
 
 	return 0;
 }
diff --git a/drivers/media/i2c/smiapp/smiapp.h b/drivers/media/i2c/smiapp/smiapp.h
index b1d0e3d71630..08ca1b3d1b2f 100644
--- a/drivers/media/i2c/smiapp/smiapp.h
+++ b/drivers/media/i2c/smiapp/smiapp.h
@@ -228,6 +228,7 @@ struct smiapp_sensor {
 	struct clk *ext_clk;
 	struct gpio_desc *xshutdown;
 	u32 limits[SMIAPP_LIMIT_LAST];
+	void *ccs_limits;
 	u8 nbinning_subtypes;
 	struct smiapp_binning_subtype binning_subtypes[SMIAPP_BINNING_SUBTYPES];
 	u32 mbus_frame_fmts;
@@ -281,4 +282,7 @@ struct smiapp_sensor {
 #define to_smiapp_sensor(_sd)	\
 	(to_smiapp_subdev(_sd)->sensor)
 
+void ccs_replace_limit(struct smiapp_sensor *sensor,
+		       unsigned int limit, unsigned int offset, u32 val);
+
 #endif /* __SMIAPP_PRIV_H_ */
-- 
2.27.0

