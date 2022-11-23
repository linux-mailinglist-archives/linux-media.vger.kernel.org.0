Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 824D2635770
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 10:43:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237959AbiKWJmK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 04:42:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238077AbiKWJlq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 04:41:46 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25DCF112C4E
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 01:39:23 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id i12so24643150wrb.0
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 01:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xtVY1fbYdCt5+6Wym639LRdXvZTAy2Wrn/gBgTtUC1o=;
        b=Ls8T6MScaXn4Cn7Q/vatDeXNlHgSqc26eVKPUNNcDvvhMePHusIYmHdGO/7fZ2ObRo
         yLSUJGQNXAjohoIgwesn/52CuIZ7H/EDmr+GpA95hMunFb8U1BLXPWTB1gIyMKkmuavq
         dcJXlu8GLSQpiaEhU3DKY6huWuTscC9vfona8k0P+rm3aChiuNYiSnpr30UcU6y+o20j
         ODHfmRQyHKdvPXcaV7/8ny1gZFf7Dol1BVaIPut56Z6Lumdw1ljxikYsabjJ7n3aw8ds
         JilFsues5QlIVaMJrWKEOVQEOvYmgxILRqsDyridWAntTDBVcg0hiOeDmfNZk6PydBEh
         +QdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xtVY1fbYdCt5+6Wym639LRdXvZTAy2Wrn/gBgTtUC1o=;
        b=VEGYazbIsQuKGXd7uhRW2KltOsBVZlfP0bGquKZsnVM+C48UiNx/LYG04+g6ApV6eu
         q9fZ+I6jIFF8BEhEvyf8bthiXLG6cVJiscFa9Cp8S5rqRWRLQ68t8I9QAeoq2st5U6DX
         JTdq3Cqa6hmqiXX90BU31hZuYn4qCJJsts9ujzB/QzTh9QUiEAffKHJ3d9hICPjvEkDn
         OvNCJauUcHMtEmrCpRhP3qkhq3OCDCPH8ocs2Mp1mUIncjsZqoIGdelH1j0No4rmdLRu
         i4FFHkF4ginZ40+4PSAQlmC8IMpFBmu3aTQFUttsqmYYgmTtm6MEPaKyu3ENsDKwMaLA
         MWzw==
X-Gm-Message-State: ANoB5pnJT4+hirkiQNZXp+wB03/C2jybWA7E7eUp0TDMI+x3mZ8ezJ+Y
        +6+cC5vLvGSAO12faBXHSW4=
X-Google-Smtp-Source: AA0mqf6TI52S2u9Y1mEfqPCpDFRdjST76rMGbBL3i3Bfd7bd3UxqqWaqDoi3bHSMEkKgSKu6V5k0lg==
X-Received: by 2002:a05:6000:1e1d:b0:241:c75c:6831 with SMTP id bj29-20020a0560001e1d00b00241c75c6831mr12526680wrb.16.1669196361566;
        Wed, 23 Nov 2022 01:39:21 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:d2d7:ceea:efc2:af43? ([2a02:908:1256:79a0:d2d7:ceea:efc2:af43])
        by smtp.gmail.com with ESMTPSA id o42-20020a05600c512a00b003a3442f1229sm1735280wms.29.2022.11.23.01.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 01:39:20 -0800 (PST)
Message-ID: <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com>
Date:   Wed, 23 Nov 2022 10:39:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Require VM_PFNMAP vma for
 mmap
Content-Language: en-US
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20221122170801.842766-1-daniel.vetter@ffwll.ch>
 <Y30PDdsvHIJo5YHR@ziepe.ca>
 <CAKMK7uEccwYTNwDYQazmZvTfBFQOikZt5A6BmegweyO-inKYbQ@mail.gmail.com>
 <Y30Z4VxT7Wdoc1Lc@ziepe.ca>
 <CAKMK7uE=8eqyh9BKg_+7B1jjMi6K4wrmPyi9xeLVvVYFxBgF9g@mail.gmail.com>
 <Y30kK6dsssSLJVgp@ziepe.ca>
 <CAKMK7uFQQkG82PzuSTGQTnN3ZNps5N_4TjR5NRWo0LaJkEaNew@mail.gmail.com>
 <3d8607b4-973d-945d-c184-260157ade7c3@amd.com>
 <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
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

Am 23.11.22 um 10:30 schrieb Daniel Vetter:
> On Wed, 23 Nov 2022 at 10:06, Christian König <christian.koenig@amd.com> wrote:
>> Am 22.11.22 um 20:50 schrieb Daniel Vetter:
>>> On Tue, 22 Nov 2022 at 20:34, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>>>> On Tue, Nov 22, 2022 at 08:29:05PM +0100, Daniel Vetter wrote:
>>>>> You nuke all the ptes. Drivers that move have slightly more than a
>>>>> bare struct file, they also have a struct address_space so that
>>>>> invalidate_mapping_range() works.
>>>> Okay, this is one of the ways that this can be made to work correctly,
>>>> as long as you never allow GUP/GUP_fast to succeed on the PTEs. (this
>>>> was the DAX mistake)
>>> Hence this patch, to enforce that no dma-buf exporter gets this wrong.
>>> Which some did, and then blamed bug reporters for the resulting splats
>>> :-) One of the things we've reverted was the ttm huge pte support,
>>> since that doesn't have the pmd_special flag (yet) and so would let
>>> gup_fast through.
>> The problem is not only gup, a lot of people seem to assume that when
>> you are able to grab a reference to a page that the ptes pointing to
>> that page can't change any more. And that's obviously incorrect.
>>
>> I witnessed tons of discussions about that already. Some customers even
>> modified our code assuming that and then wondered why the heck they ran
>> into data corruption.
>>
>> It's gotten so bad that I've even proposed intentionally mangling the
>> page reference count on TTM allocated pages:
>> https://patchwork.kernel.org/project/dri-devel/patch/20220927143529.135689-1-christian.koenig@amd.com/
> Yeah maybe something like this could be applied after we land this
> patch here.

I think both should land ASAP. We don't have any other way than to 
clearly point out incorrect approaches if we want to prevent the 
resulting data corruption.

> Well maybe should have the same check in gem mmap code to
> make sure no driver

Reads like the sentence is somehow cut of?

>
>> I think it would be better that instead of having special flags in the
>> ptes and vmas that you can't follow them to a page structure we would
>> add something to the page indicating that you can't grab a reference to
>> it. But this might break some use cases as well.
> Afaik the problem with that is that there's no free page bits left for
> these debug checks. Plus the pte+vma flags are the flags to make this
> clear already.

Maybe a GFP flag to set the page reference count to zero or something 
like this?

Christian.

> -Daniel

