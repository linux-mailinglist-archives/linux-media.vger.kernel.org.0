Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18223743CF8
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 15:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbjF3NqM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 09:46:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231950AbjF3NqK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 09:46:10 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB9573C35
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 06:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688132727; x=1719668727;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5rTQlB0jt2RhEpAMGDQzKV0FVIFgX7MfcZySmrpP5II=;
  b=brKTLbq2Ez94GTJBisOfzlyTxt+5/zyaYqwJ/z001VTqixIucmMMyUxr
   TWxS+qswXzgtNBuQzPL1z5iIWSjQRqiKpu4jqtFpMDGBOH8RwjgqNL4Gi
   kK6oe6gHss/cp3bkIORRwMkBiJNvElNzD1KWhRjH0qn+cOZZju/vybCRr
   fZVYtWjtzCBnPF8F7PJsWNXfQfKuO4xHFfbCSgJEXWRSDjJRmByM8CQah
   0S+06N9KUAVgCrLI3DUWVh2stVJZmnbjwvMhSFVrxtSLdGgH1SoS640YM
   dEA9x9OEPKUwAsX7U1fm3Op4oMxrgZ6HrMGvaYrgaEN2AGayXvYCsJeqj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="362438593"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="362438593"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 06:45:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="783083716"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="783083716"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 06:45:21 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 94AA512075E;
        Fri, 30 Jun 2023 16:45:09 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Wentong Wu <wentong.wu@intel.com>, bingbu.cao@linux.intel.com,
        andriy.shevchenko@intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 1/2] media: ipu-bridge: add IVSC support
Date:   Fri, 30 Jun 2023 16:45:05 +0300
Message-Id: <20230630134506.109269-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630134506.109269-1-sakari.ailus@linux.intel.com>
References: <20230630134506.109269-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Wentong Wu <wentong.wu@intel.com>

Previously on ACPI platforms, sensors that are intended to be connected
to a IPU device for use with the ipu3-cio2 driver lacking the necessary
connection information in firmware. IPU bridge driver is to connect
sensors to IPU device via software nodes.

Currently IVSC located between IPU device and sensors is available in
existing commercial platforms from multiple OEMs. But the connection
information between them in firmware is also not enough to build V4L2
connection graph. This patch parses the connection properties from the
SSDB buffer in DSDT and build the connection using software nodes.

IVSC driver is based on MEI framework (previously known as HECI), it
has two MEI clients, MEI CSI and MEI ACE. Both clients are used to
communicate messages with IVSC firmware. Linux abstracts MEI client
as a device, whose bus type is MEI. And the device is addressed by a
GUID/UUID which is part of the device name of MEI client. After figured
out MEI CSI via the UUID composed device name, this patch setup the
connection between MEI CSI and IPU, and the connection between MEI CSI
and sensor via software nodes.

Signed-off-by: Wentong Wu <wentong.wu@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
[Sakari Ailus: rebase on Hans de Goede's cleanups and fixes]
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 195 ++++++++++++++++++++++++++-
 include/media/ipu-bridge.h           |  19 ++-
 2 files changed, 207 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 32dabc16a7b4..2811e716ea62 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -4,6 +4,8 @@
 #include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
+#include <linux/mei_cl_bus.h>
+#include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/workqueue.h>
@@ -11,6 +13,16 @@
 #include <media/ipu-bridge.h>
 #include <media/v4l2-fwnode.h>
 
+/*
+ * 92335fcf-3203-4472-af93-7b4453ac29da
+ *
+ * Used to build MEI CSI device name to lookup MEI CSI device by
+ * device_find_child_by_name().
+ */
+#define MEI_CSI_UUID							\
+	UUID_LE(0x92335FCF, 0x3203, 0x4472,				\
+		0xAF, 0x93, 0x7b, 0x44, 0x53, 0xAC, 0x29, 0xDA)
+
 /*
  * Extend this array with ACPI Hardware IDs of devices known to be working
  * plus the number of link-frequencies expected by their drivers, along with
@@ -64,6 +76,60 @@ static const char * const ipu_vcm_types[] = {
 	"lc898212axb",
 };
 
+/*
+ * Used to figure out IVSC device by ipu_bridge_check_ivsc_dev()
+ * instead of device and driver match to probe IVSC device.
+ */
+static const struct acpi_device_id ivsc_acpi_ids[] = {
+	{ "INTC1059" },
+	{ "INTC1095" },
+	{ "INTC100A" },
+	{ "INTC10CF" },
+};
+
+static int ipu_bridge_check_ivsc_dev(struct ipu_sensor *sensor,
+				     struct acpi_device *sensor_adev)
+{
+	acpi_handle handle = acpi_device_handle(sensor_adev);
+	struct acpi_device *consumer, *adev;
+	uuid_le uuid = MEI_CSI_UUID;
+	struct device *csi_dev;
+	unsigned int i;
+	char name[64];
+
+	for (i = 0; i < ARRAY_SIZE(ivsc_acpi_ids); i++) {
+		const struct acpi_device_id *acpi_id = &ivsc_acpi_ids[i];
+
+		for_each_acpi_dev_match(adev, acpi_id->id, NULL, -1) {
+			/* camera sensor depends on IVSC in DSDT */
+			for_each_acpi_consumer_dev(adev, consumer)
+				if (consumer->handle == handle)
+					break;
+
+			if (!consumer)
+				continue;
+
+			snprintf(name, sizeof(name), "%s-%pUl",
+				 dev_name(&adev->dev), &uuid);
+
+			csi_dev = device_find_child_by_name(&adev->dev, name);
+			if (!csi_dev) {
+				acpi_dev_put(adev);
+				dev_err(&adev->dev,
+					"Failed to find MEI CSI dev\n");
+				return -ENODEV;
+			}
+
+			sensor->csi_dev = csi_dev;
+			sensor->ivsc_adev = adev;
+
+			return 0;
+		}
+	}
+
+	return 0;
+}
+
 static int ipu_bridge_read_acpi_buffer(struct acpi_device *adev, char *id,
 				       void *data, u32 size)
 {
@@ -189,10 +255,48 @@ static void ipu_bridge_create_fwnode_properties(
 	struct ipu_bridge *bridge,
 	const struct ipu_sensor_config *cfg)
 {
+	struct ipu_property_names *names = &sensor->prop_names;
+	struct software_node *nodes = sensor->swnodes;
+
 	sensor->prop_names = prop_names;
 
-	sensor->local_ref[0] = SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_IPU_ENDPOINT]);
-	sensor->remote_ref[0] = SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_SENSOR_ENDPOINT]);
+	if (sensor->csi_dev) {
+		sensor->local_ref[0] =
+			SOFTWARE_NODE_REFERENCE(&nodes[SWNODE_IVSC_SENSOR_ENDPOINT]);
+		sensor->remote_ref[0] =
+			SOFTWARE_NODE_REFERENCE(&nodes[SWNODE_IVSC_IPU_ENDPOINT]);
+		sensor->ivsc_sensor_ref[0] =
+			SOFTWARE_NODE_REFERENCE(&nodes[SWNODE_SENSOR_ENDPOINT]);
+		sensor->ivsc_ipu_ref[0] =
+			SOFTWARE_NODE_REFERENCE(&nodes[SWNODE_IPU_ENDPOINT]);
+
+		sensor->ivsc_sensor_ep_properties[0] =
+			PROPERTY_ENTRY_U32(names->bus_type,
+					   V4L2_FWNODE_BUS_TYPE_CSI2_DPHY);
+		sensor->ivsc_sensor_ep_properties[1] =
+			PROPERTY_ENTRY_U32_ARRAY_LEN(names->data_lanes,
+						     bridge->data_lanes,
+						     sensor->lanes);
+		sensor->ivsc_sensor_ep_properties[2] =
+			PROPERTY_ENTRY_REF_ARRAY(names->remote_endpoint,
+						 sensor->ivsc_sensor_ref);
+
+		sensor->ivsc_ipu_ep_properties[0] =
+			PROPERTY_ENTRY_U32(names->bus_type,
+					   V4L2_FWNODE_BUS_TYPE_CSI2_DPHY);
+		sensor->ivsc_ipu_ep_properties[1] =
+			PROPERTY_ENTRY_U32_ARRAY_LEN(names->data_lanes,
+						     bridge->data_lanes,
+						     sensor->lanes);
+		sensor->ivsc_ipu_ep_properties[2] =
+			PROPERTY_ENTRY_REF_ARRAY(names->remote_endpoint,
+						 sensor->ivsc_ipu_ref);
+	} else {
+		sensor->local_ref[0] =
+			SOFTWARE_NODE_REFERENCE(&nodes[SWNODE_IPU_ENDPOINT]);
+		sensor->remote_ref[0] =
+			SOFTWARE_NODE_REFERENCE(&nodes[SWNODE_SENSOR_ENDPOINT]);
+	}
 
 	sensor->dev_properties[0] = PROPERTY_ENTRY_U32(
 					sensor->prop_names.clock_frequency,
@@ -205,7 +309,7 @@ static void ipu_bridge_create_fwnode_properties(
 					sensor->orientation);
 	if (sensor->vcm_type) {
 		sensor->vcm_ref[0] =
-			SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_VCM]);
+			SOFTWARE_NODE_REFERENCE(&nodes[SWNODE_VCM]);
 		sensor->dev_properties[3] =
 			PROPERTY_ENTRY_REF_ARRAY("lens-focus", sensor->vcm_ref);
 	}
@@ -245,11 +349,21 @@ static void ipu_bridge_init_swnode_names(struct ipu_sensor *sensor)
 	snprintf(sensor->node_names.endpoint,
 		 sizeof(sensor->node_names.endpoint),
 		 SWNODE_GRAPH_ENDPOINT_NAME_FMT, 0); /* And endpoint 0 */
+
 	if (sensor->vcm_type) {
 		/* append link to distinguish nodes with same model VCM */
 		snprintf(sensor->node_names.vcm, sizeof(sensor->node_names.vcm),
 			 "%s-%u", sensor->vcm_type, sensor->link);
 	}
+
+	if (sensor->csi_dev) {
+		snprintf(sensor->node_names.ivsc_sensor_port,
+			 sizeof(sensor->node_names.ivsc_sensor_port),
+			 SWNODE_GRAPH_PORT_NAME_FMT, 0);
+		snprintf(sensor->node_names.ivsc_ipu_port,
+			 sizeof(sensor->node_names.ivsc_ipu_port),
+			 SWNODE_GRAPH_PORT_NAME_FMT, 1);
+	}
 }
 
 static void ipu_bridge_init_swnode_group(struct ipu_sensor *sensor)
@@ -261,13 +375,31 @@ static void ipu_bridge_init_swnode_group(struct ipu_sensor *sensor)
 	sensor->group[SWNODE_SENSOR_ENDPOINT] = &nodes[SWNODE_SENSOR_ENDPOINT];
 	sensor->group[SWNODE_IPU_PORT] = &nodes[SWNODE_IPU_PORT];
 	sensor->group[SWNODE_IPU_ENDPOINT] = &nodes[SWNODE_IPU_ENDPOINT];
-	if (sensor->vcm_type)
-		sensor->group[SWNODE_VCM] =  &nodes[SWNODE_VCM];
+
+	if (sensor->csi_dev) {
+		sensor->group[SWNODE_IVSC_HID] =
+					&nodes[SWNODE_IVSC_HID];
+		sensor->group[SWNODE_IVSC_SENSOR_PORT] =
+					&nodes[SWNODE_IVSC_SENSOR_PORT];
+		sensor->group[SWNODE_IVSC_SENSOR_ENDPOINT] =
+					&nodes[SWNODE_IVSC_SENSOR_ENDPOINT];
+		sensor->group[SWNODE_IVSC_IPU_PORT] =
+					&nodes[SWNODE_IVSC_IPU_PORT];
+		sensor->group[SWNODE_IVSC_IPU_ENDPOINT] =
+					&nodes[SWNODE_IVSC_IPU_ENDPOINT];
+
+		if (sensor->vcm_type)
+			sensor->group[SWNODE_VCM] = &nodes[SWNODE_VCM];
+	} else {
+		if (sensor->vcm_type)
+			sensor->group[SWNODE_IVSC_HID] = &nodes[SWNODE_VCM];
+	}
 }
 
 static void ipu_bridge_create_connection_swnodes(struct ipu_bridge *bridge,
 						 struct ipu_sensor *sensor)
 {
+	struct ipu_node_names *names = &sensor->node_names;
 	struct software_node *nodes = sensor->swnodes;
 
 	ipu_bridge_init_swnode_names(sensor);
@@ -288,6 +420,28 @@ static void ipu_bridge_create_connection_swnodes(struct ipu_bridge *bridge,
 						sensor->ipu_properties);
 	nodes[SWNODE_VCM] = NODE_VCM(sensor->node_names.vcm);
 
+	if (sensor->csi_dev) {
+		snprintf(sensor->ivsc_name, sizeof(sensor->ivsc_name), "%s-%u",
+			 acpi_device_hid(sensor->ivsc_adev), sensor->link);
+
+		nodes[SWNODE_IVSC_HID] = NODE_SENSOR(sensor->ivsc_name,
+						     sensor->ivsc_properties);
+		nodes[SWNODE_IVSC_SENSOR_PORT] =
+				NODE_PORT(names->ivsc_sensor_port,
+					  &nodes[SWNODE_IVSC_HID]);
+		nodes[SWNODE_IVSC_SENSOR_ENDPOINT] =
+				NODE_ENDPOINT(names->endpoint,
+					      &nodes[SWNODE_IVSC_SENSOR_PORT],
+					      sensor->ivsc_sensor_ep_properties);
+		nodes[SWNODE_IVSC_IPU_PORT] =
+				NODE_PORT(names->ivsc_ipu_port,
+					  &nodes[SWNODE_IVSC_HID]);
+		nodes[SWNODE_IVSC_IPU_ENDPOINT] =
+				NODE_ENDPOINT(names->endpoint,
+					      &nodes[SWNODE_IVSC_IPU_PORT],
+					      sensor->ivsc_ipu_ep_properties);
+	}
+
 	ipu_bridge_init_swnode_group(sensor);
 }
 
@@ -397,6 +551,22 @@ int ipu_bridge_instantiate_vcm(struct device *sensor)
 }
 EXPORT_SYMBOL(ipu_bridge_instantiate_vcm);
 
+static int ipu_bridge_instantiate_ivsc(struct ipu_sensor *sensor)
+{
+	struct fwnode_handle *fwnode;
+
+	if (!sensor->csi_dev)
+		return 0;
+
+	fwnode = software_node_fwnode(&sensor->swnodes[SWNODE_IVSC_HID]);
+	if (!fwnode)
+		return -ENODEV;
+
+	set_secondary_fwnode(sensor->csi_dev, fwnode);
+
+	return 0;
+}
+
 static void ipu_bridge_unregister_sensors(struct ipu_bridge *bridge)
 {
 	struct ipu_sensor *sensor;
@@ -406,6 +576,8 @@ static void ipu_bridge_unregister_sensors(struct ipu_bridge *bridge)
 		sensor = &bridge->sensors[i];
 		software_node_unregister_node_group(sensor->group);
 		acpi_dev_put(sensor->adev);
+		put_device(sensor->csi_dev);
+		acpi_dev_put(sensor->ivsc_adev);
 	}
 }
 
@@ -436,12 +608,16 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 		snprintf(sensor->name, sizeof(sensor->name), "%s-%u",
 			 cfg->hid, sensor->link);
 
+		ret = ipu_bridge_check_ivsc_dev(sensor, adev);
+		if (ret)
+			goto err_put_adev;
+
 		ipu_bridge_create_fwnode_properties(sensor, bridge, cfg);
 		ipu_bridge_create_connection_swnodes(bridge, sensor);
 
 		ret = software_node_register_node_group(sensor->group);
 		if (ret)
-			goto err_put_adev;
+			goto err_put_ivsc;
 
 		fwnode = software_node_fwnode(&sensor->swnodes[
 						      SWNODE_SENSOR_HID]);
@@ -455,6 +631,10 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 		primary = acpi_fwnode_handle(adev);
 		primary->secondary = fwnode;
 
+		ret = ipu_bridge_instantiate_ivsc(sensor);
+		if (ret)
+			goto err_free_swnodes;
+
 		dev_info(bridge->dev, "Found supported sensor %s\n",
 			 acpi_dev_name(adev));
 
@@ -465,6 +645,9 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 
 err_free_swnodes:
 	software_node_unregister_node_group(sensor->group);
+err_put_ivsc:
+	put_device(sensor->csi_dev);
+	acpi_dev_put(sensor->ivsc_adev);
 err_put_adev:
 	acpi_dev_put(adev);
 	return ret;
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 31b138170c73..08204ed9f8bb 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -53,7 +53,12 @@ enum ipu_sensor_swnodes {
 	SWNODE_SENSOR_ENDPOINT,
 	SWNODE_IPU_PORT,
 	SWNODE_IPU_ENDPOINT,
-	/* Must be last because it is optional / maybe empty */
+	/* below are optional / maybe empty */
+	SWNODE_IVSC_HID,
+	SWNODE_IVSC_SENSOR_PORT,
+	SWNODE_IVSC_SENSOR_ENDPOINT,
+	SWNODE_IVSC_IPU_PORT,
+	SWNODE_IVSC_IPU_ENDPOINT,
 	SWNODE_VCM,
 	SWNODE_COUNT
 };
@@ -100,6 +105,8 @@ struct ipu_property_names {
 
 struct ipu_node_names {
 	char port[7];
+	char ivsc_sensor_port[7];
+	char ivsc_ipu_port[7];
 	char endpoint[11];
 	char remote_port[7];
 	char vcm[16];
@@ -116,6 +123,10 @@ struct ipu_sensor {
 	char name[ACPI_ID_LEN + 4];
 	struct acpi_device *adev;
 
+	struct device *csi_dev;
+	struct acpi_device *ivsc_adev;
+	char ivsc_name[ACPI_ID_LEN + 4];
+
 	/* SWNODE_COUNT + 1 for terminating NULL */
 	const struct software_node *group[SWNODE_COUNT + 1];
 	struct software_node swnodes[SWNODE_COUNT];
@@ -132,9 +143,15 @@ struct ipu_sensor {
 	struct property_entry ep_properties[5];
 	struct property_entry dev_properties[5];
 	struct property_entry ipu_properties[3];
+	struct property_entry ivsc_properties[1];
+	struct property_entry ivsc_sensor_ep_properties[4];
+	struct property_entry ivsc_ipu_ep_properties[4];
+
 	struct software_node_ref_args local_ref[1];
 	struct software_node_ref_args remote_ref[1];
 	struct software_node_ref_args vcm_ref[1];
+	struct software_node_ref_args ivsc_sensor_ref[1];
+	struct software_node_ref_args ivsc_ipu_ref[1];
 };
 
 struct ipu_bridge {
-- 
2.39.2

