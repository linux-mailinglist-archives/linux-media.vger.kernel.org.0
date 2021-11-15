Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA32D450739
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 15:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236522AbhKOOlP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 09:41:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236608AbhKOOkR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 09:40:17 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA688C061767
        for <linux-media@vger.kernel.org>; Mon, 15 Nov 2021 06:37:20 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id y12so16390260eda.12
        for <linux-media@vger.kernel.org>; Mon, 15 Nov 2021 06:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=XiioWyqrq1D1dF9ZTugSJzsFvT/FPXCXiHcWrTggW1A=;
        b=FLdgxwJMdDUlwR0XKZUGvkuM2MNDSQ4GskVPXHQWieDno5xyhAkQ/RY6avWmujJ9BR
         OjFK/wuJ5u0TGea1y4NcILj+0ZBLckYJFooRvADUDIPpG12CBSoYlD1JXYloPbk/zK4c
         OX1wlFQSE1qbbROjeihgOQJAJ/lfWJLFcbRGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=XiioWyqrq1D1dF9ZTugSJzsFvT/FPXCXiHcWrTggW1A=;
        b=oHa8iDgkXBZVonoXkDPkT/CvAoXuu7zzMs4zx5JqK3lB0ezvG7i8J26bq90sFbSs1I
         8cNrDwLUKz/AJ/crdcy5kEWuxmiNIeO1LITXevDdrz/rRC5+FnLRpfk9cROjod7sT1fP
         I0nIiiyIZwFAPJxm65cLwfXvDaIPq/6WiPRU3tmvtPDZ+0woVnwohsw8XQhKssrfo2FD
         d0zSxpPseFwLg/Wu1pI9dFkkoOfdMT3W1fnBSTEaR2zJG2zt8+5wAd6ztQRgQwKXFW/r
         LV/ixh45YQHaAoxl4rN7n2jQkDp58Az8CGd8CfTe71mu5R1D8fm+ZbXDMTxsJDKMOlgt
         GI1g==
X-Gm-Message-State: AOAM532G4VS2XK59vqwUiLAxTGbyE4PZ11Gk8Umz3JnuA8E1FA72LUr2
        hLaDJK7+aptNTv7gAZYKVglHAQ==
X-Google-Smtp-Source: ABdhPJxXT/JTqH/P5/5MlVaHqEvS+WUgUgsUsgOfhK+nTHEXsPIZlCeVRsLARxXY95P+DTZWZPXr6g==
X-Received: by 2002:aa7:c155:: with SMTP id r21mr21275479edp.124.1636987039311;
        Mon, 15 Nov 2021 06:37:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id kw10sm6507786ejc.71.2021.11.15.06.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 06:37:18 -0800 (PST)
Date:   Mon, 15 Nov 2021 15:37:16 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org,
        Alexandru Ardelean <ardeleanalex@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 00/15] iio: buffer-dma: write() and new DMABUF based API
Message-ID: <YZJwnPbgCOdeKq6S@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
        Jonathan Cameron <jic23@kernel.org>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org,
        Alexandru Ardelean <ardeleanalex@gmail.com>,
        linux-media@vger.kernel.org
References: <20211115141925.60164-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115141925.60164-1-paul@crapouillou.net>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 15, 2021 at 02:19:10PM +0000, Paul Cercueil wrote:
> Hi Jonathan,
> 
> This patchset introduces a new userspace interface based on DMABUF
> objects, to complement the existing fileio based API.
> 
> The advantage of this DMABUF based interface vs. the fileio
> interface, is that it avoids an extra copy of the data between the
> kernel and userspace. This is particularly userful for high-speed
> devices which produce several megabytes or even gigabytes of data per
> second.
> 
> The first few patches [01/15] to [03/15] are not really related, but
> allow to reduce the size of the patches that introduce the new API.
> 
> Patch [04/15] to [06/15] enables write() support to the buffer-dma
> implementation of the buffer API, to continue the work done by
> Mihail Chindris.
> 
> Patches [07/15] to [12/15] introduce the new DMABUF based API.
> 
> Patches [13/15] and [14/15] add support for cyclic buffers, only through
> the new API. A cyclic buffer will be repeated on the output until the
> buffer is disabled.
> 
> Patch [15/15] adds documentation about the new API.
> 
> For now, the API allows you to alloc DMABUF objects and mmap() them to
> read or write the samples. It does not yet allow to import DMABUFs
> parented to other subsystems, but that should eventually be possible
> once it's wired.
> 
> This patchset is inspired by the "mmap interface" that was previously
> submitted by Alexandru Ardelean and Lars-Peter Clausen, so it would be
> great if I could get a review from you guys. Alexandru's commit was
> signed with his @analog.com address but he doesn't work at ADI anymore,
> so I believe I'll need him to sign with a new email.

Why dma-buf? dma-buf looks like something super generic and useful, until
you realize that there's a metric ton of gpu/accelerator bagage piled in.
So unless buffer sharing with a gpu/video/accel/whatever device is the
goal here, and it's just for a convenient way to get at buffer handles,
this doesn't sound like a good idea.

Also if the idea is to this with gpus/accelerators then I'd really like to
see the full thing, since most likely at that point you also want
dma_fence. And once we talk dma_fence things get truly horrible from a
locking pov :-( Or well, just highly constrained and I get to review what
iio is doing with these buffers to make sure it all fits.

Cheers, Daniel

> 
> Cheers,
> -Paul
> 
> Alexandru Ardelean (1):
>   iio: buffer-dma: split iio_dma_buffer_fileio_free() function
> 
> Paul Cercueil (14):
>   iio: buffer-dma: Get rid of incoming/outgoing queues
>   iio: buffer-dma: Remove unused iio_buffer_block struct
>   iio: buffer-dma: Use round_down() instead of rounddown()
>   iio: buffer-dma: Enable buffer write support
>   iio: buffer-dmaengine: Support specifying buffer direction
>   iio: buffer-dmaengine: Enable write support
>   iio: core: Add new DMABUF interface infrastructure
>   iio: buffer-dma: Use DMABUFs instead of custom solution
>   iio: buffer-dma: Implement new DMABUF based userspace API
>   iio: buffer-dma: Boost performance using write-combine cache setting
>   iio: buffer-dmaengine: Support new DMABUF based userspace API
>   iio: core: Add support for cyclic buffers
>   iio: buffer-dmaengine: Add support for cyclic buffers
>   Documentation: iio: Document high-speed DMABUF based API
> 
>  Documentation/driver-api/dma-buf.rst          |   2 +
>  Documentation/iio/dmabuf_api.rst              |  94 +++
>  Documentation/iio/index.rst                   |   2 +
>  drivers/iio/adc/adi-axi-adc.c                 |   3 +-
>  drivers/iio/buffer/industrialio-buffer-dma.c  | 670 ++++++++++++++----
>  .../buffer/industrialio-buffer-dmaengine.c    |  42 +-
>  drivers/iio/industrialio-buffer.c             |  49 ++
>  include/linux/iio/buffer-dma.h                |  43 +-
>  include/linux/iio/buffer-dmaengine.h          |   5 +-
>  include/linux/iio/buffer_impl.h               |   8 +
>  include/uapi/linux/iio/buffer.h               |  30 +
>  11 files changed, 783 insertions(+), 165 deletions(-)
>  create mode 100644 Documentation/iio/dmabuf_api.rst
> 
> -- 
> 2.33.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
