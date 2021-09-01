Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 613E13FD515
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 10:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243047AbhIAIPx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 04:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243076AbhIAIPw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 04:15:52 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD4FEC061764
        for <linux-media@vger.kernel.org>; Wed,  1 Sep 2021 01:14:55 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id x6so3075411wrv.13
        for <linux-media@vger.kernel.org>; Wed, 01 Sep 2021 01:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cFYWmSVza/PDqmeG9+mx1DB+NWXTWb3lrfYbe+Cf8H0=;
        b=MLrEW9JLxfB6p+wAyuTPj6dSuKUhqYV2DIIcmmqqQXSdgNZgeWa19wk4Z42umtT+C0
         KSGP6E93x+6FOJP5foOpfKL9JwClHiYl/Y937aO5gZxezRL3g50OeppPRXdPcRLACy/e
         t0PgyB+L54MPEoMxpI/kAi3i/5Qqbeyo/IuKQtdsgYTHt3jVCt+Tkf2OZx7vVt3yb3mr
         SrPtVHeXjXMG7pHeGIkUfp56qhVLXFnuMLvfgdlMZ0rMyy8gY3044o5dd/682PaRMKML
         3NEfo//PRsnBpIe4gqr63OZLY5ybBZBUk2TQufzPRCqkpXEaq9Lq7CBRNzZZoWV45kGB
         VcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=cFYWmSVza/PDqmeG9+mx1DB+NWXTWb3lrfYbe+Cf8H0=;
        b=f7QgVILp/d/PuBZaibiWxtCYf4h96vY9TZa5VrhV3JZ24X7+SUC8PN9Oz6wFEUZHgJ
         +Nnd5nKtT3jVCrFg5gI33Xz1/wrD4Lyl6zrX44tIqgCyLfhOSw6qAv95HRITJ+VgGl8z
         VkBKCw/B5H64yY7AnesgV9A5RUtmiqkIm1Tzj2FoMLXGibdLcvAz4NJVaP2gDcWxgrNL
         MZZ++0QdOVnvCCddPdrn08UOzAMAY/0XEBfOJMjruCP7bW5mfWWSTI+Uo7cVCXwCoC+Q
         G3QvUvrOYUNPOHKvvb2PVYv0ahUV5qaOyIa4G/GcQjxh/J/xTrC1XgmBAvfzPu+PwGVg
         khkw==
X-Gm-Message-State: AOAM533mVQUzNoJF/pyO/f2aPaqpIUMSx7UCtuqHSYehc4sZotlkqNPf
        89BIiiYIqgeYi1ikMYHP8YRz9A==
X-Google-Smtp-Source: ABdhPJxLni/w6zWQomeDOrFtWu/rq9Z2RFy8vK4jBYwFD7uQ/9lPOEPwsdlI8KL0b/AnY3L7iVV1zw==
X-Received: by 2002:adf:df0c:: with SMTP id y12mr35443384wrl.155.1630484094200;
        Wed, 01 Sep 2021 01:14:54 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:dc57:bccf:6106:11d1? ([2001:861:44c0:66c0:dc57:bccf:6106:11d1])
        by smtp.gmail.com with ESMTPSA id d6sm18556934wra.5.2021.09.01.01.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 01:14:53 -0700 (PDT)
Subject: Re: [PATCH] media: rc: meson-ir: Make use of the helper function
 devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210901055440.7079-1-caihuoqing@baidu.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <c8b8f064-7887-9608-573c-525799641c6d@baylibre.com>
Date:   Wed, 1 Sep 2021 10:14:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901055440.7079-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/09/2021 07:54, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/media/rc/meson-ir.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
> index dad55950dfc6..4b769111f78e 100644
> --- a/drivers/media/rc/meson-ir.c
> +++ b/drivers/media/rc/meson-ir.c
> @@ -102,7 +102,6 @@ static int meson_ir_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *node = dev->of_node;
> -	struct resource *res;
>  	const char *map_name;
>  	struct meson_ir *ir;
>  	int irq, ret;
> @@ -111,8 +110,7 @@ static int meson_ir_probe(struct platform_device *pdev)
>  	if (!ir)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	ir->reg = devm_ioremap_resource(dev, res);
> +	ir->reg = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(ir->reg))
>  		return PTR_ERR(ir->reg);
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
