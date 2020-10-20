Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1461E293853
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 11:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393046AbgJTJkS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 05:40:18 -0400
Received: from mga07.intel.com ([134.134.136.100]:58427 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393042AbgJTJkS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 05:40:18 -0400
IronPort-SDR: OOzruHw8s9oic2cChGvAa41eiLNwuguTKGgfFdVKR8uhpMtAAV5ofbLYA7TFJ5KP4muXgfr2S5
 kisxWbC8vQIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="231376581"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="231376581"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 02:40:17 -0700
IronPort-SDR: 5Uh55ycSJhDkgLEIrnC2436N5bDhMHulZkj7Yp0KiSFWMHfW3YngzITnCQRu4we93lXoRdthlC
 pHCy+vJ4JkcA==
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="315973862"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 02:40:12 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kUo8n-00BKcA-Mv; Tue, 20 Oct 2020 12:41:13 +0300
Date:   Tue, 20 Oct 2020 12:41:13 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        pmladek@suse.com, mchehab@kernel.org, tian.shu.qiu@intel.com,
        bingbu.cao@intel.com, sakari.ailus@linux.intel.com,
        yong.zhi@intel.com, rafael@kernel.org, gregkh@linuxfoundation.org,
        kitakar@gmail.com, dan.carpenter@oracle.org
Subject: Re: [RFC PATCH v3 9/9] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
Message-ID: <20201020094113.GG4077@smile.fi.intel.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-10-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019225903.14276-10-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 19, 2020 at 11:59:03PM +0100, Daniel Scally wrote:
> Currently on platforms designed for Windows, connections between CIO2 and
> sensors are not properly defined in DSDT. This patch extends the ipu3-cio2
> driver to compensate by building software_node connections, parsing the
> connection properties from the sensor's SSDB buffer.

...

> +	  	- Some Microsoft Surface models

Perhaps an example? Like '(e.g. Surface Book)'

> +		- The Lenovo Miix line

Ditto.

> +		- Dell 7285

...

> +#include <linux/acpi.h>
> +#include <linux/device.h>

> +#include <linux/fwnode.h>

This is implied by property.h, no need to have an explicit inclusion.

> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/property.h>
> +#include <media/v4l2-subdev.h>

...

> +static const char * const port_names[] = {
> +	"port0", "port1", "port2", "port3"

+ comma.

> +};

...

> +static int read_acpi_block(struct device *dev, char *id, void *data, u32 size)
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

"not an ACPI buffer"

> +		ret = -ENODEV;

> +		goto out_free_buff;
> +	}
> +
> +	if (obj->buffer.length > size) {
> +		dev_err(dev, "Given buffer is too small\n");

> +		ret = -ENODEV;

-EINVAL?

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

...

> +	/* device fwnode properties */
> +	memset(dev_properties, 0, sizeof(struct property_entry) * 3);

3 -> sizeof(...) ?
Same Q to other similar cases.

...

> +	sensor->data_lanes = kmalloc_array(ssdb->lanes, sizeof(u32),
> +					   GFP_KERNEL);

Perhaps one line?

> +

Redundant blank line.

> +	if (!sensor->data_lanes)
> +		return -ENOMEM;

...

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
> +	for (i = 0; i < ARRAY_SIZE(supported_devices); i++) {
> +		adev = acpi_dev_get_first_match_dev(supported_devices[i], NULL, -1);
> +		if (!adev)
> +			continue;
> +
> +		dev = bus_find_device_by_acpi_dev(&i2c_bus_type, adev);
> +		if (!dev) {
> +			ret = -EPROBE_DEFER;
> +			goto err_rollback;
> +		}
> +
> +		sensor = &bridge.sensors[bridge.n_sensors];
> +		sensor->dev = dev;
> +		sensor->adev = adev;

> +		snprintf(sensor->name, ACPI_ID_LEN, "%s",
> +			 supported_devices[i]);

One line?

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

> +		dev_info(&cio2->dev, "Found supported device %s\n",
> +			 supported_devices[i]);

One line?

(In both cases you can use temporary variable to keep supported_devices[i])

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

	struct device *dev = &cio2->dev;

will help to clean the code below.

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

One line (after above change)

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
> +{
> +	pci_dev_put(cio2);
> +
> +	cio2_bridge_unregister_sensors();
> +
> +	software_node_unregister(&cio2_hid_node);
> +}

I would rather name them like
build -> init / register / ...
burn -> clean / unregister / ...

...

> +#ifndef __CIO2_BRIDGE_H
> +#define __CIO2_BRIDGE_H

Missed inclusion that defines struct software_nodes type.

And so on. This file is consumer of some types and you need either to include
corresponding headers, or provide a forward declarations (for example, no need
to include device.h or acpi.h AFAICS).

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
> +	struct sensor sensors[MAX_CONNECTED_DEVICES];
> +};
> +
> +/* Data representation as it is in ACPI SSDB buffer */
> +struct sensor_bios_data_packed {
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
> +	struct device *dev;
> +	u8 link;
> +	u8 lanes;
> +	u8 degree;
> +	u32 mclkspeed;
> +};

...

> +	/*
> +	 * On some platforms no connections to sensors are defined in firmware,
> +	 * if the device has no endpoints then we can try to build those as
> +	 * software_nodes parsed from SSDB.
> +	 *
> +	 * This may EPROBE_DEFER if supported devices are found defined in ACPI
> +	 * but not yet ready for use (either not attached to the i2c bus yet,
> +	 * or not done probing themselves).
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

> +	if (is_software_node(dev_fwnode(&pci_dev->dev)))

Can we use the same check as for _build call above?

> +		cio2_bridge_burn(pci_dev);

-- 
With Best Regards,
Andy Shevchenko


