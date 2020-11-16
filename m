Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6921F2B40FE
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 11:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728780AbgKPKUx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 05:20:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbgKPKUw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 05:20:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A3DFC0613CF;
        Mon, 16 Nov 2020 02:20:52 -0800 (PST)
Received: from [192.168.0.217] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0601A1B;
        Mon, 16 Nov 2020 11:20:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1605522050;
        bh=YAn8HZAXXRZkJFW3dYKkdcJaqR1PGu8Q4CmPGl5nzTQ=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ROQNQUONpZL+1zMcGGBPbQ8/2hXBakyQIS9K7wMN+erYKx/K9kZ3zXPfMpfQGwPKK
         5HVFWY+Au/qj9R6nseio5lmw0xTqub/MOSVWMagTuLRVw7p+VEgYgnx73J3/csPBND
         lMedHEGZsYj+aVT4A7kLmxh46SsKAc+OeMIBL79E=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v4 1/8] media: i2c: Add driver for RDACM21 camera module
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20201112162729.101384-1-jacopo+renesas@jmondi.org>
 <20201112162729.101384-2-jacopo+renesas@jmondi.org>
 <95e2e968-d77f-0838-641a-d81a6df6f0b5@ideasonboard.com>
 <20201114140457.h7x6l53cfqqhpq6l@uno.localdomain>
 <20201116090833.GB6540@pendragon.ideasonboard.com>
 <20201116100302.mmv5skzk7s34ocxa@uno.localdomain>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <ef1196f4-28f3-5ca1-0e11-08e65c6a1abe@ideasonboard.com>
Date:   Mon, 16 Nov 2020 10:20:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116100302.mmv5skzk7s34ocxa@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/11/2020 10:03, Jacopo Mondi wrote:
> Hi Laurent,
> 
> On Mon, Nov 16, 2020 at 11:08:33AM +0200, Laurent Pinchart wrote:
>> Hi Jacopo,
>>
>> On Sat, Nov 14, 2020 at 03:04:57PM +0100, Jacopo Mondi wrote:
>>> On Thu, Nov 12, 2020 at 10:31:05PM +0000, Kieran Bingham wrote:
>>>> Hi Jacopo,
>>>
>>> [snip]
>>>
>>>>> +	/* Wait for firmware boot by reading streamon status. */
>>>>> +	ov490_write(dev, 0xfffd, 0x80);
>>>>> +	ov490_write(dev, 0xfffe, 0x29);
>>>>> +	usleep_range(100, 150);
>>>>> +	for (timeout = 300; timeout > 0; timeout--) {
>>>>> +		ov490_read(dev, 0xd000, &val);
>>>>> +		if (val == 0x0c)
>>>>
>>>> What is 0x0c here? Is it something we can better describe in a #define?
>>>>
>>>
>>> The 0x0c value itself means "frame output enable" + "whole frame
>>> output enable". I don't think it has much value to define it,
>>> otherwise we would need to define also the register 8029d000
>>
>> Shouldn't we have macros for *all* register addresses and fields ?
>>
> 
> I'm not sure it's worth it, we have a single register-value table, and
> the way ov490 is programmed, as you can see is to specify the high
> bytes of the 32-bits register to write in the special 'page' registers
> 0xfffd, 0xfffe (which I've not found documented)
> 
> 	ov490_write(dev, 0xfffd, 0x80);
> 	ov490_write(dev, 0xfffe, 0x29);
> 	ov490_read(dev, 0xd000, &val);
> 
> This, to my understanding reads register 0x8029d000
> 
> We would need three macros, maybe a
>         PAGE_HIGH(reg)  (u8)(reg >> 24)
>         PAGE_LOW(reg)   (u8)(reg >> 16)
>         REG_LOW(reg)    (u16)(reg)
> 
> To that's a lot of churn for no gain imho, the code isn't much more
> clear

To me it means we need a couple of helper functions.

ov490_write_long()
ov490_read_long().

(Or other names if appropriate)

Wouldn't that make the code clearer, and more maintainable? And then
allow more correct register definitions to be created?



>>> Also, the ov490 is programmed loading the content of a SPI Flash chip,
>>> I guess it's just known that "output enabled" is required to have
>>> stream operations properly working.
>>>
>>>>> +			break;
>>>>> +		mdelay(1);
>>>>> +	}
>>>>> +	if (!timeout) {
>>>>> +		dev_err(dev->dev, "Timeout firmware boot wait\n");
>>>>> +		return -ENODEV;
>>>>> +	}
>>>>> +	dev_dbg(dev->dev, "Firmware booted in %u msec\n", 300 - timeout);
>>>>> +
>>>>> +	/* Read OV10640 Id to test communications. */
>>>>> +	ov490_write(dev, 0xfffd, 0x80);
>>>>> +	ov490_write(dev, 0xfffe, 0x19);

The other one was a write to 0x80, 0x29, why is this now to 0x19?


>>>>> +	usleep_range(100, 150);
> 
> Not to add that I don't have register 0x80195000 in the documentation I've

Aha, so writing to 0xfffd, 0xfffe, 'sets' the top page. I see.

And I presume there must always be a usleep_range(100, 150) after any
page change?

Really sounds like a helper function to me, which keeps track of the
current page, and updates the page when needed.



> access to (the master SCCB control page is at  address 0x8090xxxx
> 
>>>>> +
>>>>> +	ov490_write(dev, 0x5000, 0x01);
>>>>> +	ov490_write(dev, 0x5001, 0x30);
>>>>> +	ov490_write(dev, 0x5002, 0x0a)
>>>>> +	ov490_write(dev, 0xfffe, 0x80);
> 
> This sequence in example, reads the 0x300a register of the slave
> (ov10640) by programming registers
>                 0x80195000      0x1
>                 0x80195001      0x30
>                 0x80195002      0x0a
> 
>>>>> +	usleep_range(100, 150);
>>>>> +	ov490_write(dev, 0xc0, 0xc1);
> 
> Triggering a transaction writing 0xc1 to 0x808000c0 (0xc1
> undocumented)


Do we do many reads of the connected sensor? or is this the only one.
If you know that's what's happening, I'd be tempted to say we should
wrap that up in a function to make it clearer too.



>>>>> +	ov490_write(dev, 0xfffe, 0x19);
>>>>> +	usleep_range(1000, 1500);
>>>>> +	ov490_read(dev, 0x5000, &val);
> 
> and reading back the transaction result at address 0x80195000
> 
> I got these parts from
> https://github.com/CogentEmbedded/meta-rcar/blob/v2.12.0/meta-rcar-gen3/recipes-kernel/linux/linux-renesas/0040-H3-MAX9286-TI964-support-add-10635-10640-cameras.patch#L3732
> 
> and that's why I kept Vladimir's authorship in MODULE_AUTHORS()

That's fine, but I think we can do better than dragging that code in
directly.



>>>>> +	if (val != OV10640_ID_LOW) {
>>>>> +		dev_err(dev->dev, "OV10640 ID mismatch: (0x%02x)\n", val);
>>>>> +		return -ENODEV;
>>>>> +	}
>>>>> +
>>>>> +	dev_dbg(dev->dev, "OV10640 ID = 0x%2x\n", val);
>>>>> +
>>>>> +	for (i = 0; i < ARRAY_SIZE(ov490_regs_wizard); ++i) {
>>>>> +		ret = ov490_write(dev, ov490_regs_wizard[i].reg,
>>>>> +				  ov490_regs_wizard[i].val);
>>>>> +		if (ret < 0) {
>>>>> +			dev_err(dev->dev,
>>>>> +				"%s: register %u (0x%04x) write failed (%d)\n",
>>>>> +				__func__, i, ov490_regs_wizard[i].reg, ret);
>>>>> +
>>>>> +			return -EIO;
>>>>> +		}
>>>>> +
>>>>> +		usleep_range(100, 150);
>>>>> +	}
>>>>> +
>>>>> +	/*
>>>>> +	 * The ISP is programmed with the content of a serial flash memory.
>>>>> +	 * Read the firmware configuration to reflect it through the V4L2 APIs.
>>>>> +	 */
>>>>> +	ov490_write(dev, 0xfffd, 0x80);
>>>>> +	ov490_write(dev, 0xfffe, 0x82);
>>>>> +	usleep_range(100, 150);
>>>>> +	ov490_read(dev, OV490_ISP_HSIZE_HIGH, &val);
>>>>> +	dev->fmt.width = (val & 0xf) << 8;
>>>>> +	ov490_read(dev, OV490_ISP_HSIZE_LOW, &val);
>>>>> +	dev->fmt.width |= (val & 0xff);
>>>>> +
>>>>> +	ov490_read(dev, OV490_ISP_VSIZE_HIGH, &val);
>>>>> +	dev->fmt.height = (val & 0xf) << 8;
>>>>> +	ov490_read(dev, OV490_ISP_VSIZE_LOW, &val);
>>>>> +	dev->fmt.height |= val & 0xff;
>>>>> +
>>>>> +	/* Set bus width to 12 bits [0:11] */
>>>>> +	ov490_write(dev, 0xfffd, 0x80);
>>>>> +	ov490_write(dev, 0xfffe, 0x28);
>>>>> +	usleep_range(100, 150);
>>>>> +	ov490_write(dev, 0x6009, 0x10);
>>>>> +
>>>>> +	dev_info(dev->dev, "Identified RDACM21 camera module\n");
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static int rdacm21_initialize(struct rdacm21_device *dev)
>>>>> +{
>>>>> +	int ret;
>>>>> +
>>>>> +	/* Verify communication with the MAX9271: ping to wakeup. */
>>>>> +	dev->serializer->client->addr = MAX9271_DEFAULT_ADDR;
>>>>> +	i2c_smbus_read_byte(dev->serializer->client);
>>>>> +
>>>>> +	/* Serial link disabled during config as it needs a valid pixel clock. */
>>>>> +	ret = max9271_set_serial_link(dev->serializer, false);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	/* Set GPO high to hold OV490 in reset during max9271 configuration. */
>>>>> +	ret = max9271_set_gpios(dev->serializer, MAX9271_GPO);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	/* Configure I2C bus at 105Kbps speed and configure GMSL link. */
>>>>> +	ret = max9271_configure_i2c(dev->serializer,
>>>>> +				    MAX9271_I2CSLVSH_469NS_234NS |
>>>>> +				    MAX9271_I2CSLVTO_1024US |
>>>>> +				    MAX9271_I2CMSTBT_105KBPS);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	ret = max9271_configure_gmsl_link(dev->serializer);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	ret = max9271_set_address(dev->serializer, dev->addrs[0]);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +	dev->serializer->client->addr = dev->addrs[0];
>>>>> +
>>>>> +	/*
>>>>> +	 * Release OV490 from reset and program address translation
>>>>> +	 * before performing OV490 configuration.
>>>>> +	 */
>>>>> +	ret = max9271_clear_gpios(dev->serializer, MAX9271_GPO);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	ret = max9271_set_translation(dev->serializer, dev->addrs[1],
>>>>> +				      OV490_I2C_ADDRESS);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +	dev->isp->addr = dev->addrs[1];
>>>>> +
>>>>> +	ret = ov490_initialize(dev);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	/*
>>>>> +	 * Set reverse channel high threshold to increase noise immunity.
>>>>> +	 *
>>>>> +	 * This should be compensated by increasing the reverse channel
>>>>> +	 * amplitude on the remote deserializer side.
>>>>> +	 */
>>>>> +	ret = max9271_set_high_threshold(dev->serializer, true);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static int rdacm21_probe(struct i2c_client *client)
>>>>> +{
>>>>> +	struct rdacm21_device *dev;
>>>>> +	struct fwnode_handle *ep;
>>>>> +	int ret;
>>>>> +
>>>>> +	dev = devm_kzalloc(&client->dev, sizeof(*dev), GFP_KERNEL);
>>>>> +	if (!dev)
>>>>> +		return -ENOMEM;
>>>>> +	dev->dev = &client->dev;
>>>>> +
>>>>> +	dev->serializer = devm_kzalloc(&client->dev, sizeof(*dev->serializer),
>>>>> +				       GFP_KERNEL);
>>>>> +	if (!dev->serializer)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>> +	dev->serializer->client = client;
>>>>> +
>>>>> +	ret = of_property_read_u32_array(client->dev.of_node, "reg",
>>>>> +					 dev->addrs, 2);
>>>>> +	if (ret < 0) {
>>>>> +		dev_err(dev->dev, "Invalid DT reg property: %d\n", ret);
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +
>>>>> +	/* Create the dummy I2C client for the sensor. */
>>>>> +	dev->isp = i2c_new_dummy_device(client->adapter, OV490_I2C_ADDRESS);
>>>>> +	if (IS_ERR(dev->isp))
>>>>> +		return PTR_ERR(dev->isp);
>>>>> +
>>>>> +	ret = rdacm21_initialize(dev);
>>>>> +	if (ret < 0)
>>>>> +		goto error;
>>>>> +
>>>>> +	/* Initialize and register the subdevice. */
>>>>> +	v4l2_i2c_subdev_init(&dev->sd, client, &rdacm21_subdev_ops);
>>>>> +	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>>>>> +
>>>>> +	v4l2_ctrl_handler_init(&dev->ctrls, 1);
>>>>> +	v4l2_ctrl_new_std(&dev->ctrls, NULL, V4L2_CID_PIXEL_RATE,
>>>>> +			  OV10640_PIXEL_RATE, OV10640_PIXEL_RATE, 1,
>>>>> +			  OV10640_PIXEL_RATE);
>>>>> +	dev->sd.ctrl_handler = &dev->ctrls;
>>>>> +
>>>>> +	ret = dev->ctrls.error;
>>>>> +	if (ret)
>>>>> +		goto error_free_ctrls;
>>>>> +
>>>>> +	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
>>>>> +	dev->sd.entity.flags |= MEDIA_ENT_F_CAM_SENSOR;
>>>>> +	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
>>>>> +	if (ret < 0)
>>>>> +		goto error_free_ctrls;
>>>>> +
>>>>> +	ep = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
>>>>> +	if (!ep) {
>>>>> +		dev_err(&client->dev,
>>>>> +			"Unable to get endpoint in node %pOF\n",
>>>>> +			client->dev.of_node);
>>>>> +		ret = -ENOENT;
>>>>> +		goto error_free_ctrls;
>>>>> +	}
>>>>> +	dev->sd.fwnode = ep;
>>>>> +
>>>>> +	ret = v4l2_async_register_subdev(&dev->sd);
>>>>> +	if (ret)
>>>>> +		goto error_put_node;
>>>>> +
>>>>> +	return 0;
>>>>> +
>>>>> +error_put_node:
>>>>> +	fwnode_handle_put(dev->sd.fwnode);
>>>>> +error_free_ctrls:
>>>>> +	v4l2_ctrl_handler_free(&dev->ctrls);
>>>>> +error:
>>>>> +	i2c_unregister_device(dev->isp);
>>>>> +
>>>>> +	return ret;
>>>>> +}
>>>>> +
>>>>> +static int rdacm21_remove(struct i2c_client *client)
>>>>> +{
>>>>> +	struct rdacm21_device *dev = i2c_to_rdacm21(client);
>>>>> +
>>>>> +	fwnode_handle_put(dev->sd.fwnode);
>>>>> +	v4l2_async_unregister_subdev(&dev->sd);
>>>>> +	v4l2_ctrl_handler_free(&dev->ctrls);
>>>>> +	i2c_unregister_device(dev->isp);
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static const struct of_device_id rdacm21_of_ids[] = {
>>>>> +	{ .compatible = "imi,rdacm21" },
>>>>> +	{ }
>>>>> +};
>>>>> +MODULE_DEVICE_TABLE(of, rdacm21_of_ids);
>>>>> +
>>>>> +static struct i2c_driver rdacm21_i2c_driver = {
>>>>> +	.driver	= {
>>>>> +		.name	= "rdacm21",
>>>>> +		.of_match_table = rdacm21_of_ids,
>>>>> +	},
>>>>> +	.probe_new	= rdacm21_probe,
>>>>> +	.remove		= rdacm21_remove,
>>>>> +};
>>>>> +
>>>>> +module_i2c_driver(rdacm21_i2c_driver);
>>>>> +
>>>>> +MODULE_DESCRIPTION("GMSL Camera driver for RDACM21");
>>>>> +MODULE_AUTHOR("Jacopo Mondi, Kieran Bingham, Laurent Pinchart, Niklas Söderlund, Vladimir Barinov");
>>>>
>>>> I think by this point you could chop MODULE_AUTHOR for this one down to
>>>> just you ;-)
>>>>
>>>>
>>>> A fairly arbitrary, and cursory
>>>>
>>>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>>
>>>> I'll be aiming to test this (series) as soon as I can too.
>>>
>>> Thanks, let me know if I should submit for proper inclusion!
>>>
>>>>> +MODULE_LICENSE("GPL v2");
>>
>> --
>> Regards,
>>
>> Laurent Pinchart

