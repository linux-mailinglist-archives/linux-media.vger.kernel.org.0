Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2518F3C64E4
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 22:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235767AbhGLUZl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 16:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbhGLUZl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 16:25:41 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C254C0613DD
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 13:22:51 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id g19so31049561ybe.11
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 13:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a3t8M9p1Xm1DbJhl1g0NI4nr029zZMFUcrN6YRFecnc=;
        b=fvieSNTAu0QOO6Kgbsr4CMsCMbnxljtbkFs749HKPLwSgK6LFrB2/sSXxXxPEbXsYJ
         z+5kxgh90Zt5bn2SqS/SoUg10IyqffUs/dYT861u++JBLu4krWCMS5xoB1UQ5zIKt1gV
         ygViuUifqM/ZQSPMiEjxkDXkBrvLsEgrl2NXRw2XO7eRgRi6bTfBmxArAUIoXc4cyJmk
         6NgCzRhmnDVTpalVxtk+LEutBcNDYazZpsWTIGp4mJXfMnexW3K+jls+LmH+ms7T12BP
         pautDNXemHkvMsYm5uJwTq5CGpcc8Jwfw0RRFnhHqhaTNEqrFRWsB9PehyrS2FQOB3Nv
         EBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a3t8M9p1Xm1DbJhl1g0NI4nr029zZMFUcrN6YRFecnc=;
        b=uN3pLMGwprDdxabnmJm1RvKMbrzfzphbPsCqcaJ9G83xydOb0VAde6R42XNeIWGVb6
         ofctxBaZhD/u64mf8m3neIX3slkvyv74H4tw68TppLxrkRdiarc0+KppngpPrscqHqd3
         KS8eW2gJJcLVWmKs4K5vY/DNCuWKaOgczhat3ywtey6orrSfeoTgGXXrFUoeTDjcFLYi
         U0oOmQl72wefoTe4C8BDEkjs2paWZ5LVYkOB9MQe9v0WieUTnpsyMvM9vYJVA/7FrDmJ
         OmyGGwd9cRzclLHoomArNgPo4eXm5sUrOb/KtE6i7YcHnL5kjV9O0LZgGigqOi7pn9bV
         od8Q==
X-Gm-Message-State: AOAM533tpZyFA3A9ftvgtRR8Rw0JCYaiJtTZeGj3jJNdaNq+44oEj8gc
        qqJpuuCZJR5RR3i8cBeG4bk4hRf+sQVI6To3zkWd6g==
X-Google-Smtp-Source: ABdhPJx2wuE9Pm+zYEWPkhe410Q70juC3Q6Ib1mH/wyNMBjZa35BDO2FxwK8XexNYfq4Pv5l+XWIEuKMnYscXjN4aZE=
X-Received: by 2002:a25:38d4:: with SMTP id f203mr1045399yba.45.1626121370668;
 Mon, 12 Jul 2021 13:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch> <20210712175352.802687-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20210712175352.802687-2-daniel.vetter@ffwll.ch>
From:   Emma Anholt <emma@anholt.net>
Date:   Mon, 12 Jul 2021 13:22:39 -0700
Message-ID: <CADaigPXPpiEfMOZ+h=H6e_brdK-1n0Aax34oWTaiJaDjM=EsfA@mail.gmail.com>
Subject: Re: [PATCH v4 01/18] drm/sched: Split drm_sched_job_init
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Melissa Wen <melissa.srw@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Qiang Yu <yuq825@gmail.com>, Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Adam Borowski <kilobyte@angband.pl>,
        Nick Terrell <terrelln@fb.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Sami Tolvanen <samitolvanen@google.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Dave Airlie <airlied@redhat.com>,
        Nirmoy Das <nirmoy.das@amd.com>,
        Deepak R Varma <mh12gx2825@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Kevin Wang <kevin1.wang@amd.com>,
        Chen Li <chenli@uniontech.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
        Dennis Li <Dennis.Li@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Sonny Jiang <sonny.jiang@amd.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        etnaviv@lists.freedesktop.org, lima@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 12, 2021 at 1:01 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> This is a very confusingly named function, because not just does it
> init an object, it arms it and provides a point of no return for
> pushing a job into the scheduler. It would be nice if that's a bit
> clearer in the interface.
>
> But the real reason is that I want to push the dependency tracking
> helpers into the scheduler code, and that means drm_sched_job_init
> must be called a lot earlier, without arming the job.
>
> v2:
> - don't change .gitignore (Steven)
> - don't forget v3d (Emma)
>
> v3: Emma noticed that I leak the memory allocated in
> drm_sched_job_init if we bail out before the point of no return in
> subsequent driver patches. To be able to fix this change
> drm_sched_job_cleanup() so it can handle being called both before and
> after drm_sched_job_arm().
>
> Also improve the kerneldoc for this.
>
> v4:
> - Fix the drm_sched_job_cleanup logic, I inverted the booleans, as
>   usual (Melissa)
>
> - Christian pointed out that drm_sched_entity_select_rq() also needs
>   to be moved into drm_sched_job_arm, which made me realize that the
>   job->id definitely needs to be moved too.
>
>   Shuffle things to fit between job_init and job_arm.
>
> v5:
> Reshuffle the split between init/arm once more, amdgpu abuses
> drm_sched.ready to signal gpu reset failures. Also document this
> somewhat. (Christian)

Ack from me for the changes I was Cced on.
