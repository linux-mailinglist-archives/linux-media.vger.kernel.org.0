Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787A440B24F
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 16:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234153AbhINO6O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 10:58:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234156AbhINO6N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 10:58:13 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01406C061574
        for <linux-media@vger.kernel.org>; Tue, 14 Sep 2021 07:56:56 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id w4so24394532ljh.13
        for <linux-media@vger.kernel.org>; Tue, 14 Sep 2021 07:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=32RtfxSjG9sP/kIUfnN+bsrpnlPSA3iRbY0ztFhcO1k=;
        b=g1blrE6JWLFlISD43DfLBsNCmJMHG7OgT6BtlTPAhH4bPy239jRIor5E6XtKGxd4OJ
         7EdyhWmvDX37aY6E/GXP9AYiE+/+E+wxKsjaMwQo6vMmd7UBJf3FvbE5TRes47YjVxtz
         YoURR3UBON8M36HXELphQ4nP3UX1Y3hdCFiW0R6wfuakERNgszQoNquAKZhYhMLNtZQD
         4Z3G35XKyY7z14jMwT/T5HV+gWgNBRVSB3+gFFjFB3tDKFh+2mhJfvUyUNYvKCgizSw8
         aUC7/hvkEpIHsezgj8H91jbzmegcYauM4kRnXQqRoZu0fOd7NLSrW4x8W52J5m3hJGZ3
         32rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=32RtfxSjG9sP/kIUfnN+bsrpnlPSA3iRbY0ztFhcO1k=;
        b=foB1EIe/VqXOfPJ+3Mv37I+NjriO+Sqn/usZQaLmpfEr7TWzwzNeK/+AwTZWbeS0AZ
         u2sZOPIGzyo4G335PWANtHYXRtBQixd4CzDdZX6fTU0MPCN8yfOEZldWxpBv6zVCzNvn
         To1u6/XwWpDwf/0B7ea572VCkraNHc8zhzSZQKbNnwRyKIKXnr7hwMgsVfW8KtDOJID2
         VgyQPnufVnIMkSj8zBB1PVv8wdecsfUFHt1M2AL5/MebXzzp/pBNbyXp+RzP9vc1baO6
         O/iTDZrDKygoVfXhO5b6Nt0KFPg11x00GpEA37oBMGhsHBYECKhmkLk82n1irtrv0r1K
         zasg==
X-Gm-Message-State: AOAM530jDRzZV6qkNOufopNSJYD7bW7357xxK3Vf4Ia2WpN9+316tU/N
        0pL5s4jQks/0lPXK9mTQiNDGNXcZdWb1fnpckusfyQ==
X-Google-Smtp-Source: ABdhPJyN4Gk+w1SqRvWCMhYlWwXBQTnF9kGXxlYteM5XO81E0lzwURPIhsqxkIDPE4IyeA8D51INwkfKvRBNLaacWoA=
X-Received: by 2002:a2e:8e8f:: with SMTP id z15mr15505095ljk.121.1631631414295;
 Tue, 14 Sep 2021 07:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210909023741.2592429-1-john.stultz@linaro.org> <YUCqFfalhgSTX249@phenom.ffwll.local>
In-Reply-To: <YUCqFfalhgSTX249@phenom.ffwll.local>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Tue, 14 Sep 2021 20:26:42 +0530
Message-ID: <CAO_48GGtwDJPFqfsQvDPGwF-B+9GAVxEjS+jSWvmbeFHSkutiA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: system_heap: Avoid warning on mid-order allocations
To:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, Leo Yan <leo.yan@linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks John!

On Tue, 14 Sept 2021 at 19:26, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Sep 09, 2021 at 02:37:41AM +0000, John Stultz wrote:
> > When trying to do mid-order allocations, set __GFP_NOWARN to
> > avoid warning messages if the allocation fails, as we will
> > still fall back to single page allocatitions in that case.
> > This is the similar to what we already do for large order
> > allocations.
> >
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Christian Koenig <christian.koenig@amd.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Liam Mark <lmark@codeaurora.org>
> > Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
> > Cc: Laura Abbott <labbott@kernel.org>
> > Cc: Brian Starkey <Brian.Starkey@arm.com>
> > Cc: Hridya Valsaraju <hridya@google.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Sandeep Patil <sspatil@google.com>
> > Cc: Daniel Mentz <danielmentz@google.com>
> > Cc: =C3=98rjan Eide <orjan.eide@arm.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Simon Ser <contact@emersion.fr>
> > Cc: James Jones <jajones@nvidia.com>
> > Cc: Leo Yan <leo.yan@linaro.org>
> > Cc: linux-media@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
Pushed to drm-misc-next.

> > ---
> >  drivers/dma-buf/heaps/system_heap.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heap=
s/system_heap.c
> > index 23a7e74ef966..f57a39ddd063 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -40,11 +40,12 @@ struct dma_heap_attachment {
> >       bool mapped;
> >  };
> >
> > +#define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO | __GFP_COMP)
> > +#define MID_ORDER_GFP (LOW_ORDER_GFP | __GFP_NOWARN)
> >  #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
> >                               | __GFP_NORETRY) & ~__GFP_RECLAIM) \
> >                               | __GFP_COMP)
> > -#define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO | __GFP_COMP)
> > -static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, LOW_ORDER_GFP, LOW_ORD=
ER_GFP};
> > +static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, MID_ORDER_GFP, LOW_ORD=
ER_GFP};
> >  /*
> >   * The selection of the orders used for allocation (1MB, 64K, 4K) is d=
esigned
> >   * to match with the sizes often found in IOMMUs. Using order 4 pages =
instead
> > --
> > 2.25.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch


Best,
Sumit.
