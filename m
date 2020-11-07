Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C40932AA5F1
	for <lists+linux-media@lfdr.de>; Sat,  7 Nov 2020 15:27:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbgKGO06 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Nov 2020 09:26:58 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:47818 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbgKGO04 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Nov 2020 09:26:56 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id E00BD80532;
        Sat,  7 Nov 2020 15:26:52 +0100 (CET)
Date:   Sat, 7 Nov 2020 15:26:51 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        Alex Deucher <alexander.deucher@amd.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 10/19] drm/radeon/radeon: Move prototype into shared
 header
Message-ID: <20201107142651.GA1014611@ravnborg.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201106214949.2042120-11-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201106214949.2042120-11-lee.jones@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=IkcTkHD0fZMA:10 a=zd2uoN0lAAAA:8 a=KKAkSRfTAAAA:8 a=e5mUnYsNAAAA:8
        a=VwQbUJbxAAAA:8 a=ikXVT_u04ppS6bpDQeoA:9 a=QEXdDO2ut3YA:10
        a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
        a=AjGcO6oz07-iQ99wixmX:22
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lee,

On Fri, Nov 06, 2020 at 09:49:40PM +0000, Lee Jones wrote:
> Unfortunately, a suitable one didn't already exist.
> 
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/radeon/radeon_device.c:637:6: warning: no previous prototype for ‘radeon_device_is_virtual’ [-Wmissing-prototypes]
>  637 | bool radeon_device_is_virtual(void)
>  | ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/radeon/radeon_device.c |  1 +
>  drivers/gpu/drm/radeon/radeon_device.h | 32 ++++++++++++++++++++++++++
>  drivers/gpu/drm/radeon/radeon_drv.c    |  3 +--
>  3 files changed, 34 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/radeon/radeon_device.h

Other public functions in radeon_device.c have their prototype in
radeon.h - for example radeon_is_px()

Add radeon_device_is_virtual() there so we avoiid this new header.

	Sam
