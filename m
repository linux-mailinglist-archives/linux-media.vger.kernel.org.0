Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D16F3BF050
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 21:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232412AbhGGTiT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 15:38:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232351AbhGGTiS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 15:38:18 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF12C061574
        for <linux-media@vger.kernel.org>; Wed,  7 Jul 2021 12:35:36 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id r26so7066797lfp.2
        for <linux-media@vger.kernel.org>; Wed, 07 Jul 2021 12:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8r2Sihww/r2eDq532jyXn6fdk4Gdh3BwgDNIfLgaV/E=;
        b=MszDYgh+2NKqhOHbW6T5LEDSW9GergXNfLJILyRlimCcLRDhvW35rAjdXYDUOohkVo
         wHdpvCXENIyxge/RR1xi+LcJozdm2KYSM6ty7uAy2OpcI06vVjK12HCKxqbEndRHk9Cb
         TyANaMtKc4b6zf+KsQEe8ku5flehh9j9ipk0jUaKUQeixBjw+ghFN2nGBgUAoSXGVVb2
         CAoq/zr7DNXYTeimJi4DXHo1zfyu3X1Kk3MwEbq+p+GDEsObLp2GImtWTJWiuPHkHTgo
         cU34/ShPKF6Rem9Fo1O4//yhd3uepwZYFdVbHvlE2UK2DWipfOsqxfPEw9toHb8HxW6H
         0kZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8r2Sihww/r2eDq532jyXn6fdk4Gdh3BwgDNIfLgaV/E=;
        b=A3E/QKczL6MLnO+pOoKTIG8nAnOKaDj6Btu8C/HkmRBxFdzujXTBpgUMSa7dm6uezh
         h5CPseWbnmghyrQgTw3uvRDIYyRESHJqokUY6Oo6WgqP48oQJ+guiojrmU8p2v9kTh8M
         90E3INEDXpmOGVsY5a1lJ80dDwGgK2nTbHoSUJfHKGRfZIJM4CNW+sWz1sBrnRG0ewbS
         VVPuTHXhYTew5OO2DssdGn1qTak+DMYNum9C26RE7H/624PrmxLYzKAal7qVThND976B
         7QUiY6vbatQeMD3I9i+fZKDrXbr/0A8OChORMDYZIHTdZoD7tC1neuVgF8knZum+L3zo
         Xbyg==
X-Gm-Message-State: AOAM531DrVLtCaRngDBq+6jDIKjr09Ksapfi/ASrUG5lJztmnFyjAr72
        07XwzpPUCUWPmdz3J0c+Pdr/La5/iPpk58i3sLngHw==
X-Google-Smtp-Source: ABdhPJzq0vYBbcbRJcpJ1wm18X49R0cZKa1F2pwLnWsMpB+SU+peQArLpyP1JAM9LeGI4+7Rz1ZU9cgjkoNN3RCUOQg=
X-Received: by 2002:a05:6512:2246:: with SMTP id i6mr11859231lfu.7.1625686534805;
 Wed, 07 Jul 2021 12:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210630013421.735092-1-john.stultz@linaro.org>
 <20210630013421.735092-2-john.stultz@linaro.org> <YOVL1f4m+8ly9fyM@infradead.org>
In-Reply-To: <YOVL1f4m+8ly9fyM@infradead.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 7 Jul 2021 12:35:23 -0700
Message-ID: <CALAqxLUubzuLkFxmWjfPQHaFU8EkWuGo7nDhfkgi4wPGHnBoVw@mail.gmail.com>
Subject: Re: page pools, was Re: [PATCH v9 1/5] drm: Add a sharable drm
 page-pool implementation
To:     Christoph Hellwig <hch@infradead.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Christian Koenig <christian.koenig@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        "??rjan Eide" <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Mel Gorman <mgorman@suse.de>, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 6, 2021 at 11:38 PM Christoph Hellwig <hch@infradead.org> wrote:
> On Wed, Jun 30, 2021 at 01:34:17AM +0000, John Stultz wrote:
> > This adds a shrinker controlled page pool, extracted
> > out of the ttm_pool logic, and abstracted out a bit
> > so it can be used by other non-ttm drivers.
>
> Can you explain in detail why you need a differnt page pool over the one
> maintained by the page allocator?  Fragmenting the memory into all kinds
> of pools has lots of downsides, so the upsides need to be explained in
> detail.

So, as Christian mentioned, on the TTM side it's useful, as they are
trying to avoid TLB flushes when changing caching attributes.

For the dmabuf system heap purposes, the main benefit is moving the
page zeroing to the free path, rather than the allocation path. This
on its own doesn't save much, but allows us to defer frees (and thus
the zeroing) to the background, which can get that work out of the hot
path.

thanks
-john
