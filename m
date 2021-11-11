Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5872344DAC7
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234262AbhKKQxb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:53:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50667 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234351AbhKKQxV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:53:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636649432;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xoB+BlNHwsAzfxp8VbiEpqj9sxlWz3w+P0LTUa9Ql/8=;
        b=GSM6IySlWVuEHfjOy0kfZfrxd7lvsHwRHSNz5psv86AYyr8jI3TRBNRlJPEVyw9NIKivef
        dfdn5oSLSL3o5Cd6muGS37DBTCbqlHh8UBttzSgC8gm4lyHctVfOHCNyd+hRR4tTPHDR5m
        mr1/9QvbNPfxfSZjZkUP2lMKyWSbr8g=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-lY6uNlrRPGyYs6PWxZOtrA-1; Thu, 11 Nov 2021 11:50:31 -0500
X-MC-Unique: lY6uNlrRPGyYs6PWxZOtrA-1
Received: by mail-ed1-f71.google.com with SMTP id q6-20020a056402518600b003e28d92bb85so5900036edd.7
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:50:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xoB+BlNHwsAzfxp8VbiEpqj9sxlWz3w+P0LTUa9Ql/8=;
        b=QM7nxRtvrPR0LJzjmaVt1aMB4wcGiXu/tsQRgdKxNx/xyxzGXT9p0wo/Zw7D4juCr4
         LWA96tHAhuWuZeq8ZYW7VMpSyDgeZgM7KddpV6zqAH07SRjjVVTAGWQD1rlHZRSjVyhX
         80Nns8YGJQ0bPJwFoR3dN0kxv0Q7we1/Z+IoTbFghiqQMfkJLpYey7O9B/zl0vHcwMYQ
         njyWCdTz7BLjCijUWz3pfn3lZzfReQ7GOns/EpptA3+VbBC/pldebCZA21+evxsKT8ee
         Sfp0lok4sgKv07TZDqWxUgnqymQj1D/tWBxZVr+heUXUD4GoXI5W7D23gsk/vOQlo47a
         Yymg==
X-Gm-Message-State: AOAM532hn+OSTBmqw4BlRQqji5WPMvC/EWrt80rgazP6Hvm0AHbHSON7
        11TSqOHlAaK56yr54ZaS5utH4gOtcAQMpL5iF1xr4VvKsUFi3UyIexf5G9lF/iK3C0+pw+8nP5S
        7XEjzr8Q8jJ+u0LIloFa2t+k=
X-Received: by 2002:a05:6402:2930:: with SMTP id ee48mr3301636edb.295.1636649429578;
        Thu, 11 Nov 2021 08:50:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMtCZXTlVM9QtoETgLw5i8JksfxcdPFHfhAM8GFHocDQWNxIv2rGTCNDLDk35V2b7QCuzIZA==
X-Received: by 2002:a05:6402:2930:: with SMTP id ee48mr3301610edb.295.1636649429416;
        Thu, 11 Nov 2021 08:50:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gs17sm1640687ejc.28.2021.11.11.08.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 08:50:28 -0800 (PST)
Message-ID: <6e832988-4810-fe59-7357-886b286697a0@redhat.com>
Date:   Thu, 11 Nov 2021 17:50:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
Content-Language: en-US
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera devel <libcamera-devel@lists.libcamera.org>,
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
 <495cbb6b-656d-6c3b-669a-f4b588e970cc@redhat.com>
 <a26f70ae-203e-99fd-8e4d-484af6f207f7@gmail.com>
 <4c7b9d72-4634-ea1d-5fff-bf17c3834b72@redhat.com>
 <CAPY8ntBZpZjecHNCMf-eMefcp2EgmbqkXMt4p=UeOe0n-o8WrA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAPY8ntBZpZjecHNCMf-eMefcp2EgmbqkXMt4p=UeOe0n-o8WrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/11/21 16:51, Dave Stevenson wrote:
> Hi Hans
> 
> On Thu, 11 Nov 2021 at 15:23, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 11/11/21 12:18, Daniel Scally wrote:
>>
>> <snip>
>>
>>>>> One problem I'm experiencing
>>>>> is that the focus position I set isn't maintained; it holds for a couple
>>>>> of seconds and then resets to the "normal" focus...this happens when the
>>>>> .close() callback for the driver is called, which happens right after
>>>>> the control value is applied. All the other VCM drivers in the kernel
>>>>> power down on .close() so I did the same>
>>>> Right, I believe that this is fine though, we expect people to use
>>>> libcamera with this and once libcamera gets autofocus support, then
>>>> I would expect libcamera to keep the fd open the entire time while
>>>> streaming.
>>>
>>>
>>> OK - as long as that's how it works then I agree that this is fine as is
>>> yes.
>>
>> So I've just picked up an old project of mine, called gtk-v4l which
>> is a nice simply v4l2 controls applet and patches it up to also
>> work on v4l-subdevs:
>>
>> https://github.com/jwrdegoede/gtk-v4l/
>>
>> So now you can run:
>>
>> sudo gtk-v4l -d /dev/v4l-subdev8
>>
>> And it will give you a slider to control the focus; and as
>> a bonus it keeps the v4l-subdev open, so no more runtime-pm
>> issue :)
> 
> Do the lens and sensor share a regulator / enable GPIO?

No, if they did then there would be no runtime-pm issue,
because then the VCM would not get turned off after
a v4l2-set command (for a quick test) since then the
streaming from the sensor would keep the sensor and
thus the regulator on.

> I was looking at the same issue for a Sony IMX135 module with AD5398
> VCM driver [1].
> In my case they do share an enable GPIO, so using regulator-gpio we
> can register via regulator_register_notifier for information on when
> the regulator is powered up. It can then also reset to the last
> position should the sensor subdev enable the regulator without the
> lens driver being opened at all.

That sounds like it is relying on board-depedent behavior
(the enable GPIO and/or regulator being shared) which we don't
want in the VCM drivers as those are supposed to be board
agnostic.

This really is something which should be fixed in userspace
where the userspace consumer of the sensor should also always
open the vcm v4l-subdev.

Regards,

Hans

