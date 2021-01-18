Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F1AB2FA43B
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 16:13:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390268AbhARPLG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 10:11:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405442AbhARPKa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 10:10:30 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 297E6C061757
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 07:09:50 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id v15so13138268wrx.4
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 07:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=o0LrDk575sZO8QF6eRJPnKaqFriKwMIEzttJtoJHwP0=;
        b=DrzJ/q9KyuRRal0Ze0KBbIW7oKNk6JkGd6CVff4gctqjSVajqnVv9fc7l4zSQUtIRt
         cq+ipbNdcyGi8vKWvy03L6K1Nt4n4vl5tCE7kIZonzCkLKU0T9t4LWz4fXubhR6WZ6b8
         Rn9Nj+iFhp8F+gjof50KQotABsBOASwT1tIRsCQWUqxHTd6/Wmm4Viynn/1gq0U6iIPU
         uz7J7AWfvI+lkmOqPc4gG7QFOOQ0z8nJn//TX/yN5S6R1lEi0+z31VyXBmFKhPZdn3nq
         NsSgEvnUf0l6dMbCFJk1UihF29ReJOisAzC3Rlr7aD7qosJ4Hd8jf18Huw9xBsNG5Gr6
         VVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=o0LrDk575sZO8QF6eRJPnKaqFriKwMIEzttJtoJHwP0=;
        b=lM3jk7dH1O+/TRG4V9BIVaX/7HMr92VsDL+0Ndg903wVmHvMYWi2FplkEyoLLZ7po6
         C8hNplJPdhdp3zE7qHk4DLhJpglhLWm/z6bZXOiiU4SH5W9ejUR1+MXDfbsKYnaoY2QJ
         J1cmdp5XVUi+IhRcjNHtvrG+ZL6QCvk6xmtr70OKlmz2Pl/ZWTahokE7ugtr2yrzBCuE
         UuTvwohs9/mFQbWu894uIfCs6ewAoH80NsvfowfIC0m9Kfp3tsc6kC7uG44bXHw9kXw2
         7ft4bkk9bpqNya+WAxqSt2YZmvswy9pl+yxXFvXT76D1PeNDVeh9XnQIKyn5sds1X9Zu
         a1/A==
X-Gm-Message-State: AOAM5334zYCmJlG4rBmFmzFcq+DoRnSmMDyy5Q9oyu+KzMtcDY53e00C
        llu3CgJNOaTm7SYRDgo8vUMEGA==
X-Google-Smtp-Source: ABdhPJyDZ5Oz5+gFChXkRG81oA1CFNwWNCMpwIu5woxmSaXUr+y+QkHfALigdBsXlGhC6+k4fDIdvA==
X-Received: by 2002:a05:6000:368:: with SMTP id f8mr26201890wrf.150.1610982588871;
        Mon, 18 Jan 2021 07:09:48 -0800 (PST)
Received: from dell ([91.110.221.158])
        by smtp.gmail.com with ESMTPSA id n10sm29595126wrx.21.2021.01.18.07.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 07:09:47 -0800 (PST)
Date:   Mon, 18 Jan 2021 15:09:45 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Zack Rusin <zackr@vmware.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ben Skeggs <bskeggs@redhat.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Dave Airlie <airlied@redhat.com>,
        David Airlie <airlied@linux.ie>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Eddie Dong <eddie.dong@intel.com>,
        Eric Anholt <eric@anholt.net>, Faith <faith@valinux.com>,
        Gareth Hughes <gareth@valinux.com>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "intel-gvt-dev@lists.freedesktop.org" 
        <intel-gvt-dev@lists.freedesktop.org>,
        Jackie Li <yaodong.li@intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jan Safrata <jan.nikitenko@gmail.com>,
        Jesse Barnes <jesse.barnes@intel.com>,
        jim liu <jim.liu@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Keith Packard <keithp@keithp.com>,
        Kevin Tian <kevin.tian@intel.com>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, Min He <min.he@intel.com>,
        Niu Bing <bing.niu@intel.com>,
        "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Pei Zhang <pei.zhang@intel.com>,
        Ping Gao <ping.a.gao@intel.com>,
        Rob Clark <rob.clark@linaro.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tina Zhang <tina.zhang@intel.com>,
        Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        Zhi Wang <zhi.a.wang@intel.com>,
        Zhiyuan Lv <zhiyuan.lv@intel.com>
Subject: Re: [PATCH 00/29] [Set 15] Finally rid W=1 warnings from GPU!
Message-ID: <20210118150945.GE4903@dell>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
 <F914D9B9-6DD4-4383-9F7C-8D09FBFE96CE@vmware.com>
 <YAWhDRkSOHbJ+2Le@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YAWhDRkSOHbJ+2Le@phenom.ffwll.local>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 18 Jan 2021, Daniel Vetter wrote:

> On Fri, Jan 15, 2021 at 06:27:15PM +0000, Zack Rusin wrote:
> > 
> > > On Jan 15, 2021, at 13:15, Lee Jones <lee.jones@linaro.org> wrote:
> > > 
> > > This set is part of a larger effort attempting to clean-up W=1
> > > kernel builds, which are currently overwhelmingly riddled with
> > > niggly little warnings.
> > > 
> > > Last set!  All clean after this for; Arm, Arm64, PPC, MIPS and x86.
> > 
> > Thanks! For all the vmwgfx bits:
> > Reviewed-by: Zack Rusin <zackr@vmware.com>
> 
> Ok I merged everything except vmwgfx (that's for Zack) and i915/nouveau
> (those generally go through other trees, pls holler if they're stuck).

Thanks Daniel, you're a superstar!

So Zack will take the vmwgfx parts?  Despite providing a R-b?

> Note that we have some build issue on some of the configs sfr uses, so drm
> trees are still stuck on old versions in linux-next. Hopefully should get
> resolved soon, the bugfix is in some subtree I've heard.

No worries.  Thanks for letting me know.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
