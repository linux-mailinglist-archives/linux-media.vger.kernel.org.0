Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3B6845A239
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 13:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234548AbhKWMN3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 07:13:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbhKWMN2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 07:13:28 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19D8BC061574
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 04:10:20 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id u18so38595810wrg.5
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 04:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=AFknG6qJM/YMKbAu1sCv7OoaiWHL/D2rl7nQkGCudrI=;
        b=bRa4Okb6B97CAsxI6mf3r38SxHOdKOJfdXw5EFkNHv6jQsGCRWS2lno155tiR0BopS
         B6RLo/bPQwuwoWEHLNs0Bp3v+dB7t1SExZGVzBafC7VwxMjjbGGfOdoJznTMw69PNxSN
         fqj7tPw5OwhZNWl2zIa8BfSUek5ei11JGzwSqDikDZWrCd7I3do1u918mt+RnzJbd5it
         EGSWaLC+26McNpx0e/BHxo1mXAZEgGxuX1PVhyl82ex5hNZiXM6gZpq7uF3ZGLpLal2N
         V0R6K4xcDAM9uc0/5ukvSCp9KlDZvL1jXyQL49MQdVR4KA14uKOaJ/AAVhaLrM4R8n03
         iTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=AFknG6qJM/YMKbAu1sCv7OoaiWHL/D2rl7nQkGCudrI=;
        b=FJrrmIHtP7RMyJNAYbhDwXsrsSdaOhhNE8ojopbhq1e5Jj/Y4Cl6yIyK/0ADzrCf9y
         Anqoy2uOmVlwWOOEnIkxvmdlVEDJUS7qxV1Fr37RT2U4r7dKG28TKxpXOkWvs6EYY7H/
         w+WIWpNbBW7VvFVIHsGzLLFCoZglh2sMMRi1/SzL9lgtABldUyYVxKH5yGy3iirtdMTT
         mp2BWryV7FmN/AoYIOq0/x035c5McPPBtt8tiB0by9Mx1P2k8Af6mRJvn4hEYRBwRz/H
         Rg2G1Xf9zGNaC69vnfcOLTe6+VtA9n699Hv5Q9X8z3VDlmiJUcG/2jtcR44VPffflKao
         2/Dw==
X-Gm-Message-State: AOAM530ALctQ1HDynCq2ee5G4pQi3KvE7lg+CENpasUY4gGHPf3Zy22A
        T8lmyqHpOJsScnuDNbv8w1UlGwaV6CU=
X-Google-Smtp-Source: ABdhPJysY5+jAa2nM7tqOtGN/7CgtqqUO5PH2WUXL0qT15sITw6iNlmw/Aiz1CQteR3TwMZG4IeflQ==
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr6837406wrn.82.1637669418633;
        Tue, 23 Nov 2021 04:10:18 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id f8sm2172740wmf.2.2021.11.23.04.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 04:10:17 -0800 (PST)
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
 <29bf3454-2f82-7791-2aa2-c5e1cb5610a5@gmail.com>
 <6ee7c491-4636-8819-c954-dfc6abcfd1a5@gmail.com>
 <495cbb6b-656d-6c3b-669a-f4b588e970cc@redhat.com>
 <a26f70ae-203e-99fd-8e4d-484af6f207f7@gmail.com>
 <4c7b9d72-4634-ea1d-5fff-bf17c3834b72@redhat.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <7a84ed2e-b898-6935-ebe3-ff3c6887691e@gmail.com>
Date:   Tue, 23 Nov 2021 12:10:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <4c7b9d72-4634-ea1d-5fff-bf17c3834b72@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On 11/11/2021 15:23, Hans de Goede wrote:
> Hi,
>
> On 11/11/21 12:18, Daniel Scally wrote:
>
> <snip>
>
>>>> One problem I'm experiencing
>>>> is that the focus position I set isn't maintained; it holds for a couple
>>>> of seconds and then resets to the "normal" focus...this happens when the
>>>> .close() callback for the driver is called, which happens right after
>>>> the control value is applied. All the other VCM drivers in the kernel
>>>> power down on .close() so I did the same>
>>> Right, I believe that this is fine though, we expect people to use
>>> libcamera with this and once libcamera gets autofocus support, then
>>> I would expect libcamera to keep the fd open the entire time while
>>> streaming.
>>
>> OK - as long as that's how it works then I agree that this is fine as is
>> yes.
> So I've just picked up an old project of mine, called gtk-v4l which
> is a nice simply v4l2 controls applet and patches it up to also
> work on v4l-subdevs:
>
> https://github.com/jwrdegoede/gtk-v4l/
>
> So now you can run:
>
> sudo gtk-v4l -d /dev/v4l-subdev8
>
> And it will give you a slider to control the focus; and as
> a bonus it keeps the v4l-subdev open, so no more runtime-pm
> issue :)


This is just neat regardless of the problem we were having; thanks!

>>> What is necessary is some way for libcamera to:
>>>
>>> 1. See if there is a VCM which belongs to the sensor; and
>>> 2. If there is a VCM figure out which v4l2-subdev it is.
>>>
>>> Also see this email thread, where Hans Verkuil came to the
>>> conclusion that this info is currently missing from the MC
>>> representation (link is to the conclusion):
>>>
>>> https://lists.libcamera.org/pipermail/libcamera-devel/2021-October/026144.html
>>
>> Yeah I read through that thread too, and had a brief chat with Laurent
>> about it. My plan was to add a new type of link called an "ancillary
>> link" between two entities, and automatically create those in
>> match_notify() based on the function field of the matching entities, and
>> expose them as part of the media graph. I've started working on that but
>> not progressed far enough to share anything.
> Sounds good.
>
>> Libcamera would need
>> updating with support for that too though.
> Right I think libcamera will need updating no matter what, first we
> need to comeup with a userspace API for this.
>
> Although I guess it would be good to also write libcamera patches
> once the kernel patches are ready, but not yet merged, to make
> sure the API is usable without problems by libcamera.


Realised I'd not updated you on this for a while - I've got the new
style of links created by the kernel when the fwnode match is made, and
those are visible in userspace, I'm just working on hacking libcamera to
accomodate them too. cpp is new to me though so it might take me a while

>
> Regards,
>
> Hans
>
