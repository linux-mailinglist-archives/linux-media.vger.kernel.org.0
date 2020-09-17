Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 550D926D80E
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 11:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgIQJsW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 05:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgIQJsV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 05:48:21 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64193C06174A;
        Thu, 17 Sep 2020 02:47:57 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id w5so1331187wrp.8;
        Thu, 17 Sep 2020 02:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+21h7WWE02g3sqRq3YceAb1XLwDXFpUAkBcKRFMr60o=;
        b=u/v9w6RMlGrhrilAkGraaso4LIVuCQ90u4jyPoPe/KHwIBuhIuPOHbcJMuwH/FAu33
         D3a7YzthB5tVg9xxq39kS8+DSg45IuuJ22ZXCvOBJLw3axWlkjXvm+Vhau+l3ZW1YJhF
         dWAw5tAVpAJvl/HwpvWNn+XgxtpezngNWL+AKmAnmpxST94ZRsHvziMijg9uev6xwW/H
         UlfdSnd8I+YWBff0F0k4l8e02MXrpg9XezAAOg5qjWnoYp73Svy+C+Z0vb16QDxjVE51
         GskFXa4cgE4wUAL5BcaQiBSF9k60cXiptyKLonJ004KuEoeRta/CT9rGCNijEF8JUBaO
         VcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=+21h7WWE02g3sqRq3YceAb1XLwDXFpUAkBcKRFMr60o=;
        b=jh+v+XTLyjnP1GBp2nhXnGQl8hKtBPAcXRvf3dTGYVy4bnaK4u+A+EyIZNXzOa2ELA
         R0vjDgr2NmfzPC5XXt0NHgF79/VJqfXC/5Etdryv3WgSEKlLVTalfXey27r4a6BsnKds
         dLXfb3onhddXx9/O5uVv5Ua83DJZpLlnhG08MHZnOYhpynipUfcRLTBDnAH/QGWllkks
         AHFQ455EBJxem12esrd+7Y1mkafeCza4VKJeKrWrh2nUX+mLx7wcSTGvuao0rc5I6ftw
         MPGj+1hZXivDhcm6jV2iNHN0FSohXdNq3vr2VPp1B1mQGBdvv/QgXyO4vNP5h1CluDeS
         wXzA==
X-Gm-Message-State: AOAM533CoWwIjSJLfzJuzUSdXzE8Sudl6sOueC88uPfK2lZ2XOqlcAq+
        l4W+07K6g4vhbAl7AjMoMiU=
X-Google-Smtp-Source: ABdhPJx+TyVZiNJNF0m8nS4tbkghLiqWTfxJDhvaY3z2Hg0WH7CQqi1q7913Vy4NLkXqzeo4bfhBtw==
X-Received: by 2002:a5d:444b:: with SMTP id x11mr31020423wrr.402.1600336072333;
        Thu, 17 Sep 2020 02:47:52 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.208.34])
        by smtp.gmail.com with ESMTPSA id u126sm12783303wmu.9.2020.09.17.02.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 02:47:51 -0700 (PDT)
Subject: Re: [RFC PATCH] Add bridge driver to connect sensors to CIO2 device
 via software nodes on ACPI platforms
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        davem@davemloft.net, robh@kernel.org, devel@driverdev.osuosl.org,
        jorhand@linux.microsoft.com, kieran.bingham@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        kitakar@gmail.com
References: <20200916213618.8003-1-djrscally@gmail.com>
 <20200917075356.GA3333802@kroah.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <d97fb93f-5258-b654-3063-863e81ae7298@gmail.com>
Date:   Thu, 17 Sep 2020 10:47:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917075356.GA3333802@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Greg - thanks for the comments, appreciate it (sorry there's so many,
I'm new to both C and kernel work)

On 17/09/2020 08:53, Greg KH wrote:
> On Wed, Sep 16, 2020 at 10:36:18PM +0100, Daniel Scally wrote:
>>  MAINTAINERS                              |   6 +
>>  drivers/media/pci/intel/ipu3/ipu3-cio2.c |  67 +++-
> staging drivers should be self-contained, and not modify stuff outside
> of drivers/staging/
>
>>  drivers/staging/media/ipu3/Kconfig       |  15 +
>>  drivers/staging/media/ipu3/Makefile      |   1 +
>>  drivers/staging/media/ipu3/cio2-bridge.c | 448 +++++++++++++++++++++++
> Why does this have to be in drivers/staging/ at all?  Why not spend the
> time to fix it up properly and get it merged correctly?  It's a very
> small driver, and should be smaller, so it should not be a lot of work
> to do.  And it would be faster to do that than to take it through
> staging...
I was just under the impression that that was the process to be honest,
if that's not right I'll just move it directly to drivers/media/ipu3
>>  5 files changed, 534 insertions(+), 3 deletions(-)
>>  create mode 100644 drivers/staging/media/ipu3/cio2-bridge.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index b5cfab015bd6..55b0b9888bc0 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -9152,6 +9152,12 @@ S:	Maintained
>>  W:	http://www.adaptec.com/
>>  F:	drivers/scsi/ips*
>>  
>> +IPU3 CIO2 Bridge Driver
>> +M:	Daniel Scally <djrscally@gmail.com>
>> +L:	linux-media@vger.kernel.org
>> +S:	Maintained
>> +F:	drivers/staging/media/ipu3/cio2-bridge.c
>> +
>>  IPVS
>>  M:	Wensong Zhang <wensong@linux-vs.org>
>>  M:	Simon Horman <horms@verge.net.au>
>> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
>> index 92f5eadf2c99..fd941d2c7581 100644
>> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
>> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
>> @@ -1719,6 +1719,59 @@ static void cio2_queues_exit(struct cio2_device *cio2)
>>  		cio2_queue_exit(cio2, &cio2->queue[i]);
>>  }
>>  
>> +static int cio2_probe_can_progress(struct pci_dev *pci_dev)
>> +{
>> +	void *sensor;
> This is a huge flag that something is wrong, why void?
>
>> +
>> +	/*
>> +	 * On ACPI platforms, we need to probe _after_ sensors wishing to connect
>> +	 * to cio2 have added a device link. If there are no consumers yet, then
>> +	 * we need to defer. The .sync_state() callback will then be called after
>> +	 * all linked sensors have probed
>> +	 */
>> +
>> +	if (IS_ENABLED(CONFIG_ACPI)) {
>> +		sensor = (struct device *)list_first_entry_or_null(
> And you cast it???  Not right at all.

Yeah sorry; misunderstood entirely how that was supposed to work. From
the following comment, this probably needs re-implementing as
list_for_each_entry anyway

>
>> +								&pci_dev->dev.links.consumers,
>> +								struct dev_links_info,
>> +								consumers);
> How do you "know" this is the first link?  This feels really really
> wrong and very fragile.
>
>> +
>> +		if (!sensor)
>> +			return -EPROBE_DEFER;
> So any random value will work?  I doubt it :)
So the intention was just to check that there is _a_ linked device,
which I had been assuming would be a sensor that wanted to use the cio2
device. That's probably not very smart in retrospect; I hadn't
considered other none-me pieces of code linking in. I guess a better
approach would be to check all the linked devices with list_each_entry
and determine if at least one of them is a sensor.
>
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +void cio2_sync_state(struct device *dev)
>> +{
>> +	struct cio2_device *cio2;
>> +	int ret = 0;
>> +
>> +	if (IS_ENABLED(CONFIG_ACPI)) {
>> +		cio2 = dev_get_drvdata(dev);
>> +
>> +		if (!cio2) {
>> +			dev_err(dev, "Failed to retrieve driver data\n");
> How can this fail?
Yeah I guess if the cio2_pci_probe() never made it to setting driver
data then the sync_state() shouldn't get called; thanks.
>
>> +			return;
> No error value?
The prototype for sync_state callbacks is to return void, so my
understanding is it can't return an error value.  I guess a better thing
to do might be call another function performing cleanup and unloading
the driver before the return or something along those lines though.
>
>> +		}
>> +
>> +		/* insert the bridge driver to connect sensors via software nodes */
>> +		ret = request_module("cio2-bridge");
>> +
>> +		if (ret)
>> +			dev_err(dev, "Failed to insert cio2-bridge\n");
> Yet you keep on in the function???
>> +
>> +		ret = cio2_parse_firmware(cio2);
>> +
>> +		if (ret) {
>> +			v4l2_async_notifier_unregister(&cio2->notifier);
>> +			v4l2_async_notifier_cleanup(&cio2->notifier);
>> +			cio2_queues_exit(cio2);
> But you clean up after this error?
>
If the bridge doesn't work, the cio2_parse_firmware() call should behave
as it does now on these platforms - I.E. just not connect anything. If
felt ok for that to happen, but I can have it perform cleanup at this
point if that's a better approach.
>> +		}
>> +	}
> And again, do not tell anyone?
>
> Feels really wrong...
I think return type void prevents that, but I could be completely wrong
about that.
>> +}
>> +
>>  /**************** PCI interface ****************/
>>  
>>  static int cio2_pci_config_setup(struct pci_dev *dev)
>> @@ -1746,6 +1799,11 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>>  	void __iomem *const *iomap;
>>  	int r;
>>  
>> +	r = cio2_probe_can_progress(pci_dev);
>> +
>> +	if (r)
>> +		return -EPROBE_DEFER;
>> +
>>  	cio2 = devm_kzalloc(&pci_dev->dev, sizeof(*cio2), GFP_KERNEL);
>>  	if (!cio2)
>>  		return -ENOMEM;
>> @@ -1821,9 +1879,11 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>>  	v4l2_async_notifier_init(&cio2->notifier);
>>  
>>  	/* Register notifier for subdevices we care */
>> -	r = cio2_parse_firmware(cio2);
>> -	if (r)
>> -		goto fail_clean_notifier;
>> +	if (!IS_ENABLED(CONFIG_ACPI)) {
>> +		r = cio2_parse_firmware(cio2);
>> +		if (r)
>> +			goto fail_clean_notifier;
>> +	}
>>  
>>  	r = devm_request_irq(&pci_dev->dev, pci_dev->irq, cio2_irq,
>>  			     IRQF_SHARED, CIO2_NAME, cio2);
>> @@ -2052,6 +2112,7 @@ static struct pci_driver cio2_pci_driver = {
>>  	.remove = cio2_pci_remove,
>>  	.driver = {
>>  		.pm = &cio2_pm_ops,
>> +		.sync_state = cio2_sync_state
>>  	},
>>  };
>>  
>> diff --git a/drivers/staging/media/ipu3/Kconfig b/drivers/staging/media/ipu3/Kconfig
>> index 3e9640523e50..08842fd8c0da 100644
>> --- a/drivers/staging/media/ipu3/Kconfig
>> +++ b/drivers/staging/media/ipu3/Kconfig
>> @@ -14,3 +14,18 @@ config VIDEO_IPU3_IMGU
>>  
>>  	  Say Y or M here if you have a Skylake/Kaby Lake SoC with a MIPI
>>  	  camera. The module will be called ipu3-imgu.
>> +
>> +config VIDEO_CIO2_BRIDGE
>> +	tristate "IPU3 CIO2 Sensor Bridge Driver"
>> +	depends on PCI && VIDEO_V4L2
>> +	depends on ACPI
>> +	depends on X86
> Why x86?
>
> Why not CONFIG_TEST?
X86 because as far as I know this is already working properly on other
platforms, so wouldn't be needed. Not sure what CONFIG_TEST is for; sorry.
>> +	help
>> +	  This module provides a bridge connecting sensors (I.E. cameras) to
>> +	  the CIO2 device infrastructure via software nodes built from information
>> +	  parsed from the SSDB buffer.
>> +
>> +	  Say Y or M here if your platform's cameras use IPU3 with connections
>> +	  that should be defined in ACPI. The module will be called cio2-bridge.
>> +
>> +	  If in doubt, say N here.
>> \ No newline at end of file
>> diff --git a/drivers/staging/media/ipu3/Makefile b/drivers/staging/media/ipu3/Makefile
>> index 9def80ef28f3..12dff56dbb9e 100644
>> --- a/drivers/staging/media/ipu3/Makefile
>> +++ b/drivers/staging/media/ipu3/Makefile
>> @@ -10,3 +10,4 @@ ipu3-imgu-objs += \
>>  		ipu3-css.o ipu3-v4l2.o ipu3.o
>>  
>>  obj-$(CONFIG_VIDEO_IPU3_IMGU) += ipu3-imgu.o
>> +obj-$(CONFIG_VIDEO_CIO2_BRIDGE) += cio2-bridge.o
>> \ No newline at end of file
>> diff --git a/drivers/staging/media/ipu3/cio2-bridge.c b/drivers/staging/media/ipu3/cio2-bridge.c
>> new file mode 100644
>> index 000000000000..5115aeeb35a1
>> --- /dev/null
>> +++ b/drivers/staging/media/ipu3/cio2-bridge.c
>> @@ -0,0 +1,448 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +#include <linux/acpi.h>
>> +#include <acpi/acpi_bus.h>
>> +#include <linux/device.h>
>> +#include <linux/i2c.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/pci.h>
>> +#include <media/v4l2-subdev.h>
>> +
>> +#include <linux/fwnode.h>
>> +#include <linux/kref.h>
> Why kref.h?
Oops; a leftover from debugging some reference count issues in the
earlier days - I'll take that out.
>> +
>> +static void cio2_bridge_exit(void);
>> +static int cio2_bridge_init(void);
>> +
>> +#define MAX_CONNECTED_DEVICES			4
>> +#define SWNODE_SENSOR_HID			0
>> +#define SWNODE_SENSOR_PORT			1
>> +#define SWNODE_SENSOR_ENDPOINT			2
>> +#define SWNODE_CIO2_PORT			3
>> +#define SWNODE_CIO2_ENDPOINT			4
>> +#define SWNODE_NULL_TERMINATOR			5
>> +
>> +#define CIO2_HID				"INT343E"
>> +#define CIO2_PCI_ID				0x9d32
>> +
>> +#define ENDPOINT_SENSOR				0
>> +#define ENDPOINT_CIO2				1
>> +
>> +#define NODE_HID(_HID)				\
>> +((const struct software_node) {			\
>> +	_HID,					\
>> +})
>> +
>> +#define NODE_PORT(_PORT, _HID_NODE)		\
>> +((const struct software_node) {			\
>> +	_PORT,					\
>> +	_HID_NODE,				\
>> +})
>> +
>> +#define NODE_ENDPOINT(_EP, _PORT, _PROPS)	\
>> +((const struct software_node) {			\
>> +	_EP,					\
>> +	_PORT,					\
>> +	_PROPS,					\
>> +})
>> +
>> +#define PROPERTY_ENTRY_NULL			\
>> +((const struct property_entry) { })
>> +#define SOFTWARE_NODE_NULL			\
>> +((const struct software_node) { })
>> +
>> +/*
>> + * Extend this array with ACPI Hardware ID's of devices known to be
>> + * working
>> + */
>> +
>> +static char *supported_devices[] = {
>> +	"INT33BE",
>> +	"OVTI2680",
>> +	"OVTI5648",
>> +};
>> +
>> +/*
>> + * software_node needs const char * names. Can't snprintf a const char *,
>> + * so instead we need an array of them and use the port num from SSDB as
>> + * an index.
>> + */
>> +
>> +const char *port_names[] = {
>> +	"port0", "port1", "port2", "port3", "port4",
>> +	"port5", "port6", "port7", "port8", "port9"
>> +};
>> +
>> +struct software_node cio2_hid_node = { CIO2_HID, };
>> +
>> +struct sensor {
>> +	struct device *dev;
>> +	struct software_node swnodes[5];
>> +	struct property_entry sensor_props[6];
>> +	struct property_entry cio2_props[3];
>> +	struct fwnode_handle *fwnode;
>> +};
>> +
>> +struct cio2_bridge {
>> +	int n_sensors;
>> +	struct sensor sensors[MAX_CONNECTED_DEVICES];
>> +	struct pci_dev *cio2;
>> +	struct fwnode_handle *cio2_fwnode;
>> +};
>> +
>> +struct cio2_bridge bridge = { 0, };
>> +
>> +static const struct property_entry remote_endpoints[] = {
>> +	PROPERTY_ENTRY_REF("remote-endpoint", /* Sensor 0, Sensor Property */
>> +			   &bridge.sensors[0].swnodes[SWNODE_CIO2_ENDPOINT]),
>> +	PROPERTY_ENTRY_REF("remote-endpoint", /* Sensor 0, CIO2 Property */
>> +			   &bridge.sensors[0].swnodes[SWNODE_SENSOR_ENDPOINT]),
>> +	PROPERTY_ENTRY_REF("remote-endpoint",
>> +			   &bridge.sensors[1].swnodes[SWNODE_CIO2_ENDPOINT]),
>> +	PROPERTY_ENTRY_REF("remote-endpoint",
>> +			   &bridge.sensors[1].swnodes[SWNODE_SENSOR_ENDPOINT]),
>> +	PROPERTY_ENTRY_REF("remote-endpoint",
>> +			   &bridge.sensors[2].swnodes[SWNODE_CIO2_ENDPOINT]),
>> +	PROPERTY_ENTRY_REF("remote-endpoint",
>> +			   &bridge.sensors[2].swnodes[SWNODE_SENSOR_ENDPOINT]),
>> +	PROPERTY_ENTRY_REF("remote-endpoint",
>> +			   &bridge.sensors[3].swnodes[SWNODE_CIO2_ENDPOINT]),
>> +	PROPERTY_ENTRY_REF("remote-endpoint",
>> +			   &bridge.sensors[3].swnodes[SWNODE_SENSOR_ENDPOINT]),
>> +	{ }
>> +};
>> +
>> +/* Data representation as it is in ACPI SSDB buffer */
>> +struct sensor_bios_data_packed {
>> +	u8 version;
>> +	u8 sku;
>> +	u8 guid_csi2[16];
>> +	u8 devfunction;
>> +	u8 bus;
>> +	u32 dphylinkenfuses;
>> +	u32 clockdiv;
>> +	u8 link;
>> +	u8 lanes;
>> +	u32 csiparams[10];
>> +	u32 maxlanespeed;
>> +	u8 sensorcalibfileidx;
>> +	u8 sensorcalibfileidxInMBZ[3];
>> +	u8 romtype;
>> +	u8 vcmtype;
>> +	u8 platforminfo;
>> +	u8 platformsubinfo;
>> +	u8 flash;
>> +	u8 privacyled;
>> +	u8 degree;
>> +	u8 mipilinkdefined;
>> +	u32 mclkspeed;
>> +	u8 controllogicid;
>> +	u8 reserved1[3];
>> +	u8 mclkport;
>> +	u8 reserved2[13];
>> +} __attribute__((__packed__));
> Endian issues???
>
> This doesn't look "packed" to me, did you check it?
>
> I've stopped here, sorry, ran out of time...
>
I didn't - I'll do that. I appreciate you spending the time at all -
thanks, and sorry it's been so messy!
