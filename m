Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDB872A860B
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 19:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730973AbgKESYz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 13:24:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728523AbgKESYy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 13:24:54 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45434C0613D2
        for <linux-media@vger.kernel.org>; Thu,  5 Nov 2020 10:24:54 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id k18so2544704wmj.5
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2020 10:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7e8j21DIlVBcunOHbbwXMePhmrXVH5+IQyI8wkPXuKI=;
        b=zbOOCp73xw34Lh9ZE9TmMA17YqxGcG/n++dEYWrXi9dqE1MOd0lEYj1vvi+UNj9QUQ
         90lixqIWlw9UB6wc0PrwkjTCKT1+fi4eU5o9FOJa/uxXVDX4fXv6frcTQ0mf/t0UsWkd
         0EN+1xr8MAL6U/VtZ+d7h8NNR/glGlfmPFguvEacM6hMsXANML7oKQ6BSp02R7Lp5C3V
         MWHYT9DB3OhymND7jnk6G68pw69bodQQf/HsG/77bvSA3n47x2JVL9J1TH4tAs0ErvBk
         runK6vWTCca3VQCIQVr/ARVEAdg4c3GzpSYqYbVg+b3R0XPgJ+et8BXxm/gMGiActXg2
         A7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7e8j21DIlVBcunOHbbwXMePhmrXVH5+IQyI8wkPXuKI=;
        b=LvgWNK2d4QDOttcAm/7HUNQniQTuk8ilGPp4hnqlZkcpWSbsL7ZmLgagy3c9SZowi6
         paRaG7YtkaYcLNGFaq/kL5kF7IIu8rr3PjfkIDzkFNEkySuZK5js/5Sw2R9QFgnLw0ld
         vl/khXu1mWSYuxdZaMhuTQxbIgZSHgzznRWBr/Ja5yC3r5rWhf4RvNMYK6ZqjLKkDg/2
         mkPnpCEkMvcUQvgnzbo2Ry+ly+vKaoU/F1g8E0Q8USnR4zSy7NVx9q7jdvE1xXcXO7th
         4GsZVfwn8YDdGcUB7M7OL4lrDHRlXN4nloSJEp6OAOEU1fM8gaVD8K97d8xzrf52UcuN
         fh0g==
X-Gm-Message-State: AOAM532sQh3LhBoU2Fh5wBSBH0oFy8Brlj00SDdXRpVbRnzl39wMA2lZ
        HfVQFBwDlcgYVdG3MATtTgCkJA==
X-Google-Smtp-Source: ABdhPJwYVvq6FoC+0cr98mQMZnvjXjAJewz6nP8jiRlkwCTioWlJ7DNR13bFrLL5RbyIiktf3wZlPw==
X-Received: by 2002:a1c:61d4:: with SMTP id v203mr4062598wmb.1.1604600692803;
        Thu, 05 Nov 2020 10:24:52 -0800 (PST)
Received: from dell ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id z191sm3751615wme.30.2020.11.05.10.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 10:24:51 -0800 (PST)
Date:   Thu, 5 Nov 2020 18:24:49 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Christian Koenig <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        David Francis <David.Francis@amd.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Fabio Estevam <festevam@gmail.com>,
        Gareth Hughes <gareth@valinux.com>,
        Huang Rui <ray.huang@amd.com>, Jason Yan <yanaijie@huawei.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jingoo Han <jg1.han@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Lyude Paul <lyude@redhat.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nirmoy Das <nirmoy.aiemd@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <rob.clark@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 00/19] [Set 1] Rid W=1 warnings from GPU
Message-ID: <20201105182449.GR4488@dell>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105164841.GH485884@ulmo>
 <20201105181053.GP4488@dell>
 <CAKMK7uEyW_KJ1qC3gLASDe4Qyk_5UMr+yCu7VVVdAq+Z0J6RwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKMK7uEyW_KJ1qC3gLASDe4Qyk_5UMr+yCu7VVVdAq+Z0J6RwQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 05 Nov 2020, Daniel Vetter wrote:

> On Thu, Nov 5, 2020 at 7:10 PM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Thu, 05 Nov 2020, Thierry Reding wrote:
> >
> > > On Thu, Nov 05, 2020 at 02:44:58PM +0000, Lee Jones wrote:
> > > > This set is part of a larger effort attempting to clean-up W=1
> > > > kernel builds, which are currently overwhelmingly riddled with
> > > > niggly little warnings.
> > > >
> > > > There are 5000 warnings to work through.
> > > >
> > > > It will take a couple more sets.
> > > >
> > > > Lee Jones (19):
> > > >   gpu: host1x: bus: Add missing description for 'driver'
> > > >   gpu: ipu-v3: ipu-di: Strip out 2 unused 'di_sync_config' entries
> > > >   gpu: drm: imx: ipuv3-plane: Mark 'crtc_state' as __always_unused
> > > >   gpu: drm: omapdrm: omap_irq: Fix a couple of doc-rot issues
> > > >   gpu: drm: selftests: test-drm_mm: Mark 'hole_end' as always_unused
> > > >   gpu: drm: scheduler: sched_main: Provide missing description for
> > > >     'sched' paramter
> > > >   gpu: drm: scheduler: sched_entity: Demote non-conformant kernel-doc
> > > >     headers
> > > >   gpu: drm: omapdrm: dss: dsi: Rework and remove a few unused variables
> > > >   gpu: drm: selftests: test-drm_framebuffer: Remove set but unused
> > > >     variable 'fb'
> > > >   gpu: drm: ttm: ttm_bo: Fix one function header - demote lots of
> > > >     kernel-doc abuses
> > > >   gpu: drm: panel: panel-simple: Fix 'struct panel_desc's header
> > > >   gpu: drm: bridge: analogix: analogix_dp_reg: Remove unused function
> > > >     'analogix_dp_write_byte_to_dpcd'
> > > >   gpu: drm: ttm: ttm_tt: Demote kernel-doc header format abuses
> > > >   gpu: drm: selftests: test-drm_dp_mst_helper: Place 'struct
> > > >     drm_dp_sideband_msg_req_body' onto the heap
> > > >   gpu: drm: radeon: radeon_drv: Remove unused variable 'ret'
> > > >   gpu: drm: panel: panel-ilitek-ili9322: Demote non-conformant
> > > >     kernel-doc header
> > > >   gpu: drm: radeon: radeon_device: Fix a bunch of kernel-doc
> > > >     misdemeanours
> > > >   gpu: drm: amd: amdgpu: amdgpu: Mark global variables as __maybe_unused
> > > >   gpu: drm: bridge: analogix: analogix_dp_reg: Remove unused function
> > > >     'analogix_dp_start_aux_transaction'
> > >
> > > As commented on the other patches, the subject prefixes on most of these
> > > look wrong, but it's generally a nice cleanup.
> >
> > The prefixes are automated.  I'll add this to my list of awkward
> > subsystems and go through them all manually again tomorrow. :D
> 
> tbh for autmoation they look really good :-)

Only the prefixes are automated unfortunately. :)

> I'd say if you replace the intermediate ": " with just a / you'll be
> perfectly in style for drivers/gpu. But really I think it's ok as-is,

It's up to you.  Make the call and I'll abide.

> imo no need to change since this is a giantic tree wide effort.

Yes, you're not kidding, and thanks for noticing.

Only 10,000 (from 18,000) more to go though. :D

GPU is a biggy (5,000), although one patch in [Set 2] fixes 2,000 in
one hit, which is great!  I'll probably submit that tomorrow.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
