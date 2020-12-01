Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15CD62CA8A8
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 17:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389154AbgLAQsF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 11:48:05 -0500
Received: from retiisi.eu ([95.216.213.190]:50080 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387795AbgLAQsF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 11:48:05 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 1C294634C94;
        Tue,  1 Dec 2020 18:45:13 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH v2 10/30] ccs: Read CCS static data from firmware binaries
Date:   Tue,  1 Dec 2020 18:42:26 +0200
Message-Id: <20201201164246.18003-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201201164246.18003-1-sakari.ailus@linux.intel.com>
References: <20201201164246.18003-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Read the CCS static data for sensors and modules. The files are expected
to be found in "ccs" directory.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 47 +++++++++++++++++++++++++++++++-
 drivers/media/i2c/ccs/ccs.h      |  2 ++
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 17287a8f539c..be27b002a772 100644
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
@@ -2953,6 +2954,8 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 static int ccs_probe(struct i2c_client *client)
 {
 	struct ccs_sensor *sensor;
+	const struct firmware *fw;
+	char filename[40];
 	unsigned int i;
 	int rval;
 
@@ -3042,9 +3045,43 @@ static int ccs_probe(struct i2c_client *client)
 		goto out_power_off;
 	}
 
+	rval = snprintf(filename, sizeof(filename),
+			"ccs/ccs-sensor-%4.4x-%4.4x-%4.4x.fw",
+			sensor->minfo.sensor_mipi_manufacturer_id,
+			sensor->minfo.sensor_model_id,
+			sensor->minfo.sensor_revision_number);
+	if (rval >= sizeof(filename)) {
+		rval = -ENOMEM;
+		goto out_power_off;
+	}
+
+	rval = request_firmware(&fw, filename, &client->dev);
+	if (!rval) {
+		ccs_data_parse(&sensor->sdata, fw->data, fw->size, &client->dev,
+			       true);
+		release_firmware(fw);
+	}
+
+	rval = snprintf(filename, sizeof(filename),
+			"ccs/ccs-module-%4.4x-%4.4x-%4.4x.fw",
+			sensor->minfo.mipi_manufacturer_id,
+			sensor->minfo.model_id,
+			sensor->minfo.revision_number);
+	if (rval >= sizeof(filename)) {
+		rval = -ENOMEM;
+		goto out_release_sdata;
+	}
+
+	rval = request_firmware(&fw, filename, &client->dev);
+	if (!rval) {
+		ccs_data_parse(&sensor->mdata, fw->data, fw->size, &client->dev,
+			       true);
+		release_firmware(fw);
+	}
+
 	rval = ccs_read_all_limits(sensor);
 	if (rval)
-		goto out_power_off;
+		goto out_release_mdata;
 
 	rval = ccs_read_frame_fmt(sensor);
 	if (rval) {
@@ -3208,6 +3245,12 @@ static int ccs_probe(struct i2c_client *client)
 out_cleanup:
 	ccs_cleanup(sensor);
 
+out_release_mdata:
+	kvfree(sensor->mdata.backing);
+
+out_release_sdata:
+	kvfree(sensor->sdata.backing);
+
 out_free_ccs_limits:
 	kfree(sensor->ccs_limits);
 
@@ -3238,6 +3281,8 @@ static int ccs_remove(struct i2c_client *client)
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

