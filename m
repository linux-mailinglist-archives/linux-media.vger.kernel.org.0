Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7E754E9286
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 12:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240262AbiC1KaV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 06:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240257AbiC1KaU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 06:30:20 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65510522FD
        for <linux-media@vger.kernel.org>; Mon, 28 Mar 2022 03:28:35 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id g20so16338846edw.6
        for <linux-media@vger.kernel.org>; Mon, 28 Mar 2022 03:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2fnW0hKm3/LoNJLASktWawEV8gjSA8FRX1R6A2wJmoc=;
        b=AcbakU3oL6MVbrDUIllFrtKNdjGA58pmZ+0+Y+aRmRPr7qGEMAwr3+CnifI3kPcwMD
         lVFQZkUGL+hNuNfowrtyQIQl7V2AJnr/FM1UAVCnU9xaCKIF41NfF4XCcDcy4xrxREyn
         QVU0rtwTkF6CpqGBj0+urYVS9BGbbPStvFDgLXnF4sqTMC4aA0LVzXVbo732l9MoUuvP
         YW0tFpvCKngyCg6/Sv0k+Q9Z6GuvSGE3O9jxlX9n37FnL1oEI3tBJFmP9ylrn4cblPAt
         b/aA1KdvPicLOs8/a8bIF0SDH7pREkps3Hg/58ZLwwlfUzISlMrMCCtmbfGK16hIEaza
         58cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2fnW0hKm3/LoNJLASktWawEV8gjSA8FRX1R6A2wJmoc=;
        b=MQkOX4bYHUJYhTm0WjGyo7n24TY9XzY/9fc99MoxqYvLAToN1TjxV+brrvGFna73dn
         r8I+xOyBzTseXDFJ1bGugXmWuPVmdhD+0L4fSz32hyFfek8XRIOkvvk48gHNcypRY0Ze
         n8ZB7ZAzTA1jACpzYhAll9XRspVrlwBPft6bbpQD0E0YbG4U0LpFLil4LSbQ8xyVRxID
         G9IbLjQfpgL/Qv42v1zaZCVt0ACZKkwY0Be9j65+47NJXvfACs4UpVnYxYiAtVYvRzCZ
         lz/LRA1nbBB2AEuS4ah5tUcKGMFUwl72JHpNDHpVrfzjRtjl8DbgJzblNTaP8OlNZf9g
         upww==
X-Gm-Message-State: AOAM531/DJpJ6FZUKCyjbojqmDqyea24Ky1wm4yqoHnwIV4ZTygaLYK4
        KOgAb13P+2IBOd1fp/+Biwk=
X-Google-Smtp-Source: ABdhPJwCTNosh9GI+S3j5GevCu9iAaWtBDkxqy67gDMWi3yh/+yzOHoB574Ou1NqeC8q0+4VIzZU1w==
X-Received: by 2002:a05:6402:3689:b0:419:d380:ddbc with SMTP id ej9-20020a056402368900b00419d380ddbcmr8454741edb.230.1648463313648;
        Mon, 28 Mar 2022 03:28:33 -0700 (PDT)
Received: from ?IPV6:2a02:908:1252:fb60:4276:c469:b15d:9dea? ([2a02:908:1252:fb60:4276:c469:b15d:9dea])
        by smtp.gmail.com with ESMTPSA id u4-20020a170906780400b006ce69ff6050sm5729145ejm.69.2022.03.28.03.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Mar 2022 03:28:32 -0700 (PDT)
Message-ID: <338d0623-1161-c958-101f-dc7d8ef12f99@gmail.com>
Date:   Mon, 28 Mar 2022 12:28:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dma-buf: add dma_fence_unwrap
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     sumit.semwal@linaro.org, gustavo@padovan.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, Dave Airlie <airlied@gmail.com>
References: <20220311110244.1245-1-christian.koenig@amd.com>
 <Yj3e0QjbnPoG7n4I@intel.com> <35cc3bd5-c0ab-0bd1-9603-4971234fbcd6@amd.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <35cc3bd5-c0ab-0bd1-9603-4971234fbcd6@amd.com>
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

Hi Ville & Daniel,

Am 25.03.22 um 16:28 schrieb Christian König:
> Am 25.03.22 um 16:25 schrieb Ville Syrjälä:
>> On Fri, Mar 11, 2022 at 12:02:43PM +0100, Christian König wrote:
>>> Add a general purpose helper to deep dive into 
>>> dma_fence_chain/dma_fence_array
>>> structures and iterate over all the fences in them.
>>>
>>> This is useful when we need to flatten out all fences in those 
>>> structures.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> One of the dma-buf patches took down Intel CI. Looks like every
>> machine oopses in some sync_file thing now:
>> <1>[  260.470008] BUG: kernel NULL pointer dereference, address: 
>> 0000000000000010
>> <1>[  260.470020] #PF: supervisor read access in kernel mode
>> <1>[  260.470025] #PF: error_code(0x0000) - not-present page
>> <6>[  260.470030] PGD 0 P4D 0
>> <4>[  260.470035] Oops: 0000 [#1] PREEMPT SMP NOPTI
>> <4>[  260.470040] CPU: 0 PID: 5306 Comm: core_hotunplug Not tainted 
>> 5.17.0-CI-CI_DRM_11405+ #1
>> <4>[  260.470049] Hardware name: Intel Corporation Jasper Lake Client 
>> Platform/Jasperlake DDR4 SODIMM RVP, BIOS 
>> JSLSFWI1.R00.2385.D02.2010160831 10/16/2020
>> <4>[  260.470058] RIP: 0010:dma_fence_array_first+0x19/0x20

I've looked into this and the root cause seems to be that the new code 
doesn't handle dma_fence_arrays with zero elements.

That is rather easy to fix, but a dma_fence_array with zero number of 
elements is most likely a bug because under the wrong circumstances it 
can create a dma_fence instance which will never signal.

I've send out a patch on Frinday ([PATCH] dma-buf: WIP 
dma_fence_array_first fix) which avoids the crash and prints a warning 
if anybody tries to create a dma_fence_array with zero length.

Can you test this?

Thanks in advance,
Christian.
