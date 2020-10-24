Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20931297A29
	for <lists+linux-media@lfdr.de>; Sat, 24 Oct 2020 03:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1758374AbgJXBZC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 21:25:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41978 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758366AbgJXBZC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 21:25:02 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C30619D1;
        Sat, 24 Oct 2020 03:24:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1603502698;
        bh=nzXS+X+TrlWlJu5mtU/mA7WOGtdb7HMtnVkjEzx2bt4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l9YThqAMoYledqb2rppZOX7M4LTBXJOzrMKaTzGbOF7qWNuuV6+O6Dp7wtyYTRnml
         fqFFzwx/kNARWos6+nL/mSRuxfYZHxLTMBE8RhJZnFY1MChW3fzRRmmZIJ5ZvFDg+/
         WehTy9WRIeJGwdHGkOp9Lch8s5vk52VPZbIKO/8Y=
Date:   Sat, 24 Oct 2020 04:24:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        andriy.shevchenko@linux.intel.com, sergey.senozhatsky@gmail.com,
        rostedt@goodmis.org, pmladek@suse.com, mchehab@kernel.org,
        tian.shu.qiu@intel.com, bingbu.cao@intel.com,
        sakari.ailus@linux.intel.com, yong.zhi@intel.com,
        rafael@kernel.org, gregkh@linuxfoundation.org, kitakar@gmail.com,
        dan.carpenter@oracle.org
Subject: Re: [RFC PATCH v3 9/9] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
Message-ID: <20201024012411.GT5979@pendragon.ideasonboard.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-10-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201019225903.14276-10-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Mon, Oct 19, 2020 at 11:59:03PM +0100, Daniel Scally wrote:
> Currently on platforms designed for Windows, connections between CIO2 and
> sensors are not properly defined in DSDT. This patch extends the ipu3-cio2
> driver to compensate by building software_node connections, parsing the
> connection properties from the sensor's SSDB buffer.
> 
> Suggested-by: Jordan Hand <jorhand@linux.microsoft.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in v3:
> 	- Rather than overwriting the device's primary fwnode, we now
> 	simply assign a secondary. Some of the preceding patches alter the
> 	existing driver code and v4l2 framework to allow for that.
> 	- Rather than reprobe() the sensor after connecting the devices in
> 	cio2-bridge we create the software_nodes right away. In this case,
> 	sensor drivers will have to defer probing until they detect that a
> 	fwnode graph is connecting them to the CIO2 device.
> 	- Error paths in connect_supported_devices() moved outside the
> 	loop
> 	- Replaced pr_*() with dev_*() throughout
> 	- Moved creation of software_node / property_entry arrays to stack
> 	- A lot of formatting changes.
> 
>  MAINTAINERS                                   |   1 +
>  drivers/media/pci/intel/ipu3/Kconfig          |  18 +
>  drivers/media/pci/intel/ipu3/Makefile         |   3 +-
>  drivers/media/pci/intel/ipu3/cio2-bridge.c    | 327 ++++++++++++++++++
>  drivers/media/pci/intel/ipu3/cio2-bridge.h    |  94 +++++
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  21 ++
>  drivers/media/pci/intel/ipu3/ipu3-cio2.h      |   9 +
>  7 files changed, 472 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.c
>  create mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5d768d5ad..4c9c646c7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8848,6 +8848,7 @@ INTEL IPU3 CSI-2 CIO2 DRIVER
>  M:	Yong Zhi <yong.zhi@intel.com>
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  M:	Bingbu Cao <bingbu.cao@intel.com>
> +M:	Dan Scally <djrscally@gmail.com>
>  R:	Tianshu Qiu <tian.shu.qiu@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> diff --git a/drivers/media/pci/intel/ipu3/Kconfig b/drivers/media/pci/intel/ipu3/Kconfig
> index 82d7f17e6..d14cbceae 100644
> --- a/drivers/media/pci/intel/ipu3/Kconfig
> +++ b/drivers/media/pci/intel/ipu3/Kconfig
> @@ -16,3 +16,21 @@ config VIDEO_IPU3_CIO2
>  	  Say Y or M here if you have a Skylake/Kaby Lake SoC with MIPI CSI-2
>  	  connected camera.
>  	  The module will be called ipu3-cio2.
> +
> +config CIO2_BRIDGE
> +	bool "IPU3 CIO2 Sensors Bridge"
> +	depends on VIDEO_IPU3_CIO2
> +	help
> +	  This extension provides an API for the ipu3-cio2 driver to create
> +	  connections to cameras that are hidden in SSDB buffer in ACPI. It
> +	  can be used to enable support for cameras in detachable / hybrid
> +	  devices that ship with Windows.
> +
> +	  Say Y here if your device is a detachable / hybrid laptop that comes
> +	  with Windows installed by the OEM, for example:
> +
> +	  	- Some Microsoft Surface models
> +		- The Lenovo Miix line
> +		- Dell 7285
> +
> +	  If in doubt, say N here.
> diff --git a/drivers/media/pci/intel/ipu3/Makefile b/drivers/media/pci/intel/ipu3/Makefile
> index b4e3266d9..933777e6e 100644
> --- a/drivers/media/pci/intel/ipu3/Makefile
> +++ b/drivers/media/pci/intel/ipu3/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_VIDEO_IPU3_CIO2) += ipu3-cio2.o
>  
> -ipu3-cio2-y += ipu3-cio2-main.o
> \ No newline at end of file
> +ipu3-cio2-y += ipu3-cio2-main.o
> +ipu3-cio2-$(CONFIG_CIO2_BRIDGE) += cio2-bridge.o
> diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> new file mode 100644
> index 000000000..bbe072f04
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> @@ -0,0 +1,327 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Author: Dan Scally <djrscally@gmail.com>
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/fwnode.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/property.h>
> +#include <media/v4l2-subdev.h>
> +
> +#include "cio2-bridge.h"
> +
> +/*
> + * Extend this array with ACPI Hardware ID's of devices known to be
> + * working
> + */
> +static const char * const supported_devices[] = {
> +	"INT33BE",
> +	"OVTI2680",
> +};
> +
> +static struct software_node cio2_hid_node = { CIO2_HID };
> +
> +static struct cio2_bridge bridge;

While there shouldn't be more than one CIO2 instance, we try to develop
drivers in a way that avoids global per-device variables. Could all this
be allocated dynamically, with the pointer returned by
cio2_bridge_build() and stored in the cio2_device structure ?

> +
> +static const char * const port_names[] = {
> +	"port0", "port1", "port2", "port3"
> +};
> +
> +static const struct property_entry remote_endpoints[] = {
> +	PROPERTY_ENTRY_REF("remote-endpoint", /* Sensor 0, Sensor Property */
> +			   &bridge.sensors[0].swnodes[SWNODE_CIO2_ENDPOINT]),
> +	PROPERTY_ENTRY_REF("remote-endpoint", /* Sensor 0, CIO2 Property */
> +			   &bridge.sensors[0].swnodes[SWNODE_SENSOR_ENDPOINT]),
> +	PROPERTY_ENTRY_REF("remote-endpoint",
> +			   &bridge.sensors[1].swnodes[SWNODE_CIO2_ENDPOINT]),
> +	PROPERTY_ENTRY_REF("remote-endpoint",
> +			   &bridge.sensors[1].swnodes[SWNODE_SENSOR_ENDPOINT]),
> +	PROPERTY_ENTRY_REF("remote-endpoint",
> +			   &bridge.sensors[2].swnodes[SWNODE_CIO2_ENDPOINT]),
> +	PROPERTY_ENTRY_REF("remote-endpoint",
> +			   &bridge.sensors[2].swnodes[SWNODE_SENSOR_ENDPOINT]),
> +	PROPERTY_ENTRY_REF("remote-endpoint",
> +			   &bridge.sensors[3].swnodes[SWNODE_CIO2_ENDPOINT]),
> +	PROPERTY_ENTRY_REF("remote-endpoint",
> +			   &bridge.sensors[3].swnodes[SWNODE_SENSOR_ENDPOINT]),
> +};

For the same reason, I would move this to the sensor structure (with two
property_entry per sensor). That will simplify the code below, avoiding
indexing this array with bridge.n_sensors * 2.

> +
> +static int read_acpi_block(struct device *dev, char *id, void *data, u32 size)

To avoid potential future namespace classes, I'd advise naming the
functions with a cio2_bridge_ prefix, even the static ones.

And maybe cio2_bridge_read_acpi_buffer(), as this function reads a
buffer ?

> +{
> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_handle *handle;
> +	union acpi_object *obj;
> +	acpi_status status;
> +	int ret;
> +
> +	handle = ACPI_HANDLE(dev);
> +
> +	status = acpi_evaluate_object(handle, id, NULL, &buffer);
> +	if (ACPI_FAILURE(status))
> +		return -ENODEV;
> +
> +	obj = buffer.pointer;
> +	if (!obj) {
> +		dev_err(dev, "Couldn't locate ACPI buffer\n");
> +		return -ENODEV;
> +	}
> +
> +	if (obj->type != ACPI_TYPE_BUFFER) {
> +		dev_err(dev, "Couldn't read ACPI buffer\n");
> +		ret = -ENODEV;
> +		goto out_free_buff;
> +	}
> +
> +	if (obj->buffer.length > size) {
> +		dev_err(dev, "Given buffer is too small\n");
> +		ret = -ENODEV;
> +		goto out_free_buff;
> +	}
> +
> +	memcpy(data, obj->buffer.pointer, obj->buffer.length);
> +	ret = obj->buffer.length;
> +
> +out_free_buff:
> +	kfree(buffer.pointer);
> +	return ret;
> +}
> +
> +static int get_acpi_ssdb_sensor_data(struct device *dev,
> +				     struct sensor_bios_data *sensor)
> +{
> +	struct sensor_bios_data_packed sensor_data;
> +	int ret;
> +
> +	ret = read_acpi_block(dev, "SSDB", &sensor_data, sizeof(sensor_data));
> +	if (ret < 0)
> +		return ret;
> +
> +	sensor->link = sensor_data.link;
> +	sensor->lanes = sensor_data.lanes;
> +	sensor->mclkspeed = sensor_data.mclkspeed;
> +	sensor->degree = sensor_data.degree;

How about storing a sensor_bios_data_packed inside sensor_bios_data ?
That will avoid copying fields individually, with manual addition of
extra fields as they become useful. Usage of the sensor_bios_data
structure would turn from sensor->degree to sensor->ssdb.degree, which
is slightly longer, but I think more maintainable.

> +
> +	return 0;
> +}
> +
> +static int create_fwnode_properties(struct sensor *sensor,
> +				    struct sensor_bios_data *ssdb)
> +{
> +	struct property_entry *cio2_properties = sensor->cio2_properties;
> +	struct property_entry *dev_properties = sensor->dev_properties;
> +	struct property_entry *ep_properties = sensor->ep_properties;
> +	int i;

i never takes negative values, you can make it an unsigned int. Same for
other occurrences below.

> +
> +	/* device fwnode properties */
> +	memset(dev_properties, 0, sizeof(struct property_entry) * 3);

I would memset() bridge to 0 in one go and avoid individual memsets. And
if you allocate it with kzalloc() it will be initialized to 0.

> +
> +	dev_properties[0] = PROPERTY_ENTRY_U32("clock-frequency",
> +					       ssdb->mclkspeed);
> +	dev_properties[1] = PROPERTY_ENTRY_U8("rotation", ssdb->degree);
> +
> +	/* endpoint fwnode properties */
> +	memset(ep_properties, 0, sizeof(struct property_entry) * 4);
> +
> +	sensor->data_lanes = kmalloc_array(ssdb->lanes, sizeof(u32),
> +					   GFP_KERNEL);

Given that there can't be more than 4 data lanes, how about turning
data_lanes into an array with 4 entries, to avoid the dynamic allocation
? You will have to validate ssdb->lanes in connect_supported_devices(),
to make sure not to overflow the array. This and the next function can
then be turned into void functions.

> +
> +	if (!sensor->data_lanes)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ssdb->lanes; i++)
> +		sensor->data_lanes[i] = i + 1;
> +
> +	ep_properties[0] = PROPERTY_ENTRY_U32("bus-type", 5);
> +	ep_properties[1] = PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes",
> +							sensor->data_lanes,
> +							ssdb->lanes);
> +	ep_properties[2] = remote_endpoints[(bridge.n_sensors * 2) + ENDPOINT_SENSOR];
> +
> +	/* cio2 endpoint props */
> +	memset(cio2_properties, 0, sizeof(struct property_entry) * 3);
> +
> +	cio2_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes",
> +							  sensor->data_lanes,
> +							  ssdb->lanes);
> +	cio2_properties[1] = remote_endpoints[(bridge.n_sensors * 2) + ENDPOINT_CIO2];
> +
> +	return 0;
> +}
> +
> +static int create_connection_swnodes(struct sensor *sensor,
> +				     struct sensor_bios_data *ssdb)
> +{
> +	struct software_node *nodes = sensor->swnodes;
> +
> +	memset(nodes, 0, sizeof(struct software_node) * 6);
> +
> +	nodes[SWNODE_SENSOR_HID] = NODE_SENSOR(sensor->name,
> +					       sensor->dev_properties);
> +	nodes[SWNODE_SENSOR_PORT] = NODE_PORT("port0",
> +					      &nodes[SWNODE_SENSOR_HID]);
> +	nodes[SWNODE_SENSOR_ENDPOINT] = NODE_ENDPOINT("endpoint0",
> +						      &nodes[SWNODE_SENSOR_PORT],
> +						      sensor->ep_properties);
> +	nodes[SWNODE_CIO2_PORT] = NODE_PORT(port_names[ssdb->link],
> +					    &cio2_hid_node);
> +	nodes[SWNODE_CIO2_ENDPOINT] = NODE_ENDPOINT("endpoint0",
> +						    &nodes[SWNODE_CIO2_PORT],
> +						    sensor->cio2_properties);
> +
> +	return 0;
> +}
> +
> +static void cio2_bridge_unregister_sensors(void)
> +{
> +	struct sensor *sensor;
> +	int i;
> +
> +	for (i = 0; i < bridge.n_sensors; i++) {
> +		sensor = &bridge.sensors[i];
> +
> +		software_node_unregister_nodes_reverse(sensor->swnodes);
> +
> +		kfree(sensor->data_lanes);
> +
> +		put_device(sensor->dev);
> +		acpi_dev_put(sensor->adev);
> +	}
> +}
> +
> +static int connect_supported_devices(struct pci_dev *cio2)
> +{
> +	struct sensor_bios_data ssdb;
> +	struct fwnode_handle *fwnode;
> +	struct acpi_device *adev;
> +	struct sensor *sensor;
> +	struct device *dev;
> +	int i, ret;
> +
> +	ret = 0;

You can initialize ret to 0 when declaring the variable.

> +	for (i = 0; i < ARRAY_SIZE(supported_devices); i++) {
> +		adev = acpi_dev_get_first_match_dev(supported_devices[i], NULL, -1);

What if there are multiple sensor of the same model ?

> +		if (!adev)
> +			continue;
> +

Does acpi_dev_get_first_match_dev() skip disabled devices (as reported
by _STA) ?

> +		dev = bus_find_device_by_acpi_dev(&i2c_bus_type, adev);
> +		if (!dev) {
> +			ret = -EPROBE_DEFER;
> +			goto err_rollback;
> +		}
> +
> +		sensor = &bridge.sensors[bridge.n_sensors];
> +		sensor->dev = dev;
> +		sensor->adev = adev;
> +
> +		snprintf(sensor->name, ACPI_ID_LEN, "%s",
> +			 supported_devices[i]);

How about strlcpy() ?

> +
> +		ret = get_acpi_ssdb_sensor_data(dev, &ssdb);
> +		if (ret)
> +			goto err_free_dev;
> +
> +		ret = create_fwnode_properties(sensor, &ssdb);
> +		if (ret)
> +			goto err_free_dev;
> +
> +		ret = create_connection_swnodes(sensor, &ssdb);
> +		if (ret)
> +			goto err_free_dev;
> +
> +		ret = software_node_register_nodes(sensor->swnodes);
> +		if (ret)
> +			goto err_free_dev;
> +
> +		fwnode = software_node_fwnode(&sensor->swnodes[SWNODE_SENSOR_HID]);
> +		if (!fwnode) {
> +			ret = -ENODEV;
> +			goto err_free_swnodes;
> +		}
> +
> +		set_secondary_fwnode(dev, fwnode);

I wonder if we could avoid depending on the I2C device being created by
getting the fwnode from adev, and setting ->secondary manually. adev
would need to be passed to get_acpi_ssdb_sensor_data() instead of dev.

> +
> +		dev_info(&cio2->dev, "Found supported device %s\n",
> +			 supported_devices[i]);
> +
> +		bridge.n_sensors++;
> +		continue;
> +	}
> +
> +	return ret;
> +
> +err_free_swnodes:
> +	software_node_unregister_nodes_reverse(sensor->swnodes);
> +err_free_dev:
> +	put_device(dev);
> +err_rollback:
> +	acpi_dev_put(adev);

I think you'll leak sensor->data_lanes here. It won't be a problem if
you don't allocate it manually, as proposed above. I however wonder if
error handling couldn't be simplified by increasing bridge.n_sensors
earlier, and skipping cleanup in cio2_bridge_unregister_sensors() for
the fields that haven't been initialized (for instance kfree() is a
no-op on NULL pointers, so that's already handled).

> +
> +	/*
> +	 * If an iteration of this loop results in -EPROBE_DEFER then
> +	 * we need to roll back any sensors that were successfully
> +	 * registered. Any other error and we'll skip that step, as
> +	 * it seems better to have one successfully connected sensor.
> +	 */
> +
> +	if (ret == -EPROBE_DEFER)
> +		cio2_bridge_unregister_sensors();
> +
> +	return ret;
> +}
> +
> +int cio2_bridge_build(struct pci_dev *cio2)
> +{
> +	struct fwnode_handle *fwnode;
> +	int ret;
> +
> +	pci_dev_get(cio2);
> +
> +	ret = software_node_register(&cio2_hid_node);
> +	if (ret < 0) {
> +		dev_err(&cio2->dev, "Failed to register the CIO2 HID node\n");
> +		goto err_put_cio2;
> +	}
> +
> +	ret = connect_supported_devices(cio2);
> +	if (ret == -EPROBE_DEFER)
> +		goto err_unregister_cio2;
> +
> +	if (bridge.n_sensors == 0) {
> +		ret = -EPROBE_DEFER;
> +		goto err_unregister_cio2;
> +	}
> +
> +	dev_info(&cio2->dev, "Connected %d cameras\n", bridge.n_sensors);
> +
> +	fwnode = software_node_fwnode(&cio2_hid_node);
> +	if (!fwnode) {
> +		dev_err(&cio2->dev,
> +			"Error getting fwnode from cio2 software_node\n");
> +		ret = -ENODEV;
> +		goto err_unregister_sensors;
> +	}
> +
> +	set_secondary_fwnode(&cio2->dev, fwnode);
> +
> +	return 0;
> +
> +err_unregister_sensors:
> +	cio2_bridge_unregister_sensors();
> +err_unregister_cio2:
> +	software_node_unregister(&cio2_hid_node);
> +err_put_cio2:
> +	pci_dev_put(cio2);
> +
> +	return ret;
> +}
> +
> +void cio2_bridge_burn(struct pci_dev *cio2)

Interesting function name :-) I like the creativity, but I think
consistency with the rest of the kernel code should unfortunately be
favoured.

> +{
> +	pci_dev_put(cio2);
> +
> +	cio2_bridge_unregister_sensors();
> +
> +	software_node_unregister(&cio2_hid_node);
> +}
> diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.h b/drivers/media/pci/intel/ipu3/cio2-bridge.h
> new file mode 100644
> index 000000000..077354ca8
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.h
> @@ -0,0 +1,94 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Author: Dan Scally <djrscally@gmail.com> */
> +#ifndef __CIO2_BRIDGE_H
> +#define __CIO2_BRIDGE_H
> +
> +#define MAX_CONNECTED_DEVICES			4
> +#define SWNODE_SENSOR_HID			0
> +#define SWNODE_SENSOR_PORT			1
> +#define SWNODE_SENSOR_ENDPOINT			2
> +#define SWNODE_CIO2_PORT			3
> +#define SWNODE_CIO2_ENDPOINT			4
> +#define SWNODE_NULL_TERMINATOR			5
> +
> +#define CIO2_HID				"INT343E"
> +#define CIO2_PCI_ID				0x9d32
> +
> +#define ENDPOINT_SENSOR				0
> +#define ENDPOINT_CIO2				1
> +
> +#define NODE_SENSOR(_HID, _PROPS)		\
> +	((const struct software_node) {		\
> +		.name = _HID,			\
> +		.properties = _PROPS,		\
> +	})
> +
> +#define NODE_PORT(_PORT, _SENSOR_NODE)		\
> +	((const struct software_node) {		\
> +		_PORT,				\
> +		_SENSOR_NODE,			\
> +	})
> +
> +#define NODE_ENDPOINT(_EP, _PORT, _PROPS)	\
> +	((const struct software_node) {		\
> +		_EP,				\
> +		_PORT,				\
> +		_PROPS,				\
> +	})
> +
> +struct sensor {

That's a very common name, prone to namespace clashes. How about naming
it cio2_sensor ?

> +	char name[ACPI_ID_LEN];
> +	struct device *dev;
> +	struct acpi_device *adev;
> +	struct software_node swnodes[6];
> +	struct property_entry dev_properties[3];
> +	struct property_entry ep_properties[4];
> +	struct property_entry cio2_properties[3];
> +	u32 *data_lanes;
> +};
> +
> +struct cio2_bridge {
> +	int n_sensors;

This can never be negative, I would make it an unsigned int.

> +	struct sensor sensors[MAX_CONNECTED_DEVICES];
> +};
> +
> +/* Data representation as it is in ACPI SSDB buffer */
> +struct sensor_bios_data_packed {

Similarly as above, I'd use a cio2_ prefix, and I think you can drop the
_packed suffix. How about naming it cio2_sensor_ssdb_data (or even just
cio2_sensor_ssdb) to make it clearer that it contains the SSDB data ?

> +	u8 version;
> +	u8 sku;
> +	u8 guid_csi2[16];
> +	u8 devfunction;
> +	u8 bus;
> +	u32 dphylinkenfuses;
> +	u32 clockdiv;
> +	u8 link;
> +	u8 lanes;
> +	u32 csiparams[10];
> +	u32 maxlanespeed;
> +	u8 sensorcalibfileidx;
> +	u8 sensorcalibfileidxInMBZ[3];
> +	u8 romtype;
> +	u8 vcmtype;
> +	u8 platforminfo;
> +	u8 platformsubinfo;
> +	u8 flash;
> +	u8 privacyled;
> +	u8 degree;
> +	u8 mipilinkdefined;
> +	u32 mclkspeed;
> +	u8 controllogicid;
> +	u8 reserved1[3];
> +	u8 mclkport;
> +	u8 reserved2[13];
> +} __packed__;
> +
> +/* Fields needed by bridge driver */
> +struct sensor_bios_data {

And cio2_sensor_data ?

> +	struct device *dev;
> +	u8 link;
> +	u8 lanes;
> +	u8 degree;
> +	u32 mclkspeed;
> +};
> +
> +#endif
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> index f68ef0f6b..827457110 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> @@ -1715,9 +1715,27 @@ static void cio2_queues_exit(struct cio2_device *cio2)
>  static int cio2_pci_probe(struct pci_dev *pci_dev,
>  			  const struct pci_device_id *id)
>  {
> +	struct fwnode_handle *endpoint;
>  	struct cio2_device *cio2;
>  	int r;
>  
> +	/*
> +	 * On some platforms no connections to sensors are defined in firmware,
> +	 * if the device has no endpoints then we can try to build those as
> +	 * software_nodes parsed from SSDB.
> +	 *
> +	 * This may EPROBE_DEFER if supported devices are found defined in ACPI
> +	 * but not yet ready for use (either not attached to the i2c bus yet,
> +	 * or not done probing themselves).

Why do we need for the I2C devices to be probed, isn't it enough to have
them created ?

> +	 */
> +
> +	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&pci_dev->dev), NULL);
> +	if (!endpoint) {
> +		r = cio2_bridge_build(pci_dev);
> +		if (r)
> +			return r;
> +	}
> +
>  	cio2 = devm_kzalloc(&pci_dev->dev, sizeof(*cio2), GFP_KERNEL);
>  	if (!cio2)
>  		return -ENOMEM;
> @@ -1825,6 +1843,9 @@ static void cio2_pci_remove(struct pci_dev *pci_dev)
>  {
>  	struct cio2_device *cio2 = pci_get_drvdata(pci_dev);
>  
> +	if (is_software_node(dev_fwnode(&pci_dev->dev)))
> +		cio2_bridge_burn(pci_dev);
> +
>  	media_device_unregister(&cio2->media_dev);
>  	v4l2_async_notifier_unregister(&cio2->notifier);
>  	v4l2_async_notifier_cleanup(&cio2->notifier);
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> index 549b08f88..80a081d7e 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> @@ -436,4 +436,13 @@ static inline struct cio2_queue *vb2q_to_cio2_queue(struct vb2_queue *vq)
>  	return container_of(vq, struct cio2_queue, vbq);
>  }
>  
> +#if IS_ENABLED(CONFIG_CIO2_BRIDGE)
> +	int cio2_bridge_build(struct pci_dev *cio2);
> +	void cio2_bridge_burn(struct pci_dev *cio2);

No need for an extra indentation level, neither here, not below.

> +#else
> +

NO need for this blank line.

> +	int cio2_bridge_build(struct pci_dev *cio2) { return 0; }
> +	void cio2_bridge_burn(struct pci_dev *cio2) { }
> +#endif
> +
>  #endif

-- 
Regards,

Laurent Pinchart
