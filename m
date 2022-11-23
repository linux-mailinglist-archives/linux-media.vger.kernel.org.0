Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD0B635FA9
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 14:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238046AbiKWNbe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 08:31:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236550AbiKWNbB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 08:31:01 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE8FBC0
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 05:12:28 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id m22so42612895eji.10
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 05:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bvs98D7kn/blwT63+h55cu2gonMJ65ywZrI5Z5R+q8s=;
        b=CbKrP7EDuQM1+snQr1Bb3MbhbQ1msQARnAhP8lLIaw8jsoWgtUxr2YZuSk/BGmdbmJ
         CHML6hqeeAqT5QapkEJBOq5hHCB/AFN2yNlNe0UTVNNzfzV9/OUQvXEwNyHqnNUkvY1T
         XUteu4rleCYD+KdeDTBkycgH+nx6bdv7x5woMj/jfEdULmuRFG1kYORmlhBvWNHyjq/x
         H7opk6T9ej6goLupldeCS1Ai/LJlUZUOxPUAiwU0bK3GQ4OL9oZmnaLbFfWEJQr0UdrJ
         8M3M4FzvBqbSzpKZSgEd1wobGpuhu0JxJgOdz4rmFVlq1zq8VKc+WvA4aSOCyLsvSPc7
         tlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bvs98D7kn/blwT63+h55cu2gonMJ65ywZrI5Z5R+q8s=;
        b=pVmkNvH5S0xNfeDMoi0F0/3rJrllA10wEg322wUtkpoBOC2nRPCg72fLhZuYEvXfqU
         aUjfN3maKcputciwnPtk2ZTQY8QMNj/4zTSQr8Hl4kp/SWSRbnWt+mRq+1/ZbZ4G5EHb
         nGS22qlN+y9np3VpOrcsaNor91HvqncLwTikxCZcsu7m7VjkEfMP7bzYh7eu6A6eW52v
         lq1kGBYG161jOD57n843tTSdGyrkIP5Nx9a/FRSFaB2UkhN0cTsJVn0o8+KRy5zC+d3R
         PJdNHJ0DBgf9g+SjSj/Bb4XKkPW6f19ZUhFCFXjVgWR4rOSRm60mbbACIRm9AIxhRa1L
         Y0Ug==
X-Gm-Message-State: ANoB5plQH97NDffDpaTk8+0/v4uTTlomOms2idPvZQbqmjfEMcm92HQI
        XZxgUZre0N3cYJGbzrIOSnw=
X-Google-Smtp-Source: AA0mqf5Nj1HAYv/xJhMhjUhsdKhcctZzH8JOkFU/AOEqdt3oRJ5z0AWvGNokuhO7wHbBhMGKlisOWQ==
X-Received: by 2002:a17:906:1ecf:b0:7ad:902c:d1d6 with SMTP id m15-20020a1709061ecf00b007ad902cd1d6mr12072437ejj.143.1669209147048;
        Wed, 23 Nov 2022 05:12:27 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:d2d7:ceea:efc2:af43? ([2a02:908:1256:79a0:d2d7:ceea:efc2:af43])
        by smtp.gmail.com with ESMTPSA id mh23-20020a170906eb9700b007af105a87cbsm7152028ejb.152.2022.11.23.05.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 05:12:26 -0800 (PST)
Message-ID: <dc2a9d7f-192b-e9d8-b1d1-3b868cb1fd44@gmail.com>
Date:   Wed, 23 Nov 2022 14:12:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Require VM_PFNMAP vma for
 mmap
Content-Language: en-US
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <Y30Z4VxT7Wdoc1Lc@ziepe.ca>
 <CAKMK7uE=8eqyh9BKg_+7B1jjMi6K4wrmPyi9xeLVvVYFxBgF9g@mail.gmail.com>
 <Y30kK6dsssSLJVgp@ziepe.ca>
 <CAKMK7uFQQkG82PzuSTGQTnN3ZNps5N_4TjR5NRWo0LaJkEaNew@mail.gmail.com>
 <3d8607b4-973d-945d-c184-260157ade7c3@amd.com>
 <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
 <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com>
 <CAKMK7uFjmzewqv3r4hL9hvLADwV536n2n6xbAWaUvmAcStr5KQ@mail.gmail.com>
 <Y34WI9SZdiH/p1tA@ziepe.ca> <f8f844a5-0910-d19a-5aea-df7a1d83b1d3@gmail.com>
 <Y34XvmtHfb4ZwopN@ziepe.ca>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <Y34XvmtHfb4ZwopN@ziepe.ca>
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

Am 23.11.22 um 13:53 schrieb Jason Gunthorpe:
> On Wed, Nov 23, 2022 at 01:49:41PM +0100, Christian König wrote:
>> Am 23.11.22 um 13:46 schrieb Jason Gunthorpe:
>>> On Wed, Nov 23, 2022 at 11:06:55AM +0100, Daniel Vetter wrote:
>>>
>>>>> Maybe a GFP flag to set the page reference count to zero or something
>>>>> like this?
>>>> Hm yeah that might work. I'm not sure what it will all break though?
>>>> And we'd need to make sure that underflowing the page refcount dies in
>>>> a backtrace.
>>> Mucking with the refcount like this to protect against crazy out of
>>> tree drives seems horrible..
>> Well not only out of tree drivers. The intree KVM got that horrible
>> wrong as well, those where the latest guys complaining about it.
> kvm was taking refs on special PTEs? That seems really unlikely?

Well then look at this code here:

commit add6a0cd1c5ba51b201e1361b05a5df817083618
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Tue Jun 7 17:51:18 2016 +0200

     KVM: MMU: try to fix up page faults before giving up

     The vGPU folks would like to trap the first access to a BAR by setting
     vm_ops on the VMAs produced by mmap-ing a VFIO device.  The fault 
handler
     then can use remap_pfn_range to place some non-reserved pages in 
the VMA.

     This kind of VM_PFNMAP mapping is not handled by KVM, but follow_pfn
     and fixup_user_fault together help supporting it.  The patch also 
supports
     VM_MIXEDMAP vmas where the pfns are not reserved and thus subject to
     reference counting.

     Cc: Xiao Guangrong <guangrong.xiao@linux.intel.com>
     Cc: Andrea Arcangeli <aarcange@redhat.com>
     Cc: Radim Krčmář <rkrcmar@redhat.com>
     Tested-by: Neo Jia <cjia@nvidia.com>
     Reported-by: Kirti Wankhede <kwankhede@nvidia.com>
     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

And see also the discussion here: 
https://patchwork.freedesktop.org/patch/414123/

as well as here: https://patchwork.freedesktop.org/patch/499190/

I can't count how often I have pointed out that this is absolutely 
illegal and KVM can't touch pages in VMAs with VM_PFNMAP.

>>> The WARN_ON(pag_count(p) != 1) seems like a reasonable thing to do
>>> though, though you must combine this with the special PTE flag..
>> That's not sufficient. The pages are released much later than things
>> actually go wrong. In most cases this WARN_ON here won't hit.
> How so? As long as the page is mapped into the PTE there is no issue
> with corruption. If dmabuf checks the refcount after it does the unmap
> mapping range it should catch any bogus pin that might be confused
> about address coherency.

Yeah, that would work. The problem is this WARN_ON() comes much later.

The device drivers usually keep the page around for a while even after 
it is unmapped. IIRC the cleanup worker only runs every 10ms or so.

Christian.

>
> Jason

