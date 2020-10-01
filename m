Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B34427FC82
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 11:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731243AbgJAJdt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 05:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbgJAJdt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Oct 2020 05:33:49 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED4EC0613D0;
        Thu,  1 Oct 2020 02:33:48 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z1so4851668wrt.3;
        Thu, 01 Oct 2020 02:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=H9Hx1wek5IuZGKEib7mIU8wKKFKy82lgc3H9uGSfsuY=;
        b=NVghiBZAOYhM0QKvm/VgsgiZ7Gzr/BKx0SD7W2SQtqn4/bCJ46hgWN4/IbvOMtG6B9
         zGx4IbkJqZ5xhNZAJU4E339n7LE7PVfe1YZ9ey4FNVFpsLq9t191G2wYxH/zHmIMO21v
         ENKZkwyg1VHw+QHCBxuQOc2+ZjwoZSng5srG37UOEQ43Dfq5ZyWS+OIvUN6Ort6gSr5W
         ARGAiROAGC+L8Sf53RwPCecTT3lnIi3BkO+y5+i3kDmIS/DndpgJytoCyfCIVob3aTGE
         st3ug1If46O7Ho3AAekymJHbeHWIponZgyN8qcmqZ7RWLJAVXXIbBh1r5gELQV2Utz56
         E/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=H9Hx1wek5IuZGKEib7mIU8wKKFKy82lgc3H9uGSfsuY=;
        b=iQZhT8lTMXC+lrFj9shAZ6Dv+wPt/2F6MEuA/MLgo/5hr9cI3EmtHtZ5WdWzcJPuYk
         tCXf4XEvpv3AFBB1tFLzaB/n7uOkcKJ80GPQ29OLZjARER3uLaXcw19colE25Q01fDtw
         gdu3FRtdRJTLUlAnRUlJ4ifnbZSPk6u31hsKMlZTbSsyHCQjlUpDN+I6V9GYejQYnvSb
         iMkT71a/zSPzrpO+KJDAYOwxhDkVXUMUNfogKQ6qa9TCwbJPcN6x459PIHTpUx1ww/pR
         Jm9F9vi+nxSpEB02UyAhq5jJkyuCHrhhcibxItX1P7KQ2m9bebEUEk7FocCvSvNT20O/
         27jA==
X-Gm-Message-State: AOAM533vdMMRVgZOJYJG5L08QhnaVsDnV0YhjBlYp1HOHuw8KDzGanNJ
        JSwLrF/I2VGOmAkP66gV3yY=
X-Google-Smtp-Source: ABdhPJyHaMr1mLFnGHdIYwQJtTGkiOkiOv3sivj+Tm+wvjstC0RZhnZZJqyBKsI+w5TEhPQgrpIFGg==
X-Received: by 2002:a5d:554c:: with SMTP id g12mr7791114wrw.294.1601544827219;
        Thu, 01 Oct 2020 02:33:47 -0700 (PDT)
Received: from djrscally-MIIX-510-12ISK.home ([95.144.134.217])
        by smtp.gmail.com with ESMTPSA id h76sm8559014wme.10.2020.10.01.02.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 02:33:46 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        davem@davemloft.net, robh@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        kieran.bingham@ideasonboard.com, dan.carpenter@oracle.com,
        andriy.shevchenko@linux.intel.com
Subject: [RFC PATCH v2] Add functionality to ipu3-cio2 driver allowing software_node connections to sensors on platforms designed for Windows
Date:   Thu,  1 Oct 2020 10:33:26 +0100
Message-Id: <20201001093326.6208-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently on platforms designed for Windows, connections between CIO2 and
sensors are not properly defined in DSDT. This patch extends the ipu3-cio2
driver to compensate by building software_node connections, parsing the
connection properties from the sensor's SSDB buffer. 

Suggested-by: Jordan Hand <jorhand@linux.microsoft.com>

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
This patch is dependent on another (which implements the software node graph
family of functions):

https://lore.kernel.org/linux-media/20200915232827.3416-1-djrscally@gmail.com/

Major changes for the v2 (on top of a myriad of fixes probably too minor to
call out - thank you everybody for the comments)

* Built against media_tree instead of linus's tree - there's no T: entry in
maintainers for the ipu3-cio2 driver but I see there're recent changes in 
media_tree so thought this was the better option.

* Moved from a separate module to integrating the changes into the ipu3-cio2
driver itself.

There was some difference of opinion about the desirability of this, but I
think that this option won out. I have attempted to address the concerns about
bloating everyone's kernel by conditionally compiling the extension in based on
config settings; although I don't have an ipu3 device that doesn't need these
changes (so haven't been able to test that properly) - it certainly seems to be
working as expected.

Compiling things in like this did require renaming either the module or the
ipu3-cio2.c file, I chose the module to keep patch size down - let me know if
that was the wrong choice.

* Error handling has been switched so each function cleans itself up 
properly rather than one single "clean up everything" function.

* Indentation fixed for create_endpoint_properties()

* Creation of the software_nodes moved to its own function

* Clock frequency property moved to the device fwnode instead of the endpoint's

* Reprobe of the sensors added at the end of connect_supported_devices(). This
is needed to allow probe() calls from the drivers to pick up new properties.
This required some unusual behaviour; because we're overwriting the fwnode
of the device ACPI device to driver matching will no longer work. To work
around that, I'm cloning the driver but adding an i2c_device_id table to it
so that fallback i2c matching works. This driver is unregistered if the module
is removed. I don't especially like this solution, but I couldn't see a better
way to solve this problem.

Suggested changes that I didn't make:

Sakari - link-frequencies doesn't seem to be available in the SSDB buffer or
anywhere else that I can see in DSDT unfortunately, so I didn't add that as a
property. Also, I left the iterator as an int until that discussion came to a
conclusive answer.

 MAINTAINERS                                |   1 +
 drivers/media/pci/intel/ipu3/Kconfig       |  15 +
 drivers/media/pci/intel/ipu3/Makefile      |   8 +-
 drivers/media/pci/intel/ipu3/cio2-bridge.c | 433 +++++++++++++++++++++
 drivers/media/pci/intel/ipu3/cio2-bridge.h | 110 ++++++
 drivers/media/pci/intel/ipu3/ipu3-cio2.c   |  21 +
 drivers/media/pci/intel/ipu3/ipu3-cio2.h   |  18 +
 7 files changed, 605 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.c
 create mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 43a025039..0b4481ef2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8848,6 +8848,7 @@ INTEL IPU3 CSI-2 CIO2 DRIVER
 M:	Yong Zhi <yong.zhi@intel.com>
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 M:	Bingbu Cao <bingbu.cao@intel.com>
+M:	Dan Scally <djrscally@gmail.com>
 R:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
diff --git a/drivers/media/pci/intel/ipu3/Kconfig b/drivers/media/pci/intel/ipu3/Kconfig
index 82d7f17e6..04b2d579e 100644
--- a/drivers/media/pci/intel/ipu3/Kconfig
+++ b/drivers/media/pci/intel/ipu3/Kconfig
@@ -16,3 +16,18 @@ config VIDEO_IPU3_CIO2
 	  Say Y or M here if you have a Skylake/Kaby Lake SoC with MIPI CSI-2
 	  connected camera.
 	  The module will be called ipu3-cio2.
+
+config CIO2_BRIDGE
+	bool "IPU3 CIO2 Sensors Bridge"
+	depends on VIDEO_IPU3_CIO2
+	help
+	  This extension provides an API for the ipu3-cio2 driver to create
+	  connections to cameras that are hidden in SSDB buffer in ACPI. It
+	  can be used to enable support for cameras in detachable / hybrid
+	  devices that ship with Windows.
+
+	  Say y here if your device is a detachable / hybrid laptop that comes
+	  with Windows installed by the OEM, for example the Microsoft Surface
+	  line, Lenovo Miix line or Dell 7285.
+
+	  If in doubt, say n here.
diff --git a/drivers/media/pci/intel/ipu3/Makefile b/drivers/media/pci/intel/ipu3/Makefile
index 98ddd5bea..4810b34bf 100644
--- a/drivers/media/pci/intel/ipu3/Makefile
+++ b/drivers/media/pci/intel/ipu3/Makefile
@@ -1,2 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_VIDEO_IPU3_CIO2) += ipu3-cio2.o
+obj-$(CONFIG_VIDEO_IPU3_CIO2) += ipu3-cio2-driver.o
+
+ipu3-cio2-driver-objs += ipu3-cio2.o
+
+ifeq ($(CONFIG_CIO2_BRIDGE), y)
+ipu3-cio2-driver-objs += cio2-bridge.o
+endif
diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
new file mode 100644
index 000000000..14d722dea
--- /dev/null
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -0,0 +1,433 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/fwnode.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/property.h>
+#include <media/v4l2-subdev.h>
+
+#include "cio2-bridge.h"
+
+/*
+ * Extend this array with ACPI Hardware ID's of devices known to be
+ * working
+ */
+
+static const struct ipu3_sensor supported_devices[] = {
+	IPU3_SENSOR("INT33BE", "INT33BE:00"),
+	IPU3_SENSOR("OVTI2680", "OVTI2680:00"),
+	IPU3_SENSOR("OVTI5648", "OVTI5648:00")
+};
+
+static struct software_node cio2_hid_node = { CIO2_HID, };
+
+static struct cio2_bridge bridge;
+
+static const char * const port_names[] = {
+	"port0", "port1", "port2", "port3"
+};
+
+static const struct property_entry remote_endpoints[] = {
+	PROPERTY_ENTRY_REF("remote-endpoint", /* Sensor 0, Sensor Property */
+			   &bridge.sensors[0].swnodes[SWNODE_CIO2_ENDPOINT]),
+	PROPERTY_ENTRY_REF("remote-endpoint", /* Sensor 0, CIO2 Property */
+			   &bridge.sensors[0].swnodes[SWNODE_SENSOR_ENDPOINT]),
+	PROPERTY_ENTRY_REF("remote-endpoint",
+			   &bridge.sensors[1].swnodes[SWNODE_CIO2_ENDPOINT]),
+	PROPERTY_ENTRY_REF("remote-endpoint",
+			   &bridge.sensors[1].swnodes[SWNODE_SENSOR_ENDPOINT]),
+	PROPERTY_ENTRY_REF("remote-endpoint",
+			   &bridge.sensors[2].swnodes[SWNODE_CIO2_ENDPOINT]),
+	PROPERTY_ENTRY_REF("remote-endpoint",
+			   &bridge.sensors[2].swnodes[SWNODE_SENSOR_ENDPOINT]),
+	PROPERTY_ENTRY_REF("remote-endpoint",
+			   &bridge.sensors[3].swnodes[SWNODE_CIO2_ENDPOINT]),
+	PROPERTY_ENTRY_REF("remote-endpoint",
+			   &bridge.sensors[3].swnodes[SWNODE_SENSOR_ENDPOINT]),
+};
+
+static int read_acpi_block(struct device *dev, char *id, void *data, u32 size)
+{
+	union acpi_object *obj;
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_handle *handle = ACPI_HANDLE(dev);
+	acpi_status status;
+	int ret;
+
+	status = acpi_evaluate_object(handle, id, NULL, &buffer);
+	if (ACPI_FAILURE(status))
+		return -ENODEV;
+
+	obj = buffer.pointer;
+	if (!obj || obj->type != ACPI_TYPE_BUFFER) {
+		dev_err(dev, "Could't read acpi buffer\n");
+		ret = -ENODEV;
+		goto err_free_buff;
+	}
+
+	if (obj->buffer.length > size) {
+		dev_err(dev, "Given buffer is too small\n");
+		ret = -ENODEV;
+		goto err_free_buff;
+	}
+
+	memcpy(data, obj->buffer.pointer, obj->buffer.length);
+	kfree(buffer.pointer);
+
+	return obj->buffer.length;
+err_free_buff:
+	kfree(buffer.pointer);
+	return ret;
+}
+
+static int get_acpi_ssdb_sensor_data(struct device *dev,
+				     struct sensor_bios_data *sensor)
+{
+	struct sensor_bios_data_packed sensor_data;
+	int ret;
+
+	ret = read_acpi_block(dev, "SSDB", &sensor_data, sizeof(sensor_data));
+	if (ret < 0)
+		return ret;
+
+	sensor->link = sensor_data.link;
+	sensor->lanes = sensor_data.lanes;
+	sensor->mclkspeed = sensor_data.mclkspeed;
+	sensor->degree = sensor_data.degree;
+
+	return 0;
+}
+
+static int create_fwnode_properties(struct sensor *sensor,
+				    struct sensor_bios_data *ssdb)
+{
+	struct property_entry *ep_props;
+	struct property_entry *cio2_props;
+	struct property_entry *dev_props;
+	u32 *data_lanes;
+	int i;
+
+	/* device fwnode properties */
+	dev_props = kcalloc(3, sizeof(*dev_props), GFP_KERNEL);
+	if (!dev_props)
+		return -ENOMEM;
+
+	dev_props[0] = PROPERTY_ENTRY_U32("clock-frequency", ssdb->mclkspeed);
+	dev_props[1] = PROPERTY_ENTRY_U8("rotation", ssdb->degree);
+
+	memcpy(sensor->dev_props, dev_props, sizeof(*dev_props) * 3);
+	kfree(dev_props);
+
+	/* endpoint fwnode properties */
+
+	data_lanes = devm_kmalloc_array(sensor->dev, ssdb->lanes, sizeof(u32),
+					GFP_KERNEL);
+
+	if (!data_lanes)
+		return -ENOMEM;
+
+	for (i = 0; i < ssdb->lanes; i++)
+		data_lanes[i] = i + 1;
+
+	ep_props = kcalloc(4, sizeof(*ep_props), GFP_KERNEL);
+	if (!ep_props)
+		return -ENOMEM;
+
+	ep_props[0] = PROPERTY_ENTRY_U32("bus-type", 5);
+	ep_props[1] = PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes",
+						   data_lanes,
+						   ssdb->lanes);
+	ep_props[2] = remote_endpoints[(bridge.n_sensors * 2) + ENDPOINT_SENSOR];
+
+	memcpy(sensor->ep_props, ep_props, sizeof(*ep_props) * 4);
+	kfree(ep_props);
+
+	/* cio2 endpoint props */
+
+	cio2_props = kcalloc(3, sizeof(*cio2_props), GFP_KERNEL);
+	if (!cio2_props)
+		return -ENOMEM;
+
+	cio2_props[0] = PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes",
+						     data_lanes,
+						     ssdb->lanes);
+	cio2_props[1] = remote_endpoints[(bridge.n_sensors * 2) + ENDPOINT_CIO2];
+
+	memcpy(sensor->cio2_props, cio2_props, sizeof(*cio2_props) * 3);
+	kfree(cio2_props);
+
+	return 0;
+}
+
+static int create_connection_swnodes(struct sensor *sensor,
+				     struct sensor_bios_data *ssdb)
+{
+	struct software_node *nodes;
+
+	nodes = kcalloc(6, sizeof(*nodes), GFP_KERNEL);
+	if (!nodes)
+		return -ENOMEM;
+
+	nodes[SWNODE_SENSOR_HID] = NODE_SENSOR(sensor->name,
+					       sensor->dev_props);
+	nodes[SWNODE_SENSOR_PORT] = NODE_PORT("port0",
+					      &sensor->swnodes[SWNODE_SENSOR_HID]);
+	nodes[SWNODE_SENSOR_ENDPOINT] = NODE_ENDPOINT("endpoint0",
+						      &sensor->swnodes[SWNODE_SENSOR_PORT],
+						      sensor->ep_props);
+	nodes[SWNODE_CIO2_PORT] = NODE_PORT(port_names[ssdb->link],
+					    &cio2_hid_node);
+	nodes[SWNODE_CIO2_ENDPOINT] = NODE_ENDPOINT("endpoint0",
+						    &sensor->swnodes[SWNODE_CIO2_PORT],
+						    sensor->cio2_props);
+
+	memcpy(sensor->swnodes, nodes, sizeof(*nodes) * 6);
+	kfree(nodes);
+
+	return 0;
+}
+
+static void cio2_bridge_unregister_sensors(void)
+{
+	int i, j;
+	struct sensor *sensor;
+
+	for (i = 0; i < bridge.n_sensors; i++) {
+		sensor = &bridge.sensors[i];
+
+		for (j = 4; j >= 0; j--)
+			software_node_unregister(&sensor->swnodes[j]);
+
+		/*
+		 * Give the sensor its original fwnode back or the next time
+		 * it's probed will fail, because ACPI matching doesn't work
+		 * when your fwnode doesn't have acpi_device_fwnode_ops.
+		 */
+		sensor->dev->fwnode = sensor->fwnode;
+		fwnode_handle_put(sensor->fwnode);
+
+		device_release_driver(sensor->dev);
+		i2c_del_driver(&sensor->new_drv);
+		device_reprobe(sensor->dev);
+		put_device(sensor->dev);
+	}
+}
+
+/*
+ * We have to reprobe the sensor in order for .probe() calls to be able to read
+ * the fwnode properties we set, but having just overwritten the ACPI fwnode
+ * the usual matching won't work by default. We need to clone the existing
+ * driver but add an i2c_device_id so the matching works.
+ */
+static int cio2_bridge_reprobe_sensor(struct sensor *sensor, int index)
+{
+	struct i2c_client *client;
+	int ret;
+
+	client = container_of(sensor->dev, struct i2c_client, dev);
+
+	sensor->old_drv = container_of(sensor->dev->driver, struct i2c_driver,
+				       driver);
+
+	sensor->new_drv.driver.name = supported_devices[index].i2c_id[0].name;
+	sensor->new_drv.probe_new = sensor->old_drv->probe_new;
+	sensor->new_drv.remove = sensor->old_drv->remove;
+	sensor->new_drv.id_table = supported_devices[index].i2c_id;
+
+	device_release_driver(sensor->dev);
+
+	ret = i2c_add_driver(&sensor->new_drv);
+	if (ret)
+		return ret;
+
+	ret = device_reprobe(sensor->dev);
+	if (ret)
+		goto err_remove_new_drv;
+
+	return 0;
+
+err_remove_new_drv:
+	i2c_del_driver(&sensor->new_drv);
+
+	return ret;
+}
+
+static int connect_supported_devices(void)
+{
+	struct acpi_device *adev;
+	struct device *dev;
+	struct sensor_bios_data ssdb;
+	struct sensor *sensor;
+	struct fwnode_handle *fwnode;
+	struct v4l2_subdev *sd;
+	int i, j, ret;
+
+	ret = 0;
+
+	for (i = 0; i < ARRAY_SIZE(supported_devices); i++) {
+		adev = acpi_dev_get_first_match_dev(supported_devices[i].hid,
+						    NULL, -1);
+		if (!adev)
+			continue;
+
+		dev = bus_find_device_by_acpi_dev(&i2c_bus_type, adev);
+		if (!dev) {
+			ret = -EPROBE_DEFER;
+			goto err_rollback;
+		}
+
+		/*
+		 * We need to clone the driver of any sensors that we connect,
+		 * so if they're probing we need to wait until they're finished
+		 */
+
+		if (dev->links.status == DL_DEV_PROBING) {
+			ret = -EPROBE_DEFER;
+			goto err_free_dev;
+		}
+
+		/*
+		 * If a sensor has no driver, we want to continue to try and
+		 * link others
+		 */
+		sd = dev_get_drvdata(dev);
+		if (!sd)
+			goto cont_free_dev;
+
+		sensor = &bridge.sensors[bridge.n_sensors];
+		sensor->dev = dev;
+
+		snprintf(sensor->name, 20, "%s", supported_devices[i].hid);
+
+		sensor->fwnode = fwnode_handle_get(dev->fwnode);
+		if (!sensor->fwnode)
+			goto err_free_dev;
+
+		ret = get_acpi_ssdb_sensor_data(dev, &ssdb);
+		if (ret)
+			goto err_free_fwnode;
+
+		ret = create_fwnode_properties(sensor, &ssdb);
+		if (ret)
+			goto err_free_fwnode;
+
+		ret = create_connection_swnodes(sensor, &ssdb);
+		if (ret)
+			goto err_free_fwnode;
+
+		ret = software_node_register_nodes(sensor->swnodes);
+		if (ret)
+			goto err_free_fwnode;
+
+		fwnode = software_node_fwnode(&sensor->swnodes[SWNODE_SENSOR_HID]);
+		if (!fwnode) {
+			ret = -ENODEV;
+			goto err_free_swnodes;
+		}
+
+		fwnode->secondary = ERR_PTR(-ENODEV);
+		dev->fwnode = fwnode;
+
+		ret = cio2_bridge_reprobe_sensor(sensor, i);
+		if (ret)
+			goto err_free_swnodes;
+
+		pr_info("cio2-bridge: Found supported device %s\n",
+			supported_devices[i].hid);
+
+		bridge.n_sensors++;
+		continue;
+cont_free_dev:
+		put_device(dev);
+		continue;
+err_free_swnodes:
+		for (j = 4; j >= 0; j--)
+			software_node_unregister(&sensor->swnodes[j]);
+err_free_fwnode:
+		fwnode_handle_put(sensor->fwnode);
+err_free_dev:
+		put_device(dev);
+err_rollback:
+		/*
+		 * If an iteration of this loop results in -EPROBE_DEFER then
+		 * we need to roll back any sensors that were successfully
+		 * registered. Any other error and we'll skip that step, as
+		 * it seems better to have one successfully connected sensor.
+		 */
+
+		if (ret == -EPROBE_DEFER)
+			cio2_bridge_unregister_sensors();
+
+		break;
+	}
+
+	return ret;
+}
+
+int cio2_bridge_build(struct pci_dev *cio2)
+{
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	pci_dev_get(cio2);
+
+	ret = software_node_register(&cio2_hid_node);
+	if (ret < 0) {
+		pr_err("cio2-bridge: Failed to register the CIO2 HID node\n");
+		goto err_put_cio2;
+	}
+
+	ret = connect_supported_devices();
+	if (ret == -EPROBE_DEFER)
+		goto err_unregister_cio2;
+
+	if (bridge.n_sensors == 0) {
+		ret = -EPROBE_DEFER;
+		goto err_unregister_cio2;
+	}
+
+	pr_info("cio2-bridge: Connected %d cameras\n", bridge.n_sensors);
+
+	fwnode = software_node_fwnode(&cio2_hid_node);
+	if (!fwnode) {
+		pr_err("Error getting fwnode from cio2 software_node\n");
+		ret = -ENODEV;
+		goto err_unregister_sensors;
+	}
+
+	/*
+	 * We store the pci_dev's existing fwnode, because in the event we
+	 * want to reload the ipu3-cio2 driver we need to give the device its
+	 * original fwnode back to prevent problems.
+	 */
+
+	bridge.cio2_fwnode = fwnode_handle_get(cio2->dev.fwnode);
+
+	fwnode->secondary = ERR_PTR(-ENODEV);
+	cio2->dev.fwnode = fwnode;
+
+	return 0;
+
+err_unregister_sensors:
+	cio2_bridge_unregister_sensors();
+err_unregister_cio2:
+	software_node_unregister(&cio2_hid_node);
+err_put_cio2:
+	pci_dev_put(cio2);
+
+	return ret;
+}
+
+void cio2_bridge_burn(struct pci_dev *cio2)
+{
+	cio2->dev.fwnode = bridge.cio2_fwnode;
+	fwnode_handle_put(bridge.cio2_fwnode);
+	pci_dev_put(cio2);
+
+	cio2_bridge_unregister_sensors();
+
+	software_node_unregister(&cio2_hid_node);
+}
diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.h b/drivers/media/pci/intel/ipu3/cio2-bridge.h
new file mode 100644
index 000000000..16ff262f3
--- /dev/null
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.h
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __CIO2_BRIDGE_H
+#define __CIO2_BRIDGE_H
+#define __NO_VERSION__
+
+#define MAX_CONNECTED_DEVICES			4
+#define SWNODE_SENSOR_HID			0
+#define SWNODE_SENSOR_PORT			1
+#define SWNODE_SENSOR_ENDPOINT			2
+#define SWNODE_CIO2_PORT			3
+#define SWNODE_CIO2_ENDPOINT			4
+#define SWNODE_NULL_TERMINATOR			5
+
+#define CIO2_HID				"INT343E"
+#define CIO2_PCI_ID				0x9d32
+
+#define ENDPOINT_SENSOR				0
+#define ENDPOINT_CIO2				1
+
+#define NODE_SENSOR(_HID, _PROPS)		\
+	((const struct software_node) {		\
+		.name = _HID,			\
+		.properties = _PROPS		\
+	})
+
+#define NODE_PORT(_PORT, _SENSOR_NODE)		\
+	((const struct software_node) {		\
+		_PORT,				\
+		_SENSOR_NODE,			\
+	})
+
+#define NODE_ENDPOINT(_EP, _PORT, _PROPS)	\
+	((const struct software_node) {		\
+		_EP,				\
+		_PORT,				\
+		_PROPS,				\
+	})
+
+#define IPU3_SENSOR(_HID, _CLIENT)		\
+	{					\
+		.hid = _HID,			\
+		.i2c_id = {			\
+			{_CLIENT, 0},		\
+			{ },			\
+		}				\
+	}
+
+struct ipu3_sensor {
+	const char hid[20];
+	const struct i2c_device_id i2c_id[2];
+};
+
+struct sensor {
+	char name[20];
+	struct device *dev;
+	struct software_node swnodes[6];
+	struct property_entry dev_props[3];
+	struct property_entry ep_props[4];
+	struct property_entry cio2_props[3];
+	struct fwnode_handle *fwnode;
+	struct i2c_driver *old_drv;
+	struct i2c_driver new_drv;
+};
+
+struct cio2_bridge {
+	int n_sensors;
+	struct sensor sensors[MAX_CONNECTED_DEVICES];
+	struct fwnode_handle *cio2_fwnode;
+};
+
+/* Data representation as it is in ACPI SSDB buffer */
+struct sensor_bios_data_packed {
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
+} __attribute__((__packed__));
+
+/* Fields needed by bridge driver */
+struct sensor_bios_data {
+	struct device *dev;
+	u8 link;
+	u8 lanes;
+	u8 degree;
+	u32 mclkspeed;
+};
+
+#endif
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 4e598e937..ea18d8c81 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1711,8 +1711,26 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 			  const struct pci_device_id *id)
 {
 	struct cio2_device *cio2;
+	struct fwnode_handle *endpoint;
 	int r;
 
+	/*
+	 * On some platforms no connections to sensors are defined in firmware,
+	 * if the device has no endpoints then we can try to build those as
+	 * software_nodes parsed from SSDB.
+	 *
+	 * This may EPROBE_DEFER if supported devices are found defined in ACPI
+	 * but not yet ready for use (either not attached to the i2c bus yet,
+	 * or not done probing themselves).
+	 */
+
+	endpoint = fwnode_graph_get_next_endpoint(pci_dev->dev.fwnode, NULL);
+	if (!endpoint) {
+		r = cio2_bridge_build(pci_dev);
+		if (r)
+			return r;
+	}
+
 	cio2 = devm_kzalloc(&pci_dev->dev, sizeof(*cio2), GFP_KERNEL);
 	if (!cio2)
 		return -ENOMEM;
@@ -1820,6 +1838,9 @@ static void cio2_pci_remove(struct pci_dev *pci_dev)
 {
 	struct cio2_device *cio2 = pci_get_drvdata(pci_dev);
 
+	if (is_software_node(pci_dev->dev.fwnode))
+		cio2_bridge_burn(pci_dev);
+
 	media_device_unregister(&cio2->media_dev);
 	v4l2_async_notifier_unregister(&cio2->notifier);
 	v4l2_async_notifier_cleanup(&cio2->notifier);
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
index 549b08f88..45791208d 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
@@ -436,4 +436,22 @@ static inline struct cio2_queue *vb2q_to_cio2_queue(struct vb2_queue *vq)
 	return container_of(vq, struct cio2_queue, vbq);
 }
 
+#ifdef CONFIG_CIO2_BRIDGE
+
+int cio2_bridge_build(struct pci_dev *cio2);
+void cio2_bridge_burn(struct pci_dev *cio2);
+
+#else
+
+int cio2_bridge_build(struct pci_dev *cio2)
+{
+	return 0;
+}
+
+void cio2_bridge_burn(struct pci_dev *cio2)
+{
+}
+
+#endif
+
 #endif
-- 
2.17.1

