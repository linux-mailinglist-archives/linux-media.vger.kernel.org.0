Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBB631C7D3
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 10:09:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbhBPJJi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 04:09:38 -0500
Received: from mx2.suse.de ([195.135.220.15]:54208 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229710AbhBPJJW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 04:09:22 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1613466516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=du+7HNcipHGxWVFmXI0W1DaPaVk4qOBz6vainc7H3Mc=;
        b=W4Rnd+7DZq/Di3bDVnedOKZpzXSu6jFNr5W9jU9MiozQP3TLyw8Yh1SHMh2Ni6jkusiVSE
        ROWHo1LTxPG4h6AoJwGMRehRibDlBlYxBzBFEITs8ZdoGQtRJtZJKGCLxfBn9bEsSlvhy4
        Svp+urp0WsnCkgBR+Lv0m9W0ek6CbHI=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id CBC81AB4C;
        Tue, 16 Feb 2021 09:08:35 +0000 (UTC)
Date:   Tue, 16 Feb 2021 10:08:35 +0100
From:   Petr Mladek <pmladek@suse.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, mchehab@kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        laurent.pinchart@ideasonboard.com, Joe Perches <joe@perches.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v7 3/3] drm: Switch to %p4cc format modifier
Message-ID: <YCuLk+vnIxOzT7t+@alley>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-4-sakari.ailus@linux.intel.com>
 <54e8c1d5-bb28-eddd-41ad-a89323650be0@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54e8c1d5-bb28-eddd-41ad-a89323650be0@suse.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue 2021-02-16 09:37:45, Thomas Zimmermann wrote:
> Hi
> 
> Am 15.02.21 um 12:40 schrieb Sakari Ailus:
> > Switch DRM drivers from drm_get_format_name() to %p4cc. This gets rid of a
> > large number of temporary variables at the same time.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  5 ++--
> >   drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  5 ++--
> >   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  5 ++--
> >   drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  5 ++--
> >   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 ++--
> >   .../arm/display/komeda/komeda_format_caps.h   | 11 --------
> >   .../arm/display/komeda/komeda_framebuffer.c   |  4 +--
> >   .../gpu/drm/arm/display/komeda/komeda_plane.c |  6 ++---
> >   drivers/gpu/drm/arm/malidp_mw.c               |  7 ++----
> >   drivers/gpu/drm/drm_atomic.c                  |  8 ++----
> >   drivers/gpu/drm/drm_crtc.c                    |  7 ++----
> >   drivers/gpu/drm/drm_fourcc.c                  | 25 -------------------
> >   drivers/gpu/drm/drm_framebuffer.c             | 11 +++-----
> >   drivers/gpu/drm/drm_mipi_dbi.c                |  5 ++--
> >   drivers/gpu/drm/drm_plane.c                   |  8 ++----
> >   .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  5 ++--
> >   drivers/gpu/drm/i915/display/intel_display.c  | 14 +++--------
> >   .../drm/i915/display/intel_display_debugfs.c  | 19 ++++++--------
> >   drivers/gpu/drm/i915/display/intel_sprite.c   |  6 ++---
> >   drivers/gpu/drm/mcde/mcde_display.c           |  6 ++---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  6 ++---
> >   drivers/gpu/drm/nouveau/nouveau_display.c     |  9 +++----
> >   drivers/gpu/drm/radeon/atombios_crtc.c        | 10 +++-----
> >   drivers/gpu/drm/sun4i/sun4i_backend.c         |  6 ++---
> >   drivers/gpu/drm/vkms/vkms_writeback.c         |  7 ++----
> >   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 15 +++++------
> >   include/drm/drm_fourcc.h                      |  1 -
> >   27 files changed, 64 insertions(+), 157 deletions(-)
> 
> This is a nice patchset. For the driver-related changes:
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> But landing this patch will certainly give us build errors. There are at
> least 3 git trees involved: drm-misc-next, amd and i915. I'd expect at least
> one of them to have additional changes that still require
> drm_get_format_name().
> 
> IMHO we should remove drm_get_format_name() in a later patch. Please remove
> the changes in drm_fourcc.{c,h} from this patch and maybe add a TODO comment
> to the declaration that the function is supposed to be removed.
> 
> I would merge the patchset through drm-misc-next. And the final removal
> patch during the next cycle. Ok?

Sounds like a plan. I am fine with it from the vsprintf side.

Best Regards,
Petr
