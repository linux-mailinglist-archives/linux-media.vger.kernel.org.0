Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F129245ABF3
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 20:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234469AbhKWTFp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 14:05:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56695 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231886AbhKWTFn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 14:05:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637694154;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LZ/WSsSLjliNb5U0y8xWCWDiRx4CbuyuBUpFrttPfzA=;
        b=JnlEnDChkpVlLBRLEOkAOede8JoAa3Q6wnJxTRgKpy7FvszXOqXUGIkLOiDCq1rek5drNg
        DYFBCbjNdDqM5IIpqOtJPKxvUm20VKzOZOlI1dGyWWxcv+VQlUPX2FFmtZ0EH6Fao5a99B
        E9xJfqj+Ms6oRsfWBgBTwy8bZxbQGvw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-TQmRJqsENXqKxKRdMumohw-1; Tue, 23 Nov 2021 14:02:33 -0500
X-MC-Unique: TQmRJqsENXqKxKRdMumohw-1
Received: by mail-ed1-f70.google.com with SMTP id t9-20020aa7d709000000b003e83403a5cbso16777994edq.19
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 11:02:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LZ/WSsSLjliNb5U0y8xWCWDiRx4CbuyuBUpFrttPfzA=;
        b=eLKmIdHjQM3NVwvLCUsKV0qLYRE51vpqi+kE2zBm9Eru1B36acTcFvtbUHiuRgk0sP
         51BSh2S5q+7nuHWTXyk0yVCHPJdsQ3OfoCRYQLUif9HvCnUav6flu1YJmhDYGNJjAMos
         9cAat4ZRUMiKL/aK9qltADA6nwgYDigKPGasM4I+g/8PdB7gKL6Bo1yn7vhjztz1OoWO
         jp53vXbMBGdqRZQX1Bf/v4QRBJhf/LY8Lo2BYTG/Gq+I5l7TIPjNTtE0Lbt7yRMN3XiG
         ELMI+gaIOc3n9GF8loPTa4yvEmRtOlUHU1JhdUdhWfZ4XyNjQ+E8kk4dCeIiPM68R7nb
         PdEA==
X-Gm-Message-State: AOAM5324iR5ugbtJ1ZzVf4ud+JrUwr9Ov8aVHjcZE6CCS7yzXXlefV7o
        E7SPUx64oMqYGc/hgX/BC5c1w1HKjfohtihAUP+n1aVUkA5eWJuPNQzufHWl4i1xb916hB6+yLY
        u5lMa+EEd63jaNT3aWUmmsOE=
X-Received: by 2002:aa7:dc14:: with SMTP id b20mr12842263edu.133.1637694152470;
        Tue, 23 Nov 2021 11:02:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzN0iKFllvilRch32poFUKBhtJa9Mfw39IYszucW66mkOLJM4VOpxFlf9ElrL41LFpmCqrYEg==
X-Received: by 2002:aa7:dc14:: with SMTP id b20mr12842215edu.133.1637694152230;
        Tue, 23 Nov 2021 11:02:32 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id p3sm5611168ejy.94.2021.11.23.11.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 11:02:31 -0800 (PST)
Message-ID: <0f5ea927-7368-b20d-8dc5-0871cddf65a5@redhat.com>
Date:   Tue, 23 Nov 2021 20:02:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
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
 <495cbb6b-656d-6c3b-669a-f4b588e970cc@redhat.com>
 <a26f70ae-203e-99fd-8e4d-484af6f207f7@gmail.com>
 <4c7b9d72-4634-ea1d-5fff-bf17c3834b72@redhat.com>
 <7a84ed2e-b898-6935-ebe3-ff3c6887691e@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <7a84ed2e-b898-6935-ebe3-ff3c6887691e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On 11/23/21 13:10, Daniel Scally wrote:
> Hi Hans
> 
> On 11/11/2021 15:23, Hans de Goede wrote:
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
>>> OK - as long as that's how it works then I agree that this is fine as is
>>> yes.
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
> 
> This is just neat regardless of the problem we were having; thanks!
> 
>>>> What is necessary is some way for libcamera to:
>>>>
>>>> 1. See if there is a VCM which belongs to the sensor; and
>>>> 2. If there is a VCM figure out which v4l2-subdev it is.
>>>>
>>>> Also see this email thread, where Hans Verkuil came to the
>>>> conclusion that this info is currently missing from the MC
>>>> representation (link is to the conclusion):
>>>>
>>>> https://lists.libcamera.org/pipermail/libcamera-devel/2021-October/026144.html
>>>
>>> Yeah I read through that thread too, and had a brief chat with Laurent
>>> about it. My plan was to add a new type of link called an "ancillary
>>> link" between two entities, and automatically create those in
>>> match_notify() based on the function field of the matching entities, and
>>> expose them as part of the media graph. I've started working on that but
>>> not progressed far enough to share anything.
>> Sounds good.
>>
>>> Libcamera would need
>>> updating with support for that too though.
>> Right I think libcamera will need updating no matter what, first we
>> need to comeup with a userspace API for this.
>>
>> Although I guess it would be good to also write libcamera patches
>> once the kernel patches are ready, but not yet merged, to make
>> sure the API is usable without problems by libcamera.
> 
> 
> Realised I'd not updated you on this for a while - I've got the new
> style of links created by the kernel when the fwnode match is made, and
> those are visible in userspace, I'm just working on hacking libcamera to
> accomodate them too. cpp is new to me though so it might take me a while

That is good to hear. You mau have noticed I've been a bit quiet too.

I've been busy with other drivers/platform/x86 stuff, but I hope to wrap
that up soon and post a v6 of the INT3472 / surface go back camera series,
including VCM support.

Regards,

Hans

