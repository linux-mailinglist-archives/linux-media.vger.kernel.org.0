Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2C776162AE
	for <lists+linux-media@lfdr.de>; Wed,  2 Nov 2022 13:27:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbiKBM1Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Nov 2022 08:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiKBM1W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Nov 2022 08:27:22 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2CF424945
        for <linux-media@vger.kernel.org>; Wed,  2 Nov 2022 05:27:21 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id a67so26153416edf.12
        for <linux-media@vger.kernel.org>; Wed, 02 Nov 2022 05:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xdNcjSzMT/xbDLiKbtpdXhcZmpWwCkU4t2l372cy+Nw=;
        b=JgkkpnVfgctl0PtCmaLB0wK4r8Z+IzbnHelFuEZ0tJ70dmYw7yvSu0SwUOXnhRvVTG
         Osat0B5eVOeH2YkDyrTqvTaAYXgMdte9i9WI9Riu0m8g9Y02Lkic2rhBwewIBimvV9gr
         VYyKwMKM/pYMJwpClUCtEEq3/MTlXaZs+YTSR0W1HiVYIEQQob/+tM+B7R2iBZDhAYRe
         W5rZ1kMK6cY3pwVdDVnPmc9iQpc58B5Td+7Anh50IQ3zvQuSC5KHP89AcryKvrc/sDSW
         oLLZQL2wnzj7xQsdFjEe3spgKskLjQsdNV3LTm1O2ctop3PeZ24HiuPF6EtDuH0RFm+D
         G2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xdNcjSzMT/xbDLiKbtpdXhcZmpWwCkU4t2l372cy+Nw=;
        b=UxXUnc13sdRGuzd6TnCRAj/cCW5a5Ibk/qXmOYBbjMJZE4ItTkE++/qaHKY/KrGJgm
         xkipD4ThmC3wvMZwrgEyB9FpW6APnrvGr4cIimeK1lCxrk7LGL993sa3JxS3kTpLx6nP
         /1hhEzoSPiLrdLkO5KTBzn3OwGLh7ingYrpjwhe1z5lpkmmE3oSni3ocNltP/g3+uZx4
         0VwkIKFgrhJ2ppcKkr+Oc4Q3hD/cNKEXAl5rhS8txIFyU5JUseh+0cIw2UjJTYdV1bkJ
         sg+akUHSSPPe1RBX9dlAfW10xRMdoXCLoIOaAYmlukwiwePCZkltqSiwYa+eGySCcqwA
         Tx+Q==
X-Gm-Message-State: ACrzQf11zP/tnYCJpqS9fD7mQzlMAcUHC0WSp6fCgtfnOwEL7I0AdSB6
        tfE5Oy0gWzAh+Cd3kJ4BHjY=
X-Google-Smtp-Source: AMsMyM6b0N4MxEp+n5qguXpFMadwuU9rXeaEWoev9RRlfRtCbtSMXwvT6JbW7u+gd4UG604taM2nAQ==
X-Received: by 2002:a05:6402:428f:b0:454:c988:4bb1 with SMTP id g15-20020a056402428f00b00454c9884bb1mr24024317edc.196.1667392040515;
        Wed, 02 Nov 2022 05:27:20 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:576c:b102:647e:9ffd? ([2a02:908:1256:79a0:576c:b102:647e:9ffd])
        by smtp.gmail.com with ESMTPSA id q16-20020a17090676d000b007ae035374a0sm692576ejn.214.2022.11.02.05.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 05:27:19 -0700 (PDT)
Message-ID: <cc470b3d-a611-044f-2b35-cc827c962f9b@gmail.com>
Date:   Wed, 2 Nov 2022 13:27:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Try to address the DMA-buf coherency problem
Content-Language: en-US
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Daniel Stone <daniel@fooishbar.org>,
        Lucas Stach <l.stach@pengutronix.de>, sumit.semwal@linaro.org,
        daniel@ffwll.ch, robdclark@gmail.com,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
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
 <20221102141954.7d362068@eldfell>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20221102141954.7d362068@eldfell>
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

Am 02.11.22 um 13:19 schrieb Pekka Paalanen:
> On Wed, 2 Nov 2022 12:18:01 +0100
> Christian König <ckoenig.leichtzumerken@gmail.com> wrote:
>
>> Am 01.11.22 um 22:09 schrieb Nicolas Dufresne:
>>> [SNIP]
>>>>> But the client is just a video player. It doesn't understand how to
>>>>> allocate BOs for Panfrost or AMD or etnaviv. So without a universal
>>>>> allocator (again ...), 'just allocate on the GPU' isn't a useful
>>>>> response to the client.
>>>> Well exactly that's the point I'm raising: The client *must* understand
>>>> that!
>>>>
>>>> See we need to be able to handle all restrictions here, coherency of the
>>>> data is just one of them.
>>>>
>>>> For example the much more important question is the location of the data
>>>> and for this allocating from the V4L2 device is in most cases just not
>>>> going to fly.
>>> It feels like this is a generic statement and there is no reason it could not be
>>> the other way around.
>> And exactly that's my point. You always need to look at both ways to
>> share the buffer and can't assume that one will always work.
>>
>> As far as I can see it you guys just allocate a buffer from a V4L2
>> device, fill it with data and send it to Wayland for displaying.
>>
>> To be honest I'm really surprised that the Wayland guys hasn't pushed
>> back on this practice already.
> What should we Wayland people be pushing back on exactly? And where is
> our authority and opportunity to do so?
>
> The Wayland protocol dmabuf extension allows a graceful failure if the
> Wayland compositor cannot use the given dmabuf at all, giving the
> client an opportunity to try something else.

That's exactly what I meant with pushing back :)

I wasn't aware that this handling is already implemented.

> The Wayland protocol also
> tells clients which DRM rendering device at minimum the dmabuf needs to
> be compatible with. It even tells which KMS device the dmabuf could be
> put on direct scanout if the dmabuf was suitable for that and direct
> scanout is otherwise possible.

Yeah, perfect. Exactly that's what's needed here.

> What the client (application) does with all that information is up to
> the client. That code is not part of Wayland.
>
> I'm sure we would be happy to add protocol for anything that
> https://github.com/cubanismo/allocator needs to become the universal
> optimal buffer allocator library.

 From what you wrote it's already perfectly covered.

>> This only works because the Wayland as well as X display pipeline is
>> smart enough to insert an extra copy when it find that an imported
>> buffer can't be used as a framebuffer directly.
> The only fallback Wayland compositors tend to do is use OpenGL/Vulkan
> rendering for composition if direct scanout on a KMS plane does not
> work. There are many reasons why direct scanout may not be possible in
> addition to hardware and drivers not agreeing to do it with the given
> set of buffers.
>
> A general purpose (read: desktop) Wayland compositor simply cannot live
> without being able to fall back from KMS composition to software/GPU
> composition.
>
> But yes, there are use cases where that fallback is as good as failing
> completely. Those are not desktops but more like set-top-boxes and TVs.

Completely agree to this approach.

The only problem is that media players tend to not implement a way to 
allow direct scanout because of those fallback paths.

But as you said that's their decision.

Thanks,
Christian.

>
>
> Thanks,
> pq

