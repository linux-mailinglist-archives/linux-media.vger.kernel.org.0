Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF913B1986
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 14:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhFWMFR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 08:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbhFWMFR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 08:05:17 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09C44C061574;
        Wed, 23 Jun 2021 05:03:00 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id y13so1058415plc.8;
        Wed, 23 Jun 2021 05:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fQH2VhS640xPyWRrnlWS1Vp5yXvD7bzUh0HWl4/D5zI=;
        b=UKn6D4Q/W/Mprkh286udm+ozfSvf5BA1+yxQJZ59a7UPhsLzTqYat4/bD0m6p7tTxf
         i+yCwBqXirczXYTI/tGkgpE2+RWzlqZAEiOQO8KL9gOQfSmNkNsj/1aXPVVMILi5EKMo
         5pC8+p8RC9abtX6C7icd0HgyQMxQQx64DzD1sFgWEFArla1nV5+9fTnywo+fg4Rc+/n+
         7lOIqmSGkvYBtaw16Bxuj9nRKKE+K67QRtvB92RSWVPf1QvNHdW19VYD3INO+mHa51By
         bNh4d0PkoKI5avZX5gSJ2ieaZlsmbTdMBwTtI21f9DSM07KoBM76Zc9pOv4Enynx47Gz
         Gt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fQH2VhS640xPyWRrnlWS1Vp5yXvD7bzUh0HWl4/D5zI=;
        b=QNuG+7y5IFkEYhDxPA+rcjp1ekYbXcSw4F3WN2llARdZtm7pJhK5M2EJvWpvPvfhzC
         mymNFZXzRXPE69hmSl0JtxAyfuNiS0i7ZgxxgOULYTnVMTJHukN99254lMTwWQzM0RSF
         wxcAGTP2OQ3BBQQ9A6tIR+E6EuR9vr1+exo04fusz9Tj4Yablj1ie2NAaNXiVrJ3BaXi
         R3h+i5pN5+u38CfYaDSfiscnciCK2PkeAIg831Sb0+fBwG8oXhS29TfjZWwKzrZ4jPkD
         C4pIMNgzg1+CQ7z3ZaIJHakkicwuEI4roGzKWOen9G0cBN8N7UjQehYn6zPS3/9pjVvX
         29kg==
X-Gm-Message-State: AOAM532y82Bxv+IKn9n11L1jdTyIX8WRgGkuOJ2w1DBqtrObCiERX/uk
        5sEZ6xbD6wLB+b0s/+mc8A8=
X-Google-Smtp-Source: ABdhPJweV71CyzVQrkFMii0jIjJyGhbPAtS7xI4iS8ZHu2pKazRE/PXu/MEWuJx9NkAEelJ1t7A5pw==
X-Received: by 2002:a17:902:7103:b029:124:72fd:fbd1 with SMTP id a3-20020a1709027103b029012472fdfbd1mr15263564pll.64.1624449779375;
        Wed, 23 Jun 2021 05:02:59 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id b6sm22785525pgw.67.2021.06.23.05.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jun 2021 05:02:58 -0700 (PDT)
Subject: Re: [PATCH v4 1/2] drm: add a locked version of drm_is_current_master
To:     daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org, airlied@linux.ie,
        christian.koenig@amd.com, sumit.semwal@linaro.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        emil.l.velikov@gmail.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
        mripard@kernel.org, tzimmermann@suse.de,
        maarten.lankhorst@linux.intel.com
References: <20210623113740.6260-1-desmondcheongzx@gmail.com>
 <20210623113740.6260-2-desmondcheongzx@gmail.com>
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <322b9a09-7375-a41a-abf6-4fc1108f8926@gmail.com>
Date:   Wed, 23 Jun 2021 20:02:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623113740.6260-2-desmondcheongzx@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/6/21 7:37 pm, Desmond Cheong Zhi Xi wrote:
> While checking the master status of the DRM file in
> drm_is_current_master(), the device's master mutex should be
> held. Without the mutex, the pointer fpriv->master may be freed
> concurrently by another process calling drm_setmaster_ioctl(). This
> could lead to use-after-free errors when the pointer is subsequently
> dereferenced in drm_lease_owner().
> 
> The callers of drm_is_current_master() from drm_auth.c hold the
> device's master mutex, but external callers do not. Hence, we implement
> drm_is_current_master_locked() to be used within drm_auth.c, and
> modify drm_is_current_master() to grab the device's master mutex
> before checking the master status.
> 
> Additionally, to avoid a circular lock dependency by introducing
> drm_device.master_mutex into drm_is_current_master(), we move the call
> to drm_is_current_master() in drm_mode_getconnector out from the
> section locked by &dev->mode_config.mutex.
> 
> Failing to avoid this lock dependency produces the following lockdep
> splat:
> 
> ======================================================
> WARNING: possible circular locking dependency detected
> 5.13.0-rc7-CI-CI_DRM_10254+ #1 Not tainted
> ------------------------------------------------------
> kms_frontbuffer/1087 is trying to acquire lock:
> ffff88810dcd01a8 (&dev->master_mutex){+.+.}-{3:3}, at: drm_is_current_master+0x1b/0x40
> but task is already holding lock:
> ffff88810dcd0488 (&dev->mode_config.mutex){+.+.}-{3:3}, at: drm_mode_getconnector+0x1c6/0x4a0
> which lock already depends on the new lock.
> the existing dependency chain (in reverse order) is:
> -> #2 (&dev->mode_config.mutex){+.+.}-{3:3}:
>         __mutex_lock+0xab/0x970
>         drm_client_modeset_probe+0x22e/0xca0
>         __drm_fb_helper_initial_config_and_unlock+0x42/0x540
>         intel_fbdev_initial_config+0xf/0x20 [i915]
>         async_run_entry_fn+0x28/0x130
>         process_one_work+0x26d/0x5c0
>         worker_thread+0x37/0x380
>         kthread+0x144/0x170
>         ret_from_fork+0x1f/0x30
> -> #1 (&client->modeset_mutex){+.+.}-{3:3}:
>         __mutex_lock+0xab/0x970
>         drm_client_modeset_commit_locked+0x1c/0x180
>         drm_client_modeset_commit+0x1c/0x40
>         __drm_fb_helper_restore_fbdev_mode_unlocked+0x88/0xb0
>         drm_fb_helper_set_par+0x34/0x40
>         intel_fbdev_set_par+0x11/0x40 [i915]
>         fbcon_init+0x270/0x4f0
>         visual_init+0xc6/0x130
>         do_bind_con_driver+0x1e5/0x2d0
>         do_take_over_console+0x10e/0x180
>         do_fbcon_takeover+0x53/0xb0
>         register_framebuffer+0x22d/0x310
>         __drm_fb_helper_initial_config_and_unlock+0x36c/0x540
>         intel_fbdev_initial_config+0xf/0x20 [i915]
>         async_run_entry_fn+0x28/0x130
>         process_one_work+0x26d/0x5c0
>         worker_thread+0x37/0x380
>         kthread+0x144/0x170
>         ret_from_fork+0x1f/0x30
> -> #0 (&dev->master_mutex){+.+.}-{3:3}:
>         __lock_acquire+0x151e/0x2590
>         lock_acquire+0xd1/0x3d0
>         __mutex_lock+0xab/0x970
>         drm_is_current_master+0x1b/0x40
>         drm_mode_getconnector+0x37e/0x4a0
>         drm_ioctl_kernel+0xa8/0xf0
>         drm_ioctl+0x1e8/0x390
>         __x64_sys_ioctl+0x6a/0xa0
>         do_syscall_64+0x39/0xb0
>         entry_SYSCALL_64_after_hwframe+0x44/0xae
> other info that might help us debug this:
> Chain exists of: &dev->master_mutex --> &client->modeset_mutex --> &dev->mode_config.mutex
>   Possible unsafe locking scenario:
>         CPU0                    CPU1
>         ----                    ----
>    lock(&dev->mode_config.mutex);
>                                 lock(&client->modeset_mutex);
>                                 lock(&dev->mode_config.mutex);
>    lock(&dev->master_mutex);
> *** DEADLOCK ***
> 1 lock held by kms_frontbuffer/1087:
>   #0: ffff88810dcd0488 (&dev->mode_config.mutex){+.+.}-{3:3}, at: drm_mode_getconnector+0x1c6/0x4a0
> stack backtrace:
> CPU: 7 PID: 1087 Comm: kms_frontbuffer Not tainted 5.13.0-rc7-CI-CI_DRM_10254+ #1
> Hardware name: Intel Corporation Ice Lake Client Platform/IceLake U DDR4 SODIMM PD RVP TLC, BIOS ICLSFWR1.R00.3234.A01.1906141750 06/14/2019
> Call Trace:
>   dump_stack+0x7f/0xad
>   check_noncircular+0x12e/0x150
>   __lock_acquire+0x151e/0x2590
>   lock_acquire+0xd1/0x3d0
>   __mutex_lock+0xab/0x970
>   drm_is_current_master+0x1b/0x40
>   drm_mode_getconnector+0x37e/0x4a0
>   drm_ioctl_kernel+0xa8/0xf0
>   drm_ioctl+0x1e8/0x390
>   __x64_sys_ioctl+0x6a/0xa0
>   do_syscall_64+0x39/0xb0
>   entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
>   drivers/gpu/drm/drm_auth.c      | 51 +++++++++++++++++++++------------
>   drivers/gpu/drm/drm_connector.c |  5 +++-
>   2 files changed, 36 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index f00e5abdbbf4..ab1863c5a5a0 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -61,6 +61,35 @@
>    * trusted clients.
>    */
>   
> +static bool drm_is_current_master_locked(struct drm_file *fpriv)
> +{
> +	lockdep_assert_held_once(&fpriv->minor->dev->master_mutex);
> +
> +	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
> +}
> +
> +/**
> + * drm_is_current_master - checks whether @priv is the current master
> + * @fpriv: DRM file private
> + *
> + * Checks whether @fpriv is current master on its device. This decides whether a
> + * client is allowed to run DRM_MASTER IOCTLs.
> + *
> + * Most of the modern IOCTL which require DRM_MASTER are for kernel modesetting
> + * - the current master is assumed to own the non-shareable display hardware.
> + */
> +bool drm_is_current_master(struct drm_file *fpriv)
> +{
> +	bool ret;
> +
> +	mutex_lock(&fpriv->minor->dev->master_mutex);
> +	ret = drm_is_current_master_locked(fpriv);
> +	mutex_unlock(&fpriv->minor->dev->master_mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_is_current_master);
> +
>   int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
>   {
>   	struct drm_auth *auth = data;
> @@ -223,7 +252,7 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
>   	if (ret)
>   		goto out_unlock;
>   
> -	if (drm_is_current_master(file_priv))
> +	if (drm_is_current_master_locked(file_priv))
>   		goto out_unlock;
>   
>   	if (dev->master) {
> @@ -272,7 +301,7 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
>   	if (ret)
>   		goto out_unlock;
>   
> -	if (!drm_is_current_master(file_priv)) {
> +	if (!drm_is_current_master_locked(file_priv)) {
>   		ret = -EINVAL;
>   		goto out_unlock;
>   	}
> @@ -321,7 +350,7 @@ void drm_master_release(struct drm_file *file_priv)
>   	if (file_priv->magic)
>   		idr_remove(&file_priv->master->magic_map, file_priv->magic);
>   
> -	if (!drm_is_current_master(file_priv))
> +	if (!drm_is_current_master_locked(file_priv))
>   		goto out;
>   
>   	drm_legacy_lock_master_cleanup(dev, master);
> @@ -342,22 +371,6 @@ void drm_master_release(struct drm_file *file_priv)
>   	mutex_unlock(&dev->master_mutex);
>   }
>   
> -/**
> - * drm_is_current_master - checks whether @priv is the current master
> - * @fpriv: DRM file private
> - *
> - * Checks whether @fpriv is current master on its device. This decides whether a
> - * client is allowed to run DRM_MASTER IOCTLs.
> - *
> - * Most of the modern IOCTL which require DRM_MASTER are for kernel modesetting
> - * - the current master is assumed to own the non-shareable display hardware.
> - */
> -bool drm_is_current_master(struct drm_file *fpriv)
> -{
> -	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
> -}
> -EXPORT_SYMBOL(drm_is_current_master);
> -
>   /**
>    * drm_master_get - reference a master pointer
>    * @master: &struct drm_master
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index da39e7ff6965..a5f63bad3893 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2414,6 +2414,7 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
>   	struct drm_mode_modeinfo u_mode;
>   	struct drm_mode_modeinfo __user *mode_ptr;
>   	uint32_t __user *encoder_ptr;
> +	bool is_current_master;
>   
>   	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>   		return -EOPNOTSUPP;
> @@ -2444,9 +2445,11 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
>   	out_resp->connector_type = connector->connector_type;
>   	out_resp->connector_type_id = connector->connector_type_id;
>   
> +	is_current_master = drm_is_current_master(file_priv)
> +
>   	mutex_lock(&dev->mode_config.mutex);
>   	if (out_resp->count_modes == 0) {
> -		if (drm_is_current_master(file_priv))
> +		if (is_current_master)
>   			connector->funcs->fill_modes(connector,
>   						     dev->mode_config.max_width,
>   						     dev->mode_config.max_height);
> 

Hi Daniel,

My bad, I just realized that this patch won't apply to stable because of 
the changes to drm_connector.c.

Will the intel-gfx CI apply the patches in order if I break up this 
patch and move the changes to drm_connector.c earlier in the series?

Best wishes,
Desmond
