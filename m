Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E90A8307BB4
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 18:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232875AbhA1RC5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 12:02:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232723AbhA1RBw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 12:01:52 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D23BC061573
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 09:01:11 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id p72so6253350iod.12
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 09:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gar8fBlSsZFzuxpXobcokllNvMKbpQD2Smckqot5AV0=;
        b=R3385CEDtxrszE24UXwkp0ZU2U/OxxdtH7/PIESlm6ZDdnLzURn5PTJpKHAz3HOjFV
         4jddEodBYlle4AtEzG4w+16LjwVOb8uZLdLeydFODHiifeRe1u+cD6DkQHyQ70QWZRDh
         sLAUPg5YB8to0myR+Mth92WbIszUnr71jwtds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gar8fBlSsZFzuxpXobcokllNvMKbpQD2Smckqot5AV0=;
        b=E+rrINApdzCWD+PTcTipesj/ULoPyCpBHsio6a6oLq3u7VV0j0ua8x4uHSyitvpG6k
         MSWta/gbQDAH7aXgH5628DX9vQAFXAh/6YPZrHjO+jTkbuU5OEklVcHYzReZkdhtvDd4
         7QBsBZbFsk3atHEwwXPjdAB8nsemb+Qrpyns8AGx+YfSUoiDp9k5AG8a1lA3Rn487Eij
         GJ3dUjYZzErRiboJ4snLGAjO4ElR/2gGwEimuVj2Gx/HIW4KwAYTk3Xjv+109qLfdb7t
         vbzS9zafwAVFAOlUI8HtSX3pjw7tpSDMo+C5lWsQ3W0qh8pAD9NBPxJfwIyMssj0Zyu1
         r6iA==
X-Gm-Message-State: AOAM531d2+/YoYuMKypA2DwrZ3uCcvEWWLVm/BS9/AC2aO/rpi8GI+Z5
        DxxTruDXnsyISXXtoOkQlt+RrFewhvwXrJqZ
X-Google-Smtp-Source: ABdhPJz1zfn/ALOPKRPC4k1UZ2lqMOuv0QDBUeWyetBKfly8w8hbAB9k2zWDLJnaJk8JcrFrkJGjhA==
X-Received: by 2002:a02:ec5:: with SMTP id 188mr266376jae.20.1611853270530;
        Thu, 28 Jan 2021 09:01:10 -0800 (PST)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com. [209.85.166.43])
        by smtp.gmail.com with ESMTPSA id i72sm2736362ioa.6.2021.01.28.09.01.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 09:01:09 -0800 (PST)
Received: by mail-io1-f43.google.com with SMTP id u7so6264667iol.8
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 09:01:09 -0800 (PST)
X-Received: by 2002:a5d:9717:: with SMTP id h23mr506478iol.4.1611853268632;
 Thu, 28 Jan 2021 09:01:08 -0800 (PST)
MIME-Version: 1.0
References: <20210128145837.2250561-1-hch@lst.de> <20210128145837.2250561-7-hch@lst.de>
 <20210128150955.GA30563@lst.de>
In-Reply-To: <20210128150955.GA30563@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 28 Jan 2021 18:00:57 +0100
X-Gmail-Original-Message-ID: <CANiDSCtV8eiH7r6-mX3QhsYvJapqRfYufu4-iqmeiy6GiwwE_A@mail.gmail.com>
Message-ID: <CANiDSCtV8eiH7r6-mX3QhsYvJapqRfYufu4-iqmeiy6GiwwE_A@mail.gmail.com>
Subject: Re: [PATCH 6/6] media: uvcvideo: Use dma_alloc_noncontiguos API
To:     Christoph Hellwig <hch@lst.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI Christoph

Thanks for your comments

On Thu, Jan 28, 2021 at 4:09 PM Christoph Hellwig <hch@lst.de> wrote:
>
> I just included this patch as-is, but here are a few comments:
>
> On Thu, Jan 28, 2021 at 03:58:37PM +0100, Christoph Hellwig wrote:
> > +static void uvc_urb_dma_sync(struct uvc_urb *uvc_urb, bool for_device)
> > +{
> > +     struct device *dma_dev = dma_dev = stream_to_dmadev(uvc_urb->stream);
> > +
> > +     if (for_device)
> > +             dma_sync_sgtable_for_device(dma_dev, uvc_urb->sgt,
> > +                                         DMA_FROM_DEVICE);
> > +     else
> > +             dma_sync_sgtable_for_cpu(dma_dev, uvc_urb->sgt,
> > +                                      DMA_FROM_DEVICE);
> > +}
>
> Given that we vmap the addresses this also needs
> flush_kernel_vmap_range / invalidate_kernel_vmap_range calls for
> VIVT architectures.

We only read from the device to the cpu. Then can we run only
invalidate_kernel_vmap_range() ?

something like ?
else {
          dma_sync_sgtable_for_cpu(dma_dev, uvc_urb->sgt, DMA_FROM_DEVICE);
           invalidate_kernel_vmap_range(uvc_urb->buffer,
uvc_urb->stream->urb_size );
}

Thanks!






--
Ricardo Ribalda
