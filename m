Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB41B4A99D2
	for <lists+linux-media@lfdr.de>; Fri,  4 Feb 2022 14:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349751AbiBDNUK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Feb 2022 08:20:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237118AbiBDNUK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Feb 2022 08:20:10 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E80B4C061714
        for <linux-media@vger.kernel.org>; Fri,  4 Feb 2022 05:20:09 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id l35-20020a05600c1d2300b0034d477271c1so3766560wms.3
        for <linux-media@vger.kernel.org>; Fri, 04 Feb 2022 05:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=cMoVa5I0AfvRr6dsMtZbMvRygV9sYtL69pEQOhNDKTI=;
        b=awD0Owg0KNW+Cod8yDI1CD7zljIwsN4H40IbHxTSPCHJv65Q4zezki+bGupgZ5w86t
         5IQjEEqn+0fF6/x40oIGmlAESfdLuuKuRaED+ILsTP5kqKh30RkCfsZ577jfoqpv4uG6
         XAlNUyQrFW0HEZRJ/a7I+MEXhXwSgTmAaLVDxAuQDBL/qbj09KUFodt7zBrFLNNZc4oF
         j5Iukl+WP7fPkcRbIUUkMS2+MtFkm2yr9PKTN0GKln6pnWwniSNcij/+91V24t1qs7bm
         Te4fL1rxfPPIa8wSFLNPOwiYU9gcDCRjvynRZMNRR2UkdV84wJvXEg3UJxZb9B+Gh6CR
         hZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cMoVa5I0AfvRr6dsMtZbMvRygV9sYtL69pEQOhNDKTI=;
        b=Jw5y7E4ybtaadSJmfNhc5GbQnAQxLvA71SGjtkFCgY5O45xcP9bbWCtmUa7sJrmWu8
         d4mJFO6rWGppjlN7WGHvwe7GnZor+k4E5Y+owA+Urpun5Hq2QS3wH0PLBfeyow82TdZC
         VnzJQrqHjGNKkUNc/LEsOCFjxiBOtI1AQimlJ9S7ESjXYkPUiV1dzzp6MVJ8zoVnKD2P
         mFfyfeUV/2rl3STpxllPcO3KgB3AseVEfzpLpWXfnZpWk9kO3zd5QB9ecr9C8Cj1H0Zr
         1/xhk48hcfm/7dQSkiDV7k+yQisj3Yq64xl6/slTbTk+Amj2YGckR7c/CDR4WLc8r51y
         nPTg==
X-Gm-Message-State: AOAM531Js52WRk0Dg/Gh4NLJ2e9w/NUy0JbmqIVU4slGiWpZL3rnXg+K
        ZSeLD89PtDbLFED7qXwZb4g=
X-Google-Smtp-Source: ABdhPJylKlWmIm0oi+FM5lpPgODm89FwixxBRrQzrYPTm1UwC2fmO97sjXdJ06kRVIodlYYxQI7BdQ==
X-Received: by 2002:a05:600c:1e84:: with SMTP id be4mr2180842wmb.147.1643980808469;
        Fri, 04 Feb 2022 05:20:08 -0800 (PST)
Received: from ?IPV6:2a02:908:1252:fb60:7e37:f7a5:7cd9:7eb0? ([2a02:908:1252:fb60:7e37:f7a5:7cd9:7eb0])
        by smtp.gmail.com with ESMTPSA id f16sm1785283wmg.28.2022.02.04.05.20.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 05:20:07 -0800 (PST)
Message-ID: <ddae0316-8576-f5c1-b6be-792625be37e2@gmail.com>
Date:   Fri, 4 Feb 2022 14:20:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Add warning for nesting dma_fence containers
Content-Language: en-US
To:     =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= 
        <thomas.hellstrom@linux.intel.com>, sumit.semwal@linaro.org,
        daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20220204100429.2049-1-christian.koenig@amd.com>
 <c722ceda1ffed0d9065f0d6ed63faa5d3f2e7a9a.camel@linux.intel.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <c722ceda1ffed0d9065f0d6ed63faa5d3f2e7a9a.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 04.02.22 um 11:40 schrieb Thomas Hellström:
> On Fri, 2022-02-04 at 11:04 +0100, Christian König wrote:
>> Hi everyone,
>>
>> Since some operations can then lead to recursive handling nesting
>> dma_fence containers into each other is only allowed under some
>> restrictions.
>>
>> dma_fence_array containers can be attached to dma_fence_chain
>> containers and dma_fence_chain containers by chaining them together.
>>
>> In all other cases the individual fences should be extracted with
>> the appropriate iterators and added to the new containers
>> individually.
>>
>> I've separated the i915 cleanup from this change since it is
>> generally a different functionality and the build bots complained
>> about some issues with those patches.
>>
>> Most patches are already reviewd, but especially the first one still
>> needs an rb tag.
>>
>> Please review and comment,
> I see you dropped the i915 patch (probably due to lack of reviews?),
> Got distracted with other things, but I'll see if I can resurrect that
> and get it reviewed and merged.

I was about to send out the i915 patch when that one here is merged.

The CI systems yielded some strange error with that one and I wanted to 
double check what's that all about.

Regards,
Christian.

>
> Thanks,
> Thomas
>
>
>> Christian.
>>
>>
>

