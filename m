Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78D1A23B4B7
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 07:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729854AbgHDF60 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Aug 2020 01:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbgHDF60 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Aug 2020 01:58:26 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDA4C06174A;
        Mon,  3 Aug 2020 22:58:25 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id g6so29565973ljn.11;
        Mon, 03 Aug 2020 22:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PovWtt/hyyq7GqZJhadvZnSefeeWx2retmil7K8DBl0=;
        b=j512w+piXkOClqZwk8PPWIIwmv0LZ2ToLx2E5QqSFqoaeD8Z210SHobH0nWqZ457K6
         37EtTc5wYusFkJcn1CXIOuJFGrldIzv38iLCWPhavlPqOmjjQ1AV7t02LJhB0llWOuD8
         PXpY45pb4tskFB9KonqhdxBL//A0ASC5mkelYHe4BtAt7ichpEF5SingqlUZLUHVGclZ
         rW4+Z6zePywYsuwkHH2QF+OCzTGGZGlaxmI7R+31SSUeGC9Mjpaca05Lf9QL7p5BkLpt
         omzrh6yFiKSIOAJXpO7jP/htzke0kGvBi6eeDRCXNkiAyLhXFE2V40g3sr4dni2+dSxu
         iDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PovWtt/hyyq7GqZJhadvZnSefeeWx2retmil7K8DBl0=;
        b=VrpmcQ7B/7PsxIGd9mCPxu1siXuXtuvCP5q/C5gddfAFCiDvC03qzEFMRBjIjgyImG
         acj+m5t2mYIXf6WiBzOZY5aMPokbKii4I8PHqE4A8r0cw3G3mmVxVAd/bJIFkz6/jASY
         w3MIPN3jgbxCzAAfLK0wnH8fkxiV1o3nv4NZsOIzpyhvxhTLfj8alj4m9sjwj+/auDra
         1IJ8XXELtqpuVxMcgkbru115UliThRXLhzs2anVg8pltEHtLnA8Bh1TFcFChlVd6eYXI
         2cbcF8OAYormQfK7IpWNzLqKEAoiOLH+o0qaT2WPVCnXLMuA7TJ2YL4LD5GLk6RfglkZ
         nu6A==
X-Gm-Message-State: AOAM533GkIzDtRH7yc4Y0DhnJL4ZRGMPCNSFeIawsZ/bVqpUFxJ9DdOc
        nvuaH9Cx2+ypHiPStaeKEN3zAWfR
X-Google-Smtp-Source: ABdhPJw+sd1rKTXZJUSBPB0N65PD6421E06QjDff/C5/PXiL1pCUKBh5p9a8YKXRX13MwMy3rIgcRA==
X-Received: by 2002:a2e:b55c:: with SMTP id a28mr981400ljn.107.1596520704054;
        Mon, 03 Aug 2020 22:58:24 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id m20sm6546686lfb.72.2020.08.03.22.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2020 22:58:23 -0700 (PDT)
Subject: Re: [PATCH v2 -next] media: staging: tegra-vde: Mark
 tegra_vde_runtime_suspend/resume as __maybe_unused
To:     YueHaibing <yuehaibing@huawei.com>, mchehab@kernel.org,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
References: <20200803115901.44068-1-yuehaibing@huawei.com>
 <20200804014137.45444-1-yuehaibing@huawei.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <709889ed-7757-ab5b-53c9-a061ae062d08@gmail.com>
Date:   Tue, 4 Aug 2020 08:58:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200804014137.45444-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

04.08.2020 04:41, YueHaibing пишет:
> If CONFIG_PM is not set, gcc warns:
> 
> drivers/staging/media/tegra-vde/vde.c:916:12:
>  warning: 'tegra_vde_runtime_suspend' defined but not used [-Wunused-function]
> 
> Make it __maybe_unused to fix this.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v2: both suspend and resume functions marked
> ---
>  drivers/staging/media/tegra-vde/vde.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
> index a3c24d96d5b9..28845b5bafaf 100644
> --- a/drivers/staging/media/tegra-vde/vde.c
> +++ b/drivers/staging/media/tegra-vde/vde.c
> @@ -913,7 +913,7 @@ static irqreturn_t tegra_vde_isr(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> -static int tegra_vde_runtime_suspend(struct device *dev)
> +static __maybe_unused int tegra_vde_runtime_suspend(struct device *dev)
>  {
>  	struct tegra_vde *vde = dev_get_drvdata(dev);
>  	int err;
> @@ -929,7 +929,7 @@ static int tegra_vde_runtime_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int tegra_vde_runtime_resume(struct device *dev)
> +static __maybe_unused int tegra_vde_runtime_resume(struct device *dev)
>  {
>  	struct tegra_vde *vde = dev_get_drvdata(dev);
>  	int err;
> 

Thanks!

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
