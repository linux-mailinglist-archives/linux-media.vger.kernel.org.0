Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAFAC351745
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 19:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234391AbhDARlp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 13:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234626AbhDARi2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 13:38:28 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A7CFC0319DB;
        Thu,  1 Apr 2021 10:34:20 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id b9so2595119wrt.8;
        Thu, 01 Apr 2021 10:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rK2LdS6ODAydJkNJDKUimZKMnsbdOM3cvA6asgW0c80=;
        b=fbPIbSHJtsRAZcXnsol7EI9DCaFJZ9nwvBGgXN7up6EJ+E7CAhF1Ocm4pX77zRlF+8
         iKer8GP+EWclFlHSRplim3szwZeCqo9UrNPQK+ESFU3xZx/mVuM36sWFCBPU02kN8Uq0
         DrqxAh9Yelt//O5VEqVWrdz94ICrGpecJ2+v7/UoVs3x95tlMaCNyEElnc+zC12GyHtt
         3QOyMFLgzT9duhlCILmgOvPRQhwbHAQWQOicexLPIm89xw1ppK5cpSIp43+b9tOWE5kU
         GrihkfBolOIcGBgdosfKtjs1FoGncRGD0YlOxjPzUrt1qVQnOvspWi4etXScsO+R2xt6
         rDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rK2LdS6ODAydJkNJDKUimZKMnsbdOM3cvA6asgW0c80=;
        b=ZIr5ZSklDvEAgYwVG07300BdM5ck0HcVzAqhZScq8Li+BdpAcVsGrfWREjaY5ITD44
         +5FulZbbHRfH4l6L8gNFl3ZIOSy5wA+eGjN5eWoc0HukWVsl8Wj0ue3cCw678hkVJjeu
         2rOqdDOZ40hjWaBAx0FmM5iotUkkz2doZ2shxbWVPceVow11kvO31cho+OGnVzYggCCc
         Rqrn84qp/wn06XI5hnX+3RdRjurhULmU+cmwfXsQ3bMpB1TuJuavv9yIARuKDMp+6ymS
         ZYqpq8OfLNcmr2tsUchtFvEk/o5wug+mZf4ET4h3M60HdG/vfB0Wui4drI9pE1mXC2aW
         CZYA==
X-Gm-Message-State: AOAM5323/Lp/jaa6jnfzhjebjyRzbpGFxZKCFFmFKN0jF1rkVtLavFr3
        CKnGetYVqXMtzZ40mT68eUYQo2D+MgJ58xb7vao=
X-Google-Smtp-Source: ABdhPJzTzb75Zq5lVKxlXsLtahJ+rLK1yT4ChASxTdyK4VvEYKWc/dOfoDSRkP8SuHFCh33/CUU6oLC581EOnJ+bucE=
X-Received: by 2002:adf:fb42:: with SMTP id c2mr11041823wrs.83.1617298459053;
 Thu, 01 Apr 2021 10:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com> <20210401012722.527712-1-robdclark@gmail.com>
 <20210401012722.527712-3-robdclark@gmail.com> <CAD=FV=XexfG9oQa8JndOgQ9JSNRmO4-xjmQdiA_9Rn9dJWxsow@mail.gmail.com>
In-Reply-To: <CAD=FV=XexfG9oQa8JndOgQ9JSNRmO4-xjmQdiA_9Rn9dJWxsow@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 1 Apr 2021 10:37:44 -0700
Message-ID: <CAF6AEGvQ3Ep4O_SKGiptq1BiMK0tUjJ=U84M2otvQtVfWHEzoQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/msm: Avoid mutex in shrinker_count()
To:     Doug Anderson <dianders@chromium.org>
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

On Thu, Apr 1, 2021 at 8:34 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Mar 31, 2021 at 6:24 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > @@ -45,6 +30,9 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
> >         list_for_each_entry(msm_obj, &priv->inactive_dontneed, mm_list) {
> >                 if (freed >= sc->nr_to_scan)
> >                         break;
> > +               /* Use trylock, because we cannot block on a obj that
> > +                * might be trying to acquire mm_lock
> > +                */
>
> nit: I thought the above multi-line commenting style was only for
> "net" subsystem?

we do use the "net" style a fair bit already.. (OTOH I tend to not
really care what checkpatch says)

> >                 if (!msm_gem_trylock(&msm_obj->base))
> >                         continue;
> >                 if (is_purgeable(msm_obj)) {
> > @@ -56,8 +44,11 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
> >
> >         mutex_unlock(&priv->mm_lock);
> >
> > -       if (freed > 0)
> > +       if (freed > 0) {
> >                 trace_msm_gem_purge(freed << PAGE_SHIFT);
> > +       } else {
> > +               return SHRINK_STOP;
> > +       }
>
> It probably doesn't matter, but I wonder if we should still be
> returning SHRINK_STOP if we got any trylock failures. It could
> possibly be worth returning 0 in that case?

On the surface, you'd think that, but there be mm dragons.. we can hit
shrinker from the submit path when the obj is locked already and we
are trying to allocate backing pages.  We don't want to tell vmscan to
keep trying, because we'll keep failing to grab that objects lock

>
> > @@ -75,6 +66,9 @@ vmap_shrink(struct list_head *mm_list)
> >         unsigned unmapped = 0;
> >
> >         list_for_each_entry(msm_obj, mm_list, mm_list) {
> > +               /* Use trylock, because we cannot block on a obj that
> > +                * might be trying to acquire mm_lock
> > +                */
>
> If you end up changing the commenting style above, should also be here.
>
> At this point this seems fine to land to me. Though I'm not an expert
> on every interaction in this code, I've spent enough time starting at
> it that I'm comfortable with:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

thanks

BR,
-R
