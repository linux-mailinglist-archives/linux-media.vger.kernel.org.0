Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC55707D53
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 11:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbjERJyn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 05:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbjERJyk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 05:54:40 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB4AF172A
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 02:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684403675; x=1715939675;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xQjjiQOXba3IBGXpmWfaomFVkc6AzJpffYEvuvBsrK0=;
  b=kuNmWCYr0GC7b4ybbEfvlAKNPJCijKlAJyDiVcasQK0Wb3EiV3FVhKpU
   FlF6GsRdcPKxy+x/qpzCu8eb8YZm7YmmsnOAS3HrkoN48Hl9kkCrFyLmb
   mwxxEPvjIj2ubZP6d2WojQk2WVI6Dvayuvr90Jva0nVUNsJbwWN5MSbYh
   MFA8vkcSVZ3kCZ/APqKb1OygUAaT6+EcIzvDMz4DH/Ll/tWu8X+XBeRxm
   hP33PSfLsZfyE4prEb08n9lhin0d+wnsInREGurosvvZHwMZ+XmQFIfU/
   JCUxjdIcCRDEb7v6F/2DZ2ls9URBRrIBNVEILLiJjlftHaBUxsQTIzUtS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="438366463"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; 
   d="scan'208";a="438366463"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2023 02:54:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="791897245"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; 
   d="scan'208";a="791897245"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by FMSMGA003.fm.intel.com with ESMTP; 18 May 2023 02:54:33 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        dan.scally@ideasonboard.com
Cc:     wentong.wu@intel.com, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH 1/3] media: intel: rename cio2 bridge to ipu bridge and move out of ipu3
Date:   Thu, 18 May 2023 18:05:21 +0800
Message-Id: <20230518100523.1578703-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

cio2 bridge was involved along with IPU3. However, in fact all Intel IPUs
besides IPU3 CIO2 need this bridge driver. This patch move bridge driver
out of ipu3 directory and rename as ipu-bridge. Then it can be worked with
IPU3 and other Intel IPUs.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/Kconfig                     |   2 +-
 drivers/media/pci/intel/Kconfig               |  21 +++
 drivers/media/pci/intel/Makefile              |   4 +-
 .../{ipu3/cio2-bridge.c => ipu-bridge.c}      | 177 +++++++++---------
 .../{ipu3/cio2-bridge.h => ipu-bridge.h}      |  56 +++---
 drivers/media/pci/intel/ipu3/Kconfig          |  19 --
 drivers/media/pci/intel/ipu3/Makefile         |   1 -
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   4 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.h      |   6 -
 9 files changed, 147 insertions(+), 143 deletions(-)
 create mode 100644 drivers/media/pci/intel/Kconfig
 rename drivers/media/pci/intel/{ipu3/cio2-bridge.c => ipu-bridge.c} (69%)
 rename drivers/media/pci/intel/{ipu3/cio2-bridge.h => ipu-bridge.h} (72%)

diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
index 480194543d05..ee095bde0b68 100644
--- a/drivers/media/pci/Kconfig
+++ b/drivers/media/pci/Kconfig
@@ -73,7 +73,7 @@ config VIDEO_PCI_SKELETON
 	  Enable build of the skeleton PCI driver, used as a reference
 	  when developing new drivers.
 
-source "drivers/media/pci/intel/ipu3/Kconfig"
+source "drivers/media/pci/intel/Kconfig"
 
 endif #MEDIA_PCI_SUPPORT
 endif #PCI
diff --git a/drivers/media/pci/intel/Kconfig b/drivers/media/pci/intel/Kconfig
new file mode 100644
index 000000000000..64a29b0b7033
--- /dev/null
+++ b/drivers/media/pci/intel/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config IPU_BRIDGE
+	bool "Intel IPU Sensors Bridge"
+	depends on VIDEO_IPU3_CIO2 && ACPI
+	depends on I2C
+	help
+	  This extension provides an API for the Intel IPU driver to create
+	  connections to cameras that are hidden in the SSDB buffer in ACPI.
+	  It can be used to enable support for cameras in detachable / hybrid
+	  devices that ship with Windows.
+
+	  Say Y here if your device is a detachable / hybrid laptop that comes
+	  with Windows installed by the OEM, for example:
+
+		- Microsoft Surface models (except Surface Pro 3)
+		- The Lenovo Miix line (for example the 510, 520, 710 and 720)
+		- Dell 7285
+
+	  If in doubt, say N here.
+
+source "drivers/media/pci/intel/ipu3/Kconfig"
diff --git a/drivers/media/pci/intel/Makefile b/drivers/media/pci/intel/Makefile
index 0b4236c4db49..951191a7e401 100644
--- a/drivers/media/pci/intel/Makefile
+++ b/drivers/media/pci/intel/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
-# Makefile for the IPU3 cio2 and ImGU drivers
+# Makefile for the IPU drivers
 #
-
+obj-$(CONFIG_IPU_BRIDGE) += ipu-bridge.o
 obj-y	+= ipu3/
diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
similarity index 69%
rename from drivers/media/pci/intel/ipu3/cio2-bridge.c
rename to drivers/media/pci/intel/ipu-bridge.c
index 3c2accfe5455..f7134e308696 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -8,7 +8,7 @@
 #include <linux/property.h>
 #include <media/v4l2-fwnode.h>
 
-#include "cio2-bridge.h"
+#include "ipu-bridge.h"
 
 /*
  * Extend this array with ACPI Hardware IDs of devices known to be working
@@ -20,26 +20,26 @@
  *
  * Do not add an entry for a sensor that is not actually supported.
  */
-static const struct cio2_sensor_config cio2_supported_sensors[] = {
+static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	/* Omnivision OV5693 */
-	CIO2_SENSOR_CONFIG("INT33BE", 1, 419200000),
+	IPU_SENSOR_CONFIG("INT33BE", 1, 419200000),
 	/* Omnivision OV8865 */
-	CIO2_SENSOR_CONFIG("INT347A", 1, 360000000),
+	IPU_SENSOR_CONFIG("INT347A", 1, 360000000),
 	/* Omnivision OV7251 */
-	CIO2_SENSOR_CONFIG("INT347E", 1, 319200000),
+	IPU_SENSOR_CONFIG("INT347E", 1, 319200000),
 	/* Omnivision OV2680 */
-	CIO2_SENSOR_CONFIG("OVTI2680", 0),
+	IPU_SENSOR_CONFIG("OVTI2680", 0),
 	/* Omnivision ov8856 */
-	CIO2_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
+	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
 	/* Omnivision ov2740 */
-	CIO2_SENSOR_CONFIG("INT3474", 1, 360000000),
+	IPU_SENSOR_CONFIG("INT3474", 1, 360000000),
 	/* Hynix hi556 */
-	CIO2_SENSOR_CONFIG("INT3537", 1, 437000000),
+	IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
 	/* Omnivision ov13b10 */
-	CIO2_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
+	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 };
 
-static const struct cio2_property_names prop_names = {
+static const struct ipu_property_names prop_names = {
 	.clock_frequency = "clock-frequency",
 	.rotation = "rotation",
 	.orientation = "orientation",
@@ -49,7 +49,7 @@ static const struct cio2_property_names prop_names = {
 	.link_frequencies = "link-frequencies",
 };
 
-static const char * const cio2_vcm_types[] = {
+static const char * const ipu_vcm_types[] = {
 	"ad5823",
 	"dw9714",
 	"ad5816",
@@ -61,8 +61,8 @@ static const char * const cio2_vcm_types[] = {
 	"lc898212axb",
 };
 
-static int cio2_bridge_read_acpi_buffer(struct acpi_device *adev, char *id,
-					void *data, u32 size)
+static int ipu_bridge_read_acpi_buffer(struct acpi_device *adev, char *id,
+				       void *data, u32 size)
 {
 	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
 	union acpi_object *obj;
@@ -98,12 +98,12 @@ static int cio2_bridge_read_acpi_buffer(struct acpi_device *adev, char *id,
 	return ret;
 }
 
-static u32 cio2_bridge_parse_rotation(struct cio2_sensor *sensor)
+static u32 ipu_bridge_parse_rotation(struct ipu_sensor *sensor)
 {
 	switch (sensor->ssdb.degree) {
-	case CIO2_SENSOR_ROTATION_NORMAL:
+	case IPU_SENSOR_ROTATION_NORMAL:
 		return 0;
-	case CIO2_SENSOR_ROTATION_INVERTED:
+	case IPU_SENSOR_ROTATION_INVERTED:
 		return 180;
 	default:
 		dev_warn(&sensor->adev->dev,
@@ -113,7 +113,7 @@ static u32 cio2_bridge_parse_rotation(struct cio2_sensor *sensor)
 	}
 }
 
-static enum v4l2_fwnode_orientation cio2_bridge_parse_orientation(struct cio2_sensor *sensor)
+static enum v4l2_fwnode_orientation ipu_bridge_parse_orientation(struct ipu_sensor *sensor)
 {
 	switch (sensor->pld->panel) {
 	case ACPI_PLD_PANEL_FRONT:
@@ -132,20 +132,20 @@ static enum v4l2_fwnode_orientation cio2_bridge_parse_orientation(struct cio2_se
 	}
 }
 
-static void cio2_bridge_create_fwnode_properties(
-	struct cio2_sensor *sensor,
-	struct cio2_bridge *bridge,
-	const struct cio2_sensor_config *cfg)
+static void ipu_bridge_create_fwnode_properties(
+	struct ipu_sensor *sensor,
+	struct ipu_bridge *bridge,
+	const struct ipu_sensor_config *cfg)
 {
 	u32 rotation;
 	enum v4l2_fwnode_orientation orientation;
 
-	rotation = cio2_bridge_parse_rotation(sensor);
-	orientation = cio2_bridge_parse_orientation(sensor);
+	rotation = ipu_bridge_parse_rotation(sensor);
+	orientation = ipu_bridge_parse_orientation(sensor);
 
 	sensor->prop_names = prop_names;
 
-	sensor->local_ref[0] = SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_CIO2_ENDPOINT]);
+	sensor->local_ref[0] = SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_IPU_ENDPOINT]);
 	sensor->remote_ref[0] = SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_SENSOR_ENDPOINT]);
 
 	sensor->dev_properties[0] = PROPERTY_ENTRY_U32(
@@ -181,16 +181,16 @@ static void cio2_bridge_create_fwnode_properties(
 			cfg->link_freqs,
 			cfg->nr_link_freqs);
 
-	sensor->cio2_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
+	sensor->ipu_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
 					sensor->prop_names.data_lanes,
 					bridge->data_lanes,
 					sensor->ssdb.lanes);
-	sensor->cio2_properties[1] = PROPERTY_ENTRY_REF_ARRAY(
+	sensor->ipu_properties[1] = PROPERTY_ENTRY_REF_ARRAY(
 					sensor->prop_names.remote_endpoint,
 					sensor->remote_ref);
 }
 
-static void cio2_bridge_init_swnode_names(struct cio2_sensor *sensor)
+static void ipu_bridge_init_swnode_names(struct ipu_sensor *sensor)
 {
 	snprintf(sensor->node_names.remote_port,
 		 sizeof(sensor->node_names.remote_port),
@@ -203,26 +203,26 @@ static void cio2_bridge_init_swnode_names(struct cio2_sensor *sensor)
 		 SWNODE_GRAPH_ENDPOINT_NAME_FMT, 0); /* And endpoint 0 */
 }
 
-static void cio2_bridge_init_swnode_group(struct cio2_sensor *sensor)
+static void ipu_bridge_init_swnode_group(struct ipu_sensor *sensor)
 {
 	struct software_node *nodes = sensor->swnodes;
 
 	sensor->group[SWNODE_SENSOR_HID] = &nodes[SWNODE_SENSOR_HID];
 	sensor->group[SWNODE_SENSOR_PORT] = &nodes[SWNODE_SENSOR_PORT];
 	sensor->group[SWNODE_SENSOR_ENDPOINT] = &nodes[SWNODE_SENSOR_ENDPOINT];
-	sensor->group[SWNODE_CIO2_PORT] = &nodes[SWNODE_CIO2_PORT];
-	sensor->group[SWNODE_CIO2_ENDPOINT] = &nodes[SWNODE_CIO2_ENDPOINT];
+	sensor->group[SWNODE_IPU_PORT] = &nodes[SWNODE_IPU_PORT];
+	sensor->group[SWNODE_IPU_ENDPOINT] = &nodes[SWNODE_IPU_ENDPOINT];
 	if (sensor->ssdb.vcmtype)
 		sensor->group[SWNODE_VCM] =  &nodes[SWNODE_VCM];
 }
 
-static void cio2_bridge_create_connection_swnodes(struct cio2_bridge *bridge,
-						  struct cio2_sensor *sensor)
+static void ipu_bridge_create_connection_swnodes(struct ipu_bridge *bridge,
+						 struct ipu_sensor *sensor)
 {
 	struct software_node *nodes = sensor->swnodes;
 	char vcm_name[ACPI_ID_LEN + 4];
 
-	cio2_bridge_init_swnode_names(sensor);
+	ipu_bridge_init_swnode_names(sensor);
 
 	nodes[SWNODE_SENSOR_HID] = NODE_SENSOR(sensor->name,
 					       sensor->dev_properties);
@@ -232,24 +232,24 @@ static void cio2_bridge_create_connection_swnodes(struct cio2_bridge *bridge,
 						sensor->node_names.endpoint,
 						&nodes[SWNODE_SENSOR_PORT],
 						sensor->ep_properties);
-	nodes[SWNODE_CIO2_PORT] = NODE_PORT(sensor->node_names.remote_port,
-					    &bridge->cio2_hid_node);
-	nodes[SWNODE_CIO2_ENDPOINT] = NODE_ENDPOINT(
+	nodes[SWNODE_IPU_PORT] = NODE_PORT(sensor->node_names.remote_port,
+					   &bridge->ipu_hid_node);
+	nodes[SWNODE_IPU_ENDPOINT] = NODE_ENDPOINT(
 						sensor->node_names.endpoint,
-						&nodes[SWNODE_CIO2_PORT],
-						sensor->cio2_properties);
+						&nodes[SWNODE_IPU_PORT],
+						sensor->ipu_properties);
 	if (sensor->ssdb.vcmtype) {
 		/* append ssdb.link to distinguish VCM nodes with same HID */
 		snprintf(vcm_name, sizeof(vcm_name), "%s-%u",
-			 cio2_vcm_types[sensor->ssdb.vcmtype - 1],
+			 ipu_vcm_types[sensor->ssdb.vcmtype - 1],
 			 sensor->ssdb.link);
 		nodes[SWNODE_VCM] = NODE_VCM(vcm_name);
 	}
 
-	cio2_bridge_init_swnode_group(sensor);
+	ipu_bridge_init_swnode_group(sensor);
 }
 
-static void cio2_bridge_instantiate_vcm_i2c_client(struct cio2_sensor *sensor)
+static void ipu_bridge_instantiate_vcm_i2c_client(struct ipu_sensor *sensor)
 {
 	struct i2c_board_info board_info = { };
 	char name[16];
@@ -259,7 +259,7 @@ static void cio2_bridge_instantiate_vcm_i2c_client(struct cio2_sensor *sensor)
 
 	snprintf(name, sizeof(name), "%s-VCM", acpi_dev_name(sensor->adev));
 	board_info.dev_name = name;
-	strscpy(board_info.type, cio2_vcm_types[sensor->ssdb.vcmtype - 1],
+	strscpy(board_info.type, ipu_vcm_types[sensor->ssdb.vcmtype - 1],
 		ARRAY_SIZE(board_info.type));
 	board_info.swnode = &sensor->swnodes[SWNODE_VCM];
 
@@ -273,9 +273,9 @@ static void cio2_bridge_instantiate_vcm_i2c_client(struct cio2_sensor *sensor)
 	}
 }
 
-static void cio2_bridge_unregister_sensors(struct cio2_bridge *bridge)
+static void ipu_bridge_unregister_sensors(struct ipu_bridge *bridge)
 {
-	struct cio2_sensor *sensor;
+	struct ipu_sensor *sensor;
 	unsigned int i;
 
 	for (i = 0; i < bridge->n_sensors; i++) {
@@ -287,12 +287,12 @@ static void cio2_bridge_unregister_sensors(struct cio2_bridge *bridge)
 	}
 }
 
-static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
-				      struct cio2_bridge *bridge,
-				      struct pci_dev *cio2)
+static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
+				     struct ipu_bridge *bridge,
+				     struct pci_dev *ipu)
 {
 	struct fwnode_handle *fwnode, *primary;
-	struct cio2_sensor *sensor;
+	struct ipu_sensor *sensor;
 	struct acpi_device *adev;
 	acpi_status status;
 	int ret;
@@ -303,22 +303,22 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 
 		if (bridge->n_sensors >= CIO2_NUM_PORTS) {
 			acpi_dev_put(adev);
-			dev_err(&cio2->dev, "Exceeded available CIO2 ports\n");
+			dev_err(&ipu->dev, "Exceeded available IPU ports\n");
 			return -EINVAL;
 		}
 
 		sensor = &bridge->sensors[bridge->n_sensors];
 
-		ret = cio2_bridge_read_acpi_buffer(adev, "SSDB",
-						   &sensor->ssdb,
-						   sizeof(sensor->ssdb));
+		ret = ipu_bridge_read_acpi_buffer(adev, "SSDB",
+						  &sensor->ssdb,
+						  sizeof(sensor->ssdb));
 		if (ret)
 			goto err_put_adev;
 
 		snprintf(sensor->name, sizeof(sensor->name), "%s-%u",
 			 cfg->hid, sensor->ssdb.link);
 
-		if (sensor->ssdb.vcmtype > ARRAY_SIZE(cio2_vcm_types)) {
+		if (sensor->ssdb.vcmtype > ARRAY_SIZE(ipu_vcm_types)) {
 			dev_warn(&adev->dev, "Unknown VCM type %d\n",
 				 sensor->ssdb.vcmtype);
 			sensor->ssdb.vcmtype = 0;
@@ -330,15 +330,15 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 			goto err_put_adev;
 		}
 
-		if (sensor->ssdb.lanes > CIO2_MAX_LANES) {
+		if (sensor->ssdb.lanes > IPU_MAX_LANES) {
 			dev_err(&adev->dev,
 				"Number of lanes in SSDB is invalid\n");
 			ret = -EINVAL;
 			goto err_free_pld;
 		}
 
-		cio2_bridge_create_fwnode_properties(sensor, bridge, cfg);
-		cio2_bridge_create_connection_swnodes(bridge, sensor);
+		ipu_bridge_create_fwnode_properties(sensor, bridge, cfg);
+		ipu_bridge_create_connection_swnodes(bridge, sensor);
 
 		ret = software_node_register_node_group(sensor->group);
 		if (ret)
@@ -356,9 +356,9 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 		primary = acpi_fwnode_handle(adev);
 		primary->secondary = fwnode;
 
-		cio2_bridge_instantiate_vcm_i2c_client(sensor);
+		ipu_bridge_instantiate_vcm_i2c_client(sensor);
 
-		dev_info(&cio2->dev, "Found supported sensor %s\n",
+		dev_info(&ipu->dev, "Found supported sensor %s\n",
 			 acpi_dev_name(adev));
 
 		bridge->n_sensors++;
@@ -375,17 +375,17 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 	return ret;
 }
 
-static int cio2_bridge_connect_sensors(struct cio2_bridge *bridge,
-				       struct pci_dev *cio2)
+static int ipu_bridge_connect_sensors(struct ipu_bridge *bridge,
+				      struct pci_dev *ipu)
 {
 	unsigned int i;
 	int ret;
 
-	for (i = 0; i < ARRAY_SIZE(cio2_supported_sensors); i++) {
-		const struct cio2_sensor_config *cfg =
-			&cio2_supported_sensors[i];
+	for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {
+		const struct ipu_sensor_config *cfg =
+			&ipu_supported_sensors[i];
 
-		ret = cio2_bridge_connect_sensor(cfg, bridge, cio2);
+		ret = ipu_bridge_connect_sensor(cfg, bridge, ipu);
 		if (ret)
 			goto err_unregister_sensors;
 	}
@@ -393,7 +393,7 @@ static int cio2_bridge_connect_sensors(struct cio2_bridge *bridge,
 	return 0;
 
 err_unregister_sensors:
-	cio2_bridge_unregister_sensors(bridge);
+	ipu_bridge_unregister_sensors(bridge);
 	return ret;
 }
 
@@ -409,15 +409,15 @@ static int cio2_bridge_connect_sensors(struct cio2_bridge *bridge,
  * acpi_dev_ready_for_enumeration() helper, like the i2c-core-acpi code does
  * for the sensors.
  */
-static int cio2_bridge_sensors_are_ready(void)
+static int ipu_bridge_sensors_are_ready(void)
 {
 	struct acpi_device *adev;
 	bool ready = true;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(cio2_supported_sensors); i++) {
-		const struct cio2_sensor_config *cfg =
-			&cio2_supported_sensors[i];
+	for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {
+		const struct ipu_sensor_config *cfg =
+			&ipu_supported_sensors[i];
 
 		for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
 			if (!adev->status.enabled)
@@ -431,50 +431,50 @@ static int cio2_bridge_sensors_are_ready(void)
 	return ready;
 }
 
-int cio2_bridge_init(struct pci_dev *cio2)
+int ipu_bridge_init(struct pci_dev *ipu)
 {
-	struct device *dev = &cio2->dev;
+	struct device *dev = &ipu->dev;
 	struct fwnode_handle *fwnode;
-	struct cio2_bridge *bridge;
+	struct ipu_bridge *bridge;
 	unsigned int i;
 	int ret;
 
-	if (!cio2_bridge_sensors_are_ready())
+	if (!ipu_bridge_sensors_are_ready())
 		return -EPROBE_DEFER;
 
 	bridge = kzalloc(sizeof(*bridge), GFP_KERNEL);
 	if (!bridge)
 		return -ENOMEM;
 
-	strscpy(bridge->cio2_node_name, CIO2_HID,
-		sizeof(bridge->cio2_node_name));
-	bridge->cio2_hid_node.name = bridge->cio2_node_name;
+	strscpy(bridge->ipu_node_name, IPU_HID,
+		sizeof(bridge->ipu_node_name));
+	bridge->ipu_hid_node.name = bridge->ipu_node_name;
 
-	ret = software_node_register(&bridge->cio2_hid_node);
+	ret = software_node_register(&bridge->ipu_hid_node);
 	if (ret < 0) {
-		dev_err(dev, "Failed to register the CIO2 HID node\n");
+		dev_err(dev, "Failed to register the IPU HID node\n");
 		goto err_free_bridge;
 	}
 
 	/*
 	 * Map the lane arrangement, which is fixed for the IPU3 (meaning we
 	 * only need one, rather than one per sensor). We include it as a
-	 * member of the struct cio2_bridge rather than a global variable so
+	 * member of the struct ipu_bridge rather than a global variable so
 	 * that it survives if the module is unloaded along with the rest of
 	 * the struct.
 	 */
-	for (i = 0; i < CIO2_MAX_LANES; i++)
+	for (i = 0; i < IPU_MAX_LANES; i++)
 		bridge->data_lanes[i] = i + 1;
 
-	ret = cio2_bridge_connect_sensors(bridge, cio2);
+	ret = ipu_bridge_connect_sensors(bridge, ipu);
 	if (ret || bridge->n_sensors == 0)
-		goto err_unregister_cio2;
+		goto err_unregister_ipu;
 
 	dev_info(dev, "Connected %d cameras\n", bridge->n_sensors);
 
-	fwnode = software_node_fwnode(&bridge->cio2_hid_node);
+	fwnode = software_node_fwnode(&bridge->ipu_hid_node);
 	if (!fwnode) {
-		dev_err(dev, "Error getting fwnode from cio2 software_node\n");
+		dev_err(dev, "Error getting fwnode from ipu software_node\n");
 		ret = -ENODEV;
 		goto err_unregister_sensors;
 	}
@@ -484,11 +484,12 @@ int cio2_bridge_init(struct pci_dev *cio2)
 	return 0;
 
 err_unregister_sensors:
-	cio2_bridge_unregister_sensors(bridge);
-err_unregister_cio2:
-	software_node_unregister(&bridge->cio2_hid_node);
+	ipu_bridge_unregister_sensors(bridge);
+err_unregister_ipu:
+	software_node_unregister(&bridge->ipu_hid_node);
 err_free_bridge:
 	kfree(bridge);
 
 	return ret;
 }
+EXPORT_SYMBOL_NS_GPL(ipu_bridge_init, INTEL_IPU_BRIDGE);
diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.h b/drivers/media/pci/intel/ipu-bridge.h
similarity index 72%
rename from drivers/media/pci/intel/ipu3/cio2-bridge.h
rename to drivers/media/pci/intel/ipu-bridge.h
index b76ed8a641e2..d35b5f30ac3f 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.h
+++ b/drivers/media/pci/intel/ipu-bridge.h
@@ -1,25 +1,25 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Author: Dan Scally <djrscally@gmail.com> */
-#ifndef __CIO2_BRIDGE_H
-#define __CIO2_BRIDGE_H
+#ifndef __IPU_BRIDGE_H
+#define __IPU_BRIDGE_H
 
 #include <linux/property.h>
 #include <linux/types.h>
 
-#include "ipu3-cio2.h"
+#include "ipu3/ipu3-cio2.h"
 
 struct i2c_client;
 
-#define CIO2_HID				"INT343E"
-#define CIO2_MAX_LANES				4
+#define IPU_HID				"INT343E"
+#define IPU_MAX_LANES				4
 #define MAX_NUM_LINK_FREQS			3
 
 /* Values are educated guesses as we don't have a spec */
-#define CIO2_SENSOR_ROTATION_NORMAL		0
-#define CIO2_SENSOR_ROTATION_INVERTED		1
+#define IPU_SENSOR_ROTATION_NORMAL		0
+#define IPU_SENSOR_ROTATION_INVERTED		1
 
-#define CIO2_SENSOR_CONFIG(_HID, _NR, ...)	\
-	(const struct cio2_sensor_config) {	\
+#define IPU_SENSOR_CONFIG(_HID, _NR, ...)	\
+	(const struct ipu_sensor_config) {	\
 		.hid = _HID,			\
 		.nr_link_freqs = _NR,		\
 		.link_freqs = { __VA_ARGS__ }	\
@@ -49,19 +49,19 @@ struct i2c_client;
 		.name = _TYPE,			\
 	}
 
-enum cio2_sensor_swnodes {
+enum ipu_sensor_swnodes {
 	SWNODE_SENSOR_HID,
 	SWNODE_SENSOR_PORT,
 	SWNODE_SENSOR_ENDPOINT,
-	SWNODE_CIO2_PORT,
-	SWNODE_CIO2_ENDPOINT,
+	SWNODE_IPU_PORT,
+	SWNODE_IPU_ENDPOINT,
 	/* Must be last because it is optional / maybe empty */
 	SWNODE_VCM,
 	SWNODE_COUNT
 };
 
 /* Data representation as it is in ACPI SSDB buffer */
-struct cio2_sensor_ssdb {
+struct ipu_sensor_ssdb {
 	u8 version;
 	u8 sku;
 	u8 guid_csi2[16];
@@ -90,7 +90,7 @@ struct cio2_sensor_ssdb {
 	u8 reserved2[13];
 } __packed;
 
-struct cio2_property_names {
+struct ipu_property_names {
 	char clock_frequency[16];
 	char rotation[9];
 	char orientation[12];
@@ -100,19 +100,19 @@ struct cio2_property_names {
 	char link_frequencies[17];
 };
 
-struct cio2_node_names {
+struct ipu_node_names {
 	char port[7];
 	char endpoint[11];
 	char remote_port[7];
 };
 
-struct cio2_sensor_config {
+struct ipu_sensor_config {
 	const char *hid;
 	const u8 nr_link_freqs;
 	const u64 link_freqs[MAX_NUM_LINK_FREQS];
 };
 
-struct cio2_sensor {
+struct ipu_sensor {
 	/* append ssdb.link(u8) in "-%u" format as suffix of HID */
 	char name[ACPI_ID_LEN + 4];
 	struct acpi_device *adev;
@@ -121,26 +121,32 @@ struct cio2_sensor {
 	/* SWNODE_COUNT + 1 for terminating NULL */
 	const struct software_node *group[SWNODE_COUNT + 1];
 	struct software_node swnodes[SWNODE_COUNT];
-	struct cio2_node_names node_names;
+	struct ipu_node_names node_names;
 
-	struct cio2_sensor_ssdb ssdb;
+	struct ipu_sensor_ssdb ssdb;
 	struct acpi_pld_info *pld;
 
-	struct cio2_property_names prop_names;
+	struct ipu_property_names prop_names;
 	struct property_entry ep_properties[5];
 	struct property_entry dev_properties[5];
-	struct property_entry cio2_properties[3];
+	struct property_entry ipu_properties[3];
 	struct software_node_ref_args local_ref[1];
 	struct software_node_ref_args remote_ref[1];
 	struct software_node_ref_args vcm_ref[1];
 };
 
-struct cio2_bridge {
-	char cio2_node_name[ACPI_ID_LEN];
-	struct software_node cio2_hid_node;
+struct ipu_bridge {
+	char ipu_node_name[ACPI_ID_LEN];
+	struct software_node ipu_hid_node;
 	u32 data_lanes[4];
 	unsigned int n_sensors;
-	struct cio2_sensor sensors[CIO2_NUM_PORTS];
+	struct ipu_sensor sensors[CIO2_NUM_PORTS];
 };
 
+#if IS_ENABLED(CONFIG_IPU_BRIDGE)
+int ipu_bridge_init(struct pci_dev *ipu);
+#else
+static inline int ipu_bridge_init(struct pci_dev *ipu) { return 0; }
+#endif
+
 #endif
diff --git a/drivers/media/pci/intel/ipu3/Kconfig b/drivers/media/pci/intel/ipu3/Kconfig
index 65b0c1598fbf..9be06ee81ff0 100644
--- a/drivers/media/pci/intel/ipu3/Kconfig
+++ b/drivers/media/pci/intel/ipu3/Kconfig
@@ -17,22 +17,3 @@ config VIDEO_IPU3_CIO2
 	  Say Y or M here if you have a Skylake/Kaby Lake SoC with MIPI CSI-2
 	  connected camera.
 	  The module will be called ipu3-cio2.
-
-config CIO2_BRIDGE
-	bool "IPU3 CIO2 Sensors Bridge"
-	depends on VIDEO_IPU3_CIO2 && ACPI
-	depends on I2C
-	help
-	  This extension provides an API for the ipu3-cio2 driver to create
-	  connections to cameras that are hidden in the SSDB buffer in ACPI.
-	  It can be used to enable support for cameras in detachable / hybrid
-	  devices that ship with Windows.
-
-	  Say Y here if your device is a detachable / hybrid laptop that comes
-	  with Windows installed by the OEM, for example:
-
-		- Microsoft Surface models (except Surface Pro 3)
-		- The Lenovo Miix line (for example the 510, 520, 710 and 720)
-		- Dell 7285
-
-	  If in doubt, say N here.
diff --git a/drivers/media/pci/intel/ipu3/Makefile b/drivers/media/pci/intel/ipu3/Makefile
index 933777e6ea8a..429d516452e4 100644
--- a/drivers/media/pci/intel/ipu3/Makefile
+++ b/drivers/media/pci/intel/ipu3/Makefile
@@ -2,4 +2,3 @@
 obj-$(CONFIG_VIDEO_IPU3_CIO2) += ipu3-cio2.o
 
 ipu3-cio2-y += ipu3-cio2-main.o
-ipu3-cio2-$(CONFIG_CIO2_BRIDGE) += cio2-bridge.o
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 3c84cb121632..03a7ab4d2e69 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -29,6 +29,7 @@
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-dma-sg.h>
 
+#include "../ipu-bridge.h"
 #include "ipu3-cio2.h"
 
 struct ipu3_cio2_fmt {
@@ -1727,7 +1728,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 			return -EINVAL;
 		}
 
-		r = cio2_bridge_init(pci_dev);
+		r = ipu_bridge_init(pci_dev);
 		if (r)
 			return r;
 	}
@@ -2060,3 +2061,4 @@ MODULE_AUTHOR("Yuning Pu <yuning.pu@intel.com>");
 MODULE_AUTHOR("Yong Zhi <yong.zhi@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("IPU3 CIO2 driver");
+MODULE_IMPORT_NS(INTEL_IPU_BRIDGE);
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
index 3a1f394e05aa..d731ce8adbe3 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
@@ -459,10 +459,4 @@ static inline struct cio2_queue *vb2q_to_cio2_queue(struct vb2_queue *vq)
 	return container_of(vq, struct cio2_queue, vbq);
 }
 
-#if IS_ENABLED(CONFIG_CIO2_BRIDGE)
-int cio2_bridge_init(struct pci_dev *cio2);
-#else
-static inline int cio2_bridge_init(struct pci_dev *cio2) { return 0; }
-#endif
-
 #endif
-- 
2.40.1

