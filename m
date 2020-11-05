Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8332E2A85E7
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 19:15:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732240AbgKESPN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 13:15:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732221AbgKESPI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 13:15:08 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09F28C0613D3
        for <linux-media@vger.kernel.org>; Thu,  5 Nov 2020 10:15:08 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id y22so2285236oti.10
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2020 10:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2lVJy0oZJ1HKj/RNi/yGkNbXnVBFsYr/3+ED5ZMQfKw=;
        b=IyWaPau7ZYEzIkgrk5Vh4h4G9HhBgXbnf18iSExSSwD8Va8GOuKADUz4CytksalbiW
         MzScsBKf5oiY2HuZ1YhHj0f7X2yZf4RR6/ROIepItR8F8D/GCz6dcRvPz2s9Pv5dXK3q
         wNxzRh7wgI7g0lSub9uEkZLBBMgnB7KSZ/94o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2lVJy0oZJ1HKj/RNi/yGkNbXnVBFsYr/3+ED5ZMQfKw=;
        b=T8cVmY7+wgNI3A1LLKYW4ERW8kD34yPydGv66RyJ0CHuj0FW6Iim3hrModq6YQSTkg
         KA/6aD3RnLbW1HToIUuq1euC6qalFs80FrN7ButgjX0QmfJDs35WGo2ySS5Uhn7Nu3iG
         WGgOFt94L9K2EetReDLKSZLslRjVQsuQ4I8cMsqmyRKlZJI9dGvNvoXaH40StpALCsZ7
         vwloZQ4YbZcWeHiWNfdTJSyHNHF7MM+haRrnF5jiSkCEB4yACLTVFPCNEExPYEUL33IJ
         DW3HLyF+1fKPR7/mN3B79ZTZgMigqJhDdgweqCWJWatvMIfjpKAVmTq/4tOpzM+SL92d
         k40w==
X-Gm-Message-State: AOAM530aJy1Her0Wu9BXWX7/mPTxVvKzT+vZjgTdqP4/CC7LR/pIwYmk
        MfcTYEWuHLgBoczUv9atnjQfkz8EGUKnSg241gS5Cg==
X-Google-Smtp-Source: ABdhPJz6LySZvQ0VpbbSmLJZyloCrKQbelizcXBsEwRVJaITj+vGbbcw3XfkOTnXZG1mD1JdtddL+vEJaCj1UVIENNw=
X-Received: by 2002:a9d:3b4:: with SMTP id f49mr2710790otf.188.1604600105882;
 Thu, 05 Nov 2020 10:15:05 -0800 (PST)
MIME-Version: 1.0
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105164841.GH485884@ulmo> <20201105181053.GP4488@dell>
In-Reply-To: <20201105181053.GP4488@dell>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 5 Nov 2020 19:14:54 +0100
Message-ID: <CAKMK7uEyW_KJ1qC3gLASDe4Qyk_5UMr+yCu7VVVdAq+Z0J6RwQ@mail.gmail.com>
Subject: Re: [PATCH 00/19] [Set 1] Rid W=1 warnings from GPU
To:     Lee Jones <lee.jones@linaro.org>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 5, 2020 at 7:10 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Thu, 05 Nov 2020, Thierry Reding wrote:
>
> > On Thu, Nov 05, 2020 at 02:44:58PM +0000, Lee Jones wrote:
> > > This set is part of a larger effort attempting to clean-up W=1
> > > kernel builds, which are currently overwhelmingly riddled with
> > > niggly little warnings.
> > >
> > > There are 5000 warnings to work through.
> > >
> > > It will take a couple more sets.
> > >
> > > Lee Jones (19):
> > >   gpu: host1x: bus: Add missing description for 'driver'
> > >   gpu: ipu-v3: ipu-di: Strip out 2 unused 'di_sync_config' entries
> > >   gpu: drm: imx: ipuv3-plane: Mark 'crtc_state' as __always_unused
> > >   gpu: drm: omapdrm: omap_irq: Fix a couple of doc-rot issues
> > >   gpu: drm: selftests: test-drm_mm: Mark 'hole_end' as always_unused
> > >   gpu: drm: scheduler: sched_main: Provide missing description for
> > >     'sched' paramter
> > >   gpu: drm: scheduler: sched_entity: Demote non-conformant kernel-doc
> > >     headers
> > >   gpu: drm: omapdrm: dss: dsi: Rework and remove a few unused variables
> > >   gpu: drm: selftests: test-drm_framebuffer: Remove set but unused
> > >     variable 'fb'
> > >   gpu: drm: ttm: ttm_bo: Fix one function header - demote lots of
> > >     kernel-doc abuses
> > >   gpu: drm: panel: panel-simple: Fix 'struct panel_desc's header
> > >   gpu: drm: bridge: analogix: analogix_dp_reg: Remove unused function
> > >     'analogix_dp_write_byte_to_dpcd'
> > >   gpu: drm: ttm: ttm_tt: Demote kernel-doc header format abuses
> > >   gpu: drm: selftests: test-drm_dp_mst_helper: Place 'struct
> > >     drm_dp_sideband_msg_req_body' onto the heap
> > >   gpu: drm: radeon: radeon_drv: Remove unused variable 'ret'
> > >   gpu: drm: panel: panel-ilitek-ili9322: Demote non-conformant
> > >     kernel-doc header
> > >   gpu: drm: radeon: radeon_device: Fix a bunch of kernel-doc
> > >     misdemeanours
> > >   gpu: drm: amd: amdgpu: amdgpu: Mark global variables as __maybe_unused
> > >   gpu: drm: bridge: analogix: analogix_dp_reg: Remove unused function
> > >     'analogix_dp_start_aux_transaction'
> >
> > As commented on the other patches, the subject prefixes on most of these
> > look wrong, but it's generally a nice cleanup.
>
> The prefixes are automated.  I'll add this to my list of awkward
> subsystems and go through them all manually again tomorrow. :D

tbh for autmoation they look really good :-)

I'd say if you replace the intermediate ": " with just a / you'll be
perfectly in style for drivers/gpu. But really I think it's ok as-is,
imo no need to change since this is a giantic tree wide effort.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
