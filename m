Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 342BC403F31
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 20:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348172AbhIHSqn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 14:46:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347420AbhIHSqn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 14:46:43 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86019C061757
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 11:45:31 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id j17-20020a05600c1c1100b002e754875260so2267756wms.4
        for <linux-media@vger.kernel.org>; Wed, 08 Sep 2021 11:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=78b/o4FTri/T8m3ByDrpuRiUFjFJpaUAFqCBQ5K0Pjk=;
        b=UVeeR/Y3ITAN9om9eB3OxTSyvuFCFCCuxlvXCP4h4QeWb2ADncJOxHdH6S0mbs0j+w
         t8IsraP+rwZF6KHDPsHBO8WzHf/xPqm8paFKOxlwdjbHWvnJmKGtKeNZXkwlCNWq+enb
         bm3w7WpDgpKfS4r9cuQ30bRglqnsF7e0ynIxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=78b/o4FTri/T8m3ByDrpuRiUFjFJpaUAFqCBQ5K0Pjk=;
        b=Wb9aYPrNj9+DcBx1kKsu2gMmVocW6eJDSko3m2RvZNFTQ24hJQD8k10fM3J9Xxj2h+
         zND05jXQljB8hKFeMyejQ5/3slO7BAwkP8vTJvPwn8Elearx5sR7IM0zfx5td+NrGoB5
         3W+7+OOKCzjKR8GM+ULlF5YM83d1FaWXs7oKPpfbzx0jjvF8UnINYAhLiPgWjRi7qfuL
         1IYfuHAt7dRTsi/JjLFq96YB/rrCbO9gh0lHPYNoV8msmb2Gs5VIiYfJssL5HSbylUCz
         IZdMPkvfw6fKrNsqLU8jCzP66ytqsksknOwlk7vJt5oivTJxEIFXacMhzjU9RG4eHtZ2
         /e1w==
X-Gm-Message-State: AOAM532h/RMqvVRwBrZCc/gJYc9ZxBGruESTMmnLHtzfWS7IScBU/bp9
        OcBYo4/yJBDWSfz5Nm9xPtaL8A==
X-Google-Smtp-Source: ABdhPJwIEz0ip15hEKr6eUCycgYpJg6anoTgQJjUALCzYl2FdIeNCN0HtocfjTwKahuI2GWk6V0Zlw==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr4928583wmp.93.1631126730071;
        Wed, 08 Sep 2021 11:45:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id m5sm2789859wmi.1.2021.09.08.11.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:45:29 -0700 (PDT)
Date:   Wed, 8 Sep 2021 20:45:27 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 7/9] dma-buf/fence-chain: Add fence deadline support
Message-ID: <YTkExzW4QWBC6hMa@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
        Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <20210903184806.1680887-8-robdclark@gmail.com>
 <YTj4yPk1YuFk3oeL@phenom.ffwll.local>
 <CAF6AEGs3DhSKhDkft58VqkM6GwMMSq87GZkQAaPf_LLavDdacA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGs3DhSKhDkft58VqkM6GwMMSq87GZkQAaPf_LLavDdacA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 08, 2021 at 11:19:15AM -0700, Rob Clark wrote:
> On Wed, Sep 8, 2021 at 10:54 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Sep 03, 2021 at 11:47:58AM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/dma-buf/dma-fence-chain.c | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> > > index 1b4cb3e5cec9..736a9ad3ea6d 100644
> > > --- a/drivers/dma-buf/dma-fence-chain.c
> > > +++ b/drivers/dma-buf/dma-fence-chain.c
> > > @@ -208,6 +208,18 @@ static void dma_fence_chain_release(struct dma_fence *fence)
> > >       dma_fence_free(fence);
> > >  }
> > >
> > > +
> > > +static void dma_fence_chain_set_deadline(struct dma_fence *fence,
> > > +                                      ktime_t deadline)
> > > +{
> > > +     dma_fence_chain_for_each(fence, fence) {
> > > +             struct dma_fence_chain *chain = to_dma_fence_chain(fence);
> > > +             struct dma_fence *f = chain ? chain->fence : fence;
> >
> > Doesn't this just end up calling set_deadline on a chain, potenetially
> > resulting in recursion? Also I don't think this should ever happen, why
> > did you add that?
> 
> Tbh the fence-chain was the part I was a bit fuzzy about, and the main
> reason I added igt tests.  The iteration is similar to how, for ex,
> dma_fence_chain_signaled() work, and according to the igt test it does
> what was intended

Huh indeed. Maybe something we should fix, like why does the
dma_fence_chain_for_each not give you the upcast chain pointer ... I guess
this also needs more Christian and less me.
-Daniel

> 
> BR,
> -R
> 
> > -Daniel
> >
> > > +
> > > +             dma_fence_set_deadline(f, deadline);
> > > +     }
> > > +}
> > > +
> > >  const struct dma_fence_ops dma_fence_chain_ops = {
> > >       .use_64bit_seqno = true,
> > >       .get_driver_name = dma_fence_chain_get_driver_name,
> > > @@ -215,6 +227,7 @@ const struct dma_fence_ops dma_fence_chain_ops = {
> > >       .enable_signaling = dma_fence_chain_enable_signaling,
> > >       .signaled = dma_fence_chain_signaled,
> > >       .release = dma_fence_chain_release,
> > > +     .set_deadline = dma_fence_chain_set_deadline,
> > >  };
> > >  EXPORT_SYMBOL(dma_fence_chain_ops);
> > >
> > > --
> > > 2.31.1
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
