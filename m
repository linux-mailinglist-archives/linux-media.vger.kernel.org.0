Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0DC616D97
	for <lists+linux-media@lfdr.de>; Wed,  2 Nov 2022 20:14:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbiKBTOO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Nov 2022 15:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbiKBTNr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Nov 2022 15:13:47 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98DB5FD33
        for <linux-media@vger.kernel.org>; Wed,  2 Nov 2022 12:13:46 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id o4so25940994wrq.6
        for <linux-media@vger.kernel.org>; Wed, 02 Nov 2022 12:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n+I+Lqokjv7sP6aJLEDNgwE9GeDzJdWH6K3Vidb4Obw=;
        b=U2eBcsbAYLW3Pn33GYw1axfu0Cz/KESYcsYtr+LCNN70uMdNXawXPkd1JxsRmiosIr
         ajAHUraTMuotqldfowBp7cL5kYvu7oZHM/3S5l1h99PIuPBvFxuDnRSe+IYKrLmO05Yz
         rsOnzorNWeld5o9raTzLIFQkSn0HxNVq6MuG2uggRMKU5zC5qyLlfdICA57+6ybp5H/y
         q3LRPnpZBqW/mNCDM/kmQVu53hbeKnHrh5dHcrfmSNaXM2cuzRxCAfgw0M3gdAJaV1m1
         OcSja73BJt10AA6CI3EDxUSzW7R86IMXKgyBuIpE7d1zWGi5Z+TlaQi0DgVaL7zqj58N
         2tDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+I+Lqokjv7sP6aJLEDNgwE9GeDzJdWH6K3Vidb4Obw=;
        b=y9FVIyKoyp1K9bxLslfhGnaWlLRvnv0WwY41Pz9RsFtQSHzRf0S//iVrqcTgMbudLj
         2K8e2t1Okiv3Jb7KGLzpitdcqqOQ34JOaqaMJZ4ARt1CqXW0aJKLDSIwzPhCUlKMsOJJ
         va0u93Tf6k/urvd8PxpOexpZeVuH5aTajL0Mx1sOELQqvNgRBQ63Kz2iqqzeoHzR8L/d
         LLSmsKW2LebZ1IXVpxVUuR+wK4N97yQ0SzEVrmJ4ucBl9DzGX2oh6Q2yojKIM9GMETij
         97oH+5OEeTENn2qOBiWlKbSaBmpvnDNO+UePxkGyxfbMdAhK+a3myG2XL8bUlGeHFyYu
         hgOg==
X-Gm-Message-State: ACrzQf1M/UpZEQfVNabK8lHufS6TNU2g8cV7wqaU3RNxgiHaWIAZ/C93
        BZKvu8UTf5bwidRfO4C226M=
X-Google-Smtp-Source: AMsMyM543lj4gCmh1kYmpDtRqF8et3Mf+4gJEiJdH2ZILvi7OHvPW1cDTlzKCrvNU2z9/OUys6fagw==
X-Received: by 2002:a05:6000:c3:b0:236:a261:a2a5 with SMTP id q3-20020a05600000c300b00236a261a2a5mr16499588wrx.137.1667416425027;
        Wed, 02 Nov 2022 12:13:45 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:7c81:2208:32f3:412e? ([2a02:908:1256:79a0:7c81:2208:32f3:412e])
        by smtp.gmail.com with ESMTPSA id w12-20020a05600c474c00b003b4a699ce8esm3175987wmo.6.2022.11.02.12.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 12:13:44 -0700 (PDT)
Message-ID: <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
Date:   Wed, 2 Nov 2022 20:13:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Try to address the DMA-buf coherency problem
Content-Language: en-US
To:     Lucas Stach <l.stach@pengutronix.de>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Daniel Stone <daniel@fooishbar.org>
Cc:     ppaalanen@gmail.com, sumit.semwal@linaro.org, daniel@ffwll.ch,
        robdclark@gmail.com, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
 <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
 <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
 <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
 <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
 <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
 <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
 <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 02.11.22 um 18:10 schrieb Lucas Stach:
> Am Mittwoch, dem 02.11.2022 um 13:21 +0100 schrieb Christian König:
> [SNIP]
>> It would just be doing this for the importer and exactly that
>> would be bad design because we then have handling for the display driver
>> outside of the driver.
>>
> The driver would have to do those cache maintenance operations if it
> directly worked with a non-coherent device. Doing it for the importer
> is just doing it for another device, not the one directly managed by
> the exporter.
>
> I really don't see the difference to the other dma-buf ops: in
> dma_buf_map_attachment the exporter maps the dma-buf on behalf and into
> the address space of the importer. Why would cache maintenance be any
> different?

The issue here is the explicit ownership transfer.

We intentionally decided against that because it breaks tons of use 
cases and is at least by me and a couple of others seen as generally 
design failure of the Linux DMA-API.

DMA-Buf let's the exporter setup the DMA addresses the importer uses to 
be able to directly decided where a certain operation should go. E.g. we 
have cases where for example a P2P write doesn't even go to memory, but 
rather a doorbell BAR to trigger another operation. Throwing in CPU 
round trips for explicit ownership transfer completely breaks that concept.

Additional to that a very basic concept of DMA-buf is that the exporter 
provides the buffer as it is and just double checks if the importer can 
access it. For example we have XGMI links which makes memory accessible 
to other devices on the same bus, but not to PCIe device and not even to 
the CPU. Otherwise you wouldn't be able to implement things like secure 
decoding where the data isn't even accessible outside the device to 
device link.

So if a device driver uses cached system memory on an architecture which 
devices which can't access it the right approach is clearly to reject 
the access.

What we can do is to reverse the role of the exporter and importer and 
let the device which needs uncached memory take control. This way this 
device can insert operations as needed, e.g. flush read caches or 
invalidate write caches.

This is what we have already done in DMA-buf and what already works 
perfectly fine with use cases which are even more complicated than a 
simple write cache invalidation.

>>>> This is just a software solution which works because of coincident and
>>>> not because of engineering.
>>> By mandating a software fallback for the cases where you would need
>>> bracketed access to the dma-buf, you simply shift the problem into
>>> userspace. Userspace then creates the bracket by falling back to some
>>> other import option that mostly do a copy and then the appropriate
>>> cache maintenance.
>>>
>>> While I understand your sentiment about the DMA-API design being
>>> inconvenient when things are just coherent by system design, the DMA-
>>> API design wasn't done this way due to bad engineering, but due to the
>>> fact that performant DMA access on some systems just require this kind
>>> of bracketing.
>> Well, this is exactly what I'm criticizing on the DMA-API. Instead of
>> giving you a proper error code when something won't work in a specific
>> way it just tries to hide the requirements inside the DMA layer.
>>
>> For example when your device can only access 32bits the DMA-API
>> transparently insert bounce buffers instead of giving you a proper error
>> code that the memory in question can't be accessed.
>>
>> This just tries to hide the underlying problem instead of pushing it
>> into the upper layer where it can be handled much more gracefully.
> How would you expect the DMA API to behave on a system where the device
> driver is operating on cacheable memory, but the device is non-
> coherent? Telling the driver that this just doesn't work?

Yes, exactly that.

It's the job of the higher level to prepare the buffer a device work 
with, not the one of the lower level.

In other words in a proper design the higher level would prepare the 
memory in a way the device driver can work with it, not the other way 
around.

When a device driver gets memory it can't work with the correct response 
is to throw an error and bubble that up into a layer where it can be 
handled gracefully.

For example instead of using bounce buffers under the hood the DMA layer 
the MM should make sure that when you call read() with O_DIRECT that the 
pages in question are accessible by the device.

> It's a use-case that is working fine today with many devices (e.g. network
> adapters) in the ARM world, exactly because the architecture specific
> implementation of the DMA API inserts the cache maintenance operations
> on buffer ownership transfer.

Yeah, I'm perfectly aware of that. The problem is that exactly that 
design totally breaks GPUs on Xen DOM0 for example.

And Xen is just one example, I can certainly say from experience that 
this design was a really really bad idea because it favors just one use 
case while making other use cases practically impossible if not really 
hard to implement.

Regards,
Christian.

>
> Regards,
> Lucas
>

