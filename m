Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC24300FE3
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 23:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729136AbhAVWWp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 17:22:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728360AbhAVWV7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 17:21:59 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9D52C0613D6
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 14:21:08 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id e15so5626263wme.0
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 14:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=p+wFAQDvhZKzJckMU2PTCB4geYwutkW2n4ieR3b1p7c=;
        b=PzRiNcUmdot6JGXxpzUl72+waAwAYCBKGrm/wOqFqpqn/YIEGIMEuGbcpXxwbFRSlm
         SOBocLyuiSB7j+UyAVJQxtRnEbA6+9VKrlk3oLSxWawGjvxJtF3esc7MkVFKD7wLu5eo
         F4TpcjpAYQpee6WoocuEVDpRvIjmoiknO6i1025Z9y1gttI3fC0tNg+sL/6O5T6qneOC
         k+s2sXL5Kaa/Pg+eusXwY7uVGye3iFe/B3uDL2mWFJDwBYQD9RvljoAJqNhUeWLGwoDn
         U2BtIfMSR41j+1w+FOU0GlAxbfrrUeTj3qOdPKG5V3TJjOJRrJyljTxWpOy5B/TdZv7S
         JN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=p+wFAQDvhZKzJckMU2PTCB4geYwutkW2n4ieR3b1p7c=;
        b=XRn3Ip6GRliKwLRrU7efEwfDRkorjKmg6FQhxmLrC06/OC5BZcLNBReO+8p4CdRBg5
         Ed7RTeqGZqQ0c7FvwqeXoGkP8jQrGopb+VICzeF+xMyiOwH1rUjDCZjVhSfNoVlwuQF/
         1U9iddQt80yopNPWK2tz8vgGQ9UkcnGtWplexcZHKrXwXj51IkqjXmQ4bDX+y1KmanKg
         /LOphsqGgXE42mMIqgYm/HV3SDdyPkIZq4+HcyunGq26GDfH3Mzjj+JbaXyRPtV5rmk4
         vXiASZJe6B+6zRLwCsHIaRztdARspSPNBy3+v+J47RfHuVulCinq3fhLoH+y36q9PboP
         OHRA==
X-Gm-Message-State: AOAM531rQ/JrCTt+DNuxHFgcXcHchKhyEEVOhSFF4vy9aMmNZVXQQzr9
        B8TGqCKLcac3jhWQvjF2ClIxxoASJSqgPFAIJPYQxg==
X-Google-Smtp-Source: ABdhPJzbd/UOZZQeTAnMSZA8bXD9d3VDfBedEN1Zbd4a2k+DLKLdfAPmMYLlkIHhGT4WfL3kqVVIITKABzMNGSZHbOA=
X-Received: by 2002:a1c:7906:: with SMTP id l6mr5825010wme.22.1611354067218;
 Fri, 22 Jan 2021 14:21:07 -0800 (PST)
MIME-Version: 1.0
References: <20210119204508.9256-1-john.stultz@linaro.org> <20210119204508.9256-2-john.stultz@linaro.org>
 <CAO_48GEYGzY8cZybwrXgfODhuoAJqi4AvwbZbWd+PiYjMqKYpw@mail.gmail.com>
In-Reply-To: <CAO_48GEYGzY8cZybwrXgfODhuoAJqi4AvwbZbWd+PiYjMqKYpw@mail.gmail.com>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Fri, 22 Jan 2021 14:20:56 -0800
Message-ID: <CAJuCfpGRkM+h16SJp7gJOaAhy+gFw1-++WP8kavOjRj3MHcpBQ@mail.gmail.com>
Subject: Re: [RESEND][PATCH 2/3] dma-buf: heaps: Add a WARN_ON should the
 vmap_cnt go negative
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 21, 2021 at 11:56 PM Sumit Semwal <sumit.semwal@linaro.org> wro=
te:
>
> Hi John, Suren,
>
>
> On Wed, 20 Jan 2021 at 02:15, John Stultz <john.stultz@linaro.org> wrote:
> >
> > We shouldn't vunmap more then we vmap, but if we do, make
> > sure we complain loudly.
>
> I was checking the general usage of vunmap in the kernel, and I
> couldn't find many instances where we need to WARN_ON for the vunmap
> count more than vmap count. Is there a specific need for this in the heap=
s?

Hi Sumit,
My worry was that buffer->vmap_cnt could silently go negative. But if
this warning is not consistent with other places we do refcounted
vmap/vunmap then feel free to ignore my suggestion.
Thanks!

>
> Best,
> Sumit.
> >
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Liam Mark <lmark@codeaurora.org>
> > Cc: Laura Abbott <labbott@kernel.org>
> > Cc: Brian Starkey <Brian.Starkey@arm.com>
> > Cc: Hridya Valsaraju <hridya@google.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Sandeep Patil <sspatil@google.com>
> > Cc: Daniel Mentz <danielmentz@google.com>
> > Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
> > Cc: =C3=98rjan Eide <orjan.eide@arm.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Ezequiel Garcia <ezequiel@collabora.com>
> > Cc: Simon Ser <contact@emersion.fr>
> > Cc: James Jones <jajones@nvidia.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Suggested-by: Suren Baghdasaryan <surenb@google.com>
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > ---
> >  drivers/dma-buf/heaps/cma_heap.c    | 1 +
> >  drivers/dma-buf/heaps/system_heap.c | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/c=
ma_heap.c
> > index 364fc2f3e499..0c76cbc3fb11 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -232,6 +232,7 @@ static void cma_heap_vunmap(struct dma_buf *dmabuf,=
 struct dma_buf_map *map)
> >         struct cma_heap_buffer *buffer =3D dmabuf->priv;
> >
> >         mutex_lock(&buffer->lock);
> > +       WARN_ON(buffer->vmap_cnt =3D=3D 0);
> >         if (!--buffer->vmap_cnt) {
> >                 vunmap(buffer->vaddr);
> >                 buffer->vaddr =3D NULL;
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heap=
s/system_heap.c
> > index 405351aad2a8..2321c91891f6 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -273,6 +273,7 @@ static void system_heap_vunmap(struct dma_buf *dmab=
uf, struct dma_buf_map *map)
> >         struct system_heap_buffer *buffer =3D dmabuf->priv;
> >
> >         mutex_lock(&buffer->lock);
> > +       WARN_ON(buffer->vmap_cnt =3D=3D 0);
> >         if (!--buffer->vmap_cnt) {
> >                 vunmap(buffer->vaddr);
> >                 buffer->vaddr =3D NULL;
> > --
> > 2.17.1
> >
