Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9EA86150ED
	for <lists+linux-media@lfdr.de>; Tue,  1 Nov 2022 18:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbiKARkv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Nov 2022 13:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbiKARks (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Nov 2022 13:40:48 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EAEF1C421
        for <linux-media@vger.kernel.org>; Tue,  1 Nov 2022 10:40:47 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id b2so38918397eja.6
        for <linux-media@vger.kernel.org>; Tue, 01 Nov 2022 10:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GRs+ErkNwu4zE9UIJ4s2EeakhzaWS2TcSmL7yJSwxFc=;
        b=VSpeUNPMwm3uAArVCjAcui+lJyFl6hadnoCUhyqNgUN9Ji6EBoDPXseYg6l4vKSXV3
         pkz99kcDgyS3jOy+YT1gpeEMBB3XgrgC9VoGK/9dRoPC6hSLdPL0xjfcCf470CrL1LpI
         CRv1jRJA3nCvVrpS2mCXYQW0LAvubvTutDG2PPG0s2weJCHPb9IdzZJHL/gVT05QtwbD
         afbWJJlXGbO0f+lJVdz2/df95ftsjbIZIy1/TjyZMeHrWVyI2OmpTO47C2bSQno5uTNa
         ttLuncjnAFgSSgcaa6dSiq0N7y7va/D1RxG7dbe1p6VeJpGS1YGgh5xb4Q6x3wOtvCBn
         2JOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GRs+ErkNwu4zE9UIJ4s2EeakhzaWS2TcSmL7yJSwxFc=;
        b=t1PLd6+IuQLxr2ggREdlgUyBrW4GAD7i6UarBsQUWYKnXcYjxG/e86CwWgip5nWG/M
         3LTt05e0iEAK13YvZzFJeejr0qEHxi5/B5mJ2S+qnqliJMRpTYLEPF6zEkiq0UtjtG53
         PILMEyfyN4uz0zJLvLcqiCf7DAlknY0lQ3NqJziq9fKWhED5BSKVpI7trwinE2H2tJsd
         Z7BYnFz6N5Mph5hd4Jgjnrx4jKRoZC7zFxc0SfgMzMfRA5ixBq9MzlISrZRisGVmDQrw
         tH8bIcajRDdiO6Qa75O0puBvbKTNUm86OsfbWCeBcrutoWcgusN3hVw2wHaRCK6gXG1o
         LXdg==
X-Gm-Message-State: ACrzQf2omaQkZ5wSzENA21PnulD2/z8I7jOoWrKCCKrTjukLhJQBRJWw
        +lQF/MoI9J3YGjlgIm1lRIM=
X-Google-Smtp-Source: AMsMyM6B8uK2k8LsEcHxqIFmGBayhCJT2QQki/6Qg+LayxjGcTeQmy2/EHqWdgFF5ydGFUuuOQougA==
X-Received: by 2002:a17:907:3fa6:b0:7ad:8bd5:b7ea with SMTP id hr38-20020a1709073fa600b007ad8bd5b7eamr19120118ejc.130.1667324445382;
        Tue, 01 Nov 2022 10:40:45 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:49b3:944:a1d4:4523? ([2a02:908:1256:79a0:49b3:944:a1d4:4523])
        by smtp.gmail.com with ESMTPSA id w9-20020a170906384900b007ab1b4cab9bsm4440737ejc.224.2022.11.01.10.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 10:40:44 -0700 (PDT)
Message-ID: <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
Date:   Tue, 1 Nov 2022 18:40:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Try to address the DMA-buf coherency problem
Content-Language: en-US
To:     Daniel Stone <daniel@fooishbar.org>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Lucas Stach <l.stach@pengutronix.de>, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
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
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
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

Am 28.10.22 um 20:47 schrieb Daniel Stone:
> Hi Christian,
>
> On Fri, 28 Oct 2022 at 18:50, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 28.10.22 um 17:46 schrieb Nicolas Dufresne:
>>> Though, its not generically possible to reverse these roles. If you want to do
>>> so, you endup having to do like Android (gralloc) and ChromeOS (minigbm),
>>> because you will have to allocate DRM buffers that knows about importer specific
>>> requirements. See link [1] for what it looks like for RK3399, with Motion Vector
>>> size calculation copied from the kernel driver into a userspace lib (arguably
>>> that was available from V4L2 sizeimage, but this is technically difficult to
>>> communicate within the software layers). If you could let the decoder export
>>> (with proper cache management) the non-generic code would not be needed.
>> Yeah, but I can also reverse the argument:
>>
>> Getting the parameters for V4L right so that we can share the image is
>> tricky, but getting the parameters so that the stuff is actually
>> directly displayable by GPUs is even trickier.
>>
>> Essentially you need to look at both sides and interference to get to a
>> common ground, e.g. alignment, pitch, width/height, padding, etc.....
>>
>> Deciding from which side to allocate from is just one step in this
>> process. For example most dGPUs can't display directly from system
>> memory altogether, but it is possible to allocate the DMA-buf through
>> the GPU driver and then write into device memory with P2P PCI transfers.
>>
>> So as far as I can see switching importer and exporter roles and even
>> having performant extra fallbacks should be a standard feature of userspace.
>>
>>> Another case where reversing the role is difficult is for case where you need to
>>> multiplex the streams (let's use a camera to illustrate) and share that with
>>> multiple processes. In these uses case, the DRM importers are volatile, which
>>> one do you abuse to do allocation from ? In multimedia server like PipeWire, you
>>> are not really aware if the camera will be used by DRM or not, and if something
>>> "special" is needed in term of role inversion. It is relatively easy to deal
>>> with matching modifiers, but using downstream (display/gpu) as an exporter is
>>> always difficult (and require some level of abuse and guessing).
>> Oh, very good point! Yeah we do have use cases for this where an input
>> buffer is both displayed as well as encoded.
> This is the main issue, yeah.
>
> For a standard media player, they would try to allocate through V4L2
> and decode through that into locally-allocated buffers. All they know
> is that there's a Wayland server at the other end of a socket
> somewhere which will want to import the FD. The server does give you
> some hints along the way: it will tell you that importing into a
> particular GPU target device is necessary as the ultimate fallback,
> and importing into a particular KMS device is preferable as the
> optimal path to hit an overlay.
>
> So let's say that the V4L2 client does what you're proposing: it
> allocates a buffer chain, schedules a decode into that buffer, and
> passes it along to the server to import. The server fails to import
> the buffer into the GPU, and tells the client this. The client then
> ... well, it doesn't know that it needs to allocate within the GPU
> instead, but it knows that doing so might be one thing which would
> make the request succeed.
>
> But the client is just a video player. It doesn't understand how to
> allocate BOs for Panfrost or AMD or etnaviv. So without a universal
> allocator (again ...), 'just allocate on the GPU' isn't a useful
> response to the client.

Well exactly that's the point I'm raising: The client *must* understand 
that!

See we need to be able to handle all restrictions here, coherency of the 
data is just one of them.

For example the much more important question is the location of the data 
and for this allocating from the V4L2 device is in most cases just not 
going to fly.

The more common case is that you need to allocate from the GPU and then 
import that into the V4L2 device. The background is that all dGPUs I 
know of need the data inside local memory (VRAM) to be able to scan out 
from it.

> I fully understand your point about APIs like Vulkan not sensibly
> allowing bracketing, and that's fine. On the other hand, a lot of
> extant usecases (camera/codec -> GPU/display, GPU -> codec, etc) on
> Arm just cannot fulfill complete coherency. On a lot of these
> platforms, despite what you might think about the CPU/GPU
> capabilities, the bottleneck is _always_ memory bandwidth, so
> mandating extra copies is an absolute non-starter, and would instantly
> cripple billions of devices. Lucas has been pretty gentle, but to be
> more clear, this is not an option and won't be for at least the next
> decade.

Well x86 pretty much has the same restrictions.

For example the scanout buffer is usually always in local memory because 
you often scan out at up to 120Hz while your recording is only 30fps and 
most of the time lower resolution.

Pumping all that data 120 time a second over the PCIe bus would just not 
be doable in a lot of use cases.

> So we obviously need a third way at this point, because 'all devices
> must always be coherent' vs. 'cache must be an unknown' can't work.
> How about this as a suggestion: we have some unused flags in the PRIME
> ioctls. Can we add a flag for 'import must be coherent'?

That's pretty much exactly what my patch set does. It just keeps 
userspace out of the way and says that creating the initial connection 
between the devices fails if they can't talk directly with each other.

Maybe we should move that into userspace so that the involved components 
know of hand that a certain approach won't work?

> That flag wouldn't be set for the existing ecosystem
> Lucas/Nicolas/myself are talking about, where we have explicit
> handover points and users are fully able to perform cache maintenance.
> For newer APIs where it's not possible to properly express that
> bracketing, they would always set that flag (unless we add an API
> carve-out where the client promises to do whatever is required to
> maintain that).
>
> Would that be viable?

No, as I said. Explicit handover points are just an absolutely no-go. We 
just have way to many use cases which don't work with that idea.

As I said we made the same mistake with the DMA-Api and even more 20 
years later are still running into problems because of that.

Just try to run any dGPU under a XEN hypervisor with memory 
fragmentation for a very good example why this is such a bad idea.

Regards,
Christian.

>
> Cheers,
> Daniel

