Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C002767EF1
	for <lists+linux-media@lfdr.de>; Sat, 29 Jul 2023 13:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbjG2L6C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jul 2023 07:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbjG2L57 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jul 2023 07:57:59 -0400
Received: from mgamail.intel.com (unknown [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925881737
        for <linux-media@vger.kernel.org>; Sat, 29 Jul 2023 04:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690631877; x=1722167877;
  h=from:to:cc:subject:date:message-id;
  bh=94UnchHshd9PTZHFFMJYnCEt0ZifHvUC0fN4te0B5JU=;
  b=jfVR/h7NeE/r0vC8S+zwIqDptdKIEpa6wokLCL8b2qUUTKka6kXtjVAr
   OpVPKbXxjtW76FQBYdWskORguSCtvkcxwhCQDYjbq31nsc5mmfJ2I46cR
   fDkgOse5u2ZS4zDX56GWGR3PNDugRbPe6cOnfGlVJufJRJHkFeg6W1gyQ
   pZa4oY8Icp0xNo6en2+aGR16aw7hsObTLQVHlyjo+9WWf3elpz1Kz7g1J
   P2mIK96zcfdUTTtyzrcMjljm7ilsSSn4ovGrEywWGWaIzEdT8TLdvFZgi
   zxDS71iunJTfGItHRRwksBQiVOW1MdA2BrrD1TzxC2XHAAKuuB5CKmv92
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="358786081"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="358786081"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 04:57:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="721543513"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="721543513"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by orsmga007.jf.intel.com with ESMTP; 29 Jul 2023 04:57:54 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, bingbu.cao@linux.intel.com,
        andriy.shevchenko@intel.com, linux-media@vger.kernel.org,
        djrscally@gmail.com, hdegoede@redhat.com
Cc:     zhifeng.wang@intel.com, tian.shu.qiu@intel.com,
        Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v3] add IVSC support for IPU bridge driver
Date:   Sat, 29 Jul 2023 19:57:51 +0800
Message-Id: <1690631871-15310-1-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
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
v3:
 - check ivsc ready or not in ipu_bridge_sensors_are_ready()
 - get ivsc acpi dev in ipu_bridge_get_ivsc_acpi_dev()
 - get mei csi dev in ipu_bridge_get_ivsc_csi_dev()
 - test this patch with IPU6 driver, ivsc driver series and sensor driver

---
 drivers/media/pci/intel/ipu-bridge.c | 251 +++++++++++++++++++++++++++++++++--
 drivers/media/pci/intel/ipu-bridge.h |  19 ++-
 2 files changed, 261 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 62daa8c..e6a1d73 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -4,13 +4,32 @@
 #include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
+#include <linux/mei_cl_bus.h>
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/string.h>
 #include <media/v4l2-fwnode.h>
 
 #include "ipu-bridge.h"
 
 /*
+ * 92335fcf-3203-4472-af93-7b4453ac29da
+ *
+ * Used to build MEI CSI device name to lookup MEI CSI device by
+ * device_find_child_by_name().
+ */
+#define MEI_CSI_UUID							\
+	UUID_LE(0x92335FCF, 0x3203, 0x4472,				\
+		0xAF, 0x93, 0x7b, 0x44, 0x53, 0xAC, 0x29, 0xDA)
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
@@ -61,6 +80,91 @@ static const char * const ipu_vcm_types[] = {
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
@@ -137,16 +241,53 @@ static void ipu_bridge_create_fwnode_properties(
 	struct ipu_bridge *bridge,
 	const struct ipu_sensor_config *cfg)
 {
-	u32 rotation;
+	struct ipu_property_names *names = &sensor->prop_names;
+	struct software_node *nodes = sensor->swnodes;
 	enum v4l2_fwnode_orientation orientation;
+	u32 rotation;
 
 	rotation = ipu_bridge_parse_rotation(sensor);
 	orientation = ipu_bridge_parse_orientation(sensor);
 
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
+						     sensor->ssdb.lanes);
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
+						     sensor->ssdb.lanes);
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
@@ -201,6 +342,15 @@ static void ipu_bridge_init_swnode_names(struct ipu_sensor *sensor)
 	snprintf(sensor->node_names.endpoint,
 		 sizeof(sensor->node_names.endpoint),
 		 SWNODE_GRAPH_ENDPOINT_NAME_FMT, 0); /* And endpoint 0 */
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
@@ -214,11 +364,31 @@ static void ipu_bridge_init_swnode_group(struct ipu_sensor *sensor)
 	sensor->group[SWNODE_IPU_ENDPOINT] = &nodes[SWNODE_IPU_ENDPOINT];
 	if (sensor->ssdb.vcmtype)
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
+		if (sensor->ssdb.vcmtype)
+			sensor->group[SWNODE_VCM] = &nodes[SWNODE_VCM];
+	} else {
+		if (sensor->ssdb.vcmtype)
+			sensor->group[SWNODE_IVSC_HID] = &nodes[SWNODE_VCM];
+	}
 }
 
 static void ipu_bridge_create_connection_swnodes(struct ipu_bridge *bridge,
 						 struct ipu_sensor *sensor)
 {
+	struct ipu_node_names *names = &sensor->node_names;
 	struct software_node *nodes = sensor->swnodes;
 	char vcm_name[ACPI_ID_LEN + 4];
 
@@ -238,6 +408,29 @@ static void ipu_bridge_create_connection_swnodes(struct ipu_bridge *bridge,
 						sensor->node_names.endpoint,
 						&nodes[SWNODE_IPU_PORT],
 						sensor->ipu_properties);
+
+	if (sensor->csi_dev) {
+		snprintf(sensor->ivsc_name, sizeof(sensor->ivsc_name), "%s-%u",
+			 acpi_device_hid(sensor->ivsc_adev), sensor->ssdb.link);
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
 	if (sensor->ssdb.vcmtype) {
 		/* append ssdb.link to distinguish VCM nodes with same HID */
 		snprintf(vcm_name, sizeof(vcm_name), "%s-%u",
@@ -273,6 +466,22 @@ static void ipu_bridge_instantiate_vcm_i2c_client(struct ipu_sensor *sensor)
 	}
 }
 
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
@@ -284,6 +493,8 @@ static void ipu_bridge_unregister_sensors(struct ipu_bridge *bridge)
 		ACPI_FREE(sensor->pld);
 		acpi_dev_put(sensor->adev);
 		i2c_unregister_device(sensor->vcm_i2c_client);
+		put_device(sensor->csi_dev);
+		acpi_dev_put(sensor->ivsc_adev);
 	}
 }
 
@@ -337,12 +548,16 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 			goto err_free_pld;
 		}
 
+		ret = ipu_bridge_check_ivsc_dev(sensor, adev);
+		if (ret)
+			goto err_free_pld;
+
 		ipu_bridge_create_fwnode_properties(sensor, bridge, cfg);
 		ipu_bridge_create_connection_swnodes(bridge, sensor);
 
 		ret = software_node_register_node_group(sensor->group);
 		if (ret)
-			goto err_free_pld;
+			goto err_put_dev;
 
 		fwnode = software_node_fwnode(&sensor->swnodes[
 						      SWNODE_SENSOR_HID]);
@@ -356,6 +571,10 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 		primary = acpi_fwnode_handle(adev);
 		primary->secondary = fwnode;
 
+		ret = ipu_bridge_instantiate_ivsc(sensor);
+		if (ret)
+			goto err_free_swnodes;
+
 		ipu_bridge_instantiate_vcm_i2c_client(sensor);
 
 		dev_info(&ipu->dev, "Found supported sensor %s\n",
@@ -368,6 +587,9 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 
 err_free_swnodes:
 	software_node_unregister_node_group(sensor->group);
+err_put_dev:
+	put_device(sensor->csi_dev);
+	acpi_dev_put(sensor->ivsc_adev);
 err_free_pld:
 	ACPI_FREE(sensor->pld);
 err_put_adev:
@@ -411,7 +633,8 @@ static int ipu_bridge_connect_sensors(struct ipu_bridge *bridge,
  */
 static int ipu_bridge_sensors_are_ready(void)
 {
-	struct acpi_device *adev;
+	struct acpi_device *sensor_adev, *adev;
+	struct device *csi_dev;
 	bool ready = true;
 	unsigned int i;
 
@@ -419,11 +642,23 @@ static int ipu_bridge_sensors_are_ready(void)
 		const struct ipu_sensor_config *cfg =
 			&ipu_supported_sensors[i];
 
-		for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
-			if (!adev->status.enabled)
+		for_each_acpi_dev_match(sensor_adev, cfg->hid, NULL, -1) {
+			if (!sensor_adev->status.enabled)
+				continue;
+
+			adev = ipu_bridge_get_ivsc_acpi_dev(sensor_adev);
+			if (adev) {
+				csi_dev = ipu_bridge_get_ivsc_csi_dev(adev);
+				if (!csi_dev)
+					ready = false;
+
+				put_device(csi_dev);
+				acpi_dev_put(adev);
+
 				continue;
+			}
 
-			if (!acpi_dev_ready_for_enumeration(adev))
+			if (!acpi_dev_ready_for_enumeration(sensor_adev))
 				ready = false;
 		}
 	}
diff --git a/drivers/media/pci/intel/ipu-bridge.h b/drivers/media/pci/intel/ipu-bridge.h
index 8cb733c..72ad9db 100644
--- a/drivers/media/pci/intel/ipu-bridge.h
+++ b/drivers/media/pci/intel/ipu-bridge.h
@@ -54,7 +54,12 @@ enum ipu_sensor_swnodes {
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
@@ -101,6 +106,8 @@ struct ipu_property_names {
 
 struct ipu_node_names {
 	char port[7];
+	char ivsc_sensor_port[7];
+	char ivsc_ipu_port[7];
 	char endpoint[11];
 	char remote_port[7];
 };
@@ -117,6 +124,10 @@ struct ipu_sensor {
 	struct acpi_device *adev;
 	struct i2c_client *vcm_i2c_client;
 
+	struct device *csi_dev;
+	struct acpi_device *ivsc_adev;
+	char ivsc_name[ACPI_ID_LEN + 4];
+
 	/* SWNODE_COUNT + 1 for terminating NULL */
 	const struct software_node *group[SWNODE_COUNT + 1];
 	struct software_node swnodes[SWNODE_COUNT];
@@ -129,9 +140,15 @@ struct ipu_sensor {
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
2.7.4

