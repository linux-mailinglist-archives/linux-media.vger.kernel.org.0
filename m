Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 222C031C7BC
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 10:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbhBPJFO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 04:05:14 -0500
Received: from mga03.intel.com ([134.134.136.65]:32616 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229812AbhBPJDz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 04:03:55 -0500
IronPort-SDR: EVZ8gy1xUbu2mhnE4T96n5yJAzzf4RADPeFLLNsJtnNLjVTDLoB1UPcZJdyWMQA5r64MLOWZ2e
 wXqDh/odLdzA==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="182912517"
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="182912517"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 01:01:50 -0800
IronPort-SDR: LkMRYtlXv9UloOOwpLM/5vpLjc+2eXhd+eMmOQeM6UaqSY1CGt2C9ElZRxJFIsu0vUJCXru7UD
 6UvfwBdEBrkw==
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="384317333"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 01:01:47 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 4A1D0203BB;
        Tue, 16 Feb 2021 11:01:45 +0200 (EET)
Date:   Tue, 16 Feb 2021 11:01:45 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        mchehab@kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        laurent.pinchart@ideasonboard.com, Joe Perches <joe@perches.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v7 3/3] drm: Switch to %p4cc format modifier
Message-ID: <20210216090145.GC3@paasikivi.fi.intel.com>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-4-sakari.ailus@linux.intel.com>
 <54e8c1d5-bb28-eddd-41ad-a89323650be0@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54e8c1d5-bb28-eddd-41ad-a89323650be0@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Thomas,

Thanks for the review.

On Tue, Feb 16, 2021 at 09:37:45AM +0100, Thomas Zimmermann wrote:
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

Sounds good. I'll split the third patch into two then. 

-- 
Kind regards,

Sakari Ailus
