Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B66045F0F9
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 16:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378143AbhKZPrt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 10:47:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351271AbhKZPpt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 10:45:49 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 955BAC0613ED
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 07:37:18 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id o13so19419896wrs.12
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 07:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=4FnyaLWyvOAQeJjC3Zb+4XuQuhsTMCYxjqdXSYoADFk=;
        b=FPi53YagST9tqSejwT2pIZ23vOSDIA/5Cw8qme3DBlmpYictGDAMBZj6BmO7b3JXFB
         f2WbPqsfa6wZgqecexgXNYzTjGRehDYay8bKuz5DHhnPPvljhGGwtibjMdxuhhv4Ifal
         qRqB3wTFdL02O4CNjJqyNqI9QX6iu68VfKTc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=4FnyaLWyvOAQeJjC3Zb+4XuQuhsTMCYxjqdXSYoADFk=;
        b=k0Fsj1WMW8PiLgriwtzenCEj4adcllMEgttciBnn2eHa5Vytt//YGR8HWBjweYl66B
         WtKW3cOmepjJAegJvAjTEjX9WTtQKjd6SdKor5A2qgSdN3hi1gcDP2KYmkatp6+AGbtZ
         PLHxvUjhi1rLB91TzdBcgR1weKXHcXlDjhkBsdjNJnf04LtDIa8zFWojXW+y7IgtCyDR
         JtCZlAkx0DxU4lmL3PwcZUuf73mlgVZDJtV5v1pv9ZI5OubTVaBcgl9651gVgJ6Dwn/L
         GGi8nIXR8DOpNba+j8qfXGsDMCcUjosUGbhFIXe/OEDaqKg6uF92F3I2Wj+fB5sqEqjA
         l7Aw==
X-Gm-Message-State: AOAM531E9lEW7Qv/dbJsc7TP/a2SILONjOVa2ZV0+3/NHjXTqV4kd4ZN
        ajDltlI5BcAVjo8cm8ueUBriKg==
X-Google-Smtp-Source: ABdhPJy9NU89a6BqtlQNlnHKD+/fMzjk0BNrICOiirM/Q+4JDx+qY42SvDak49q035dxBZaGz1IxUw==
X-Received: by 2002:a5d:6548:: with SMTP id z8mr15732064wrv.502.1637941037157;
        Fri, 26 Nov 2021 07:37:17 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id n7sm5752435wro.68.2021.11.26.07.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 07:37:16 -0800 (PST)
Date:   Fri, 26 Nov 2021 16:37:14 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 19/26] drm: support more than one write fence in
 drm_gem_plane_helper_prepare_fb
Message-ID: <YaD/Kq4xTZ6jWikq@phenom.ffwll.local>
References: <20211123142111.3885-1-christian.koenig@amd.com>
 <20211123142111.3885-20-christian.koenig@amd.com>
 <YZ+wCxjFSI4EAIvx@phenom.ffwll.local>
 <0a3f93f1-278e-c393-3e79-745a52694f3d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a3f93f1-278e-c393-3e79-745a52694f3d@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 26, 2021 at 11:30:19AM +0100, Christian König wrote:
> Am 25.11.21 um 16:47 schrieb Daniel Vetter:
> > On Tue, Nov 23, 2021 at 03:21:04PM +0100, Christian König wrote:
> > > Use dma_resv_get_singleton() here to eventually get more than one write
> > > fence as single fence.
> > Yeah this is nice, atomic commit helpers not supporting multiple write
> > fences was really my main worry in this entire endeavour. Otherwise looks
> > all rather reasonable.
> > 
> > I'll try to find some review bandwidth, but would be really if you can
> > volunteer others too (especially making sure ttm drivers set the KERNEL
> > fences correctly in all cases).
> 
> Maybe I should split that up into switching over to adding the enum and then
> switching to kernel/bookkeep(previously other) for some use cases.
> 
> It would be good if I could get an rb on the trivial driver cleanups first.
> I can send those out individually if that helps.

Yeah some of the conversion patches might make sense to be split a bit
more. Especially when there's functional changes hiding, but I tought
you've split them out? But didn't read them in detail.

Either way for stuff like this I think it's always best to split the
mechanical stuff from the concept intro/docs and functional changes,
except when it's really very obvious what's going on and just as small
patch.
-Daniel

> 
> Thanks,
> Christian.
> 
> > -Daniel
> > 
> > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > ---
> > >   drivers/gpu/drm/drm_gem_atomic_helper.c | 18 +++++++-----------
> > >   1 file changed, 7 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
> > > index c3189afe10cb..9338ddb7edff 100644
> > > --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
> > > +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
> > > @@ -143,25 +143,21 @@
> > >    */
> > >   int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
> > >   {
> > > -	struct dma_resv_iter cursor;
> > >   	struct drm_gem_object *obj;
> > >   	struct dma_fence *fence;
> > > +	int ret;
> > >   	if (!state->fb)
> > >   		return 0;
> > >   	obj = drm_gem_fb_get_obj(state->fb, 0);
> > > -	dma_resv_iter_begin(&cursor, obj->resv, false);
> > > -	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> > > -		/* TODO: Currently there should be only one write fence, so this
> > > -		 * here works fine. But drm_atomic_set_fence_for_plane() should
> > > -		 * be changed to be able to handle more fences in general for
> > > -		 * multiple BOs per fb anyway. */
> > > -		dma_fence_get(fence);
> > > -		break;
> > > -	}
> > > -	dma_resv_iter_end(&cursor);
> > > +	ret = dma_resv_get_singleton(obj->resv, false, &fence);
> > > +	if (ret)
> > > +		return ret;
> > > +	/* TODO: drm_atomic_set_fence_for_plane() should be changed to be able
> > > +	 * to handle more fences in general for multiple BOs per fb.
> > > +	 */
> > >   	drm_atomic_set_fence_for_plane(state, fence);
> > >   	return 0;
> > >   }
> > > -- 
> > > 2.25.1
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
