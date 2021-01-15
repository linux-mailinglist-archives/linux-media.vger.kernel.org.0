Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21C692F8648
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 21:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732249AbhAOUJE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 15:09:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731808AbhAOUJD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 15:09:03 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5FF7C061757
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 12:08:22 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id o10so14909772lfl.13
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 12:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d+EPX/VWpJj2Kmk5Q5zZssFSGXKhH2fYu5LFm+A3OQY=;
        b=C5L9mPrgwxor/EMphYQ64LokUxMeN+N+rbK2dWGM/Qh1lOeJDEPsje9APFkubFrqHb
         QOoGnTxBz/CKeTlpIO/8fq3SbUHJTjU0sF2IBLepYlKl/DnHD9nrPNHN9ICURYPBpUDf
         kBXVgzuIRwB5uMzYMJLi42nnNoVkrhS9oh60+W9V5hS/nkpkkD5oGlaDKcuBOfRpsFtb
         v/uCvYWxtqYbfsvi2Fd9xqrAXsfxpUzSwR7nbOp8QSEvTIBMGLJ8dGC39/8h9ZeVK3Z4
         nOC1FBjD+6pjGf+qvAfj7jTlM8r/XkFPH/TAgcPejJYc3XoVCWqhkjV6A9np6lmcVp2q
         7ViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d+EPX/VWpJj2Kmk5Q5zZssFSGXKhH2fYu5LFm+A3OQY=;
        b=hFHfVPAxSzYN74f4FzX9WdZvZrg17J2N7u1GxFiFemt2qs2fz4w4btyhMkb9ABA0Jq
         281QoHYzRbi9t1iv1CLQcnzylWXlBI/o2jsiuxb9qR4AKg3IVN6+oH1EySl6uqSA73r8
         nvZzYjXRSwK7+o7eon4N4h8UBByVa9iLpRedZo7YaeRO/8Dtx/+YeyBx5iT1vHgsKg/d
         W3DpBhaINViViVWyFjU47Idok/bF3nhtJ9L/3aYmw6xzcvNbkjhuPXs4fz/O8rtKmZGa
         TLI4I0Mto0RG5MOWdYgJ/Td6ovETX3sJDH8blQupaClJs+AriTyg2kknPuduG8jkD36C
         8VGA==
X-Gm-Message-State: AOAM530u30p49Eq6iz2XrqEdh+XgA7WH4NPQFeSwOxZbIvxmBigiDuXs
        y5/HoEr5mIV5g84XFNzjWGwSiSNDFeSY7Z0nVivDBg==
X-Google-Smtp-Source: ABdhPJxS56/W58MCPOSvN37WwT8INoO+4zH5jbgEoeT9FfCMxK+CD/sf82tE0Sa+/3PBj/nmCYe8JiYSQ1eKWJ5BX8Y=
X-Received: by 2002:ac2:5145:: with SMTP id q5mr5808847lfd.626.1610741301404;
 Fri, 15 Jan 2021 12:08:21 -0800 (PST)
MIME-Version: 1.0
References: <20210113140604.3615437-1-daniel.vetter@ffwll.ch>
 <161055261490.6195.7986280621869334351@build.alporthouse.com>
 <CAKMK7uEnnEj_YAR5Tm3jpS7MNPkqB43JBhQnY_K0YQ+LE9wL1g@mail.gmail.com>
 <161057213487.6195.581396740566956696@build.alporthouse.com> <CAKMK7uGXtu0V8TVaQ2XyuE9vOdJOWKrCYUNkh0FJMfucSyS2vg@mail.gmail.com>
In-Reply-To: <CAKMK7uGXtu0V8TVaQ2XyuE9vOdJOWKrCYUNkh0FJMfucSyS2vg@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 15 Jan 2021 12:08:10 -0800
Message-ID: <CALAqxLWedYkMiYA750e6vCw6q52XxjwEMNm4h7b67FexQEemtg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm-buf: Add debug option
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Chris Wilson <chris@chris-wilson.co.uk>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?moderated_list=3ADMA_BUFFER_SHARING_FRAMEWORK_=3Clinaro=2Dmm=2Dsig=40l?=
         =?UTF-8?Q?ists=2Elinaro=2Eorg=3E=2C_David_Stevens_=3Cstevensd=40chromium=2Eorg=3E=2C_Dan?=
         =?UTF-8?Q?iel_Vetter_=3Cdaniel=2Evetter=40intel=2Ecom=3E=2C_Christian_K=C3=B6nig_=3Cchri?=
         =?UTF-8?Q?stian=2Ekoenig=40amd=2Ecom=3E=2C_open_list=3ADMA_BUFFER_SHARING_FRAMEWOR?=
         =?UTF-8?Q?K?= <linux-media@vger.kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Hridya Valsaraju <hridya@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 14, 2021 at 1:03 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Wed, Jan 13, 2021 at 10:08 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > Quoting Daniel Vetter (2021-01-13 20:50:11)
> > > On Wed, Jan 13, 2021 at 4:43 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > > >
> > > > Quoting Daniel Vetter (2021-01-13 14:06:04)
> > > > > We have too many people abusing the struct page they can get at but
> > > > > really shouldn't in importers. Aside from that the backing page might
> > > > > simply not exist (for dynamic p2p mappings) looking at it and using it
> > > > > e.g. for mmap can also wreak the page handling of the exporter
> > > > > completely. Importers really must go through the proper interface like
> > > > > dma_buf_mmap for everything.
> > > >
> > > > If the exporter doesn't want to expose the struct page, why are they
> > > > setting it in the exported sg_table?
> > >
> > > You need to store it somewhere, otherwise the dma-api doesn't work.
> > > Essentially this achieves clearing/resetting the struct page pointer,
> > > without additional allocations somewhere, or tons of driver changes
> > > (since presumably the driver does keep track of the struct page
> > > somewhere too).
> >
> > Only for mapping, and that's before the export -- if there's even a
> > struct page to begin with.
> >
> > > Also as long as we have random importers looking at struct page we
> > > can't just remove it, or crashes everywhere. So it has to be some
> > > debug option you can disable.
> >
> > Totally agreed that nothing generic can rely on pages being transported
> > via dma-buf, and memfd is there if you do want a suitable transport. The
> > one I don't know about is dma-buf heap, do both parties there consent to
> > transport pages via the dma-buf? i.e. do they have special cases for
> > import/export between heaps?
>
> heaps shouldn't be any different wrt the interface exposed to
> importers. Adding John just in case I missed something.

I'm not aware of how this would be an issue right off for dma-buf
heaps. Obviously there may be some corner cases with things like
secure heaps, but I've not gotten to work on any of those yet and
there's none in-tree.  I did test out the patch on HiKey960 (using the
cma and system heap for display and gpu buffers - admittedly not
particularly complex) and didn't see any issues with it enabled.

I've added Suren and Hridya for more input but don't have any
objections right off.

thanks
-john
