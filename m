Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7CF61629A
	for <lists+linux-media@lfdr.de>; Wed,  2 Nov 2022 13:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbiKBMVw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Nov 2022 08:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbiKBMVu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Nov 2022 08:21:50 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E8323BE3
        for <linux-media@vger.kernel.org>; Wed,  2 Nov 2022 05:21:49 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id q9so44894456ejd.0
        for <linux-media@vger.kernel.org>; Wed, 02 Nov 2022 05:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nBruoFaLBpJXHn50CsZ8DVc757M6ZPA1prT8ktYsSL8=;
        b=g+oMk/EQ8MWArETuO9KmFChjV72ZgJK6vX5H40L/xvbQXD2Uht1BupzBzVdPhnVZJM
         EgruKiOdhPpZTsnSdLtHR714gjvYNNS5/YQifCskQ15h59xHlhyxQXV+7StvLxDHpkwO
         96dpU5KpWNACeOPfiizW7v4fnW6L08trzq6uZMRfJBR2l7E2O1lxON54zDwbsiwh5HHe
         03xjIgdnnBzqHpUhRj6ks67DjLfAYFvQ9J5we3jjTlLKRrSo/kDO58tuMDQL6ZXpDWLQ
         /6hbJmUiL5gSt8vRBFZYTfe7ZF6jjgEaTRHf4DrEnzVo7dEFTbMQ00fq7opye3CqhNxA
         YNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nBruoFaLBpJXHn50CsZ8DVc757M6ZPA1prT8ktYsSL8=;
        b=vXdJxZ4X1bMbWs/rIJVBiAtw0BYlySgJCx1N23keL2ZlL+DBsZtC33+KFTW6YhzWxP
         kE1Xt/kAatoM2c8vtzpNbIgaGO91ZqUz4gPbhKCuU3/8qUOnMOhZrCvPO3sG6SiPjeBU
         3UFB9ZuOmxDH8x1ms+YavUr9a34TSQQCmS4JivgCM3iHPZvAFO4onPrmnFm3bSNhiu2w
         X3BXYZGGp/5UzdvEUPeMQeROsj4fo90JSAkSqXgt3vfjzB+MWUdxxoEov0hpqxn1oITs
         sZNM6XVpgUePv8g9pT1Yk4m7K6/lv5jNvnOJ5+SDcy/DWw/QUGLxTf4s3Bb/8NnTzYZO
         4BoQ==
X-Gm-Message-State: ACrzQf2tGKpQm5RdTBG+HvpFL91h3TGAkT52N4j08BECgVbHdygTNUol
        Cmf2WuglOoqYLt01EoJHGUA=
X-Google-Smtp-Source: AMsMyM4soMXrLJz3jWdR9MoCOuQXJS4eVMNcLuXalmenyDIh9Vl5qdY1agLegNzfpbDTvoyWNmz4kQ==
X-Received: by 2002:a17:907:3f23:b0:78e:260a:fc33 with SMTP id hq35-20020a1709073f2300b0078e260afc33mr24071056ejc.152.1667391707891;
        Wed, 02 Nov 2022 05:21:47 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:576c:b102:647e:9ffd? ([2a02:908:1256:79a0:576c:b102:647e:9ffd])
        by smtp.gmail.com with ESMTPSA id g6-20020aa7c586000000b00461c6e8453dsm5695854edq.23.2022.11.02.05.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 05:21:47 -0700 (PDT)
Message-ID: <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
Date:   Wed, 2 Nov 2022 13:21:46 +0100
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
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
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

Hi Lucas,

Am 02.11.22 um 12:39 schrieb Lucas Stach:
> Hi Christian,
>
> going to reply in more detail when I have some more time, so just some
> quick thoughts for now.
>
> Am Mittwoch, dem 02.11.2022 um 12:18 +0100 schrieb Christian König:
>> Am 01.11.22 um 22:09 schrieb Nicolas Dufresne:
>>> [SNIP]
>> As far as I can see it you guys just allocate a buffer from a V4L2
>> device, fill it with data and send it to Wayland for displaying.
>>
>> To be honest I'm really surprised that the Wayland guys hasn't pushed
>> back on this practice already.
>>
>> This only works because the Wayland as well as X display pipeline is
>> smart enough to insert an extra copy when it find that an imported
>> buffer can't be used as a framebuffer directly.
>>
> With bracketed access you could even make this case work, as the dGPU
> would be able to slurp a copy of the dma-buf into LMEM for scanout.

Well, this copy is what we are trying to avoid here. The codec should 
pump the data into LMEM in the first place.

>>> The only case the commonly fails is whenever we try to display UVC
>>> created dmabuf,
>> Well, exactly that's not correct! The whole x86 use cases of direct
>> display for dGPUs are broken because media players think they can do the
>> simple thing and offload all the problematic cases to the display server.
>>
>> This is absolutely *not* the common use case you describe here, but
>> rather something completely special to ARM.
> It the normal case for a lot of ARM SoCs.

Yeah, but it's not the normal case for everybody.

We had numerous projects where customers wanted to pump video data 
directly from a decoder into an GPU frame or from a GPU frame into an 
encoder.

The fact that media frameworks doesn't support that out of the box is 
simply a bug.

> That world is certainly not
> any less big than the x86 dGPU world. A huge number of devices are ARM
> based set-top boxes and other video players. Just because it is a
> special case for you doesn't mean it's a global special case.

Ok, let's stop with that. This isn't helpful in the technical discussion.

>
>> That we haven't heard anybody screaming that x86 doesn't work is just
>> because we handle the case that a buffer isn't directly displayable in
>> X/Wayland anyway, but this is absolutely not the optimal solution.
>>
>> The argument that you want to keep the allocation on the codec side is
>> completely false as far as I can see.
>>
>> We already had numerous projects where we reported this practice as bugs
>> to the GStreamer and FFMPEG project because it won't work on x86 with dGPUs.
>>
> And on a lot of ARM SoCs it's exactly the right thing to do.

Yeah and that's fine, it just doesn't seem to work in all cases.

For both x86 as well as the case here that the CPU cache might be dirty 
the exporter needs to be the device with the requirements.

For x86 dGPUs that's the backing store is some local memory. For the 
non-coherent ARM devices it's that the CPU cache is not dirty.

For a device driver which solely works with cached system memory 
inserting cache flush operations is something it would never do for 
itself. It would just be doing this for the importer and exactly that 
would be bad design because we then have handling for the display driver 
outside of the driver.

>> This is just a software solution which works because of coincident and
>> not because of engineering.
> By mandating a software fallback for the cases where you would need
> bracketed access to the dma-buf, you simply shift the problem into
> userspace. Userspace then creates the bracket by falling back to some
> other import option that mostly do a copy and then the appropriate
> cache maintenance.
>
> While I understand your sentiment about the DMA-API design being
> inconvenient when things are just coherent by system design, the DMA-
> API design wasn't done this way due to bad engineering, but due to the
> fact that performant DMA access on some systems just require this kind
> of bracketing.

Well, this is exactly what I'm criticizing on the DMA-API. Instead of 
giving you a proper error code when something won't work in a specific 
way it just tries to hide the requirements inside the DMA layer.

For example when your device can only access 32bits the DMA-API 
transparently insert bounce buffers instead of giving you a proper error 
code that the memory in question can't be accessed.

This just tries to hide the underlying problem instead of pushing it 
into the upper layer where it can be handled much more gracefully.

Regards,
Christian.

>
> Regards,
> Lucas
>

