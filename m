Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 145043DCEC2
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 04:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231896AbhHBCrm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Aug 2021 22:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbhHBCrk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Aug 2021 22:47:40 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BCC1C06175F;
        Sun,  1 Aug 2021 19:47:31 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id u16so9499493ple.2;
        Sun, 01 Aug 2021 19:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=XGbL8VwPWjiS4yy4Pnm/5ti4pl6SnxB74geqfXf2DB8=;
        b=LT7iIak5S9eMVKEPZD7f0f9GaeTpf9fgxki9F73OG5+doNYssSWZ0f3lw9FdaLyodW
         H+VftdRCAibeNawcMs/+wyMV07jxOnbL2d85GMVLWLny7/IBriAfc+cOb+mHA6nW71Sx
         +5e9Xv+cfGX0tEiE7nHyJMElLi5Km8LSwGXHcZwBfY9cpcGfgAR2+q2AjdJQ1aNq95mA
         ewqlpUaBT5mu9mYGHzlsh+9ZPR9mbnKe/5Nn193sVNPYJMVvCowTFjQMzJcfWdZF/BM9
         ebe+OlZy1qPrEgPHdxuZBs0OXp5M+PrN3KdfC165JaM+goeJQfUbsVmboOQDq396IF8R
         8SPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=XGbL8VwPWjiS4yy4Pnm/5ti4pl6SnxB74geqfXf2DB8=;
        b=TXwiFGK+YyKKO0U1DeuAgDPrB9bWGyDr+dPnvN8PcKMI1tGtOySLbb/YW6dk8IgMzf
         Bbtaegf2xGLNSIeW2QLF5uZaEJxYSGxrZ6yfMF2ojVuecz5TXBUxrWo0cVDn2dZmcLTF
         q28b42rRRLRx1kaabWpwmgMDZOHZoDnZuZbsMPGiOA4L6nvgEzr10QgapKvZGuxApen4
         8OI/gWYHOkJdQr+aLJ1puao9+++1JosH3fwMTu6brqE1MQ+/nN1L4bU9kfY7RQnnoPVJ
         igVkB8guRG3y+aA2THRASBu3iqoswxxFb61ysr0d8txb2ErJVn+nVM6/3s89YW7wi84E
         lmFA==
X-Gm-Message-State: AOAM531XJp2AzXwBL3a5QhLPUAAXLSEO8y8Q5mtViayCcfITtF7RqHGd
        vuo/1KkB/TwhJZxG1f0qt94=
X-Google-Smtp-Source: ABdhPJxgLjle+X21msmkhScpohfSjneeqWivm7M3aHQYJvRXfoBdbPMfQOdSLJPQMzM3M/tZB5hKow==
X-Received: by 2002:a17:903:20c1:b029:12c:4a37:5cbb with SMTP id i1-20020a17090320c1b029012c4a375cbbmr12001050plb.57.1627872450825;
        Sun, 01 Aug 2021 19:47:30 -0700 (PDT)
Received: from [10.106.0.86] ([45.135.186.29])
        by smtp.gmail.com with ESMTPSA id l14sm9517229pfd.58.2021.08.01.19.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Aug 2021 19:47:30 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: fix possible null-pointer dereference in
 amdgpu_ttm_tt_populate()
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, airlied@linux.ie,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Xinhui.Pan@amd.com, baijiaju1990@gmail.com,
        alexander.deucher@amd.com, Philip.Yang@amd.com,
        TOTE Robot <oslab@tsinghua.edu.cn>, sumit.semwal@linaro.org,
        daniel@ffwll.ch, Felix.Kuehling@amd.com, airlied@redhat.com,
        Oak.Zeng@amd.com, nirmoy.das@amd.com, tzimmermann@suse.de
References: <20210731080437.74539-1-islituo@gmail.com>
 <53ef6ff7-f793-5de4-4ab4-0efbfbfc0a54@amd.com>
From:   Li Tuo <islituo@gmail.com>
Message-ID: <fc060208-89b5-51aa-c956-adf7c42d6b79@gmail.com>
Date:   Mon, 2 Aug 2021 10:47:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <53ef6ff7-f793-5de4-4ab4-0efbfbfc0a54@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for your feedback! We will remove the null tests according to 
your advice and prepare a V2 patch.

Best wishes,
Tuo Li

On 2021/8/2 1:19, Christian König wrote:
> Am 31.07.21 um 10:04 schrieb Tuo Li:
>> The variable ttm is assigned to the variable gtt, and the variable gtt
>> is checked in:
>>    if (gtt && gtt->userptr)
>>
>> This indicates that both ttm and gtt can be NULL.
>> If so, a null-pointer dereference will occur:
>>    if (ttm->page_flags & TTM_PAGE_FLAG_SG)
>>
>> Also, some null-pointer dereferences will occur in the function
>> ttm_pool_alloc() which is called in:
>>    return ttm_pool_alloc(&adev->mman.bdev.pool, ttm, ctx);
>>
>> To fix these possible null-pointer dereferences, the function returns
>> -EINVAL when ttm is NULL.
>
> NAK, the NULL test is just a leftover from when the objects where 
> distinct.
>
> Please remove the NULL test instead.
>
> Regards,
> Christian.
>
>>
>> Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
>> Signed-off-by: Tuo Li <islituo@gmail.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 3a55f08e00e1..80440f799c09 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -1120,8 +1120,11 @@ static int amdgpu_ttm_tt_populate(struct 
>> ttm_device *bdev,
>>       struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
>>       struct amdgpu_ttm_tt *gtt = (void *)ttm;
>>   +    if (ttm == NULL)
>> +        return -EINVAL;
>> +
>>       /* user pages are bound by amdgpu_ttm_tt_pin_userptr() */
>> -    if (gtt && gtt->userptr) {
>> +    if (gtt->userptr) {
>>           ttm->sg = kzalloc(sizeof(struct sg_table), GFP_KERNEL);
>>           if (!ttm->sg)
>>               return -ENOMEM;
>

