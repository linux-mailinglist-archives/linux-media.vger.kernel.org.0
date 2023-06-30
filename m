Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB3C743A5C
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 13:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232559AbjF3LIg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 07:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232591AbjF3LIY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 07:08:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E79E3C0A
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 04:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688123254;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F4l37O75DmPfTpyAvJFFDUFZtBVP7vi3gVmGfbupEgA=;
        b=UBAYu6DD/pzU9RucPe1C1JkY226SyRtAEEmH44mDzfVZwhs92z3GecTHSivJz/uMUHIiVX
        texxuMGzsEe/INx06udo8iGb41g7adgcIleq+dV9NQSrnzJ7cmgix9dtRZ1142RXE7qdah
        Xxj6arV1JvmeSSviCIIwljJ5eDpnC7A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-5H0IWoRuPEK25D9dfUHjXA-1; Fri, 30 Jun 2023 07:07:30 -0400
X-MC-Unique: 5H0IWoRuPEK25D9dfUHjXA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB8E4856506;
        Fri, 30 Jun 2023 11:07:29 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.184])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A1634492B02;
        Fri, 30 Jun 2023 11:07:26 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 13/15] media: atomisp: csi2-bridge: Switch to new common ipu_bridge_init()
Date:   Fri, 30 Jun 2023 13:06:41 +0200
Message-ID: <20230630110643.209761-14-hdegoede@redhat.com>
In-Reply-To: <20230630110643.209761-1-hdegoede@redhat.com>
References: <20230630110643.209761-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the duplicate IPU ACPI bridge code and use the new
shared ipu_bridge_init() functionality.

Note this will also use / assume v4l2-async device instantation for
ov5693 sensors on atomisp devices since ipu_supported_sensors[]
already contains a match for this.

This is fine since recent atomisp improvements allow the atomisp code
to work with generic v4l2 sensor drivers and using an unmodified
drivers/media/i2c/ov5693.c has been successfully tested on
an Acer Iconia W4 820 tablet with Bay an ISP2400 + OV5693 sensor.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/Kconfig         |   2 +
 .../staging/media/atomisp/pci/atomisp_csi2.h  |  67 ----
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 326 +++---------------
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |   1 +
 4 files changed, 48 insertions(+), 348 deletions(-)

diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/media/atomisp/Kconfig
index e9b168ba97bf..1c1007362e21 100644
--- a/drivers/staging/media/atomisp/Kconfig
+++ b/drivers/staging/media/atomisp/Kconfig
@@ -12,9 +12,11 @@ menuconfig INTEL_ATOMISP
 config VIDEO_ATOMISP
 	tristate "Intel Atom Image Signal Processor Driver"
 	depends on VIDEO_DEV && INTEL_ATOMISP
+	depends on MEDIA_PCI_SUPPORT && I2C
 	depends on PMIC_OPREGION
 	select V4L2_FWNODE
 	select IOSF_MBI
+	select IPU_BRIDGE
 	select VIDEOBUF2_VMALLOC
 	select VIDEO_V4L2_SUBDEV_API
 	help
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.h b/drivers/staging/media/atomisp/pci/atomisp_csi2.h
index 16ddb3ab2963..8a112acba1e0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.h
@@ -30,9 +30,6 @@
 #define CSI2_PAD_SOURCE		1
 #define CSI2_PADS_NUM		2
 
-#define CSI2_MAX_LANES		4
-#define CSI2_MAX_LINK_FREQS	3
-
 #define CSI2_MAX_ACPI_GPIOS	2u
 
 struct acpi_device;
@@ -55,70 +52,6 @@ struct atomisp_csi2_acpi_gpio_parsing_data {
 	unsigned int map_count;
 };
 
-enum atomisp_csi2_sensor_swnodes {
-	SWNODE_SENSOR,
-	SWNODE_SENSOR_PORT,
-	SWNODE_SENSOR_ENDPOINT,
-	SWNODE_CSI2_PORT,
-	SWNODE_CSI2_ENDPOINT,
-	SWNODE_COUNT
-};
-
-struct atomisp_csi2_property_names {
-	char clock_frequency[16];
-	char rotation[9];
-	char bus_type[9];
-	char data_lanes[11];
-	char remote_endpoint[16];
-	char link_frequencies[17];
-};
-
-struct atomisp_csi2_node_names {
-	char port[7];
-	char endpoint[11];
-	char remote_port[7];
-};
-
-struct atomisp_csi2_sensor_config {
-	const char *hid;
-	int lanes;
-	int nr_link_freqs;
-	u64 link_freqs[CSI2_MAX_LINK_FREQS];
-};
-
-struct atomisp_csi2_sensor {
-	/* Append port in "-%u" format as suffix of HID */
-	char name[ACPI_ID_LEN + 4];
-	struct acpi_device *adev;
-	int port;
-	int lanes;
-
-	/* SWNODE_COUNT + 1 for terminating NULL */
-	const struct software_node *group[SWNODE_COUNT + 1];
-	struct software_node swnodes[SWNODE_COUNT];
-	struct atomisp_csi2_node_names node_names;
-	struct atomisp_csi2_property_names prop_names;
-	/* "clock-frequency", "rotation" + terminating entry */
-	struct property_entry dev_properties[3];
-	/* "bus-type", "data-lanes", "remote-endpoint" + "link-freq" + terminating entry */
-	struct property_entry ep_properties[5];
-	/* "data-lanes", "remote-endpoint" + terminating entry */
-	struct property_entry csi2_properties[3];
-	struct software_node_ref_args local_ref[1];
-	struct software_node_ref_args remote_ref[1];
-	struct software_node_ref_args vcm_ref[1];
-	/* GPIO mappings storage */
-	struct atomisp_csi2_acpi_gpio_map gpio_map;
-};
-
-struct atomisp_csi2_bridge {
-	struct software_node csi2_node;
-	char csi2_node_name[14];
-	u32 data_lanes[CSI2_MAX_LANES];
-	unsigned int n_sensors;
-	struct atomisp_csi2_sensor sensors[ATOMISP_CAMERA_NR_PORTS];
-};
-
 struct atomisp_mipi_csi2_device {
 	struct v4l2_subdev subdev;
 	struct media_pad pads[CSI2_PADS_NUM];
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index 0d12ba78d9c1..d7b8c3de0e17 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -14,31 +14,14 @@
 #include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/property.h>
+
+#include <media/ipu-bridge.h>
 #include <media/v4l2-fwnode.h>
 
 #include "atomisp_cmd.h"
 #include "atomisp_csi2.h"
 #include "atomisp_internal.h"
 
-#define NODE_SENSOR(_HID, _PROPS)		\
-	((const struct software_node) {		\
-		.name = _HID,			\
-		.properties = _PROPS,		\
-	})
-
-#define NODE_PORT(_PORT, _SENSOR_NODE)		\
-	((const struct software_node) {		\
-		.name = _PORT,			\
-		.parent = _SENSOR_NODE,		\
-	})
-
-#define NODE_ENDPOINT(_EP, _PORT, _PROPS)	\
-	((const struct software_node) {		\
-		.name = _EP,			\
-		.parent = _PORT,		\
-		.properties = _PROPS,		\
-	})
-
 #define PMC_CLK_RATE_19_2MHZ			19200000
 
 /*
@@ -83,21 +66,6 @@ static const guid_t atomisp_dsm_guid =
 	GUID_INIT(0xdc2f6c4f, 0x045b, 0x4f1d,
 		  0x97, 0xb9, 0x88, 0x2a, 0x68, 0x60, 0xa4, 0xbe);
 
-/*
- * Extend this array with ACPI Hardware IDs of sensors known to be working
- * plus the default number of links + link-frequencies.
- *
- * Do not add an entry for a sensor that is not actually supported,
- * or which have not yet been converted to work without atomisp_gmin
- * power-management and with v4l2-async probing.
- */
-static const struct atomisp_csi2_sensor_config supported_sensors[] = {
-	/* GalaxyCore GC0310 */
-	{ "INT0310", 1 },
-	/* Omnivision OV2680 */
-	{ "OVTI2680", 1 },
-};
-
 /*
  * gmin_cfg parsing code. This is a cleaned up version of the gmin_cfg parsing
  * code from atomisp_gmin_platform.c.
@@ -400,8 +368,7 @@ static int atomisp_csi2_handle_acpi_gpio_res(struct acpi_resource *ares, void *_
  * the INT3472 discrete.c code and there is some overlap, but there are
  * enough differences that it is difficult to share the code.
  */
-static int atomisp_csi2_add_gpio_mappings(struct atomisp_csi2_sensor *sensor,
-					  struct acpi_device *adev)
+static int atomisp_csi2_add_gpio_mappings(struct acpi_device *adev)
 {
 	struct atomisp_csi2_acpi_gpio_parsing_data data = { };
 	LIST_HEAD(resource_list);
@@ -469,9 +436,12 @@ static int atomisp_csi2_add_gpio_mappings(struct atomisp_csi2_sensor *sensor,
 		}
 	}
 
+	data.map = kzalloc(sizeof(*data.map), GFP_KERNEL);
+	if (!data.map)
+		return -ENOMEM;
+
 	/* Now parse the ACPI resources and build the lookup table */
 	data.adev = adev;
-	data.map = &sensor->gpio_map;
 	ret = acpi_dev_get_resources(adev, &resource_list,
 				     atomisp_csi2_handle_acpi_gpio_res, &data);
 	if (ret < 0)
@@ -491,220 +461,59 @@ static int atomisp_csi2_add_gpio_mappings(struct atomisp_csi2_sensor *sensor,
 	return ret;
 }
 
-static const struct atomisp_csi2_property_names prop_names = {
-	.clock_frequency = "clock-frequency",
-	.rotation = "rotation",
-	.bus_type = "bus-type",
-	.data_lanes = "data-lanes",
-	.remote_endpoint = "remote-endpoint",
-	.link_frequencies = "link-frequencies",
-};
-
-static void atomisp_csi2_create_fwnode_properties(struct atomisp_csi2_sensor *sensor,
-						  struct atomisp_csi2_bridge *bridge,
-						  const struct atomisp_csi2_sensor_config *cfg)
+static int atomisp_csi2_parse_sensor_fwnode(struct acpi_device *adev,
+					    struct ipu_sensor *sensor)
 {
-	sensor->prop_names = prop_names;
+	static const struct acpi_device_id dual_lane_sensors[] = {
+		{ "INT33BE" },	/* OV5693 */
+		{}
+	};
+	int ret, clock_num, lanes;
 
-	sensor->local_ref[0] = SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_CSI2_ENDPOINT]);
-	sensor->remote_ref[0] = SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_SENSOR_ENDPOINT]);
+	/*
+	 * ACPI takes care of turning the PMC clock on and off, but on BYT
+	 * the clock defaults to 25 MHz instead of the expected 19.2 MHz.
+	 * Get the PMC-clock number from ACPI PR0 method and set it to 19.2 MHz.
+	 * The PMC-clock number is also used to determine the default CSI port.
+	 */
+	clock_num = atomisp_csi2_get_pmc_clk_nr_from_acpi_pr0(adev);
 
-	sensor->dev_properties[0] = PROPERTY_ENTRY_U32(sensor->prop_names.clock_frequency,
-						       PMC_CLK_RATE_19_2MHZ);
-	sensor->dev_properties[1] = PROPERTY_ENTRY_U32(sensor->prop_names.rotation, 0);
+	ret = atomisp_csi2_set_pmc_clk_freq(adev, clock_num);
+	if (ret)
+		return ret;
 
-	sensor->ep_properties[0] = PROPERTY_ENTRY_U32(sensor->prop_names.bus_type,
-						      V4L2_FWNODE_BUS_TYPE_CSI2_DPHY);
-	sensor->ep_properties[1] = PROPERTY_ENTRY_U32_ARRAY_LEN(sensor->prop_names.data_lanes,
-								bridge->data_lanes,
-								sensor->lanes);
-	sensor->ep_properties[2] = PROPERTY_ENTRY_REF_ARRAY(sensor->prop_names.remote_endpoint,
-							    sensor->local_ref);
-	if (cfg->nr_link_freqs > 0)
-		sensor->ep_properties[3] =
-			PROPERTY_ENTRY_U64_ARRAY_LEN(sensor->prop_names.link_frequencies,
-						     cfg->link_freqs, cfg->nr_link_freqs);
-
-	sensor->csi2_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(sensor->prop_names.data_lanes,
-								  bridge->data_lanes,
-								  sensor->lanes);
-	sensor->csi2_properties[1] = PROPERTY_ENTRY_REF_ARRAY(sensor->prop_names.remote_endpoint,
-							      sensor->remote_ref);
-}
-
-static void atomisp_csi2_init_swnode_names(struct atomisp_csi2_sensor *sensor)
-{
-	snprintf(sensor->node_names.remote_port,
-		 sizeof(sensor->node_names.remote_port),
-		 SWNODE_GRAPH_PORT_NAME_FMT, sensor->port);
-	snprintf(sensor->node_names.port,
-		 sizeof(sensor->node_names.port),
-		 SWNODE_GRAPH_PORT_NAME_FMT, 0); /* Always port 0 */
-	snprintf(sensor->node_names.endpoint,
-		 sizeof(sensor->node_names.endpoint),
-		 SWNODE_GRAPH_ENDPOINT_NAME_FMT, 0); /* And endpoint 0 */
-}
-
-static void atomisp_csi2_init_swnode_group(struct atomisp_csi2_sensor *sensor)
-{
-	struct software_node *nodes = sensor->swnodes;
-
-	sensor->group[SWNODE_SENSOR] = &nodes[SWNODE_SENSOR];
-	sensor->group[SWNODE_SENSOR_PORT] = &nodes[SWNODE_SENSOR_PORT];
-	sensor->group[SWNODE_SENSOR_ENDPOINT] = &nodes[SWNODE_SENSOR_ENDPOINT];
-	sensor->group[SWNODE_CSI2_PORT] = &nodes[SWNODE_CSI2_PORT];
-	sensor->group[SWNODE_CSI2_ENDPOINT] = &nodes[SWNODE_CSI2_ENDPOINT];
-}
-
-static void atomisp_csi2_create_connection_swnodes(struct atomisp_csi2_bridge *bridge,
-						   struct atomisp_csi2_sensor *sensor)
-{
-	struct software_node *nodes = sensor->swnodes;
-
-	atomisp_csi2_init_swnode_names(sensor);
-
-	nodes[SWNODE_SENSOR] = NODE_SENSOR(sensor->name,
-					   sensor->dev_properties);
-	nodes[SWNODE_SENSOR_PORT] = NODE_PORT(sensor->node_names.port,
-					      &nodes[SWNODE_SENSOR]);
-	nodes[SWNODE_SENSOR_ENDPOINT] = NODE_ENDPOINT(sensor->node_names.endpoint,
-						      &nodes[SWNODE_SENSOR_PORT],
-						      sensor->ep_properties);
-	nodes[SWNODE_CSI2_PORT] = NODE_PORT(sensor->node_names.remote_port,
-					    &bridge->csi2_node);
-	nodes[SWNODE_CSI2_ENDPOINT] = NODE_ENDPOINT(sensor->node_names.endpoint,
-						    &nodes[SWNODE_CSI2_PORT],
-						    sensor->csi2_properties);
-
-	atomisp_csi2_init_swnode_group(sensor);
-}
-
-static void atomisp_csi2_unregister_sensors(struct atomisp_csi2_bridge *bridge)
-{
-	struct atomisp_csi2_sensor *sensor;
-	unsigned int i;
-
-	for (i = 0; i < bridge->n_sensors; i++) {
-		sensor = &bridge->sensors[i];
-		software_node_unregister_node_group(sensor->group);
-		acpi_dev_remove_driver_gpios(sensor->adev);
-		acpi_dev_put(sensor->adev);
+	sensor->link = atomisp_csi2_get_port(adev, clock_num);
+	if (sensor->link >= ATOMISP_CAMERA_NR_PORTS) {
+		dev_err(&adev->dev, "Invalid port: %u\n", sensor->link);
+		return -EINVAL;
 	}
-}
 
-static int atomisp_csi2_connect_sensor(const struct atomisp_csi2_sensor_config *cfg,
-				       struct atomisp_csi2_bridge *bridge,
-				       struct atomisp_device *isp)
-{
-	struct fwnode_handle *fwnode, *primary;
-	struct atomisp_csi2_sensor *sensor;
-	struct acpi_device *adev;
-	int ret, clock_num;
+	if (!acpi_match_device_ids(adev, dual_lane_sensors))
+		lanes = 2;
+	else
+		lanes = 1;
 
-	for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
-		if (!adev->status.enabled)
-			continue;
-
-		if (bridge->n_sensors >= ATOMISP_CAMERA_NR_PORTS) {
-			dev_err(isp->dev, "Exceeded available CSI2 ports\n");
-			ret = -EOVERFLOW;
-			goto err_put_adev;
-		}
-
-		sensor = &bridge->sensors[bridge->n_sensors];
-
-		/*
-		 * ACPI takes care of turning the PMC clock on and off, but on BYT
-		 * the clock defaults to 25 MHz instead of the expected 19.2 MHz.
-		 * Get the PMC-clock number from ACPI _PR0 method and set it to 19.2 MHz.
-		 * The PMC-clock number is also used to determine the default CSI port.
-		 */
-		clock_num = atomisp_csi2_get_pmc_clk_nr_from_acpi_pr0(adev);
-
-		ret = atomisp_csi2_set_pmc_clk_freq(adev, clock_num);
-		if (ret)
-			goto err_put_adev;
-
-		sensor->port = atomisp_csi2_get_port(adev, clock_num);
-		if (sensor->port >= ATOMISP_CAMERA_NR_PORTS) {
-			acpi_handle_err(adev->handle, "Invalid port: %d\n", sensor->port);
-			ret = -EINVAL;
-			goto err_put_adev;
-		}
-
-		sensor->lanes = gmin_cfg_get_int(adev, "CsiLanes", cfg->lanes);
-		if (sensor->lanes > CSI2_MAX_LANES) {
-			acpi_handle_err(adev->handle, "Invalid number of lanes: %d\n", sensor->lanes);
-			ret = -EINVAL;
-			goto err_put_adev;
-		}
-
-		ret = atomisp_csi2_add_gpio_mappings(sensor, adev);
-		if (ret)
-			goto err_put_adev;
-
-		snprintf(sensor->name, sizeof(sensor->name), "%s-%u",
-			 cfg->hid, sensor->port);
-
-		atomisp_csi2_create_fwnode_properties(sensor, bridge, cfg);
-		atomisp_csi2_create_connection_swnodes(bridge, sensor);
-
-		ret = software_node_register_node_group(sensor->group);
-		if (ret)
-			goto err_remove_mappings;
-
-		fwnode = software_node_fwnode(&sensor->swnodes[SWNODE_SENSOR]);
-		if (!fwnode) {
-			ret = -ENODEV;
-			goto err_free_swnodes;
-		}
-
-		sensor->adev = acpi_dev_get(adev);
-
-		primary = acpi_fwnode_handle(adev);
-		primary->secondary = fwnode;
-
-		bridge->n_sensors++;
+	sensor->lanes = gmin_cfg_get_int(adev, "CsiLanes", lanes);
+	if (sensor->lanes > IPU_MAX_LANES) {
+		dev_err(&adev->dev, "Invalid lane-count: %d\n", sensor->lanes);
+		return -EINVAL;
 	}
 
+	ret = atomisp_csi2_add_gpio_mappings(adev);
+	if (ret)
+		return ret;
+
+	sensor->mclkspeed = PMC_CLK_RATE_19_2MHZ;
+	sensor->rotation = 0;
+	sensor->orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
+
 	return 0;
-
-err_free_swnodes:
-	software_node_unregister_node_group(sensor->group);
-err_remove_mappings:
-	acpi_dev_remove_driver_gpios(adev);
-err_put_adev:
-	acpi_dev_put(adev);
-	return ret;
-}
-
-static int atomisp_csi2_connect_sensors(struct atomisp_csi2_bridge *bridge,
-					struct atomisp_device *isp)
-{
-	unsigned int i;
-	int ret;
-
-	for (i = 0; i < ARRAY_SIZE(supported_sensors); i++) {
-		const struct atomisp_csi2_sensor_config *cfg = &supported_sensors[i];
-
-		ret = atomisp_csi2_connect_sensor(cfg, bridge, isp);
-		if (ret)
-			goto err_unregister_sensors;
-	}
-
-	return 0;
-
-err_unregister_sensors:
-	atomisp_csi2_unregister_sensors(bridge);
-	return ret;
 }
 
 int atomisp_csi2_bridge_init(struct atomisp_device *isp)
 {
-	struct atomisp_csi2_bridge *bridge;
 	struct device *dev = isp->dev;
 	struct fwnode_handle *fwnode;
-	int i, ret;
 
 	/*
 	 * This function is intended to run only once and then leave
@@ -716,52 +525,7 @@ int atomisp_csi2_bridge_init(struct atomisp_device *isp)
 	if (fwnode && fwnode->secondary)
 		return 0;
 
-	bridge = kzalloc(sizeof(*bridge), GFP_KERNEL);
-	if (!bridge)
-		return -ENOMEM;
-
-	strscpy(bridge->csi2_node_name, "atomisp-csi2", sizeof(bridge->csi2_node_name));
-	bridge->csi2_node.name = bridge->csi2_node_name;
-
-	ret = software_node_register(&bridge->csi2_node);
-	if (ret < 0) {
-		dev_err(dev, "Failed to register the CSI2 HID node\n");
-		goto err_free_bridge;
-	}
-
-	/*
-	 * Map the lane arrangement, which is fixed for the ISP2 (meaning we
-	 * only need one, rather than one per sensor). We include it as a
-	 * member of the bridge struct rather than a global variable so
-	 * that it survives if the module is unloaded along with the rest of
-	 * the struct.
-	 */
-	for (i = 0; i < CSI2_MAX_LANES; i++)
-		bridge->data_lanes[i] = i + 1;
-
-	ret = atomisp_csi2_connect_sensors(bridge, isp);
-	if (ret || bridge->n_sensors == 0)
-		goto err_unregister_csi2;
-
-	fwnode = software_node_fwnode(&bridge->csi2_node);
-	if (!fwnode) {
-		dev_err(dev, "Error getting fwnode from csi2 software_node\n");
-		ret = -ENODEV;
-		goto err_unregister_sensors;
-	}
-
-	set_secondary_fwnode(dev, fwnode);
-
-	return 0;
-
-err_unregister_sensors:
-	atomisp_csi2_unregister_sensors(bridge);
-err_unregister_csi2:
-	software_node_unregister(&bridge->csi2_node);
-err_free_bridge:
-	kfree(bridge);
-
-	return ret;
+	return ipu_bridge_init(dev, atomisp_csi2_parse_sensor_fwnode);
 }
 
 /******* V4L2 sub-device asynchronous registration callbacks***********/
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index c43b916a006e..0d80f0893a2e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1615,3 +1615,4 @@ MODULE_AUTHOR("Wen Wang <wen.w.wang@intel.com>");
 MODULE_AUTHOR("Xiaolin Zhang <xiaolin.zhang@intel.com>");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Intel ATOM Platform ISP Driver");
+MODULE_IMPORT_NS(INTEL_IPU_BRIDGE);
-- 
2.41.0

