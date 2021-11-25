Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22B0945D789
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 10:46:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349694AbhKYJuA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 04:50:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348803AbhKYJr7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 04:47:59 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 932D6C0613E1
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 01:44:29 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id r8so10234456wra.7
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 01:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=M4eNhtRyfszXgoCevZXctJE/hLAngb4kNGrAZca/vtQ=;
        b=hr7P+jqEo1S6urwHZfCCiWe591gBIwIqfjkJ9WWAo4LsbX2JWYICNZteJ2bwEpNfFk
         KGMkOnX6lZpF7lMAQWo17B7/5k1AGx48qJpn/jgqPCF4eClsFCaoU0dJDBB1GX12LdFp
         fkaPzCdUOyqJCQAop8HdN7pXrpRb1ZkqULRBplAsjnmdi6yPj6GShfbGGv26bSOZ5mj3
         4+ZUXqmYIJgUr8McgNrrtafhElJmiaHGgHeHor7r4lHHeOa5wq1Y8xMrRg4c3rJ2de+V
         AFlcXQ7KdIsOFfB8z3+hj7QxR3NuK7/epZZw15YOM24P/CBqinvAWd7mKF/WbeWzavpg
         ek5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=M4eNhtRyfszXgoCevZXctJE/hLAngb4kNGrAZca/vtQ=;
        b=hMtqcwE9wpSaMWOvyztUixBLDQx2R1ismEJt9K1cqFYK/yMrKZW8DocvhKRrjk+r59
         8wNPzeqZh3Uw1H9IRnw2Cyce42cC41S7Jo3egguiJcOnTYtV1LA9em6UCLVG7ygUTzy+
         Y+KuHBO34vJQn5XERWOM87qIPJCiBPEipJnVByyCwRmXJkUFK5hGgQ77skqkv5oNyTVR
         43tSKt783OoJlUXGhCR9bOFhROZGWRH3BEPN+KFO+cEAvbAaJW9husMYKbzcX4eIndWP
         oMAZh5OkAeJtMJ9cM3Lno+nxo/w38x6rA+P50aebhRVoM9X4nY1714FuzSMDinSRFt0M
         y+Sg==
X-Gm-Message-State: AOAM532hrnre8ce1Q6NWzNbvol1AYHhGMG6IRVGcUgKKnqrQvqaDUZco
        gJG2vd4eMJOJaUqgDevQAu1JnHh7Vek=
X-Google-Smtp-Source: ABdhPJwgehb/hMyMIn8NfuWZloUVEaV7WrJtRSt6A7q1DOrmUwW6oVfThdS27Z+K6FCs7SoPVSqGFQ==
X-Received: by 2002:a5d:6dc3:: with SMTP id d3mr4929492wrz.159.1637833468170;
        Thu, 25 Nov 2021 01:44:28 -0800 (PST)
Received: from [192.168.178.21] (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id az15sm2355074wmb.0.2021.11.25.01.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 01:44:27 -0800 (PST)
Subject: Re: [PATCH 1/6] dma-buf: move dma_resv_prune_unlocked into dma_resv.c
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        etnaviv@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211028132630.2330-1-christian.koenig@amd.com>
 <7729c40e-fe4e-853e-06d4-5e39dff17d32@linux.intel.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0d2f11ef-012e-f51a-80f3-3e8109fac060@gmail.com>
Date:   Thu, 25 Nov 2021 10:44:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7729c40e-fe4e-853e-06d4-5e39dff17d32@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 25.11.21 um 10:31 schrieb Maarten Lankhorst:
> [SNIP]
>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>> index eebf04325b34..e0558429a5ee 100644
>> --- a/include/linux/dma-resv.h
>> +++ b/include/linux/dma-resv.h
>> @@ -458,6 +458,7 @@ void dma_resv_fini(struct dma_resv *obj);
>>   int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
>>   void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
>>   void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
>> +void dma_resv_prune_unlocked(struct dma_resv *obj);
>>   int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
>>   			unsigned *pshared_count, struct dma_fence ***pshared);
>>   int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
> I don't mind adding a dma_resv_prune for locked case, but I don't think unlocked would have benefits.
>
> Furthermore, I'm trying to remove the unlocked versions from i915. Could this be a prereq patch instead?
>
> https://patchwork.freedesktop.org/patch/460722/?series=96115&rev=1

Yeah, that works for me as well.

I was on the edge of dropping that from TTM as well since this is really 
just abusing the interface to save a few bytes of memory.

Feel free to add an Acked-by: Christian König <christian.koenig@amd.com> 
to the i915 patch if it helps to get that committed.

Regards,
Christian.

>
> ~Maarten
>
> ~Maarten
>

