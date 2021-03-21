Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1935D343458
	for <lists+linux-media@lfdr.de>; Sun, 21 Mar 2021 20:23:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbhCUTXE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Mar 2021 15:23:04 -0400
Received: from gusto4.metanet.ch ([80.74.154.158]:35474 "EHLO
        gusto4.metanet.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbhCUTWh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Mar 2021 15:22:37 -0400
X-Greylist: delayed 617 seconds by postgrey-1.27 at vger.kernel.org; Sun, 21 Mar 2021 15:22:37 EDT
Received: from localhost (localhost [127.0.0.1]) by gusto4.metanet.ch (Postfix) with ESMTPSA id 3B95B4F00DDE;
        Sun, 21 Mar 2021 20:12:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fabwu.ch; s=default;
        t=1616353939; bh=HOs3G3m29xHzIX64zCohsDejta4/cELv7bFyUV5MJxI=;
        h=From:To:Subject;
        b=H0m9PiCEVsBsWHKKrs2grUaZ1eBxRWMW4m0pGoUaQd34MXSkvov/gK39+KBckrL7S
         F96e5NBk7oGFNH0IYUx9ENpdQUZ9OKH8moJSfuw8ZIC0mQjo4xgV6n02kBzoMld/hX
         iXYXorR8rhkQkCLBvF0HtUSXSPAANod4XsLOaVGI=
Authentication-Results: gusto.metanet.ch;
        spf=pass (sender IP is 2001:1715:9d9c:4e40:c8ee:888d:e6cb:532f) smtp.mailfrom=me@fabwu.ch smtp.helo=localhost
Received-SPF: pass (gusto.metanet.ch: connection is authenticated)
From:   =?UTF-8?q?Fabian=20W=C3=BCthrich?= <me@fabwu.ch>
To:     linux-media@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?q?Fabian=20W=C3=BCthrich?= <me@fabwu.ch>
Subject: [PATCH] ipu3-cio2: Parse sensor orientation and rotation
Date:   Sun, 21 Mar 2021 20:11:56 +0100
Message-Id: <20210321191155.55723-1-me@fabwu.ch>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The sensor orientation is read from the _PLC ACPI buffer and converted
to a v4l2 format.

See https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pdf
page 351 for a definition of the Panel property.

The sensor rotation is read from the SSDB ACPI buffer and converted into
degrees.

Signed-off-by: Fabian Wüthrich <me@fabwu.ch>
---
 drivers/media/pci/intel/ipu3/cio2-bridge.c | 60 ++++++++++++++++++++--
 drivers/media/pci/intel/ipu3/cio2-bridge.h | 16 ++++++
 2 files changed, 72 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index c2199042d3db..503809907b92 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -29,6 +29,7 @@ static const struct cio2_sensor_config cio2_supported_sensors[] = {
 static const struct cio2_property_names prop_names = {
 	.clock_frequency = "clock-frequency",
 	.rotation = "rotation",
+	.orientation = "orientation",
 	.bus_type = "bus-type",
 	.data_lanes = "data-lanes",
 	.remote_endpoint = "remote-endpoint",
@@ -72,11 +73,51 @@ static int cio2_bridge_read_acpi_buffer(struct acpi_device *adev, char *id,
 	return ret;
 }
 
+static u32 cio2_bridge_parse_rotation(struct cio2_sensor *sensor)
+{
+	switch (sensor->ssdb.degree) {
+	case CIO2_SENSOR_ROTATION_NORMAL:
+		return 0;
+	case CIO2_SENSOR_ROTATION_INVERTED:
+		return 180;
+	default:
+		dev_warn(&sensor->adev->dev,
+			 "Unknown rotation %d. Assume 0 degree rotation\n",
+			 sensor->ssdb.degree);
+		return 0;
+	}
+}
+
+static enum v4l2_fwnode_orientation cio2_bridge_parse_orientation(struct cio2_sensor *sensor)
+{
+	switch (sensor->pld->panel) {
+	case CIO2_PLD_PANEL_FRONT:
+		return V4L2_FWNODE_ORIENTATION_FRONT;
+	case CIO2_PLD_PANEL_BACK:
+		return V4L2_FWNODE_ORIENTATION_BACK;
+	case CIO2_PLD_PANEL_TOP:
+	case CIO2_PLD_PANEL_LEFT:
+	case CIO2_PLD_PANEL_RIGHT:
+	case CIO2_PLD_PANEL_UNKNOWN:
+		return V4L2_FWNODE_ORIENTATION_EXTERNAL;
+	default:
+		dev_warn(&sensor->adev->dev, "Unknown _PLD panel value %d\n",
+			 sensor->pld->panel);
+		return V4L2_FWNODE_ORIENTATION_EXTERNAL;
+	}
+}
+
 static void cio2_bridge_create_fwnode_properties(
 	struct cio2_sensor *sensor,
 	struct cio2_bridge *bridge,
 	const struct cio2_sensor_config *cfg)
 {
+	u32 rotation;
+	enum v4l2_fwnode_orientation orientation;
+
+	rotation = cio2_bridge_parse_rotation(sensor);
+	orientation = cio2_bridge_parse_orientation(sensor);
+
 	sensor->prop_names = prop_names;
 
 	sensor->local_ref[0].node = &sensor->swnodes[SWNODE_CIO2_ENDPOINT];
@@ -85,9 +126,12 @@ static void cio2_bridge_create_fwnode_properties(
 	sensor->dev_properties[0] = PROPERTY_ENTRY_U32(
 					sensor->prop_names.clock_frequency,
 					sensor->ssdb.mclkspeed);
-	sensor->dev_properties[1] = PROPERTY_ENTRY_U8(
+	sensor->dev_properties[1] = PROPERTY_ENTRY_U32(
 					sensor->prop_names.rotation,
-					sensor->ssdb.degree);
+					rotation);
+	sensor->dev_properties[2] = PROPERTY_ENTRY_U32(
+					sensor->prop_names.orientation,
+					orientation);
 
 	sensor->ep_properties[0] = PROPERTY_ENTRY_U32(
 					sensor->prop_names.bus_type,
@@ -159,6 +203,7 @@ static void cio2_bridge_unregister_sensors(struct cio2_bridge *bridge)
 	for (i = 0; i < bridge->n_sensors; i++) {
 		sensor = &bridge->sensors[i];
 		software_node_unregister_nodes(sensor->swnodes);
+		ACPI_FREE(sensor->pld);
 		acpi_dev_put(sensor->adev);
 	}
 }
@@ -170,6 +215,7 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 	struct fwnode_handle *fwnode;
 	struct cio2_sensor *sensor;
 	struct acpi_device *adev;
+	acpi_status status;
 	int ret;
 
 	for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
@@ -193,11 +239,15 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 		if (ret)
 			goto err_put_adev;
 
+		status = acpi_get_physical_device_location(adev->handle, &sensor->pld);
+		if (ACPI_FAILURE(status))
+			goto err_put_adev;
+
 		if (sensor->ssdb.lanes > CIO2_MAX_LANES) {
 			dev_err(&adev->dev,
 				"Number of lanes in SSDB is invalid\n");
 			ret = -EINVAL;
-			goto err_put_adev;
+			goto err_free_pld;
 		}
 
 		cio2_bridge_create_fwnode_properties(sensor, bridge, cfg);
@@ -205,7 +255,7 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 
 		ret = software_node_register_nodes(sensor->swnodes);
 		if (ret)
-			goto err_put_adev;
+			goto err_free_pld;
 
 		fwnode = software_node_fwnode(&sensor->swnodes[
 						      SWNODE_SENSOR_HID]);
@@ -226,6 +276,8 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 
 err_free_swnodes:
 	software_node_unregister_nodes(sensor->swnodes);
+err_free_pld:
+	ACPI_FREE(sensor->pld);
 err_put_adev:
 	acpi_dev_put(sensor->adev);
 err_out:
diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.h b/drivers/media/pci/intel/ipu3/cio2-bridge.h
index dd0ffcafa489..e1e388cc9f45 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.h
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.h
@@ -12,6 +12,19 @@
 #define CIO2_MAX_LANES				4
 #define MAX_NUM_LINK_FREQS			3
 
+/* Values are estimated guesses as we don't have a spec */
+#define CIO2_SENSOR_ROTATION_NORMAL		0
+#define CIO2_SENSOR_ROTATION_INVERTED		1
+
+/* Panel position defined in _PLD section of ACPI Specification 6.3 */
+#define CIO2_PLD_PANEL_TOP			0
+#define CIO2_PLD_PANEL_BOTTOM			1
+#define CIO2_PLD_PANEL_LEFT			2
+#define CIO2_PLD_PANEL_RIGHT			3
+#define CIO2_PLD_PANEL_FRONT			4
+#define CIO2_PLD_PANEL_BACK			5
+#define CIO2_PLD_PANEL_UNKNOWN			6
+
 #define CIO2_SENSOR_CONFIG(_HID, _NR, ...)	\
 	(const struct cio2_sensor_config) {	\
 		.hid = _HID,			\
@@ -80,6 +93,7 @@ struct cio2_sensor_ssdb {
 struct cio2_property_names {
 	char clock_frequency[16];
 	char rotation[9];
+	char orientation[12];
 	char bus_type[9];
 	char data_lanes[11];
 	char remote_endpoint[16];
@@ -106,6 +120,8 @@ struct cio2_sensor {
 	struct cio2_node_names node_names;
 
 	struct cio2_sensor_ssdb ssdb;
+	struct acpi_pld_info *pld;
+
 	struct cio2_property_names prop_names;
 	struct property_entry ep_properties[5];
 	struct property_entry dev_properties[3];
-- 
2.31.0

