Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D15BFBC69F
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 13:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504651AbfIXLXM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 07:23:12 -0400
Received: from mga06.intel.com ([134.134.136.31]:46467 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2504643AbfIXLXL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 07:23:11 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 04:23:10 -0700
X-IronPort-AV: E=Sophos;i="5.64,543,1559545200"; 
   d="scan'208";a="195665336"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 04:23:09 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 1820B21312;
        Tue, 24 Sep 2019 14:23:04 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1iCiuw-00075V-E1; Tue, 24 Sep 2019 14:23:38 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 6/7] smiapp: Support probing NVM size
Date:   Tue, 24 Sep 2019 14:23:37 +0300
Message-Id: <20190924112338.27180-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924112338.27180-1-sakari.ailus@linux.intel.com>
References: <20190924112338.27180-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The interface supports probing for the NVM size but this was not
implemented in the driver. Do that now.

This will also make nokia,nvm-size property redundant.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 103 ++++++++++++-------------
 drivers/media/i2c/smiapp/smiapp.h      |   3 -
 include/media/i2c/smiapp.h             |   1 -
 3 files changed, 50 insertions(+), 57 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 5a04ae2544aa0..a274527987b8a 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -971,10 +971,14 @@ static int smiapp_update_mode(struct smiapp_sensor *sensor)
  *
  */
 
-static int smiapp_read_nvm_page(struct smiapp_sensor *sensor, u32 p, u8 *nvm)
+static int smiapp_read_nvm_page(struct smiapp_sensor *sensor, u32 p, u8 *nvm,
+				u8 *status)
 {
 	unsigned int i;
 	int rval;
+	u32 s;
+
+	*status = 0;
 
 	rval = smiapp_write(sensor,
 			    SMIAPP_REG_U8_DATA_TRANSFER_IF_1_PAGE_SELECT, p);
@@ -986,10 +990,21 @@ static int smiapp_read_nvm_page(struct smiapp_sensor *sensor, u32 p, u8 *nvm)
 	if (rval)
 		return rval;
 
+	rval = smiapp_read(sensor, SMIAPP_REG_U8_DATA_TRANSFER_IF_1_STATUS,
+			   &s);
+	if (rval)
+		return rval;
+
+	if (s & SMIAPP_DATA_TRANSFER_IF_1_STATUS_EUSAGE) {
+		*status = s;
+		return -ENODATA;
+	}
+
 	if (sensor->limits[SMIAPP_LIMIT_DATA_TRANSFER_IF_CAPABILITY] &
 	    SMIAPP_DATA_TRANSFER_IF_CAPABILITY_POLL) {
 		for (i = 1000; i > 0; i--) {
-			u32 s;
+			if (s & SMIAPP_DATA_TRANSFER_IF_1_STATUS_RD_READY)
+				break;
 
 			rval = smiapp_read(
 				sensor,
@@ -998,10 +1013,6 @@ static int smiapp_read_nvm_page(struct smiapp_sensor *sensor, u32 p, u8 *nvm)
 
 			if (rval)
 				return rval;
-
-			if (s & SMIAPP_DATA_TRANSFER_IF_1_STATUS_RD_READY)
-				break;
-
 		}
 
 		if (!i)
@@ -1023,23 +1034,27 @@ static int smiapp_read_nvm_page(struct smiapp_sensor *sensor, u32 p, u8 *nvm)
 	return 0;
 }
 
-static int smiapp_read_nvm(struct smiapp_sensor *sensor,
-			   unsigned char *nvm)
+static int smiapp_read_nvm(struct smiapp_sensor *sensor, unsigned char *nvm,
+			   size_t nvm_size)
 {
-	u32 p, np;
+	u8 status = 0;
+	u32 p;
 	int rval = 0, rval2;
 
-	np = sensor->nvm_size / SMIAPP_NVM_PAGE_SIZE;
-	for (p = 0; p < np && !rval; p++) {
-		rval = smiapp_read_nvm_page(sensor, p, nvm);
+	for (p = 0; p < nvm_size / SMIAPP_NVM_PAGE_SIZE && !rval; p++) {
+		rval = smiapp_read_nvm_page(sensor, p, nvm, &status);
 		nvm += SMIAPP_NVM_PAGE_SIZE;
 	}
 
+	if (rval == -ENODATA &&
+	    status & SMIAPP_DATA_TRANSFER_IF_1_STATUS_EUSAGE)
+		rval = 0;
+
 	rval2 = smiapp_write(sensor, SMIAPP_REG_U8_DATA_TRANSFER_IF_1_CTRL, 0);
 	if (rval < 0)
 		return rval;
 	else
-		return rval2;
+		return rval2 ?: p * SMIAPP_NVM_PAGE_SIZE;
 }
 
 /*
@@ -2326,42 +2341,34 @@ smiapp_sysfs_nvm_read(struct device *dev, struct device_attribute *attr,
 	struct v4l2_subdev *subdev = i2c_get_clientdata(to_i2c_client(dev));
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
 	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
-	unsigned int nbytes;
+	int rval;
 
 	if (!sensor->dev_init_done)
 		return -EBUSY;
 
-	if (!sensor->nvm_size) {
-		int rval;
-
-		/* NVM not read yet - read it now */
-		sensor->nvm_size = sensor->hwcfg->nvm_size;
+	rval = pm_runtime_get_sync(&client->dev);
+	if (rval < 0) {
+		if (rval != -EBUSY && rval != -EAGAIN)
+			pm_runtime_set_active(&client->dev);
+		pm_runtime_put_noidle(&client->dev);
+		return -ENODEV;
+	}
 
-		rval = pm_runtime_get_sync(&client->dev);
-		if (rval < 0) {
-			if (rval != -EBUSY && rval != -EAGAIN)
-				pm_runtime_set_active(&client->dev);
-			pm_runtime_put_noidle(&client->dev);
-			return -ENODEV;
-		}
+	rval = smiapp_read_nvm(sensor, buf, PAGE_SIZE);
+	if (rval < 0) {
+		pm_runtime_put(&client->dev);
+		dev_err(&client->dev, "nvm read failed\n");
+		return -ENODEV;
+	}
 
-		if (smiapp_read_nvm(sensor, sensor->nvm)) {
-			pm_runtime_put(&client->dev);
-			dev_err(&client->dev, "nvm read failed\n");
-			return -ENODEV;
-		}
+	pm_runtime_mark_last_busy(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
-		pm_runtime_mark_last_busy(&client->dev);
-		pm_runtime_put_autosuspend(&client->dev);
-	}
 	/*
 	 * NVM is still way below a PAGE_SIZE, so we can safely
 	 * assume this for now.
 	 */
-	nbytes = min_t(unsigned int, sensor->nvm_size, PAGE_SIZE);
-	memcpy(buf, sensor->nvm, nbytes);
-
-	return nbytes;
+	return rval;
 }
 static DEVICE_ATTR(nvm, S_IRUGO, smiapp_sysfs_nvm_read, NULL);
 
@@ -2825,16 +2832,13 @@ static struct smiapp_hwconfig *smiapp_get_hwconfig(struct device *dev)
 		}
 	}
 
-	/* NVM size is not mandatory */
-	fwnode_property_read_u32(fwnode, "nokia,nvm-size", &hwcfg->nvm_size);
-
 	rval = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
 					&hwcfg->ext_clk);
 	if (rval)
 		dev_info(dev, "can't get clock-frequency\n");
 
-	dev_dbg(dev, "nvm %d, clk %d, mode %d\n",
-		hwcfg->nvm_size, hwcfg->ext_clk, hwcfg->csi_signalling_mode);
+	dev_dbg(dev, "clk %d, mode %d\n", hwcfg->ext_clk,
+		hwcfg->csi_signalling_mode);
 
 	if (!bus_cfg.nr_of_link_frequencies) {
 		dev_warn(dev, "no link frequencies defined\n");
@@ -3018,17 +3022,10 @@ static int smiapp_probe(struct i2c_client *client)
 		rval = -ENOENT;
 		goto out_power_off;
 	}
-	/* SMIA++ NVM initialization - it will be read from the sensor
-	 * when it is first requested by userspace.
-	 */
-	if (sensor->minfo.smiapp_version && sensor->hwcfg->nvm_size) {
-		sensor->nvm = devm_kzalloc(&client->dev,
-				sensor->hwcfg->nvm_size, GFP_KERNEL);
-		if (sensor->nvm == NULL) {
-			rval = -ENOMEM;
-			goto out_cleanup;
-		}
 
+	if (sensor->minfo.smiapp_version &&
+	    sensor->limits[SMIAPP_LIMIT_DATA_TRANSFER_IF_CAPABILITY] &
+	    SMIAPP_DATA_TRANSFER_IF_CAPABILITY_SUPPORTED) {
 		if (device_create_file(&client->dev, &dev_attr_nvm) != 0) {
 			dev_err(&client->dev, "sysfs nvm entry failed\n");
 			rval = -EBUSY;
diff --git a/drivers/media/i2c/smiapp/smiapp.h b/drivers/media/i2c/smiapp/smiapp.h
index ecf8a17dbe37a..3ab874a5deba8 100644
--- a/drivers/media/i2c/smiapp/smiapp.h
+++ b/drivers/media/i2c/smiapp/smiapp.h
@@ -208,9 +208,6 @@ struct smiapp_sensor {
 	bool dev_init_done;
 	u8 compressed_min_bpp;
 
-	u8 *nvm;		/* nvm memory buffer */
-	unsigned int nvm_size;	/* bytes */
-
 	struct smiapp_module_info minfo;
 
 	struct smiapp_pll pll;
diff --git a/include/media/i2c/smiapp.h b/include/media/i2c/smiapp.h
index d6ccc859bfcd3..80f8251d87a3a 100644
--- a/include/media/i2c/smiapp.h
+++ b/include/media/i2c/smiapp.h
@@ -49,7 +49,6 @@ struct smiapp_hwconfig {
 	unsigned short i2c_addr_dfl;	/* Default i2c addr */
 	unsigned short i2c_addr_alt;	/* Alternate i2c addr */
 
-	uint32_t nvm_size;		/* bytes */
 	uint32_t ext_clk;		/* sensor external clk */
 
 	unsigned int lanes;		/* Number of CSI-2 lanes */
-- 
2.20.1

