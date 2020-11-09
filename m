Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9E62ABFC7
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 16:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730626AbgKIPZj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 10:25:39 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:43950 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbgKIPZj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 10:25:39 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id C30C58053A;
        Mon,  9 Nov 2020 16:25:32 +0100 (CET)
Date:   Mon, 9 Nov 2020 16:25:30 +0100
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
Message-ID: <20201109152530.GA1888045@ravnborg.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201106214949.2042120-11-lee.jones@linaro.org>
 <20201107142651.GA1014611@ravnborg.org>
 <20201109110603.GV2063125@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201109110603.GV2063125@dell>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=IkcTkHD0fZMA:10 a=0bRNquZ1QDSsZ4hO3z4A:9 a=QEXdDO2ut3YA:10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lee,
> > 
> > Other public functions in radeon_device.c have their prototype in
> > radeon.h - for example radeon_is_px()
> > 
> > Add radeon_device_is_virtual() there so we avoiid this new header.
> 
> Oh yes, I remember why this wasn't a suitable solution now:
> 
> The macro "radeon_init" in radeon.h clashes with the init function of
> the same name in radeon_drv.c:
> 
>   In file included from drivers/gpu/drm/radeon/radeon_drv.c:53:
>   drivers/gpu/drm/radeon/radeon_drv.c:620:31: error: expected identifier or ‘(’ before ‘void’
>   620 | static int __init radeon_init(void)
...
> 
> How would you like me to move forward?

Fix the thousand of warnings in other places :-)
I will take a look at radeon and post a new series based on your work
with all W=1 warnings fixed.

	Sam
