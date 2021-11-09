Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8522C44AD2F
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 13:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237354AbhKIMMU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 07:12:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240205AbhKIMMM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Nov 2021 07:12:12 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D10C061767
        for <linux-media@vger.kernel.org>; Tue,  9 Nov 2021 04:09:26 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id r8so32485305wra.7
        for <linux-media@vger.kernel.org>; Tue, 09 Nov 2021 04:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=qI2NcGAePU0B0rW4aThWEvdBvfzm1F9Y1ZUvzLzW3vo=;
        b=jsNvb8EWBFERmUlleteMCicR9fEnSJb6xOohRH7AJgCNUeNsniy/2FrkRHsfGs3PXP
         ljIy0xPtrEWNVOQx/EgGew/a/4zPre1FZsMxehQA7LClMBGJNby2h2BxGo2LJXJXFcm6
         KaOOjvY5D/8E6Fd1FqTDvwQhE317jb6Dqf+sIUACeh6uvoyYoSW05MVeRnYFlOgrPyEf
         RudZPPCFtUzbwANGbQkVWiFfA4wp1J/7ePyQZSrC8Ja/6PM4G4eHqiwmAWI3fU8LAgQJ
         ZJ0eyrJS0AKMn8ATSw7onxVd+jTd/GlNeFoQMZD2ZqwgLV41H/AmsrQNGQ4TUH8OF3o8
         ihjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=qI2NcGAePU0B0rW4aThWEvdBvfzm1F9Y1ZUvzLzW3vo=;
        b=lk4YBTlvuStlWHiX+SLmWjV6t8xq8q8Yi3Pt+OpNripS9+oLDtlfGgiY6qRhe5QC7X
         SwQDEVoqWV3fsqkG8eumLBfBHAdUIJ/2a7NZPmrpiFE/i4V4LvNaphvVw37jqNbhMCiD
         mLYES1/S48ljz86BtKrcHqZXu7Vp/nMQRYZ+8D1xccQadSl2eB1eT2LqR8gVYeHVtcYa
         B8oMFIyrmTgHmAh/YZH9U954MQUXutRIICTueQX86urjm8iYiAuMGCXycIFtPTmE3Zsb
         1U/+WzpwgoLWzvsyOybRa1eyL2Gac7F86GNKy4SpehqSK0LkZJTDfe1rZfKVjw2qnbQ0
         5ZdQ==
X-Gm-Message-State: AOAM533H4g/Fglf9G0nijyrB8LgfniuYUvoRfanpNgeavIWFslFb6prt
        0IMqsEJj+eVTgvLjN7zyc/bm9AO8xB8=
X-Google-Smtp-Source: ABdhPJxYqbTtsnVMHGXZbMgsCMBh1UUKtFPriRY4BlsipYhOyrH2HRS+Qmvk1UxwaznTcbG1gLkcsA==
X-Received: by 2002:adf:df0c:: with SMTP id y12mr9119139wrl.168.1636459765176;
        Tue, 09 Nov 2021 04:09:25 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id p12sm23586548wrr.10.2021.11.09.04.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 04:09:24 -0800 (PST)
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
From:   Daniel Scally <djrscally@gmail.com>
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
Message-ID: <b77cf78f-ea5e-adcc-a1b8-8cff77ebf847@gmail.com>
Date:   Tue, 9 Nov 2021 12:09:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d0f969f6-e029-7c28-17ce-79b8228ddaee@gmail.com>
Content-Type: multipart/mixed;
 boundary="------------FE25CACB98F1C2A5B8B0BD71"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------FE25CACB98F1C2A5B8B0BD71
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Hans

On 09/11/2021 00:43, Daniel Scally wrote:
> Hi Hans
>
> On 08/11/2021 13:12, Hans de Goede wrote:
>> Hi,
>>
>> On 11/2/21 00:43, Daniel Scally wrote:
>>> Hi Hans
>> <snip>
>>  
>>
>>>> 2. I need some help with all the fwnode link stuff (I'm not very familiar
>>>> with this). There seems to be a chicken and egg problem here though,
>>>> because the v4l2subdev for the VCM does not register because of async stuff
>>>> and if we add it to the "graph" then my idea to enumerate the VCMs
>>>> from the SSDB on the complete() callback won't work. But we can do this
>>>> on a per sensor basis instead from the cio2_notifier_bound() callback
>>>> instead I guess ?
>>> I think on top of your work in the cio2-bridge for patch 3 you can do this:
>>>
>>>
>>> 1. Create another software node against the cio2_sensor struct, with the
>>> name coming from the vcm_types array
>>>
>>> 2. Assign that software node to board_info.swnode in
>>> cio2_bridge_instantiate_vcm_i2c_client()
>>>
>>> 3. Add another entry to dev_properties for the sensor, that is named
>>> "lens-focus" and contains a reference to the software_node created in #2
>>> just like the references to the sensor/cio2 nodes.
>>>
>>>
>>> This way when the sensor driver calls
>>> v4l2_async_register_subdev_sensor() it should create a notifier that
>>> looks for that VCM client to bind. I think then rather than putting
>>> anything in the .bound() / .complete() callbacks, we should modify core
>>> to do _something_ when async matching some subdevs. The something would
>>> depend on the kind of devices that match, for example with the sensor
>>> driver and the ipu3-cio2 driver, there's an entity whos function is
>>> MEDIA_ENT_F_VID_IF_BRIDGE matching to an entity whos function is
>>> MEDIA_ENT_F_CAM_SENSOR, and it seems to me that every scenario like that
>>> is going to result in media pad links being created. Similarly for our
>>> sensor that's a device with entity function MEDIA_ENT_F_LENS matching to
>>> MEDIA_ENT_F_CAM_SENSOR, and I think that in those cases we can create
>>> either an interface link or a new kind of link (maybe
>>> "MEDIA_LNK_FL_ANCILLARY_LINK" or something...) between the two to show
>>> that they form a single logical unit, which we can then report to libcamera.
>>>
>>>
>>> Hope that makes sense...
>> Ok, so I gave this a try, see the attached patches, but the v4l2-subdev for
>> the VCM still does not show up.
>
> This is exactly where I got to over the weekend too
>
>> I think that instead I need to build a full link between the sensor
>> and the VCM similar to the cio2 <-> sensor link. Both ends of that link
>> have:
>>
>> <base-swnode attached to the device>
>> |
>> --<port-swnode named (SWNODE_GRAPH_PORT_NAME_FMT, X), where X is 0 on the
>>   |                           sensor side and the link nr on the cio2 side
>>   |
>>   --<end-point-swnode named (SWNODE_GRAPH_ENDPOINT_NAME_FMT, 0)
>>
>> And then the 2 endpoints contain a swref property pointing to the
>> other endpoint swnode.
>>
>> I think we need a similar setup adding a swnode child named
>> (SWNODE_GRAPH_PORT_NAME_FMT, 1), to the nodes[SWNODE_SENSOR_HID] node.
>>
>> Note 1, since 0 is the "port" to the cio2, this new port child then
>> gets an endpoint "0" child itself, likewise we add a "port 0" child
>> to the vcm swnode, with a "endpoint 0" child below that and then have
>> the 2 endpoints contain swref properties pointing to each other.
>>
>> I think that this will properly make the VCm part of the graph and
>> will make its v4l2-subdev get instantiated when the graph is
>> complete.  Before I spend a bunch of time on implementing this,
>> let me ask this:
>>
>> Does this sound reasonable / like I'm heading in the right direction?
> I don't think that we need to add the software nodes as
> ports/endpoints...as far as I can tell it ought to work like this:
>
>
> 1. The sensor calls v4l2_async_register_subdev_sensor() which...
>
>     a) creates a notifier
>
>     b) looks for reference properties of the device's fwnode called
> "lens-focus" and calls v4l2_async_notifier_add_fwnode_subdev() against
> the reference, which tells the notifier it's connected to this other
> fwnode and to expect it to bind.
>
> 2. When new subdevs are registered they get tested for a match against
> the notifier registered in 1a that matches to their fwnode using
> match_fwnode() [1]. This should work, on the grounds that we registered
> the device using the board_info.swnode and registered a lens-focus
> property that points to that software_node
>
> 3. When a match is found, the notifier's .bound() function is called.
> When all the asds that the notifier expects are bound the notifier's
> .complete() callback is called.
>
>
> That's not working correctly for me at the moment, but I think this is a
> surmountable problem rather than the wrong approach, so I'm just working
> through the differences to try and get the matching working.


OK, I eventually got this working - the dw9719 registers as
/dev/v4l-subdev7 for me now ... long story short is the attached patch
was needed to make the references work, as the internals of v4l2 aren't
checking for fwnode->secondary. Prior to your latest series as well, an
additional problem was that once the VCMs fwnode was linked to the
sensor's the .complete() callback for ipu3-cio2 would never call
(because it needs ALL the devices for the linked fwnodes to be bound to
do that)...which meant the VCMs never got instantiated, because that was
where that function was called. With your new set separating those
processes it works well, so yes I like that new approach very much :D


In the end we don't have to add a call creating the subdev's - it turns
out that v4l2 knows it's part of ipu3-cio2's v4l2-device so it registers
the nodes for the vcm when .complete() is called for that driver. I
still think we should add a bit creating the link to expose to userspace
in match_notify() though.


Trying to list controls for the dw9719 with v4l2-ctl -d /dev/v4l-subdev7
-L fails with an IOCTL error, so I have some remedial work on the driver
which I'll do tonight; I'd expect to be able to control focus with
v4l2-ctl -d /dev/v4l-subdev7 -c absolute_focus=n once this is sorted.

>
>
> For the devnodes, the ipu3-cio2 driver itself creates the devnodes for
> the subdevices that bind to it (like the sensor) as part of its
> .complete() callback [2] by calling v4l2_device_register_subdev_nodes(),
> as far as I can tell there's nothing in v4l2 core that handles that
> automatically so I think that that lack is what's preventing the
> devnodes from showing up. I think we should tackle the problem of the
> missing devnodes by mimicking the effects of that function somewhere
> within core, probably v4l2_async_match_notify() (which calls the
> notifier's .bound() callback). I think the creation of the links to
> expose to userspace that this is a logical unit should probably happen
> in the same place, using the entity.function field of the subdev and the
> asd to decide exactly what kind of link to create.
>
>
> [1]
> https://elixir.bootlin.com/linux/latest/source/drivers/media/v4l2-core/v4l2-async.c#L69
>
> [2]
> https://elixir.bootlin.com/linux/latest/source/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c#L1449
>
>> Regards,
>>
>> Hans
>>
>>
>>
>> p.s.
>>
>> I have found a new solution for the probe-ordering problem which
>> is patch 2 of the attached patches, I personally I'm happy with
>> this solution. I hope you like it too.

--------------FE25CACB98F1C2A5B8B0BD71
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-device-property-Check-fwnode-secondary-when-finding-.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-device-property-Check-fwnode-secondary-when-finding-.pa";
 filename*1="tch"

From b3c4aeeabd6ac6a40606c7790068a29c2b85f6ff Mon Sep 17 00:00:00 2001
From: Daniel Scally <djrscally@gmail.com>
Date: Tue, 9 Nov 2021 01:13:47 +0000
Subject: [PATCH] device property: Check fwnode->secondary when finding
 properties

fwnode_property_get_reference_args() searches for named properties
against a fwnode_handle, but these could instead be against the fwnode's
secondary. If the property isn't found against the primary, check the
secondary to see if it's there instead.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/base/property.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 453918eb7390..054e62a4e710 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -479,8 +479,16 @@ int fwnode_property_get_reference_args(const struct fwnode_handle *fwnode,
 				       unsigned int nargs, unsigned int index,
 				       struct fwnode_reference_args *args)
 {
-	return fwnode_call_int_op(fwnode, get_reference_args, prop, nargs_prop,
-				  nargs, index, args);
+	int ret;
+
+	ret = fwnode_call_int_op(fwnode, get_reference_args, prop, nargs_prop,
+				 nargs, index, args);
+
+	if (ret < 0 && !IS_ERR_OR_NULL(fwnode->secondary))
+		ret = fwnode_call_int_op(fwnode->secondary, get_reference_args,
+					 prop, nargs_prop, nargs, index, args);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(fwnode_property_get_reference_args);
 
-- 
2.25.1


--------------FE25CACB98F1C2A5B8B0BD71--
