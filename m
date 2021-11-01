Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB80442441
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 00:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbhKAXpu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 19:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbhKAXpr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 19:45:47 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E2DC061714
        for <linux-media@vger.kernel.org>; Mon,  1 Nov 2021 16:43:13 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id o14so30439746wra.12
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 16:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=O10au1hHtrja/v/8/NHPudJ8rIic3kJ6GfWorzqnpjk=;
        b=R646zbbYvj19igQMgHmsp7NRAQtL0hejvZlTL+aQDHUo6iRMCEw3WGpT0JIOXrKTAY
         +Z/1uMmX3WmTFjR59XaelBqO245U4lDY5Z3fPY1PHdgcoD7oqVi33iOgH6y2nFrh4y2G
         lJLLTPlT02hpXMk8JR2zSfzsuNCe5VxBWSIv0Cu3LwQsP11ofqd2AEVVYmu5kUv6xxrW
         ErqAiqccZ0c3JLCnyX5kX7pjRXcQDwy8ofmTZTh7OJw4r/vHu+k/N6vHeqb+bNSvnHtY
         5jcWZyBqOSlmWwdGnTJr4exfv5SQfa+VE36Hfcdg98sy6reyrzvpQZ5gboacGsy2LW89
         Mljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=O10au1hHtrja/v/8/NHPudJ8rIic3kJ6GfWorzqnpjk=;
        b=PCmCwoMAm0sSzNfqYZduya2XadfWiLMK3dkXbS68givwoFBulMccbVHJF43ESKeOI6
         u/wgu/uAchmaFwVADwiItv5F0bGoQWRDsi8nmkwimYodH6Dvt72KRxc0BTSI3XoQDux1
         zNqmAotUYT2MoVxVYLiW8o5Etp1fGtJDpZWb8GU1qtBf1TIXYOyrMx+K0gYdozr3pwN7
         1ZEgOYX0iXmXBIy+DxS1rxrAu3nhU1QkFUf9fOOXMXBThlXa9jRvptbsV/Vh0NeifkXI
         BEZv3Eo4jkFbFNp7j/iHPTfAyIZmSoJ38zpDskq21rDZDXnBofWR0qjP5DTItXpchwVz
         RCAg==
X-Gm-Message-State: AOAM532jueNAFYsM7X4YQD0ZigqY52OxYA0bZ2eWXdjjO3Fh/ZnQPUoF
        a7ELqGQvSaE6GoYzH861H/s=
X-Google-Smtp-Source: ABdhPJx9wkl7OBvHBc/vdAEs96gulfmYfMRZXeCgXT8aebi2GFupjXQPHet/mnfxJ/5IQ3PRG7Wj4Q==
X-Received: by 2002:a05:6000:10cb:: with SMTP id b11mr30025628wrx.71.1635810191784;
        Mon, 01 Nov 2021 16:43:11 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id f81sm829236wmf.22.2021.11.01.16.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 16:43:11 -0700 (PDT)
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
To:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
 <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com>
 <418dc16a-2a03-7604-a8e2-31c5ddfcf436@redhat.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <58dabc46-211c-844d-3ed3-fd2411936d6d@gmail.com>
Date:   Mon, 1 Nov 2021 23:43:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <418dc16a-2a03-7604-a8e2-31c5ddfcf436@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On 01/11/2021 16:02, Hans de Goede wrote:
>
> On 10/29/21 13:50, Daniel Scally wrote:
>> Hi all
>>
>>
>> +CC linux-media and libcamera-devel, as it's probably a good time to
>> broaden this out. Also Andy because I'm hoping you can help :) The
>> background of the discussion is about how we identify and enumerate
>> (correctly, I.E. with a type matching the vcm driver's i2c_device_id,
>> and there are a few different vcm's in scope which seem encoded in the
>> SSDB buffer) which VCM module is linked to a sensor in Intel's IPU3
>> centric ACPI tables. The I2C address for the device is just a second
>> I2cSerialBusV2 against the sensor's acpi device rather than a separate
>> one, which is no awkward. We also need to get firmware created for the
>> VCM such that the sensor will link to it via the lens-focus property.
>>
>> On 28/10/2021 09:57, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 10/28/21 10:49, Laurent Pinchart wrote:
>>>> Hi Hans,
>>>>
>>>> On Thu, Oct 28, 2021 at 09:51:08AM +0200, Hans de Goede wrote:
>>>>> On 10/28/21 09:10, Daniel Scally wrote:
>>>>>> On 27/10/2021 15:16, Hans de Goede wrote:
>>>>>>> On 10/27/21 12:07, Daniel Scally wrote:
>>>>>>>> On 26/10/2021 11:14, Hans de Goede wrote:
>>>>>>>>>>> So yesterday I already sorta guessed it would be the DW9714 because of
>>>>>>>>>>> the 0x0c address and I tried:
>>>>>>>>>>>
>>>>>>>>>>> i2ctransfer -y 2 w2@0x0c 0x00 0x00
>>>>>>>>>>>
>>>>>>>>>>> And the transfer fails, while according to the driver that is a valid
>>>>>>>>>>> value. So maybe we are missing a regulator enable? Or its not a DW9714.
>>>>>>>>>>>
>>>>>>>>>>> Also "i2cdetect -y -r 2" does not see anything at address 0x0c (but some of
>>>>>>>>>>> these VCMs seem to be write only...) it does OTOH see an unknown device at
>>>>>>>>>>> address 0x21.
>>>>>>>>>> Well, when debugging the necessary TPS68470 settings I used a poor man's
>>>>>>>>>> i2ctransfer on Windows whilst the camera was running to read the values
>>>>>>>>>> that were set for both the PMIC and the camera sensor. Using the same
>>>>>>>>>> program I can connect to and read values from a device at 0x0c,
>>>>>>>> Just as further testing I dumped the contents of the device at 0x0c,
>>>>>>>> which comes back as
>>>>>>>>
>>>>>>>> f1 1 2 1 61 0 40 60
>>>>>>>>
>>>>>>>> Byte 0 is given in the driver you linked as the ID field and expected to
>>>>>>>> be f1. The driver controls focus by writing to the 3rd and 4th byte
>>>>>>>> (with the 4th being the LSB); the only value that seemed to fluctuate
>>>>>>>> when running windows and moving my hand in front of the sensor was byte
>>>>>>>> 4 and testing it out I wrote values into that byte and the focus
>>>>>>>> changes. So the device at 0x0c is definitely the vcm and it sure looks
>>>>>>>> like it's the DW9719
>>>>>>>>
>>>>>>>> The device at 0x21 is only available on Windows when the camera is
>>>>>>>> running, I thought it was quite likely that one of the "spare"
>>>>>>>> regulators from the TPS68470. One line is called VCM, and sure enough
>>>>>>>> it's enabled whilst the world-facing camera is running. I switched to
>>>>>>>> linux and started streaming the back camera, then enabled that voltage
>>>>>>>> regulator via i2ctransfer:
>>>>>>>>
>>>>>>>> sudo i2ctransfer 2 w2@0x4d 0x3c 0x6d
>>>>>>>>
>>>>>>>> sudo i2ctransfer 2 w2@0x4d 0x44 0x01
>>>>>>>>
>>>>>>>> And now i2cdetect shows the device at 0x0c on bus 2 - so we need more
>>>>>>>> jiggery pokey to map that VCM regulator to this new device (once we've
>>>>>>>> gotten it enumerated...) and the driver needs to have a tweak to call
>>>>>>>> regulator get and do a power on at some point.
>>>>>>> Awesome, great job on figuring this out!
>>>>>>>
>>>>>>> As you know I can spend $dayjob time on this, so I'll take on the job
>>>>>>> of creating the i2c-client and hooking up the regulator in some
>>>>>>> upstreamable manner.
>>>>>> Okedokey cool. I'd probably start at the cio2-bridge, if only because we
>>>>>> already have the adev there and the SSDB buffer loaded, so should be
>>>>>> easy enough to add an enum for the vcm_type and a call to
>>>>>> i2c_acpi_new_device()...bit of a weird place for that though I guess.
>>>>> Ah, I was actually thinking about doing this int he int3472 code for
>>>>> a number of reasons:
>>>>>
>>>>> 1. We already have the regulator_init_data there and we will need to
>>>>> expand it for this.
>>>>>
>>>>> 2. It is sorta the central place where we deal with all this glue-stuff
>>>> I'm not too sure about that. The INT3472 model the "Intel camera PMIC"
>>>> (I don't remember the exact wording, but that's more or less how the
>>>> device is described in Windows, and it matches the intent we see in the
>>>> DSDT).
>>> I agree that the INT3472 models the PMIC, or whatever discrete bits
>>> which offer similar functionality.
>>>
>>>> Given that we already have cio2-bridge, and that it hooks up the
>>>> sensor to the CIO2, it seems to me that it would be a better central
>>>> place.
>>> Ok, I was sorta expecting you to want to keep glue code like this
>>> out of drivers/media. But I guess that only applies to putting ACPI
>>> specific stuff in sensor drivers; and since the cio2-bridge code is
>>> already x86/ACPI specific you are fine with adding ACPI code there?
>>>
>>> I'm fine with putting the VCM i2c-client instantiation in the
>>> cio2-bridge code, that may also make it easier to tie the 2 together
>>> at the media-controller level.
>>
>> Having looked at this yesterday evening I'm more and more convinced it's
>> necessary. I hacked it into the ov8865 driver in the interim (just by
>> calling i2c_acpi_new_device() in probe) and then worked on that dw9719
>> code you found [1] to turn it into an i2c driver (attached, though still
>> needs a bit of work), which will successfully bind to the i2c client
>> enumerated by that i2c_acpi_new_device() call. From there though it
>> needs a way for the v4l2 subdev to be matched to the sensor's subdev.
>> This can happen automatically by way of the lens-focus firmware property
>> against the sensor - we currently build those in the cio2-bridge, so
>> adding another software node for the VCM and creating a lens-focus
>> property for the sensor's software_node with a pointer to the VCM's node
>> seems like the best way to do that.
> So besides prepping a v5 of my previous series, with update regulator
> init-data for the VCM I've also been looking into this, attached are
> the results.
>
> Some notes from initial testing:
>
> 1. The driver you attached will only successful probe if I insmod
> it while streaming video from the sensor. So I think we need another
> regulator or the clk for just the VCM too, I will investigate this
> later this week.

Oh really, I'll test that too; thanks for the patches. There's a couple
of tweaks to the driver anyway, so hopefully be able to get it ironed out.


Regarding this comment on your 2nd patch:


Note there seems to be a pre-existing problem where there is no teardown
of the bridge?


I forget the exact reasoning, but this was deliberately done when we
originally merged the bridge code. I'll see if I can dig out the old
discussion where we decided to go that way, but my search-fu is failing
me at the moment.

> 2. I need some help with all the fwnode link stuff (I'm not very familiar
> with this). There seems to be a chicken and egg problem here though,
> because the v4l2subdev for the VCM does not register because of async stuff
> and if we add it to the "graph" then my idea to enumerate the VCMs
> from the SSDB on the complete() callback won't work. But we can do this
> on a per sensor basis instead from the cio2_notifier_bound() callback
> instead I guess ?


I think on top of your work in the cio2-bridge for patch 3 you can do this:


1. Create another software node against the cio2_sensor struct, with the
name coming from the vcm_types array

2. Assign that software node to board_info.swnode in
cio2_bridge_instantiate_vcm_i2c_client()

3. Add another entry to dev_properties for the sensor, that is named
"lens-focus" and contains a reference to the software_node created in #2
just like the references to the sensor/cio2 nodes.


This way when the sensor driver calls
v4l2_async_register_subdev_sensor() it should create a notifier that
looks for that VCM client to bind. I think then rather than putting
anything in the .bound() / .complete() callbacks, we should modify core
to do _something_ when async matching some subdevs. The something would
depend on the kind of devices that match, for example with the sensor
driver and the ipu3-cio2 driver, there's an entity whos function is
MEDIA_ENT_F_VID_IF_BRIDGE matching to an entity whos function is
MEDIA_ENT_F_CAM_SENSOR, and it seems to me that every scenario like that
is going to result in media pad links being created. Similarly for our
sensor that's a device with entity function MEDIA_ENT_F_LENS matching to
MEDIA_ENT_F_CAM_SENSOR, and I think that in those cases we can create
either an interface link or a new kind of link (maybe
"MEDIA_LNK_FL_ANCILLARY_LINK" or something...) between the two to show
that they form a single logical unit, which we can then report to libcamera.


Hope that makes sense...

>
> Can someone give me some hints how the fwnode link code should look/work
> and how I can get the async registering of the subdev for the VCM to
> complete ?
>
> Regards,
>
> Hans
>
>
>
>
>>
>> To throw a spanner in the works though; I noticed this delightful _CRS
>> for the OV9734 sensor of a  Surface Laptop 1 earlier:
>>
>>
>> Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
>> {
>>     Name (SBUF, ResourceTemplate ()
>>     {
>>         I2cSerialBusV2 (0x0036, ControllerInitiated, 0x00061A80,
>>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>>             0x00, ResourceConsumer, , Exclusive,
>>             )
>>         I2cSerialBusV2 (0x0050, ControllerInitiated, 0x00061A80,
>>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>>             0x00, ResourceConsumer, , Exclusive,
>>             )
>>         I2cSerialBusV2 (0x0051, ControllerInitiated, 0x00061A80,
>>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>>             0x00, ResourceConsumer, , Exclusive,
>>             )
>>         I2cSerialBusV2 (0x0052, ControllerInitiated, 0x00061A80,
>>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>>             0x00, ResourceConsumer, , Exclusive,
>>             )
>>         I2cSerialBusV2 (0x0053, ControllerInitiated, 0x00061A80,
>>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>>             0x00, ResourceConsumer, , Exclusive,
>>             )
>>     })
>>     Return (SBUF) /* \_SB_.PCI0.I2C2.CAMF._CRS.SBUF */
>> }
> Hmm, we do have i2c_acpi_client_count(adev), so it is easy to use
> that and just always use the last resource for the VCM. But that assumes
> that is what is going on here and I have no idea.
>
> Regards,
>
> Hans
