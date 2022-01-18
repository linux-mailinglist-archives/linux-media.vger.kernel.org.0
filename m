Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6F9492596
	for <lists+linux-media@lfdr.de>; Tue, 18 Jan 2022 13:20:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241489AbiARMTK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jan 2022 07:19:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57107 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240901AbiARMTK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jan 2022 07:19:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642508349;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TCQX34KRaMySdLE7xjczSe3Yj3QI4LeFBY6HoOVyIwk=;
        b=Z70GYuSL5x0+0FM47SDSP11pC9IfHo7J5f614jGCfd60kwErDc7JMrYrSwxh0WE/BE8v6V
        +QJ0r0X0qgawZcEZ6AMlxf5AeSJQLJvied0U9EAVe1Ho/Fe/6IwkGorTsMCW5CTawC9ta9
        rTNQLQgVV+xmYqNu/+guac8/0EqETNQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-2ZZxsDhXMtatfWEHgdAfsw-1; Tue, 18 Jan 2022 07:19:08 -0500
X-MC-Unique: 2ZZxsDhXMtatfWEHgdAfsw-1
Received: by mail-ed1-f69.google.com with SMTP id a8-20020a056402168800b004022fcdeb25so6102622edv.21
        for <linux-media@vger.kernel.org>; Tue, 18 Jan 2022 04:19:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TCQX34KRaMySdLE7xjczSe3Yj3QI4LeFBY6HoOVyIwk=;
        b=M9pcoOAwOy7pL+gbbpADQ2J0E0NuuPYADmLN6T1AXDSUTdfYRHtOjuag+7qDBi0hMz
         TW9DiYwSfg+F8qbfJOqna7wkD7Fotsc5664Gt1oz6kpLrRiMidW+1dFriYnKlqt9+pCj
         8Xz7fyG1FIe3jIcKakbvfMV8XcJHcmmypTB9W6MKnxKkCxnblhC3aOiw/UE+AxuDKXn+
         ZSuezQapXvpgJGi/PMoEo6Hu2NG1yEpXNK2N4sMv0P/EyBScZ+ItPmzejQAGn9VBgUmw
         qRCicGIVnFvfQD/3JjcBkDwaQEPNeVMExnnp/EsFU00hJ4iwteDec3eLP/gdNqYaajn5
         fvTw==
X-Gm-Message-State: AOAM533jDfn4XnX0AWaBkvy6EUsNTPIAcO3I1fInI4ItbUEK2v9Ev9DU
        YcMli0fZf8C2ygtjdxh5ceN8r0xfqW+tLV30AsDZukC+AXWNUrUgf7iXwXM5prpqVMZH9YJ72Vf
        LX8Ml8s4KiQOu+WQbaTZSZt4=
X-Received: by 2002:a05:6402:518a:: with SMTP id q10mr10457349edd.167.1642508347060;
        Tue, 18 Jan 2022 04:19:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGIP58vmYgO9FjQUErvXuaThmlpUizaPwPvOb/z8nYAFomM3Uyf590kTd5V6aeohJqzOSlzg==
X-Received: by 2002:a05:6402:518a:: with SMTP id q10mr10457338edd.167.1642508346848;
        Tue, 18 Jan 2022 04:19:06 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id u16sm6982400edr.43.2022.01.18.04.19.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 04:19:06 -0800 (PST)
Message-ID: <5dbbba6c-9036-a104-d6a6-483fa621c0b6@redhat.com>
Date:   Tue, 18 Jan 2022 13:19:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Firmware (devicetree/ACPI interface) for marking camera sensors
 being on the front/back of a device
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     libcamera devel <libcamera-devel@lists.libcamera.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <31c05526-f6fc-f48f-a900-8103ac5c4215@redhat.com>
 <YeSaFXO1Z+F088LR@pendragon.ideasonboard.com>
 <179e8c32-a5f5-48a5-8410-e4f0a8f73bd2@redhat.com>
 <YeWMzbq70ZDcWUB2@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YeWMzbq70ZDcWUB2@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 1/17/22 16:35, Laurent Pinchart wrote:
> Hi Hans,
> 
> (CC'ing Sakari)
> 
> On Mon, Jan 17, 2022 at 10:26:54AM +0100, Hans de Goede wrote:
>> On 1/16/22 23:20, Laurent Pinchart wrote:
>>> On Sun, Jan 16, 2022 at 10:43:25PM +0100, Hans de Goede wrote:
>>>> Hi All,
>>>>
>>>> IIRC there was some discussion about $subject a while ago,
>>>> esp. being pushed by the ChromeOS folks (IIRC). If you know what
>>>> I'm talking about, please add relevant folks to the Cc.
>>>>
>>>> While doing some work on atomisp support I noticed that the
>>>> ACPI device fwnode-s describing the sensors have an ACPI _PLD
>>>> method, which is a standardized ACPI method to retreive an
>>>> package (ACPI for struct) describing the location of things
>>>> like USB ports; and in this case of the camera sensors.
>>>>
>>>> And upon checking the Surface Go DSDT the sensors there seem to
>>>> have the _PLD bits to. And in both cases at least the following
>>>> PLD field (bits 67-69) seems to contain valid and relevant info,
>>>> quoting from the ACPI spec 6.2 version, page 329:
>>>>
>>>> """
>>>> Panel: Describes which panel surface of the system’s housing
>>>> the device connection point resides on:
>>>> 0 – Top
>>>> 1 – Bottom
>>>> 2 – Left
>>>> 3 – Right
>>>> 4 – Front
>>>> 5 – Back
>>>> 6 – Unknown
>>>> """
>>>>
>>>> This seems to be consistently set to 4 or 5 for the _PLD method
>>>> of the sensor ACPI nodes which I checked.
>>>>
>>>> So rather then defining a new devicetree property for this and
>>>> embedding that inside the ACPI tables, IMHO it would be best if
>>>> the ChromeOS devices would use the standardized _PLD ACPI method
>>>> for this too.
>>>
>>> I have no specific objection to this, given that the _PLD is
>>> standardized. In your experience, is the rotation also populated
>>> correctly ? That's important information too.
>>
>> That is a good question, so I just checked what the IPU3 does and
>> it uses a field in the SSDB ACPI package for this.
>>
>> And I'm not sure that the _PLD is the right place for this, the _PLD
>> is about how the ACPI object appears to the user, so that
>> the operating-system can describe e.g. external connectors in
>> a dialog box using this info. E.g. the _PLD also contains information
>> about the color of the connector.
>>
>> And an upside-down sensor, does not look upside-down to the user when
>> looking at it from the outside of the device. So based on this reading
>> of the spec I don't expect the rotation field to contain what we are
>> looking for (as is shown by the IPU3 driver using a SSDB field for this).
> 
> Your interpretation of the _PLD makes sense, but that's also the problem
> with ACPI: there are many interpretation that make sense (at least to
> the OEMs), leading to lack of standardization in practice :-S I suppose
> I'm a bit concerned that the _PLD rotation, defined in the spec, would
> be interpreted by some OEMs as being the right place to expose this
> information, while others would use a different mechanism. I don't care
> much about where the information ends up being stored, but I care about
> avoiding proliferation of different solutions as much as possible.

The DSDTs / _PLDs which I have checked seem to all set the rotation
field to plain 0 / 0 degrees. But I have only checked atomisp2 / ipu3
based DSDTs. There are indeed no guarantees that some vendor
will not use the _PLD rotation, but this does seem somewhat unlikely,
the rotation field is described as: "Rotates the Shape" note the
captical S, so this seems to refer to the "Shape" field (Round / Oval /
Square / Rectangle) which gives the shape of the object as observed by
the user.

> One think I do *not* want to see is all sensor drivers being poluted
> with OEM-specific code because an OEM has decided to store data using a
> custom representation.

Ack, ATM for the IPU3 the _PLD back/front parsing is done in the
bridge driver. If this becomes a common pattern we may need to offer
a helper for bridge drivers, or maybe even move it to the core.

> One question here is if we should try to fix this at the ACPI level, to
> avoid every vendor coming up with its own SSDB-like solution, or leave
> it as-is. In the latter case, I wouldn't be surprised if some OEMs would
> end up not populating the location correctly in the _PLD. 

Reading the ACPI spec a second time I'm convinced that the rotation
really does not belong in the _PLD. So to fix this at the ACPI level
would me doing some proposal there with some camera sensor specific
standardized ACPI fields/methods.

>>> It we go in that direction, we should try to push OEMs to also populate
>>> the vertical offset and horizontal offset fields, as I expect it to
>>> become useful when multiple cameras are present in the same location.
>>
>> That is a good point.
>>
>> Note that my main reason for advertising using _PLD for the front/back
>> info is that that is what is already being used in Windows laptops
>> ACPI tables, so we need support for it regardless.
> 
> Is the information available in the SSDB too, or only in the _PLD ?

The front/back info is only available in the _PLD.

> In
> the latter case, what should we do for systems that don't populate the
> _PLD correctly ?

Currently for unknown _PLD values the IPU3 driver sets
V4L2_FWNODE_ORIENTATION_EXTERNAL, which I guess is the same as not
setting any value at all ?

>> Actually your rotation question made me wonder what we are doing
>> for IPU3 here and we already have code parsing the _PLD in
>> drivers/media/pci/intel/ipu3/cio2-bridge.c to set
>> V4L2_FWNODE_ORIENTATION_FRONT / V4L2_FWNODE_ORIENTATION_BACK :)
>>
>> Since at least atomisp2 is going to need this to we probably need to
>> factor this out into some shared helper.
> 
> I wonder if the atomisp2 driver will ever get out of staging. There's so
> much work to be done there.

I would be more then happy if we can get it mostly functional, ever
getting it out of staging indeed is unlikely.

Regards,

Hans


