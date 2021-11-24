Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 701AC45B2A6
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 04:29:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240837AbhKXDcc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 22:32:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236391AbhKXDcc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 22:32:32 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29632C061574
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 19:29:23 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so2088446otl.3
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 19:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8ROEgjj9dwhub6ZuCfok4JjBKlCe/uMhWihGHQdFWd0=;
        b=ivBFmRnyhBPWmFrcLaow5Fj5kCMXhM3NVr2r7U8821+73ztlJGHZImAU+qKT/cWfKq
         UnZjAwJINWzNBSNvUgDIkORyknBHjeTcm6/q7QztAUQ/xrkcPKh6sqjS8l0eLdE3N4Gw
         BwmPYI4Un6sH4duuF5L8H9bzMSHOewd/0Ln8ix1Pz/HliB9tjNZ8e/60sVG4zgdNja8u
         zLH0ZHDq4cW3vk6Rkp4RuZm3DiyfsAWP6hvG/MwSgdnjW+lty8N38N2OZSBCw+kM9ZoO
         BjkpQofYSi0azZsVN8rE0gTIWYtNBZwY3s+0DJHuySQmwJ1uVyUM6JT5Rq3H+oKIWIkj
         Hrwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8ROEgjj9dwhub6ZuCfok4JjBKlCe/uMhWihGHQdFWd0=;
        b=1eJU1EjCZ2HnBdwiivzGnxTW5HPjRImUvA1KvmbJVMU03b43P3p3LjcIsBdy/ABMiT
         Xc6sbSII8MX/MwP9yOdZdkDj9IOWREMb2TdzcPn+in0Ig866RkVH7rCRQhYQbaDG97gS
         nVVmvpMOhqtbIb6PYXy8EdanrQ4QNbTxlxZmY0FQAe94sIzAiGoq+u3dzymRanUDL0R8
         8BYbzn1LXcplNTUqaxEObakh/TA97YZhdwffcJ7dQzwxRw2/zl57sqUaSliicS3NcEfH
         ihFefUoB9YRFxKXHAJhA+T6KedBv9Cz6R4qd4cFQ80Hh3jJwxoYyQNaQaJX/wme2hWe3
         hFkA==
X-Gm-Message-State: AOAM5305U/8V6dhv0CDl5A6Y09PSprVSP/UfzRMnZ5DXM8/9K4+GRnZc
        Kxpn2eAhz6ImxrwVcct6AK+faw==
X-Google-Smtp-Source: ABdhPJxmqKDi2PFt55dxuwEEF4GmPvManvD9r+U4PB2o2in3yHnwMohXmeyuwrpRemeqPbu5Pa+XGw==
X-Received: by 2002:a9d:6ac7:: with SMTP id m7mr9713131otq.306.1637724562448;
        Tue, 23 Nov 2021 19:29:22 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q1sm2989893oiv.42.2021.11.23.19.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 19:29:21 -0800 (PST)
Date:   Tue, 23 Nov 2021 19:31:07 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tadeusz Struk <tadeusz.struk@linaro.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: venus: Synchronize probe() between venus_core
 and enc/dec
Message-ID: <YZ2x+xuvnHC48MHg@ripper>
References: <20211029214833.2615274-1-tadeusz.struk@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211029214833.2615274-1-tadeusz.struk@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri 29 Oct 14:48 PDT 2021, Tadeusz Struk wrote:

> Venus video encode/decode hardware driver consists of three modules.
> The parent module venus-core, and two sub modules venus-enc and venus-dec.
> The venus-core module allocates a common structure that is used by the
> enc/dec modules, loads the firmware, and performs some common hardware
> initialization. Since the three modules are loaded one after the other,
> and their probe functions can run in parallel it is possible that
> the venc_probe and vdec_probe functions can finish before the core
> venus_probe function, which then can fail when, for example it
> fails to load the firmware. In this case the subsequent call to venc_open
> causes an Oops as it tries to dereference already uninitialized structures
> through dev->parent and the system crashes in __pm_runtime_resume() as in
> the trace below:
> 
> [   26.064835][  T485] Internal error: Oops: 96000006 [#1] PREEMPT SMP
> [   26.270914][  T485] Hardware name: Thundercomm Dragonboard 845c (DT)
> [   26.285019][  T485] pc : __pm_runtime_resume+0x34/0x178
> [   26.286374][  T213] lt9611 10-003b: hdmi cable connected
> [   26.290285][  T485] lr : venc_open+0xc0/0x278 [venus_enc]
> [   26.290326][  T485] Call trace:
> [   26.290328][  T485]  __pm_runtime_resume+0x34/0x178
> [   26.290330][  T485]  venc_open+0xc0/0x278 [venus_enc]
> [   26.290335][  T485]  v4l2_open+0x184/0x294
> [   26.290340][  T485]  chrdev_open+0x468/0x5c8
> [   26.290344][  T485]  do_dentry_open+0x260/0x54c
> [   26.290349][  T485]  path_openat+0xbe8/0xd5c
> [   26.290352][  T485]  do_filp_open+0xb8/0x168
> [   26.290354][  T485]  do_sys_openat2+0xa4/0x1e8
> [   26.290357][  T485]  __arm64_compat_sys_openat+0x70/0x9c
> [   26.290359][  T485]  invoke_syscall+0x60/0x170
> [   26.290363][  T485]  el0_svc_common+0xb8/0xf8
> [   26.290365][  T485]  do_el0_svc_compat+0x20/0x30
> [   26.290367][  T485]  el0_svc_compat+0x24/0x84
> [   26.290372][  T485]  el0t_32_sync_handler+0x7c/0xbc
> [   26.290374][  T485]  el0t_32_sync+0x1b8/0x1bc
> [   26.290381][  T485] ---[ end trace 04ca7c088b4c1a9c ]---
> [   26.290383][  T485] Kernel panic - not syncing: Oops: Fatal exception
> 
> This can be fixed by synchronizing the three probe functions and
> only allowing the venc_probe() and vdec_probe() to pass when venus_probe()
> returns success.
> 
> Changes in v2:
> - Change locking from mutex_lock to mutex_trylock
>   in venc_probe and vdec_probe to avoid potential deadlock.
> 

Rather than trying to synchronize away the side effects of
of_platform_populate() I think we should stop using it.

I had the very same problem in the qcom_wcnss remoteproc driver and
in below change I got rid of that by manually initializing a struct
device for the child node. In the event that the child probe defer I
would just probe defer the parent as well.

1fcef985c8bd ("remoteproc: qcom: wcnss: Fix race with iris probe")

The change might look a little bit messy, but the end result it much
cleaner than relying on various locks etc.


But in the qcom_wcnss case I have a child _device_ because I need
something to do e.g. regulator_get() on. I fail to see why venc and vdec
are devices in the first place.

Regards,
Bjorn

> Signed-off-by: Tadeusz Struk <tadeusz.struk@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.c |  6 ++++++
>  drivers/media/platform/qcom/venus/core.h |  2 ++
>  drivers/media/platform/qcom/venus/vdec.c | 24 +++++++++++++++++++++---
>  drivers/media/platform/qcom/venus/venc.c | 24 +++++++++++++++++++++---
>  4 files changed, 50 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 91b15842c555..18f3e3a9823f 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -317,6 +317,7 @@ static int venus_probe(struct platform_device *pdev)
>  
>  	INIT_LIST_HEAD(&core->instances);
>  	mutex_init(&core->lock);
> +	mutex_init(&core->sync_lock);
>  	INIT_DELAYED_WORK(&core->work, venus_sys_error_handler);
>  
>  	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, hfi_isr_thread,
> @@ -331,6 +332,8 @@ static int venus_probe(struct platform_device *pdev)
>  
>  	venus_assign_register_offsets(core);
>  
> +	mutex_lock(&core->sync_lock);
> +
>  	ret = v4l2_device_register(dev, &core->v4l2_dev);
>  	if (ret)
>  		goto err_core_deinit;
> @@ -377,6 +380,7 @@ static int venus_probe(struct platform_device *pdev)
>  		goto err_dev_unregister;
>  	}
>  
> +	mutex_unlock(&core->sync_lock);
>  	venus_dbgfs_init(core);
>  
>  	return 0;
> @@ -392,6 +396,7 @@ static int venus_probe(struct platform_device *pdev)
>  	hfi_destroy(core);
>  err_core_deinit:
>  	hfi_core_deinit(core, false);
> +	mutex_unlock(&core->sync_lock);
>  err_core_put:
>  	if (core->pm_ops->core_put)
>  		core->pm_ops->core_put(core);
> @@ -428,6 +433,7 @@ static int venus_remove(struct platform_device *pdev)
>  
>  	mutex_destroy(&core->pm_lock);
>  	mutex_destroy(&core->lock);
> +	mutex_destroy(&core->sync_lock);
>  	venus_dbgfs_deinit(core);
>  
>  	return ret;
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 5ec851115eca..3f80dc26febb 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -119,6 +119,7 @@ struct venus_format {
>   * @use_tz:	a flag that suggests presence of trustzone
>   * @fw:		structure of firmware parameters
>   * @lock:	a lock for this strucure
> + * @sync_lock	a lock for probe sync between venus_core and venus_enc/dec
>   * @instances:	a list_head of all instances
>   * @insts_count:	num of instances
>   * @state:	the state of the venus core
> @@ -176,6 +177,7 @@ struct venus_core {
>  		size_t mem_size;
>  	} fw;
>  	struct mutex lock;
> +	struct mutex sync_lock;
>  	struct list_head instances;
>  	atomic_t insts_count;
>  	unsigned int state;
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 198e47eb63f4..959e43bb6c00 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1659,17 +1659,32 @@ static int vdec_probe(struct platform_device *pdev)
>  	if (!core)
>  		return -EPROBE_DEFER;
>  
> +	/* Sync and wait on the venus core to initialize first.
> +	 * If we manage to acquire the sync_lock here it means
> +	 * that the venus_probe() finished running */
> +	ret = mutex_trylock(&core->sync_lock);
> +	if (!ret) {
> +		return -EPROBE_DEFER;
> +	} else {
> +		if (core->state != CORE_INIT) {
> +			ret = -ENODEV;
> +			goto err_core_unlock;
> +		}
> +	}
> +
>  	platform_set_drvdata(pdev, core);
>  
>  	if (core->pm_ops->vdec_get) {
>  		ret = core->pm_ops->vdec_get(dev);
>  		if (ret)
> -			return ret;
> +			goto err_core_unlock;
>  	}
>  
>  	vdev = video_device_alloc();
> -	if (!vdev)
> -		return -ENOMEM;
> +	if (!vdev) {
> +		ret = -ENOMEM;
> +		goto err_core_unlock;
> +	}
>  
>  	strscpy(vdev->name, "qcom-venus-decoder", sizeof(vdev->name));
>  	vdev->release = video_device_release;
> @@ -1690,11 +1705,14 @@ static int vdec_probe(struct platform_device *pdev)
>  	pm_runtime_set_autosuspend_delay(dev, 2000);
>  	pm_runtime_use_autosuspend(dev);
>  	pm_runtime_enable(dev);
> +	mutex_unlock(&core->sync_lock);
>  
>  	return 0;
>  
>  err_vdev_release:
>  	video_device_release(vdev);
> +err_core_unlock:
> +	mutex_unlock(&core->sync_lock);
>  	return ret;
>  }
>  
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index bc1c42dd53c0..11ec7bff5e3f 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -1338,17 +1338,32 @@ static int venc_probe(struct platform_device *pdev)
>  	if (!core)
>  		return -EPROBE_DEFER;
>  
> +	/* Sync and wait on the venus core to initialize first.
> +	 * If we manage to acquire the sync_lock here it means
> +	 * that the venus_probe() finished running */
> +	ret = mutex_trylock(&core->sync_lock);
> +	if (!ret) {
> +		return -EPROBE_DEFER;
> +	} else {
> +		if (core->state != CORE_INIT) {
> +			ret = -ENODEV;
> +			goto err_core_unlock;
> +		}
> +	}
> +
>  	platform_set_drvdata(pdev, core);
>  
>  	if (core->pm_ops->venc_get) {
>  		ret = core->pm_ops->venc_get(dev);
>  		if (ret)
> -			return ret;
> +			goto err_core_unlock;
>  	}
>  
>  	vdev = video_device_alloc();
> -	if (!vdev)
> -		return -ENOMEM;
> +	if (!vdev) {
> +		ret = -ENOMEM;
> +		goto err_core_unlock;
> +	}
>  
>  	strscpy(vdev->name, "qcom-venus-encoder", sizeof(vdev->name));
>  	vdev->release = video_device_release;
> @@ -1367,11 +1382,14 @@ static int venc_probe(struct platform_device *pdev)
>  
>  	video_set_drvdata(vdev, core);
>  	pm_runtime_enable(dev);
> +	mutex_unlock(&core->sync_lock);
>  
>  	return 0;
>  
>  err_vdev_release:
>  	video_device_release(vdev);
> +err_core_unlock:
> +	mutex_unlock(&core->sync_lock);
>  	return ret;
>  }
>  
> -- 
> 2.31.1
> 
