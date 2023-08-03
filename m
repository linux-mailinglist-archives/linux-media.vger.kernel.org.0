Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7F8976E065
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 08:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbjHCGjq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 02:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231628AbjHCGjk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 02:39:40 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821491FC3;
        Wed,  2 Aug 2023 23:39:39 -0700 (PDT)
Received: from [192.168.15.130] (94-240-0-14.lukman.pl [94.240.0.14])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E524366015A0;
        Thu,  3 Aug 2023 07:39:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1691044778;
        bh=mbhJCCamZaUvv7gj02tF6AHf2SgoVVliqliY7HWr6Fc=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=Ki+FGbYnYinawxuZ3Md+oDYFBxqYps2wHfnsUIjwuH2Qzpjv2+mgbitN5ERaO/GZD
         K3MiG7Htvsm7FbzZNpPc+Wtb+W2iMrniYONBVcy9/jaDe7Lnk3oVZhh4p0pKJtk/8b
         7iFDXwfN6x7loiHLhmxftkAi7/bQrgJkUyZg7EUG4ao+JEvKtkVY6+Om2tQSsUiOgD
         lclR2+3mJlPZI+kVniDTfOKMNnMrfeOqKqXEncA1F/hbAu24nJC5EE0eSkALZvOSii
         UHclJNupXCsawQCKfZ6SuFlcYia4MHzh3tlggQ1NjknYDcogSgg20E3Q5/iw0pqhyz
         IQ3d0BoZ5oV9g==
Message-ID: <c24b1f67-d68c-698b-90f6-cff136482ca0@collabora.com>
Date:   Thu, 3 Aug 2023 08:39:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next 1/2] media: camif-core: Do not check for 0 return
 after calling platform_get_irq()
Content-Language: en-US
To:     Ruan Jinjie <ruanjinjie@huawei.com>, sylvester.nawrocki@gmail.com,
        mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20230803024645.2716057-1-ruanjinjie@huawei.com>
 <20230803024645.2716057-2-ruanjinjie@huawei.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20230803024645.2716057-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

W dniu 3.08.2023 o 04:46, Ruan Jinjie pisze:
> It is not possible for platform_get_irq() to return 0. Use the
> return value from platform_get_irq().
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
>   drivers/media/platform/samsung/s3c-camif/camif-core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/samsung/s3c-camif/camif-core.c b/drivers/media/platform/samsung/s3c-camif/camif-core.c
> index afe1fcc37354..e4529f666e20 100644
> --- a/drivers/media/platform/samsung/s3c-camif/camif-core.c
> +++ b/drivers/media/platform/samsung/s3c-camif/camif-core.c
> @@ -381,8 +381,8 @@ static int camif_request_irqs(struct platform_device *pdev,
>   		init_waitqueue_head(&vp->irq_queue);
>   
>   		irq = platform_get_irq(pdev, i);
> -		if (irq <= 0)
> -			return -ENXIO;
> +		if (irq < 0)
> +			return irq;
>   
>   		ret = devm_request_irq(&pdev->dev, irq, s3c_camif_irq_handler,
>   				       0, dev_name(&pdev->dev), vp);

