Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFA3F369FFB
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 09:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbhDXHgH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 03:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhDXHgF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 03:36:05 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB8EC061574;
        Sat, 24 Apr 2021 00:35:25 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id u25so19800783ljg.7;
        Sat, 24 Apr 2021 00:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2xzt0TwFb7j5MFVkCwVBVCaWI3Xt54Nzm8hUuSX7Cvs=;
        b=hxPk+ZwFtxfPuYj5FheeGacrvGCGSaPpyL0IS7nUKDIL26hgkb/qRm5KgE55q23mQw
         cNkdvFrvG4kUxeGFYQ1zfDOhLvqMW8HKegQe0eiIM+Wc/UnCbkNBP3VUDQC/ONeDjuHY
         LI6TBb2CQJFKEQlh17XyVy5KMSvZKbTvJsGn6Yrv1C/3PZRLJL8R9o01b9tLpwj/omhp
         Pbe4hNlMCfmbIttqVq4CoXmvkqE8HiJWiaXQ011FhxJlm2Jik0F4UWSDgVHu8kfwx0PL
         tOwyGKSt4LP2VREo1nU2pNfMiJD4oOQ9dtlDBYh+IKMEwo2j5GZpdFGSs1doykGBkcr3
         hsmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2xzt0TwFb7j5MFVkCwVBVCaWI3Xt54Nzm8hUuSX7Cvs=;
        b=fO1MEVKkhxOtZkKlkyVXvuHEReOsMOJOeccAjkORNSNjN2Y+Flc0C3BbgADeOlG8Ny
         Hwn1IZKVd5AAMbznsI/U69smkRMP2VxsuLm59V/rRVX7ejq5FkLJRGltzEk/seE9DGUa
         zuGI1mcdYeSN7ooyS+oiqImuM8bsqx/ZI2uYJEG36Ucbgz7DiwRUF4xX8ampHR0y8r8i
         osoLu4OWLcbWCUPPzObN3WlFrpUFJfmGn+/Ca6jYatzrTNj0mteiAQuE7gaAEa0oAAPp
         vo6MYo+04wzRQ1kJWg5yIrsWH1N/mAIvrlLsQuT8UtMRXtfA0Fpw+IeasP1blbTfJxDR
         C3jg==
X-Gm-Message-State: AOAM533V8wsU24z2hrU6Zht2TMLbM1WvgwluD30/d8gZPqxdR6U+/tS/
        bfJ2X5e29Wj7dclGf3bhC6MPcEJheNI=
X-Google-Smtp-Source: ABdhPJz3hk6pvojBuze7LU7uwmy4xRRaSDqJeO49ImDYhiosWRVfDwrj9DXybLRRMSMDys3mqsskbg==
X-Received: by 2002:a2e:b6c7:: with SMTP id m7mr4974245ljo.241.1619249724022;
        Sat, 24 Apr 2021 00:35:24 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-103.dynamic.spd-mgts.ru. [109.252.193.103])
        by smtp.googlemail.com with ESMTPSA id s8sm762729ljg.16.2021.04.24.00.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Apr 2021 00:35:23 -0700 (PDT)
Subject: Re: [PATCH 17/78] staging: media: vde: use
 pm_runtime_resume_and_get()
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
 <0eeb886803679cd908cb4576d35b2314993abd2c.1619191723.git.mchehab+huawei@kernel.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2349831b-e7cd-d38d-fc19-5fabf06f773e@gmail.com>
Date:   Sat, 24 Apr 2021 10:35:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0eeb886803679cd908cb4576d35b2314993abd2c.1619191723.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

24.04.2021 09:44, Mauro Carvalho Chehab пишет:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/staging/media/tegra-vde/vde.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
> index 28845b5bafaf..8936f140a246 100644
> --- a/drivers/staging/media/tegra-vde/vde.c
> +++ b/drivers/staging/media/tegra-vde/vde.c
> @@ -775,9 +775,9 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
>  	if (ret)
>  		goto release_dpb_frames;
>  
> -	ret = pm_runtime_get_sync(dev);
> +	ret = pm_runtime_resume_and_get(dev);
>  	if (ret < 0)
> -		goto put_runtime_pm;
> +		goto unlock;
>  
>  	/*
>  	 * We rely on the VDE registers reset value, otherwise VDE
> @@ -843,6 +843,8 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
>  put_runtime_pm:
>  	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
> +
> +unlock:
>  	mutex_unlock(&vde->lock);
>  
>  release_dpb_frames:
> @@ -1069,8 +1071,8 @@ static int tegra_vde_probe(struct platform_device *pdev)
>  	 * power-cycle it in order to put hardware into a predictable lower
>  	 * power state.
>  	 */
> -	pm_runtime_get_sync(dev);
> -	pm_runtime_put(dev);
> +	if (pm_runtime_resume_and_get(dev) >= 0)
> +		pm_runtime_put(dev);
>  
>  	return 0;
>  
> @@ -1088,8 +1090,9 @@ static int tegra_vde_remove(struct platform_device *pdev)
>  {
>  	struct tegra_vde *vde = platform_get_drvdata(pdev);
>  	struct device *dev = &pdev->dev;
> +	int ret;
>  
> -	pm_runtime_get_sync(dev);
> +	ret = pm_runtime_resume_and_get(dev);
>  	pm_runtime_dont_use_autosuspend(dev);
>  	pm_runtime_disable(dev);
>  
> @@ -1097,7 +1100,8 @@ static int tegra_vde_remove(struct platform_device *pdev)
>  	 * Balance RPM state, the VDE power domain is left ON and hardware
>  	 * is clock-gated. It's safe to reboot machine now.
>  	 */
> -	pm_runtime_put_noidle(dev);
> +	if (ret >= 0)
> +		pm_runtime_put_noidle(dev);
>  	clk_disable_unprepare(vde->clk);
>  
>  	misc_deregister(&vde->miscdev);
> 

Hello Mauro,

Thank you very much for the patch. It looks to me that the original
variant was a bit simpler, this patch adds more code lines without
changing the previous behaviour. Or am I missing something?
