Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5083D8CBF
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 13:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234517AbhG1L3G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 07:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232786AbhG1L3F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 07:29:05 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63CD2C061757
        for <linux-media@vger.kernel.org>; Wed, 28 Jul 2021 04:29:03 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id e2so2080658wrq.6
        for <linux-media@vger.kernel.org>; Wed, 28 Jul 2021 04:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=VI1b/7Zio0QbTHVDmC7OIx9Iv7sUZ3kXOO83Nnb1/lI=;
        b=MOA/VOEXpidjw9AYaF3IXPbM6aik0n/2pDu3qGV734GI/MKZej41DpACQshSitpBHp
         LQ3YHoaO3xcBZzpcsNjShILGXUpmKS5ZgVAmgwqvbopYjCV6Oe7kqDCKvQGMz1GhH8FV
         iSxZcRNrR7p1TZ5rVO3i3rez8Tf1bgPKxGIL7d8oWchGGL320KpKfOsAda6x+TjTz5O4
         4bCPnPYjchzaaC50jNDk1qaP8p8alaDlxruTYCJqyH5+MzTNO6GiD6mTiiIIejBu2nm4
         +Vr4pubkhVWp5DZvj/DSgx8P3RUgT6oeNuzxq4zWxIwzW6zjdND1aBxfxo7GqdOlIOLr
         7nyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=VI1b/7Zio0QbTHVDmC7OIx9Iv7sUZ3kXOO83Nnb1/lI=;
        b=AFi8GBGRWZYXFACTxfv7vBAq7VfMX2P2822DW/atOZ9ip1VWmgjohCleOtUFxMDZw0
         /0g94Y5qccI+2xafr8gqHTlnYJaUO/mCi4pOsZwfyRFSaruq4DcFgzyAzxQFfmNkvhvo
         19cB/DZOTW4cxbOZ22dSTA/UPuKL7V7ldAs9B7Wd7xTU5ORdALFdEEegFWu4NOohjTMu
         qU4263rhWu3yN3+pWzyDRXHwn82hbufIZPonwSD7W2UTpBj462gJN2FQ22ZlyaqGPMa0
         dNcLMai1mmWB2D4typD0usQVrfE+SVxd4nCqXonNRvFV3y+loTKF0a5OFWg1XE88ojH5
         jtXA==
X-Gm-Message-State: AOAM532LAwFuBU3I1+xGEw06S9lknp5kiG2cZXzhamyUxSZAh66lakRq
        U+Gnge2eAGK0kpMqoQTElic=
X-Google-Smtp-Source: ABdhPJwO3jBbz+R3AJiHF0WQfeY+oF3uwMVgNB4ghF4GPoF75Jaw2yWir3ze6NE+b9AvVpMjJ+cXcg==
X-Received: by 2002:a5d:61c8:: with SMTP id q8mr18198915wrv.151.1627471741909;
        Wed, 28 Jul 2021 04:29:01 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:6a5d:b580:2891:cbac? ([2a02:908:1252:fb60:6a5d:b580:2891:cbac])
        by smtp.gmail.com with ESMTPSA id l2sm4888332wru.67.2021.07.28.04.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 04:29:01 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH v4 03/18] drm/sched: Add dependency
 tracking
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Melissa Wen <melissa.srw@gmail.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Lucas Stach <l.stach@pengutronix.de>
Cc:     Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Jack Zhang <Jack.Zhang1@amd.com>,
        David Airlie <airlied@linux.ie>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Steven Price <steven.price@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Nirmoy Das <nirmoy.aiemd@gmail.com>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-4-daniel.vetter@ffwll.ch>
 <CAKMK7uG8bMuDP=7-z9nZ38WgMdbeUk96eNx3buTCiaKatYOJxw@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2bcfba05-b7d5-1bd9-d74a-b9aac1147e20@gmail.com>
Date:   Wed, 28 Jul 2021 13:28:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uG8bMuDP=7-z9nZ38WgMdbeUk96eNx3buTCiaKatYOJxw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 27.07.21 um 13:09 schrieb Daniel Vetter:
> Adding a few more people to this bikeshed.
>
> On Mon, Jul 12, 2021 at 10:02 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
>> @@ -349,6 +367,13 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>                         struct drm_sched_entity *entity,
>>                         void *owner);
>>   void drm_sched_job_arm(struct drm_sched_job *job);
>> +int drm_sched_job_await_fence(struct drm_sched_job *job,
>> +                             struct dma_fence *fence);
>> +int drm_sched_job_await_implicit(struct drm_sched_job *job,
>> +                                struct drm_gem_object *obj,
>> +                                bool write);
>> +
>> +
> I'm still waiting on the paint delivery for these two functions so I
> can finish this shed.

Well I wouldn't call that bike shedding, good names are important.

Just imaging we would have called the exclusive-fence write-fence instead.

What speaks against calling them add_dependency() and 
_add_implicit_depencencies() ?

Regards,
Christian.

>
> Thanks, Daniel
>
>>   void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>                                      struct drm_gpu_scheduler **sched_list,
>>                                      unsigned int num_sched_list);
>> --
>> 2.32.0
>>
>

