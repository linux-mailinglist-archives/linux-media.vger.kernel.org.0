Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B65C52A85BF
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 19:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731744AbgKESLB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 13:11:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731740AbgKESLA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 13:11:00 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41A08C0613D3
        for <linux-media@vger.kernel.org>; Thu,  5 Nov 2020 10:10:58 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id b8so2867472wrn.0
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2020 10:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=FhFtY5ciaW1nlR2U+pWYBqVAzPK41Vz6Hz2tFwAkb5Q=;
        b=GatAPuXOOWtl2nhpT9e99ah3GFLcKM+HdeOOkC5pSs78XvvdyMoY7/8vu0nKhJBTAi
         ULzFLk2UAxyoo+3Evefw/CCJcgxeJdm/3As86gobVyRvGkioR0Yg0Vk06+ly3ZT1Iw4c
         vWDYVSEp7DJ/ryuKbJRodv3lC/n12GCOM19ezNTRqhekjK3J/FUTXtxYyQGZK6Ec+X+u
         4TF1Xpbbx7qXCIt1ap/QpJ/p7OSbix6+UbPt/19fhQThBEaY4kUCHeOHR7xeN5T5ugMQ
         FfV9R50g/c2fPLTAz8eG++boM2RcFaq0a3MzSidP9GytvPcXivsAZCyMSDEbhqPWcOtr
         hZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=FhFtY5ciaW1nlR2U+pWYBqVAzPK41Vz6Hz2tFwAkb5Q=;
        b=IcWHwKlVRPYQ6e/sS+3Wr1D+cIBeuLyXHFqCqPYx1pAWDlbouS+LigjGyGQZ4cdmB6
         y7nn1Jw2DpoX7cbT5L8S784WkuaiGbEusYo4wrU2X0BMCJPptB0UY7tAXFSKtLgtTxaT
         OyCxtzLitqcXdQjhD6ox5ywU38oYtGxNT/xvgdQCIkY0plpvKrriwHTjhwVc8RLCyY/o
         vv/xuMBmqaIxfCwVoNv0d/zcupYbcmirxzkWvxSQEtiUqZUf/AMrHkA/rCZmNcd+9h/g
         Ch+jWqREJEOGYhUWA4OII5ST3+3w9P2MYH1i9WF+68YhqpRQbB2j6UiAwZJ7O/m8Tihm
         ILtw==
X-Gm-Message-State: AOAM533Ig0IoNLgclwLzw9QOTtKbBL0/1fDJLW8P1P3iuAEITVxo3Ern
        LagLi7vWtr4U/iSSM9Cc13f6ig==
X-Google-Smtp-Source: ABdhPJxfovDmA2/SEwd5OqdAtrF75aOW/Ch8IL1Xl3o7TEZiRRobO1BFwQiv29SzGPrtgzVY78mRyw==
X-Received: by 2002:a5d:4747:: with SMTP id o7mr4604227wrs.423.1604599856823;
        Thu, 05 Nov 2020 10:10:56 -0800 (PST)
Received: from dell ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id m126sm3705212wmm.0.2020.11.05.10.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 10:10:55 -0800 (PST)
Date:   Thu, 5 Nov 2020 18:10:53 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        David Francis <David.Francis@amd.com>,
        dri-devel@lists.freedesktop.org,
        Fabio Estevam <festevam@gmail.com>,
        Gareth Hughes <gareth@valinux.com>,
        Huang Rui <ray.huang@amd.com>, Jason Yan <yanaijie@huawei.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jingoo Han <jg1.han@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linaro-mm-sig@lists.linaro.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
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
Message-ID: <20201105181053.GP4488@dell>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105164841.GH485884@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201105164841.GH485884@ulmo>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 05 Nov 2020, Thierry Reding wrote:

> On Thu, Nov 05, 2020 at 02:44:58PM +0000, Lee Jones wrote:
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> > 
> > There are 5000 warnings to work through.
> > 
> > It will take a couple more sets.
> > 
> > Lee Jones (19):
> >   gpu: host1x: bus: Add missing description for 'driver'
> >   gpu: ipu-v3: ipu-di: Strip out 2 unused 'di_sync_config' entries
> >   gpu: drm: imx: ipuv3-plane: Mark 'crtc_state' as __always_unused
> >   gpu: drm: omapdrm: omap_irq: Fix a couple of doc-rot issues
> >   gpu: drm: selftests: test-drm_mm: Mark 'hole_end' as always_unused
> >   gpu: drm: scheduler: sched_main: Provide missing description for
> >     'sched' paramter
> >   gpu: drm: scheduler: sched_entity: Demote non-conformant kernel-doc
> >     headers
> >   gpu: drm: omapdrm: dss: dsi: Rework and remove a few unused variables
> >   gpu: drm: selftests: test-drm_framebuffer: Remove set but unused
> >     variable 'fb'
> >   gpu: drm: ttm: ttm_bo: Fix one function header - demote lots of
> >     kernel-doc abuses
> >   gpu: drm: panel: panel-simple: Fix 'struct panel_desc's header
> >   gpu: drm: bridge: analogix: analogix_dp_reg: Remove unused function
> >     'analogix_dp_write_byte_to_dpcd'
> >   gpu: drm: ttm: ttm_tt: Demote kernel-doc header format abuses
> >   gpu: drm: selftests: test-drm_dp_mst_helper: Place 'struct
> >     drm_dp_sideband_msg_req_body' onto the heap
> >   gpu: drm: radeon: radeon_drv: Remove unused variable 'ret'
> >   gpu: drm: panel: panel-ilitek-ili9322: Demote non-conformant
> >     kernel-doc header
> >   gpu: drm: radeon: radeon_device: Fix a bunch of kernel-doc
> >     misdemeanours
> >   gpu: drm: amd: amdgpu: amdgpu: Mark global variables as __maybe_unused
> >   gpu: drm: bridge: analogix: analogix_dp_reg: Remove unused function
> >     'analogix_dp_start_aux_transaction'
> 
> As commented on the other patches, the subject prefixes on most of these
> look wrong, but it's generally a nice cleanup.

The prefixes are automated.  I'll add this to my list of awkward
subsystems and go through them all manually again tomorrow. :D

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
