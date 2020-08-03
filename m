Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 821DC23A6B2
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 14:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728616AbgHCMvm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 08:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728089AbgHCMvY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 08:51:24 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD16C06174A;
        Mon,  3 Aug 2020 05:51:20 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id v12so9171970ljc.10;
        Mon, 03 Aug 2020 05:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E1PtArgjfRMgQPkbPEpkNWZtVLcHwOpeacE7i+LTE34=;
        b=XfvhYsgHRryIe56E2n3nbUW+sRNhQGKbCAxxYdMS79gHcrQZ3iwoA5THCyJwqFvMan
         zEg/iqNxdvpeglrBf4i+8ZZVqTGFskKUU8FVFpIykIEzfv+0tZbp91OyTbmA94ImGJpD
         aiVKRIlTvCjZVCsOPqyf+O3aJFPX92Zd01jLqLbAzaU7hhBwN4QGg3DhjajdjnHmC4/U
         qABVxbj+TfwdOe1Fe/U7hspoM8HDJclIw3EHFBTAIpggmogkEyMtGhG2Ta4hRl3Qgaa5
         Lxu+J9+MF95vx2Mvy5InboBYs1/nDLoL6jgmsnlpD5G4+3UjmxAcR3tm4+AxiM5/nPZA
         LAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E1PtArgjfRMgQPkbPEpkNWZtVLcHwOpeacE7i+LTE34=;
        b=LdIOzs+JSnGadcwqODh9poaFVlHG+0OCTp/sVl2w/jz1Yeya3NTuQ3Yk+Toj7L1B7h
         M9jAcUBWEeKwE3puyBUozRsbQl5esrp6g5ATt2OVz358peys7j6va3YvTKgptA+9uT5o
         ayc654lnJtJ61csbiYLh5+Jr1zCCGGJJoff6gkQL36QqlqGETCkhFMtURa4hQ/n+qQqS
         ajw4iNg9x/2fiPwBtzK5O0HRk9nLRhB/jooxBVNnAxBIbVK1Q5cE/PyJkqULcsZkgvWT
         Hl/0m1HqQWa6CuOv5OtYgvafo6bLaEVPup8XnnmiQL4GTaQQ9Hlnp7aJAQGE2q1VztW+
         lqEQ==
X-Gm-Message-State: AOAM531BQTeT+JU/eu+9O+Tj2+6ZdOPLwozwtGugSi8q00iG/cZz2hvy
        mrZzthI0PUFYElkAnZIkC01uJGuT
X-Google-Smtp-Source: ABdhPJzz8tZyKT2FTlauL+UMMliVTqWJRdc4UfHZdfhNi5L45Su0vIUq+s+xHJd9w4s7odh9priVvg==
X-Received: by 2002:a2e:7f0f:: with SMTP id a15mr6801520ljd.454.1596459078782;
        Mon, 03 Aug 2020 05:51:18 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id t20sm876625ljd.12.2020.08.03.05.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2020 05:51:18 -0700 (PDT)
Subject: Re: [PATCH -next] media: staging: tegra-vde: Mark
 tegra_vde_runtime_suspend as __maybe_unused
To:     YueHaibing <yuehaibing@huawei.com>, mchehab@kernel.org,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
References: <20200803115901.44068-1-yuehaibing@huawei.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <721b8d01-5d7e-09c6-5f86-705130ab31a9@gmail.com>
Date:   Mon, 3 Aug 2020 15:51:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200803115901.44068-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

03.08.2020 14:59, YueHaibing пишет:
> If CONFIG_PM is not set, gcc warns:
> 
> drivers/staging/media/tegra-vde/vde.c:916:12:
>  warning: 'tegra_vde_runtime_suspend' defined but not used [-Wunused-function]
> 
> Make it __maybe_unused to fix this.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/staging/media/tegra-vde/vde.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
> index a3c24d96d5b9..2d043d518eef 100644
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
> 

Hello Yue,

Shouldn't the tegra_vde_runtime_resume() be marked as well?
