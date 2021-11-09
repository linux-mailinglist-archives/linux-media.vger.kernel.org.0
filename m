Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 878C344B0D2
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 17:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238403AbhKIQFM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 11:05:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41017 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236475AbhKIQFL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Nov 2021 11:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636473745;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QeqhO8LdgIwx7XbjD5FvYnW4mubWV0mM0TFuqZnc/DA=;
        b=i0SJFPLRbpw854Y+rb5fq/t7nodBbQdIIIVgLx60bpYRWrChDxETZEAxb2jSn1GIJpsqpY
        Jg05jaSt0D3Rr95S2UpUJUvoT+yV7nrMuLu/pQRlGpa65J4wGZHHucA0m5dKGnIMvXx9Zu
        tZhcp7w9gfYpguvgyLiGyG7rP43Slj0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-MGBEIpPSMhK4hJKlza6R_Q-1; Tue, 09 Nov 2021 11:02:23 -0500
X-MC-Unique: MGBEIpPSMhK4hJKlza6R_Q-1
Received: by mail-ed1-f72.google.com with SMTP id d11-20020a50cd4b000000b003da63711a8aso18269320edj.20
        for <linux-media@vger.kernel.org>; Tue, 09 Nov 2021 08:02:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QeqhO8LdgIwx7XbjD5FvYnW4mubWV0mM0TFuqZnc/DA=;
        b=2q3ReE2vAcxsgMIsphn5ud06Sf/YXZyp1d0HGDB/8/sNMBdjamo6NUhmPTY0ZhepuK
         FPxpj3eIqH9fHxVmP889brGPRrHnCNNXK3g14Bg7BJz8WP6OItw4rl142WjTOiks8Usx
         mCuADL26G1G/dIh5ZtBajolNzh7aLoiTW2ZwmsNYdTEUsBKtJSpmHtGTSJhEzlNqcVn+
         HXkD1d1X+UvYtqOWrNuTOsL8T8cgMLiE/cQQUE8dekmTTNHMUv0TvweqwbErVGLFVnos
         FqpA6H2r2yWAUBkJqesKl0iO/FVD1Lp40XXF/lmE/MbGruam7qvZiUPuLK9LA/VsUimH
         9Jzg==
X-Gm-Message-State: AOAM531bwBokvMh8cOPoD5LELuFidLPnkErIZTkYxoj2QKBwhMuCSYEV
        2/uZwii6ECsVBlelCEe08CUC+uui6bjQ4fBpcwLUBQSZM+uk9tvHveYdjuszGPKmWoza1TDR2Eh
        5OU7kdw5+5Aj3m4Ty1+0yWoA=
X-Received: by 2002:a05:6402:40ce:: with SMTP id z14mr11579003edb.294.1636473742139;
        Tue, 09 Nov 2021 08:02:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVRpywvrSngrG7kUBo7sP/71HjmFnhRIAM+b7cH42+c+jO8Y7rsw5KyqGMQU4dJNH3RCpNQg==
X-Received: by 2002:a05:6402:40ce:: with SMTP id z14mr11578950edb.294.1636473741794;
        Tue, 09 Nov 2021 08:02:21 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id j12sm7935771edr.67.2021.11.09.08.02.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 08:02:21 -0800 (PST)
Message-ID: <bbfb4bd6-871a-eb14-653c-64c05c22e165@redhat.com>
Date:   Tue, 9 Nov 2021 17:02:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>,
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
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <b77cf78f-ea5e-adcc-a1b8-8cff77ebf847@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/9/21 13:09, Daniel Scally wrote:
> Hi Hans
> 
> On 09/11/2021 00:43, Daniel Scally wrote:
>> Hi Hans
>>
>> On 08/11/2021 13:12, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 11/2/21 00:43, Daniel Scally wrote:
>>>> Hi Hans
>>> <snip>
>>>  
>>>
>>>>> 2. I need some help with all the fwnode link stuff (I'm not very familiar
>>>>> with this). There seems to be a chicken and egg problem here though,
>>>>> because the v4l2subdev for the VCM does not register because of async stuff
>>>>> and if we add it to the "graph" then my idea to enumerate the VCMs
>>>>> from the SSDB on the complete() callback won't work. But we can do this
>>>>> on a per sensor basis instead from the cio2_notifier_bound() callback
>>>>> instead I guess ?
>>>> I think on top of your work in the cio2-bridge for patch 3 you can do this:
>>>>
>>>>
>>>> 1. Create another software node against the cio2_sensor struct, with the
>>>> name coming from the vcm_types array
>>>>
>>>> 2. Assign that software node to board_info.swnode in
>>>> cio2_bridge_instantiate_vcm_i2c_client()
>>>>
>>>> 3. Add another entry to dev_properties for the sensor, that is named
>>>> "lens-focus" and contains a reference to the software_node created in #2
>>>> just like the references to the sensor/cio2 nodes.
>>>>
>>>>
>>>> This way when the sensor driver calls
>>>> v4l2_async_register_subdev_sensor() it should create a notifier that
>>>> looks for that VCM client to bind. I think then rather than putting
>>>> anything in the .bound() / .complete() callbacks, we should modify core
>>>> to do _something_ when async matching some subdevs. The something would
>>>> depend on the kind of devices that match, for example with the sensor
>>>> driver and the ipu3-cio2 driver, there's an entity whos function is
>>>> MEDIA_ENT_F_VID_IF_BRIDGE matching to an entity whos function is
>>>> MEDIA_ENT_F_CAM_SENSOR, and it seems to me that every scenario like that
>>>> is going to result in media pad links being created. Similarly for our
>>>> sensor that's a device with entity function MEDIA_ENT_F_LENS matching to
>>>> MEDIA_ENT_F_CAM_SENSOR, and I think that in those cases we can create
>>>> either an interface link or a new kind of link (maybe
>>>> "MEDIA_LNK_FL_ANCILLARY_LINK" or something...) between the two to show
>>>> that they form a single logical unit, which we can then report to libcamera.
>>>>
>>>>
>>>> Hope that makes sense...
>>> Ok, so I gave this a try, see the attached patches, but the v4l2-subdev for
>>> the VCM still does not show up.
>>
>> This is exactly where I got to over the weekend too
>>
>>> I think that instead I need to build a full link between the sensor
>>> and the VCM similar to the cio2 <-> sensor link. Both ends of that link
>>> have:
>>>
>>> <base-swnode attached to the device>
>>> |
>>> --<port-swnode named (SWNODE_GRAPH_PORT_NAME_FMT, X), where X is 0 on the
>>>   |                           sensor side and the link nr on the cio2 side
>>>   |
>>>   --<end-point-swnode named (SWNODE_GRAPH_ENDPOINT_NAME_FMT, 0)
>>>
>>> And then the 2 endpoints contain a swref property pointing to the
>>> other endpoint swnode.
>>>
>>> I think we need a similar setup adding a swnode child named
>>> (SWNODE_GRAPH_PORT_NAME_FMT, 1), to the nodes[SWNODE_SENSOR_HID] node.
>>>
>>> Note 1, since 0 is the "port" to the cio2, this new port child then
>>> gets an endpoint "0" child itself, likewise we add a "port 0" child
>>> to the vcm swnode, with a "endpoint 0" child below that and then have
>>> the 2 endpoints contain swref properties pointing to each other.
>>>
>>> I think that this will properly make the VCm part of the graph and
>>> will make its v4l2-subdev get instantiated when the graph is
>>> complete.  Before I spend a bunch of time on implementing this,
>>> let me ask this:
>>>
>>> Does this sound reasonable / like I'm heading in the right direction?
>> I don't think that we need to add the software nodes as
>> ports/endpoints...as far as I can tell it ought to work like this:
>>
>>
>> 1. The sensor calls v4l2_async_register_subdev_sensor() which...
>>
>>     a) creates a notifier
>>
>>     b) looks for reference properties of the device's fwnode called
>> "lens-focus" and calls v4l2_async_notifier_add_fwnode_subdev() against
>> the reference, which tells the notifier it's connected to this other
>> fwnode and to expect it to bind.
>>
>> 2. When new subdevs are registered they get tested for a match against
>> the notifier registered in 1a that matches to their fwnode using
>> match_fwnode() [1]. This should work, on the grounds that we registered
>> the device using the board_info.swnode and registered a lens-focus
>> property that points to that software_node
>>
>> 3. When a match is found, the notifier's .bound() function is called.
>> When all the asds that the notifier expects are bound the notifier's
>> .complete() callback is called.
>>
>>
>> That's not working correctly for me at the moment, but I think this is a
>> surmountable problem rather than the wrong approach, so I'm just working
>> through the differences to try and get the matching working.
> 
> 
> OK, I eventually got this working - the dw9719 registers as
> /dev/v4l-subdev7 for me now ... long story short is the attached patch
> was needed to make the references work, as the internals of v4l2 aren't
> checking for fwnode->secondary. Prior to your latest series as well, an
> additional problem was that once the VCMs fwnode was linked to the
> sensor's the .complete() callback for ipu3-cio2 would never call
> (because it needs ALL the devices for the linked fwnodes to be bound to
> do that)...which meant the VCMs never got instantiated, because that was
> where that function was called. With your new set separating those
> processes it works well, so yes I like that new approach very much :D
> 
> 
> In the end we don't have to add a call creating the subdev's - it turns
> out that v4l2 knows it's part of ipu3-cio2's v4l2-device so it registers
> the nodes for the vcm when .complete() is called for that driver. I
> still think we should add a bit creating the link to expose to userspace
> in match_notify() though.
> 
> 
> Trying to list controls for the dw9719 with v4l2-ctl -d /dev/v4l-subdev7
> -L fails with an IOCTL error, so I have some remedial work on the driver
> which I'll do tonight; I'd expect to be able to control focus with
> v4l2-ctl -d /dev/v4l-subdev7 -c absolute_focus=n once this is sorted.

That is great, thank you so much. I wanted to look into this myself
today but I got distracted by other stuff.

Mainly getting Windows to work (including cameras) after a fresh
Windows install on A Dell Latitude 7285 which I just got as a second
device to test IPU3 stuff on :)

Talking about this Dell Latitude 7285, I haven't had a chance to
look into this at all. But chances are I will need to do some
I2C-register dumps under Windows, last time you mentioned you
had some small tool for this ? It is ok if it is a bit hackish,
it will still be very useful to have :)  And I believe I will
also need to override the DSDT under Windows for this, right?
I should be able to cope with that too.

Regards,

Hans

> 
>>
>>
>> For the devnodes, the ipu3-cio2 driver itself creates the devnodes for
>> the subdevices that bind to it (like the sensor) as part of its
>> .complete() callback [2] by calling v4l2_device_register_subdev_nodes(),
>> as far as I can tell there's nothing in v4l2 core that handles that
>> automatically so I think that that lack is what's preventing the
>> devnodes from showing up. I think we should tackle the problem of the
>> missing devnodes by mimicking the effects of that function somewhere
>> within core, probably v4l2_async_match_notify() (which calls the
>> notifier's .bound() callback). I think the creation of the links to
>> expose to userspace that this is a logical unit should probably happen
>> in the same place, using the entity.function field of the subdev and the
>> asd to decide exactly what kind of link to create.
>>
>>
>> [1]
>> https://elixir.bootlin.com/linux/latest/source/drivers/media/v4l2-core/v4l2-async.c#L69
>>
>> [2]
>> https://elixir.bootlin.com/linux/latest/source/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c#L1449
>>
>>> Regards,
>>>
>>> Hans
>>>
>>>
>>>
>>> p.s.
>>>
>>> I have found a new solution for the probe-ordering problem which
>>> is patch 2 of the attached patches, I personally I'm happy with
>>> this solution. I hope you like it too.

