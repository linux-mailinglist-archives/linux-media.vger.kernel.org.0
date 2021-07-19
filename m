Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45A023CD01B
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 11:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235890AbhGSI1t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 04:27:49 -0400
Received: from mail-lf1-f43.google.com ([209.85.167.43]:42751 "EHLO
        mail-lf1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235129AbhGSI1s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 04:27:48 -0400
Received: by mail-lf1-f43.google.com with SMTP id 8so28972763lfp.9;
        Mon, 19 Jul 2021 02:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=BSOq/6LU7myFeRU9sVPe/x6k8J7ibQSkaSa7AKjKFSw=;
        b=DjXoqORFiqtt4rE5ZyXDIb7/ln22JGSkGZaFHNCsrKxgS+jBCtKuODQNkTLOIEACqc
         KLj44NNYb1P7JhBYYk333PjdMs6+/6wjl3wDOUhYRRNvkDKcU1b4BMBDUXkrALp/yR3c
         eik4IoWYEHSBl3n48IG93J5JTgnKZkDE/rAVPc0uXwJsgyiJFeDlv9RAFS/lPFbBHUEx
         xX7EuCM3Id9LBQ/tNf0BohPT15mRhDjLCYQWjOeU2HwZbnLVVOtb1uF+nZJjmK1m7bz0
         kcQFHH6Tbo5xmxnZc+zVzIbZkEnV6N4K5ulew+NE+OpIoEbwR0fAmtMqASjkSZGJMF23
         uVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=BSOq/6LU7myFeRU9sVPe/x6k8J7ibQSkaSa7AKjKFSw=;
        b=nM959NlR4b6GwoCw+E/ezFzJyflPWfDnHy0Kd4lm7PNXb7IpjVKm+JUlXCLgX/FKGK
         h6bINAgRKjWIQgwL2o9NmC3+EVZYvtFByPQcm0StGb7IyBRvPFz1mSizCI1p+dj1sDv5
         +plJlQKW9PK7qBvLVfdKYCmsdYXJGlU5LxwavXx3P7HMDVpfz8PYMmy59CHLWqq1Mz01
         1Sdq4al/s3wjHktESlKZ1ut0aftN87dv4u1ZZoVMyHc1WmL8SKicDtbrexnbBXl8IA+5
         0ZTtg8dzatrTIKnBkf/8FzjdPxKI4IO2j5ry19+zm+zgQ/uK9IZ9QWMf24Y9JXgWA9Ex
         BqiA==
X-Gm-Message-State: AOAM5328IGkKgOIYOsbu21xSbELY+KpouChycXp8hb2uV1C/gwsjvyc7
        AbTRWQDZuOYOP7+NjQIoN2tdMnjJU/M=
X-Google-Smtp-Source: ABdhPJx78JN8b/ZveBWU79Ei+AvwV8ONa7QAzZR4sp6UFDoSwGfCbcKq6sN7s1mjTYYeyCHxC/dWoQ==
X-Received: by 2002:adf:c102:: with SMTP id r2mr27884871wre.22.1626684059448;
        Mon, 19 Jul 2021 01:40:59 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:e48d:68a9:5ef4:9e09? ([2a02:908:1252:fb60:e48d:68a9:5ef4:9e09])
        by smtp.gmail.com with ESMTPSA id e6sm22661717wrg.18.2021.07.19.01.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 01:40:59 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH 00/11] drm/msm: drm scheduler conversion
 and cleanups
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Emma Anholt <emma@anholt.net>, Bernard Zhao <bernard@vivo.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Zhenzhong Duan <zhenzhong.duan@gmail.com>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Dave Airlie <airlied@redhat.com>,
        Lee Jones <lee.jones@linaro.org>,
        freedreno@lists.freedesktop.org,
        Sharat Masetty <smasetty@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20210717202924.987514-1-robdclark@gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <582b8869-f370-3803-60a8-df31088f8088@gmail.com>
Date:   Mon, 19 Jul 2021 10:40:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717202924.987514-1-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 17.07.21 um 22:29 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> Conversion to gpu_scheduler, and bonus removal of
> drm_gem_object_put_locked()

Oh yes please!

If I'm not completely mistaken that was the last puzzle piece missing to 
unify TTMs and GEMs refcount of objects.

Only problem is that I only see patch 7 and 9 in my inbox. Where is the 
rest?

Thanks,
Christian.

>
> Rob Clark (11):
>    drm/msm: Docs and misc cleanup
>    drm/msm: Small submitqueue creation cleanup
>    drm/msm: drop drm_gem_object_put_locked()
>    drm: Drop drm_gem_object_put_locked()
>    drm/msm/submit: Simplify out-fence-fd handling
>    drm/msm: Consolidate submit bo state
>    drm/msm: Track "seqno" fences by idr
>    drm/msm: Return ERR_PTR() from submit_create()
>    drm/msm: Conversion to drm scheduler
>    drm/msm: Drop struct_mutex in submit path
>    drm/msm: Utilize gpu scheduler priorities
>
>   drivers/gpu/drm/drm_gem.c                   |  22 --
>   drivers/gpu/drm/msm/Kconfig                 |   1 +
>   drivers/gpu/drm/msm/adreno/a5xx_debugfs.c   |   4 +-
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |   6 +-
>   drivers/gpu/drm/msm/adreno/a5xx_power.c     |   2 +-
>   drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |   7 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  12 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |   2 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |   4 +-
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   6 +-
>   drivers/gpu/drm/msm/msm_drv.c               |  30 +-
>   drivers/gpu/drm/msm/msm_fence.c             |  39 ---
>   drivers/gpu/drm/msm/msm_fence.h             |   2 -
>   drivers/gpu/drm/msm/msm_gem.c               |  91 +-----
>   drivers/gpu/drm/msm/msm_gem.h               |  37 ++-
>   drivers/gpu/drm/msm/msm_gem_submit.c        | 300 ++++++++++++--------
>   drivers/gpu/drm/msm/msm_gpu.c               |  50 +---
>   drivers/gpu/drm/msm/msm_gpu.h               |  41 ++-
>   drivers/gpu/drm/msm/msm_ringbuffer.c        |  70 ++++-
>   drivers/gpu/drm/msm/msm_ringbuffer.h        |  12 +
>   drivers/gpu/drm/msm/msm_submitqueue.c       |  49 +++-
>   include/drm/drm_gem.h                       |   2 -
>   include/uapi/drm/msm_drm.h                  |  10 +-
>   23 files changed, 440 insertions(+), 359 deletions(-)
>

