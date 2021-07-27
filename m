Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 200BA3D7408
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 13:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236212AbhG0LJj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 07:09:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235837AbhG0LJj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 07:09:39 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B0B0C061757
        for <linux-media@vger.kernel.org>; Tue, 27 Jul 2021 04:09:38 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id 19-20020a9d08930000b02904b98d90c82cso13063219otf.5
        for <linux-media@vger.kernel.org>; Tue, 27 Jul 2021 04:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=toEhJU+DBnuXNuC/VzAQiuiOBPJGpanC4ZtXqo4rgcM=;
        b=T3ZjYLBEJHvCyFh3G3Q7kzzhyZl851+30p3BHtc/Psx9QocC5034u/BjICq3LIHL3c
         mqybI1qjeyayJqn1tSVomGiXQFzU+B6Fdz8n3wzIZ8Jajl3q62qJwt3fL7zZ3qT2a1Bb
         ZCXdBxFJ2XIQYAKyCax7sW7u7jmdQTRD5cSM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=toEhJU+DBnuXNuC/VzAQiuiOBPJGpanC4ZtXqo4rgcM=;
        b=Bq48qN0oyadU/TxAtcbN0yPZvHh/9Ow9kv5JbgBcCxxO8gAbn7ohURXHO//zC6lM4Y
         Z49XydJPSB7a+QXVQyLk+Fntb1E1Aa/PGhkCmtEEORyH9uv/iwxitTOc7EyB5B5WIpUm
         LL2vwzXKWi41YuJNjylqEgZXZhMwl3jb/hx8OQzWhbS7FZzMb2/WetO1bzryzQBYxhJn
         Qopfb1NO2Z89618qZXm2vCwaHENoRJymxsxz1oTLoHJJl/PNo1XhCyxqWlxHlV+mCtlP
         my7AEx7YnVIdV0zfkQtVdAIoq4mWNwj/mqQ+/REYN+ZeuBaXmMfrCzGy/4c2iGy/fHl7
         gIkQ==
X-Gm-Message-State: AOAM533fh5Gwwwi5Gb7K79PLQ1oS4eNjQLrqzUdKHas5B2CKGzfIbp5I
        sgX9MX1RDrSyQtzGk87usPytL73bs/GuHEMcwjpDUg==
X-Google-Smtp-Source: ABdhPJyzU0vZYJAw5c3L/snDmwAuOs0LRxiLHhz+I4RrtqhZBCHAzwTeLL7a9d605aObjgTmHAQnpPT65r1SZTDXlcQ=
X-Received: by 2002:a05:6830:2802:: with SMTP id w2mr14709176otu.303.1627384177818;
 Tue, 27 Jul 2021 04:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch> <20210712175352.802687-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20210712175352.802687-4-daniel.vetter@ffwll.ch>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 27 Jul 2021 13:09:26 +0200
Message-ID: <CAKMK7uG8bMuDP=7-z9nZ38WgMdbeUk96eNx3buTCiaKatYOJxw@mail.gmail.com>
Subject: Re: [PATCH v4 03/18] drm/sched: Add dependency tracking
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        Melissa Wen <melissa.srw@gmail.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Lucas Stach <l.stach@pengutronix.de>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Steven Price <steven.price@arm.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Lee Jones <lee.jones@linaro.org>,
        Nirmoy Das <nirmoy.aiemd@gmail.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Jack Zhang <Jack.Zhang1@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adding a few more people to this bikeshed.

On Mon, Jul 12, 2021 at 10:02 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> @@ -349,6 +367,13 @@ int drm_sched_job_init(struct drm_sched_job *job,
>                        struct drm_sched_entity *entity,
>                        void *owner);
>  void drm_sched_job_arm(struct drm_sched_job *job);
> +int drm_sched_job_await_fence(struct drm_sched_job *job,
> +                             struct dma_fence *fence);
> +int drm_sched_job_await_implicit(struct drm_sched_job *job,
> +                                struct drm_gem_object *obj,
> +                                bool write);
> +
> +

I'm still waiting on the paint delivery for these two functions so I
can finish this shed.

Thanks, Daniel

>  void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>                                     struct drm_gpu_scheduler **sched_list,
>                                     unsigned int num_sched_list);
> --
> 2.32.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
