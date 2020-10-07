Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 302FB285F98
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 14:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbgJGM6p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 08:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728240AbgJGM6p (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 08:58:45 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB0FC0613D3
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 05:58:45 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id l4so2067141ota.7
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2020 05:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RqJhQ9wl4HnfFJba5qafgVA83HvKuODOv14/VuzQKBc=;
        b=HLP5cVy/+ivPAr8S6VW2DODWQvroNZFg7BttjeOcbezz6CNNniUIHSIARYKF8Ijk1T
         rmy9z7yE9flAapP4YSBu9HIymzY2iBki4HzaALq9rM2UBFkXQlEaW3TvVZzqH2LSayDe
         1rPcp7GgFX99YVk0vI8HYbxifKX0pBDMeSfv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RqJhQ9wl4HnfFJba5qafgVA83HvKuODOv14/VuzQKBc=;
        b=O7AxqkUzlMLG67yvpKOCHaBclCYYZoUGGH7RbKl2W27+nzwbfkk5PHrcKqRLsvIN/p
         DglbIQ2AJbQYKb8aiBwPumyOO8mv6vZGfiHzKeLr4LpkTEKy50cwjQWhOYCYCa8C2zI9
         9nsPV3oOv0q6OdWEMTmNcFnCie0wgZAGbE8hiyjtGizH37dzegLy0JdBHbd6njah2FUB
         JcHSTk0wyyquUyt/A1mNm3Q9hCrxCmMp6gyw39l2anvUaxcQ7aAXZ0wny6d+IdAQDfah
         09N8XtyWu+1Pjc+5CEKiXflQRMYxuLRrmORImwA2JrI02CdhVIkFgQuevcrAVUnDoiZ2
         F22Q==
X-Gm-Message-State: AOAM532dXIFPhWeM2CFAG9WvbnHg5eW2QlrvLyVXgV6NVGgoly6VbZyJ
        Fw0DIiOphTjWTNQV7CP71jA+cFLlYO2BDBz/gsnrug==
X-Google-Smtp-Source: ABdhPJwvOqDF0PtNvyjRy9NUPdpqckHeo5Pb4aBKzEFyLCyusu6A+MJ6CRQQIQu70npKdaR3NW8xVD0BDZv4+5HBzkA=
X-Received: by 2002:a05:6830:1e56:: with SMTP id e22mr1696603otj.303.1602075524433;
 Wed, 07 Oct 2020 05:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch> <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca> <CGME20201003094038eucas1p12aaafe0f52a7747bc2ba95ccb91d1651@eucas1p1.samsung.com>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <d2f8e8a7-614d-18c8-9e2a-c604e5e54ce6@samsung.com> <CAKMK7uF+a1PSn+e-6F+YhkSXn9vC7etS-z0AFBMCU+Vzb2PwqA@mail.gmail.com>
 <725819e9-4f07-3f04-08f8-b6180406b339@samsung.com> <20201007124409.GN5177@ziepe.ca>
 <CAAFQd5D0ahP-3hp_vGEmJ2cyBOMXeW9HX5yKaVPcQTsFwwOE8Q@mail.gmail.com>
In-Reply-To: <CAAFQd5D0ahP-3hp_vGEmJ2cyBOMXeW9HX5yKaVPcQTsFwwOE8Q@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 7 Oct 2020 14:58:33 +0200
Message-ID: <CAKMK7uG3fds79Yf9VhMstnJ2+UHYUEVdODkoOvtwFC28_+T6RA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Pawel Osciak <pawel@osciak.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Oded Gabbay <oded.gabbay@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 7, 2020 at 2:48 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Wed, Oct 7, 2020 at 2:44 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Wed, Oct 07, 2020 at 02:33:56PM +0200, Marek Szyprowski wrote:
> > > Well, it was in vb2_get_vma() function, but now I see that it has been
> > > lost in fb639eb39154 and 6690c8c78c74 some time ago...
> >
> > There is no guarentee that holding a get on the file says anthing
> > about the VMA. This needed to check that the file was some special
> > kind of file that promised the VMA layout and file lifetime are
> > connected.
> >
> > Also, cloning a VMA outside the mm world is just really bad. That
> > would screw up many assumptions the drivers make.
> >
> > If it is all obsolete I say we hide it behind a default n config
> > symbol and taint the kernel if anything uses it.
> >
> > Add a big comment above the follow_pfn to warn others away from this
> > code.
>
> Sadly it's just verbally declared as deprecated and not formally noted
> anyway. There are a lot of userspace applications relying on user
> pointer support.

userptr can stay, it's the userptr abuse for zerocpy buffer sharing
which doesn't work anymore. At least without major surgery (you'd need
an mmu notifier to zap mappings and recreate them, and that pretty
much breaks the v4l model of preallocating all buffers to make sure we
never underflow the buffer queue). And static mappings are not coming
back I think, we'll go ever more into the direction of dynamic
mappings and moving stuff around as needed.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
