Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA6CE61199D
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 19:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbiJ1RuT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 13:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbiJ1RuR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 13:50:17 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591792E9EA
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 10:50:14 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id y10so3675811wma.0
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 10:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M0CVd1s/OtsmW1e6UD0yEVPg+6CWPruQMBLEjGPjgA8=;
        b=dZ//xXylcKTfP9m7DecajDs4Cng4ZXlkiLplvDc48RUYMBufjsbCguWe6wqkRv28fH
         anSaJ8yy4EeOeI07FZSlHUKgJYV1aPDWR0gLQePJzjNnFvrSpk3AUreYMrD71/CpJ61v
         cWrpeBQR2XAVgzwR+8XnBZkE2alaSQnD3RNELcSRuMXipOD5VsNkDC1+E8rsthVFI3xi
         UWJa/oDK4sPtmr0ZU/DEeyC8eAQrhWXAYUBb+D5/pXWQYnZF6/DY4vg9+/rBup1b/fjF
         YCHURv+NGUTTS3RneYERAHxyRPBSUzn1J7DIvtDufqZAftRGERz/7QhB+ciMU7UmMG6c
         ecIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M0CVd1s/OtsmW1e6UD0yEVPg+6CWPruQMBLEjGPjgA8=;
        b=HlHxlGed1jV0FxSPSnbXkgyWg/fjDdDXiA8QAenrJDA/kgLEC4k0SGuYvC0w23ZEdg
         Zxb8SDG5La5FxcuzxRaESg7VyeodKAgMb+Dhu0pfOlpnBTZerQ61svuf0jvshqyqgbEA
         5hvrrZGw7nosEMQfjBUHuxiOs3/JdioyMiXF/uvHRdPeI7RZg4LICGmQFpjUX0XPQB8L
         /ivbu03clDw0Dyi1dxfOLvwMEhRO/VfLyLZ4Kw3F67GsYE4OXJCbDbHYRP+uOSR97t5l
         HbXNiWlRMwwrnU4bFiGq/js+cK4PJALSoTfbAhatPofwe5voCXi0R7OjSngH5tqvEzVb
         nLhQ==
X-Gm-Message-State: ACrzQf23tTL2VPIAxrRVu+lOoTEx0+dX+gFC9+D7I0nGqxSqcmHrLF+N
        QeWDgkJpL01oZVyWdAt65xo=
X-Google-Smtp-Source: AMsMyM67I3tLMEtadyTmEU0a3QWcfGmJQGBxnorhqIoqIwLzIVXOaqJO1ObAlwru52SWo5P9vb/mfQ==
X-Received: by 2002:a05:600c:3789:b0:3c6:beed:fecf with SMTP id o9-20020a05600c378900b003c6beedfecfmr283591wmr.174.1666979412831;
        Fri, 28 Oct 2022 10:50:12 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:9377:d2f2:2ed:af4b? ([2a02:908:1256:79a0:9377:d2f2:2ed:af4b])
        by smtp.gmail.com with ESMTPSA id p38-20020a05600c1da600b003b497138093sm5159334wms.47.2022.10.28.10.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 10:50:12 -0700 (PDT)
Message-ID: <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
Date:   Fri, 28 Oct 2022 19:50:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Try to address the DMA-buf coherency problem
Content-Language: en-US
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
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
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
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

Hi Nicolas,

Am 28.10.22 um 17:46 schrieb Nicolas Dufresne:
> Hi,
>
> just dropping some real live use case, sorry I'm not really proposing solutions,
> I believe you are much more knowledgeable in this regard.

Well, I think each of us has a lot of specialized knowledge. For example 
I don't know to much about gralloc/minigbm. So this input is very valuable.

> Le vendredi 28 octobre 2022 à 16:26 +0200, Christian König a écrit :
>> Am 28.10.22 um 13:42 schrieb Lucas Stach:
>>> Am Freitag, dem 28.10.2022 um 10:40 +0200 schrieb Christian König:
>>>> But essentially the right thing to do. The only alternative I can see is
>>>> to reverse the role of exporter and importer.
>>>>
>>> I don't think that would work generally either, as buffer exporter and
>>> importer isn't always a 1:1 thing. As soon as any attached importer has
>>> a different coherency behavior than the others, things fall apart.
>> I've just mentioned it because somebody noted that when you reverse the
>> roles of exporter and importer with the V4L driver and i915 then the use
>> case suddenly starts working.
> Though, its not generically possible to reverse these roles. If you want to do
> so, you endup having to do like Android (gralloc) and ChromeOS (minigbm),
> because you will have to allocate DRM buffers that knows about importer specific
> requirements. See link [1] for what it looks like for RK3399, with Motion Vector
> size calculation copied from the kernel driver into a userspace lib (arguably
> that was available from V4L2 sizeimage, but this is technically difficult to
> communicate within the software layers). If you could let the decoder export
> (with proper cache management) the non-generic code would not be needed.

Yeah, but I can also reverse the argument:

Getting the parameters for V4L right so that we can share the image is 
tricky, but getting the parameters so that the stuff is actually 
directly displayable by GPUs is even trickier.

Essentially you need to look at both sides and interference to get to a 
common ground, e.g. alignment, pitch, width/height, padding, etc.....

Deciding from which side to allocate from is just one step in this 
process. For example most dGPUs can't display directly from system 
memory altogether, but it is possible to allocate the DMA-buf through 
the GPU driver and then write into device memory with P2P PCI transfers.

So as far as I can see switching importer and exporter roles and even 
having performant extra fallbacks should be a standard feature of userspace.

> Another case where reversing the role is difficult is for case where you need to
> multiplex the streams (let's use a camera to illustrate) and share that with
> multiple processes. In these uses case, the DRM importers are volatile, which
> one do you abuse to do allocation from ? In multimedia server like PipeWire, you
> are not really aware if the camera will be used by DRM or not, and if something
> "special" is needed in term of role inversion. It is relatively easy to deal
> with matching modifiers, but using downstream (display/gpu) as an exporter is
> always difficult (and require some level of abuse and guessing).

Oh, very good point! Yeah we do have use cases for this where an input 
buffer is both displayed as well as encoded.

>
>> Well, no. What I mean with coherency is that the devices don't need
>> insert special operation to access each others data.
>>
>> This can be archived by multiple approaches, e.g. by the PCI coherency
>> requirements, device internal connections (XGMI, NVLink, CXL etc...) as
>> well as using uncached system memory.
>>
>> The key point is what we certainly don't want is special operations
>> which say: Ok, now device A can access the data, now device B.....
>> because this breaks tons of use cases.
> I'm coming back again with the multiplexing case. We keep having mixed uses case
> with multiple receiver. In some case, data may endup on CPU while being encoded
> in HW. Current approach of disabling cache does work, but CPU algorithm truly
> suffer in performance. Doing a full memcpy to a cached buffer helps, but remains
> slower then if the cache had been snooped by the importer (encoder here) driver.

Yeah, that was another reason why we ended up rather having an extra 
copy than working with uncached buffers for display as well.

Regards,
Christian.
