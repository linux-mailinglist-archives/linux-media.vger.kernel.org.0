Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8137B306C9E
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 06:12:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbhA1FLK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 00:11:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbhA1FLJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 00:11:09 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DA14C06174A
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 21:10:29 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id l12so4830337ljc.3
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 21:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sbySH8XGPeHypTQ5quW2/0H5BDl8PiMEsgfEVwoeeI4=;
        b=v0WZgt/3pzp9gQrGDilRFIBE1VUrEj5i/gJgcppmH3N0+htGlb9glkmXh3fwsYmhuP
         R6ECXFmWEz2+t1PvqYqX/zbAXF8r4adCx76XaHJ58SkfJBZv1a37Opmw51U3trAcpIVa
         lieq/+F1l/t+XzOMWdb4kHGdt5Zb9iNi1y5n6hypaEiM4Xg6SBpEWhfMbjaazGgPAsep
         QxaQmDK+zITPVJazdV73+6W/LKHoL0yqrYMQFOM5kO0dWKCMatbPTDyu7tztCEyGu1it
         Zb4/Tx7o02upoGqTw3eVhy0wLaOnB/J6f3dENS44UJtFqQnTtCt2tnNREYGnxahSLvBe
         e26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sbySH8XGPeHypTQ5quW2/0H5BDl8PiMEsgfEVwoeeI4=;
        b=fayhwPUuQ3jDvTvt3Ab/LAdekAQFzFkRm+7p6VmGNyIv+azgjee6s10ezo1Iz9kNro
         KxQMMmWS1oJ9pDJ77t9GNu5QBbSDgSw3/uh37TkspyJTBDbWR0eAHBw9g8VrVbld3ufr
         3zGx4wIqXmfm3ozO5Z4WuIRidEgji7Alc/lSuqoOZQQe+LcLPmhh6MJaTBubU4zr3TKx
         hNjmMLEP9xlt6PgVquYOo1ZNfmR8U7toRSUyD9Et6RSvA72OKPceyNYrwWrNSZISIXa0
         MZf51AYZyXM/aZTKD3FD+S3/lY3/+J23Zm81eNDzPBccPX7ECcMYon0Y0PNUec4i2tJD
         OT/Q==
X-Gm-Message-State: AOAM5321EI/3HhvGEmBOWl2quyuAmT2CSopWkDkwIV3RUHXLy6xns3Hz
        pDArj8pEiqGaeDAtHPnk9NdK4QdA7l8fRE918KRorA==
X-Google-Smtp-Source: ABdhPJznnuALUFQ1RiOUQHbEpehWn9tdXxnoDjOzm3PmzFN7h8qtoK4IQ8LF9kFVl7tGyMalI6DJbeyAdOeLxNsPcCI=
X-Received: by 2002:a2e:3018:: with SMTP id w24mr7835128ljw.333.1611810627528;
 Wed, 27 Jan 2021 21:10:27 -0800 (PST)
MIME-Version: 1.0
References: <20210123034655.102813-1-john.stultz@linaro.org>
 <20210123034655.102813-2-john.stultz@linaro.org> <CAE2F3rA3a-MWBHPZhGP9dMhEUqMkkvm6wXYYh6LDZ1zF9CAyUg@mail.gmail.com>
In-Reply-To: <CAE2F3rA3a-MWBHPZhGP9dMhEUqMkkvm6wXYYh6LDZ1zF9CAyUg@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 27 Jan 2021 21:10:15 -0800
Message-ID: <CALAqxLWkTQwQ8Xqnc+PAMWUO_C84jaGzOLqKFqkuk3=AFNHD6g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dma-buf: system_heap: Add pagepool support to
 system heap
To:     Daniel Mentz <danielmentz@google.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 27, 2021 at 12:21 PM Daniel Mentz <danielmentz@google.com> wrote:
>
> On Fri, Jan 22, 2021 at 7:47 PM John Stultz <john.stultz@linaro.org> wrote:
> > +static int system_heap_clear_pages(struct page **pages, int num, pgprot_t pgprot)
> > +{
> > +       void *addr = vmap(pages, num, VM_MAP, pgprot);
> > +
> > +       if (!addr)
> > +               return -ENOMEM;
> > +       memset(addr, 0, PAGE_SIZE * num);
> > +       vunmap(addr);
> > +       return 0;
> > +}
>
> I thought that vmap/vunmap are expensive, and I am wondering if
> there's a faster way that avoids vmap.
>
> How about lifting this code from lib/iov_iter.c
> static void memzero_page(struct page *page, size_t offset, size_t len)
> {
>         char *addr = kmap_atomic(page);
>         memset(addr + offset, 0, len);
>         kunmap_atomic(addr);
> }
>
> Or what about lifting that code from the old ion_cma_heap.c
>
> if (PageHighMem(pages)) {
>         unsigned long nr_clear_pages = nr_pages;
>         struct page *page = pages;
>
>         while (nr_clear_pages > 0) {
>                 void *vaddr = kmap_atomic(page);
>
>                 memset(vaddr, 0, PAGE_SIZE);
>                 kunmap_atomic(vaddr);
>                 page++;
>                 nr_clear_pages--;
>         }
> } else {
>         memset(page_address(pages), 0, size);
> }

Though, this last memset only works since CMA is contiguous, so it
probably needs to always do the kmap_atomic for each page, right?

I'm still a little worried if this is right, as the current
implementation with the vmap comes from the old ion_heap_sglist_zero
logic, which similarly tries to batch the vmaps  32 pages at at time,
but I'll give it a try.

thanks
-john
