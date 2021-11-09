Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D662449FE2
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 01:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235316AbhKIAp6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 19:45:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235122AbhKIAp6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 19:45:58 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4545C061570
        for <linux-media@vger.kernel.org>; Mon,  8 Nov 2021 16:43:12 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id v127so14393279wme.5
        for <linux-media@vger.kernel.org>; Mon, 08 Nov 2021 16:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=oGjp5b4ngUffl2yK6piZs/YOocjtH4nFxXbL9t6FXbY=;
        b=bEPhcld/t8F5IP60hlDo7ioOSRzmp0UeovpIevJ3exH17uZia47Za4lhFif1+IT16P
         iuqOC2agQtX3j+HBMOwigLjr8Wbx5a08oYNQeqWmKmeDE065cTeZvW2F8bb0bZeo40jP
         2rv/wCmdHbAkcvnMzZe0qgVYcS82981SJzV6HhqHV/bBGyJd3H1ueaJQKebEJ0MT6I7f
         Im9slbdTazfUXJUpk9tEUDvaT8CZFrzkCDhsjXwUW7DTcf7F+oXAUp0Mzf6nGxzQ0G6T
         PEuerVtXZ0uQKXU7PHtc1XWIbmDwpZongnBEN88SOmpgbC6Y9tIaREX40u2z8gJVciIZ
         s1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=oGjp5b4ngUffl2yK6piZs/YOocjtH4nFxXbL9t6FXbY=;
        b=v9HoKzQiw9foXpsxORNqWkGTzrBrvpszGb6LdelR2B4KTDYWE4aXkJP3uqJ4nQz2HJ
         90jNmNtydkhfvrS1pbwdBHao2He4yXza82zULpSo+Kajtwb+J0ZpkCVLDXwCAnbLE5Xr
         yIPheraP8a6/SolcLa4tzVLsQ1jI55BhCXzyl72Q9C/gU6a9gYtiXdT8rQsIt56AyrgV
         hEuTw7vikCKc/AdxsE3nEoe5mB9FKfVNYR8trMQSH6zr0s2pTcqCOUR3EbOUHOq18mOn
         oWft7L4wSrF9OqeiijU2N23VJXm/5ppTYsR9lPj2NZtxOirjyP6K145SLzvI6I7Q4mX+
         NAfA==
X-Gm-Message-State: AOAM532lO8STQmDOytN1UWjN0s9ST5Jr0u7eAYnIkVJavNgeNX1FPGsW
        y6Z5MIrDBi8j5uHZJZd+f74=
X-Google-Smtp-Source: ABdhPJyzR8qXwOwt1M5n9Gm6tsOLF23PEVo2HUSouP+gxsPCg1MdePlp2EjHiPXuOxj4/izN8wIsvw==
X-Received: by 2002:a1c:1f06:: with SMTP id f6mr2542069wmf.55.1636418591486;
        Mon, 08 Nov 2021 16:43:11 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id o1sm18562223wru.91.2021.11.08.16.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 16:43:11 -0800 (PST)
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
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <d0f969f6-e029-7c28-17ce-79b8228ddaee@gmail.com>
Date:   Tue, 9 Nov 2021 00:43:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b0a6a762-3445-7c61-3510-6bd493f8e0fa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On 08/11/2021 13:12, Hans de Goede wrote:
> Hi,
>
> On 11/2/21 00:43, Daniel Scally wrote:
>> Hi Hans
> <snip>
>  
>
>>> 2. I need some help with all the fwnode link stuff (I'm not very familiar
>>> with this). There seems to be a chicken and egg problem here though,
>>> because the v4l2subdev for the VCM does not register because of async stuff
>>> and if we add it to the "graph" then my idea to enumerate the VCMs
>>> from the SSDB on the complete() callback won't work. But we can do this
>>> on a per sensor basis instead from the cio2_notifier_bound() callback
>>> instead I guess ?
>>
>> I think on top of your work in the cio2-bridge for patch 3 you can do this:
>>
>>
>> 1. Create another software node against the cio2_sensor struct, with the
>> name coming from the vcm_types array
>>
>> 2. Assign that software node to board_info.swnode in
>> cio2_bridge_instantiate_vcm_i2c_client()
>>
>> 3. Add another entry to dev_properties for the sensor, that is named
>> "lens-focus" and contains a reference to the software_node created in #2
>> just like the references to the sensor/cio2 nodes.
>>
>>
>> This way when the sensor driver calls
>> v4l2_async_register_subdev_sensor() it should create a notifier that
>> looks for that VCM client to bind. I think then rather than putting
>> anything in the .bound() / .complete() callbacks, we should modify core
>> to do _something_ when async matching some subdevs. The something would
>> depend on the kind of devices that match, for example with the sensor
>> driver and the ipu3-cio2 driver, there's an entity whos function is
>> MEDIA_ENT_F_VID_IF_BRIDGE matching to an entity whos function is
>> MEDIA_ENT_F_CAM_SENSOR, and it seems to me that every scenario like that
>> is going to result in media pad links being created. Similarly for our
>> sensor that's a device with entity function MEDIA_ENT_F_LENS matching to
>> MEDIA_ENT_F_CAM_SENSOR, and I think that in those cases we can create
>> either an interface link or a new kind of link (maybe
>> "MEDIA_LNK_FL_ANCILLARY_LINK" or something...) between the two to show
>> that they form a single logical unit, which we can then report to libcamera.
>>
>>
>> Hope that makes sense...
> Ok, so I gave this a try, see the attached patches, but the v4l2-subdev for
> the VCM still does not show up.


This is exactly where I got to over the weekend too

> I think that instead I need to build a full link between the sensor
> and the VCM similar to the cio2 <-> sensor link. Both ends of that link
> have:
>
> <base-swnode attached to the device>
> |
> --<port-swnode named (SWNODE_GRAPH_PORT_NAME_FMT, X), where X is 0 on the
>   |                           sensor side and the link nr on the cio2 side
>   |
>   --<end-point-swnode named (SWNODE_GRAPH_ENDPOINT_NAME_FMT, 0)
>
> And then the 2 endpoints contain a swref property pointing to the
> other endpoint swnode.
>
> I think we need a similar setup adding a swnode child named
> (SWNODE_GRAPH_PORT_NAME_FMT, 1), to the nodes[SWNODE_SENSOR_HID] node.
>
> Note 1, since 0 is the "port" to the cio2, this new port child then
> gets an endpoint "0" child itself, likewise we add a "port 0" child
> to the vcm swnode, with a "endpoint 0" child below that and then have
> the 2 endpoints contain swref properties pointing to each other.
>
> I think that this will properly make the VCm part of the graph and
> will make its v4l2-subdev get instantiated when the graph is
> complete.  Before I spend a bunch of time on implementing this,
> let me ask this:
>
> Does this sound reasonable / like I'm heading in the right direction?
I don't think that we need to add the software nodes as
ports/endpoints...as far as I can tell it ought to work like this:


1. The sensor calls v4l2_async_register_subdev_sensor() which...

    a) creates a notifier

    b) looks for reference properties of the device's fwnode called
"lens-focus" and calls v4l2_async_notifier_add_fwnode_subdev() against
the reference, which tells the notifier it's connected to this other
fwnode and to expect it to bind.

2. When new subdevs are registered they get tested for a match against
the notifier registered in 1a that matches to their fwnode using
match_fwnode() [1]. This should work, on the grounds that we registered
the device using the board_info.swnode and registered a lens-focus
property that points to that software_node

3. When a match is found, the notifier's .bound() function is called.
When all the asds that the notifier expects are bound the notifier's
.complete() callback is called.


That's not working correctly for me at the moment, but I think this is a
surmountable problem rather than the wrong approach, so I'm just working
through the differences to try and get the matching working.


For the devnodes, the ipu3-cio2 driver itself creates the devnodes for
the subdevices that bind to it (like the sensor) as part of its
.complete() callback [2] by calling v4l2_device_register_subdev_nodes(),
as far as I can tell there's nothing in v4l2 core that handles that
automatically so I think that that lack is what's preventing the
devnodes from showing up. I think we should tackle the problem of the
missing devnodes by mimicking the effects of that function somewhere
within core, probably v4l2_async_match_notify() (which calls the
notifier's .bound() callback). I think the creation of the links to
expose to userspace that this is a logical unit should probably happen
in the same place, using the entity.function field of the subdev and the
asd to decide exactly what kind of link to create.


[1]
https://elixir.bootlin.com/linux/latest/source/drivers/media/v4l2-core/v4l2-async.c#L69

[2]
https://elixir.bootlin.com/linux/latest/source/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c#L1449

>
> Regards,
>
> Hans
>
>
>
> p.s.
>
> I have found a new solution for the probe-ordering problem which
> is patch 2 of the attached patches, I personally I'm happy with
> this solution. I hope you like it too.
