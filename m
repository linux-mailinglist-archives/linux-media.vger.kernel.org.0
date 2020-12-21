Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF08D2E0255
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 23:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbgLUWJo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 17:09:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgLUWJo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 17:09:44 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F1ABC0613D6
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 14:09:03 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id y23so354328wmi.1
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 14:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=Kv6+mQ/2PR9Y/KxXUnGcTVCVLw1XND8pVr3hmrooxtw=;
        b=bXURP2LmkZg8fIIAV3AQ1ix/+TrCccX+pgpMEdTDOtAyRrAoIcaz7vjFYIfFF5vqtB
         fScpfzoozZ2OHDV1HEy4SG7y7bGok7OOey/N6hatW11QsOS4gIUGMin4BTbTqaQK4C4f
         hA3seveuaB4PBNmzqb/7sgGfcLxMWJtTDlGUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=Kv6+mQ/2PR9Y/KxXUnGcTVCVLw1XND8pVr3hmrooxtw=;
        b=AxPqGbSsyl4iluvNl5H/T2H0sfaRlfYbM1UzeofBLHpuPELuegSXxWFpYOu1xY6Aku
         TGFMYsKv7HV4lgVW0hvACl6z8N5da3F6P2OakZpQLZZtyQw99N0/E8Egal1pGELV4rJv
         fmDYjP9sLPRO2iUuLYKpn+/KHK50Fp9Bq9/AgIQnpFpTgPHRBVCgMJtyzsOHPetBDBOg
         Odiq9ys0MxmDFrwCtVLbaw7oNORnEidMZZUFlF3egZ2p3o7JHlFdg2XQBsqBZeiB/Qxx
         93M6l7yDmrFOVnSlnbt8YbulwMuhRwRpEILafsMSbcgat9p/q0QBz90RVDjIBKouHeDw
         Baug==
X-Gm-Message-State: AOAM530jsIVLRoCdRkxFw68u61STcmTyrBTomABeKNcKNVoxk1G5ABhU
        X6Z/dT8Pe5QPrt4/bMwsvSSq9w==
X-Google-Smtp-Source: ABdhPJw1cpWZY8Yn4zYH0KalUyHjvqfJLlKsUh5A1txhbBjhxrVKP9ag6vGkqqnOY7+6wx1+B8t0Ag==
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr18996235wmj.115.1608588542090;
        Mon, 21 Dec 2020 14:09:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id m5sm18056514wrz.18.2020.12.21.14.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 14:09:01 -0800 (PST)
Date:   Mon, 21 Dec 2020 23:08:59 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Sandeep Patil <sspatil@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Robin Murphy <robin.murphy@arm.com>,
        James Jones <jajones@nvidia.com>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Hridya Valsaraju <hridya@google.com>,
        =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
        linux-media <linux-media@vger.kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Daniel Mentz <danielmentz@google.com>
Subject: Re: [RFC][PATCH 2/3] dma-buf: system_heap: Add pagepool support to
 system heap
Message-ID: <X+Ec+xVhyIUa7IsJ@phenom.ffwll.local>
Mail-Followup-To: John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Sandeep Patil <sspatil@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Robin Murphy <robin.murphy@arm.com>,
        James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Hridya Valsaraju <hridya@google.com>,
        =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
        linux-media <linux-media@vger.kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Daniel Mentz <danielmentz@google.com>
References: <20201217230612.32397-1-john.stultz@linaro.org>
 <20201217230612.32397-2-john.stultz@linaro.org>
 <X9y+YZujWBTHMuH3@phenom.ffwll.local>
 <CALAqxLVtYVGSSYtFmMK6oM9JSEmY4RAXra89sECL2Z4YGPic0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLVtYVGSSYtFmMK6oM9JSEmY4RAXra89sECL2Z4YGPic0Q@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 18, 2020 at 05:16:56PM -0800, John Stultz wrote:
> On Fri, Dec 18, 2020 at 6:36 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Thu, Dec 17, 2020 at 11:06:11PM +0000, John Stultz wrote:
> > > Reuse/abuse the pagepool code from the network code to speed
> > > up allocation performance.
> > >
> > > This is similar to the ION pagepool usage, but tries to
> > > utilize generic code instead of a custom implementation.
> >
> > We also have one of these in ttm. I think we should have at most one of
> > these for the gpu ecosystem overall, maybe as a helper that can be plugged
> > into all the places.
> >
> > Or I'm kinda missing something, which could be since I only glanced at
> > yours for a bit. But it's also called page pool for buffer allocations,
> > and I don't think there's that many ways to implement that really :-)
> 
> Yea, when I was looking around the ttm one didn't seem quite as
> generic as the networking one, which more easily fit in here.

Oops, I didn't look that closely and didn't realize you're reusing the one
from net/core/.

> The main benefit for the system heap is not so much the pool itself
> (the normal page allocator is pretty good), as it being able to defer
> the free and zero the pages in a background thread, so the pool is
> effectively filled with pre-zeroed pages.
> 
> But I'll take another look at the ttm implementation and see if it can
> be re-used or the shared code refactored and pulled out somehow.

I think moving the page_pool from net into lib and using it in ttm might
also be an option. Lack of shrinker in the networking one might be a bit a
problem.

Also I guess the real fun will start if you pre-flush pages (after
zeroing) or use write-combined mode (which tends to be a real pain to
allocate). So for those I think we likely need more than just reusing the
one net/core has already.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
