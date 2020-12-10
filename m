Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 208DA2D5309
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 06:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgLJFJS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 00:09:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbgLJFJL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 00:09:11 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EACDAC061793
        for <linux-media@vger.kernel.org>; Wed,  9 Dec 2020 21:08:30 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id k4so4127832edl.0
        for <linux-media@vger.kernel.org>; Wed, 09 Dec 2020 21:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zIfFQBOsh+7ls9naclLfM4tNpPscvjI/PilgL+vju80=;
        b=OJwNzSYc2vCkYXbkQd7LaHDTEMYMM5zXanNUx+E3D/B5JMCvXpeln9sFRbAtrO0NNr
         Izz7NOcf8psUjJddvGEXsi13gr9RKws2ogr0RKU/WmwdiD/UcxAep/TcH7HnZ2LkzsgN
         lp6FPFsI3g81m6nM8MV7t4CUPWDM12b8EnOx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zIfFQBOsh+7ls9naclLfM4tNpPscvjI/PilgL+vju80=;
        b=pq7PUps/FVxjMjHQDVPkExFfsIxaC27YaLu6Pk8T/5d2VAQWGUuj+cTMvYM7yhv4aB
         xVxEqSc/YCBYr21GDt+rW07qmSSL7TY5pHae6sIkx23j4w1ntlcV/ToCQUjde+HBoe3u
         piHCUfQN0XSgTcvkAxtuoBz68LeHXIyQ+E+kdgGVZPJV7T898kuZGJNcv49a1xUaqHnO
         QLbPx1G01p1mU+tsvq2vpFsPIxV75gktCQnHq7dblM+bkgKSgNobCVn2UacTlMoU8L8m
         uNZoWwDDVO8uTtozFGybeZVnb02fW0l4j2ijdKggKF9BZKstsZkjO3XLu+xEGDIkrLiA
         rY+w==
X-Gm-Message-State: AOAM53309pGScxBNIQHKNsiDmRj39iXReLC7IKjz35X6/pM8ypia1uoq
        IizT4iE0mYndONTFU2eIfRs8eoWyMyHmNV0Q
X-Google-Smtp-Source: ABdhPJx0nrQ3OHzMgDEYOdWsINxcQw+gv+S49qlxEvErMFohX7ebPAN+qW3FoXxKgUpPib9V2A1Qyg==
X-Received: by 2002:a05:6402:b88:: with SMTP id cf8mr5242686edb.140.1607576909447;
        Wed, 09 Dec 2020 21:08:29 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id k15sm3326939ejc.79.2020.12.09.21.08.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Dec 2020 21:08:25 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id g25so2064210wmh.1
        for <linux-media@vger.kernel.org>; Wed, 09 Dec 2020 21:08:25 -0800 (PST)
X-Received: by 2002:a1c:5447:: with SMTP id p7mr6054359wmi.116.1607576905237;
 Wed, 09 Dec 2020 21:08:25 -0800 (PST)
MIME-Version: 1.0
References: <20201125221917.150463-1-ribalda@chromium.org> <20201130083410.GD32234@lst.de>
 <20201201033658.GE3723071@google.com> <20201201144916.GA14682@lst.de>
 <CAAFQd5BBEbmENrrZ-vMK9cKOap19XWmfcxwrxKfjWx-wEew8rg@mail.gmail.com>
 <20201209111235.GA22806@lst.de> <6b34596d-34c4-bd99-c5a7-5a4742c5b886@arm.com>
In-Reply-To: <6b34596d-34c4-bd99-c5a7-5a4742c5b886@arm.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 10 Dec 2020 14:08:14 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CJreyn7KSn-kphPzC5v18qCuBq5yGwW+ushrg=azJGRg@mail.gmail.com>
Message-ID: <CAAFQd5CJreyn7KSn-kphPzC5v18qCuBq5yGwW+ushrg=azJGRg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
To:     Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
Cc:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 9, 2020 at 10:05 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-12-09 11:12, Christoph Hellwig wrote:
> > On Tue, Dec 08, 2020 at 01:54:00PM +0900, Tomasz Figa wrote:
> >> >From the media perspective, it would be good to have the vmap
> >> optional, similarly to the DMA_ATTR_NO_KERNEL_MAPPING attribute for
> >> coherent allocations. Actually, in the media drivers, the need to have
> >> a kernel mapping of the DMA buffers corresponds to a minority of the
> >> drivers. Most of them only need to map them to the userspace.
> >>
> >> Nevertheless, that minority actually happens to be quite widely used,
> >> e.g. the uvcvideo driver, so we can't go to the other extreme and just
> >> drop the vmap at all.
> >
> > My main problem is that the DMA_ATTR_NO_KERNEL_MAPPING makes a mess
> > of an API.  I'd much rather have low-level API that returns the
> > discontiguous allocations and another one that vmaps them rather
> > than starting to overload arguments like in dma_alloc_attrs with
> > DMA_ATTR_NO_KERNEL_MAPPING.

Okay, makes sense. Actually, a separate mapping function makes it
possible to defer creating the mapping to when (and if) it is really
needed.

>
> Agreed - if iommu-dma's dma_alloc_coherent() ends up as little more than
> a thin wrapper around those two functions I think that would be a good
> sign. It also seems like it might be a good idea for this API to use
> scatterlists rather than page arrays as it's fundamental format, to help
> reduce impedance with dma-buf -

True.

> if we can end up with a wider redesign
> that also gets rid of dma_get_sgtable(), all the better!

That would also require taking care of the old dma_alloc_attrs() API.
I guess it could return an already mapped sgtable, with only 1 mapped
entry and as many following entries as needed to describe the physical
pages. To be honest, I'd say this is far out of scope of this
discussion, though.

Best regards,
Tomasz
