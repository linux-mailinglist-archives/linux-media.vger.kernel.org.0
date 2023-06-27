Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 833107402C1
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 19:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231861AbjF0R6H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 13:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231837AbjF0R6G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 13:58:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06EB530F4
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 10:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687888621;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PPfWMXD4ulM8eQHrpWdbTifaZqC0EFJ7fnAx5EfEhGc=;
        b=hzFRk7Oiv15QK9nsKLrbGhOF44QMsvGpqijFODek7xvQ9QnH7Hg6IM378F1AiBfSquB0rn
        FuELrxdjx1vFQ79JWxQ3MlblQ0DZ3flPlgKKZE3a/0hrVGh+mQgeI7yUfrrXrIznFrDyDK
        T+P4v8ZNGj03aKwKOsPXFeVRneHq3gc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-xzGVDypdMlSv07AHSi3MIA-1; Tue, 27 Jun 2023 13:56:59 -0400
X-MC-Unique: xzGVDypdMlSv07AHSi3MIA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30816185A793;
        Tue, 27 Jun 2023 17:56:59 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BC2D62014E17;
        Tue, 27 Jun 2023 17:56:57 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 09/12] media: ipu3-cio2: Move cio2_bridge_init() code into a new shared intel-cio2-bridge.ko
Date:   Tue, 27 Jun 2023 19:56:39 +0200
Message-ID: <20230627175643.114778-10-hdegoede@redhat.com>
In-Reply-To: <20230627175643.114778-1-hdegoede@redhat.com>
References: <20230627175643.114778-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move all the code implementing cio2_bridge_init() into a new shared
intel-cio2-bridge.ko, so that it can be reused by the atomisp driver
(and maybe also by the future IPU6 CSI2 driver).

Note this just moves a bunch of stuff around prefixes some symbols /
defines with intel_ / INTEL_ no functional changes.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 MAINTAINERS                                   |   9 +
 drivers/media/common/Kconfig                  |   4 +
 drivers/media/common/Makefile                 |   1 +
 .../intel-cio2-bridge.c}                      | 228 +++------
 drivers/media/pci/intel/ipu3/Kconfig          |   1 +
 drivers/media/pci/intel/ipu3/cio2-bridge.c    | 438 +++---------------
 drivers/media/pci/intel/ipu3/cio2-bridge.h    | 156 -------
 include/media/intel-cio2-bridge.h             | 104 +++++
 8 files changed, 237 insertions(+), 704 deletions(-)
 copy drivers/media/{pci/intel/ipu3/cio2-bridge.c => common/intel-cio2-bridge.c} (66%)
 delete mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.h
 create mode 100644 include/media/intel-cio2-bridge.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 2ec35c3569dd..89ea1266ef4b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10325,6 +10325,15 @@ S:	Supported
 T:	git git://git.code.sf.net/p/intel-sas/isci
 F:	drivers/scsi/isci/
 
+INTEL CIO2 ACPI SENSOR BRIDGE
+M:	Dan Scally <djrscally@gmail.com>
+M:	Hans de Goede <hansg@kernel.org>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	drivers/media/common/intel-cio2-bridge.c
+F:	include/media/intel-cio2-bridge.h
+
 INTEL CPU family model numbers
 M:	Tony Luck <tony.luck@intel.com>
 M:	x86@kernel.org
diff --git a/drivers/media/common/Kconfig b/drivers/media/common/Kconfig
index adcb6655385a..e7a9d1b1630c 100644
--- a/drivers/media/common/Kconfig
+++ b/drivers/media/common/Kconfig
@@ -10,6 +10,10 @@ config CYPRESS_FIRMWARE
 	tristate
 	depends on USB
 
+config INTEL_CIO2_BRIDGE
+	tristate
+	depends on ACPI && I2C
+
 config TTPCI_EEPROM
         tristate
         depends on I2C
diff --git a/drivers/media/common/Makefile b/drivers/media/common/Makefile
index c5ab905e7c20..728aaf90b6ec 100644
--- a/drivers/media/common/Makefile
+++ b/drivers/media/common/Makefile
@@ -4,6 +4,7 @@ obj-y += b2c2/ saa7146/ siano/ v4l2-tpg/ videobuf2/
 # Please keep it alphabetically sorted by Kconfig name
 # (e. g. LC_ALL=C sort Makefile)
 obj-$(CONFIG_CYPRESS_FIRMWARE) += cypress_firmware.o
+obj-$(CONFIG_INTEL_CIO2_BRIDGE) += intel-cio2-bridge.o
 obj-$(CONFIG_TTPCI_EEPROM) += ttpci-eeprom.o
 obj-$(CONFIG_UVC_COMMON) += uvc.o
 obj-$(CONFIG_VIDEO_CX2341X) += cx2341x.o
diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/common/intel-cio2-bridge.c
similarity index 66%
copy from drivers/media/pci/intel/ipu3/cio2-bridge.c
copy to drivers/media/common/intel-cio2-bridge.c
index 9da0f003af7b..2f4256f9152c 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/common/intel-cio2-bridge.c
@@ -1,45 +1,40 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Author: Dan Scally <djrscally@gmail.com> */
+/* Author: Hans de Goede <hansg@kernel.org> */
 
 #include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
 #include <linux/property.h>
+
+#include <media/intel-cio2-bridge.h>
 #include <media/v4l2-fwnode.h>
 
-#include "cio2-bridge.h"
+#define NODE_SENSOR(_HID, _PROPS)		\
+	(const struct software_node) {		\
+		.name = _HID,			\
+		.properties = _PROPS,		\
+	}
 
-/*
- * Extend this array with ACPI Hardware IDs of devices known to be working
- * plus the number of link-frequencies expected by their drivers, along with
- * the frequency values in hertz. This is somewhat opportunistic way of adding
- * support for this for now in the hopes of a better source for the information
- * (possibly some encoded value in the SSDB buffer that we're unaware of)
- * becoming apparent in the future.
- *
- * Do not add an entry for a sensor that is not actually supported.
- */
-static const struct cio2_sensor_config cio2_supported_sensors[] = {
-	/* Omnivision OV5693 */
-	CIO2_SENSOR_CONFIG("INT33BE", 1, 419200000),
-	/* Omnivision OV8865 */
-	CIO2_SENSOR_CONFIG("INT347A", 1, 360000000),
-	/* Omnivision OV7251 */
-	CIO2_SENSOR_CONFIG("INT347E", 1, 319200000),
-	/* Omnivision OV2680 */
-	CIO2_SENSOR_CONFIG("OVTI2680", 0),
-	/* Omnivision ov8856 */
-	CIO2_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
-	/* Omnivision ov2740 */
-	CIO2_SENSOR_CONFIG("INT3474", 1, 360000000),
-	/* Hynix hi556 */
-	CIO2_SENSOR_CONFIG("INT3537", 1, 437000000),
-	/* Omnivision ov13b10 */
-	CIO2_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
-	{}
-};
+#define NODE_PORT(_PORT, _SENSOR_NODE)		\
+	(const struct software_node) {		\
+		.name = _PORT,			\
+		.parent = _SENSOR_NODE,		\
+	}
 
-static const struct cio2_property_names prop_names = {
+#define NODE_ENDPOINT(_EP, _PORT, _PROPS)	\
+	(const struct software_node) {		\
+		.name = _EP,			\
+		.parent = _PORT,		\
+		.properties = _PROPS,		\
+	}
+
+#define NODE_VCM(_TYPE)				\
+	(const struct software_node) {		\
+		.name = _TYPE,			\
+	}
+
+static const struct intel_cio2_property_names prop_names = {
 	.clock_frequency = "clock-frequency",
 	.rotation = "rotation",
 	.orientation = "orientation",
@@ -49,73 +44,8 @@ static const struct cio2_property_names prop_names = {
 	.link_frequencies = "link-frequencies",
 };
 
-static const char * const cio2_vcm_types[] = {
-	"ad5823",
-	"dw9714",
-	"ad5816",
-	"dw9719",
-	"dw9718",
-	"dw9806b",
-	"wv517s",
-	"lc898122xa",
-	"lc898212axb",
-};
-
-static int cio2_bridge_read_acpi_buffer(struct acpi_device *adev, char *id,
-					void *data, u32 size)
-{
-	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
-	union acpi_object *obj;
-	acpi_status status;
-	int ret = 0;
-
-	status = acpi_evaluate_object(adev->handle, id, NULL, &buffer);
-	if (ACPI_FAILURE(status))
-		return -ENODEV;
-
-	obj = buffer.pointer;
-	if (!obj) {
-		dev_err(&adev->dev, "Couldn't locate ACPI buffer\n");
-		return -ENODEV;
-	}
-
-	if (obj->type != ACPI_TYPE_BUFFER) {
-		dev_err(&adev->dev, "Not an ACPI buffer\n");
-		ret = -ENODEV;
-		goto out_free_buff;
-	}
-
-	if (obj->buffer.length > size) {
-		dev_err(&adev->dev, "Given buffer is too small\n");
-		ret = -EINVAL;
-		goto out_free_buff;
-	}
-
-	memcpy(data, obj->buffer.pointer, obj->buffer.length);
-
-out_free_buff:
-	kfree(buffer.pointer);
-	return ret;
-}
-
-static u32 cio2_bridge_parse_rotation(struct acpi_device *adev,
-				      struct cio2_sensor_ssdb *ssdb)
-{
-	switch (ssdb->degree) {
-	case CIO2_SENSOR_ROTATION_NORMAL:
-		return 0;
-	case CIO2_SENSOR_ROTATION_INVERTED:
-		return 180;
-	default:
-		dev_warn(&adev->dev,
-			 "Unknown rotation %d. Assume 0 degree rotation\n",
-			 ssdb->degree);
-		return 0;
-	}
-}
-
-static enum v4l2_fwnode_orientation
-cio2_bridge_get_orientation(struct acpi_device *adev)
+enum v4l2_fwnode_orientation
+intel_cio2_bridge_get_orientation(struct acpi_device *adev)
 {
 	enum v4l2_fwnode_orientation orientation;
 	struct acpi_pld_info *pld;
@@ -149,44 +79,12 @@ cio2_bridge_get_orientation(struct acpi_device *adev)
 	ACPI_FREE(pld);
 	return orientation;
 }
-
-static int cio2_bridge_parse_sensor_fwnode(struct acpi_device *adev,
-					   struct cio2_sensor *sensor,
-					   const struct cio2_sensor_config *cfg)
-{
-	struct cio2_sensor_ssdb ssdb = {};
-	int ret;
-
-	ret = cio2_bridge_read_acpi_buffer(adev, "SSDB", &ssdb, sizeof(ssdb));
-	if (ret)
-		return ret;
-
-	if (ssdb.vcmtype > ARRAY_SIZE(cio2_vcm_types)) {
-		dev_warn(&adev->dev, "Unknown VCM type %d\n", ssdb.vcmtype);
-		ssdb.vcmtype = 0;
-	}
-
-	if (ssdb.lanes > CIO2_MAX_LANES) {
-		dev_err(&adev->dev, "Number of lanes in SSDB is invalid\n");
-		return -EINVAL;
-	}
-
-	sensor->link = ssdb.link;
-	sensor->lanes = ssdb.lanes;
-	sensor->mclkspeed = ssdb.mclkspeed;
-	sensor->rotation = cio2_bridge_parse_rotation(adev, &ssdb);
-	sensor->orientation = cio2_bridge_get_orientation(adev);
-
-	if (ssdb.vcmtype)
-		sensor->vcm_type = cio2_vcm_types[ssdb.vcmtype - 1];
-
-	return 0;
-}
+EXPORT_SYMBOL(intel_cio2_bridge_get_orientation);
 
 static void cio2_bridge_create_fwnode_properties(
-	struct cio2_sensor *sensor,
-	struct cio2_bridge *bridge,
-	const struct cio2_sensor_config *cfg)
+	struct intel_cio2_sensor *sensor,
+	struct intel_cio2_bridge *bridge,
+	const struct intel_cio2_sensor_config *cfg)
 {
 	sensor->prop_names = prop_names;
 
@@ -233,7 +131,7 @@ static void cio2_bridge_create_fwnode_properties(
 					sensor->remote_ref);
 }
 
-static void cio2_bridge_init_swnode_names(struct cio2_sensor *sensor)
+static void cio2_bridge_init_swnode_names(struct intel_cio2_sensor *sensor)
 {
 	snprintf(sensor->node_names.remote_port,
 		 sizeof(sensor->node_names.remote_port),
@@ -251,7 +149,7 @@ static void cio2_bridge_init_swnode_names(struct cio2_sensor *sensor)
 	}
 }
 
-static void cio2_bridge_init_swnode_group(struct cio2_sensor *sensor)
+static void cio2_bridge_init_swnode_group(struct intel_cio2_sensor *sensor)
 {
 	struct software_node *nodes = sensor->swnodes;
 
@@ -264,8 +162,9 @@ static void cio2_bridge_init_swnode_group(struct cio2_sensor *sensor)
 		sensor->group[SWNODE_VCM] =  &nodes[SWNODE_VCM];
 }
 
-static void cio2_bridge_create_connection_swnodes(struct cio2_bridge *bridge,
-						  struct cio2_sensor *sensor)
+static void cio2_bridge_create_connection_swnodes(
+	struct intel_cio2_bridge *bridge,
+	struct intel_cio2_sensor *sensor)
 {
 	struct software_node *nodes = sensor->swnodes;
 
@@ -290,7 +189,8 @@ static void cio2_bridge_create_connection_swnodes(struct cio2_bridge *bridge,
 	cio2_bridge_init_swnode_group(sensor);
 }
 
-static void cio2_bridge_instantiate_vcm_i2c_client(struct cio2_sensor *sensor)
+static void cio2_bridge_instantiate_vcm_i2c_client(
+	struct intel_cio2_sensor *sensor)
 {
 	struct i2c_board_info board_info = { };
 	char name[16];
@@ -313,9 +213,9 @@ static void cio2_bridge_instantiate_vcm_i2c_client(struct cio2_sensor *sensor)
 	}
 }
 
-static void cio2_bridge_unregister_sensors(struct cio2_bridge *bridge)
+static void cio2_bridge_unregister_sensors(struct intel_cio2_bridge *bridge)
 {
-	struct cio2_sensor *sensor;
+	struct intel_cio2_sensor *sensor;
 	unsigned int i;
 
 	for (i = 0; i < bridge->n_sensors; i++) {
@@ -326,11 +226,12 @@ static void cio2_bridge_unregister_sensors(struct cio2_bridge *bridge)
 	}
 }
 
-static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
-				      struct cio2_bridge *bridge)
+static int cio2_bridge_connect_sensor(
+	const struct intel_cio2_sensor_config *cfg,
+	struct intel_cio2_bridge *bridge)
 {
 	struct fwnode_handle *fwnode, *primary;
-	struct cio2_sensor *sensor;
+	struct intel_cio2_sensor *sensor;
 	struct acpi_device *adev;
 	int ret;
 
@@ -338,7 +239,7 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 		if (!adev->status.enabled)
 			continue;
 
-		if (bridge->n_sensors >= CIO2_NUM_PORTS) {
+		if (bridge->n_sensors >= INTEL_CIO2_NUM_PORTS) {
 			acpi_dev_put(adev);
 			dev_err(bridge->dev, "Exceeded available CIO2 ports\n");
 			return -EINVAL;
@@ -389,13 +290,13 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 	return ret;
 }
 
-static int cio2_bridge_connect_sensors(struct cio2_bridge *bridge)
+static int cio2_bridge_connect_sensors(struct intel_cio2_bridge *bridge)
 {
 	unsigned int i;
 	int ret;
 
 	for (i = 0; bridge->supported_sensors[i].hid; i++) {
-		const struct cio2_sensor_config *cfg =
+		const struct intel_cio2_sensor_config *cfg =
 			&bridge->supported_sensors[i];
 
 		ret = cio2_bridge_connect_sensor(cfg, bridge);
@@ -423,14 +324,15 @@ static int cio2_bridge_connect_sensors(struct cio2_bridge *bridge)
  * for the sensors.
  */
 static int cio2_bridge_sensors_are_ready(
-	const struct cio2_sensor_config *supported_sensors)
+	const struct intel_cio2_sensor_config *supported_sensors)
 {
 	struct acpi_device *adev;
 	bool ready = true;
 	unsigned int i;
 
 	for (i = 0; supported_sensors[i].hid; i++) {
-		const struct cio2_sensor_config *cfg = &supported_sensors[i];
+		const struct intel_cio2_sensor_config *cfg =
+			&supported_sensors[i];
 
 		for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
 			if (!adev->status.enabled)
@@ -444,15 +346,15 @@ static int cio2_bridge_sensors_are_ready(
 	return ready;
 }
 
-static int __cio2_bridge_init(
+int intel_cio2_bridge_init(
 	struct device *dev,
 	int (*parse_sensor_fwnode)(struct acpi_device *adev,
-				   struct cio2_sensor *sensor,
-				   const struct cio2_sensor_config *cfg),
-	const struct cio2_sensor_config *supported_sensors)
+				   struct intel_cio2_sensor *sensor,
+				   const struct intel_cio2_sensor_config *cfg),
+	const struct intel_cio2_sensor_config *supported_sensors)
 {
 	struct fwnode_handle *fwnode;
-	struct cio2_bridge *bridge;
+	struct intel_cio2_bridge *bridge;
 	unsigned int i;
 	int ret;
 
@@ -463,7 +365,7 @@ static int __cio2_bridge_init(
 	if (!bridge)
 		return -ENOMEM;
 
-	strscpy(bridge->cio2_node_name, CIO2_HID,
+	strscpy(bridge->cio2_node_name, INTEL_CIO2_HID,
 		sizeof(bridge->cio2_node_name));
 	bridge->cio2_hid_node.name = bridge->cio2_node_name;
 	bridge->dev = dev;
@@ -478,12 +380,12 @@ static int __cio2_bridge_init(
 
 	/*
 	 * Map the lane arrangement, which is fixed for the IPU3 (meaning we
-	 * only need one, rather than one per sensor). We include it as a
-	 * member of the struct cio2_bridge rather than a global variable so
+	 * only need one, rather than one per sensor). We include it as a member
+	 * of the struct intel_cio2_bridge rather than a global variable so
 	 * that it survives if the module is unloaded along with the rest of
 	 * the struct.
 	 */
-	for (i = 0; i < CIO2_MAX_LANES; i++)
+	for (i = 0; i < INTEL_CIO2_MAX_LANES; i++)
 		bridge->data_lanes[i] = i + 1;
 
 	ret = cio2_bridge_connect_sensors(bridge);
@@ -512,9 +414,9 @@ static int __cio2_bridge_init(
 
 	return ret;
 }
+EXPORT_SYMBOL(intel_cio2_bridge_init);
 
-int cio2_bridge_init(struct device *dev)
-{
-	return __cio2_bridge_init(dev, cio2_bridge_parse_sensor_fwnode,
-				  cio2_supported_sensors);
-}
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Dan Scally <djrscally@gmail.com>");
+MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
+MODULE_DESCRIPTION("Intel CIO2 ACPI Sensors Bridge");
diff --git a/drivers/media/pci/intel/ipu3/Kconfig b/drivers/media/pci/intel/ipu3/Kconfig
index 65b0c1598fbf..3c32e4d536ad 100644
--- a/drivers/media/pci/intel/ipu3/Kconfig
+++ b/drivers/media/pci/intel/ipu3/Kconfig
@@ -8,6 +8,7 @@ config VIDEO_IPU3_CIO2
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	select VIDEOBUF2_DMA_SG
+	select INTEL_CIO2_BRIDGE if CIO2_BRIDGE
 
 	help
 	  This is the Intel IPU3 CIO2 CSI-2 receiver unit, found in Intel
diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index 9da0f003af7b..f833637fe938 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -5,9 +5,52 @@
 #include <linux/device.h>
 #include <linux/i2c.h>
 #include <linux/property.h>
+
+#include <media/intel-cio2-bridge.h>
 #include <media/v4l2-fwnode.h>
 
-#include "cio2-bridge.h"
+#include "ipu3-cio2.h"
+
+/* Data representation as it is in ACPI SSDB buffer */
+struct cio2_sensor_ssdb {
+	u8 version;
+	u8 sku;
+	u8 guid_csi2[16];
+	u8 devfunction;
+	u8 bus;
+	u32 dphylinkenfuses;
+	u32 clockdiv;
+	u8 link;
+	u8 lanes;
+	u32 csiparams[10];
+	u32 maxlanespeed;
+	u8 sensorcalibfileidx;
+	u8 sensorcalibfileidxInMBZ[3];
+	u8 romtype;
+	u8 vcmtype;
+	u8 platforminfo;
+	u8 platformsubinfo;
+	u8 flash;
+	u8 privacyled;
+	u8 degree;
+	u8 mipilinkdefined;
+	u32 mclkspeed;
+	u8 controllogicid;
+	u8 reserved1[3];
+	u8 mclkport;
+	u8 reserved2[13];
+} __packed;
+
+/* Values are educated guesses as we don't have a spec */
+#define CIO2_SENSOR_ROTATION_NORMAL		0
+#define CIO2_SENSOR_ROTATION_INVERTED		1
+
+#define CIO2_SENSOR_CONFIG(_HID, _NR, ...)		\
+	(const struct intel_cio2_sensor_config) {	\
+		.hid = _HID,				\
+		.nr_link_freqs = _NR,			\
+		.link_freqs = { __VA_ARGS__ }		\
+	}
 
 /*
  * Extend this array with ACPI Hardware IDs of devices known to be working
@@ -19,7 +62,7 @@
  *
  * Do not add an entry for a sensor that is not actually supported.
  */
-static const struct cio2_sensor_config cio2_supported_sensors[] = {
+static const struct intel_cio2_sensor_config cio2_supported_sensors[] = {
 	/* Omnivision OV5693 */
 	CIO2_SENSOR_CONFIG("INT33BE", 1, 419200000),
 	/* Omnivision OV8865 */
@@ -39,16 +82,6 @@ static const struct cio2_sensor_config cio2_supported_sensors[] = {
 	{}
 };
 
-static const struct cio2_property_names prop_names = {
-	.clock_frequency = "clock-frequency",
-	.rotation = "rotation",
-	.orientation = "orientation",
-	.bus_type = "bus-type",
-	.data_lanes = "data-lanes",
-	.remote_endpoint = "remote-endpoint",
-	.link_frequencies = "link-frequencies",
-};
-
 static const char * const cio2_vcm_types[] = {
 	"ad5823",
 	"dw9714",
@@ -114,45 +147,10 @@ static u32 cio2_bridge_parse_rotation(struct acpi_device *adev,
 	}
 }
 
-static enum v4l2_fwnode_orientation
-cio2_bridge_get_orientation(struct acpi_device *adev)
-{
-	enum v4l2_fwnode_orientation orientation;
-	struct acpi_pld_info *pld;
-	acpi_status status;
-
-	status = acpi_get_physical_device_location(adev->handle, &pld);
-	if (ACPI_FAILURE(status)) {
-		dev_warn(&adev->dev, "_PLD call failed using unknown orientation\n");
-		return V4L2_FWNODE_ORIENTATION_EXTERNAL;
-	}
-
-	switch (pld->panel) {
-	case ACPI_PLD_PANEL_FRONT:
-		orientation = V4L2_FWNODE_ORIENTATION_FRONT;
-		break;
-	case ACPI_PLD_PANEL_BACK:
-		orientation = V4L2_FWNODE_ORIENTATION_BACK;
-		break;
-	case ACPI_PLD_PANEL_TOP:
-	case ACPI_PLD_PANEL_LEFT:
-	case ACPI_PLD_PANEL_RIGHT:
-	case ACPI_PLD_PANEL_UNKNOWN:
-		orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
-		break;
-	default:
-		dev_warn(&adev->dev, "Unknown _PLD panel val %d\n", pld->panel);
-		orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
-		break;
-	}
-
-	ACPI_FREE(pld);
-	return orientation;
-}
-
-static int cio2_bridge_parse_sensor_fwnode(struct acpi_device *adev,
-					   struct cio2_sensor *sensor,
-					   const struct cio2_sensor_config *cfg)
+static int cio2_bridge_parse_sensor_fwnode(
+	struct acpi_device *adev,
+	struct intel_cio2_sensor *sensor,
+	const struct intel_cio2_sensor_config *cfg)
 {
 	struct cio2_sensor_ssdb ssdb = {};
 	int ret;
@@ -166,7 +164,7 @@ static int cio2_bridge_parse_sensor_fwnode(struct acpi_device *adev,
 		ssdb.vcmtype = 0;
 	}
 
-	if (ssdb.lanes > CIO2_MAX_LANES) {
+	if (ssdb.lanes > INTEL_CIO2_MAX_LANES) {
 		dev_err(&adev->dev, "Number of lanes in SSDB is invalid\n");
 		return -EINVAL;
 	}
@@ -175,7 +173,7 @@ static int cio2_bridge_parse_sensor_fwnode(struct acpi_device *adev,
 	sensor->lanes = ssdb.lanes;
 	sensor->mclkspeed = ssdb.mclkspeed;
 	sensor->rotation = cio2_bridge_parse_rotation(adev, &ssdb);
-	sensor->orientation = cio2_bridge_get_orientation(adev);
+	sensor->orientation = intel_cio2_bridge_get_orientation(adev);
 
 	if (ssdb.vcmtype)
 		sensor->vcm_type = cio2_vcm_types[ssdb.vcmtype - 1];
@@ -183,338 +181,8 @@ static int cio2_bridge_parse_sensor_fwnode(struct acpi_device *adev,
 	return 0;
 }
 
-static void cio2_bridge_create_fwnode_properties(
-	struct cio2_sensor *sensor,
-	struct cio2_bridge *bridge,
-	const struct cio2_sensor_config *cfg)
-{
-	sensor->prop_names = prop_names;
-
-	sensor->local_ref[0] = SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_CIO2_ENDPOINT]);
-	sensor->remote_ref[0] = SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_SENSOR_ENDPOINT]);
-
-	sensor->dev_properties[0] = PROPERTY_ENTRY_U32(
-					sensor->prop_names.clock_frequency,
-					sensor->mclkspeed);
-	sensor->dev_properties[1] = PROPERTY_ENTRY_U32(
-					sensor->prop_names.rotation,
-					sensor->rotation);
-	sensor->dev_properties[2] = PROPERTY_ENTRY_U32(
-					sensor->prop_names.orientation,
-					sensor->orientation);
-	if (sensor->vcm_type) {
-		sensor->vcm_ref[0] =
-			SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_VCM]);
-		sensor->dev_properties[3] =
-			PROPERTY_ENTRY_REF_ARRAY("lens-focus", sensor->vcm_ref);
-	}
-
-	sensor->ep_properties[0] = PROPERTY_ENTRY_U32(
-					sensor->prop_names.bus_type,
-					V4L2_FWNODE_BUS_TYPE_CSI2_DPHY);
-	sensor->ep_properties[1] = PROPERTY_ENTRY_U32_ARRAY_LEN(
-					sensor->prop_names.data_lanes,
-					bridge->data_lanes, sensor->lanes);
-	sensor->ep_properties[2] = PROPERTY_ENTRY_REF_ARRAY(
-					sensor->prop_names.remote_endpoint,
-					sensor->local_ref);
-
-	if (cfg->nr_link_freqs > 0)
-		sensor->ep_properties[3] = PROPERTY_ENTRY_U64_ARRAY_LEN(
-			sensor->prop_names.link_frequencies,
-			cfg->link_freqs,
-			cfg->nr_link_freqs);
-
-	sensor->cio2_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
-					sensor->prop_names.data_lanes,
-					bridge->data_lanes, sensor->lanes);
-	sensor->cio2_properties[1] = PROPERTY_ENTRY_REF_ARRAY(
-					sensor->prop_names.remote_endpoint,
-					sensor->remote_ref);
-}
-
-static void cio2_bridge_init_swnode_names(struct cio2_sensor *sensor)
-{
-	snprintf(sensor->node_names.remote_port,
-		 sizeof(sensor->node_names.remote_port),
-		 SWNODE_GRAPH_PORT_NAME_FMT, sensor->link);
-	snprintf(sensor->node_names.port,
-		 sizeof(sensor->node_names.port),
-		 SWNODE_GRAPH_PORT_NAME_FMT, 0); /* Always port 0 */
-	snprintf(sensor->node_names.endpoint,
-		 sizeof(sensor->node_names.endpoint),
-		 SWNODE_GRAPH_ENDPOINT_NAME_FMT, 0); /* And endpoint 0 */
-	if (sensor->vcm_type) {
-		/* append link to distinguish nodes with same model VCM */
-		snprintf(sensor->node_names.vcm, sizeof(sensor->node_names.vcm),
-			 "%s-%u", sensor->vcm_type, sensor->link);
-	}
-}
-
-static void cio2_bridge_init_swnode_group(struct cio2_sensor *sensor)
-{
-	struct software_node *nodes = sensor->swnodes;
-
-	sensor->group[SWNODE_SENSOR_HID] = &nodes[SWNODE_SENSOR_HID];
-	sensor->group[SWNODE_SENSOR_PORT] = &nodes[SWNODE_SENSOR_PORT];
-	sensor->group[SWNODE_SENSOR_ENDPOINT] = &nodes[SWNODE_SENSOR_ENDPOINT];
-	sensor->group[SWNODE_CIO2_PORT] = &nodes[SWNODE_CIO2_PORT];
-	sensor->group[SWNODE_CIO2_ENDPOINT] = &nodes[SWNODE_CIO2_ENDPOINT];
-	if (sensor->vcm_type)
-		sensor->group[SWNODE_VCM] =  &nodes[SWNODE_VCM];
-}
-
-static void cio2_bridge_create_connection_swnodes(struct cio2_bridge *bridge,
-						  struct cio2_sensor *sensor)
-{
-	struct software_node *nodes = sensor->swnodes;
-
-	cio2_bridge_init_swnode_names(sensor);
-
-	nodes[SWNODE_SENSOR_HID] = NODE_SENSOR(sensor->name,
-					       sensor->dev_properties);
-	nodes[SWNODE_SENSOR_PORT] = NODE_PORT(sensor->node_names.port,
-					      &nodes[SWNODE_SENSOR_HID]);
-	nodes[SWNODE_SENSOR_ENDPOINT] = NODE_ENDPOINT(
-						sensor->node_names.endpoint,
-						&nodes[SWNODE_SENSOR_PORT],
-						sensor->ep_properties);
-	nodes[SWNODE_CIO2_PORT] = NODE_PORT(sensor->node_names.remote_port,
-					    &bridge->cio2_hid_node);
-	nodes[SWNODE_CIO2_ENDPOINT] = NODE_ENDPOINT(
-						sensor->node_names.endpoint,
-						&nodes[SWNODE_CIO2_PORT],
-						sensor->cio2_properties);
-	nodes[SWNODE_VCM] = NODE_VCM(sensor->node_names.vcm);
-
-	cio2_bridge_init_swnode_group(sensor);
-}
-
-static void cio2_bridge_instantiate_vcm_i2c_client(struct cio2_sensor *sensor)
-{
-	struct i2c_board_info board_info = { };
-	char name[16];
-
-	if (!sensor->vcm_type)
-		return;
-
-	snprintf(name, sizeof(name), "%s-VCM", acpi_dev_name(sensor->adev));
-	board_info.dev_name = name;
-	strscpy(board_info.type, sensor->vcm_type, ARRAY_SIZE(board_info.type));
-	board_info.swnode = &sensor->swnodes[SWNODE_VCM];
-
-	sensor->vcm_i2c_client =
-		i2c_acpi_new_device_by_fwnode(acpi_fwnode_handle(sensor->adev),
-					      1, &board_info);
-	if (IS_ERR(sensor->vcm_i2c_client)) {
-		dev_warn(&sensor->adev->dev, "Error instantiation VCM i2c-client: %ld\n",
-			 PTR_ERR(sensor->vcm_i2c_client));
-		sensor->vcm_i2c_client = NULL;
-	}
-}
-
-static void cio2_bridge_unregister_sensors(struct cio2_bridge *bridge)
-{
-	struct cio2_sensor *sensor;
-	unsigned int i;
-
-	for (i = 0; i < bridge->n_sensors; i++) {
-		sensor = &bridge->sensors[i];
-		software_node_unregister_node_group(sensor->group);
-		acpi_dev_put(sensor->adev);
-		i2c_unregister_device(sensor->vcm_i2c_client);
-	}
-}
-
-static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
-				      struct cio2_bridge *bridge)
-{
-	struct fwnode_handle *fwnode, *primary;
-	struct cio2_sensor *sensor;
-	struct acpi_device *adev;
-	int ret;
-
-	for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
-		if (!adev->status.enabled)
-			continue;
-
-		if (bridge->n_sensors >= CIO2_NUM_PORTS) {
-			acpi_dev_put(adev);
-			dev_err(bridge->dev, "Exceeded available CIO2 ports\n");
-			return -EINVAL;
-		}
-
-		sensor = &bridge->sensors[bridge->n_sensors];
-
-		ret = bridge->parse_sensor_fwnode(adev, sensor, cfg);
-		if (ret)
-			goto err_put_adev;
-
-		snprintf(sensor->name, sizeof(sensor->name), "%s-%u",
-			 cfg->hid, sensor->link);
-
-		cio2_bridge_create_fwnode_properties(sensor, bridge, cfg);
-		cio2_bridge_create_connection_swnodes(bridge, sensor);
-
-		ret = software_node_register_node_group(sensor->group);
-		if (ret)
-			goto err_put_adev;
-
-		fwnode = software_node_fwnode(&sensor->swnodes[
-						      SWNODE_SENSOR_HID]);
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
-		cio2_bridge_instantiate_vcm_i2c_client(sensor);
-
-		dev_info(bridge->dev, "Found supported sensor %s\n",
-			 acpi_dev_name(adev));
-
-		bridge->n_sensors++;
-	}
-
-	return 0;
-
-err_free_swnodes:
-	software_node_unregister_node_group(sensor->group);
-err_put_adev:
-	acpi_dev_put(adev);
-	return ret;
-}
-
-static int cio2_bridge_connect_sensors(struct cio2_bridge *bridge)
-{
-	unsigned int i;
-	int ret;
-
-	for (i = 0; bridge->supported_sensors[i].hid; i++) {
-		const struct cio2_sensor_config *cfg =
-			&bridge->supported_sensors[i];
-
-		ret = cio2_bridge_connect_sensor(cfg, bridge);
-		if (ret)
-			goto err_unregister_sensors;
-	}
-
-	return 0;
-
-err_unregister_sensors:
-	cio2_bridge_unregister_sensors(bridge);
-	return ret;
-}
-
-/*
- * The VCM cannot be probed until the PMIC is completely setup. We cannot rely
- * on -EPROBE_DEFER for this, since the consumer<->supplier relations between
- * the VCM and regulators/clks are not described in ACPI, instead they are
- * passed as board-data to the PMIC drivers. Since -PROBE_DEFER does not work
- * for the clks/regulators the VCM i2c-clients must not be instantiated until
- * the PMIC is fully setup.
- *
- * The sensor/VCM ACPI device has an ACPI _DEP on the PMIC, check this using the
- * acpi_dev_ready_for_enumeration() helper, like the i2c-core-acpi code does
- * for the sensors.
- */
-static int cio2_bridge_sensors_are_ready(
-	const struct cio2_sensor_config *supported_sensors)
-{
-	struct acpi_device *adev;
-	bool ready = true;
-	unsigned int i;
-
-	for (i = 0; supported_sensors[i].hid; i++) {
-		const struct cio2_sensor_config *cfg = &supported_sensors[i];
-
-		for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
-			if (!adev->status.enabled)
-				continue;
-
-			if (!acpi_dev_ready_for_enumeration(adev))
-				ready = false;
-		}
-	}
-
-	return ready;
-}
-
-static int __cio2_bridge_init(
-	struct device *dev,
-	int (*parse_sensor_fwnode)(struct acpi_device *adev,
-				   struct cio2_sensor *sensor,
-				   const struct cio2_sensor_config *cfg),
-	const struct cio2_sensor_config *supported_sensors)
-{
-	struct fwnode_handle *fwnode;
-	struct cio2_bridge *bridge;
-	unsigned int i;
-	int ret;
-
-	if (!cio2_bridge_sensors_are_ready(supported_sensors))
-		return -EPROBE_DEFER;
-
-	bridge = kzalloc(sizeof(*bridge), GFP_KERNEL);
-	if (!bridge)
-		return -ENOMEM;
-
-	strscpy(bridge->cio2_node_name, CIO2_HID,
-		sizeof(bridge->cio2_node_name));
-	bridge->cio2_hid_node.name = bridge->cio2_node_name;
-	bridge->dev = dev;
-	bridge->parse_sensor_fwnode = parse_sensor_fwnode;
-	bridge->supported_sensors = supported_sensors;
-
-	ret = software_node_register(&bridge->cio2_hid_node);
-	if (ret < 0) {
-		dev_err(dev, "Failed to register the CIO2 HID node\n");
-		goto err_free_bridge;
-	}
-
-	/*
-	 * Map the lane arrangement, which is fixed for the IPU3 (meaning we
-	 * only need one, rather than one per sensor). We include it as a
-	 * member of the struct cio2_bridge rather than a global variable so
-	 * that it survives if the module is unloaded along with the rest of
-	 * the struct.
-	 */
-	for (i = 0; i < CIO2_MAX_LANES; i++)
-		bridge->data_lanes[i] = i + 1;
-
-	ret = cio2_bridge_connect_sensors(bridge);
-	if (ret || bridge->n_sensors == 0)
-		goto err_unregister_cio2;
-
-	dev_info(dev, "Connected %d cameras\n", bridge->n_sensors);
-
-	fwnode = software_node_fwnode(&bridge->cio2_hid_node);
-	if (!fwnode) {
-		dev_err(dev, "Error getting fwnode from cio2 software_node\n");
-		ret = -ENODEV;
-		goto err_unregister_sensors;
-	}
-
-	set_secondary_fwnode(dev, fwnode);
-
-	return 0;
-
-err_unregister_sensors:
-	cio2_bridge_unregister_sensors(bridge);
-err_unregister_cio2:
-	software_node_unregister(&bridge->cio2_hid_node);
-err_free_bridge:
-	kfree(bridge);
-
-	return ret;
-}
-
 int cio2_bridge_init(struct device *dev)
 {
-	return __cio2_bridge_init(dev, cio2_bridge_parse_sensor_fwnode,
-				  cio2_supported_sensors);
+	return intel_cio2_bridge_init(dev, cio2_bridge_parse_sensor_fwnode,
+				      cio2_supported_sensors);
 }
diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.h b/drivers/media/pci/intel/ipu3/cio2-bridge.h
deleted file mode 100644
index e646cb17ab20..000000000000
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.h
+++ /dev/null
@@ -1,156 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* Author: Dan Scally <djrscally@gmail.com> */
-#ifndef __CIO2_BRIDGE_H
-#define __CIO2_BRIDGE_H
-
-#include <linux/property.h>
-#include <linux/types.h>
-
-#include "ipu3-cio2.h"
-
-struct i2c_client;
-
-#define CIO2_HID				"INT343E"
-#define CIO2_MAX_LANES				4
-#define MAX_NUM_LINK_FREQS			3
-
-/* Values are educated guesses as we don't have a spec */
-#define CIO2_SENSOR_ROTATION_NORMAL		0
-#define CIO2_SENSOR_ROTATION_INVERTED		1
-
-#define CIO2_SENSOR_CONFIG(_HID, _NR, ...)	\
-	(const struct cio2_sensor_config) {	\
-		.hid = _HID,			\
-		.nr_link_freqs = _NR,		\
-		.link_freqs = { __VA_ARGS__ }	\
-	}
-
-#define NODE_SENSOR(_HID, _PROPS)		\
-	(const struct software_node) {		\
-		.name = _HID,			\
-		.properties = _PROPS,		\
-	}
-
-#define NODE_PORT(_PORT, _SENSOR_NODE)		\
-	(const struct software_node) {		\
-		.name = _PORT,			\
-		.parent = _SENSOR_NODE,		\
-	}
-
-#define NODE_ENDPOINT(_EP, _PORT, _PROPS)	\
-	(const struct software_node) {		\
-		.name = _EP,			\
-		.parent = _PORT,		\
-		.properties = _PROPS,		\
-	}
-
-#define NODE_VCM(_TYPE)				\
-	(const struct software_node) {		\
-		.name = _TYPE,			\
-	}
-
-enum cio2_sensor_swnodes {
-	SWNODE_SENSOR_HID,
-	SWNODE_SENSOR_PORT,
-	SWNODE_SENSOR_ENDPOINT,
-	SWNODE_CIO2_PORT,
-	SWNODE_CIO2_ENDPOINT,
-	/* Must be last because it is optional / maybe empty */
-	SWNODE_VCM,
-	SWNODE_COUNT
-};
-
-/* Data representation as it is in ACPI SSDB buffer */
-struct cio2_sensor_ssdb {
-	u8 version;
-	u8 sku;
-	u8 guid_csi2[16];
-	u8 devfunction;
-	u8 bus;
-	u32 dphylinkenfuses;
-	u32 clockdiv;
-	u8 link;
-	u8 lanes;
-	u32 csiparams[10];
-	u32 maxlanespeed;
-	u8 sensorcalibfileidx;
-	u8 sensorcalibfileidxInMBZ[3];
-	u8 romtype;
-	u8 vcmtype;
-	u8 platforminfo;
-	u8 platformsubinfo;
-	u8 flash;
-	u8 privacyled;
-	u8 degree;
-	u8 mipilinkdefined;
-	u32 mclkspeed;
-	u8 controllogicid;
-	u8 reserved1[3];
-	u8 mclkport;
-	u8 reserved2[13];
-} __packed;
-
-struct cio2_property_names {
-	char clock_frequency[16];
-	char rotation[9];
-	char orientation[12];
-	char bus_type[9];
-	char data_lanes[11];
-	char remote_endpoint[16];
-	char link_frequencies[17];
-};
-
-struct cio2_node_names {
-	char port[7];
-	char endpoint[11];
-	char remote_port[7];
-	char vcm[16];
-};
-
-struct cio2_sensor_config {
-	const char *hid;
-	const u8 nr_link_freqs;
-	const u64 link_freqs[MAX_NUM_LINK_FREQS];
-};
-
-struct cio2_sensor {
-	/* append ssdb.link(u8) in "-%u" format as suffix of HID */
-	char name[ACPI_ID_LEN + 4];
-	struct acpi_device *adev;
-	struct i2c_client *vcm_i2c_client;
-
-	/* SWNODE_COUNT + 1 for terminating NULL */
-	const struct software_node *group[SWNODE_COUNT + 1];
-	struct software_node swnodes[SWNODE_COUNT];
-	struct cio2_node_names node_names;
-
-	u8 link;
-	u8 lanes;
-	u32 mclkspeed;
-	u32 rotation;
-	enum v4l2_fwnode_orientation orientation;
-	const char *vcm_type;
-
-	struct cio2_property_names prop_names;
-	struct property_entry ep_properties[5];
-	struct property_entry dev_properties[5];
-	struct property_entry cio2_properties[3];
-	struct software_node_ref_args local_ref[1];
-	struct software_node_ref_args remote_ref[1];
-	struct software_node_ref_args vcm_ref[1];
-};
-
-struct cio2_bridge {
-	struct device *dev;
-	int (*parse_sensor_fwnode)(struct acpi_device *adev,
-				   struct cio2_sensor *sensor,
-				   const struct cio2_sensor_config *cfg);
-	const struct cio2_sensor_config *supported_sensors;
-	char cio2_node_name[ACPI_ID_LEN];
-	struct software_node cio2_hid_node;
-	u32 data_lanes[4];
-	unsigned int n_sensors;
-	struct cio2_sensor sensors[CIO2_NUM_PORTS];
-};
-
-#endif
diff --git a/include/media/intel-cio2-bridge.h b/include/media/intel-cio2-bridge.h
new file mode 100644
index 000000000000..f538e222c850
--- /dev/null
+++ b/include/media/intel-cio2-bridge.h
@@ -0,0 +1,104 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Author: Dan Scally <djrscally@gmail.com> */
+/* Author: Hans de Goede <hansg@kernel.org> */
+#ifndef _INTEL_CIO2_BRIDGE_H
+#define _INTEL_CIO2_BRIDGE_H
+
+#include <linux/property.h>
+#include <linux/types.h>
+
+#include <media/v4l2-fwnode.h>
+
+struct acpi_device;
+struct i2c_client;
+
+#define INTEL_CIO2_HID					"INT343E"
+#define INTEL_CIO2_MAX_LANES				4
+#define INTEL_CIO2_NUM_PORTS				4U /* DPHYs */
+#define INTEL_CIO2_MAX_NUM_LINK_FREQS			3
+
+enum intel_cio2_sensor_swnodes {
+	SWNODE_SENSOR_HID,
+	SWNODE_SENSOR_PORT,
+	SWNODE_SENSOR_ENDPOINT,
+	SWNODE_CIO2_PORT,
+	SWNODE_CIO2_ENDPOINT,
+	/* Must be last because it is optional / maybe empty */
+	SWNODE_VCM,
+	SWNODE_COUNT
+};
+
+struct intel_cio2_property_names {
+	char clock_frequency[16];
+	char rotation[9];
+	char orientation[12];
+	char bus_type[9];
+	char data_lanes[11];
+	char remote_endpoint[16];
+	char link_frequencies[17];
+};
+
+struct intel_cio2_node_names {
+	char port[7];
+	char endpoint[11];
+	char remote_port[7];
+	char vcm[16];
+};
+
+struct intel_cio2_sensor_config {
+	const char *hid;
+	const u8 nr_link_freqs;
+	const u64 link_freqs[INTEL_CIO2_MAX_NUM_LINK_FREQS];
+};
+
+struct intel_cio2_sensor {
+	/* append link(u8) in "-%u" format as suffix of HID */
+	char name[ACPI_ID_LEN + 4];
+	struct acpi_device *adev;
+	struct i2c_client *vcm_i2c_client;
+
+	/* SWNODE_COUNT + 1 for terminating NULL */
+	const struct software_node *group[SWNODE_COUNT + 1];
+	struct software_node swnodes[SWNODE_COUNT];
+	struct intel_cio2_node_names node_names;
+
+	u8 link;
+	u8 lanes;
+	u32 mclkspeed;
+	u32 rotation;
+	enum v4l2_fwnode_orientation orientation;
+	const char *vcm_type;
+
+	struct intel_cio2_property_names prop_names;
+	struct property_entry ep_properties[5];
+	struct property_entry dev_properties[5];
+	struct property_entry cio2_properties[3];
+	struct software_node_ref_args local_ref[1];
+	struct software_node_ref_args remote_ref[1];
+	struct software_node_ref_args vcm_ref[1];
+};
+
+struct intel_cio2_bridge {
+	struct device *dev;
+	int (*parse_sensor_fwnode)(struct acpi_device *adev,
+				   struct intel_cio2_sensor *sensor,
+				   const struct intel_cio2_sensor_config *cfg);
+	const struct intel_cio2_sensor_config *supported_sensors;
+	char cio2_node_name[ACPI_ID_LEN];
+	struct software_node cio2_hid_node;
+	u32 data_lanes[INTEL_CIO2_MAX_LANES];
+	unsigned int n_sensors;
+	struct intel_cio2_sensor sensors[INTEL_CIO2_NUM_PORTS];
+};
+
+int intel_cio2_bridge_init(
+	struct device *dev,
+	int (*parse_sensor_fwnode)(struct acpi_device *adev,
+				   struct intel_cio2_sensor *sensor,
+				   const struct intel_cio2_sensor_config *cfg),
+	const struct intel_cio2_sensor_config *supported_sensors);
+
+enum v4l2_fwnode_orientation
+intel_cio2_bridge_get_orientation(struct acpi_device *adev);
+
+#endif
-- 
2.41.0

