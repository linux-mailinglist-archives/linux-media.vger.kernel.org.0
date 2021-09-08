Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3352403EEE
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 20:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349587AbhIHSQH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 14:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235747AbhIHSQG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 14:16:06 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE5FC061575;
        Wed,  8 Sep 2021 11:14:58 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id d6so4561363wrc.11;
        Wed, 08 Sep 2021 11:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YRUmRUUCYmjE8wlXNGRCZTbNeHfZjNb6hJUKTvoLMJE=;
        b=NRxAAd7y72m0T3aSIbndy+HJVgXcePIEbPw7RzYDKSkGDr7OylwuEsyXxLXxC8Wp3Q
         a2GeUbAOblhD4Kd/GXztAUU3QND2ihaT0zBBFqWoVemp5eU4KoEC6ZLs3i5TPFQRrhP+
         zyvLA5xf++zEAKTIqnJ+KxtRDJx8aRRN51jsLJG0x0daYyKFFiCxRoVYBj8euPIGg3jf
         TR4H1ANvax/D2ToiabFBoYc4vkcD0otvfSmW/Ak3Aw3amFvoAR3T1RpnwmYpHIab1GOg
         cNHMS/aScEaYwuP8E9p6G1sX74a54i59OEjALlYeL7d7LCTTaaip5SpKqk6EHdfIc27q
         sN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YRUmRUUCYmjE8wlXNGRCZTbNeHfZjNb6hJUKTvoLMJE=;
        b=zFRIzNpRlGJx3uWQFQ1gcaWwnh0mtsXBBobdejooyFlGzx3jDBna6eA1v0OFQ0/qT3
         uGQ/EuF/70Pj2R3EAvOTjLSZ/gUqXTp+dkyCZBtbKKqpmxgDRXU5KcKtE6VI2zfZDYkG
         xLh1NE+UEJOOIR6nggsrJKO1eRFDP3y4ZD6WAhLZXUWmGS4meYtlJXQHvbna9NwBlpTd
         UWClqN4BcsePrxPOppDJ4kjba8mUytuXLW27Qn6tffVcBevs3cZjRXCdXuz55xK7hhA3
         OBcU0G9LR0dKuVtOCxJkLlN11bt3UrPQPUcBWcbdYxo4bank/gvSkjoUIhiK1eAAOwRY
         Yfjw==
X-Gm-Message-State: AOAM533Kmb6QWT+jK8TEG2tHP9oo2V7Ij3EpAKPj1AFHGl5Zm74z9ttv
        tSY2xHMZK3M4TiAX9pKdYdvSjKWnLLTB/sFZsXo=
X-Google-Smtp-Source: ABdhPJymRYwAKCqCyQNDewZqZfzSmR+wV89gVCvB1gmqaqDId8Vj6kyBJgUfihNgx2+kZsKBr3HzdEa02e+Y80EVfrE=
X-Received: by 2002:a5d:4488:: with SMTP id j8mr5580376wrq.260.1631124896977;
 Wed, 08 Sep 2021 11:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210903184806.1680887-1-robdclark@gmail.com> <20210903184806.1680887-8-robdclark@gmail.com>
 <YTj4yPk1YuFk3oeL@phenom.ffwll.local>
In-Reply-To: <YTj4yPk1YuFk3oeL@phenom.ffwll.local>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 8 Sep 2021 11:19:15 -0700
Message-ID: <CAF6AEGs3DhSKhDkft58VqkM6GwMMSq87GZkQAaPf_LLavDdacA@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] dma-buf/fence-chain: Add fence deadline support
To:     Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 8, 2021 at 10:54 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Sep 03, 2021 at 11:47:58AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/dma-buf/dma-fence-chain.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> > index 1b4cb3e5cec9..736a9ad3ea6d 100644
> > --- a/drivers/dma-buf/dma-fence-chain.c
> > +++ b/drivers/dma-buf/dma-fence-chain.c
> > @@ -208,6 +208,18 @@ static void dma_fence_chain_release(struct dma_fence *fence)
> >       dma_fence_free(fence);
> >  }
> >
> > +
> > +static void dma_fence_chain_set_deadline(struct dma_fence *fence,
> > +                                      ktime_t deadline)
> > +{
> > +     dma_fence_chain_for_each(fence, fence) {
> > +             struct dma_fence_chain *chain = to_dma_fence_chain(fence);
> > +             struct dma_fence *f = chain ? chain->fence : fence;
>
> Doesn't this just end up calling set_deadline on a chain, potenetially
> resulting in recursion? Also I don't think this should ever happen, why
> did you add that?

Tbh the fence-chain was the part I was a bit fuzzy about, and the main
reason I added igt tests.  The iteration is similar to how, for ex,
dma_fence_chain_signaled() work, and according to the igt test it does
what was intended

BR,
-R

> -Daniel
>
> > +
> > +             dma_fence_set_deadline(f, deadline);
> > +     }
> > +}
> > +
> >  const struct dma_fence_ops dma_fence_chain_ops = {
> >       .use_64bit_seqno = true,
> >       .get_driver_name = dma_fence_chain_get_driver_name,
> > @@ -215,6 +227,7 @@ const struct dma_fence_ops dma_fence_chain_ops = {
> >       .enable_signaling = dma_fence_chain_enable_signaling,
> >       .signaled = dma_fence_chain_signaled,
> >       .release = dma_fence_chain_release,
> > +     .set_deadline = dma_fence_chain_set_deadline,
> >  };
> >  EXPORT_SYMBOL(dma_fence_chain_ops);
> >
> > --
> > 2.31.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
