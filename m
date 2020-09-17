Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F91326D887
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 12:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbgIQKLB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 06:11:01 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:59170 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbgIQKKw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 06:10:52 -0400
X-Greylist: delayed 2154 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 06:10:49 EDT
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08H9Sted141913;
        Thu, 17 Sep 2020 09:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Dy7JruLml6rY7Iqh6Jkr3cah1a1fXKQ4/Pi1EOyI9xo=;
 b=bCFpGSJq2UuA0b05cxwX7UyGOvAQQGiJ73XLvXmsdWaXViwvWKFqGC9uzFgOqa+CwTt2
 iX0WzU5AmBpDkmcPtnIHjzf8fbxpjANXsU3MTWlC96fRwVDfHZT1jtclZP+vmIoaOE7N
 xWUi3/OnxSEUUPlWsyYH/3OsDxCLX7LxVJDolnrmBaBmW13vsWwbjiHoYIIOu5nDRSe2
 ivXSdPAUSM0L8Gzt089PeDcBxyr16kZhJWyTRClc94HalSntYqnzKKS7Z/G5QKbo3E2c
 eMc07JxBEXRF5qfxz61gJEXaDDVOAWYXJ0w1CJ5ux2N/vBYvpIKQTD8WK6uThmgNRP95 ZQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 33gp9mg2kw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 17 Sep 2020 09:34:27 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08H9U3Jg022844;
        Thu, 17 Sep 2020 09:34:27 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 33khpms1pj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Sep 2020 09:34:27 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08H9YHg2029130;
        Thu, 17 Sep 2020 09:34:17 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 17 Sep 2020 09:34:16 +0000
Date:   Thu, 17 Sep 2020 12:34:07 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, davem@davemloft.net, robh@kernel.org,
        devel@driverdev.osuosl.org, jorhand@linux.microsoft.com,
        kieran.bingham@ideasonboard.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, kitakar@gmail.com
Subject: Re: [RFC PATCH] Add bridge driver to connect sensors to CIO2 device
 via software nodes on ACPI platforms
Message-ID: <20200917093407.GK4282@kadam>
References: <20200916213618.8003-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916213618.8003-1-djrscally@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=8
 mlxlogscore=999 phishscore=0 mlxscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009170072
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=8 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009170072
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 16, 2020 at 10:36:18PM +0100, Daniel Scally wrote:
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 92f5eadf2c99..fd941d2c7581 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1719,6 +1719,59 @@ static void cio2_queues_exit(struct cio2_device *cio2)
>  		cio2_queue_exit(cio2, &cio2->queue[i]);
>  }
>  
> +static int cio2_probe_can_progress(struct pci_dev *pci_dev)
> +{
> +	void *sensor;
> +
> +	/*
> +	 * On ACPI platforms, we need to probe _after_ sensors wishing to connect
> +	 * to cio2 have added a device link. If there are no consumers yet, then
> +	 * we need to defer. The .sync_state() callback will then be called after
> +	 * all linked sensors have probed
> +	 */
> +
> +	if (IS_ENABLED(CONFIG_ACPI)) {

Reverse this condition.

	if (!IS_ENABLED(CONFIG_ACPI))
		return 0;


> +		sensor = (struct device *)list_first_entry_or_null(
> +								&pci_dev->dev.links.consumers,
> +								struct dev_links_info,
> +								consumers);
> +
> +		if (!sensor)
> +			return -EPROBE_DEFER;

Get rid of the cast.

	if (list_empty(&pci_dev->dev.links.consumers))
		return -EPROBE_DEFER;

	return 0;

> +	}
> +
> +	return 0;
> +}
> +
> +void cio2_sync_state(struct device *dev)
> +{
> +	struct cio2_device *cio2;
> +	int ret = 0;

Delete the initialization.

> +
> +	if (IS_ENABLED(CONFIG_ACPI)) {

Reverse.

> +		cio2 = dev_get_drvdata(dev);
> +
> +		if (!cio2) {

Delete the blank line between the call and the test.  They're part of
the same step.  "cio2" can't be NULL anyway, so delete the test.

> +			dev_err(dev, "Failed to retrieve driver data\n");
> +			return;
> +		}
> +
> +		/* insert the bridge driver to connect sensors via software nodes */
> +		ret = request_module("cio2-bridge");
> +
> +		if (ret)
> +			dev_err(dev, "Failed to insert cio2-bridge\n");
> +
> +		ret = cio2_parse_firmware(cio2);
> +
> +		if (ret) {
> +			v4l2_async_notifier_unregister(&cio2->notifier);
> +			v4l2_async_notifier_cleanup(&cio2->notifier);
> +			cio2_queues_exit(cio2);
> +		}
> +	}
> +}
> +
>  /**************** PCI interface ****************/
>  
>  static int cio2_pci_config_setup(struct pci_dev *dev)
> @@ -1746,6 +1799,11 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>  	void __iomem *const *iomap;
>  	int r;
>  
> +	r = cio2_probe_can_progress(pci_dev);
> +
> +	if (r)
> +		return -EPROBE_DEFER;
> +
>  	cio2 = devm_kzalloc(&pci_dev->dev, sizeof(*cio2), GFP_KERNEL);
>  	if (!cio2)
>  		return -ENOMEM;
> @@ -1821,9 +1879,11 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>  	v4l2_async_notifier_init(&cio2->notifier);
>  
>  	/* Register notifier for subdevices we care */
> -	r = cio2_parse_firmware(cio2);
> -	if (r)
> -		goto fail_clean_notifier;
> +	if (!IS_ENABLED(CONFIG_ACPI)) {
> +		r = cio2_parse_firmware(cio2);
> +		if (r)
> +			goto fail_clean_notifier;
> +	}
>  
>  	r = devm_request_irq(&pci_dev->dev, pci_dev->irq, cio2_irq,
>  			     IRQF_SHARED, CIO2_NAME, cio2);
> @@ -2052,6 +2112,7 @@ static struct pci_driver cio2_pci_driver = {
>  	.remove = cio2_pci_remove,
>  	.driver = {
>  		.pm = &cio2_pm_ops,
> +		.sync_state = cio2_sync_state
>  	},
>  };
>  
> diff --git a/drivers/staging/media/ipu3/Kconfig b/drivers/staging/media/ipu3/Kconfig
> index 3e9640523e50..08842fd8c0da 100644
> --- a/drivers/staging/media/ipu3/Kconfig
> +++ b/drivers/staging/media/ipu3/Kconfig
> @@ -14,3 +14,18 @@ config VIDEO_IPU3_IMGU
>  
>  	  Say Y or M here if you have a Skylake/Kaby Lake SoC with a MIPI
>  	  camera. The module will be called ipu3-imgu.
> +
> +config VIDEO_CIO2_BRIDGE
> +	tristate "IPU3 CIO2 Sensor Bridge Driver"
> +	depends on PCI && VIDEO_V4L2
> +	depends on ACPI
> +	depends on X86
> +	help
> +	  This module provides a bridge connecting sensors (I.E. cameras) to
> +	  the CIO2 device infrastructure via software nodes built from information
> +	  parsed from the SSDB buffer.
> +
> +	  Say Y or M here if your platform's cameras use IPU3 with connections
> +	  that should be defined in ACPI. The module will be called cio2-bridge.
> +
> +	  If in doubt, say N here.
> \ No newline at end of file
> diff --git a/drivers/staging/media/ipu3/Makefile b/drivers/staging/media/ipu3/Makefile
> index 9def80ef28f3..12dff56dbb9e 100644
> --- a/drivers/staging/media/ipu3/Makefile
> +++ b/drivers/staging/media/ipu3/Makefile
> @@ -10,3 +10,4 @@ ipu3-imgu-objs += \
>  		ipu3-css.o ipu3-v4l2.o ipu3.o
>  
>  obj-$(CONFIG_VIDEO_IPU3_IMGU) += ipu3-imgu.o
> +obj-$(CONFIG_VIDEO_CIO2_BRIDGE) += cio2-bridge.o
> \ No newline at end of file
> diff --git a/drivers/staging/media/ipu3/cio2-bridge.c b/drivers/staging/media/ipu3/cio2-bridge.c
> new file mode 100644
> index 000000000000..5115aeeb35a1
> --- /dev/null
> +++ b/drivers/staging/media/ipu3/cio2-bridge.c
> @@ -0,0 +1,448 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/acpi.h>
> +#include <acpi/acpi_bus.h>
> +#include <linux/device.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <media/v4l2-subdev.h>
> +
> +#include <linux/fwnode.h>
> +#include <linux/kref.h>
> +
> +static void cio2_bridge_exit(void);
> +static int cio2_bridge_init(void);
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
> +#define NODE_HID(_HID)				\
> +((const struct software_node) {			\
> +	_HID,					\
> +})
> +
> +#define NODE_PORT(_PORT, _HID_NODE)		\
> +((const struct software_node) {			\
> +	_PORT,					\
> +	_HID_NODE,				\
> +})
> +
> +#define NODE_ENDPOINT(_EP, _PORT, _PROPS)	\
> +((const struct software_node) {			\
> +	_EP,					\
> +	_PORT,					\
> +	_PROPS,					\
> +})
> +
> +#define PROPERTY_ENTRY_NULL			\
> +((const struct property_entry) { })
> +#define SOFTWARE_NODE_NULL			\
> +((const struct software_node) { })
> +
> +/*
> + * Extend this array with ACPI Hardware ID's of devices known to be
> + * working
> + */
> +
> +static char *supported_devices[] = {
> +	"INT33BE",
> +	"OVTI2680",
> +	"OVTI5648",
> +};
> +
> +/*
> + * software_node needs const char * names. Can't snprintf a const char *,
> + * so instead we need an array of them and use the port num from SSDB as
> + * an index.
> + */
> +
> +const char *port_names[] = {
> +	"port0", "port1", "port2", "port3", "port4",
> +	"port5", "port6", "port7", "port8", "port9"
> +};
> +
> +struct software_node cio2_hid_node = { CIO2_HID, };
> +
> +struct sensor {
> +	struct device *dev;
> +	struct software_node swnodes[5];
> +	struct property_entry sensor_props[6];
> +	struct property_entry cio2_props[3];
> +	struct fwnode_handle *fwnode;
> +};
> +
> +struct cio2_bridge {
> +	int n_sensors;
> +	struct sensor sensors[MAX_CONNECTED_DEVICES];
> +	struct pci_dev *cio2;
> +	struct fwnode_handle *cio2_fwnode;
> +};
> +
> +struct cio2_bridge bridge = { 0, };
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
> +	{ }
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
> +} __attribute__((__packed__));
> +
> +/* Fields needed by bridge driver */
> +struct sensor_bios_data {
> +	struct device *dev;
> +	u8 link;
> +	u8 lanes;
> +	u32 mclkspeed;
> +};
> +
> +static int read_acpi_block(struct device *dev, char *id, void *data, u32 size)
> +{
> +	union acpi_object *obj;
> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_handle *dev_handle = ACPI_HANDLE(dev);
> +	int status;
> +	u32 buffer_length;
> +
> +	status = acpi_evaluate_object(dev_handle, id, NULL, &buffer);
> +	if (!ACPI_SUCCESS(status))
> +		return -ENODEV;
> +
> +	obj = (union acpi_object *)buffer.pointer;
> +	if (!obj || obj->type != ACPI_TYPE_BUFFER) {
> +		dev_err(dev, "Could't read acpi buffer\n");
> +		status = -ENODEV;
> +		goto err;
> +	}
> +
> +	if (obj->buffer.length > size) {
> +		dev_err(dev, "Given buffer is too small\n");
> +		status = -ENODEV;
> +		goto err;
> +	}
> +
> +	memcpy(data, obj->buffer.pointer, min(size, obj->buffer.length));

The min() is not required because we checked the length earlier.

> +	buffer_length = obj->buffer.length;

No need for the "buffer_length" variable.

> +	kfree(buffer.pointer);
> +
> +	return buffer_length;
> +err:
> +	kfree(buffer.pointer);
> +	return status;
> +}
> +
> +static int get_acpi_ssdb_sensor_data(struct device *dev,
> +				     struct sensor_bios_data *sensor)
> +{
> +	struct sensor_bios_data_packed sensor_data;
> +	int ret = read_acpi_block(dev, "SSDB", &sensor_data,
> +				  sizeof(sensor_data));

Don't put functions which can fail into the declaration block.

> +
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to fetch SSDB data\n");
> +		return ret;
> +	}
> +
> +	sensor->link = sensor_data.link;
> +	sensor->lanes = sensor_data.lanes;
> +	sensor->mclkspeed = sensor_data.mclkspeed;
> +
> +	return 0;
> +}
> +
> +static int create_endpoint_properties(struct device *dev,
> +				      struct sensor_bios_data *ssdb,
> +				      struct property_entry *sensor_props,
> +				      struct property_entry *cio2_props)
> +{
> +		u32 *data_lanes;
> +		int i;

Indented too far.

> +
> +		data_lanes = devm_kmalloc(dev, sizeof(u32) * (int)ssdb->lanes,

No need for the cast.  Use devm_kmalloc_array().

> +					  GFP_KERNEL);
> +
> +		if (!data_lanes) {
> +			dev_err(dev,
> +				"Couldn't allocate memory for data lanes array\n");

Delete the error message (checkpatch.pl --strict).

> +			return -ENOMEM;
> +		}
> +
> +		for (i = 0; i < (int)ssdb->lanes; i++)

Delete the cast.

> +			data_lanes[i] = (u32)i + 1;

Delete the cast.

> +
> +		sensor_props[0] = PROPERTY_ENTRY_U32("clock-frequency",
> +						     ssdb->mclkspeed);
> +		sensor_props[1] = PROPERTY_ENTRY_U32("bus-type", 5);
> +		sensor_props[2] = PROPERTY_ENTRY_U32("clock-lanes", 0);
> +		sensor_props[3] = PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes",
> +							       data_lanes,
> +							       (int)ssdb->lanes);
> +		sensor_props[4] = remote_endpoints[(bridge.n_sensors * 2) + ENDPOINT_SENSOR];
> +		sensor_props[5] = PROPERTY_ENTRY_NULL;
> +
> +		cio2_props[0] = PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes",
> +							     data_lanes,
> +							     (int)ssdb->lanes);
> +		cio2_props[1] = remote_endpoints[(bridge.n_sensors * 2) + ENDPOINT_CIO2];
> +		cio2_props[2] = PROPERTY_ENTRY_NULL;
> +
> +		return 0;
> +}
> +
> +static int connect_supported_devices(void)
> +{
> +	struct acpi_device *adev;
> +	struct device *dev;
> +	struct sensor_bios_data ssdb;
> +	struct sensor *sensor;
> +	struct property_entry *sensor_props;
> +	struct property_entry *cio2_props;
> +	struct fwnode_handle *fwnode;
> +	struct software_node *nodes;
> +	struct v4l2_subdev *sd;
> +	int i, ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(supported_devices); i++) {
> +		adev = acpi_dev_get_first_match_dev(supported_devices[i],
> +						    NULL, -1);
> +
> +		if (!adev)
> +			continue;
> +
> +		dev = bus_find_device_by_acpi_dev(&i2c_bus_type, adev);
> +
> +		if (!dev) {
> +			pr_info("ACPI match for %s, but it has no i2c device\n",
> +				supported_devices[i]);
> +			continue;
> +		}
> +
> +		if (!dev->driver_data) {
> +			pr_info("ACPI match for %s, but it has no driver\n",
> +				supported_devices[i]);

put_device(dev);

> +			continue;
> +		} else {
> +			pr_info("Found supported device %s\n",
> +				supported_devices[i]);
> +		}
> +
> +		sensor = &bridge.sensors[bridge.n_sensors];
> +		/*
> +		 * Store sensor's existing fwnode so that it can be restored if
> +		 * this module is removed.
> +		 */
> +		sensor->fwnode = fwnode_handle_get(dev->fwnode);
> +
> +		get_acpi_ssdb_sensor_data(dev, &ssdb);
> +
> +		nodes = sensor->swnodes;
> +		sensor_props = sensor->sensor_props;
> +		cio2_props = sensor->cio2_props;
> +		fwnode = sensor->fwnode;
> +
> +		ret = create_endpoint_properties(dev, &ssdb, sensor_props,
> +						 cio2_props);
> +
> +		if (ret)
> +			return ret;
> +
> +		/* build the software nodes */
> +
> +		nodes[SWNODE_SENSOR_HID] = NODE_HID(supported_devices[i]);
> +		nodes[SWNODE_SENSOR_PORT] = NODE_PORT("port0",
> +						      &nodes[SWNODE_SENSOR_HID]);
> +		nodes[SWNODE_SENSOR_ENDPOINT] = NODE_ENDPOINT("endpoint0",
> +							      &nodes[SWNODE_SENSOR_PORT],
> +							      sensor_props);
> +		nodes[SWNODE_CIO2_PORT] = NODE_PORT(port_names[(int)ssdb.link],
> +						    &cio2_hid_node);
> +		nodes[SWNODE_CIO2_ENDPOINT] = NODE_ENDPOINT("endpoint0",
> +							    &nodes[SWNODE_CIO2_PORT],
> +							    cio2_props);
> +		nodes[SWNODE_NULL_TERMINATOR]   = SOFTWARE_NODE_NULL;
> +
> +		ret = software_node_register_nodes(nodes);
> +		if (ret) {
> +			dev_err(dev,
> +				"Failed to register software nodes for %s\n",
> +				supported_devices[i]);
> +			return ret;
> +		}
> +
> +		fwnode = software_node_fwnode(&nodes[SWNODE_SENSOR_HID]);
> +		if (!fwnode) {
> +			dev_err(dev,
> +				"Failed to get software node for %s\n",
> +				supported_devices[i]);
> +			return ret;


"ret" is zero here.  return -ENODEV;?

> +		}
> +
> +		fwnode->secondary = ERR_PTR(-ENODEV);
> +		dev->fwnode = fwnode;
> +
> +		/*
> +		 * The device should by this point has driver_data set to an
> +		 * instance of struct v4l2_subdev; set the fwnode for that too.
> +		 */
> +
> +		sd = dev_get_drvdata(dev);
> +		sd->fwnode = fwnode;
> +
> +		sensor->dev = dev;
> +		bridge.n_sensors++;
> +	}
> +
> +	return 0;
> +}
> +
> +static int cio2_bridge_init(void)
> +{
> +	struct fwnode_handle *fwnode;
> +	int ret;
> +
> +	ret = software_node_register(&cio2_hid_node);
> +
> +	if (ret < 0) {
> +		pr_err("Failed to register the CIO2 HID node\n");
> +		return -EINVAL;

Propagate the error code from software_node_register().

> +	}
> +
> +	ret = connect_supported_devices();
> +
> +	if ((ret < 0) || (bridge.n_sensors <= 0)) {
> +		pr_err("cio2_bridge: Failed to connect any devices\n");
> +		goto out;

If (bridge.n_sensors <= 0) is true then we need to set ret = -EINVAL
or something.  Really .n_sensors can't be negative.

The name "out" is a crappy label name because it doesn't say what the
goto does.  When I scroll down then it turns out that "goto out;" calls
a free_everything() function.  That kind of error handling is always
buggy.

There are several typical bugs.  1) Something leaks because the error
handling style is too complicated to be audited.  2)  Dereferencing
uninitialized pointers.  3)  Undoing something which hasn't been done.

I believe that in this case one bug is with the handling of the
bridge.cio2_fwnode.  We "restore" it back to the original state
as soon as we have a non-NULL bridge.cio2 instead of waiting until we
have stored the original state.

The best way to do error handling is this.

Every function cleans up after itself.  The connect_supported_devices()
function is a bit special because it's a loop.  I would would write it
so that if it fails then it cleans up the partial loop iteration and
then at the end it cleans up all the failed loop iterations.

	for (i = 0; i < ARRAY_SIZE(supported_devices); i++) {
		a = frob();
		if (!a)
			goto unwind;
		b = frob();
		if (!b) {
			free(a);
			goto unwind;
		}
		...
	}

	return 0;

unwind:
	for (i = 0; i < bridge.n_sensors; i++) {
		free(b);
		free(a);
	}
	bridge.n_sensors = 0;

	return ret;

The problem with cio2_bridge_unregister_sensors() is that it doesn't
clean up partial iterations through the loop.  (Missing calls to
put_device(dev)).

Loops are complicated but the rest is simple.  1) Every allocation
function needs a matching cleanup function.  2) Use good label names
which say what the goto does.  3)  The goto should free the most recent
successful allocation.

	a = frob();
	if (!a)
		return -ENOMEM;

	b = frob();
	if (!b) {
		ret = -ENOMEM;
		goto free_a;
	}

	c = frob();
	if (!c) {
		ret = -ENOMEM;
		goto free_b;
	}

	return 0;

free_b:
	free(b);
free_a:
	free(a);

	return ret;

The free function doesn't have any if statements.

void free_function()
{
	free(c);
	free(b);
	free(a);
}

The reviewer only needs to keep track of the most recent allocation
and verify that the goto free_foo matches what should be freed.  This
system means the code is auditable (no leaks), you never free anything
which wasn't allocated.

> +	} else {
> +		pr_info("Found %d supported devices\n", bridge.n_sensors);
> +	}
> +
> +	bridge.cio2 = pci_get_device(PCI_VENDOR_ID_INTEL, CIO2_PCI_ID, NULL);
> +	if (!bridge.cio2) {
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
> +	fwnode = software_node_fwnode(&cio2_hid_node);
> +	if (!fwnode) {
> +		pr_err("Error getting fwnode from cio2 software_node\n");
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
> +	/*
> +	 * We store the pci_dev's existing fwnode, beccause in the event we
> +	 * want to reload (I.E. rmmod and insmod) this module we need to give
> +	 * the device its original fwnode back to prevent problems down the
> +	 * line
> +	 */
> +
> +	bridge.cio2_fwnode = fwnode_handle_get(bridge.cio2->dev.fwnode);
> +
> +	fwnode->secondary = ERR_PTR(-ENODEV);
> +	bridge.cio2->dev.fwnode = fwnode;
> +
> +	return 0;
> +out:
> +	cio2_bridge_exit();
> +	return ret;
> +}
> +
> +static int cio2_bridge_unregister_sensors(void)

Make this a void function.

regards,
dan carpenter

> +{
> +	int i, j;
> +	struct sensor *sensor;
> +
> +	for (i = 0; i < bridge.n_sensors; i++) {
> +		sensor = &bridge.sensors[i];
> +
> +		/* give the sensor its original fwnode back */
> +		sensor->dev->fwnode = sensor->fwnode;
> +		fwnode_handle_put(sensor->fwnode);
> +		put_device(sensor->dev);
> +
> +		for (j = 4; j >= 0; j--)
> +			software_node_unregister(&sensor->swnodes[j]);
> +	}
> +
> +	return 0;
> +}
> +
> +static void cio2_bridge_exit(void)
> +{
> +	int ret;
> +
> +	/* Give the pci_dev its original fwnode back */
> +	if (bridge.cio2) {
> +		bridge.cio2->dev.fwnode = bridge.cio2_fwnode;
> +		fwnode_handle_put(bridge.cio2_fwnode);
> +		pci_dev_put(bridge.cio2);
> +	}
> +
> +	ret = cio2_bridge_unregister_sensors();
> +
> +	if (ret)
> +		pr_err("An error occurred unregistering the sensors\n");
> +
> +	software_node_unregister(&cio2_hid_node);
> +}
> +
> +module_init(cio2_bridge_init);
> +module_exit(cio2_bridge_exit);
> +
> +MODULE_DESCRIPTION("A bridge driver to connect sensors to CIO2 infrastructure.");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("acpi*:INT343E:*");
> -- 
> 2.17.1
> 
> _______________________________________________
> devel mailing list
> devel@linuxdriverproject.org
> http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel
