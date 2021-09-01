Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8C963FD651
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 11:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243438AbhIAJTO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 05:19:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232048AbhIAJTO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 05:19:14 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97382C061575;
        Wed,  1 Sep 2021 02:18:17 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id s3so3671112ljp.11;
        Wed, 01 Sep 2021 02:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jaONncWw3Nrc3WJwgDaEmida3dPXbcIs1+TgjP/mlxE=;
        b=hxJ6ov4NLwAeidP140erfLeU06cDjtlaGLMIoA9t3QPsqmUFULLsI+Av4hMsC7MJyC
         ITBWg1jU/D5Fs33yrtQBZWdXBbckBIinp30p32xRlnuLM9NVUyoZqAAHZh7XCFm0rc2w
         xvGIqh6oDmBxJ7KP6uBYjsHrQu8wsynObGTdFtODjAvzlnNGEHSjRMDjTf8IKZwCiJSv
         4Yp9wzr0FCwtxfc3hM8PnzDhktb9Qp3788hGOGboSEB6ywaQHF9n1Hkq13alIXatYD5U
         uXV/mY7c9WSQSpsiWbMek7qUKx/Ju+POpD2QsMSORO5adVELstim455e/w5oKnT6s94H
         YvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jaONncWw3Nrc3WJwgDaEmida3dPXbcIs1+TgjP/mlxE=;
        b=U0Ke+PVA6LmLf+pEWiZ5CHFsQbNtuuoQCvfNN1l0TvOdFPriOTYBfEBJWwucad9f6s
         7FHuCWGQkznhOGYG9TA7iJeyEvN8RRNqaLnsonDXhFwH/pT2Sbg9YtfVHdcAb/fmucDP
         r2/filPufC6xuf+whKD7xxoyyBax1kKsHc2mgmmnTbIWY9h3MQg9Qf9RR2g4gri5YxQA
         f42OVUUzuG9lMtB4/HNyQBWMHxJ6iAQbaPZB5G5NnxFjcVbYdekOC8Ug5kjdEv4MTC8J
         lpRVcmG5bZlRQB4Y8B4/Bk9tnpVgnwyfeACEiqEnB6X5+lsyGvItvwwhtn+uWuwniMLU
         wXcQ==
X-Gm-Message-State: AOAM5308hYWGKaptRl6qePfqN3ZGvPwRtuocTDiTlcKL5a24R7oGQqbk
        3P2cqI0WtAVBAmVXvs0/UcJ/jo2w+4o=
X-Google-Smtp-Source: ABdhPJz6PjLY3oQgbBKviLMMhQ0a8KqRDvngsM70mkE8G9tKYx67eWp9vpyYtiVRTJimNiYTHwYEgw==
X-Received: by 2002:a05:651c:1064:: with SMTP id y4mr29612571ljm.74.1630487895951;
        Wed, 01 Sep 2021 02:18:15 -0700 (PDT)
Received: from [192.168.0.192] ([194.146.248.73])
        by smtp.gmail.com with ESMTPSA id bn3sm2689373ljb.18.2021.09.01.02.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 02:18:15 -0700 (PDT)
Subject: Re: [PATCH] media: s5p-jpeg: Make use of the helper function
 devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210901055609.7679-1-caihuoqing@baidu.com>
From:   Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Message-ID: <d734bf08-1fb0-2805-1b67-b79f3d9efe7e@gmail.com>
Date:   Wed, 1 Sep 2021 11:18:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901055609.7679-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Cai Huoqing,

Thank you for the patch.

W dniu 01.09.2021 o 07:56, Cai Huoqing pisze:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Acked-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>

> ---
>   drivers/media/platform/s5p-jpeg/jpeg-core.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
> index d402e456f27d..1faff037cdf7 100644
> --- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
> +++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
> @@ -2850,7 +2850,6 @@ static void *jpeg_get_drv_data(struct device *dev);
>   static int s5p_jpeg_probe(struct platform_device *pdev)
>   {
>   	struct s5p_jpeg *jpeg;
> -	struct resource *res;
>   	int i, ret;
>   
>   	/* JPEG IP abstraction struct */
> @@ -2867,9 +2866,7 @@ static int s5p_jpeg_probe(struct platform_device *pdev)
>   	jpeg->dev = &pdev->dev;
>   
>   	/* memory-mapped registers */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
> -	jpeg->regs = devm_ioremap_resource(&pdev->dev, res);
> +	jpeg->regs = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(jpeg->regs))
>   		return PTR_ERR(jpeg->regs);
>   
> 
