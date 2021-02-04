Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E40BE30FE0C
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 21:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239971AbhBDUUw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 15:20:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239969AbhBDUUt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Feb 2021 15:20:49 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D735C06178B
        for <linux-media@vger.kernel.org>; Thu,  4 Feb 2021 12:20:09 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id k204so3489598oih.3
        for <linux-media@vger.kernel.org>; Thu, 04 Feb 2021 12:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wpgT6Yz8SEv8X0iAsr6guPodAvl5pFjIWmhOvi/hibA=;
        b=Xpi3ivwmVLdqOvs1N6dWfJPh+KUCL6ESv/15EWzkk0SYh5UrDZbnAFeuQ0LjKLDPJ7
         De9JuaYPvilTUPbN7e/X9v+MAUVlzWXjljZf3QA9W/YfZZpTGY/2YH7tJ7fp5LhhaJ1E
         TecADaHNqVMOJ3iZ/L1xhrSQ2gaVbYy3ceflA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wpgT6Yz8SEv8X0iAsr6guPodAvl5pFjIWmhOvi/hibA=;
        b=HtXz8C4mjpYFIX0xdGXd6vr0bMeUUjXJBet/Sc8yEfbvswLagwOHDNG4LK329Wm20e
         ksEpfoF8KbqJCCUtMCSwPOMFlgDtA9VJL+wFyWjS01zMkt9XUXTUGrL1eoK9j5B1WpMA
         ZC1YB9jE41WIO1nPWHzumhu5RYNBFwCLz8QOfGBV9Ikk+1kZtDtoeYY51uZ2OrZ6D7/1
         Ws/TtNgHuha9w/wzMwMJEd933Fnh1wXoNbfGXRQJBeHqAEuvJ5lkosighD+QecIWcETY
         vvbnLD7L/LNX0qczCDXAIgHg524V8YtbYorf0EtThmmPXKaD75aDmfKxDnZoI911orOC
         xEQw==
X-Gm-Message-State: AOAM5307HHWNTDAz/0GBsKVFKtTcwprp/aQwCmQxiSQlfaK4AacVgThR
        Dr0SHZ0tKFrkutiuFBTYx2Jms1sU75E7dP1xbJu+gw==
X-Google-Smtp-Source: ABdhPJx/eLdhIzXnP9kqJ04S5q7V3UVm0UNcMndwh3kT46QCp6BCgQGHr/UZJ84rtpMCXuoIRTD3gtusKXypuS6WNDw=
X-Received: by 2002:aca:4ac5:: with SMTP id x188mr845032oia.14.1612470008816;
 Thu, 04 Feb 2021 12:20:08 -0800 (PST)
MIME-Version: 1.0
References: <20210203211948.2529297-1-daniel.vetter@ffwll.ch>
 <20210204161339.GX4718@ziepe.ca> <CAKMK7uEZvEEQXQeM=t-7uZEvga2GMhctp=WQgeSetG0GKTRsHA@mail.gmail.com>
 <20210204183808.GY4718@ziepe.ca> <CAKMK7uFBzF00zTzAE5b7PJFUfmxp5ExbSQxfcOfd_P6dPm7k9A@mail.gmail.com>
 <20210204200918.GA4718@ziepe.ca>
In-Reply-To: <20210204200918.GA4718@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu, 4 Feb 2021 21:19:57 +0100
Message-ID: <CAKMK7uEU_TJEUF2go6WRuVn+=-DSD5kRw1beJhC_1Y4HTXbYVQ@mail.gmail.com>
Subject: Re: [PATCH] RFC: dma-buf: Require VM_SPECIAL vma for mmap
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 4, 2021 at 9:09 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Thu, Feb 04, 2021 at 08:59:59PM +0100, Daniel Vetter wrote:
>
> > So I think just checking for VM_PFNMAP after the vma is set up should
> > be enough to guarantee we'll only have pte_special ptes in there,
> > ever. But I'm not sure, this stuff all isn't really documented much
> > and the code is sometimes a maze (to me at least).
>
> Yes, that makes sense. VM_PFNMAP and !VM_MIXEDMAP seems like the right
> check after the VMA is populated
>
> But how do you stuff special pfns into a VMA outside the fault
> handler?

Many drivers we have don't have dynamic buffer management (kinda
overkill for a few framebuffers on a display-only IP block), so the
just remap_pfn_range on ->mmap, and don't have a fault handler at all.

Or I'm not understanding what you're asking?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
