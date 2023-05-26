Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C594D7129E2
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 17:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244182AbjEZPqI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 11:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244070AbjEZPqD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 11:46:03 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C603D1B6
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 08:45:50 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id ffacd0b85a97d-30a8dc89c33so577751f8f.0
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 08:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685115949; x=1687707949;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OX879Xbtaq85/UPwb2f8tq7maPJyO+QLeOiqV5vIfjA=;
        b=wcwdcdzgtFryBiRdWxpCymHOki7j+wUintN3/adfIJ575HFiGwWvvLiGL3NjuxwRQ3
         gnUjpSgJCSKNn+8anAU5m8DeoSjJYKZLGPLMI87dIP859SN/KobgtxhHNXERf3MpE9K5
         wJZUC7GW/spdUYxb446kFGqU4Uox1guSsugZJ1mL4Sxg+LrCdgMTx4Y4akJ/Mt/7RFwi
         B5nFj66Up8V+9vb6gRJa0CQVT00R3zPujsuOvvvrh439gLa0zVGQpFB4Xigr6dOrgHbQ
         bI0KYS1ghZCHj0a5KknxdXkNKb6dYjp57m9fazVfgxJPBaDmVRu6NgMEzB6jnFMUzpvT
         dqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685115949; x=1687707949;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OX879Xbtaq85/UPwb2f8tq7maPJyO+QLeOiqV5vIfjA=;
        b=QtLIkJn021M+5ewfirt9LL82P70XI6QjD7GC3Tu529eangl9ViPE58VFl6I4oRwadY
         lKDm4oIMQtp4YlaUIUZAzJUTQHwWUFMmaBZxXRCdyK7d6E8JhIy98W3f6LeZVO7avGGA
         2a7LfxG49Nld2UjFs4P47mJwxx2QQOTVkWgIAECi6DPkD3TKPZdN9PGFvdWEy4O8RvkG
         iS7IP2MraRZvzzgfYYDhnhML7yi+wnh2vN/l7QnBkr5ppBEsKqmYzxlSDXoNySqp6UlM
         AQLEebFGSnDGnnduKEGkf/1ep76Vm2I7dEs/4tQE7YSuVjzXHlWgtNHyMcWYXEdgPRSl
         UVqw==
X-Gm-Message-State: AC+VfDyQSTVwT/M+TyVDl+MSi1ruG2g5j9uip9CH08tZpqU+ojn3Zb8K
        o3GPl/LvH6mZ9zge3Gm8fEmnNB992fT+QElPCBA3wUevvrg=
X-Google-Smtp-Source: ACHHUZ5UA+yXPBx7fP3hSIrT+zIrLky1zEBpDc0IHgjMDGgcI9UwC6u1LCxdVBVyifx+CDLiyp1GIA==
X-Received: by 2002:a5d:6ac4:0:b0:309:e24:57b0 with SMTP id u4-20020a5d6ac4000000b003090e2457b0mr2066240wrw.30.1685115949116;
        Fri, 26 May 2023 08:45:49 -0700 (PDT)
Received: from [10.1.4.6] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id c11-20020adfe74b000000b0030630120e56sm2580734wrn.57.2023.05.26.08.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 08:45:48 -0700 (PDT)
Message-ID: <01591ec1-7c87-514c-047b-bec1c45ddfa5@baylibre.com>
Date:   Fri, 26 May 2023 17:45:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/7] Add a DRM driver to support AI Processing Unit (APU)
Content-Language: en-US
To:     Oded Gabbay <ogabbay@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, devicetree@vger.kernel.org,
        conor+dt@kernel.org, bero@baylibre.com, jstephan@baylibre.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
        robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
        nbelin@baylibre.com, krzysztof.kozlowski+dt@linaro.org,
        matthias.bgg@gmail.com, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org, linux-arm-kernel@lists.infradead.org,
        angelogioacchino.delregno@collabora.com
References: <20230517145237.295461-1-abailon@baylibre.com>
 <d0807fe4-dba2-8244-f655-d04e80973572@quicinc.com>
 <7ha5xud3m7.fsf@baylibre.com>
 <CAFCwf10hNjGtEYDi24LREnMLRGT7mRECvqQMdZWv=-uA7YELYg@mail.gmail.com>
 <ZG3pmSnUSc9oCtev@phenom.ffwll.local>
From:   Alexandre Bailon <abailon@baylibre.com>
In-Reply-To: <ZG3pmSnUSc9oCtev@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/24/23 12:40, Daniel Vetter wrote:
> On Wed, May 24, 2023 at 01:27:00PM +0300, Oded Gabbay wrote:
>> On Wed, May 24, 2023 at 2:34 AM Kevin Hilman <khilman@baylibre.com> wrote:
>>>
>>> Jeffrey Hugo <quic_jhugo@quicinc.com> writes:
>>>
>>>> On 5/17/2023 8:52 AM, Alexandre Bailon wrote:
>>>>> This adds a DRM driver that implements communication between the CPU and an
>>>>> APU. The driver target embedded device that usually run inference using some
>>>>> prebuilt models. The goal is to provide common infrastructure that could be
>>>>> re-used to support many accelerators. Both kernel, userspace and firmware tries
>>>>> to use standard and existing to leverage the development and maintenance effort.
>>>>> The series implements two platform drivers, one for simulation and another one for
>>>>> the mt8183 (compatible with mt8365).
>>>>
>>>> This looks like the 3 existing Accel drivers.  Why is this in DRM?
>>>
>>> Yes, this belongs in accel.  I think Alex had some issues around the
>>> infra in accel with device nodes not appearing/opening properly, but
>>> I'll let him comment there.  But either way, the right approach should
>>> be to fix any issues in accel and move it there.
>>>
>>> [...]
>>>
>>>>>    .../devicetree/bindings/gpu/mtk,apu-drm.yaml  |  38 ++
>>>>>    drivers/gpu/drm/Kconfig                       |   2 +
>>>>>    drivers/gpu/drm/Makefile                      |   1 +
>>>>>    drivers/gpu/drm/apu/Kconfig                   |  22 +
>>>>>    drivers/gpu/drm/apu/Makefile                  |  10 +
>>>>>    drivers/gpu/drm/apu/apu_drv.c                 | 282 +++++++++
>>>>>    drivers/gpu/drm/apu/apu_gem.c                 | 230 +++++++
>>>>>    drivers/gpu/drm/apu/apu_internal.h            | 205 ++++++
>>>>>    drivers/gpu/drm/apu/apu_sched.c               | 592 ++++++++++++++++++
>>>>>    drivers/gpu/drm/apu/simu_apu.c                | 313 +++++++++
>>>>>    include/uapi/drm/apu_drm.h                    |  81 +++
>>>>
>>>> "apu" seems too generic.  We already have 3 "AI processing units" over
>>>> in drivers/accel already...
>>>
>>> Indeed, it is generic, but that's kind of the point for this driver
>>> since it's targetted at generalizing the interface with "AI processing
>>> units" on a growing number of embedded SoCs (ARM, RISC-V, etc.)  In
>>> addition, the generic naming is intentional because the goal is bigger
>>> than the kernel and is working towards a generic, shared "libAPU"
>>> userspace[1], but also common firmware for DSP-style inference engines
>>> (e.g. analgous Sound Open Firmware for audio DSPs.)
>>>
>>> As usual, the various SoC vendors use different names (APU, NPU, NN
>>> unit, etc.)  but we'd like a generic name for the class of devices
>>> targetted by this driver.  And unfortunately, it looks like the equally
>>> generic "Versatile processing unit" is already taken Intel's
>>> drivers/accel/ivpu. :)
>>>
>>> Maybe since this is more about generalizing the interface between the
>>> CPU running linux and the APU, what about the name apu_if?  But I guess
>>> that applies to the other 3 drivers in drivers/accell also.  Hmmm...
>>>
>>> Naming things is hard[2], so we're definitly open to other ideas.  Any
>>> suggestions?
>> Maybe model it according to the tiny driver in drm display ? You can
>> then call it tiny_apu :-)
>> Disclosure: It was Daniel's suggestion, he can chime in with more
>> details on the tiny driver concept.
> 
> Yeah so maybe a bit more detail on my thoughts:
> 
> First this smells like a need bypass of the entire "we want open userspace
> for accel drivers" rule. The rule isn't quite a strict as for drm gpu
> drivers (not sure we ended up documenting exactly what, but iirc the
> consensus was that for build-time only dependencies we're ok with
> downstream compilers), but it's still there.
What is letting you think that we want to bypass open source requirements ?
Although the neural network firmware and userspace application are not yet
opensource, our intention is to develop a full open source stack.
Currently, we only support Mediatek APU (an Xtensa VP6) and we have to 
use closed source sotfware to execute inferences on the accelerator.
As far I know, there software stack similar to mesa where we could add
support of a new accelerator (this is also true for firmware).
That is actually what we would like to do. But this will take a lot of 
time and we consider this driver as a first (small) step.
> 
> And at least from a quick look apu.ko and libapu just look like a generic
> accel interface, and that's not enough.
> 
> For the big training engines it's more or less "enough to run pytorch, but
> it can be really slow", not sure what the right standard for these
> inference-only drivers should be.
To be honest, I don't know what would be required for training engines.
We only target accelerators for embedded device that usually only run 
inferences. In my opinion, this is 2 different use cases and I don't 
think we could address them in the same way.
> 
> So that's the first reason why I don't like this.
> 
> The other is that I think if we do end up with a pile of tiny accel
> drivers, we should probably look into something like simmpledrm for the
> tiny display drivers. Probably still IP specific ioctls (at least most) so
> that IP specific job knows and all that are easy, but then just pass to a
> framework that simplifies a drm gem driver to "write ptes" and "run job"
> callback, maybe with an optional "create/destroy vm/ctx" for hw which can
> do that.
> 
> So maybe we end up with a drivers/accel/tiny and a bunch more helpers
> around the existing gem ones. The rule we have for drm/tiny is "1 file,
> less than 1kloc", and there's a bunch of them. I do think we can achieve
> the same for tiny accel inference engines (but it's still a bit a road).
> Maybe tiny accel is more like "less than 5kloc" since you need a bit more
> glue for the driver specific ioctl stuff - maybe that's only needed for
> the submit ioctl, maybe also for buffer map/unmap and creation.
This makes sense to me.
> 
> Also note that there's an entire pile of in-flight work for adding new
> helpers to the gem world to make this all easier. Once we have gpuva and
> exec helpers there not much glue left to tie it all together with the
> scheduler.
I wrote this series a long time ago and just rebased it recently.
I will take some time to see the in-flight work and see if that 
something I could start using.
> 
> But the real crux is that an accel inference driver really needs to have
> enough userspace to do an actual inference job with some
> android/cros/whatever framework for inference (there's just too many).
We are currently stuck with closed source fimrware, userspace 
applications and toolchains (works with android and linux).
We are looking for a solution but implementing something will take some 
time.

Alexandre
> -Daniel
> 
>> Oded
>>
>>>
>>> Kevin
>>>
>>> [1] https://gitlab.baylibre.com/baylibre/libapu/libapu
>>>
>>> [2]
>>> "There are 2 hard problems in computer science: cache invalidation,
>>>   naming things and off-by-1 errors."
>>>   -- https://twitter.com/secretGeek/status/7269997868
>>>
> 
