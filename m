Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED532FCC5F
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 09:09:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730338AbhATIJN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 03:09:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728855AbhATIHF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 03:07:05 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A366AC061794
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 00:05:31 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id j18so1981834wmi.3
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 00:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=i0E7CMnkJOpieDzn6Vg+wQQjdFWzO1+rNLsWhsRoe3o=;
        b=OCmzqzCx+kJKozrzBCDTsmV41sa//C8Xz6MgavuR25f4oaXCkpVJHvPWsgS/XltA9g
         6MsYyWYfHRBgBYFYevh1ruUsDAO1aCK96HPyTCAT4mYW4BjSb2RygzqlQUBXGQMZyYo4
         oHcyS26K06EL/6eFa3SOYkGyH0h5522KhkZ9z9CcF1618Y3lDTM061Yj/gpJalQ9pSlf
         BjL36AZ1kECVP7B92jDo2L9BZRpQrJ4zvGVsDQuphXYnvNXXnR52kOfzjo8BiS+LtI+6
         3bRjXALY6WVXvu3dC9Djf0Bx8av9XnTcqBqUhhYBD/3Ln/T0JDGmzMzfxu+yKs/9xxE3
         nf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=i0E7CMnkJOpieDzn6Vg+wQQjdFWzO1+rNLsWhsRoe3o=;
        b=hrLGRxcji5raVtR/lMh8TAOE+kLXtwFaSHxE3EgnqqT8pOvAAarKHMoE6QbcgaKByY
         6p6iZWQ6KirjKtuhXMpqj7EJ8S+8pv8MtuFoQI/k2lSnLlB5TEHVpB5l2P9dJVLghOnA
         iM1D9tsAbQkYrkjaZy4PZ/V+m6SbU3KdqW70A/VJcjC9tyaLM0bM83Is1/jsFebfAeVA
         UOlpFwjNo3sldxbdifiXwYFHH2g+TEnfrxXQIFX6azQQ3+I885L9PGMp25a8KQk/QabB
         QMqYR3dlhfb9I/yMbG0R2md/tIjIoonqG1Pe1F1I6oRqGVRoN8L1ub/4dkua0OOZ1mQD
         iV/Q==
X-Gm-Message-State: AOAM532WnaEtDtWHG3L8Wd5fko8wFm2vWr2t9b1w8hxW7oqFqHTRqH1p
        AtfjrJvC0KDI7v68KNw1DxSqYw==
X-Google-Smtp-Source: ABdhPJw03a3Mt+JIRRJlN+qL5Wvmb168qR1zfbc+zME3aDudXf2zqFFDvbGkZ01CEqJS8MlUBAm8PA==
X-Received: by 2002:a7b:cb46:: with SMTP id v6mr3049511wmj.19.1611129930271;
        Wed, 20 Jan 2021 00:05:30 -0800 (PST)
Received: from dell ([91.110.221.158])
        by smtp.gmail.com with ESMTPSA id s13sm2538012wra.53.2021.01.20.00.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 00:05:29 -0800 (PST)
Date:   Wed, 20 Jan 2021 08:05:26 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Zack Rusin <zackr@vmware.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
Message-ID: <20210120080526.GL4903@dell>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
 <F914D9B9-6DD4-4383-9F7C-8D09FBFE96CE@vmware.com>
 <YAWhDRkSOHbJ+2Le@phenom.ffwll.local>
 <20210118150945.GE4903@dell>
 <YAXDgmWMR9s4OgxN@phenom.ffwll.local>
 <20210119082927.GJ4903@dell>
 <8DE96253-47A3-4A16-9331-62F547A2CC44@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8DE96253-47A3-4A16-9331-62F547A2CC44@vmware.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 19 Jan 2021, Zack Rusin wrote:

> 
> 
> > On Jan 19, 2021, at 03:29, Lee Jones <lee.jones@linaro.org> wrote:
> > 
> > On Mon, 18 Jan 2021, Daniel Vetter wrote:
> > 
> >> On Mon, Jan 18, 2021 at 03:09:45PM +0000, Lee Jones wrote:
> >>> On Mon, 18 Jan 2021, Daniel Vetter wrote:
> >>> 
> >>>> On Fri, Jan 15, 2021 at 06:27:15PM +0000, Zack Rusin wrote:
> >>>>> 
> >>>>>> On Jan 15, 2021, at 13:15, Lee Jones <lee.jones@linaro.org> wrote:
> >>>>>> 
> >>>>>> This set is part of a larger effort attempting to clean-up W=1
> >>>>>> kernel builds, which are currently overwhelmingly riddled with
> >>>>>> niggly little warnings.
> >>>>>> 
> >>>>>> Last set!  All clean after this for; Arm, Arm64, PPC, MIPS and x86.
> >>>>> 
> >>>>> Thanks! For all the vmwgfx bits:
> >>>>> Reviewed-by: Zack Rusin <zackr@vmware.com>
> >>>> 
> >>>> Ok I merged everything except vmwgfx (that's for Zack) and i915/nouveau
> >>>> (those generally go through other trees, pls holler if they're stuck).
> >>> 
> >>> Thanks Daniel, you're a superstar!
> >>> 
> >>> So Zack will take the vmwgfx parts?  Despite providing a R-b?
> >> 
> >> I only merge stuff that's defacto abandoned already. Everything else I try
> >> to offload to whomever actually cares :-)
> > 
> > Understood.  Thanks for the explanation.
> > 
> > Hopefully Zack actually cares. :D
> 
> hah, I do. I just pushed all of the changes to drm-misc-next. Let me
> know if I missed anything. Thanks!

Perfect.  Thank you Zack.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
