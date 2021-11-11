Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7E244D515
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 11:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232932AbhKKKh6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 05:37:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29205 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232915AbhKKKh6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 05:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636626906;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3947w7BVsfyQCi9nBoH4pX/BueOPaJwJbIbUK885wUg=;
        b=dxy6dH4YIxTXN+HaURWAkEqwY2UbHm2ydpPDxFWsbnVWZMi7QpGLHlzcFNhfUq8SPB1Og2
        P5ns9KwBKdT5CYzCX3/E361WFgzlAbBfePzzG09dPynU8TZxlbL5udTaIrX/eukFgNUHqA
        ASLs0ckjq4qh6us1Icu6Q4GOv1ixZZs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-zouQWiA3Ov2ZFFqZdS0Q1A-1; Thu, 11 Nov 2021 05:35:04 -0500
X-MC-Unique: zouQWiA3Ov2ZFFqZdS0Q1A-1
Received: by mail-ed1-f69.google.com with SMTP id h15-20020a056402094f00b003e51ef806a9so867215edz.6
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 02:35:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3947w7BVsfyQCi9nBoH4pX/BueOPaJwJbIbUK885wUg=;
        b=EtjWW6O/ektLma7W56UX0+8Dy3Vu5qUNCpk+eB7IiduYU/M2eOBGwcNd9P4E1hwQlc
         0EGQKCKWptPDoC0WOGGcuho/q13i+cPFony3oMg3Mh66ln3U5Qk45Y6/oU3jRArdTpeG
         2NHlCaHI3UJceiDcZI9m8OGEZkXUpFypvCSrnofBGfYOx8NHrNCaMrsiUcLl/iqkteoA
         TM9PTFbfyPvFqiTlHSkdFdnIIMrYU299cFlG3+Tt/mFztGk050jaHtB5ZyJNR7r9v9FX
         JHObWNwZQjyNtE6VP2E9hKmloMEg9iJpJFzenaLovqUZg84FxIIY/py8zHwLjtzp47qE
         WhJQ==
X-Gm-Message-State: AOAM530x8L61xOgdpXIFiS0QxqiZLS1R0njSgrO1bMhqVR2IuJT+GLeN
        ps9JMZpkVFg9oMkOrBI5ncDdGvjL1uitDyR5ycgGKe4nuZqRmyqkDB0lRJW2iF4Yin1NynpmQ/0
        SketUOxTst2nRumcnDjVmQ2g=
X-Received: by 2002:a17:907:1b25:: with SMTP id mp37mr8090460ejc.140.1636626903383;
        Thu, 11 Nov 2021 02:35:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+zADBiwPobb8o5J25sZYGnLeKDoNyRmkPBQk5oAjs+3ad9bjuC0LvB+KRRfBFTk0RRZEEOA==
X-Received: by 2002:a17:907:1b25:: with SMTP id mp37mr8090425ejc.140.1636626903129;
        Thu, 11 Nov 2021 02:35:03 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b11sm1330099ede.52.2021.11.11.02.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 02:35:02 -0800 (PST)
Message-ID: <495cbb6b-656d-6c3b-669a-f4b588e970cc@redhat.com>
Date:   Thu, 11 Nov 2021 11:35:02 +0100
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
 <bbfb4bd6-871a-eb14-653c-64c05c22e165@redhat.com>
 <29bf3454-2f82-7791-2aa2-c5e1cb5610a5@gmail.com>
 <6ee7c491-4636-8819-c954-dfc6abcfd1a5@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6ee7c491-4636-8819-c954-dfc6abcfd1a5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/10/21 01:01, Daniel Scally wrote:
> Hi Hans
> 
> On 09/11/2021 16:35, Daniel Scally wrote:
>>>>> That's not working correctly for me at the moment, but I think this is a
>>>>> surmountable problem rather than the wrong approach, so I'm just working
>>>>> through the differences to try and get the matching working.
>>>> OK, I eventually got this working - the dw9719 registers as
>>>> /dev/v4l-subdev7 for me now ... long story short is the attached patch
>>>> was needed to make the references work, as the internals of v4l2 aren't
>>>> checking for fwnode->secondary. Prior to your latest series as well, an
>>>> additional problem was that once the VCMs fwnode was linked to the
>>>> sensor's the .complete() callback for ipu3-cio2 would never call
>>>> (because it needs ALL the devices for the linked fwnodes to be bound to
>>>> do that)...which meant the VCMs never got instantiated, because that was
>>>> where that function was called. With your new set separating those
>>>> processes it works well, so yes I like that new approach very much :D
>>>>
>>>>
>>>> In the end we don't have to add a call creating the subdev's - it turns
>>>> out that v4l2 knows it's part of ipu3-cio2's v4l2-device so it registers
>>>> the nodes for the vcm when .complete() is called for that driver. I
>>>> still think we should add a bit creating the link to expose to userspace
>>>> in match_notify() though.
>>>>
>>>>
>>>> Trying to list controls for the dw9719 with v4l2-ctl -d /dev/v4l-subdev7
>>>> -L fails with an IOCTL error, so I have some remedial work on the driver
>>>> which I'll do tonight; I'd expect to be able to control focus with
>>>> v4l2-ctl -d /dev/v4l-subdev7 -c absolute_focus=n once this is sorted.
>>> That is great, thank you so much. I wanted to look into this myself
>>> today but I got distracted by other stuff.
>>
>> No problem; I'll link you the patches for the updated versions of
>> everything once I've sorted the IOCTL error tonight.
> 
> 
> OK, this is running now. With the attached patches on top of your v5
> series and the 4-patch series from earlier today, the dw9719 registers
> as a v4l2 subdev and I can control it with v4l2-ctl -d /dev/v4l-subdev7
> -c focus_absolute=1200 (or whatever value).

Great, thank you! I've given this a quick test and indeed everything
works :)

I did notice a typo in a comment in the dw9719.c file which I added
myself, can you squash in this fix pleas? :

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 047f7636efde..c647b50c2ebf 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -283,7 +283,7 @@ static int dw9719_probe(struct i2c_client *client)
 	 * the TPS68470 PMIC have I2C passthrough capability, to disconnect the
 	 * sensor's I2C pins from the I2C bus when the sensors VSIO (Sensor-IO)
 	 * is off, because some sensors then short these pins to ground;
-	 * and the DW9719 might sit behind this passthrough, this it needs to
+	 * and the DW9719 might sit behind this passthrough, thus it needs to
 	 * enable VSIO as that will also enable the I2C passthrough.
 	 */
 	dw9719->regulators[1].supply = "vsio";

Also I think that the 

"device property: Check fwnode->secondary when finding properties"

That patch looks good to me, so please add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Can you submit this upstream please?

I will prepare a new version of my:

"[PATCH v5 00/11] Add support for X86/ACPI camera sensor/PMIC setup with clk and regulator platform data"

series, addressing the few remaining comments and adding the regulator
data + instantiating support for the VCM.

> One problem I'm experiencing
> is that the focus position I set isn't maintained; it holds for a couple
> of seconds and then resets to the "normal" focus...this happens when the
> .close() callback for the driver is called, which happens right after
> the control value is applied. All the other VCM drivers in the kernel
> power down on .close() so I did the same>

Right, I believe that this is fine though, we expect people to use
libcamera with this and once libcamera gets autofocus support, then
I would expect libcamera to keep the fd open the entire time while
streaming.

>, but the behaviour is not
> particularly useful - since removing the power seems to reset it, it
> needs to be on whilst the linked sensor is streaming I suppose. Given
> that ascertaining the state of the sensor probably will require some
> link established between them anyway I guess I will look at that next,
> unless you'd rather do it?

I don't think this is necessary, see above.

What is necessary is some way for libcamera to:

1. See if there is a VCM which belongs to the sensor; and
2. If there is a VCM figure out which v4l2-subdev it is.

Also see this email thread, where Hans Verkuil came to the
conclusion that this info is currently missing from the MC
representation (link is to the conclusion):

https://lists.libcamera.org/pipermail/libcamera-devel/2021-October/026144.html

Regards,

Hans

