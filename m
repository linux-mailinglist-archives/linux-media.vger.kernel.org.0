Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542143FD512
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 10:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243069AbhIAIPt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 04:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243032AbhIAIPr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 04:15:47 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8FF3C061575
        for <linux-media@vger.kernel.org>; Wed,  1 Sep 2021 01:14:50 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id b6so3106048wrh.10
        for <linux-media@vger.kernel.org>; Wed, 01 Sep 2021 01:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0kNi+lHjT7XSbTIRmVqe8NrtAKLHSCB9511ZIsHzw8c=;
        b=Xk/9LzB/mLcmSdOGB85ZKeBG/oBz6bm38CwERpRHUUJ9AaKuMsCwhkgLCG/+X5i3AK
         EIZmCVrrTF5rVnqiL//gSzJcTyed9aBeMW/ySQbiPqWnVisNDoFUtbgFWSq04YBzBA6G
         VJ9+xAt5UnHDNSI1qsIuUBTU+G66rVMHY8VUj2u04wca76ogcfkX0RI4LgbE0eQRBOMg
         /6wpLebSIHUkpsD/TFuzRqYf93nhprwpP27S3iyarcyyvSi/6zvj6kWL/JWSUBY81+wl
         S/fMlaFJfSzvh/4SNPZo2cVhEV5isuofxeahTxn0ECQYFU4DMSU5G6h6D1lvFe+LuZEe
         M+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=0kNi+lHjT7XSbTIRmVqe8NrtAKLHSCB9511ZIsHzw8c=;
        b=DcZ9624a40ai6ersInA8/ZRE2fLteNkF/Dp1AzjFU5nEtFgFnx5VAOYYlaKtpVOzHx
         W/cRU4NYlVKKqBc7kD3APvWQnyez60+ic6iMAotYSmyLFeR4s8cKT+tBCHmw7mdTAyNB
         nKwZN2oC6NBL0lDTNLCDzCghsYQ58oaCvdPOYr6bOxftJsQtjeubFlN0hyQTPvL5gzeH
         MNSdjJsLLSFqC6aVH6uBqtG5tiD23Ed4HGsFP3kDZa6SXl6cit0+8j76C7mQlGLtyKuS
         V1QrMoVPMR2ILtFTzcriIGv5m8qKeHPaJLkZpEZj1we/qcjt3NNNmCauWTWlwgfJPI+M
         DM9g==
X-Gm-Message-State: AOAM532JO5paSEmoQTmKEOCrIgGaAu2dRkFMGJvgBMFVSJHHVaKWbfGv
        Y3sqTqIRAB9hiROIPGUwhJbFCA==
X-Google-Smtp-Source: ABdhPJyxbURZu+cLTiD/wlnG7JzpRrfrVGAn3YWSSrKy3Nz3G7pMEs0idSjVO2BC50bYQzXi63uBLA==
X-Received: by 2002:a05:6000:18a:: with SMTP id p10mr36999170wrx.40.1630484089188;
        Wed, 01 Sep 2021 01:14:49 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:dc57:bccf:6106:11d1? ([2001:861:44c0:66c0:dc57:bccf:6106:11d1])
        by smtp.gmail.com with ESMTPSA id t7sm22625455wrq.90.2021.09.01.01.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 01:14:48 -0700 (PDT)
Subject: Re: [PATCH] media: meson: ge2d: Make use of the helper function
 devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210901055154.6829-1-caihuoqing@baidu.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <afd73707-2bbd-611a-2498-df8c7f109275@baylibre.com>
Date:   Wed, 1 Sep 2021 10:14:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901055154.6829-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/09/2021 07:51, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/media/platform/meson/ge2d/ge2d.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/meson/ge2d/ge2d.c b/drivers/media/platform/meson/ge2d/ge2d.c
> index 9b1e973e78da..ccda18e5a377 100644
> --- a/drivers/media/platform/meson/ge2d/ge2d.c
> +++ b/drivers/media/platform/meson/ge2d/ge2d.c
> @@ -922,7 +922,6 @@ static int ge2d_probe(struct platform_device *pdev)
>  	struct reset_control *rst;
>  	struct video_device *vfd;
>  	struct meson_ge2d *ge2d;
> -	struct resource *res;
>  	void __iomem *regs;
>  	int ret = 0;
>  	int irq;
> @@ -937,8 +936,7 @@ static int ge2d_probe(struct platform_device *pdev)
>  	ge2d->dev = &pdev->dev;
>  	mutex_init(&ge2d->mutex);
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	regs = devm_ioremap_resource(ge2d->dev, res);
> +	regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(regs))
>  		return PTR_ERR(regs);
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
