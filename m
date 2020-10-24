Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB875297E6C
	for <lists+linux-media@lfdr.de>; Sat, 24 Oct 2020 22:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1764402AbgJXU2L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Oct 2020 16:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1764397AbgJXU2L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Oct 2020 16:28:11 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC25FC0613CE;
        Sat, 24 Oct 2020 13:28:10 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id v5so6313538wmh.1;
        Sat, 24 Oct 2020 13:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=tgXfjiXA61/7nPJ9OZKvAERvB62K5q1dmS97SImgm5A=;
        b=ngwzwatas0hfMFFb5FGBjHnKlfQNxEjKiQDvTFS3XWJNRdWdDOzcZRt2elVOEmWSUU
         60kVBIhbnlcU+VFEbebjrygtOz9yOmNSpHy6YwJ/RIYKpybCBNSEMenMaJD6RqtQ8zJV
         6wWt4uwEdnTgzgYK8OSWrC6rBgf6WITQ1bzdmDUN44qoeryNFa6i00JtqeQv8TBkWv9V
         ty6vVHajvlyE+1bOWA0fqucbM8yOz74zUsm1U9gpz+fjPZEoiZ7PljvtrZ1F4CboxpcQ
         xoFlhMBrC8Ykn3ggVg4pS9pPEa0kHn+E3Tprbjl1PypAjZKqZORv7679F4BZbJe3VenW
         rjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=tgXfjiXA61/7nPJ9OZKvAERvB62K5q1dmS97SImgm5A=;
        b=DOY2Ku+2OI2i/d4MVJPFSepFF1Ss0xHP65H+enKHZUL9HKJiuEowSDv94UsYKGQULN
         zCgrXpMZ6VegCW7j32IVzSJXhhWZEvvLFtbCohmane2y5bPUP+Otu7osvcLhhhrVB1Ya
         Nc4gD8I3fAgq7J5oaeNj4a+fdx2Cwk1IuXReoM4JhSYn0YMN7MnHqjmP6OaA8D+UuEP8
         eOmhvS9J/uLj5HqgOE3LIfdwJeG8q7csJGPWYqGoJAYF4YU5N9+Ldq75MgKdRkA43h2k
         cVrTn7kMUfhsM7yPIrqURF4si41sntjFEXdDg6KSwnZCCbvSy58WqeKFl6gFNFnXURRP
         dfPQ==
X-Gm-Message-State: AOAM5307R2kOpJhcjCCvZ0gYe9mRsIlbEYxHEkCGHFKDbQIcpCTRhVtH
        mo0allq0AEE2G7xATj3oKi8=
X-Google-Smtp-Source: ABdhPJwwzFR/Z2MNCxHLuupBUtxAqUJ1jfXulcOGwfY8DcL68ggdIca68NjzZ8G4cZ+nbXhRFCqCuA==
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr8432966wmj.109.1603571289518;
        Sat, 24 Oct 2020 13:28:09 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.20.56])
        by smtp.gmail.com with ESMTPSA id t7sm12651139wrx.42.2020.10.24.13.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2020 13:28:08 -0700 (PDT)
Subject: Re: [RFC PATCH v3 9/9] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linus.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        andriy.shevchenko@linux.intel.com, sergey.senozhatsky@gmail.com,
        rostedt@goodmis.org, pmladek@suse.com, mchehab@kernel.org,
        tian.shu.qiu@intel.com, bingbu.cao@intel.com,
        sakari.ailus@linux.intel.com, yong.zhi@intel.com,
        rafael@kernel.org, gregkh@linuxfoundation.org, kitakar@gmail.com
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-10-djrscally@gmail.com>
 <20201024151458.GA3774@valkosipuli.retiisi.org.uk>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <18a3661c-4bee-7421-9121-acd65401cf16@gmail.com>
Date:   Sat, 24 Oct 2020 21:28:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201024151458.GA3774@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/10/2020 16:14, Sakari Ailus wrote:
> Hi Daniel,
>
> Thanks for the update.
Thanks for the comments as always
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Author: Dan Scally <djrscally@gmail.com>
> /* Author: ... */
>
> But not the SPDX tag.
Weird - okedokey
>> +#include <linux/acpi.h>
>> +#include <linux/device.h>
>> +#include <linux/fwnode.h>
>> +#include <linux/i2c.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/pci.h>
>> +#include <linux/property.h>
>> +#include <media/v4l2-subdev.h>
>> +
>> +#include "cio2-bridge.h"
>> +
>> +/*
>> + * Extend this array with ACPI Hardware ID's of devices known to be
>> + * working
>> + */
>> +static const char * const supported_devices[] = {
>> +	"INT33BE",
>> +	"OVTI2680",
>> +};
>> +
>> +static struct software_node cio2_hid_node = { CIO2_HID };
>> +
>> +static struct cio2_bridge bridge;
>> +
>> +static const char * const port_names[] = {
>> +	"port0", "port1", "port2", "port3"
>> +};
>> +
>> +static const struct property_entry remote_endpoints[] = {
> How about another dimension, for local and remote? Or make it a struct with
> local and remote fields. Perhaps a struct would be better?
>
> This could also be nicer to initialise in a function.
Sure; a struct probably would be cleaner I agree. I shall make that change
>> +static int create_fwnode_properties(struct sensor *sensor,
>> +				    struct sensor_bios_data *ssdb)
>> +{
>> +	struct property_entry *cio2_properties = sensor->cio2_properties;
>> +	struct property_entry *dev_properties = sensor->dev_properties;
>> +	struct property_entry *ep_properties = sensor->ep_properties;
>> +	int i;
>> +
>> +	/* device fwnode properties */
>> +	memset(dev_properties, 0, sizeof(struct property_entry) * 3);
> I'd put them all to the struct itself. Then the compiler will be able to
> check array indices.
Makes sense; I think I was just trying to save line length in the rest
of that function by that.
>> +
>> +	dev_properties[0] = PROPERTY_ENTRY_U32("clock-frequency",
>> +					       ssdb->mclkspeed);
>> +	dev_properties[1] = PROPERTY_ENTRY_U8("rotation", ssdb->degree);
>> +
>> +	/* endpoint fwnode properties */
>> +	memset(ep_properties, 0, sizeof(struct property_entry) * 4);
>> +
>> +	sensor->data_lanes = kmalloc_array(ssdb->lanes, sizeof(u32),
>> +					   GFP_KERNEL);
>> +
>> +	if (!sensor->data_lanes)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < ssdb->lanes; i++)
>> +		sensor->data_lanes[i] = i + 1;
>> +
>> +	ep_properties[0] = PROPERTY_ENTRY_U32("bus-type", 5);
>> +	ep_properties[1] = PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes",
>> +							sensor->data_lanes,
>> +							ssdb->lanes);
>> +	ep_properties[2] = remote_endpoints[(bridge.n_sensors * 2) + ENDPOINT_SENSOR];
>> +
>> +	/* cio2 endpoint props */
>> +	memset(cio2_properties, 0, sizeof(struct property_entry) * 3);
>> +
>> +	cio2_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes",
>> +							  sensor->data_lanes,
>> +							  ssdb->lanes);
>> +	cio2_properties[1] = remote_endpoints[(bridge.n_sensors * 2) + ENDPOINT_CIO2];
>> +
>> +	return 0;
>> +}
>> +
>> +static int create_connection_swnodes(struct sensor *sensor,
>> +				     struct sensor_bios_data *ssdb)
>> +{
>> +	struct software_node *nodes = sensor->swnodes;
>> +
>> +	memset(nodes, 0, sizeof(struct software_node) * 6);
> Could you make the index an enum, and add an item to the end used to tell
> the number of entries. It could be called e.g. NR_OF_SENSOR_SWNODES.
Ooh I like that, it's neat; thanks - will do.
>> +int cio2_bridge_build(struct pci_dev *cio2)
>> +{
>> +	struct fwnode_handle *fwnode;
>> +	int ret;
>> +
>> +	pci_dev_get(cio2);
> Could you check that this isn't used by more than one user? The current
> implementation assumes that. I'm not sure if there could be more instances
> of CIO2 but if there were, that'd be an issue currently.

I can check; can't think of anything better than just failing out if it
turns out to be in use already though - any ideas or is that appropriate?

>> +struct sensor {
> How about calling this e.g. cio2_sensor? sensor is rather generic.
Yup, will probably prefix all such generically named vars with cio2_*
and functions with cio2_bridge_*().
>> +	char name[ACPI_ID_LEN];
>> +	struct device *dev;
>> +	struct acpi_device *adev;
>> +	struct software_node swnodes[6];
>> +	struct property_entry dev_properties[3];
>> +	struct property_entry ep_properties[4];
>> +	struct property_entry cio2_properties[3];
>> +	u32 *data_lanes;
> The maximum is four so you could as well make this static.
Ack
>> +};
>> +
>> +struct cio2_bridge {
>> +	int n_sensors;
> Do you need negative values? %u, too, if not.
I do not, I will switch to using unsigned.
>> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
>> index f68ef0f6b..827457110 100644
>> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
>> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
>> @@ -1715,9 +1715,27 @@ static void cio2_queues_exit(struct cio2_device *cio2)
>>  static int cio2_pci_probe(struct pci_dev *pci_dev,
>>  			  const struct pci_device_id *id)
>>  {
>> +	struct fwnode_handle *endpoint;
>>  	struct cio2_device *cio2;
>>  	int r;
>>  
>> +	/*
>> +	 * On some platforms no connections to sensors are defined in firmware,
>> +	 * if the device has no endpoints then we can try to build those as
>> +	 * software_nodes parsed from SSDB.
>> +	 *
>> +	 * This may EPROBE_DEFER if supported devices are found defined in ACPI
>> +	 * but not yet ready for use (either not attached to the i2c bus yet,
>> +	 * or not done probing themselves).
>> +	 */
>> +
>> +	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&pci_dev->dev), NULL);
>> +	if (!endpoint) {
>> +		r = cio2_bridge_build(pci_dev);
>> +		if (r)
>> +			return r;
>> +	}
> } else {
> 	fwnode_handle_put(endpoint);
> }
Ah, of course, thank you.
