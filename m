Return-Path: <linux-media+bounces-37793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB509B06048
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 16:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D813177230
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 14:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2879D2EE968;
	Tue, 15 Jul 2025 13:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="IYNqd9Y0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC3B2EE962
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 13:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752587794; cv=none; b=umQ2gSCPEfBsGczx3mKHjnXGYq9uPGsQX2oHzx7Lsq0TkIy9OuYzWF0Z2xngifsjtdO/7qWWDGtqUlVqnFRayhJeyLGyioFGTmzpT7uNLa4BmS4/9BY6JC5M4BCV4sVBbJGLijryRfHxh8U9+vVYTHDOXwdQd17XnkQM+c4pqqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752587794; c=relaxed/simple;
	bh=YESQyAIGOya5AfOhg62W8gn7QNGPOV3WPqR34Fme3RE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bl4ZIDijHops7AMy+0PhTG+Na3gWB8ZRtoM0GVw0t34tHG5oyNjRepfw6g2yK/zMInVxlWLjvLL5eieubdOndVmB26QHWxAJV4CC8Vc6BHrt/FUFjX1CwM8yMW0bX+92HP3yO/XU1xsgTgLx/UbaZF0+V5XfdZ2COpgiMb4QP9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=IYNqd9Y0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-454ac069223so32997345e9.1
        for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 06:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1752587791; x=1753192591; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hn+WuqRR1t5R9mQwZhl3jtziWMIfUg5J12SJufxMgDI=;
        b=IYNqd9Y04TsovrYJIyN1E4L9BeU+2hBw/tFgVMZNJwAqjopvTl7hLVIhuQIg1YoQLp
         Lu8rUmszGvacz6/bBAEVTleHsFHx3q8kK8CtClOp2f8dLyidynTZB5tXFDKw7uZeXeGI
         lpGmPFsydfJLg4AnUzlEnlbv6t1Mq1aM03Xis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752587791; x=1753192591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hn+WuqRR1t5R9mQwZhl3jtziWMIfUg5J12SJufxMgDI=;
        b=c3NCRPfLElZhfuZBHmS/IL8D1XRCtLQ9zQPPZRRe4ytXCrRIE9vGWiKjOi9g3XpJLJ
         wVkGqmWVPj/x8tXQkkll6aKJQ48MrHs6yfI2CJkQfQ3Lb98KHeyn5X4MvXVa3hJT/9R8
         B4WZygKzxuxWz6vwr3YE4fJE9TD4PW3JfVEyZBYmsO36gZIdoJgW0Fj6vbfm8ZlEhJ8b
         RvML0MYIXaRBa8+2VwPi1tUXeXlnNLi4SWNj5u7iWfkCNaDA4oAXLRluNW8ek7GRzgb7
         PhTG2IvdzjOVaJM5FdARddjvFfek29ixCvF8ahb8PfazETAn4Q4ScDhK2q6QBY11J501
         /Bbw==
X-Forwarded-Encrypted: i=1; AJvYcCXCISH81SKQXSZwyIbFOEMjSqDrv440pttmb2ZkSLD0x06NwYXJbChp4expMQco+Wa1XgJpDIMsZKdEbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGuX7TzOLjVrqFdBHUAESS4TRLzU/OLOeFSIdIAScMb1PhxGTx
	FEXLlzsvKX3G/ymYQnI40YVWCRoPVq21dbZTxp2sZPsJqmbsbM1d0IL0y2yOU3CSQvaTekBwi6X
	kXHNVWso=
X-Gm-Gg: ASbGncvz6F3OCQ0rHcI43ga7IQ3lTT1gCYmkz3b4gLv0sIwQXhLDqlaO7knbXBxooRZ
	d2Q1dM6CjuWcwFtXXRssYd3SZWr8pu+92pYfVlf6VmIPZZ6zmDbt8D4RBcrfozO5Die7gAG590A
	8yAZcpULIK5Ws7UJuOL6xRb9iG93EV386eKbQoSxDsnwn7ovE3cR9/F8x5AHC4IJPXZIM3W6L+q
	5WikAxGBFrF38PuWtE/dk7uucHO7GND0PKWUbNmo85b8TVXPe+po7NP2KBACcfeVcyAVUJi+B42
	klxiRlXjJCIp4IOzAEEXjlZMzt6IM+B2Z0nXXJRB/XkXsYPkb7Wr0IYRv2KikiT5ez4efpqhtVp
	TcOYJ7rm1xP7Z9Nc21ROdmpWDt1qR08qA6g==
X-Google-Smtp-Source: AGHT+IFTv64UdrkysCJ2yuTEiKwcSb+1/4iYjcQ5l+Q8OyQYeLKhaF8jbrFd+PIwKagB43BFmrw6cA==
X-Received: by 2002:a05:600c:4e14:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-45625e1cc84mr37560615e9.3.1752587790620;
        Tue, 15 Jul 2025 06:56:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561b25a948sm60727255e9.35.2025.07.15.06.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 06:56:28 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:56:24 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
	patches@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
	Anusha Srivatsa <asrivats@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 6.15 085/192] drm/gem: Acquire references on GEM handles
 for framebuffers
Message-ID: <aHZeCE249cYEGCc2@phenom.ffwll.local>
References: <20250715130814.854109770@linuxfoundation.org>
 <20250715130818.327986464@linuxfoundation.org>
 <d52b4d04-cb02-48d2-9042-b135a30f8a8e@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d52b4d04-cb02-48d2-9042-b135a30f8a8e@amd.com>
X-Operating-System: Linux phenom 6.12.30-amd64 

On Tue, Jul 15, 2025 at 03:43:08PM +0200, Christian König wrote:
> We are about to revert this patch. Not sure if backporting it makes sense at the moment.

I think it still makes sense, at least as an interim fix.

What I discussed with Thomas is that first we want to revert back from
gem_bo->dma_buf to gem_bo->import_attach.dmabuf everywhere. And those
patches are sprinkled over various branches/trees/releases. So it'll take
a while to catch them all. Meanwhile these two patches at least take care
of the worst fallout, they're already tested and in the pipeline - I don't
think it makes sense to hold them up and wait.

It might take us until 6.17-rc1 until we've caught all the trees and made
sure the backports of those reverts have happened, and I don't think we
should wait that long.

Cheers, Sima

> Regards,
> Christian.
> 
> On 15.07.25 15:13, Greg Kroah-Hartman wrote:
> > 6.15-stable review patch.  If anyone has any objections, please let me know.
> > 
> > ------------------
> > 
> > From: Thomas Zimmermann <tzimmermann@suse.de>
> > 
> > commit 5307dce878d4126e1b375587318955bd019c3741 upstream.
> > 
> > A GEM handle can be released while the GEM buffer object is attached
> > to a DRM framebuffer. This leads to the release of the dma-buf backing
> > the buffer object, if any. [1] Trying to use the framebuffer in further
> > mode-setting operations leads to a segmentation fault. Most easily
> > happens with driver that use shadow planes for vmap-ing the dma-buf
> > during a page flip. An example is shown below.
> > 
> > [  156.791968] ------------[ cut here ]------------
> > [  156.796830] WARNING: CPU: 2 PID: 2255 at drivers/dma-buf/dma-buf.c:1527 dma_buf_vmap+0x224/0x430
> > [...]
> > [  156.942028] RIP: 0010:dma_buf_vmap+0x224/0x430
> > [  157.043420] Call Trace:
> > [  157.045898]  <TASK>
> > [  157.048030]  ? show_trace_log_lvl+0x1af/0x2c0
> > [  157.052436]  ? show_trace_log_lvl+0x1af/0x2c0
> > [  157.056836]  ? show_trace_log_lvl+0x1af/0x2c0
> > [  157.061253]  ? drm_gem_shmem_vmap+0x74/0x710
> > [  157.065567]  ? dma_buf_vmap+0x224/0x430
> > [  157.069446]  ? __warn.cold+0x58/0xe4
> > [  157.073061]  ? dma_buf_vmap+0x224/0x430
> > [  157.077111]  ? report_bug+0x1dd/0x390
> > [  157.080842]  ? handle_bug+0x5e/0xa0
> > [  157.084389]  ? exc_invalid_op+0x14/0x50
> > [  157.088291]  ? asm_exc_invalid_op+0x16/0x20
> > [  157.092548]  ? dma_buf_vmap+0x224/0x430
> > [  157.096663]  ? dma_resv_get_singleton+0x6d/0x230
> > [  157.101341]  ? __pfx_dma_buf_vmap+0x10/0x10
> > [  157.105588]  ? __pfx_dma_resv_get_singleton+0x10/0x10
> > [  157.110697]  drm_gem_shmem_vmap+0x74/0x710
> > [  157.114866]  drm_gem_vmap+0xa9/0x1b0
> > [  157.118763]  drm_gem_vmap_unlocked+0x46/0xa0
> > [  157.123086]  drm_gem_fb_vmap+0xab/0x300
> > [  157.126979]  drm_atomic_helper_prepare_planes.part.0+0x487/0xb10
> > [  157.133032]  ? lockdep_init_map_type+0x19d/0x880
> > [  157.137701]  drm_atomic_helper_commit+0x13d/0x2e0
> > [  157.142671]  ? drm_atomic_nonblocking_commit+0xa0/0x180
> > [  157.147988]  drm_mode_atomic_ioctl+0x766/0xe40
> > [...]
> > [  157.346424] ---[ end trace 0000000000000000 ]---
> > 
> > Acquiring GEM handles for the framebuffer's GEM buffer objects prevents
> > this from happening. The framebuffer's cleanup later puts the handle
> > references.
> > 
> > Commit 1a148af06000 ("drm/gem-shmem: Use dma_buf from GEM object
> > instance") triggers the segmentation fault easily by using the dma-buf
> > field more widely. The underlying issue with reference counting has
> > been present before.
> > 
> > v2:
> > - acquire the handle instead of the BO (Christian)
> > - fix comment style (Christian)
> > - drop the Fixes tag (Christian)
> > - rename err_ gotos
> > - add missing Link tag
> > 
> > Suggested-by: Christian König <christian.koenig@amd.com>
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Link: https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/drm_gem.c#L241 # [1]
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Anusha Srivatsa <asrivats@redhat.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Cc: <stable@vger.kernel.org>
> > Reviewed-by: Christian König <christian.koenig@amd.com>
> > Link: https://lore.kernel.org/r/20250630084001.293053-1-tzimmermann@suse.de
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  drivers/gpu/drm/drm_gem.c                    |   44 ++++++++++++++++++++++++---
> >  drivers/gpu/drm/drm_gem_framebuffer_helper.c |   16 +++++----
> >  drivers/gpu/drm/drm_internal.h               |    2 +
> >  3 files changed, 51 insertions(+), 11 deletions(-)
> > 
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -212,6 +212,35 @@ void drm_gem_private_object_fini(struct
> >  }
> >  EXPORT_SYMBOL(drm_gem_private_object_fini);
> >  
> > +static void drm_gem_object_handle_get(struct drm_gem_object *obj)
> > +{
> > +	struct drm_device *dev = obj->dev;
> > +
> > +	drm_WARN_ON(dev, !mutex_is_locked(&dev->object_name_lock));
> > +
> > +	if (obj->handle_count++ == 0)
> > +		drm_gem_object_get(obj);
> > +}
> > +
> > +/**
> > + * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
> > + * @obj: GEM object
> > + *
> > + * Acquires a reference on the GEM buffer object's handle. Required
> > + * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
> > + * to release the reference.
> > + */
> > +void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
> > +{
> > +	struct drm_device *dev = obj->dev;
> > +
> > +	guard(mutex)(&dev->object_name_lock);
> > +
> > +	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
> > +	drm_gem_object_handle_get(obj);
> > +}
> > +EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
> > +
> >  /**
> >   * drm_gem_object_handle_free - release resources bound to userspace handles
> >   * @obj: GEM object to clean up.
> > @@ -242,8 +271,14 @@ static void drm_gem_object_exported_dma_
> >  	}
> >  }
> >  
> > -static void
> > -drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
> > +/**
> > + * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
> > + * @obj: GEM object
> > + *
> > + * Releases a reference on the GEM buffer object's handle. Possibly releases
> > + * the GEM buffer object and associated dma-buf objects.
> > + */
> > +void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
> >  {
> >  	struct drm_device *dev = obj->dev;
> >  	bool final = false;
> > @@ -268,6 +303,7 @@ drm_gem_object_handle_put_unlocked(struc
> >  	if (final)
> >  		drm_gem_object_put(obj);
> >  }
> > +EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
> >  
> >  /*
> >   * Called at device or object close to release the file's
> > @@ -389,8 +425,8 @@ drm_gem_handle_create_tail(struct drm_fi
> >  	int ret;
> >  
> >  	WARN_ON(!mutex_is_locked(&dev->object_name_lock));
> > -	if (obj->handle_count++ == 0)
> > -		drm_gem_object_get(obj);
> > +
> > +	drm_gem_object_handle_get(obj);
> >  
> >  	/*
> >  	 * Get the user-visible handle using idr.  Preload and perform
> > --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> > @@ -99,7 +99,7 @@ void drm_gem_fb_destroy(struct drm_frame
> >  	unsigned int i;
> >  
> >  	for (i = 0; i < fb->format->num_planes; i++)
> > -		drm_gem_object_put(fb->obj[i]);
> > +		drm_gem_object_handle_put_unlocked(fb->obj[i]);
> >  
> >  	drm_framebuffer_cleanup(fb);
> >  	kfree(fb);
> > @@ -182,8 +182,10 @@ int drm_gem_fb_init_with_funcs(struct dr
> >  		if (!objs[i]) {
> >  			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
> >  			ret = -ENOENT;
> > -			goto err_gem_object_put;
> > +			goto err_gem_object_handle_put_unlocked;
> >  		}
> > +		drm_gem_object_handle_get_unlocked(objs[i]);
> > +		drm_gem_object_put(objs[i]);
> >  
> >  		min_size = (height - 1) * mode_cmd->pitches[i]
> >  			 + drm_format_info_min_pitch(info, i, width)
> > @@ -193,22 +195,22 @@ int drm_gem_fb_init_with_funcs(struct dr
> >  			drm_dbg_kms(dev,
> >  				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
> >  				    objs[i]->size, min_size, i);
> > -			drm_gem_object_put(objs[i]);
> > +			drm_gem_object_handle_put_unlocked(objs[i]);
> >  			ret = -EINVAL;
> > -			goto err_gem_object_put;
> > +			goto err_gem_object_handle_put_unlocked;
> >  		}
> >  	}
> >  
> >  	ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
> >  	if (ret)
> > -		goto err_gem_object_put;
> > +		goto err_gem_object_handle_put_unlocked;
> >  
> >  	return 0;
> >  
> > -err_gem_object_put:
> > +err_gem_object_handle_put_unlocked:
> >  	while (i > 0) {
> >  		--i;
> > -		drm_gem_object_put(objs[i]);
> > +		drm_gem_object_handle_put_unlocked(objs[i]);
> >  	}
> >  	return ret;
> >  }
> > --- a/drivers/gpu/drm/drm_internal.h
> > +++ b/drivers/gpu/drm/drm_internal.h
> > @@ -161,6 +161,8 @@ void drm_sysfs_lease_event(struct drm_de
> >  
> >  /* drm_gem.c */
> >  int drm_gem_init(struct drm_device *dev);
> > +void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
> > +void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
> >  int drm_gem_handle_create_tail(struct drm_file *file_priv,
> >  			       struct drm_gem_object *obj,
> >  			       u32 *handlep);
> > 
> > 
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

