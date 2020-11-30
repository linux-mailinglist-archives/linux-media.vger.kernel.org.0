Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B80B2C8F50
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 21:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730140AbgK3Uhi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 15:37:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbgK3Uhh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 15:37:37 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA666C0613D2;
        Mon, 30 Nov 2020 12:36:56 -0800 (PST)
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 8DEA3634C24;
        Mon, 30 Nov 2020 22:35:51 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kjpto-0002hN-05; Mon, 30 Nov 2020 22:35:52 +0200
Date:   Mon, 30 Nov 2020 22:35:51 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 13/18] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
Message-ID: <20201130203551.GP4351@valkosipuli.retiisi.org.uk>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-14-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130133129.1024662-14-djrscally@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Thanks for the update! This is starting to look really nice!

Please still see my comments below.

On Mon, Nov 30, 2020 at 01:31:24PM +0000, Daniel Scally wrote:
> Currently on platforms designed for Windows, connections between CIO2 and
> sensors are not properly defined in DSDT. This patch extends the ipu3-cio2
> driver to compensate by building software_node connections, parsing the
> connection properties from the sensor's SSDB buffer.
> 
> Suggested-by: Jordan Hand <jorhand@linux.microsoft.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes since RFC v3:
> 
> 	- Removed almost all global variables, dynamically allocated
> 	the cio2_bridge structure, plus a bunch of associated changes
> 	like 
> 	- Added a new function to ipu3-cio2-main.c to check for an 
> 	existing fwnode_graph before calling cio2_bridge_init()
> 	- Prefixed cio2_bridge_ to any variables and functions that
> 	lacked it
> 	- Assigned the new fwnode directly to the sensor's ACPI device
> 	fwnode as secondary. This removes the requirement to delay until
> 	the I2C devices are instantiated before ipu3-cio2 can probe, but
> 	it has a side effect, which is that those devices then grab a ref
> 	to the new software_node. This effectively prevents us from
> 	unloading the driver, because we can't free the memory that they
> 	live in whilst the device holds a reference to them. The work
> 	around at the moment is to _not_ unregister the software_nodes
> 	when ipu3-cio2 is unloaded; this becomes a one-time 'patch', that
> 	is simply skipped if the module is reloaded.
> 	- Moved the sensor's SSDB struct to be a member of cio2_sensor
> 	- Replaced ints with unsigned ints where appropriate
> 	- Iterated over all ACPI devices of a matching _HID rather than
> 	just the first to ensure we handle a device with multiple sensors
> 	of the same model.
> 
>  MAINTAINERS                                   |   1 +
>  drivers/media/pci/intel/ipu3/Kconfig          |  18 ++
>  drivers/media/pci/intel/ipu3/Makefile         |   1 +
>  drivers/media/pci/intel/ipu3/cio2-bridge.c    | 260 ++++++++++++++++++
>  drivers/media/pci/intel/ipu3/cio2-bridge.h    | 108 ++++++++
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  27 ++
>  drivers/media/pci/intel/ipu3/ipu3-cio2.h      |   6 +
>  7 files changed, 421 insertions(+)
>  create mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.c
>  create mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9702b886d6a4..188559a0a610 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8927,6 +8927,7 @@ INTEL IPU3 CSI-2 CIO2 DRIVER
>  M:	Yong Zhi <yong.zhi@intel.com>
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  M:	Bingbu Cao <bingbu.cao@intel.com>
> +M:	Dan Scally <djrscally@gmail.com>
>  R:	Tianshu Qiu <tian.shu.qiu@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> diff --git a/drivers/media/pci/intel/ipu3/Kconfig b/drivers/media/pci/intel/ipu3/Kconfig
> index 82d7f17e6a02..2b3350d042be 100644
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
> +	  	- Microsoft Surface models (except Surface Pro 3)
> +		- The Lenovo Miix line (for example the 510, 520, 710 and 720)
> +		- Dell 7285
> +
> +	  If in doubt, say N here.
> diff --git a/drivers/media/pci/intel/ipu3/Makefile b/drivers/media/pci/intel/ipu3/Makefile
> index 429d516452e4..933777e6ea8a 100644
> --- a/drivers/media/pci/intel/ipu3/Makefile
> +++ b/drivers/media/pci/intel/ipu3/Makefile
> @@ -2,3 +2,4 @@
>  obj-$(CONFIG_VIDEO_IPU3_CIO2) += ipu3-cio2.o
>  
>  ipu3-cio2-y += ipu3-cio2-main.o
> +ipu3-cio2-$(CONFIG_CIO2_BRIDGE) += cio2-bridge.o
> diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> new file mode 100644
> index 000000000000..fd3f8ba07274
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> @@ -0,0 +1,260 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Author: Dan Scally <djrscally@gmail.com> */
> +#include <linux/acpi.h>
> +#include <linux/device.h>
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
> + * Extend this array with ACPI Hardware ID's of devices known to be working.
> + * Do not add a HID for a sensor that is not actually supported.
> + */
> +static const char * const cio2_supported_devices[] = {
> +	"INT33BE",
> +	"OVTI2680",

I guess we don't have the known-good frequencies for the CSI-2 bus in
firmware?

One option would be to put there what the drivers currently use. This
assumes the support for these devices is, well, somewhat opportunistic but
I guess there's no way around that right now at least.

As the systems are laptops, they're likely somewhat less prone to EMI
issues to begin with than mobile phones anyway.

> +};
> +
> +static int cio2_bridge_read_acpi_buffer(struct acpi_device *adev, char *id,
> +					void *data, u32 size)
> +{
> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *obj;
> +	acpi_status status;
> +	int ret;
> +
> +	status = acpi_evaluate_object(adev->handle, id, NULL, &buffer);
> +	if (ACPI_FAILURE(status))
> +		return -ENODEV;
> +
> +	obj = buffer.pointer;
> +	if (!obj) {
> +		dev_err(&adev->dev, "Couldn't locate ACPI buffer\n");
> +		return -ENODEV;
> +	}
> +
> +	if (obj->type != ACPI_TYPE_BUFFER) {
> +		dev_err(&adev->dev, "Not an ACPI buffer\n");
> +		ret = -ENODEV;
> +		goto out_free_buff;
> +	}
> +
> +	if (obj->buffer.length > size) {
> +		dev_err(&adev->dev, "Given buffer is too small\n");
> +		ret = -EINVAL;
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
> +static void cio2_bridge_init_property_names(struct cio2_sensor *sensor)
> +{
> +	strcpy(sensor->prop_names.clock_frequency, "clock-frequency");
> +	strcpy(sensor->prop_names.rotation, "rotation");
> +	strcpy(sensor->prop_names.bus_type, "bus-type");
> +	strcpy(sensor->prop_names.data_lanes, "data-lanes");
> +	strcpy(sensor->prop_names.remote_endpoint, "remote-endpoint");

Please use the actual field size instead with strncpy / strscpy.

> +}
> +
> +static void cio2_bridge_create_fwnode_properties(struct cio2_sensor *sensor)
> +{
> +	unsigned int i;
> +
> +	cio2_bridge_init_property_names(sensor);
> +
> +	for (i = 0; i < 4; i++)
> +		sensor->data_lanes[i] = i + 1;
> +
> +	/*
> +	 * Can't use PROPERTY_ENTRY_REF because it creates a new variable to
> +	 * point to, which doesn't survive the function.
> +	 */
> +	sensor->local_ref[0] = (struct software_node_ref_args){
> +		.node = &sensor->swnodes[SWNODE_CIO2_ENDPOINT]
> +		};

I guess this line should be unindented by one tab stop. Same for the
similar case below.

> +	sensor->remote_ref[0] = (struct software_node_ref_args){
> +		.node = &sensor->swnodes[SWNODE_SENSOR_ENDPOINT]
> +		};
> +
> +	sensor->dev_properties[0] = PROPERTY_ENTRY_U32(sensor->prop_names.clock_frequency,
> +						       sensor->ssdb.mclkspeed);
> +	sensor->dev_properties[1] = PROPERTY_ENTRY_U8(sensor->prop_names.rotation,
> +						      sensor->ssdb.degree);
> +
> +	sensor->ep_properties[0] = PROPERTY_ENTRY_U32(sensor->prop_names.bus_type, 5);
> +	sensor->ep_properties[1] = PROPERTY_ENTRY_U32_ARRAY_LEN(sensor->prop_names.data_lanes,
> +								sensor->data_lanes,
> +								sensor->ssdb.lanes);
> +	sensor->ep_properties[2] = PROPERTY_ENTRY_REF_ARRAY(sensor->prop_names.remote_endpoint,
> +							    sensor->local_ref);
> +
> +	sensor->cio2_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(sensor->prop_names.data_lanes,
> +								  sensor->data_lanes,
> +								  sensor->ssdb.lanes);
> +	sensor->cio2_properties[1] = PROPERTY_ENTRY_REF_ARRAY(sensor->prop_names.remote_endpoint,
> +							      sensor->remote_ref);
> +}
> +
> +static void cio2_bridge_init_swnode_names(struct cio2_sensor *sensor)
> +{
> +	snprintf(sensor->node_names.remote_port, 6, "port%u", sensor->ssdb.link);
> +	strcpy(sensor->node_names.port, "port0");
> +	strcpy(sensor->node_names.endpoint, "endpoint0");

Please use the actual size of the field, and strncpy / strscpy.

> +}
> +
> +static void cio2_bridge_create_connection_swnodes(struct cio2_bridge *bridge,
> +						  struct cio2_sensor *sensor)
> +{
> +	struct software_node *nodes = sensor->swnodes;
> +
> +	cio2_bridge_init_swnode_names(sensor);
> +
> +	nodes[SWNODE_SENSOR_HID] = NODE_SENSOR(sensor->name,
> +					       sensor->dev_properties);
> +	nodes[SWNODE_SENSOR_PORT] = NODE_PORT(sensor->node_names.port,
> +					      &nodes[SWNODE_SENSOR_HID]);
> +	nodes[SWNODE_SENSOR_ENDPOINT] = NODE_ENDPOINT(sensor->node_names.endpoint,
> +						      &nodes[SWNODE_SENSOR_PORT],
> +						      sensor->ep_properties);
> +	nodes[SWNODE_CIO2_PORT] = NODE_PORT(sensor->node_names.remote_port,
> +					    &bridge->cio2_hid_node);
> +	nodes[SWNODE_CIO2_ENDPOINT] = NODE_ENDPOINT(sensor->node_names.endpoint,
> +						    &nodes[SWNODE_CIO2_PORT],
> +						    sensor->cio2_properties);
> +}
> +
> +static void cio2_bridge_unregister_sensors(struct cio2_bridge *bridge)
> +{
> +	struct cio2_sensor *sensor;
> +	unsigned int i;
> +
> +	for (i = 0; i < bridge->n_sensors; i++) {
> +		sensor = &bridge->sensors[i];
> +		software_node_unregister_nodes(sensor->swnodes);
> +		acpi_dev_put(sensor->adev);
> +	}
> +}
> +
> +static int cio2_bridge_connect_sensors(struct cio2_bridge *bridge)
> +{
> +	struct fwnode_handle *fwnode;
> +	struct cio2_sensor *sensor;
> +	struct acpi_device *adev;
> +	unsigned int i;
> +	int ret = 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(cio2_supported_devices); i++) {
> +		const char *this_device = cio2_supported_devices[i];
> +
> +		for_each_acpi_dev_match(adev, this_device, NULL, -1) {
> +			if (!adev || !(adev->status.present && adev->status.enabled))
> +				continue;
> +
> +			sensor = &bridge->sensors[bridge->n_sensors];
> +			sensor->adev = adev;
> +			strscpy(sensor->name, this_device, sizeof(sensor->name));
> +
> +			ret = cio2_bridge_read_acpi_buffer(adev, "SSDB",
> +							   &sensor->ssdb,
> +							   sizeof(sensor->ssdb));
> +			if (ret < 0)
> +				goto err_put_adev;
> +
> +			if (sensor->ssdb.lanes > 4) {
> +				dev_err(&adev->dev,
> +					"Number of lanes in SSDB is invalid\n");
> +				goto err_put_adev;
> +			}
> +
> +			cio2_bridge_create_fwnode_properties(sensor);
> +			cio2_bridge_create_connection_swnodes(bridge, sensor);
> +
> +			ret = software_node_register_nodes(sensor->swnodes);
> +			if (ret)
> +				goto err_put_adev;
> +
> +			fwnode = software_node_fwnode(&sensor->swnodes[SWNODE_SENSOR_HID]);
> +			if (!fwnode) {
> +				ret = -ENODEV;
> +				goto err_free_swnodes;
> +			}
> +
> +			adev->fwnode.secondary = fwnode;
> +
> +			dev_info(&bridge->cio2->dev,
> +				 "Found supported sensor %s\n",
> +				 acpi_dev_name(adev));
> +
> +			bridge->n_sensors++;
> +		}
> +	}
> +
> +	return ret;
> +
> +err_free_swnodes:
> +	software_node_unregister_nodes(sensor->swnodes);
> +err_put_adev:
> +	acpi_dev_put(sensor->adev);
> +
> +	return ret;
> +}
> +
> +int cio2_bridge_init(struct pci_dev *cio2)
> +{
> +	struct device *dev = &cio2->dev;
> +	struct fwnode_handle *fwnode;
> +	struct cio2_bridge *bridge;
> +	int ret;
> +
> +	bridge = kzalloc(sizeof(*bridge), GFP_KERNEL);
> +	if (!bridge)
> +		return -ENOMEM;
> +
> +	strscpy(bridge->cio2_node_name, CIO2_HID, sizeof(bridge->cio2_node_name));
> +	bridge->cio2_hid_node = (const struct software_node){ bridge->cio2_node_name };
> +	bridge->cio2 = pci_dev_get(cio2);
> +
> +	ret = software_node_register(&bridge->cio2_hid_node);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to register the CIO2 HID node\n");
> +		goto err_put_cio2;
> +	}
> +
> +	ret = cio2_bridge_connect_sensors(bridge);
> +	if (ret || bridge->n_sensors == 0)
> +		goto err_unregister_cio2;
> +
> +	dev_info(dev, "Connected %d cameras\n", bridge->n_sensors);
> +
> +	fwnode = software_node_fwnode(&bridge->cio2_hid_node);
> +	if (!fwnode) {
> +		dev_err(dev, "Error getting fwnode from cio2 software_node\n");
> +		ret = -ENODEV;
> +		goto err_unregister_sensors;
> +	}
> +
> +	set_secondary_fwnode(dev, fwnode);
> +
> +	return 0;
> +
> +err_unregister_sensors:
> +	cio2_bridge_unregister_sensors(bridge);
> +err_unregister_cio2:
> +	software_node_unregister(&bridge->cio2_hid_node);
> +err_put_cio2:
> +	pci_dev_put(bridge->cio2);
> +
> +	kfree(bridge);
> +	return ret;
> +}
> diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.h b/drivers/media/pci/intel/ipu3/cio2-bridge.h
> new file mode 100644
> index 000000000000..96f5c8a12be0
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.h
> @@ -0,0 +1,108 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Author: Dan Scally <djrscally@gmail.com> */
> +#ifndef __CIO2_BRIDGE_H
> +#define __CIO2_BRIDGE_H
> +
> +#include <linux/property.h>
> +
> +#define CIO2_HID				"INT343E"
> +#define CIO2_NUM_PORTS			  4
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
> +enum cio2_sensor_swnodes {
> +	SWNODE_SENSOR_HID,
> +	SWNODE_SENSOR_PORT,
> +	SWNODE_SENSOR_ENDPOINT,
> +	SWNODE_CIO2_PORT,
> +	SWNODE_CIO2_ENDPOINT,
> +	NR_OF_SENSOR_SWNODES
> +};
> +
> +/* Data representation as it is in ACPI SSDB buffer */
> +struct cio2_sensor_ssdb {
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

This should be "__packed".

> +
> +struct cio2_property_names {
> +	char clock_frequency[16];
> +	char rotation[9];
> +	char bus_type[9];
> +	char data_lanes[11];
> +	char remote_endpoint[16];
> +};
> +
> +struct cio2_node_names {
> +	char port[6];
> +	char endpoint[10];
> +	char remote_port[6];
> +};
> +
> +struct cio2_sensor {
> +	char name[ACPI_ID_LEN];
> +	struct acpi_device *adev;
> +
> +	struct software_node swnodes[6];
> +	struct cio2_node_names node_names;
> +
> +	u32 data_lanes[4];
> +	struct cio2_sensor_ssdb ssdb;
> +	struct cio2_property_names prop_names;
> +	struct property_entry ep_properties[4];
> +	struct property_entry dev_properties[3];
> +	struct property_entry cio2_properties[3];
> +	struct software_node_ref_args local_ref[1];
> +	struct software_node_ref_args remote_ref[1];
> +};
> +
> +struct cio2_bridge {
> +	struct pci_dev *cio2;
> +	char cio2_node_name[ACPI_ID_LEN];
> +	struct software_node cio2_hid_node;
> +	unsigned int n_sensors;
> +	struct cio2_sensor sensors[CIO2_NUM_PORTS];
> +};
> +
> +#endif
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> index 36e354ecf71e..0d69b593e9f0 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> @@ -1702,6 +1702,22 @@ static void cio2_queues_exit(struct cio2_device *cio2)
>  		cio2_queue_exit(cio2, &cio2->queue[i]);
>  }
>  
> +static bool cio2_check_fwnode_graph(struct fwnode_handle *fwnode)
> +{
> +	struct fwnode_handle *endpoint;
> +
> +	if (IS_ERR_OR_NULL(fwnode))
> +		return false;
> +
> +	endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (endpoint) {
> +		fwnode_handle_put(endpoint);
> +		return true;
> +	}
> +
> +	return cio2_check_fwnode_graph(fwnode->secondary);
> +}
> +
>  /**************** PCI interface ****************/
>  
>  static int cio2_pci_probe(struct pci_dev *pci_dev,
> @@ -1715,6 +1731,17 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>  		return -ENOMEM;
>  	cio2->pci_dev = pci_dev;
>  
> +	/*
> +	 * On some platforms no connections to sensors are defined in firmware,
> +	 * if the device has no endpoints then we can try to build those as
> +	 * software_nodes parsed from SSDB.
> +	 */
> +	if (!cio2_check_fwnode_graph(dev_fwnode(&pci_dev->dev))) {
> +		r = cio2_bridge_init(pci_dev);
> +		if (r)
> +			return r;
> +	}
> +
>  	r = pcim_enable_device(pci_dev);
>  	if (r) {
>  		dev_err(&pci_dev->dev, "failed to enable device (%d)\n", r);
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> index ccf0b85ae36f..520a27c9cdad 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> @@ -437,4 +437,10 @@ static inline struct cio2_queue *vb2q_to_cio2_queue(struct vb2_queue *vq)
>  	return container_of(vq, struct cio2_queue, vbq);
>  }
>  
> +#if IS_ENABLED(CONFIG_CIO2_BRIDGE)
> +int cio2_bridge_init(struct pci_dev *cio2);
> +#else
> +int cio2_bridge_init(struct pci_dev *cio2) { return 0; }
> +#endif
> +
>  #endif

-- 
Kind regards,

Sakari Ailus
