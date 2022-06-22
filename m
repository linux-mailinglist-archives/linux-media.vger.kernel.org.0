Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 380B8554617
	for <lists+linux-media@lfdr.de>; Wed, 22 Jun 2022 14:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355762AbiFVJFa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jun 2022 05:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232756AbiFVJF1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jun 2022 05:05:27 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E7BD201A8;
        Wed, 22 Jun 2022 02:05:26 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id o10so22942962edi.1;
        Wed, 22 Jun 2022 02:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tDbYyeBEwGX8YAg3QUDWRyeGWxjD+ob964twAa4kWvc=;
        b=T6Q7g41xrVHPb5/EXilFpXnlYnOVv3yYpEH50JccewrUSviM3mUvqSgrfQec6jzuqT
         QmQdgEHQoQtM3w3cRWuR8gHZuyMVz1xG9IQ1DZXBbpE3NnJfGw6KQRe+9ykOFhRswK6M
         WbtxG+U8RSROCzFeDazB2Mk4clWtOONEjq9ibBGxWUlMd+cuhKKXMSyCX2OITLa1ijML
         PQMi7TwwJUSH+y8kAkMuSEplLoNrc9nGSJv5FvEGair385YnjpNarug0s1vlujT1imSJ
         Ei83AzV++scBxJeAngyCdhPMSARVu7b2t58ECG5jso144HxibALj490wuFwQkU+XwL7T
         AbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tDbYyeBEwGX8YAg3QUDWRyeGWxjD+ob964twAa4kWvc=;
        b=c4mndvZkzIKrT82EzGwcL3AVJxEM6kdvL05Mvytd+t9RDjekZxJokKUD9p37GjcZeM
         H94rxalaIAM4iOFQ3lrbn7peSnKD+KxUZK+aVT7k3FXReOg6u/eTnPsc/UFjzjbJXeo2
         2I6pPXwmI4t51QYfLjKpt2Sz9kZe7JekMF8cSs48OYI/ZBXTeZKSYfF9EHry48A8+3hK
         7z2L2qJZJLjQSVC9w8NTjGkaEUEm8Zm5VSDRwsQXj6zsZHzb/8igrBC9mt+z6AvW8znu
         saA3esQ2J5QIqHPzgzE5A5enDyjwx+VLrE/a0c9ELXMFrpG+tbNDTl687lahK3cV8ZAz
         m7Gw==
X-Gm-Message-State: AJIora/CjpmZij0fZJNKvEPqow3FM+L8xo03DJJ9hMU8jWdaNPCEUFLK
        zyzKuJa1IcQjjKvYB8v9n7M=
X-Google-Smtp-Source: AGRyM1sGjrBd+ZyLKbv9JrMmQVEw2WQSCnULGkU8C+b5nzWE2vH4+sK2Wwrmw/CVvFKBmg3vAZpouA==
X-Received: by 2002:a05:6402:350f:b0:42f:68f9:ae5 with SMTP id b15-20020a056402350f00b0042f68f90ae5mr2954373edd.36.1655888725078;
        Wed, 22 Jun 2022 02:05:25 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:8f77:c83:6a3d:ee86? ([2a02:908:1256:79a0:8f77:c83:6a3d:ee86])
        by smtp.gmail.com with ESMTPSA id c19-20020aa7c753000000b004357063bf60sm9952412eds.41.2022.06.22.02.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 02:05:24 -0700 (PDT)
Message-ID: <82500226-3ac5-c62c-ac5b-363ee184dbbc@gmail.com>
Date:   Wed, 22 Jun 2022 11:05:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Linaro-mm-sig] Re: DMA-buf and uncached system memory
Content-Language: en-US
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "Andy.Hsieh" <andy.hsieh@mediatek.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org, lkml <linux-kernel@vger.kernel.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Sharma, Shashank" <Shashank.Sharma@amd.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <cdb508e49eb1439f4e4c327d2a6738f219e04bf8.camel@ndufresne.ca>
 <5822b325-766e-ce3c-50eb-d7f54f14fd0b@mediatek.com>
 <39f7f41a-af8d-4700-37da-9401455afb98@amd.com>
 <2aabc41c8432d09b7ceeb8e67144a639d3d86c72.camel@ndufresne.ca>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <2aabc41c8432d09b7ceeb8e67144a639d3d86c72.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 21.06.22 um 17:42 schrieb Nicolas Dufresne:
> Hi Christian and Andy,
>
> Le mardi 21 juin 2022 à 12:34 +0200, Christian König a écrit :
>>   Hi Andy,
>>   
>>   Am 21.06.22 um 12:17 schrieb Andy.Hsieh:
>>   
>>> On 2/16/21 4:39 AM, Nicolas Dufresne wrote:
>>>> Le lundi 15 février 2021 à 09:58 +0100, Christian König a écrit :
>>>>> Hi guys,
>>>>>
>>>>> we are currently working an Freesync and direct scan out from system
>>>>> memory on AMD APUs in A+A laptops.
>>>>>
>>>>> On problem we stumbled over is that our display hardware needs to scan
>>>>> out from uncached system memory and we currently don't have a way to
>>>>> communicate that through DMA-buf.
>>>>>
>>>>> For our specific use case at hand we are going to implement something
>>>>> driver specific, but the question is should we have something more
>>>>> generic for this?
>>>> Hopefully I'm getting this right, but this makes me think of a long
>>>> standing
>>>> issue I've met with Intel DRM and UVC driver. If I let the UVC driver
>>>> allocate
>>>> the buffer, and import the resulting DMABuf (cacheable memory written with
>>>> a cpu
>>>> copy in the kernel) into DRM, we can see cache artifact being displayed.
>>>> While
>>>> if I use the DRM driver memory (dumb buffer in that case) it's clean
>>>> because
>>>> there is a driver specific solution to that.
>>>>
>>>> There is no obvious way for userspace application to know what's is
>>>> right/wrong
>>>> way and in fact it feels like the kernel could solve this somehow without
>>>> having
>>>> to inform userspace (perhaps).
>>>>
>>>>> After all the system memory access pattern is a PCIe extension and as
>>>>> such something generic.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>
>>> Hi All,
>>>
>>> We also encountered the UVC cache issue on ARMv8 CPU in Mediatek SoC when
>>> using UVC dmabuf-export and feeding the dmabuf to the DRM display by the
>>> following GStreamer command:
>>>
>>> # gst-launch-1.0 v4l2src device=/dev/video0 io-mode=dmabuf ! kmssink
>>>
>>> UVC driver uses videobuf2-vmalloc to allocate buffers and is able to export
>>> them as dmabuf. But UVC uses memcpy() to fill the frame buffer by CPU
>>> without
>>> flushing the cache. So if the display hardware directly uses the buffer, the
>>> image shown on the screen will be dirty.
>>>
>>> Here are some experiments:
>>>
>>> 1. By doing some memory operations (e.g. devmem) when streaming the UVC,
>>>     the issue is mitigated. I guess the cache is swapped rapidly.
>>> 2. By replacing the memcpy() with memcpy_flushcache() in the UVC driver,
>>>     the issue disappears.
>>> 3. By adding .finish callback in videobuf2-vmalloc.c to flush the cache
>>>     before returning the buffer, the issue disappears.
>>>
>>> It seems to lack a cache flush stage in either UVC or Display. We may also
>>> need communication between the producer and consumer. Then, they can decide
>>> who is responsible for the flushing to avoid flushing cache unconditionally
>>> leading to the performance impact.
>>   
>>   Well, that's not what this mail thread was all about.
>>   
>>   The issue you are facing is that somebody is forgetting to flush caches, but
>> the issue discussed in this thread here is that we have hardware which
>> bypasses caches altogether.
>>   
>>   As far as I can see in your case UVC just allocates normal cached system
>> memory through videobuf2-vmalloc() and it is perfectly valid to fill that
>> using memcpy().
>>   
>>   If some hardware then accesses those buffers bypassing CPU caches then it is
>> the responsibility of the importing driver and/or DMA subsystem to flush the
>> caches accordingly.
> I've tracked this down to videobuf2-vmalloc.c failing to look for coherency
> during "attach()". It is also missing begin_/end access implementation for the
> case it get attached to a non-coherent device. Seems fixable though, but "I'm
> far from an expert", but more some random person reading code and comments.

Well that is perfectly expected behavior, videobuf2-vmalloc return 
normal cached system memory.

So it doesn't care for the coherency of the buffer.

What should happen instead is that the display device needs to make sure 
that it can coherently access the data and that's not the case here.

Regards,
Christian.

>
> regards,
> Nicolas
>
>>   
>>   Regards,
>>   Christian.
>>   
>>   
>>> Regards,
>>> Andy Hsieh
>>>
>>> ************* MEDIATEK Confidentiality Notice ********************
>>> The information contained in this e-mail message (including any
>>> attachments) may be confidential, proprietary, privileged, or otherwise
>>> exempt from disclosure under applicable laws. It is intended to be
>>> conveyed only to the designated recipient(s). Any use, dissemination,
>>> distribution, printing, retaining or copying of this e-mail (including its
>>> attachments) by unintended recipient(s) is strictly prohibited and may
>>> be unlawful. If you are not an intended recipient of this e-mail, or believe
>>> that you have received this e-mail in error, please notify the sender
>>> immediately (by replying to this e-mail), delete any and all copies of
>>> this e-mail (including any attachments) from your system, and do not
>>> disclose the content of this e-mail to any other person. Thank you!
>>   
>>   
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

