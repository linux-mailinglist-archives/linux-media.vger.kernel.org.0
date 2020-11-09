Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3F42AB5DF
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 12:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729302AbgKILGN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 06:06:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727774AbgKILGM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 06:06:12 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8162DC0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 03:06:12 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id p22so7569195wmg.3
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 03:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/TTLN5u5ntD12Tf50xVKp1qDLZNw1PZvWBuHFthUL88=;
        b=TKPmIbHz/sJNchjhXki9tBdowYhfzhopEljHcLDYcu2bt52SrzWKjteWCU58KX353a
         /P/wKKssgcalNm6WMoiInsUU0tYzqmWTdvvP1x2IC4lMkbZRYpg+8gP5TNFHScYSbQbf
         zNFvHFuDW2gZ2fs7lZw50G9oLfMph4J7tRayNoOEWmnQba2vledcJcf/7z8jURCZlZ7a
         q1nHIvFPWzIZXH/8EdX8up20/kjt7+d1ENZ+xWOQBxc7IIpx9GwZzr2Y1ubWdpjsgzd2
         Ul6YISZB4Gbk64r1IG9P7c6sH25ulfmr2nRzCJeRtHvEfs63vwtVjnue1xJMXbGaFrRS
         Tfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/TTLN5u5ntD12Tf50xVKp1qDLZNw1PZvWBuHFthUL88=;
        b=sIQRykMOe4LOtaNpa2gChpD85+BUo+7BdrlXfOngFS8t6BxFCpntWW9vyQwX0uQq2H
         h1EdT0NlC1lI3psKS5Gn3zH8iU2ZzB69dj0VvizaMFR6gxDtsT0sy/RCVTNO2a5mDW4L
         SZFTAOBD0nHGEdEzj+af6/q46tUlOx12UJuPdDZrWBwvxzSyfYmSy3YOA8SSwNlKOV1L
         t191ib+4gKnumTZNwCRsdzZo8PAzRCaKf6q6FqXwb6scbzUST9PgPlw/XFiKsR4fDMsW
         BDa67QcuD54eWCOoNFnc6OMs2/8AvLu8XedcLI745edW6ySsdyQeBjgPIcjzGRZOSOXU
         cWhA==
X-Gm-Message-State: AOAM532WD9MDp2q1GI5odH+YahpLPfL0RZYfVvCVitKnX2GlYJsMCqzk
        2Lg5A4DPqes+lwmGms8wZpybsg==
X-Google-Smtp-Source: ABdhPJwCQni2iqmE/lW8/SqfwjZzXNoAzBmb14stJp2vUaJpNmwq4rT99zQtmmQXUZir2cge7Fg/tA==
X-Received: by 2002:a1c:67d5:: with SMTP id b204mr14273334wmc.92.1604919971242;
        Mon, 09 Nov 2020 03:06:11 -0800 (PST)
Received: from dell ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id h62sm13193538wrh.82.2020.11.09.03.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 03:06:10 -0800 (PST)
Date:   Mon, 9 Nov 2020 11:06:03 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        Alex Deucher <alexander.deucher@amd.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 10/19] drm/radeon/radeon: Move prototype into shared
 header
Message-ID: <20201109110603.GV2063125@dell>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201106214949.2042120-11-lee.jones@linaro.org>
 <20201107142651.GA1014611@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201107142651.GA1014611@ravnborg.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 07 Nov 2020, Sam Ravnborg wrote:

> Hi Lee,
> 
> On Fri, Nov 06, 2020 at 09:49:40PM +0000, Lee Jones wrote:
> > Unfortunately, a suitable one didn't already exist.
> > 
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/gpu/drm/radeon/radeon_device.c:637:6: warning: no previous prototype for ‘radeon_device_is_virtual’ [-Wmissing-prototypes]
> >  637 | bool radeon_device_is_virtual(void)
> >  | ^~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/gpu/drm/radeon/radeon_device.c |  1 +
> >  drivers/gpu/drm/radeon/radeon_device.h | 32 ++++++++++++++++++++++++++
> >  drivers/gpu/drm/radeon/radeon_drv.c    |  3 +--
> >  3 files changed, 34 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/gpu/drm/radeon/radeon_device.h
> 
> Other public functions in radeon_device.c have their prototype in
> radeon.h - for example radeon_is_px()
> 
> Add radeon_device_is_virtual() there so we avoiid this new header.

Oh yes, I remember why this wasn't a suitable solution now:

The macro "radeon_init" in radeon.h clashes with the init function of
the same name in radeon_drv.c:

  In file included from drivers/gpu/drm/radeon/radeon_drv.c:53:
  drivers/gpu/drm/radeon/radeon_drv.c:620:31: error: expected identifier or ‘(’ before ‘void’
  620 | static int __init radeon_init(void)
  | ^~~~
  drivers/gpu/drm/radeon/radeon.h:2705:28: note: in definition of macro ‘radeon_init’
  2705 | #define radeon_init(rdev) (rdev)->asic->init((rdev))
  | ^~~~
  In file included from drivers/gpu/drm/radeon/radeon_drv.c:35:
  drivers/gpu/drm/radeon/radeon_drv.c: In function ‘__inittest’:
  drivers/gpu/drm/radeon/radeon_drv.c:653:13: error: ‘radeon_init’ undeclared (first use in this function); did you mean ‘radeon_exit’?
  653 | module_init(radeon_init);
  | ^~~~~~~~~~~
  include/linux/module.h:133:11: note: in definition of macro ‘module_init’
  133 | { return initfn; } | ^~~~~~
  drivers/gpu/drm/radeon/radeon_drv.c:653:13: note: each undeclared identifier is reported only once for each function it appears in
  653 | module_init(radeon_init);
  | ^~~~~~~~~~~
  include/linux/module.h:133:11: note: in definition of macro ‘module_init’
  133 | { return initfn; } | ^~~~~~
  In file included from include/linux/compiler_types.h:65,
  from <command-line>:
  drivers/gpu/drm/radeon/radeon_drv.c: At top level:
  drivers/gpu/drm/radeon/radeon_drv.c:653:13: error: ‘radeon_init’ undeclared here (not in a function); did you mean ‘radeon_exit’?
  653 | module_init(radeon_init);
  | ^~~~~~~~~~~
  include/linux/compiler_attributes.h:109:65: note: in definition of macro ‘__copy’
  109 | # define __copy(symbol) __attribute__((__copy__(symbol)))
  | ^~~~~~
  drivers/gpu/drm/radeon/radeon_drv.c:653:1: note: in expansion of macro ‘module_init’
  653 | module_init(radeon_init);
  | ^~~~~~~~~~~
  In file included from drivers/gpu/drm/radeon/radeon_drv.c:35:
  include/linux/module.h:134:6: error: ‘init_module’ aliased to undefined symbol ‘radeon_init’
  134 | int init_module(void) __copy(initfn) __attribute__((alias(#initfn)));
  | ^~~~~~~~~~~
  drivers/gpu/drm/radeon/radeon_drv.c:653:1: note: in expansion of macro ‘module_init’
  653 | module_init(radeon_init);
  | ^~~~~~~~~~~

How would you like me to move forward?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
