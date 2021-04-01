Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADD80351D87
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239232AbhDAS3B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236025AbhDASVK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:21:10 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F38AAC0225AD
        for <linux-media@vger.kernel.org>; Thu,  1 Apr 2021 08:34:56 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id cx5so1167383qvb.10
        for <linux-media@vger.kernel.org>; Thu, 01 Apr 2021 08:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aqivty0kItBvYGGyEFQ/9HO+WPoP9jtfr5ycsGY+FF8=;
        b=ZvyGgtwhp/yzmDXIwQF7Mt/dKYhpq9jqpN/Cnmkg9DRciJnRa2ALWpEAjRCLwe8lAV
         qWl8byzgnWQYAr1MqjqlLVnhlKVj0c5hXxssMCPFLTRoDUoUJsH0XGI8aV4bagRB5Z7H
         WEBfBzo8GfeHg/lOq0EeaNJssHGA3k8vD/1Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aqivty0kItBvYGGyEFQ/9HO+WPoP9jtfr5ycsGY+FF8=;
        b=sk/9guwL9g1vmpcEGgDAseVClUSd0TZiNKmk/Nten3fP2kMRFXyHuESUHBWL6LLBJu
         3qSnCdO66O/r4m35lGz6q8dGjtdk/7YbAnmQswHzdSdn8xTpl6uzmwLtFMaOwK/sdSTd
         hJA5XZ4bFAXPXWYn6VKk4zIpCtFduBNeCA/VyDDi9M3o1OtDDabVTTCuY5hpprN1gnx/
         NogbrFKbxJdd1PfwUTuiqciawhW7w+HuZa6YA5cLYr1G58WWUUEMGbkhf6Vu8aIVZzOa
         m5gKgH1Cm2u/gIbuW2fbCvHV5wMtQdr9CHZJJAsSB9NhAdmBuM7lQBo443tR3Pr2zCSy
         gpzA==
X-Gm-Message-State: AOAM5305/wYevChJKtFLc1CN/TH0EZITl8CYEnV6Qn7FNwy7czlshbTB
        o6yrgqjj1qxXOR0HsvnSmXDHIT9W5sg9BQ==
X-Google-Smtp-Source: ABdhPJxbZ9qOZ28eWDNnhET1JpPyjwRXqGoGkWKkCAyOqZz0fYDlGLXVZZEdOuHkJcyE3EM92CrSUg==
X-Received: by 2002:a05:6214:2607:: with SMTP id gu7mr8741054qvb.18.1617291296054;
        Thu, 01 Apr 2021 08:34:56 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id l6sm4253334qke.34.2021.04.01.08.34.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Apr 2021 08:34:55 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id z1so2201855ybf.6
        for <linux-media@vger.kernel.org>; Thu, 01 Apr 2021 08:34:55 -0700 (PDT)
X-Received: by 2002:a25:69c1:: with SMTP id e184mr12540453ybc.345.1617291294869;
 Thu, 01 Apr 2021 08:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com> <20210401012722.527712-1-robdclark@gmail.com>
 <20210401012722.527712-3-robdclark@gmail.com>
In-Reply-To: <20210401012722.527712-3-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 1 Apr 2021 08:34:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XexfG9oQa8JndOgQ9JSNRmO4-xjmQdiA_9Rn9dJWxsow@mail.gmail.com>
Message-ID: <CAD=FV=XexfG9oQa8JndOgQ9JSNRmO4-xjmQdiA_9Rn9dJWxsow@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/msm: Avoid mutex in shrinker_count()
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed, Mar 31, 2021 at 6:24 PM Rob Clark <robdclark@gmail.com> wrote:
>
> @@ -45,6 +30,9 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>         list_for_each_entry(msm_obj, &priv->inactive_dontneed, mm_list) {
>                 if (freed >= sc->nr_to_scan)
>                         break;
> +               /* Use trylock, because we cannot block on a obj that
> +                * might be trying to acquire mm_lock
> +                */

nit: I thought the above multi-line commenting style was only for
"net" subsystem?

>                 if (!msm_gem_trylock(&msm_obj->base))
>                         continue;
>                 if (is_purgeable(msm_obj)) {
> @@ -56,8 +44,11 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>
>         mutex_unlock(&priv->mm_lock);
>
> -       if (freed > 0)
> +       if (freed > 0) {
>                 trace_msm_gem_purge(freed << PAGE_SHIFT);
> +       } else {
> +               return SHRINK_STOP;
> +       }

It probably doesn't matter, but I wonder if we should still be
returning SHRINK_STOP if we got any trylock failures. It could
possibly be worth returning 0 in that case?


> @@ -75,6 +66,9 @@ vmap_shrink(struct list_head *mm_list)
>         unsigned unmapped = 0;
>
>         list_for_each_entry(msm_obj, mm_list, mm_list) {
> +               /* Use trylock, because we cannot block on a obj that
> +                * might be trying to acquire mm_lock
> +                */

If you end up changing the commenting style above, should also be here.

At this point this seems fine to land to me. Though I'm not an expert
on every interaction in this code, I've spent enough time starting at
it that I'm comfortable with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
