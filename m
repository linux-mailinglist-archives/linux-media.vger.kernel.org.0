Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58B8676DFCE
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 07:38:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232170AbjHCFiy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 01:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232330AbjHCFii (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 01:38:38 -0400
Received: from mgamail.intel.com (unknown [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE4030DD
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 22:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691041114; x=1722577114;
  h=from:to:cc:subject:date:message-id;
  bh=SS/0OipvFdXAGbWD+EOGzHEaq5BClw2CMh46IklnYRE=;
  b=HQtXCUDrTNI9B0RKfrjxKBzVCccPtTE0tvF4RL4N/RRJbexfN8go9NU5
   1j1m3EvPj4hFSC0o6p6GOq7FYAeTERQyx+X2bfkxqI+SOpr8ngyOdkfiY
   IWEA9gJc4Hbmr6GAhN1oq7FNNOmGxJGB7rxITvE3YZOZJxkAk6hufgCit
   AzhgPFu/8I/ggY/gsIpG2NNVaC7tqxprDbcHNhrw7wAzvQCWO2KxuN+5Y
   k8PdaeSvN+yCz8Miu8kRO3SbtRvjgmoZMmnRTU+Ar9QGYuPZDsr2dWBMv
   nePvPcmDJ6EtxNr8xXskRrWevpNRWoZrFykfuosFCqwDgi4E0rSs9Hezx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="354688124"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="354688124"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 22:38:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="799389297"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="799389297"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by fmsmga004.fm.intel.com with ESMTP; 02 Aug 2023 22:38:31 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, bingbu.cao@linux.intel.com,
        andriy.shevchenko@intel.com, linux-media@vger.kernel.org,
        djrscally@gmail.com, hdegoede@redhat.com
Cc:     zhifeng.wang@intel.com, tian.shu.qiu@intel.com,
        Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v4] media: pci: intel: Add IVSC support for IPU bridge driver
Date:   Thu,  3 Aug 2023 13:38:14 +0800
Message-Id: <1691041094-10312-1-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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

---
v4:
 - rebase on https://git.linuxtv.org/sailus/media_tree.git tree

v3:
 - check ivsc ready or not in ipu_bridge_sensors_are_ready()
 - get ivsc acpi dev in ipu_bridge_get_ivsc_acpi_dev()
 - get mei csi dev in ipu_bridge_get_ivsc_csi_dev()
 - test this patch with IPU6 driver, ivsc driver series and sensor driver

---
 drivers/media/pci/intel/ipu-bridge.c | 263 ++++++++++++++++++++++++++++++++++-
 include/media/ipu-bridge.h           |  19 ++-
 2 files changed, 278 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 9404579..5000d7a 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -4,6 +4,8 @@
 #include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
+#include <linux/mei_cl_bus.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/string.h>
@@ -13,6 +15,23 @@
 #include <media/v4l2-fwnode.h>
 
 /*
+ * 92335fcf-3203-4472-af93-7b4453ac29da
+ *
+ * Used to build MEI CSI device name to lookup MEI CSI device by
+ * device_find_child_by_name().
+ */
+#define MEI_CSI_UUID							\
+	UUID_LE(0x92335FCF, 0x3203, 0x4472,				\
+		0xAF, 0x93, 0x7B, 0x44, 0x53, 0xAC, 0x29, 0xDA)
+
+/*
+ * IVSC device name
+ *
+ * Used to match IVSC device by ipu_bridge_match_ivsc_dev()
+ */
+#define IVSC_DEV_NAME "intel_vsc"
+
+/*
  * Extend this array with ACPI Hardware IDs of devices known to be working
  * plus the number of link-frequencies expected by their drivers, along with
  * the frequency values in hertz. This is somewhat opportunistic way of adding
@@ -65,6 +84,91 @@ static const char * const ipu_vcm_types[] = {
 	"lc898212axb",
 };
 
+/*
+ * Used to figure out IVSC acpi device by ipu_bridge_get_ivsc_acpi_dev()
+ * instead of device and driver match to probe IVSC device.
+ */
+static const struct acpi_device_id ivsc_acpi_ids[] = {
+	{ "INTC1059" },
+	{ "INTC1095" },
+	{ "INTC100A" },
+	{ "INTC10CF" },
+};
+
+static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev)
+{
+	acpi_handle handle = acpi_device_handle(adev);
+	struct acpi_device *consumer, *ivsc_adev;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ivsc_acpi_ids); i++) {
+		const struct acpi_device_id *acpi_id = &ivsc_acpi_ids[i];
+
+		for_each_acpi_dev_match(ivsc_adev, acpi_id->id, NULL, -1)
+			/* camera sensor depends on IVSC in DSDT if exist */
+			for_each_acpi_consumer_dev(ivsc_adev, consumer)
+				if (consumer->handle == handle)
+					return ivsc_adev;
+	}
+
+	return NULL;
+}
+
+static int ipu_bridge_match_ivsc_dev(struct device *dev, const void *adev)
+{
+	if (ACPI_COMPANION(dev) != adev)
+		return 0;
+
+	if (!sysfs_streq(dev_name(dev), IVSC_DEV_NAME))
+		return 0;
+
+	return 1;
+}
+
+static struct device *ipu_bridge_get_ivsc_csi_dev(struct acpi_device *adev)
+{
+	struct device *dev, *csi_dev;
+	uuid_le uuid = MEI_CSI_UUID;
+	char name[64];
+
+	/* IVSC device on platform bus */
+	dev = bus_find_device(&platform_bus_type, NULL, adev,
+			      ipu_bridge_match_ivsc_dev);
+	if (dev) {
+		snprintf(name, sizeof(name), "%s-%pUl", dev_name(dev), &uuid);
+
+		csi_dev = device_find_child_by_name(dev, name);
+
+		put_device(dev);
+
+		return csi_dev;
+	}
+
+	return NULL;
+}
+
+static int ipu_bridge_check_ivsc_dev(struct ipu_sensor *sensor,
+				     struct acpi_device *sensor_adev)
+{
+	struct acpi_device *adev;
+	struct device *csi_dev;
+
+	adev = ipu_bridge_get_ivsc_acpi_dev(sensor_adev);
+	if (adev) {
+		csi_dev = ipu_bridge_get_ivsc_csi_dev(adev);
+		if (!csi_dev) {
+			acpi_dev_put(adev);
+			dev_err(&adev->dev, "Failed to find MEI CSI dev\n");
+			return -ENODEV;
+		}
+
+		sensor->csi_dev = csi_dev;
+		sensor->ivsc_adev = adev;
+	}
+
+	return 0;
+}
+
 static int ipu_bridge_read_acpi_buffer(struct acpi_device *adev, char *id,
 				       void *data, u32 size)
 {
@@ -190,10 +294,48 @@ static void ipu_bridge_create_fwnode_properties(
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
@@ -251,6 +393,15 @@ static void ipu_bridge_init_swnode_names(struct ipu_sensor *sensor)
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
@@ -264,11 +415,31 @@ static void ipu_bridge_init_swnode_group(struct ipu_sensor *sensor)
 	sensor->group[SWNODE_IPU_ENDPOINT] = &nodes[SWNODE_IPU_ENDPOINT];
 	if (sensor->vcm_type)
 		sensor->group[SWNODE_VCM] =  &nodes[SWNODE_VCM];
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
@@ -287,6 +458,29 @@ static void ipu_bridge_create_connection_swnodes(struct ipu_bridge *bridge,
 						sensor->node_names.endpoint,
 						&nodes[SWNODE_IPU_PORT],
 						sensor->ipu_properties);
+
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
 	nodes[SWNODE_VCM] = NODE_VCM(sensor->node_names.vcm);
 
 	ipu_bridge_init_swnode_group(sensor);
@@ -397,6 +591,22 @@ int ipu_bridge_instantiate_vcm(struct device *sensor)
 }
 EXPORT_SYMBOL_NS_GPL(ipu_bridge_instantiate_vcm, INTEL_IPU_BRIDGE);
 
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
@@ -406,6 +616,8 @@ static void ipu_bridge_unregister_sensors(struct ipu_bridge *bridge)
 		sensor = &bridge->sensors[i];
 		software_node_unregister_node_group(sensor->group);
 		acpi_dev_put(sensor->adev);
+		put_device(sensor->csi_dev);
+		acpi_dev_put(sensor->ivsc_adev);
 	}
 }
 
@@ -436,12 +648,16 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
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
@@ -455,6 +671,10 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 		primary = acpi_fwnode_handle(adev);
 		primary->secondary = fwnode;
 
+		ret = ipu_bridge_instantiate_ivsc(sensor);
+		if (ret)
+			goto err_free_swnodes;
+
 		dev_info(bridge->dev, "Found supported sensor %s\n",
 			 acpi_dev_name(adev));
 
@@ -465,6 +685,9 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 
 err_free_swnodes:
 	software_node_unregister_node_group(sensor->group);
+err_put_ivsc:
+	put_device(sensor->csi_dev);
+	acpi_dev_put(sensor->ivsc_adev);
 err_put_adev:
 	acpi_dev_put(adev);
 	return ret;
@@ -491,6 +714,37 @@ static int ipu_bridge_connect_sensors(struct ipu_bridge *bridge)
 	return ret;
 }
 
+static int ipu_bridge_ivsc_is_ready(void)
+{
+	struct acpi_device *sensor_adev, *adev;
+	struct device *csi_dev;
+	bool ready = true;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {
+		const struct ipu_sensor_config *cfg =
+			&ipu_supported_sensors[i];
+
+		for_each_acpi_dev_match(sensor_adev, cfg->hid, NULL, -1) {
+			if (!sensor_adev->status.enabled)
+				continue;
+
+			adev = ipu_bridge_get_ivsc_acpi_dev(sensor_adev);
+			if (!adev)
+				continue;
+
+			csi_dev = ipu_bridge_get_ivsc_csi_dev(adev);
+			if (!csi_dev)
+				ready = false;
+
+			put_device(csi_dev);
+			acpi_dev_put(adev);
+		}
+	}
+
+	return ready;
+}
+
 int ipu_bridge_init(struct device *dev,
 		    ipu_parse_sensor_fwnode_t parse_sensor_fwnode)
 {
@@ -499,6 +753,9 @@ int ipu_bridge_init(struct device *dev,
 	unsigned int i;
 	int ret;
 
+	if (!ipu_bridge_ivsc_is_ready())
+		return -EPROBE_DEFER;
+
 	bridge = kzalloc(sizeof(*bridge), GFP_KERNEL);
 	if (!bridge)
 		return -ENOMEM;
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index ceda2a8..bdc654a 100644
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
 
 typedef int (*ipu_parse_sensor_fwnode_t)(struct acpi_device *adev,
-- 
2.7.4

