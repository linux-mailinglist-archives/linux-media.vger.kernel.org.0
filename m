Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E679949CDBB
	for <lists+linux-media@lfdr.de>; Wed, 26 Jan 2022 16:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242621AbiAZPPS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jan 2022 10:15:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26051 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235908AbiAZPPS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jan 2022 10:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643210117;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yv+zLGXTgN/j+XDk7CVHD469KTC+3UXVAaGUPbzAx48=;
        b=i7FXVQVo8eHdZo2N+IboEC3kpJAP0vTh3tl++d36THkUEhfSmcYwLByflF2nRl20hd3S0h
        h35xzDPey+zckdHm67sAIRwRDwOb4UY+XO7GP868IqRCXLe9GDgMgB42HnH7wHdicguBW8
        4gmIH8dckmjW0YCvQUiK9FO/oloJbOY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-ZhSqHcFgPo6YOJuR7We0hA-1; Wed, 26 Jan 2022 10:15:16 -0500
X-MC-Unique: ZhSqHcFgPo6YOJuR7We0hA-1
Received: by mail-ed1-f71.google.com with SMTP id k10-20020a50cb8a000000b00403c8326f2aso16882352edi.6
        for <linux-media@vger.kernel.org>; Wed, 26 Jan 2022 07:15:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yv+zLGXTgN/j+XDk7CVHD469KTC+3UXVAaGUPbzAx48=;
        b=eMEiz2LlLZboqz78R+SNg58hCBi7ZsPwb9eQkJYVF1wqVaSUeEU0g/C9BaE+f15wP6
         P9qn+MYvkNB7YHQdc9l6Cews7d1BMCeWS7AMxczNWt4Mp1PK8AraShGT26n3bz5GmY39
         s1mHF03NaUyWDR7+tpor4zR0utcEy3YFP/Xv1Y+GxDPDV91DLlcUUDHe8/BbdzGZtAmM
         z8LkuX2M1pRYyaKdlxrHjFc+8YTIFdmhBAjQ8xRVOE5UlJPZrXfT7nmF3PTyqE5CxNr9
         h8KjrVSPXHouakbej5dxo+HYvA+PlsMoHHPQV/Ftccy0MCTBzLGAP8cZSU36LpowkSl5
         /Jfw==
X-Gm-Message-State: AOAM5332dskTyxRfXrPI2Pa58DvQywIGyhVVxoVU4L6DPUh/JwnRpiYl
        XuATHOr9r1pbO40ons2P9Q/EcltL+hqXS0cyTBSPeVVC1QOQCafE0HKI9cKesKuuk/5VANPMXKw
        +h8GE8j5n1AOuR7J244gukdk=
X-Received: by 2002:a17:907:72d5:: with SMTP id du21mr36864ejc.158.1643210115207;
        Wed, 26 Jan 2022 07:15:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyT7bXQyghZjLVMOdErCV3q3nEiZwjB9kk283FmkQIm9aLnwLKgvrR2AHk4Gf5NUdkcFM7kow==
X-Received: by 2002:a17:907:72d5:: with SMTP id du21mr36851ejc.158.1643210114994;
        Wed, 26 Jan 2022 07:15:14 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id h6sm7485402ejx.164.2022.01.26.07.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 07:15:14 -0800 (PST)
Message-ID: <8f6dbd72-0996-b80d-f9a8-8bc5dcf50be7@redhat.com>
Date:   Wed, 26 Jan 2022 16:15:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Firmware (devicetree/ACPI interface) for marking camera sensors
 being on the front/back of a device
Content-Language: en-US
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        libcamera devel <libcamera-devel@lists.libcamera.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
References: <31c05526-f6fc-f48f-a900-8103ac5c4215@redhat.com>
 <CAAFQd5A-EoaMuviovH_3LSKacX-2=cXWhxVEosEZ6c-uAJ8R3g@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAAFQd5A-EoaMuviovH_3LSKacX-2=cXWhxVEosEZ6c-uAJ8R3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On 1/26/22 12:58, Tomasz Figa wrote:
> Hi Hans,
> 
> +Ricardo Ribalda +Sergey Senozhatsky FYI
> 
> On Mon, Jan 17, 2022 at 6:43 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> IIRC there was some discussion about $subject a while ago,
>> esp. being pushed by the ChromeOS folks (IIRC). If you know what
>> I'm talking about, please add relevant folks to the Cc.
>>
>> While doing some work on atomisp support I noticed that the
>> ACPI device fwnode-s describing the sensors have an ACPI _PLD
>> method, which is a standardized ACPI method to retreive an
>> package (ACPI for struct) describing the location of things
>> like USB ports; and in this case of the camera sensors.
>>
>> And upon checking the Surface Go DSDT the sensors there seem to
>> have the _PLD bits to. And in both cases at least the following
>> PLD field (bits 67-69) seems to contain valid and relevant info,
>> quoting from the ACPI spec 6.2 version, page 329:
>>
>> """
>> Panel: Describes which panel surface of the system’s housing
>> the device connection point resides on:
>> 0 – Top
>> 1 – Bottom
>> 2 – Left
>> 3 – Right
>> 4 – Front
>> 5 – Back
>> 6 – Unknown
>> """
>>
>> This seems to be consistently set to 4 or 5 for the _PLD method
>> of the sensor ACPI nodes which I checked.
>>
>> So rather then defining a new devicetree property for this and
>> embedding that inside the ACPI tables, IMHO it would be best if
>> the ChromeOS devices would use the standardized _PLD ACPI method
>> for this too.
> 
> Thanks for bringing this to our attention.
> 
> We don't seem to be using it in our ACPI tables, but I agree that it
> sounds like something that should be populated.
> 
> However, we probably still need something else to describe rotation
> (as Laurent mentioned)

Ack.

> and position on the plane (when there is more
> than one camera facing the same direction).

The position on the device, relative to other sensors can also
be described in an acpi _PLD package. Note I'm not sure of it
is already being used this way anywhere though.

Regards,

Hans




> 
> Best regards,
> Tomasz
> 

