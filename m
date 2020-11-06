Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 602292AA060
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 23:29:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728666AbgKFW0g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 17:26:36 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:43772 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728482AbgKFW0f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Nov 2020 17:26:35 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 89B9520068;
        Fri,  6 Nov 2020 23:26:31 +0100 (CET)
Date:   Fri, 6 Nov 2020 23:26:30 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        Huang Rui <ray.huang@amd.com>, Rob Clark <rob@ti.com>,
        Gareth Hughes <gareth@valinux.com>,
        amd-gfx@lists.freedesktop.org, Rob Clark <rob.clark@linaro.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Keith Whitwell <keith@tungstengraphics.com>,
        Andy Gross <andy.gross@ti.com>, linux-media@vger.kernel.org,
        Leo Li <sunpeng.li@amd.com>, linaro-mm-sig@lists.linaro.org,
        by <jhartmann@precisioninsight.com>,
        Jeff Hartmann <jhartmann@valinux.com>,
        linux-kernel@vger.kernel.org, Faith <faith@valinux.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian Koenig <christian.koenig@amd.com>
Subject: Re: [PATCH 00/19] [Set 2] Rid W=1 warnings from GPU
Message-ID: <20201106222630.GD826715@ravnborg.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106214949.2042120-1-lee.jones@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=jxsCkVyRRZrjTV7aRhQA:9 a=CjuIK1q_8ugA:10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lee and DRM folks.

On Fri, Nov 06, 2020 at 09:49:30PM +0000, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> There are 5000 warnings to work through.  It will take a couple more
> sets.  Although, ("drm/amd/display/dc/basics/fixpt31_32: Move
> variables to where they're used") does take care of 2000 of them!
> 
> Lee Jones (19):
>   drm/ttm/ttm_range_manager: Demote non-conformant kernel-doc header
>   drm/r128/ati_pcigart: Source file headers are not good candidates for
>     kernel-doc
Applied

>   drm/selftests/test-drm_dp_mst_helper: Move
>     'sideband_msg_req_encode_decode' onto the heap
>   drm/mga/mga_dma: Demote kernel-doc abusers to standard comment blocks
>   drm/mga/mga_state: Remove unused variable 'buf_priv'
Applied x2

>   drm/radeon/atom: Move prototype into shared location
>   drm/radeon/radeon_kms: Include header containing our own prototypes
>   drm/omapdrm/omap_gem: Fix misnamed and missing parameter descriptions
>   drm/omapdrm/omap_dmm_tiler: Demote abusive use of kernel-doc format
>   drm/radeon/radeon: Move prototype into shared header
>   drm/radeon/radeon_drv: Source file headers are not good candidates for
>     kernel-doc
>   drm/amd/display/dc/basics/fixpt31_32: Move variables to where they're
>     used
>   drm/radeon/radeon_drv: Move prototypes to a shared headerfile
>   drm/amd/amdgpu/amdgpu_device: Provide documentation for 'reg_addr'
>     params
>   drm/radeon: Move prototypes to shared header
>   drm/amd/amdgpu/amdgpu_kms: Remove 'struct drm_amdgpu_info_device
>     dev_info' from the stack
>   drm/radeon/radeon_kms: Fix misnaming of 'radeon_info_ioctl's dev param
>   drm/radeon/atombios_crtc: Remove description of non-existent function
>     param 'encoder'
>   drm/v3d/v3d_drv: Remove unused static variable 'v3d_v3d_pm_ops'

I have applied the three patches that has no obvious maintainer as indicated
above. I assume the respective maintaines to pick radeon, omapdrm, ttm,
amd, v3d and selftest patches.

	Sam
