Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1C9E3CD70A
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 16:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241159AbhGSOEn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 10:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232531AbhGSOEn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 10:04:43 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F14BC061767;
        Mon, 19 Jul 2021 07:13:03 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id m2so22404830wrq.2;
        Mon, 19 Jul 2021 07:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ykw/8dUHmnvkhINGvE8DPlnGL5xj3qE/zc/xyCib+XM=;
        b=SCi09qBfRsa6nQj+k++1X6MUBUMhFCCmGupgMlA1pY0h500TA//+5zd+4FQTiwtTXs
         yegWW0fbNaq3YrunNd5aWz0mYz2wlru6TK1+Xw1l+AsvXrkPt4xkNPFajNDjiUlEdVH6
         WfX0i4sVcP7BxDlNDf1n4PdljrV9XQsWhmTsWqotyR+pVnfq8poduGgIwOw2F/T5+Xwt
         B4J3aaqm/sIrkFLVksQ/ORJJMq/VdUNbVwAfN6AHJDDv7nyYiL2WbT013CM3T9/QWOqj
         9vPL2u5rPdxnev/vWHdd3I53p1HW8G7BETkiC/mBxUI561XqRXnFtwxTWbw5DasagA6s
         dKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ykw/8dUHmnvkhINGvE8DPlnGL5xj3qE/zc/xyCib+XM=;
        b=LaZqmfgLKX6EAseUYt2lCK6i+Itadlr56WkjWjdRVy95xENZQ2H2odffdJojM16y0P
         wK9E/VEgWiMeF5GX3A0GhNauU9Tci8kwabzCjHbVWhDwnMvopBiqKZYV6dumGbirObrc
         uMz8YuxdVCww/M40Hz5MXrkBsJw9vHahKoH+5BmiwY5z1x2CqfpdsRTrL4fZlhzK0Uek
         5ofdzr1CzQYqSJP+bxwOsWZNIE6avCA6L3kt7PdgCIUKhe88YTV8Q5qPaKwJW3lFDRmc
         lLWd/G6ATX1luHDagxb5qFVYS4ke3ukQehzpuw0bD7lk0sVCLXAPoXQsNXu7oYXem2te
         DKPg==
X-Gm-Message-State: AOAM531T0T4T0H8h7BevknyaaW9EZDVGnKcXNXEXSspcsqQXMnNwEr7b
        y1aunLNCH+8c39IQ3wMoCSu1j1E7jB4=
X-Google-Smtp-Source: ABdhPJw4VG+Asie5OmOLbz/r9ip58LFhR1Ew5dwhf0A4LT62rXD/aYyyFlGCmR2Y8mPS3dfxIwk2mw==
X-Received: by 2002:a5d:598f:: with SMTP id n15mr12127271wri.133.1626705919576;
        Mon, 19 Jul 2021 07:45:19 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:d448:2444:fe38:1227? ([2a02:908:1252:fb60:d448:2444:fe38:1227])
        by smtp.gmail.com with ESMTPSA id o14sm19795559wmq.31.2021.07.19.07.45.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 07:45:19 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH 00/11] drm/msm: drm scheduler conversion
 and cleanups
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
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
        freedreno <freedreno@lists.freedesktop.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20210717202924.987514-1-robdclark@gmail.com>
 <582b8869-f370-3803-60a8-df31088f8088@gmail.com>
 <CAF6AEGuaxh5FRb6h3aVkUYG7cFCpT6Lb+uuk2R8bmu3hxHs4Aw@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6dc4ad02-2f75-7907-59d8-66fd30c490ca@gmail.com>
Date:   Mon, 19 Jul 2021 16:45:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGuaxh5FRb6h3aVkUYG7cFCpT6Lb+uuk2R8bmu3hxHs4Aw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 19.07.21 um 16:21 schrieb Rob Clark:
> On Mon, Jul 19, 2021 at 1:40 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 17.07.21 um 22:29 schrieb Rob Clark:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Conversion to gpu_scheduler, and bonus removal of
>>> drm_gem_object_put_locked()
>> Oh yes please!
>>
>> If I'm not completely mistaken that was the last puzzle piece missing to
>> unify TTMs and GEMs refcount of objects.
>>
>> Only problem is that I only see patch 7 and 9 in my inbox. Where is the
>> rest?
> Hmm, looks like it should have all gotten to dri-devel:
>
>    https://lists.freedesktop.org/archives/dri-devel/2021-July/315573.html

Well I've got two mail accounts (AMD, GMail) and neither of them sees 
the full set. So most likely not a problem on my side.

Anyway the whole set is Acked-by: Christian König 
<christian.koenig@amd.com>.

Regards,
Christian.

>
> or if you prefer patchwork:
>
>    https://patchwork.freedesktop.org/series/92680/
>
> BR,
> -R
>
>> Thanks,
>> Christian.
>>
>>> Rob Clark (11):
>>>     drm/msm: Docs and misc cleanup
>>>     drm/msm: Small submitqueue creation cleanup
>>>     drm/msm: drop drm_gem_object_put_locked()
>>>     drm: Drop drm_gem_object_put_locked()
>>>     drm/msm/submit: Simplify out-fence-fd handling
>>>     drm/msm: Consolidate submit bo state
>>>     drm/msm: Track "seqno" fences by idr
>>>     drm/msm: Return ERR_PTR() from submit_create()
>>>     drm/msm: Conversion to drm scheduler
>>>     drm/msm: Drop struct_mutex in submit path
>>>     drm/msm: Utilize gpu scheduler priorities
>>>
>>>    drivers/gpu/drm/drm_gem.c                   |  22 --
>>>    drivers/gpu/drm/msm/Kconfig                 |   1 +
>>>    drivers/gpu/drm/msm/adreno/a5xx_debugfs.c   |   4 +-
>>>    drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |   6 +-
>>>    drivers/gpu/drm/msm/adreno/a5xx_power.c     |   2 +-
>>>    drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |   7 +-
>>>    drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  12 +-
>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |   2 +-
>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |   4 +-
>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   6 +-
>>>    drivers/gpu/drm/msm/msm_drv.c               |  30 +-
>>>    drivers/gpu/drm/msm/msm_fence.c             |  39 ---
>>>    drivers/gpu/drm/msm/msm_fence.h             |   2 -
>>>    drivers/gpu/drm/msm/msm_gem.c               |  91 +-----
>>>    drivers/gpu/drm/msm/msm_gem.h               |  37 ++-
>>>    drivers/gpu/drm/msm/msm_gem_submit.c        | 300 ++++++++++++--------
>>>    drivers/gpu/drm/msm/msm_gpu.c               |  50 +---
>>>    drivers/gpu/drm/msm/msm_gpu.h               |  41 ++-
>>>    drivers/gpu/drm/msm/msm_ringbuffer.c        |  70 ++++-
>>>    drivers/gpu/drm/msm/msm_ringbuffer.h        |  12 +
>>>    drivers/gpu/drm/msm/msm_submitqueue.c       |  49 +++-
>>>    include/drm/drm_gem.h                       |   2 -
>>>    include/uapi/drm/msm_drm.h                  |  10 +-
>>>    23 files changed, 440 insertions(+), 359 deletions(-)
>>>

