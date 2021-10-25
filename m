Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 077A4439A5E
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 17:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbhJYPZE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 11:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233395AbhJYPZE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 11:25:04 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B19AC061745
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 08:22:41 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id u18so10123282wrg.5
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 08:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=eMmqWJZ6oJqIJ/55vipIBrGpLZzc8VL4SaUkmNSwTfE=;
        b=eOIIywv3bmsf2Pm9Q9q4Dp+g1UsEZTb9BA/sFGJjAalCXgOh/n/F/zkRW7hXLkCyEa
         KleTHwt56/oX0k67+xiZjEqVK9Y77k0b7C2WT+II6AZ2AlisvbHcky7wSv/aJx1d/0C7
         9f3GjfHWUOcQp/d9RLdpga9RTmxyf7XGbv9nZO3EBW1gCAbfeFKrznAMneaP7bZO7A35
         yQA6Z59DKd2ClGXKfTv7V1I7Og+o9iukbs3K/0Gwz/8QREnTKj+bYLWTllbdncan54TA
         QYfs5ahmkNXoJyuMxN0AnwhVwbJ3fJ6iq0D0DugSF1/3qOp8Pz+R8LT5hp/GlVmqa9Kf
         PxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eMmqWJZ6oJqIJ/55vipIBrGpLZzc8VL4SaUkmNSwTfE=;
        b=VSg0LzaeIF+thi229UQiGzTNUHDplBVyTCpbKjEj2VqzBKB+RuhdU/gw+EN4nSMym6
         NQqXuASDoAhPBtBOoXHTr4cuUTXwT5y8yD2hdqJ3SXOmJ4oDXcz6A5wTCktb+UtgTdms
         0ehSGPc58uYXRFVD5n/I8DDqzNq07kjqANiPbBybNf5EVJ9nLOixbUBixk7whleNlds0
         tgAS1WUJIORBPf7zI8x2Pg96iRuRjtEblTS1yxoSFUQJKSI+/tvO1ruJsvxgFI4Wy9h4
         vGSLvrmirCDPe0OCnXOBQs1zwLxhWrS9riopu/MiBzlXzVN0aHaQFxhB25JcKlbPmkLL
         eWMA==
X-Gm-Message-State: AOAM532cwk+MOwxAO7zhT/CcxMj7W4XkW6JSk/KOo+yqriYcTLPHGHnz
        5hiTwPEqSF5vWHGpps+T/0Tnxg==
X-Google-Smtp-Source: ABdhPJysGNhOAZSe8Z3U0WxQ0j9b092wEfMRqFQtgUVEKt9cvBy2B4xlXrvfnSyVfdXvgPJHw8PYuA==
X-Received: by 2002:a05:6000:18c7:: with SMTP id w7mr23572122wrq.411.1635175360158;
        Mon, 25 Oct 2021 08:22:40 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o2sm13412452wrg.1.2021.10.25.08.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 08:22:39 -0700 (PDT)
Message-ID: <72f8dd7a-66c7-fb50-db23-f98ba753af1d@nexus-software.ie>
Date:   Mon, 25 Oct 2021 16:24:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH] media: venus: Synchronize probe() between venus_core and
 enc/dec
Content-Language: en-US
To:     Tadeusz Struk <tadeusz.struk@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211025144345.267107-1-tadeusz.struk@linaro.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20211025144345.267107-1-tadeusz.struk@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/10/2021 15:43, Tadeusz Struk wrote:
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
> Signed-off-by: Tadeusz Struk <tadeusz.struk@linaro.org>
> ---

> +	struct mutex sync_lock;

Why have an additional mutex, will the existing core::lock not do ?

>   	struct list_head instances;
>   	atomic_t insts_count;
>   	unsigned int state;
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 198e47eb63f4..9dbda3d7a2d2 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1659,17 +1659,26 @@ static int vdec_probe(struct platform_device *pdev)
>   	if (!core)
>   		return -EPROBE_DEFER;
>   
> +	mutex_lock(&core->sync_lock);
> +
> +	if (core->state != CORE_INIT) {
> +		ret = -ENODEV;
> +		goto err_core_unlock;
> +	}
> +
>   	platform_set_drvdata(pdev, core);
>   
>   	if (core->pm_ops->vdec_get) {
>   		ret = core->pm_ops->vdec_get(dev);
>   		if (ret)
> -			return ret;
> +			goto err_core_unlock;
>   	}
>   
>   	vdev = video_device_alloc();
> -	if (!vdev)
> -		return -ENOMEM;
> +	if (!vdev) {
> +		ret = -ENOMEM;
> +		goto err_core_unlock;
> +	}
>   
>   	strscpy(vdev->name, "qcom-venus-decoder", sizeof(vdev->name));
>   	vdev->release = video_device_release;
> @@ -1690,11 +1699,14 @@ static int vdec_probe(struct platform_device *pdev)
>   	pm_runtime_set_autosuspend_delay(dev, 2000);
>   	pm_runtime_use_autosuspend(dev);
>   	pm_runtime_enable(dev);
> +	mutex_unlock(&core->sync_lock);
>   
>   	return 0;
>   
>   err_vdev_release:
>   	video_device_release(vdev);
> +err_core_unlock:
> +	mutex_unlock(&core->sync_lock);
>   	return ret;
>   }
>   
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index bc1c42dd53c0..e7439236385a 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -1338,17 +1338,26 @@ static int venc_probe(struct platform_device *pdev)
>   	if (!core)
>   		return -EPROBE_DEFER;
>   
> +	mutex_lock(&core->sync_lock);
> +
> +	if (core->state != CORE_INIT) {
> +		ret = -ENODEV;
> +		goto err_core_unlock;
> +	}
> +

shouldn't this be an -EPROBE_DEFER i.e. CORE_INIT hasn't completed/run 
yet so defer until it does.

This fragment here looks racy to me without a DEFER above ?

drivers/media/platform/qcom/venus/core.c::venus_probe()

ret = v4l2_device_register(dev, &core->v4l2_dev);
if (ret)
         goto err_core_deinit;

platform_set_drvdata(pdev, core);

pm_runtime_enable(dev);

ret = pm_runtime_get_sync(dev);
if (ret < 0)
         goto err_runtime_disable;

ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
if (ret)
         goto err_runtime_disable;

ret = venus_firmware_init(core);
if (ret)
         goto err_runtime_disable;

ret = venus_boot(core);
if (ret)
         goto err_runtime_disable;

ret = hfi_core_resume(core, true);
if (ret)
         goto err_venus_shutdown;

ret = hfi_core_init(core);
if (ret)
         goto err_venus_shutdown;

---
bod
