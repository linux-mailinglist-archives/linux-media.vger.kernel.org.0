Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6B442A7F17
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 13:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730429AbgKEMyi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 07:54:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbgKEMyi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 07:54:38 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C8E7C0613CF
        for <linux-media@vger.kernel.org>; Thu,  5 Nov 2020 04:54:36 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id s13so1508566wmh.4
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2020 04:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iR+CVMR9Igk+i7q6zQ360QpQoQUWwq9hKMxFO8Y7cGA=;
        b=bPPrnh4BjIGHxssI9in0eI8avIf6lVSA1Fd+jmaHNuJRYj4GLesWwatvAf+cWdJ1Gn
         +T1a9zT5WiAc7uq+YkZ1UAi9uQqINJcLFkN5pbawGR6HDSkkCEunVz0GKT5BPbCo522L
         G94YF8sd+EF3xMH5d9NYF5qFQjmBr4VXc5pXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iR+CVMR9Igk+i7q6zQ360QpQoQUWwq9hKMxFO8Y7cGA=;
        b=DjXf0TjGOb0Y4pTZSdscTLAGzcBApFZPiDvGel0qTtTp2BTqi2wPtCG+wmBJsXWgmj
         OF/lSm5dIBmeiqJVcZ2cEJscLZdxzor1zUPrqY8Onl0bkL5JgjONJCS2Kr7ydtxRazlp
         gfEJHokiVjMCJLuGjM2Q8yflLeMSPWoCPDdueUR35tlDC5m4LUPLcKqiy8UiMvelnfDm
         rzkqqfGgwWnOPSDEEmzv23NtPtE3sXNBEutvUO4AKKnvGZhEn/h9xNmTGesRUbSgFpw1
         fLiYrm3UAUGdN9m7KF5dXfNj4fX1x3fW12BykCj2Ml9VrUt0fNyD18rMRHgznSBV9vaY
         F+/w==
X-Gm-Message-State: AOAM532Q/Xwmtli85epaD7+qobSjxBjdMfll/o4EG54RDKz2qBM1lAFk
        u2ufH6L8rWtjt+p7iqcr9AXBGA==
X-Google-Smtp-Source: ABdhPJwrW3OjL7kR/bAr74WjxI8azvpsj46DeaIlccjHcQq2wan765xbIbWOOKK6+3jptMrcJuyztQ==
X-Received: by 2002:a1c:6843:: with SMTP id d64mr2670603wmc.131.1604580875284;
        Thu, 05 Nov 2020 04:54:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id m12sm2468188wrs.92.2020.11.05.04.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 04:54:34 -0800 (PST)
Date:   Thu, 5 Nov 2020 13:54:31 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        linux+etnaviv@armlinux.org.uk,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, yuq825@gmail.com,
        Ben Skeggs <bskeggs@redhat.com>, Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        steven.price@arm.com, alyssa.rosenzweig@collabora.com,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
        Hans de Goede <hdegoede@redhat.com>,
        Sean Paul <sean@poorly.run>, Eric Anholt <eric@anholt.net>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        ray.huang@amd.com, Sumit Semwal <sumit.semwal@linaro.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        luben.tuikov@amd.com, apaneers@amd.com, melissa.srw@gmail.com,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        amd-gfx@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        etnaviv@lists.freedesktop.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        lima@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        spice-devel@lists.freedesktop.org,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        xen-devel@lists.xenproject.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 09/10] dma-buf-map: Add memcpy and pointer-increment
 interfaces
Message-ID: <20201105125431.GW401619@phenom.ffwll.local>
References: <20201020122046.31167-1-tzimmermann@suse.de>
 <20201020122046.31167-10-tzimmermann@suse.de>
 <CACRpkdbvGWKo8y323actUJn9xXmxpgDw1EKLiPH4RqB_kFx=XQ@mail.gmail.com>
 <27acbd7e-d72e-4e05-c147-b50f56e21589@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27acbd7e-d72e-4e05-c147-b50f56e21589@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 05, 2020 at 11:37:08AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 05.11.20 um 11:07 schrieb Linus Walleij:
> > Overall I like this, just an inline question:
> > 
> > On Tue, Oct 20, 2020 at 2:20 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > 
> >> To do framebuffer updates, one needs memcpy from system memory and a
> >> pointer-increment function. Add both interfaces with documentation.
> > 
> > (...)
> >> +/**
> >> + * dma_buf_map_memcpy_to - Memcpy into dma-buf mapping
> >> + * @dst:       The dma-buf mapping structure
> >> + * @src:       The source buffer
> >> + * @len:       The number of byte in src
> >> + *
> >> + * Copies data into a dma-buf mapping. The source buffer is in system
> >> + * memory. Depending on the buffer's location, the helper picks the correct
> >> + * method of accessing the memory.
> >> + */
> >> +static inline void dma_buf_map_memcpy_to(struct dma_buf_map *dst, const void *src, size_t len)
> >> +{
> >> +       if (dst->is_iomem)
> >> +               memcpy_toio(dst->vaddr_iomem, src, len);
> >> +       else
> >> +               memcpy(dst->vaddr, src, len);
> >> +}
> > 
> > Are these going to be really big memcpy() operations?
> 
> Individually, each could be a scanline, so a few KiB. (4 bytes *
> horizontal resolution). Updating a full framebuffer can sum up to
> several MiB.
> 
> > 
> > Some platforms have DMA offload engines that can perform memcpy(),They could be
> > drivers/dma, include/linux/dmaengine.h
> > especially if the CPU doesn't really need to touch the contents
> > and flush caches etc.
> > An example exist in some MTD drivers that move large quantities of
> > data off flash memory like this:
> > drivers/mtd/nand/raw/cadence-nand-controller.c
> > 
> > Notice that DMAengine and DMAbuf does not have much in common,
> > the names can be deceiving.
> > 
> > The value of this varies with the system architecture. It is not just
> > a question about performance but also about power and the CPU
> > being able to do other stuff in parallel for large transfers. So *when*
> > to use this facility to accelerate memcpy() is a delicate question.
> > 
> > What I'm after here is if these can be really big, do we want
> > (in the long run, not now) open up to the idea to slot in
> > hardware-accelerated memcpy() here?
> 
> We currently use this functionality for the graphical framebuffer
> console that most DRM drivers provide. It's non-accelerated and slow,
> but this has not been much of a problem so far.
> 
> Within DRM, we're more interested in removing console code from drivers
> and going for the generic implementation.
> 
> Most of the graphics HW allocates framebuffers from video RAM, system
> memory or CMA pools and does not really need these memcpys. Only a few
> systems with small video RAM require a shadow buffer, which we flush
> into VRAM as needed. Those might benefit.
> 
> OTOH, off-loading memcpys to hardware sounds reasonable if we can hide
> it from the DRM code. I think it all depends on how invasive that change
> would be.

I wouldn't, all the additional locks this would pull in sound like
nightmare. And when an oops happens, this might be the only thing that
manages to get the oops to the user.

Unless someone really starts caring about fbcon acceleration I really
wouldn't bother. Ok maybe it also matters for fbdev, but the problem is
that the page fault intercepting alone is already expensive, so the only
real solution if you care about performance in that case is to use kms
natively, and use a dirty rectangle flip (or the DIRTY syscall).

And in there drivers should (and do) use any dma engines they have to
upload the frames already.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
