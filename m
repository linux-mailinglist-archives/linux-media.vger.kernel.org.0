Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A25E28058D
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 19:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732642AbgJARiF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 13:38:05 -0400
Received: from mga01.intel.com ([192.55.52.88]:64227 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732096AbgJARiE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Oct 2020 13:38:04 -0400
IronPort-SDR: 3aEzl187tYHCwCSt8LP+voKWDGSUiAKdsh529Ce4wq+c7XJEKLXrRiSmgOHQv89ruC5S+6Pxne
 UFDa9hVRgA+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="180943461"
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; 
   d="scan'208";a="180943461"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2020 10:37:55 -0700
IronPort-SDR: KKCd9i6UVqM2SJuZsWgW1xlUx+Bdyiz09TnjnO7X6E1Fsskd4YDs/1gKeh9PI+tcCE2XFhjY0v
 v9mIKz+gtyFw==
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; 
   d="scan'208";a="351226220"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2020 10:37:51 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kO2WX-003H3Z-LI; Thu, 01 Oct 2020 20:37:45 +0300
Date:   Thu, 1 Oct 2020 20:37:45 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        davem@davemloft.net, robh@kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        kieran.bingham@ideasonboard.com, dan.carpenter@oracle.com
Subject: Re: [RFC PATCH v2] Add functionality to ipu3-cio2 driver allowing
 software_node connections to sensors on platforms designed for Windows
Message-ID: <20201001173745.GJ3956970@smile.fi.intel.com>
References: <20201001093326.6208-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201001093326.6208-1-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 01, 2020 at 10:33:26AM +0100, Daniel Scally wrote:

Awesome work!
My, almost minor, comments below.

> Currently on platforms designed for Windows, connections between CIO2 and
> sensors are not properly defined in DSDT. This patch extends the ipu3-cio2
> driver to compensate by building software_node connections, parsing the
> connection properties from the sensor's SSDB buffer. 

Drop trailing space here and in other places if any.

> Suggested-by: Jordan Hand <jorhand@linux.microsoft.com>
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

In the tag block should not be blank lines.

...

> * Built against media_tree instead of linus's tree - there's no T: entry in
> maintainers for the ipu3-cio2 driver but I see there're recent changes in 
> media_tree so thought this was the better option.

Make sense to include T: entry as well (maybe as a separate patch).

...

> +config CIO2_BRIDGE
> +	bool "IPU3 CIO2 Sensors Bridge"
> +	depends on VIDEO_IPU3_CIO2
> +	help
> +	  This extension provides an API for the ipu3-cio2 driver to create
> +	  connections to cameras that are hidden in SSDB buffer in ACPI. It
> +	  can be used to enable support for cameras in detachable / hybrid
> +	  devices that ship with Windows.
> +
> +	  Say y here if your device is a detachable / hybrid laptop that comes

y -> Y

> +	  with Windows installed by the OEM, for example the Microsoft Surface
> +	  line, Lenovo Miix line or Dell 7285.

Reads better in a form of an enumeration, like

		- Microsoft Surface (all existing)
		- Lenovo Miix (all existing)
		- Dell 7285

> +	  If in doubt, say n here.

n -> N

...

> -obj-$(CONFIG_VIDEO_IPU3_CIO2) += ipu3-cio2.o
> +obj-$(CONFIG_VIDEO_IPU3_CIO2) += ipu3-cio2-driver.o
> +
> +ipu3-cio2-driver-objs += ipu3-cio2.o
> +
> +ifeq ($(CONFIG_CIO2_BRIDGE), y)
> +ipu3-cio2-driver-objs += cio2-bridge.o
> +endif

objs is for userspace tools, here use

ipu3-cio2-driver-y += ipu3-cio2.o
ipu3-cio2-driver-$(CONFIG_CIO2_BRIDGE) = cio2-bridge.o

And actually would be nice to keep the name, so means rename ipu3-cio2.c to
something like cio2-main.c. In such case you will have:

obj-$(CONFIG_VIDEO_IPU3_CIO2) += ipu3-cio2.o

ipu3-cio2-y += cio2-main.o
ipu3-cio2-$(CONFIG_CIO2_BRIDGE) = cio2-bridge.o

...

> +// SPDX-License-Identifier: GPL-2.0

Author line perhaps?

...

> +/*
> + * Extend this array with ACPI Hardware ID's of devices known to be
> + * working
> + */

> +

Redundant blank like.

> +static const struct ipu3_sensor supported_devices[] = {
> +	IPU3_SENSOR("INT33BE", "INT33BE:00"),
> +	IPU3_SENSOR("OVTI2680", "OVTI2680:00"),
> +	IPU3_SENSOR("OVTI5648", "OVTI5648:00")

In such cases please leave comma at the last item as well. Easier to extend w/o
an additional churn.

On top of that, please avoid putting *instance* names, i.e. the second
parameters in your macro call. What code should do is to take _HID (first
parameter) and call acpi_dev_match_first_dev() or so.

> +};

> +static struct software_node cio2_hid_node = { CIO2_HID, };

Here, nevertheless, comma can be removed, since update will need to change
entire line anyway.

> +static const char * const port_names[] = {
> +	"port0", "port1", "port2", "port3"
> +};

+ Comma (can be prolonged in the next / previous lines).

...

> +static int read_acpi_block(struct device *dev, char *id, void *data, u32 size)
> +{
> +	union acpi_object *obj;
> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_handle *handle = ACPI_HANDLE(dev);
> +	acpi_status status;
> +	int ret;
> +
> +	status = acpi_evaluate_object(handle, id, NULL, &buffer);
> +	if (ACPI_FAILURE(status))
> +		return -ENODEV;
> +
> +	obj = buffer.pointer;
> +	if (!obj || obj->type != ACPI_TYPE_BUFFER) {

!obj case doesn't require freeing and I would say the error message can be
amended in such case.

> +		dev_err(dev, "Could't read acpi buffer\n");
> +		ret = -ENODEV;
> +		goto err_free_buff;
> +	}
> +
> +	if (obj->buffer.length > size) {
> +		dev_err(dev, "Given buffer is too small\n");
> +		ret = -ENODEV;
> +		goto err_free_buff;
> +	}
> +
> +	memcpy(data, obj->buffer.pointer, obj->buffer.length);

> +	kfree(buffer.pointer);
> +
> +	return obj->buffer.length;
> +err_free_buff:
> +	kfree(buffer.pointer);
> +	return ret;

This may be deduplicated by adding ret = obj->buffer.length; in the success
branch. In such case the label would be named out_free_buf.

> +}

...

> +static int create_fwnode_properties(struct sensor *sensor,
> +				    struct sensor_bios_data *ssdb)
> +{
> +	struct property_entry *ep_props;
> +	struct property_entry *cio2_props;
> +	struct property_entry *dev_props;
> +	u32 *data_lanes;
> +	int i;

> +	/* device fwnode properties */
> +	dev_props = kcalloc(3, sizeof(*dev_props), GFP_KERNEL);
> +	if (!dev_props)
> +		return -ENOMEM;
> +
> +	dev_props[0] = PROPERTY_ENTRY_U32("clock-frequency", ssdb->mclkspeed);
> +	dev_props[1] = PROPERTY_ENTRY_U8("rotation", ssdb->degree);
> +
> +	memcpy(sensor->dev_props, dev_props, sizeof(*dev_props) * 3);
> +	kfree(dev_props);

Why you can't do it on stack?

> +	/* endpoint fwnode properties */

> +

Redundant blank like

> +	data_lanes = devm_kmalloc_array(sensor->dev, ssdb->lanes, sizeof(u32),
> +					GFP_KERNEL);
> +
> +	if (!data_lanes)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ssdb->lanes; i++)
> +		data_lanes[i] = i + 1;

> +	ep_props = kcalloc(4, sizeof(*ep_props), GFP_KERNEL);
> +	if (!ep_props)
> +		return -ENOMEM;
> +
> +	ep_props[0] = PROPERTY_ENTRY_U32("bus-type", 5);
> +	ep_props[1] = PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes",
> +						   data_lanes,
> +						   ssdb->lanes);
> +	ep_props[2] = remote_endpoints[(bridge.n_sensors * 2) + ENDPOINT_SENSOR];
> +
> +	memcpy(sensor->ep_props, ep_props, sizeof(*ep_props) * 4);
> +	kfree(ep_props);

Why can't be done on stack?

> +
> +	/* cio2 endpoint props */
> +
> +	cio2_props = kcalloc(3, sizeof(*cio2_props), GFP_KERNEL);
> +	if (!cio2_props)
> +		return -ENOMEM;
> +
> +	cio2_props[0] = PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes",
> +						     data_lanes,
> +						     ssdb->lanes);
> +	cio2_props[1] = remote_endpoints[(bridge.n_sensors * 2) + ENDPOINT_CIO2];
> +
> +	memcpy(sensor->cio2_props, cio2_props, sizeof(*cio2_props) * 3);
> +	kfree(cio2_props);

Ditto.

Something like
	union {
		...
		cio2_properties[3];
	} properties;

	memset(properties, 0, sizeof(properties));

(and please spell properties instead of props)

> +	return 0;
> +}
> +
> +static int create_connection_swnodes(struct sensor *sensor,
> +				     struct sensor_bios_data *ssdb)
> +{
> +	struct software_node *nodes;
> +
> +	nodes = kcalloc(6, sizeof(*nodes), GFP_KERNEL);
> +	if (!nodes)
> +		return -ENOMEM;
> +
> +	nodes[SWNODE_SENSOR_HID] = NODE_SENSOR(sensor->name,
> +					       sensor->dev_props);
> +	nodes[SWNODE_SENSOR_PORT] = NODE_PORT("port0",
> +					      &sensor->swnodes[SWNODE_SENSOR_HID]);
> +	nodes[SWNODE_SENSOR_ENDPOINT] = NODE_ENDPOINT("endpoint0",
> +						      &sensor->swnodes[SWNODE_SENSOR_PORT],
> +						      sensor->ep_props);
> +	nodes[SWNODE_CIO2_PORT] = NODE_PORT(port_names[ssdb->link],
> +					    &cio2_hid_node);
> +	nodes[SWNODE_CIO2_ENDPOINT] = NODE_ENDPOINT("endpoint0",
> +						    &sensor->swnodes[SWNODE_CIO2_PORT],
> +						    sensor->cio2_props);
> +
> +	memcpy(sensor->swnodes, nodes, sizeof(*nodes) * 6);
> +	kfree(nodes);

Also, why not on stack?

> +	return 0;
> +}

...

> +		for (j = 4; j >= 0; j--)
> +			software_node_unregister(&sensor->swnodes[j]);

Seems we may need a simple helper for this (test_printf.c has similar case),
so, what about do it here for now and probably then move to somewhere like
swnode.h or whatever holds it.

static inline software_node_unregister_nodes_reverse(const struct software_node *nodes)
{
	unsigned int i = 0;

	while (nodes[i].name)
		i++;
	while (i--)
		software_node_unregister(&nodes[i]);
}

...

> +	client = container_of(sensor->dev, struct i2c_client, dev);

Shouldn't be rather i2c_verify_client() ?

...

> +	sensor->old_drv = container_of(sensor->dev->driver, struct i2c_driver,
> +				       driver);

to_i2c_driver() ?

...

> +	ret = 0;
> +

No need to have a blank line here (check other similar places in the code).

> +	for (i = 0; i < ARRAY_SIZE(supported_devices); i++) {

> +		adev = acpi_dev_get_first_match_dev(supported_devices[i].hid,
> +						    NULL, -1);

Keep it one line, easy to read.

> +		if (!adev)
> +			continue;
> +
> +		dev = bus_find_device_by_acpi_dev(&i2c_bus_type, adev);
> +		if (!dev) {
> +			ret = -EPROBE_DEFER;
> +			goto err_rollback;
> +		}
> +
> +		/*
> +		 * We need to clone the driver of any sensors that we connect,
> +		 * so if they're probing we need to wait until they're finished
> +		 */
> +
> +		if (dev->links.status == DL_DEV_PROBING) {
> +			ret = -EPROBE_DEFER;
> +			goto err_free_dev;
> +		}
> +
> +		/*
> +		 * If a sensor has no driver, we want to continue to try and
> +		 * link others
> +		 */
> +		sd = dev_get_drvdata(dev);
> +		if (!sd)
> +			goto cont_free_dev;
> +
> +		sensor = &bridge.sensors[bridge.n_sensors];
> +		sensor->dev = dev;
> +
> +		snprintf(sensor->name, 20, "%s", supported_devices[i].hid);

include/linux/mod_devicetable.h:454:#define I2C_NAME_SIZE       20

> +		sensor->fwnode = fwnode_handle_get(dev->fwnode);
> +		if (!sensor->fwnode)
> +			goto err_free_dev;
> +
> +		ret = get_acpi_ssdb_sensor_data(dev, &ssdb);
> +		if (ret)
> +			goto err_free_fwnode;
> +
> +		ret = create_fwnode_properties(sensor, &ssdb);
> +		if (ret)
> +			goto err_free_fwnode;
> +
> +		ret = create_connection_swnodes(sensor, &ssdb);
> +		if (ret)
> +			goto err_free_fwnode;
> +
> +		ret = software_node_register_nodes(sensor->swnodes);
> +		if (ret)
> +			goto err_free_fwnode;
> +
> +		fwnode = software_node_fwnode(&sensor->swnodes[SWNODE_SENSOR_HID]);
> +		if (!fwnode) {
> +			ret = -ENODEV;
> +			goto err_free_swnodes;
> +		}
> +
> +		fwnode->secondary = ERR_PTR(-ENODEV);
> +		dev->fwnode = fwnode;
> +
> +		ret = cio2_bridge_reprobe_sensor(sensor, i);
> +		if (ret)
> +			goto err_free_swnodes;

> +		pr_info("cio2-bridge: Found supported device %s\n",
> +			supported_devices[i].hid);

Use dev_*() [dev_info()] instead of pr_*() ones.

> +		bridge.n_sensors++;
> +		continue;
> +cont_free_dev:
> +		put_device(dev);
> +		continue;

> +err_free_swnodes:
> +		for (j = 4; j >= 0; j--)
> +			software_node_unregister(&sensor->swnodes[j]);

See above.

> +err_free_fwnode:
> +		fwnode_handle_put(sensor->fwnode);
> +err_free_dev:
> +		put_device(dev);
> +err_rollback:
> +		/*
> +		 * If an iteration of this loop results in -EPROBE_DEFER then
> +		 * we need to roll back any sensors that were successfully
> +		 * registered. Any other error and we'll skip that step, as
> +		 * it seems better to have one successfully connected sensor.
> +		 */
> +
> +		if (ret == -EPROBE_DEFER)
> +			cio2_bridge_unregister_sensors();
> +
> +		break;

This is (all err_* labels) invariant to the loop (you break it), so, move out
of the loop...

> +	}
> +
> +	return ret;

...somewhere here.


...

> +	ret = software_node_register(&cio2_hid_node);
> +	if (ret < 0) {

> +		pr_err("cio2-bridge: Failed to register the CIO2 HID node\n");

dev_err() and so on.

> +		goto err_put_cio2;
> +	}

...

> +#define __NO_VERSION__

What is this for?

...

> +#define NODE_SENSOR(_HID, _PROPS)		\
> +	((const struct software_node) {		\
> +		.name = _HID,			\
> +		.properties = _PROPS		\

Leave comma.

> +	})

...

> +#define IPU3_SENSOR(_HID, _CLIENT)		\
> +	{					\
> +		.hid = _HID,			\
> +		.i2c_id = {			\
> +			{_CLIENT, 0},		\

> +			{ },			\

No comma for terminator type of entries.

> +		}				\

Leave comma.

> +	}

...

> +struct ipu3_sensor {
> +	const char hid[20];

Shouldn't be rather 9?

#define ACPI_ID_LEN     9

> +	const struct i2c_device_id i2c_id[2];
> +};

...

> +struct sensor {
> +	char name[20];

I guess it's predefined by I²C ID.

> +	struct device *dev;
> +	struct software_node swnodes[6];
> +	struct property_entry dev_props[3];
> +	struct property_entry ep_props[4];
> +	struct property_entry cio2_props[3];

I'm now wondering why you can't simply put properties directly to here and do
that kcalloc / memcpy() in few functions? I mean to drop those calls and assign
properties directly. You even won't need to memset() and stack for them!

> +	struct fwnode_handle *fwnode;
> +	struct i2c_driver *old_drv;
> +	struct i2c_driver new_drv;
> +};

...

> +} __attribute__((__packed__));

__packed is enough (it's in compiler.h IIRC).

...

>  	struct cio2_device *cio2;
> +	struct fwnode_handle *endpoint;
>  	int r;

Reverse xmas tree order.

...

> +	endpoint = fwnode_graph_get_next_endpoint(pci_dev->dev.fwnode, NULL);

dev_fwnode()

> +	if (!endpoint) {
> +		r = cio2_bridge_build(pci_dev);
> +		if (r)
> +			return r;
> +	}

...

> +#ifdef CONFIG_CIO2_BRIDGE

IS_ENABLED()

> +
> +int cio2_bridge_build(struct pci_dev *cio2);
> +void cio2_bridge_burn(struct pci_dev *cio2);
> +
> +#else
> +
> +int cio2_bridge_build(struct pci_dev *cio2)
> +{
> +	return 0;
> +}

One line.

> +void cio2_bridge_burn(struct pci_dev *cio2)
> +{
> +}

One line.

> +#endif

-- 
With Best Regards,
Andy Shevchenko


