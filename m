Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C135444B14F
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 17:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237166AbhKIQis (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 11:38:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237350AbhKIQir (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Nov 2021 11:38:47 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8869BC061764
        for <linux-media@vger.kernel.org>; Tue,  9 Nov 2021 08:36:01 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id i5so34082907wrb.2
        for <linux-media@vger.kernel.org>; Tue, 09 Nov 2021 08:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=9eIj1bbtg5HOMIrS+ELWUQu2fqK0JhvhSVburvo43vk=;
        b=eigByJhJE5x1DzSJ0tYxWsIlcYTV6BV0XobkwTzxcCSBUtIHt43ZyqGCwX+MHFQkTD
         MPTJ6qy6aNwGytQLR54QK4DiDdMXxDQpkLkVwCOn+m7qJ5dNl0DoBIizewhmBAe7HbyJ
         r5HLy4yMhWuiZvDXb08NOxWESQxJnzupU3Wi6uVdL4snKI89DKC8MLa0Hyy/JXwebeP5
         y0yk3CKVjs2Yi++M6eV9VOpb9is7d8TmnqrF1jt8SiijU6x47vOJfUUnKHLPFSSSC5sI
         BbK62b7u11Mxz4XrUlK2+uMTT/a4mCvzluAXZAPSjdJKrVHzHUvnFXj3qgz4uOnzWke+
         1XwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9eIj1bbtg5HOMIrS+ELWUQu2fqK0JhvhSVburvo43vk=;
        b=aDZGn6JQQt/xXdwrLDy14MDAIKTDTvj6eiHBfNMmP+mrhl6DZZmJc8AvFJKPmBTBWZ
         oT1/IC674GbfZWPKE2KIOvxZhpNIVQm7yU+MQAhXyFFomY8XnjJxerpNQNcJQ/5dRwV2
         VMpVcOLn47Hp7ldUT6zmmA2F32aM77ckae69y4fUJQ5dRGy//8YgG9IuVmOViiDsbctn
         ouzI4bZ0PsB56P7qPvzkX5/3dZiffKOpNZXdqC+q5IE9XuINlrT67k6p8efcK7R5t7S4
         aFNW0iH9IP7JdRxVTuVFxHo2+ZVYmcIkLsfCD477oRrbX4k0/Cj5l3oQO/86N269L6zu
         Iwsg==
X-Gm-Message-State: AOAM532WXvo3awV82FyuOCzebzvJihRXf/cVwXNG1/7dm232MqtLcP3U
        4JYVB1Vg1udeDN+WUOR7Ocs=
X-Google-Smtp-Source: ABdhPJxEvnVy6eMvKW32RB5SBp4FqKwoi/sFpf88FuRe4RsqzpcGiBn5gSytYFiTzeJZSr/mDfjQww==
X-Received: by 2002:adf:fdc3:: with SMTP id i3mr10833289wrs.200.1636475759955;
        Tue, 09 Nov 2021 08:35:59 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id c15sm19960503wrs.19.2021.11.09.08.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 08:35:58 -0800 (PST)
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
 <58dabc46-211c-844d-3ed3-fd2411936d6d@gmail.com>
 <b0a6a762-3445-7c61-3510-6bd493f8e0fa@redhat.com>
 <d0f969f6-e029-7c28-17ce-79b8228ddaee@gmail.com>
 <b77cf78f-ea5e-adcc-a1b8-8cff77ebf847@gmail.com>
 <bbfb4bd6-871a-eb14-653c-64c05c22e165@redhat.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <29bf3454-2f82-7791-2aa2-c5e1cb5610a5@gmail.com>
Date:   Tue, 9 Nov 2021 16:35:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bbfb4bd6-871a-eb14-653c-64c05c22e165@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On 09/11/2021 16:02, Hans de Goede wrote:
> Hi,
>
> On 11/9/21 13:09, Daniel Scally wrote:
>> Hi Hans
>>
>> On 09/11/2021 00:43, Daniel Scally wrote:
>>> Hi Hans
>>>
>>> On 08/11/2021 13:12, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 11/2/21 00:43, Daniel Scally wrote:
>>>>> Hi Hans
>>>> <snip>
>>>>  
>>>>
>>>>>> 2. I need some help with all the fwnode link stuff (I'm not very familiar
>>>>>> with this). There seems to be a chicken and egg problem here though,
>>>>>> because the v4l2subdev for the VCM does not register because of async stuff
>>>>>> and if we add it to the "graph" then my idea to enumerate the VCMs
>>>>>> from the SSDB on the complete() callback won't work. But we can do this
>>>>>> on a per sensor basis instead from the cio2_notifier_bound() callback
>>>>>> instead I guess ?
>>>>> I think on top of your work in the cio2-bridge for patch 3 you can do this:
>>>>>
>>>>>
>>>>> 1. Create another software node against the cio2_sensor struct, with the
>>>>> name coming from the vcm_types array
>>>>>
>>>>> 2. Assign that software node to board_info.swnode in
>>>>> cio2_bridge_instantiate_vcm_i2c_client()
>>>>>
>>>>> 3. Add another entry to dev_properties for the sensor, that is named
>>>>> "lens-focus" and contains a reference to the software_node created in #2
>>>>> just like the references to the sensor/cio2 nodes.
>>>>>
>>>>>
>>>>> This way when the sensor driver calls
>>>>> v4l2_async_register_subdev_sensor() it should create a notifier that
>>>>> looks for that VCM client to bind. I think then rather than putting
>>>>> anything in the .bound() / .complete() callbacks, we should modify core
>>>>> to do _something_ when async matching some subdevs. The something would
>>>>> depend on the kind of devices that match, for example with the sensor
>>>>> driver and the ipu3-cio2 driver, there's an entity whos function is
>>>>> MEDIA_ENT_F_VID_IF_BRIDGE matching to an entity whos function is
>>>>> MEDIA_ENT_F_CAM_SENSOR, and it seems to me that every scenario like that
>>>>> is going to result in media pad links being created. Similarly for our
>>>>> sensor that's a device with entity function MEDIA_ENT_F_LENS matching to
>>>>> MEDIA_ENT_F_CAM_SENSOR, and I think that in those cases we can create
>>>>> either an interface link or a new kind of link (maybe
>>>>> "MEDIA_LNK_FL_ANCILLARY_LINK" or something...) between the two to show
>>>>> that they form a single logical unit, which we can then report to libcamera.
>>>>>
>>>>>
>>>>> Hope that makes sense...
>>>> Ok, so I gave this a try, see the attached patches, but the v4l2-subdev for
>>>> the VCM still does not show up.
>>> This is exactly where I got to over the weekend too
>>>
>>>> I think that instead I need to build a full link between the sensor
>>>> and the VCM similar to the cio2 <-> sensor link. Both ends of that link
>>>> have:
>>>>
>>>> <base-swnode attached to the device>
>>>> |
>>>> --<port-swnode named (SWNODE_GRAPH_PORT_NAME_FMT, X), where X is 0 on the
>>>>   |                           sensor side and the link nr on the cio2 side
>>>>   |
>>>>   --<end-point-swnode named (SWNODE_GRAPH_ENDPOINT_NAME_FMT, 0)
>>>>
>>>> And then the 2 endpoints contain a swref property pointing to the
>>>> other endpoint swnode.
>>>>
>>>> I think we need a similar setup adding a swnode child named
>>>> (SWNODE_GRAPH_PORT_NAME_FMT, 1), to the nodes[SWNODE_SENSOR_HID] node.
>>>>
>>>> Note 1, since 0 is the "port" to the cio2, this new port child then
>>>> gets an endpoint "0" child itself, likewise we add a "port 0" child
>>>> to the vcm swnode, with a "endpoint 0" child below that and then have
>>>> the 2 endpoints contain swref properties pointing to each other.
>>>>
>>>> I think that this will properly make the VCm part of the graph and
>>>> will make its v4l2-subdev get instantiated when the graph is
>>>> complete.  Before I spend a bunch of time on implementing this,
>>>> let me ask this:
>>>>
>>>> Does this sound reasonable / like I'm heading in the right direction?
>>> I don't think that we need to add the software nodes as
>>> ports/endpoints...as far as I can tell it ought to work like this:
>>>
>>>
>>> 1. The sensor calls v4l2_async_register_subdev_sensor() which...
>>>
>>>     a) creates a notifier
>>>
>>>     b) looks for reference properties of the device's fwnode called
>>> "lens-focus" and calls v4l2_async_notifier_add_fwnode_subdev() against
>>> the reference, which tells the notifier it's connected to this other
>>> fwnode and to expect it to bind.
>>>
>>> 2. When new subdevs are registered they get tested for a match against
>>> the notifier registered in 1a that matches to their fwnode using
>>> match_fwnode() [1]. This should work, on the grounds that we registered
>>> the device using the board_info.swnode and registered a lens-focus
>>> property that points to that software_node
>>>
>>> 3. When a match is found, the notifier's .bound() function is called.
>>> When all the asds that the notifier expects are bound the notifier's
>>> .complete() callback is called.
>>>
>>>
>>> That's not working correctly for me at the moment, but I think this is a
>>> surmountable problem rather than the wrong approach, so I'm just working
>>> through the differences to try and get the matching working.
>>
>> OK, I eventually got this working - the dw9719 registers as
>> /dev/v4l-subdev7 for me now ... long story short is the attached patch
>> was needed to make the references work, as the internals of v4l2 aren't
>> checking for fwnode->secondary. Prior to your latest series as well, an
>> additional problem was that once the VCMs fwnode was linked to the
>> sensor's the .complete() callback for ipu3-cio2 would never call
>> (because it needs ALL the devices for the linked fwnodes to be bound to
>> do that)...which meant the VCMs never got instantiated, because that was
>> where that function was called. With your new set separating those
>> processes it works well, so yes I like that new approach very much :D
>>
>>
>> In the end we don't have to add a call creating the subdev's - it turns
>> out that v4l2 knows it's part of ipu3-cio2's v4l2-device so it registers
>> the nodes for the vcm when .complete() is called for that driver. I
>> still think we should add a bit creating the link to expose to userspace
>> in match_notify() though.
>>
>>
>> Trying to list controls for the dw9719 with v4l2-ctl -d /dev/v4l-subdev7
>> -L fails with an IOCTL error, so I have some remedial work on the driver
>> which I'll do tonight; I'd expect to be able to control focus with
>> v4l2-ctl -d /dev/v4l-subdev7 -c absolute_focus=n once this is sorted.
> That is great, thank you so much. I wanted to look into this myself
> today but I got distracted by other stuff.


No problem; I'll link you the patches for the updated versions of
everything once I've sorted the IOCTL error tonight.

> Mainly getting Windows to work (including cameras) after a fresh
> Windows install on A Dell Latitude 7285 which I just got as a secondFwiw I gave up 
> device to test IPU3 stuff on :)
>
> Talking about this Dell Latitude 7285, I haven't had a chance to
> look into this at all. But chances are I will need to do some
> I2C-register dumps under Windows, last time you mentioned you
> had some small tool for this ? It is ok if it is a bit hackish,
> it will still be very useful to have :)  And I believe I will
> also need to override the DSDT under Windows for this, right?
> I should be able to cope with that too.


So the tool I was using was the I2cTestTool [1], which requires you to
first hack the DSDT to enable usermode access [2]. You need the
Microsoft ASL compiler [3] to insert the new DSDT, but fwiw I gave up
trying to use their tool to actually compile the table and just did it
running Ubuntu with iasl, then saved the file onto the Go2's SD card and
loaded it using asl.exe in Windows...the MS tool just wouldn't compile
for whatever reason.


All that said; you don't actually need to do this for the Latitude 7285
- on the Github thread a chap with that device found the schematics and
posted them [4], so we should already have the information we need to
populate the board data for that one. The sensor drivers need some work
though - the ov9734 I have a series somewhere that I think should work
but haven't ever tested, the ov8858 I don't think anyone's looked at yet.


[1]
https://github.com/microsoft/Windows-iotcore-samples/tree/develop/BusTools/I2cTestTool

[2]
https://docs.microsoft.com/en-us/windows/uwp/devices-sensors/enable-usermode-access

[3]
https://docs.microsoft.com/en-gb/windows-hardware/drivers/bringup/microsoft-asl-compiler

[4]
https://github.com/linux-surface/linux-surface/issues/91#issuecomment-829641311

>
> Regards,
>
> Hans
>
>>>
>>> For the devnodes, the ipu3-cio2 driver itself creates the devnodes for
>>> the subdevices that bind to it (like the sensor) as part of its
>>> .complete() callback [2] by calling v4l2_device_register_subdev_nodes(),
>>> as far as I can tell there's nothing in v4l2 core that handles that
>>> automatically so I think that that lack is what's preventing the
>>> devnodes from showing up. I think we should tackle the problem of the
>>> missing devnodes by mimicking the effects of that function somewhere
>>> within core, probably v4l2_async_match_notify() (which calls the
>>> notifier's .bound() callback). I think the creation of the links to
>>> expose to userspace that this is a logical unit should probably happen
>>> in the same place, using the entity.function field of the subdev and the
>>> asd to decide exactly what kind of link to create.
>>>
>>>
>>> [1]
>>> https://elixir.bootlin.com/linux/latest/source/drivers/media/v4l2-core/v4l2-async.c#L69
>>>
>>> [2]
>>> https://elixir.bootlin.com/linux/latest/source/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c#L1449
>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>
>>>>
>>>>
>>>> p.s.
>>>>
>>>> I have found a new solution for the probe-ordering problem which
>>>> is patch 2 of the attached patches, I personally I'm happy with
>>>> this solution. I hope you like it too.
