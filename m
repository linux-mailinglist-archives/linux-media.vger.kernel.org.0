Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 319DF45AF97
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 23:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbhKWXAk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 18:00:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbhKWXAj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 18:00:39 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 390DDC061574
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 14:57:31 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id b11so275362pld.12
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 14:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/3PsIIKK7UoXMhoYSuG4fvr/lTXeq13xrdfjceY/U20=;
        b=dtlu+klG5+0eE56joTScLTFS0JKqRY1qUK83ZNHRODbLl/CT3pQnRAGH6ROJjczVxN
         d32ckPMVWA1PSRElvtNyblzfoMIbF4OiOwHv3eYtPMRTo5KabhJAODttErtDUWsBPbre
         D/a1qbP8r1lelXP7GQNTLRGOqnvipSZg3ZEF6WuHgB6owneovMRJRXBvbi6vv5QheX6b
         XamsFiYskSdAwFLdDYQJzUAbtbwER9pmJgTIhPirA13Y9AUOyYLRm2J6qO/iqqzQqLQY
         e8luiBv4rFNp+D0pIWymCqf5veDQmlmgKmGWwiTNM1+VCPT1EHPr4ZAjViACHKwaBhrf
         W27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/3PsIIKK7UoXMhoYSuG4fvr/lTXeq13xrdfjceY/U20=;
        b=bPbCtcUjzYlLhRzCNJ4gtSLglVDI0eIngaBA7A8VMc0itLcGl+VNdzvezftHkincMH
         JptZDbNIg3QDYeZxTLLrs4C43bxwCo/U1mBEYNPaQ8jMhNdS7zLCqYsmNgvvsDKO/vPt
         Kz1/QiIPy26geB9rpBJOBlDJvECQQGVfrxnAZAfONF8ok1kWn9HmfTE2V1oi1l8p3AJ6
         Ia06T++YI8HSBduI0PCCSpLulWxk+Eay7kIk4hrfOquVIrRwaN/LHJm+s5E251niiCZk
         KfYIZT8fSkAtatXjM5KA3EU2WLd3FAMEnBAOEf6dRj0fRgeI+2n2yFe4DSQViZk1Hprh
         qMmg==
X-Gm-Message-State: AOAM532xzJaCtsqTvT6LrtzUg9coXXaJ8wa4ksdIqToEN0BWUogrI1VS
        ndii5mUP9m7H6wOfjNjTdJmhtQ==
X-Google-Smtp-Source: ABdhPJxPaDIt3yKaBtJIdD96b2KWT9mxXupw/eFVJsP85GTdAWt5WT+9BQSTMsd+2alGMcadDPMJwA==
X-Received: by 2002:a17:902:a509:b0:143:7eb6:c953 with SMTP id s9-20020a170902a50900b001437eb6c953mr12050752plq.4.1637708250462;
        Tue, 23 Nov 2021 14:57:30 -0800 (PST)
Received: from google.com ([2620:15c:2ce:200:13b4:5c2f:e0e6:ecaf])
        by smtp.gmail.com with ESMTPSA id a18sm12161329pfn.185.2021.11.23.14.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 14:57:30 -0800 (PST)
Date:   Tue, 23 Nov 2021 14:57:26 -0800
From:   Peter Collingbourne <pcc@google.com>
To:     Tadeusz Struk <tadeusz.struk@linaro.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: venus: Synchronize probe() between venus_core
 and enc/dec
Message-ID: <YZ1xP2bKqpzG+mYo@google.com>
References: <20211029214833.2615274-1-tadeusz.struk@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211029214833.2615274-1-tadeusz.struk@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 29, 2021 at 02:48:33PM -0700, Tadeusz Struk wrote:
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
> Signed-off-by: Tadeusz Struk <tadeusz.struk@linaro.org>

I've had this patched in, no crashes so far after several reboots.

Tested-by: Peter Collingbourne <pcc@google.com>

Peter

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
