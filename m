Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E38192AC089
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 17:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729969AbgKIQK4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 11:10:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729830AbgKIQK4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 11:10:56 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE61C0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 08:10:55 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id a65so8439014wme.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 08:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=XVBP+n0VN9eN/C2Jba9mEU16D1fWrV9bkOxgoHmqowE=;
        b=ovpCxEuW57eNQuSsfoObUTndr+bipuROJRQTcCSVncULvKVS9SyR+rzkpi5I6sUEhe
         5TxIvy0CQg8ufCAJz0rrG5Y8c3PSTT0m3CCLztv1xrQeTd6KVVNy9RRTKj8UawzcPFuX
         J/i8JGdCrNq+Jg6tZcOQQGSLMDaF2tYOpbtqZzfg5xLFxPl3fhqN2AIXVjYkfYJ3rQZ8
         8YmBTSOEa8WHMlHsqKxLQh2iitZnPJuFa46+xFExDlDcNuiOx4n6iO7/yxMedduL8x9J
         3jEo/JJbd3xiwfNiex4U6vOft6qs8o6sWN+jDI7wcYq/NYlgr/itbe2jJAMnaAAvTh8V
         Wh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XVBP+n0VN9eN/C2Jba9mEU16D1fWrV9bkOxgoHmqowE=;
        b=mlh3GCGoKtP2ntLqbjU7kcBD/pIfzGZT/grd5f45rOc9a6v4RPXrwV+rrmo5FeUIyQ
         c0tXWx9Kp1IsAQCv+L3HUuhe7nRARBf9AXUvyaXuTyDRElqHEyKs09UeGlkvM6SoEXt/
         j+vn0AaqLClFYfFeGzZEC12y9MmHa5aH1X1jpFCY0WznPnrYtONUWG+MfmIlkvxXWQxO
         gzSWUmxlCzcEr7/cpa5JsxPNAXEuWVXE8HjLsD1dEMKjaeTHUJvI2OlXRnjvioUwnEZC
         ga0Y6EWvXuk2GehQNlci3bwwBLI5pRSEudzRZfLaODHklbLTfQZzNzyDUGNJf3GqzbnN
         eX+g==
X-Gm-Message-State: AOAM531dQc130bXefYkdt4iKMUw+OvYAieUG+XU0wtmOHS/FrjmAeKgB
        b4kM3sgk1+yFu4FNGU00gE7BhQ==
X-Google-Smtp-Source: ABdhPJxQvHFpa9rWHRtMcdHxH++0UXHHx4BiJVp+45GpHvO8bsRDcBMFvyMavXb/jg3d+O1vYTmIrA==
X-Received: by 2002:a1c:df04:: with SMTP id w4mr61037wmg.3.1604938254577;
        Mon, 09 Nov 2020 08:10:54 -0800 (PST)
Received: from dell ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id b17sm13872467wru.12.2020.11.09.08.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 08:10:53 -0800 (PST)
Date:   Mon, 9 Nov 2020 16:10:50 +0000
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
Message-ID: <20201109161050.GW2063125@dell>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201106214949.2042120-11-lee.jones@linaro.org>
 <20201107142651.GA1014611@ravnborg.org>
 <20201109110603.GV2063125@dell>
 <20201109152530.GA1888045@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201109152530.GA1888045@ravnborg.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 09 Nov 2020, Sam Ravnborg wrote:

> Hi Lee,
> > > 
> > > Other public functions in radeon_device.c have their prototype in
> > > radeon.h - for example radeon_is_px()
> > > 
> > > Add radeon_device_is_virtual() there so we avoiid this new header.
> > 
> > Oh yes, I remember why this wasn't a suitable solution now:
> > 
> > The macro "radeon_init" in radeon.h clashes with the init function of
> > the same name in radeon_drv.c:
> > 
> >   In file included from drivers/gpu/drm/radeon/radeon_drv.c:53:
> >   drivers/gpu/drm/radeon/radeon_drv.c:620:31: error: expected identifier or ‘(’ before ‘void’
> >   620 | static int __init radeon_init(void)
> ...
> > 
> > How would you like me to move forward?
> 
> Fix the thousand of warnings in other places :-)
> I will take a look at radeon and post a new series based on your work
> with all W=1 warnings fixed.

I'll drop this patch and carry on ploughing through the rest of them.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
