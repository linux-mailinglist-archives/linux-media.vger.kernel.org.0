Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5724E44D920
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 16:23:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbhKKP0c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 10:26:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59785 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230177AbhKKP0c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 10:26:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636644222;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=96KHuS7Sase+wnAJHqC9Sz589beINyZY9/+jfe26UQ4=;
        b=P2NJcUH7LNlqCVghM/zbt+MkmcyxDWhexsWI49AsMYQlLkXQ+VcB9aEXjB9FTNypC9NiAn
        B+CqLPS7NdzXC5xANBiPSAKHltWdeWNPdnovpoHZpI2zBcTB5lEZmd86gM1+mantMEKD5B
        vDjjKqOjr5wV6ZoqiOmLMji5hKrD/ak=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-BrfeYFzQNz2MuA_1JcUXEA-1; Thu, 11 Nov 2021 10:23:41 -0500
X-MC-Unique: BrfeYFzQNz2MuA_1JcUXEA-1
Received: by mail-ed1-f72.google.com with SMTP id t20-20020a056402525400b003e2ad6b5ee7so5691892edd.8
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 07:23:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=96KHuS7Sase+wnAJHqC9Sz589beINyZY9/+jfe26UQ4=;
        b=HPB8I70hnjPmvsNyiJIjxXagdzUiGfpUim8hRZveEOQtG4HUwBPAcvFpV3iMs5yKyy
         rhhlw7Tt4lw4g3s87voC2f1nR+qgA8DFMm6cfQZIU/G+V4YgWMEFLKOBlzA7eAfckRHH
         mW+S7sBYXiknvae96rjfDo3IzZrkTZH9F/03qQtOL0FvF07+5NrBFfI5ldR5kFf1Dn7s
         mNSrwO/22RA+2wGKMXer2JsU/2aRRA51EwAOEJNEPU9Ha1vDEddbTmxsQIPHDF025dFa
         WDTGYaHnaqy0M8Hzn0Lzsvueb128Ydz7s4ol9jtmaG6YUqBBIrLSrfLKTkfVzN7RzNyf
         6uUA==
X-Gm-Message-State: AOAM531j/AjhsVezHJxi+FSVifW9tXQPoLlKbfUytf8YSWY1ATfqMbTv
        +DVe1A7vR0mAEjqUex21EfD+q026iXXhLPdK/h7mYUaFNHPA53NT3EVSLm535GaiQ0UX2vz/Pc6
        TZPTEBGprBtdj/FtSgWptUY4=
X-Received: by 2002:a17:907:72d4:: with SMTP id du20mr10540749ejc.419.1636644219942;
        Thu, 11 Nov 2021 07:23:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPGM7oH1p/+UOJ7OQp3Yfr6EFk/h+fjhTea7RA3yZZWNXTbgrUSLimGiKS2AhMAc2AkYUhQw==
X-Received: by 2002:a17:907:72d4:: with SMTP id du20mr10540720ejc.419.1636644219694;
        Thu, 11 Nov 2021 07:23:39 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id o5sm1930478edc.25.2021.11.11.07.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 07:23:39 -0800 (PST)
Message-ID: <4c7b9d72-4634-ea1d-5fff-bf17c3834b72@redhat.com>
Date:   Thu, 11 Nov 2021 16:23:38 +0100
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
 <495cbb6b-656d-6c3b-669a-f4b588e970cc@redhat.com>
 <a26f70ae-203e-99fd-8e4d-484af6f207f7@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a26f70ae-203e-99fd-8e4d-484af6f207f7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/11/21 12:18, Daniel Scally wrote:

<snip>

>>> One problem I'm experiencing
>>> is that the focus position I set isn't maintained; it holds for a couple
>>> of seconds and then resets to the "normal" focus...this happens when the
>>> .close() callback for the driver is called, which happens right after
>>> the control value is applied. All the other VCM drivers in the kernel
>>> power down on .close() so I did the same>
>> Right, I believe that this is fine though, we expect people to use
>> libcamera with this and once libcamera gets autofocus support, then
>> I would expect libcamera to keep the fd open the entire time while
>> streaming.
> 
> 
> OK - as long as that's how it works then I agree that this is fine as is
> yes.

So I've just picked up an old project of mine, called gtk-v4l which
is a nice simply v4l2 controls applet and patches it up to also
work on v4l-subdevs:

https://github.com/jwrdegoede/gtk-v4l/

So now you can run:

sudo gtk-v4l -d /dev/v4l-subdev8

And it will give you a slider to control the focus; and as
a bonus it keeps the v4l-subdev open, so no more runtime-pm
issue :)

>> What is necessary is some way for libcamera to:
>>
>> 1. See if there is a VCM which belongs to the sensor; and
>> 2. If there is a VCM figure out which v4l2-subdev it is.
>>
>> Also see this email thread, where Hans Verkuil came to the
>> conclusion that this info is currently missing from the MC
>> representation (link is to the conclusion):
>>
>> https://lists.libcamera.org/pipermail/libcamera-devel/2021-October/026144.html
> 
> 
> Yeah I read through that thread too, and had a brief chat with Laurent
> about it. My plan was to add a new type of link called an "ancillary
> link" between two entities, and automatically create those in
> match_notify() based on the function field of the matching entities, and
> expose them as part of the media graph. I've started working on that but
> not progressed far enough to share anything.

Sounds good.

> Libcamera would need
> updating with support for that too though.

Right I think libcamera will need updating no matter what, first we
need to comeup with a userspace API for this.

Although I guess it would be good to also write libcamera patches
once the kernel patches are ready, but not yet merged, to make
sure the API is usable without problems by libcamera.

Regards,

Hans

