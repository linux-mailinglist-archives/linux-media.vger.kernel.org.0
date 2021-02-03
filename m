Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C1A30DABF
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 14:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhBCNMX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Feb 2021 08:12:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbhBCNLv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Feb 2021 08:11:51 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C258CC061573
        for <linux-media@vger.kernel.org>; Wed,  3 Feb 2021 05:11:10 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id l12so4388045wmq.2
        for <linux-media@vger.kernel.org>; Wed, 03 Feb 2021 05:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=98vsBgcuoDvTfqJfjl4OuTtzO0K+8P+ZFHH2fOEBr9I=;
        b=jd1iAvIHF4AVVO6VuPQIh6f2ZResVSPpdGyQEO02get32t/v8d0ribVW+kvX/HsT21
         DhdHrt+OWOr3qaph7KbNXw7lh9rHHU7QuWm2X2yQMV91B8yQB9BpuCWNEFY+SIqJRYHH
         52nh8KRyM9ERegbfqOlbaISBRc7atx8+aCDfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=98vsBgcuoDvTfqJfjl4OuTtzO0K+8P+ZFHH2fOEBr9I=;
        b=fJXWQLmWuXXAdw9Fkg3/+i7rFjCvCuDWVN18WI/9Dt0niVYPmnXwx+WD1Lgm1jRDe9
         AGCpT9DxUF7UCPzYRk4aVk4Z2A/qLt9aR2NueTnZeWkiSKbvDtXafaELq+TZy7uFoxyi
         Jtpqm9KqdEyBjMS6MpaYTZKn9GXuZJPo7trgVBwPIRVeLFqcbLA4AlhDuYRssFFXwTV8
         jTYviZvbEJqDo2PTRhlIEj0CleeIM2TugV2rGjPukM2m1spwOIAOHzKr4Gjii97AF5ej
         FHFoR2Lj+Axr4fEr1G3WmZ4jFxwMMgIcJeo5vgGLuiqklbtgd0R8ZeAJ7o1ib4Dx64IQ
         IHPA==
X-Gm-Message-State: AOAM533EhsvBkO9OAItNQ2MVHGZwgStTzdlMDGNMlNnzh7zsI/L95kfu
        cixcQLyo9qYX1oLfyjrwaY1vuw==
X-Google-Smtp-Source: ABdhPJw5NP169kixDu9IIGlSVUkDflz1tcmHpKTjH9q2Q6cRcxxbMfh5YnqTQYWO0Bv47jyYbkn/Cg==
X-Received: by 2002:a05:600c:2305:: with SMTP id 5mr846961wmo.183.1612357869563;
        Wed, 03 Feb 2021 05:11:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h1sm3691810wrr.73.2021.02.03.05.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 05:11:08 -0800 (PST)
Date:   Wed, 3 Feb 2021 14:11:07 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] drm/todo: Add entry for moving to dma_resv_lock
Message-ID: <YBqg6x8jWIAe2IpH@phenom.ffwll.local>
References: <20210122133624.1751802-1-daniel.vetter@ffwll.ch>
 <97c93ad7-9aa1-dcf7-42a9-4f8076eeb135@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97c93ad7-9aa1-dcf7-42a9-4f8076eeb135@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 22, 2021 at 03:06:44PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 22.01.21 um 14:36 schrieb Daniel Vetter:
> > Requested by Thomas. I think it justifies a new level, since I tried
> > to make some forward progress on this last summer, and gave up (for
> > now). This is very tricky.
> 
> Adding it to the TODO list is a first step. :)
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Applied.
-Daniel

> 
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > ---
> >   Documentation/gpu/todo.rst | 19 +++++++++++++++++++
> >   1 file changed, 19 insertions(+)
> > 
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index dea9082c0e5f..f872d3d33218 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -23,6 +23,9 @@ Advanced: Tricky tasks that need fairly good understanding of the DRM subsystem
> >   and graphics topics. Generally need the relevant hardware for development and
> >   testing.
> > +Expert: Only attempt these if you've successfully completed some tricky
> > +refactorings already and are an expert in the specific area
> > +
> >   Subsystem-wide refactorings
> >   ===========================
> > @@ -168,6 +171,22 @@ Contact: Daniel Vetter, respective driver maintainers
> >   Level: Advanced
> > +Move Buffer Object Locking to dma_resv_lock()
> > +---------------------------------------------
> > +
> > +Many drivers have their own per-object locking scheme, usually using
> > +mutex_lock(). This causes all kinds of trouble for buffer sharing, since
> > +depending which driver is the exporter and importer, the locking hierarchy is
> > +reversed.
> > +
> > +To solve this we need one standard per-object locking mechanism, which is
> > +dma_resv_lock(). This lock needs to be called as the outermost lock, with all
> > +other driver specific per-object locks removed. The problem is tha rolling out
> > +the actual change to the locking contract is a flag day, due to struct dma_buf
> > +buffer sharing.
> > +
> > +Level: Expert
> > +
> >   Convert logging to drm_* functions with drm_device paramater
> >   ------------------------------------------------------------
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer
> 




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
