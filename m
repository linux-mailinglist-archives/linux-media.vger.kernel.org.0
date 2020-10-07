Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 955B1285B22
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgJGIrG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:47:06 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57038 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727965AbgJGIqF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:05 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 3032C634CBF
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:18 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 035/106] ccs: Read CCS static data from firmware binaries
Date:   Wed,  7 Oct 2020 11:44:48 +0300
Message-Id: <20201007084557.25843-28-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Read the CCS static data for sensors and modules. The files are expected
to be found in "ccs" directory.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 30 ++++++++++++++++++++++++++++++
 drivers/media/i2c/ccs/ccs.h      |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 34e86ddbb06a..0cc6e7423f26 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -16,6 +16,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/firmware.h>
 #include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -2947,6 +2948,8 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 static int ccs_probe(struct i2c_client *client)
 {
 	struct ccs_sensor *sensor;
+	const struct firmware *fw;
+	char filename[40];
 	unsigned int i;
 	int rval;
 
@@ -3036,6 +3039,31 @@ static int ccs_probe(struct i2c_client *client)
 		goto out_power_off;
 	}
 
+	WARN_ON(snprintf(filename, sizeof(filename),
+			 "ccs/ccs-sensor-%4.4x-%4.4x-%4.4x.fw",
+			 sensor->minfo.sensor_mipi_manufacturer_id,
+			 sensor->minfo.sensor_model_id,
+			 sensor->minfo.sensor_revision_number) >=
+		sizeof(filename));
+	rval = request_firmware(&fw, filename, &client->dev);
+	if (!rval) {
+		ccs_data_parse(&sensor->sdata, fw->data, fw->size, &client->dev,
+			       true);
+		release_firmware(fw);
+	}
+
+	WARN_ON(snprintf(filename, sizeof(filename),
+			 "ccs/ccs-module-%4.4x-%4.4x-%4.4x.fw",
+			 sensor->minfo.mipi_manufacturer_id,
+			 sensor->minfo.model_id,
+			 sensor->minfo.revision_number) >= sizeof(filename));
+	rval = request_firmware(&fw, filename, &client->dev);
+	if (!rval) {
+		ccs_data_parse(&sensor->mdata, fw->data, fw->size, &client->dev,
+			       true);
+		release_firmware(fw);
+	}
+
 	rval = ccs_read_all_limits(sensor);
 	if (rval)
 		goto out_power_off;
@@ -3232,6 +3260,8 @@ static int ccs_remove(struct i2c_client *client)
 	ccs_cleanup(sensor);
 	mutex_destroy(&sensor->mutex);
 	kfree(sensor->ccs_limits);
+	kvfree(sensor->sdata.backing);
+	kvfree(sensor->mdata.backing);
 
 	return 0;
 }
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index ad2ff5a74424..cbcd93b519da 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -16,6 +16,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-subdev.h>
 
+#include "ccs-data.h"
 #include "ccs-quirk.h"
 #include "ccs-regs.h"
 #include "ccs-reg-access.h"
@@ -227,6 +228,7 @@ struct ccs_sensor {
 	const struct ccs_csi_data_format *internal_csi_format;
 	u32 default_mbus_frame_fmts;
 	int default_pixel_order;
+	struct ccs_data_container sdata, mdata;
 
 	u8 binning_horizontal;
 	u8 binning_vertical;
-- 
2.27.0

