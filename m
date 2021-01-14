Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A791A2F5CD1
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 10:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727630AbhANJDw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 04:03:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbhANJDt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 04:03:49 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B1A4C061786
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 01:03:09 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id 9so5229491oiq.3
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 01:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M2SpU3YtVk3fHAkyH4YoVmkExKtr/aqdhNIMU89mM+s=;
        b=MPLkDIH277s12ooEyh6vtprpn/MHJyXZ9viUdtEkfJtl9Dv+Shy8pUusFQZdrDMKf9
         sbsf+q8Cllce6TZulonndTmYO2effkUz48KmCkXaNXyz1RMNCwJc7HUclN2UO3LtVUnG
         +/jOxySXEAV8smcy4tt8HDihtb+AGeL1/SPSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M2SpU3YtVk3fHAkyH4YoVmkExKtr/aqdhNIMU89mM+s=;
        b=lIZpdRbkgGSQzNa2PnyAcwxZ2S4Hr7Cgow8rLgev+ruvTuocaZ0ejM4K0LyXOG058r
         r1kd/167Qgf1kvPqPJzLbAdKX0OdzCPBMGPplbYX7dVzyyxnRFS+FK+NQSI5l9oCxQ4l
         j+4OoP1FcpF0oN0uUWvL3kj946unqkzHRDfC0DVgP1w/7HMRaVA6UDbbGhqOQoAgVYVc
         wILaiey+G/6J7bug5obY7SNGWx536P7pG1QM9+3AXtOMXwmfZcvOl2qrrKViTGZTkT/I
         xwpIhoRxFOjKJ+38yxPdUy/yKYfZMx03B1UTZQvcWmIsl7ijqf7Rz65LnzHAH+4ZoSTU
         /wvg==
X-Gm-Message-State: AOAM530nsDaAPyz2DZIdb9nEuYxtJDqGLNTJ02mQuDRcm9t2BlOBu4ap
        RQC/v9fQwuBpUQg8yOu5exRPRmji9j1MeGpxwaRSsvaVSeRoww==
X-Google-Smtp-Source: ABdhPJw/NLDHmJl3LpZPy4aab7MitydGFYAGaqJqX+iuigNroRxFyWQFXHlqsKYoFzfs/iuXSPj9sasgK8V7p03TLPg=
X-Received: by 2002:aca:4d08:: with SMTP id a8mr2031999oib.128.1610614988755;
 Thu, 14 Jan 2021 01:03:08 -0800 (PST)
MIME-Version: 1.0
References: <20210113140604.3615437-1-daniel.vetter@ffwll.ch>
 <161055261490.6195.7986280621869334351@build.alporthouse.com>
 <CAKMK7uEnnEj_YAR5Tm3jpS7MNPkqB43JBhQnY_K0YQ+LE9wL1g@mail.gmail.com> <161057213487.6195.581396740566956696@build.alporthouse.com>
In-Reply-To: <161057213487.6195.581396740566956696@build.alporthouse.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu, 14 Jan 2021 10:02:57 +0100
Message-ID: <CAKMK7uGXtu0V8TVaQ2XyuE9vOdJOWKrCYUNkh0FJMfucSyS2vg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm-buf: Add debug option
To:     Chris Wilson <chris@chris-wilson.co.uk>,
        John Stultz <john.stultz@linaro.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?moderated_list=3ADMA_BUFFER_SHARING_FRAMEWORK_=3Clinaro=2Dmm=2Dsig=40l?=
         =?UTF-8?Q?ists=2Elinaro=2Eorg=3E=2C_David_Stevens_=3Cstevensd=40chromium=2Eorg=3E=2C_Dan?=
         =?UTF-8?Q?iel_Vetter_=3Cdaniel=2Evetter=40intel=2Ecom=3E=2C_Christian_K=C3=B6nig_=3Cchri?=
         =?UTF-8?Q?stian=2Ekoenig=40amd=2Ecom=3E=2C_open_list=3ADMA_BUFFER_SHARING_FRAMEWOR?=
         =?UTF-8?Q?K?= <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 13, 2021 at 10:08 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> Quoting Daniel Vetter (2021-01-13 20:50:11)
> > On Wed, Jan 13, 2021 at 4:43 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > >
> > > Quoting Daniel Vetter (2021-01-13 14:06:04)
> > > > We have too many people abusing the struct page they can get at but
> > > > really shouldn't in importers. Aside from that the backing page might
> > > > simply not exist (for dynamic p2p mappings) looking at it and using it
> > > > e.g. for mmap can also wreak the page handling of the exporter
> > > > completely. Importers really must go through the proper interface like
> > > > dma_buf_mmap for everything.
> > >
> > > If the exporter doesn't want to expose the struct page, why are they
> > > setting it in the exported sg_table?
> >
> > You need to store it somewhere, otherwise the dma-api doesn't work.
> > Essentially this achieves clearing/resetting the struct page pointer,
> > without additional allocations somewhere, or tons of driver changes
> > (since presumably the driver does keep track of the struct page
> > somewhere too).
>
> Only for mapping, and that's before the export -- if there's even a
> struct page to begin with.
>
> > Also as long as we have random importers looking at struct page we
> > can't just remove it, or crashes everywhere. So it has to be some
> > debug option you can disable.
>
> Totally agreed that nothing generic can rely on pages being transported
> via dma-buf, and memfd is there if you do want a suitable transport. The
> one I don't know about is dma-buf heap, do both parties there consent to
> transport pages via the dma-buf? i.e. do they have special cases for
> import/export between heaps?

heaps shouldn't be any different wrt the interface exposed to
importers. Adding John just in case I missed something.

I think the only problem we have is that the first import for ttm
simply pulled out the struct page and ignored the sgtable otherwise,
then that copypasted to places and we're still have some of that left.
Although it's a lot better. So largely the problem is importers being
a bit silly.

I also think I should change the defaulty y to default y if
DMA_API_DEBUG or something like that, to make sure it's actually
enabled often enough.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
