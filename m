Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBEC326D54E
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 09:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgIQHyZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 03:54:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:43316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726142AbgIQHx1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 03:53:27 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3AC1221D43;
        Thu, 17 Sep 2020 07:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600329204;
        bh=x4xrCIr4mjHLKAY6XUCSk155T0IExAtLh0m5BEjecbU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ik8HU1qN5AugxnqX36Q1rHfPWaHIjrKW2rH8s/sNTaYSIN/JthqAdtWBhUIZQIhpW
         sz4wdiVSfeggzocbrVlSdisSXp4MddJiRJXO06iNz7HxYzMCjpCn7Wko4LIdsP3IAz
         ziw2frDa6PyOcmHWRTnLGBi97vE8C2b01KSt8aEo=
Date:   Thu, 17 Sep 2020 09:53:56 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        davem@davemloft.net, robh@kernel.org, devel@driverdev.osuosl.org,
        jorhand@linux.microsoft.com, kieran.bingham@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        kitakar@gmail.com
Subject: Re: [RFC PATCH] Add bridge driver to connect sensors to CIO2 device
 via software nodes on ACPI platforms
Message-ID: <20200917075356.GA3333802@kroah.com>
References: <20200916213618.8003-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916213618.8003-1-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 16, 2020 at 10:36:18PM +0100, Daniel Scally wrote:
>  MAINTAINERS                              |   6 +
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c |  67 +++-

staging drivers should be self-contained, and not modify stuff outside
of drivers/staging/

>  drivers/staging/media/ipu3/Kconfig       |  15 +
>  drivers/staging/media/ipu3/Makefile      |   1 +
>  drivers/staging/media/ipu3/cio2-bridge.c | 448 +++++++++++++++++++++++

Why does this have to be in drivers/staging/ at all?  Why not spend the
time to fix it up properly and get it merged correctly?  It's a very
small driver, and should be smaller, so it should not be a lot of work
to do.  And it would be faster to do that than to take it through
staging...

>  5 files changed, 534 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/staging/media/ipu3/cio2-bridge.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b5cfab015bd6..55b0b9888bc0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9152,6 +9152,12 @@ S:	Maintained
>  W:	http://www.adaptec.com/
>  F:	drivers/scsi/ips*
>  
> +IPU3 CIO2 Bridge Driver
> +M:	Daniel Scally <djrscally@gmail.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	drivers/staging/media/ipu3/cio2-bridge.c
> +
>  IPVS
>  M:	Wensong Zhang <wensong@linux-vs.org>
>  M:	Simon Horman <horms@verge.net.au>
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

This is a huge flag that something is wrong, why void?

> +
> +	/*
> +	 * On ACPI platforms, we need to probe _after_ sensors wishing to connect
> +	 * to cio2 have added a device link. If there are no consumers yet, then
> +	 * we need to defer. The .sync_state() callback will then be called after
> +	 * all linked sensors have probed
> +	 */
> +
> +	if (IS_ENABLED(CONFIG_ACPI)) {
> +		sensor = (struct device *)list_first_entry_or_null(

And you cast it???  Not right at all.

> +								&pci_dev->dev.links.consumers,
> +								struct dev_links_info,
> +								consumers);

How do you "know" this is the first link?  This feels really really
wrong and very fragile.

> +
> +		if (!sensor)
> +			return -EPROBE_DEFER;

So any random value will work?  I doubt it :)

> +	}
> +
> +	return 0;
> +}
> +
> +void cio2_sync_state(struct device *dev)
> +{
> +	struct cio2_device *cio2;
> +	int ret = 0;
> +
> +	if (IS_ENABLED(CONFIG_ACPI)) {
> +		cio2 = dev_get_drvdata(dev);
> +
> +		if (!cio2) {
> +			dev_err(dev, "Failed to retrieve driver data\n");

How can this fail?

> +			return;

No error value?

> +		}
> +
> +		/* insert the bridge driver to connect sensors via software nodes */
> +		ret = request_module("cio2-bridge");
> +
> +		if (ret)
> +			dev_err(dev, "Failed to insert cio2-bridge\n");

Yet you keep on in the function???

> +
> +		ret = cio2_parse_firmware(cio2);
> +
> +		if (ret) {
> +			v4l2_async_notifier_unregister(&cio2->notifier);
> +			v4l2_async_notifier_cleanup(&cio2->notifier);
> +			cio2_queues_exit(cio2);

But you clean up after this error?

> +		}
> +	}

And again, do not tell anyone?

Feels really wrong...

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

Why x86?

Why not CONFIG_TEST?



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

Why kref.h?



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

Endian issues???

This doesn't look "packed" to me, did you check it?

I've stopped here, sorry, ran out of time...

greg k-h
