Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEA764C7BE
	for <lists+linux-media@lfdr.de>; Wed, 14 Dec 2022 12:09:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238217AbiLNLJu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 06:09:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237778AbiLNLJs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 06:09:48 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 231D724091
        for <linux-media@vger.kernel.org>; Wed, 14 Dec 2022 03:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671016141;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mRg78ZkhOQVpDZ+QaAFV8935UrX4bn0uxcF9aGCrixQ=;
        b=XWq7iqz5ruTwt1TZE233znnhPYjaLYIiKzeqdkPrr9qwSLXVeaYqqnWGZGxjvcOo0lklV/
        d61XKkP1SwCs02DkyGoU2yJ+RIB59zy4+4Iw+EEjgmAdjxdUBblpm/SkgblDiO1yh91TWd
        +cN+R/f3Od3TrvItLO4ctMI3Q/pUQfQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-A0kklTsTNTOMXHrK28f2MQ-1; Wed, 14 Dec 2022 06:08:40 -0500
X-MC-Unique: A0kklTsTNTOMXHrK28f2MQ-1
Received: by mail-wm1-f72.google.com with SMTP id t24-20020a1c7718000000b003d1fd0b866fso4037435wmi.3
        for <linux-media@vger.kernel.org>; Wed, 14 Dec 2022 03:08:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRg78ZkhOQVpDZ+QaAFV8935UrX4bn0uxcF9aGCrixQ=;
        b=04SwT42RpEzOntWYW+iXEVKjxYr4AltmVkLdc+OO6Slp26ppp07IRb/MeA3COxg60W
         X7Az/KERHFE9vu4IMD+rHT15LTzpMIc4soq51UuXSmQjsl51H9TrgVvVIuatlunM1cdJ
         xpk/UH5BF2LeEkrAZJnRWDmPU82+gJNWA9f9hQ4OvamJ/w/TUUO/cVBhI5a3hWrnBKPc
         jXHeNkzl0KL1DUuZLpV/sBLAy5lpZ8Z9yd4uSYmUxOdNpfBqveyjf9kUKDEe1kj+qvZD
         jGyJvvIBJA5whoOSHPSyBB85hGg3NNZCAlr2+NzDZWife6vPmsdaRgnAj2D6iLf/SehX
         UYew==
X-Gm-Message-State: ANoB5plZeQpY34JFYUIO2KgLZfs7qi/Bib+BtVNoG4tG3KK/LuAfJ42I
        RLcADhtrUlquwoRJXpooZgiO1zhwTDUdpcnA5uUDTVYoHBgE3jwvmv+h7JanJckKfXCst+UdQ69
        CPBfHYclwgAY2XfzKCfor7v4=
X-Received: by 2002:a5d:5c07:0:b0:242:3cb6:36b8 with SMTP id cc7-20020a5d5c07000000b002423cb636b8mr16926032wrb.44.1671016119849;
        Wed, 14 Dec 2022 03:08:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7YaluWfcNEp1VN5Y2E817u3e6PoWeueB6XHpyPeLl4uSHVpqKkrOM9cLd6B29BFrCorjwjTQ==
X-Received: by 2002:a5d:5c07:0:b0:242:3cb6:36b8 with SMTP id cc7-20020a5d5c07000000b002423cb636b8mr16926016wrb.44.1671016119585;
        Wed, 14 Dec 2022 03:08:39 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:7700:dd7c:92f8:481f:b96b? (p200300cbc7037700dd7c92f8481fb96b.dip0.t-ipconnect.de. [2003:cb:c703:7700:dd7c:92f8:481f:b96b])
        by smtp.gmail.com with ESMTPSA id z13-20020a5d44cd000000b0023c8026841csm2586564wrr.23.2022.12.14.03.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 03:08:39 -0800 (PST)
Message-ID: <ccc02e28-638f-2429-42ec-94d48e3f6756@redhat.com>
Date:   Wed, 14 Dec 2022 12:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: Dubious usage of VM_SHARED in atomisp_fops.c
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "linux-mm@kvack.org" <linux-mm@kvack.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <fbefc16e-84d3-8afc-8c8e-4229bded0c8a@redhat.com>
 <cbc45885-3224-6c61-7058-9b6e99029695@redhat.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <cbc45885-3224-6c61-7058-9b6e99029695@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14.12.22 12:07, Hans de Goede wrote:
> Hi David,
> 
> On 12/14/22 11:22, David Hildenbrand wrote:
>> Hi,
>>
>> going over all VM_SHARED and VM_MAYSHARE user in the kernel, I stumbled over the following dubious code in drivers/staging/media/atomisp/pci/atomisp_fops.c:
>>
>>
>> if (!(vma->vm_flags & (VM_WRITE | VM_READ)))
>>      return -EACCES;
>>
>> ...
>>
>> if (!(vma->vm_flags & VM_SHARED)) {
>>      /* Map private buffer.
>>       * Set VM_SHARED to the flags since we need
>>       * to map the buffer page by page.
>>       * Without VM_SHARED, remap_pfn_range() treats
>>       * this kind of mapping as invalid.
>>       */
>>      vma->vm_flags |= VM_SHARED;
>>      ret = hmm_mmap(vma, vma->vm_pgoff << PAGE_SHIFT);
>>      ...
>> }
>>
>>
>> We're converting a writable MAP_PRIVATE mapping ("COW mapping") into a writable MAP_SHARED mapping, to hack around the is_cow_mapping() check in remap_pfn_range_notrack().
>>
>> We're not even setting VM_MAYSHARE and turn the mapping silently into something with completely different semantics.
>>
>>
>> That code has to go.
>>
>>
>> One approach would be to reject such mappings (no idea if user space relies on private mappings), the other one would be to remove this driver. Judging that the driver already was marked broken in 2020 (ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")), maybe it's time for the driver to go.
> 
> There is still quite a lot of hw out there (and being used
> with Linux) which has camera sensors connected to the atomisp2.
> 
> Recently a community member finally managed to actually make
> the driver work and I have been working on cleaning it up since.
> 
> For 6.2 I set of patches converting the driver to the videobuf2
> framework will land and as part of that all the problematic code
> you point to above has been removed.
> 
> If you grep for VM_SHARED under drivers/staging/media/atomisp
> in linux-next you will find no hits :)

Hurray, thanks Hans :)

-- 
Thanks,

David / dhildenb

