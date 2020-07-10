Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F73021BE3C
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 22:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728406AbgGJUCd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 16:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727941AbgGJUCc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 16:02:32 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1777C08C5DD
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2020 13:02:32 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id x83so5746037oif.10
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2020 13:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hlzdQKgtPmO74k0pNR7vHuIZBrt/Pc63RtVTndWe5dA=;
        b=SqNPnTQbjsymEOAYWvf7HTkD0FI+HW6j/e6KRe6XGJh3lSuGZ0C7kP/iBUFjVJ03M5
         t8w6HTmvlfEqaW7ZR4/WDh2zFfGdT+tuiUcDAyD+AEP04wFuCMGfRQQM26yq17Soms89
         nnpW0b1zmvAznK5+R6nx5wurVKlahUyCP/oLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hlzdQKgtPmO74k0pNR7vHuIZBrt/Pc63RtVTndWe5dA=;
        b=VRDjcy71Sm0pSQ+6SF58n5ULUZKISdvwoISLnG88mt2G+tRqHq5YExMeHBRtAG785X
         eRl4Eq/9hp4tfPi+VEkxnEeWqeiJhMeAuJhDtPFqQuv9Ux39eMeoQ8MDzrfbWGdOAXb6
         vzwIQ88tIfD0r2feFC4imH2gVwvWoYbYJaUOPIMwxD1orJLSAkhtCFutMtS3bOTAa8iT
         o1HN8jBShqDKZA6accya4bgLf1RVgOjC/GIDdBExHlBquAfjqppXqVAl1hO87XgLqujx
         h3Eb7a+YzM3s5c2qt7rbzTEs+gyCEftzj03MyQ2azKJ9ZTjUkXC6ys12/nzY97MT/fj4
         /m3A==
X-Gm-Message-State: AOAM5301lrKgj824r8opfGXOoknwxFXA8xnd9wbQ+l4i1C/Cwc8/zt+u
        9PrOPQhw82MCgcCnuvaRsThzv6x4vwN5BvKHUUx+Iw==
X-Google-Smtp-Source: ABdhPJyXe/UuJLRx5f5TlPpv/BPhnkWHORX2InNLi0AlJObIla3gh+GkiBljOI27Z+bfXCvGSQK4tsearkrRp5oifn8=
X-Received: by 2002:aca:da03:: with SMTP id r3mr5553679oig.14.1594411351996;
 Fri, 10 Jul 2020 13:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-3-daniel.vetter@ffwll.ch> <20200709080911.GP3278063@phenom.ffwll.local>
 <20200710124357.GB23821@mellanox.com> <5c163d74-4a28-1d74-be86-099b4729a2e0@amd.com>
 <20200710125453.GC23821@mellanox.com> <4f4a2cf7-f505-8494-1461-bd467870481e@amd.com>
 <20200710134826.GD23821@mellanox.com> <CAKMK7uGSUULTmL=bDXty6U4e37dzLHzu7wgUyOxo2CvR9KvXGg@mail.gmail.com>
 <20200710142347.GE23821@mellanox.com>
In-Reply-To: <20200710142347.GE23821@mellanox.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 10 Jul 2020 22:02:20 +0200
Message-ID: <CAKMK7uFK6Os5ALHEBr7tqCMtmHS1FpuDeOvqs40GVMv2kqJ90g@mail.gmail.com>
Subject: Re: [PATCH 02/25] dma-fence: prime lockdep annotations
To:     Jason Gunthorpe <jgg@mellanox.com>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        kernel test robot <lkp@intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
        Mika Kuoppala <mika.kuoppala@intel.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 10, 2020 at 4:23 PM Jason Gunthorpe <jgg@mellanox.com> wrote:
>
> On Fri, Jul 10, 2020 at 04:02:35PM +0200, Daniel Vetter wrote:
>
> > > dma_fence only possibly makes some sense if you intend to expose the
> > > completion outside a single driver.
> > >
> > > The prefered kernel design pattern for this is to connect things with
> > > a function callback.
> > >
> > > So the actual use case of dma_fence is quite narrow and tightly linked
> > > to DRM.
> > >
> > > I don't think we should spread this beyond DRM, I can't see a reason.
> >
> > Yeah v4l has a legit reason to use dma_fence, android wants that
> > there.
>
> 'legit' in the sense the v4l is supposed to trigger stuff in DRM when
> V4L DMA completes? I would still see that as part of DRM

Yes, and also the other way around. But thus far it didn't land.
-Daniel

> Or is it building a parallel DRM like DMA completion graph?
>
> > > Trying to improve performance of limited HW by using sketchy
> > > techniques at the cost of general system stability should be a NAK.
> >
> > Well that's pretty much gpu drivers, all the horrors for a bit more speed :-)
> >
> > On the text itself, should I upgrade to "must not" instead of "should
> > not"? Or more needed?
>
> Fundamentally having some unknowable graph of dependencies where parts
> of the graph can be placed in critical regions like notifiers is a
> complete maintenance nightmare.
>
> I think building systems like this should be discouraged :\

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
