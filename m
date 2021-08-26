Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C17C3F84ED
	for <lists+linux-media@lfdr.de>; Thu, 26 Aug 2021 11:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241228AbhHZJ7J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Aug 2021 05:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241275AbhHZJ7F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Aug 2021 05:59:05 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F1C3C0617AE
        for <linux-media@vger.kernel.org>; Thu, 26 Aug 2021 02:58:16 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id u9so4073905wrg.8
        for <linux-media@vger.kernel.org>; Thu, 26 Aug 2021 02:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=K6u0Zu5YEr8y4W3P37RoD4zOuM0xcePf+NAf5fjmYUY=;
        b=OYntDdruYT6QL81TNNqsV14R7lpWMhP5RNvBBtu2FU/YaAjcMa/NOOsp/utPM+YdQo
         iAuUtfEyiPHywQWdOkUzyiLsNGFBqBEh/kpLbm/8ZWRZimxDXWEkTPdStN1CRJyB+2L+
         ess4YxVwDk5SZGgcAAgBLRdOtUeFSgGL2pR80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=K6u0Zu5YEr8y4W3P37RoD4zOuM0xcePf+NAf5fjmYUY=;
        b=lXMFVfRyfQ3Fy9XbAFcvRrhqY8j/Sl7SEBqrEQnSYXYY/StvcGFsJABszPyGcIs4Vq
         /e/40F0RGacPKdDP5knEuLVPJo9131FKLBFOEHONifvS+hE+l91Wx8FzoBvGgkNbSAEq
         8x3ezYV6jwjU87tgpSpxamYUe7IzpEGVSjePb+4iwb8CRzHpSd9LQPNHCJkc+8n+/uxw
         J1C4gFyyx6LVAvVJo1UOOjQzm27f9jTSlULGWwxB5e5CrIcmdt7FJ1RYPAzGDY6Vh27X
         bgQHu5BXFZURoPAU/rr823mDH5ituwHcEY0WWANBSS1yWV6Pu7jyhJzJWiwYkyZdMHON
         ddCA==
X-Gm-Message-State: AOAM530baDadt54WpYtFgCBApzxIydUVUcRpt5dR5Hv0LEQzQTVAAbFh
        KDr7FcX5mFNZSz02IFKu8MRnyg==
X-Google-Smtp-Source: ABdhPJyy1AIu+N6Qrm0z0c8isGbaksnKSxYxmVOligV+SnW4ABRlEHb7NKPuhCyurRIGXrKY/cYmRg==
X-Received: by 2002:adf:b741:: with SMTP id n1mr1668981wre.120.1629971894987;
        Thu, 26 Aug 2021 02:58:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id m4sm7986290wml.28.2021.08.26.02.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 02:58:14 -0700 (PDT)
Date:   Thu, 26 Aug 2021 11:58:12 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, chris@chris-wilson.co.uk,
        ville.syrjala@linux.intel.com, matthew.auld@intel.com,
        dan.carpenter@oracle.com, tvrtko.ursulin@intel.com,
        matthew.d.roper@intel.com, lucas.demarchi@intel.com,
        karthik.b.s@intel.com, jose.souza@intel.com,
        manasi.d.navare@intel.com, airlied@redhat.com,
        aditya.swarup@intel.com, andrescj@chromium.org,
        linux-graphics-maintainer@vmware.com, zackr@vmware.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v8 3/7] drm: lock drm_global_mutex earlier in the ioctl
 handler
Message-ID: <YSdltHVQnIr+vkTn@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
        christian.koenig@amd.com, jani.nikula@linux.intel.com,
        joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
        chris@chris-wilson.co.uk, ville.syrjala@linux.intel.com,
        matthew.auld@intel.com, dan.carpenter@oracle.com,
        tvrtko.ursulin@intel.com, matthew.d.roper@intel.com,
        lucas.demarchi@intel.com, karthik.b.s@intel.com,
        jose.souza@intel.com, manasi.d.navare@intel.com, airlied@redhat.com,
        aditya.swarup@intel.com, andrescj@chromium.org,
        linux-graphics-maintainer@vmware.com, zackr@vmware.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
 <20210826020122.1488002-4-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826020122.1488002-4-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 26, 2021 at 10:01:18AM +0800, Desmond Cheong Zhi Xi wrote:
> In a future patch, a read lock on drm_device.master_rwsem is
> held in the ioctl handler before the check for ioctl
> permissions. However, this inverts the lock hierarchy of
> drm_global_mutex --> master_rwsem.
> 
> To avoid this, we do some prep work to grab the drm_global_mutex
> before checking for ioctl permissions.
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
>  drivers/gpu/drm/drm_ioctl.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index d25713b09b80..158629d88319 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -772,19 +772,19 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
>  	if (drm_dev_is_unplugged(dev))
>  		return -ENODEV;
>  
> +	/* Enforce sane locking for modern driver ioctls. */
> +	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) && !(flags & DRM_UNLOCKED))

Maybe have a local bool locked_ioctl for this so it's extremely clear it's
the same condition in both?

Either way: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +		mutex_lock(&drm_global_mutex);
> +
>  	retcode = drm_ioctl_permit(flags, file_priv);
>  	if (unlikely(retcode))
> -		return retcode;
> +		goto out;
>  
> -	/* Enforce sane locking for modern driver ioctls. */
> -	if (likely(!drm_core_check_feature(dev, DRIVER_LEGACY)) ||
> -	    (flags & DRM_UNLOCKED))
> -		retcode = func(dev, kdata, file_priv);
> -	else {
> -		mutex_lock(&drm_global_mutex);
> -		retcode = func(dev, kdata, file_priv);
> +	retcode = func(dev, kdata, file_priv);
> +
> +out:
> +	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) && !(flags & DRM_UNLOCKED))
>  		mutex_unlock(&drm_global_mutex);
> -	}
>  	return retcode;
>  }
>  EXPORT_SYMBOL(drm_ioctl_kernel);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
