Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 051FC2AE167
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 22:13:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731558AbgKJVNx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 16:13:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgKJVNw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 16:13:52 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3C9EC0613D1;
        Tue, 10 Nov 2020 13:13:51 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id d142so4614033wmd.4;
        Tue, 10 Nov 2020 13:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EvrNTGyzPLrpMkOqbiu0tJDut5rWtaLyxK55CmagbKo=;
        b=XJPgOv25JZ76wIWvv1r7+oeadXAOemvtCAKknFD8PbF8CojgPH/YzIY5iCoKqSjEww
         AO4kIyk9jonsdRnRubyCundPh31KWp8SLxnwL3rfWk50qXDRSStPoQSRVPaJt3VjTtAc
         RkmwIFwDI9S67f0iHFRZZez9aACymlUzkEQq9kGB+nLZNpw+AWrNpkTwlqgOdIfUgpSK
         gkGo+sSBHdlxsL3xNPa5qubtI2kjE+HQOYmjEJE0Uyz1t3XP5XvvWLPRyY4GDrSIGuK4
         4Sun/7yYBZAs7vXGGfTTwTHS8r5GIaltZ0gA/fYx/LkrwB0vi0f1lwnRiAtGhYQDckl2
         ITjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EvrNTGyzPLrpMkOqbiu0tJDut5rWtaLyxK55CmagbKo=;
        b=byuPBnzhfug5G14ymLQg9N24QG0WELoeznmpUchQZ0QZjkOshP+8C751AoPgxNwjQR
         oznA+OrbQVWGVgVQbU9PYNblOy+YHB5j+84z9cLGt8Bv4p9/8N2V7cMzm4ADsHS5FZzS
         mIonZOSPraWdwWao7zFP+etRe+iUMXDgny5OIlIJ72DcyGPJwvBFTyeuIzBNkUPlavGv
         h/Eb8g2/sPcqmSltsGjOqJ1UScFGgSTLx3wQkDcEg5wrwCR2iT3FnfBdrYs9xo8EgbgO
         q72QGoa1BiOSUewv13RfrRqmoGr1BQkcH0E9S6lNmkacH8pODMjNikMTPc/RaNUINxt3
         39yw==
X-Gm-Message-State: AOAM532ZOba0+kOmZ2OTfaPtzGTfv6DpvWU8EiL+X9qs8Sf5vvCK0qUq
        PqYuY5x6/kMoPbsZNoW5ibUcjB0qgkW1O86h+iw=
X-Google-Smtp-Source: ABdhPJyHC8vHXsJYCh3vrnV2nELM9iSabVZOSi99vn/Wo7V70lIbQoE1qv+uHNKxSVF66X7FRUYqQDwa+xjr5OZdkGI=
X-Received: by 2002:a1c:80cb:: with SMTP id b194mr27049wmd.73.1605042830518;
 Tue, 10 Nov 2020 13:13:50 -0800 (PST)
MIME-Version: 1.0
References: <20201105144517.1826692-1-lee.jones@linaro.org> <20201105144517.1826692-8-lee.jones@linaro.org>
In-Reply-To: <20201105144517.1826692-8-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 10 Nov 2020 16:13:39 -0500
Message-ID: <CADnq5_MGxcgXN-bbXVi4BidW7oa+qW8g9fOPuH2-1gSNWOW5jw@mail.gmail.com>
Subject: Re: [PATCH 07/19] gpu: drm: scheduler: sched_entity: Demote
 non-conformant kernel-doc headers
To:     Lee Jones <lee.jones@linaro.org>
Cc:     David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        linux-media <linux-media@vger.kernel.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Nirmoy Das <nirmoy.aiemd@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 5, 2020 at 9:52 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/scheduler/sched_entity.c:316: warning: Function paramete=
r or member 'f' not described in 'drm_sched_entity_clear_dep'
>  drivers/gpu/drm/scheduler/sched_entity.c:316: warning: Function paramete=
r or member 'cb' not described in 'drm_sched_entity_clear_dep'
>  drivers/gpu/drm/scheduler/sched_entity.c:330: warning: Function paramete=
r or member 'f' not described in 'drm_sched_entity_wakeup'
>  drivers/gpu/drm/scheduler/sched_entity.c:330: warning: Function paramete=
r or member 'cb' not described in 'drm_sched_entity_wakeup'
>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Nirmoy Das <nirmoy.aiemd@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index f8ec277a6aa85..c1ac3e4003c6f 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -308,7 +308,7 @@ void drm_sched_entity_destroy(struct drm_sched_entity=
 *entity)
>  }
>  EXPORT_SYMBOL(drm_sched_entity_destroy);
>
> -/**
> +/*
>   * drm_sched_entity_clear_dep - callback to clear the entities dependenc=
y
>   */
>  static void drm_sched_entity_clear_dep(struct dma_fence *f,
> @@ -321,7 +321,7 @@ static void drm_sched_entity_clear_dep(struct dma_fen=
ce *f,
>         dma_fence_put(f);
>  }
>
> -/**
> +/*
>   * drm_sched_entity_clear_dep - callback to clear the entities dependenc=
y and
>   * wake up scheduler
>   */
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
