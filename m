Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1905C3FD50E
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 10:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243059AbhIAIPp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 04:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243044AbhIAIPl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 04:15:41 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD97DC061575
        for <linux-media@vger.kernel.org>; Wed,  1 Sep 2021 01:14:44 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id z9-20020a7bc149000000b002e8861aff59so4127595wmi.0
        for <linux-media@vger.kernel.org>; Wed, 01 Sep 2021 01:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rXb4cGIZn6Gdm/5BqKVC12dJx5JJGvLKFEx8SKKKyuQ=;
        b=kZ5l50Zne0I2QYElYM2Ts4GrCDwGZLNXT/NczUEQ6qLa5fU537DXvqfzW0hrQ1OokU
         r9TQF/XmVD+akIjSJU9meYZedrhLpCNRtCup+/3UMiCf+dPll1pYcWpa+Yg2G5krWvfv
         3Z+NbJk2WGyxUQauLD0oamStiP2Qy4itn/q8ZPUULWNcupbhQzxnzPIbgJOxhbF7VyYX
         rFZiq34NOLqqjw5DrS8mkF2j7/b/+Yp+D5koVuloGflrybGHyY+pAaqplx/7lORmT6Fe
         qwo1BTSpfq285lerc8si2xyOkj4IEfpt0o6SAsXVKKx1dy45bVQ+IMG2K/0tCC2qOh8v
         7tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rXb4cGIZn6Gdm/5BqKVC12dJx5JJGvLKFEx8SKKKyuQ=;
        b=SIWAo/gjXtHWyVlkwUe+ffa6h6gamvdb4l4iKhKtfXdP70gbQiQCrs16r5qgMRWWlc
         XogPKwsT0gO58FvnHGtZYwPDifNuIr1uFsMVFchsolQGIlYNci3K/UxDJt5SXl2pRr+5
         Sw9gGqzP6uKtPJ40g+qS7cCLKU0sh2aCA6hn1J46KAHrBDXlAytnDzS/3w+Pi9hS4kKh
         g8TTcY3BWe7WRvxv5t6wdjpe2HLRWOwl45e/xuDefy468n/hlOLiqxMATylUSVtY1Yiw
         c3SRx/BTKZZznUisIijzoxbvmXShBceJFuraLKU0Db4xp+XvZtKJ15nn4sh/2j7jmasj
         w/fg==
X-Gm-Message-State: AOAM5324KGX0jbxFxlY5eniPTMErMcYQG4pJ/QjkJnAsa2tAOYcyn4qI
        k9fzVZ2E5IrYySXjeaK2X6lcnA==
X-Google-Smtp-Source: ABdhPJzYxHE8weTllEHo+KjrzjPaX6EX9pjHZ/VPL4c0s4ptMTyp6/+yI1E02sHi8tFTziVAjvtYIg==
X-Received: by 2002:a1c:7f8e:: with SMTP id a136mr8504168wmd.34.1630484083419;
        Wed, 01 Sep 2021 01:14:43 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:dc57:bccf:6106:11d1? ([2001:861:44c0:66c0:dc57:bccf:6106:11d1])
        by smtp.gmail.com with ESMTPSA id l35sm2409757wms.40.2021.09.01.01.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 01:14:43 -0700 (PDT)
Subject: Re: [PATCH] media: cec: ao-cec: Make use of the helper function
 devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210901054535.6215-1-caihuoqing@baidu.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <4b41b556-b2cd-5ffa-0462-5f41f2d33f85@baylibre.com>
Date:   Wed, 1 Sep 2021 10:14:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901054535.6215-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/09/2021 07:45, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/media/cec/platform/meson/ao-cec-g12a.c | 4 +---
>  drivers/media/cec/platform/meson/ao-cec.c      | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/cec/platform/meson/ao-cec-g12a.c b/drivers/media/cec/platform/meson/ao-cec-g12a.c
> index 891533060d49..68fe6d6a8178 100644
> --- a/drivers/media/cec/platform/meson/ao-cec-g12a.c
> +++ b/drivers/media/cec/platform/meson/ao-cec-g12a.c
> @@ -633,7 +633,6 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
>  {
>  	struct meson_ao_cec_g12a_device *ao_cec;
>  	struct device *hdmi_dev;
> -	struct resource *res;
>  	void __iomem *base;
>  	int ret, irq;
>  
> @@ -664,8 +663,7 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
>  
>  	ao_cec->adap->owner = THIS_MODULE;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(&pdev->dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base)) {
>  		ret = PTR_ERR(base);
>  		goto out_probe_adapter;
> diff --git a/drivers/media/cec/platform/meson/ao-cec.c b/drivers/media/cec/platform/meson/ao-cec.c
> index 09aff82c3773..6b440f0635d9 100644
> --- a/drivers/media/cec/platform/meson/ao-cec.c
> +++ b/drivers/media/cec/platform/meson/ao-cec.c
> @@ -602,7 +602,6 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
>  {
>  	struct meson_ao_cec_device *ao_cec;
>  	struct device *hdmi_dev;
> -	struct resource *res;
>  	int ret, irq;
>  
>  	hdmi_dev = cec_notifier_parse_hdmi_phandle(&pdev->dev);
> @@ -626,8 +625,7 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
>  
>  	ao_cec->adap->owner = THIS_MODULE;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	ao_cec->base = devm_ioremap_resource(&pdev->dev, res);
> +	ao_cec->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(ao_cec->base)) {
>  		ret = PTR_ERR(ao_cec->base);
>  		goto out_probe_adapter;
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
