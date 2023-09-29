Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAD037B34DE
	for <lists+linux-media@lfdr.de>; Fri, 29 Sep 2023 16:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233424AbjI2O05 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Sep 2023 10:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233506AbjI2O0y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Sep 2023 10:26:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C81F9
        for <linux-media@vger.kernel.org>; Fri, 29 Sep 2023 07:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695997562;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SuHT3BbiUlX7XaG/d188UwFTWSb3CXGs/HmALVQVzZE=;
        b=I+swdTOWFzFIM9HX1dQJ/D21Wcjm8DTi4ge9m4PVz3XjI8Ffdoc8Yqhv2ZO80Zh+q0P7EE
        nsUpMQK6fjyNPc+1mxk1siE6tYWTnumhlp7inGMTHXCWL/QyT9xB2YMFjRf7BsItAHihSr
        P6dACP+xlX1hzaiboRcMoubhE7lFgJQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-Zsvm-acJPjGxb-X50-UYhA-1; Fri, 29 Sep 2023 10:26:01 -0400
X-MC-Unique: Zsvm-acJPjGxb-X50-UYhA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-32323283257so7628888f8f.2
        for <linux-media@vger.kernel.org>; Fri, 29 Sep 2023 07:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695997560; x=1696602360;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SuHT3BbiUlX7XaG/d188UwFTWSb3CXGs/HmALVQVzZE=;
        b=ObmmMUAjyixaDgZima+wZ8LXD0j5ABUeBRe6h1b4qFYpfoucLluKfQxcYAgUH+sjlk
         Jfi8IHR+9LTtH/kxgPDu8mdHx+jQ4t7apWSzBkOhrpQIulvOm4erzRohUR8WW0xOKX/c
         fD/jey0+hgbp5/3PhOmJThWUG/Cn92Dbe9wodMAtzKEeOovYAEv54rz4dhZcnjQ9KDAo
         2xm7GXFdQjOQJ+t0MhZeJJXxmWdBcT+C0DXUKuI4fGSNE3+ariGCDIC9DlNUSrPi/clG
         YjK/rTL6DoEWcsXQvKXgkZLh8XuljygK4cl+BdKpFOQlCx2ZmtDwL9Wbk/IwOFKsfmrr
         1x1A==
X-Gm-Message-State: AOJu0YzkJtkubUaVWMCYtdGKOS/oXlCDoX2NgFYlYr+yNxc5dTr2LK3K
        Rzi74bfWm01za++DUALQAO+VuTpEkuBT9vE59Rl1MxmzydFnEpf9fv9T1Iht2VGlwZVIzz2xFSu
        gk9dGMqDr+ZRxZbH/RfkABXU=
X-Received: by 2002:a5d:4a08:0:b0:31c:8880:5d0f with SMTP id m8-20020a5d4a08000000b0031c88805d0fmr4031725wrq.11.1695997560151;
        Fri, 29 Sep 2023 07:26:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkCkIOgjHeu0KXzCWmveEipftICmSRrYmPr0mFYOurGFSuy+OZ/7xbKILSbnOiVV0wQKAsmA==
X-Received: by 2002:a5d:4a08:0:b0:31c:8880:5d0f with SMTP id m8-20020a5d4a08000000b0031c88805d0fmr4031709wrq.11.1695997559786;
        Fri, 29 Sep 2023 07:25:59 -0700 (PDT)
Received: from [10.10.158.202] ([213.144.205.82])
        by smtp.gmail.com with ESMTPSA id w14-20020a5d680e000000b00325a59b2080sm1178653wru.97.2023.09.29.07.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 07:25:59 -0700 (PDT)
Message-ID: <44ed939b-4d57-9850-e08a-47319ba7d60e@redhat.com>
Date:   Fri, 29 Sep 2023 16:25:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 7/7] media: ov2740: Return -EPROBE_DEFER if no endpoint is
 found
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
References: <20230915072809.37886-1-sakari.ailus@linux.intel.com>
 <20230915072809.37886-8-sakari.ailus@linux.intel.com>
 <20230915095027.GH14641@pendragon.ideasonboard.com>
 <ZRbFF3RujYCBnBI/@kekkonen.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZRbFF3RujYCBnBI/@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 9/29/23 14:37, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Fri, Sep 15, 2023 at 12:50:27PM +0300, Laurent Pinchart wrote:
>> Hi Sakari,
>>
>> Thank you for the patch.
>>
>> On Fri, Sep 15, 2023 at 10:28:09AM +0300, Sakari Ailus wrote:
>>> With ipu bridge, endpoints may only be created when ipu bridge has
>>> initialised. This may happen after the sensor driver has first probed.
>>
>> That's hard to understand for someone not familiar with the ipu-bridge
>> driver. Could you please expand the commit message ?
>>
>> Also, is there a way to avoid the ov2740 probing before the required
>> initialization is complete ?
> 
> One possibility would be to move the ipu bridge functionality to the ACPI
> framework itself. Then it'd be independent of probing any drivers. It
> hasn't been discussed and I'm not sure what the result might be. In any
> case I'd like to have DisCo for Imaging support there first.

The problem is not the IPU bridge functionality per se. We already delay
sensor i2c-client instantiation on ipu3 and ipu6 till after the INT3472
driver has loaded since that does things like register gpio, clk and
regulator lookup tables to glue the ACPI approach into standard kernel
subsytems and probing before the lookups are there leads to dummy-regulators
and optional GPIOs and clks not working.

So one might argue that this bit of code should be moved to
the INT3472 code, making it delay i2c-client instantiation until
the fwnode-graph has been populated by the ipu-bridge code:

static int ov2740_check_hwcfg(struct device *dev)
{
        struct fwnode_handle *ep;
        struct fwnode_handle *fwnode = dev_fwnode(dev);

	...

	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
	if (!ep)
		return -EPROBE_DEFER;

But notice the `struct device *dev` parameter, that *is*
the i2c_client; and as soon as the INT3472 code has told
the ACPI core that it is ok to move forward with instantiating
the i2c_client by calling acpi_dev_clear_dependencies(INT3472-adev)
then it is too late to do this check inside INT3472 and before the
acpi_dev_clear_dependencies(INT3472-adev) call the i2c-client does
not exist.

So fixing this requires hacks in either the ACPI core and/or
in the i2c-core (to mark a device as initially unprobeable).

And then we are not talking about the atomisp2 yet where
the sensor ACPI device-nodes do not have a _DEP (dependency)
like INT3472 which we can use to delay instantiating
the i2c-clients.   With the INT3472 device we can use
the INT3472 hardware-id to trigger deferring instantiation
on that (by default the ACPI core does not honor _DEP for
various reasons). So delaying instantiation on atomisp2
hardware would mean maintaining a list of hardcoded sensor
hardware-ids for which we want to delay instantiation +
some other ACPI core hack to say: it is ok to move forward
with instantiation now.

Last time Sakari and I discussed this we came to
the conclusion that, e.g. (from ov2680.c):

	/*
         * Sometimes the fwnode graph is initialized by the bridge driver.
         * Bridge drivers doing this may also add GPIO mappings, wait for this.
         */
        ep_fwnode = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
        if (!ep_fwnode)
                return dev_err_probe(dev, -EPROBE_DEFER,
                                     "waiting for fwnode graph endpoint\n");

Is the least ugly way to deal with this, we have gone through
a lot of trouble to avoid adding ACPI-isms to the driver but this
one seems unavoidable.

Note though that the ov2680 code has both a comment and a
	return dev_err_probe(dev, -EPROBE_DEFER, ...)

This last one will make the kernel print messages about devices waiting
for deferred probe + the passed in reason 30 seconds after the last
successful probe() (any successful probe anywhere in the kernel
resets the 30 seconds counter).

This helps a lot to figure out why the driver is not binding if
it is not binding because of this code-path.

I believe it is the best to do the same thing as ov2680.c here too.

Regards,

Hans



> 
> Cc Hans.
> 
>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> ---
>>>  drivers/media/i2c/ov2740.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
>>> index de39a66b1b81..a132e8a283b4 100644
>>> --- a/drivers/media/i2c/ov2740.c
>>> +++ b/drivers/media/i2c/ov2740.c
>>> @@ -976,7 +976,7 @@ static int ov2740_check_hwcfg(struct device *dev)
>>>  
>>>  	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
>>>  	if (!ep)
>>> -		return -ENXIO;
>>> +		return -EPROBE_DEFER;
>>>  
>>>  	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
>>>  	fwnode_handle_put(ep);
>>
> 

