Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB3A76E062
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 08:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233593AbjHCGjW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 02:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233641AbjHCGi6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 02:38:58 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A5153AAF;
        Wed,  2 Aug 2023 23:38:27 -0700 (PDT)
Received: from [192.168.15.130] (94-240-0-14.lukman.pl [94.240.0.14])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 1254D66015A0;
        Thu,  3 Aug 2023 07:38:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1691044704;
        bh=/MPzKN5AQ/eMWkd2ptH99C/hRYbXpVXz5gDxbinjD+Q=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=P5WbcTEopTLGAMFxcEs6ZzStPiVD5pOsn8Y6FopBKgg43XGno/iOyn1/MxrjXM6Sh
         +uneTP/pqNMXyVLhDABceDIw4yi85S3t5tjz/6YMu93/bQ/44pKmDqBjVCsUw3TQUy
         84r+ZXKiai7wQaEnzlbzRc34pSSB3wW2xeCSPAYOd+W/1COyYtdn4TtTcTCCL7EVaj
         8dNFfL58yMIdr2u7pLp9rPAicuVwe4BLkD9tKxai4EPwRdrInrK6LS+/Iy8b9jA+xW
         DmAfU9KlnqIVfT37W/13sNWodSsEgeEtyeO+BE40C8W6/L3aMED7hSsbrHK+KaUbuR
         WNNfWKEpMTHXw==
Message-ID: <0d467e99-8133-861e-c221-e0397a0c5535@collabora.com>
Date:   Thu, 3 Aug 2023 08:38:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next 2/2] media: verisilicon: Do not check for 0 return
 after calling platform_get_irq()
To:     Ruan Jinjie <ruanjinjie@huawei.com>, sylvester.nawrocki@gmail.com,
        mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20230803024645.2716057-1-ruanjinjie@huawei.com>
 <20230803024645.2716057-3-ruanjinjie@huawei.com>
Content-Language: en-US
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20230803024645.2716057-3-ruanjinjie@huawei.com>
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
> It is not possible for platform_get_irq() or platform_get_irq_byname()
> to return 0. Use the return value from platform_get_irq()
> or platform_get_irq_byname().
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
>   drivers/media/platform/verisilicon/hantro_drv.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index 35ca71b19def..423fc85d79ee 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -1085,8 +1085,8 @@ static int hantro_probe(struct platform_device *pdev)
>   			irq_name = "default";
>   			irq = platform_get_irq(vpu->pdev, 0);
>   		}
> -		if (irq <= 0)
> -			return -ENXIO;
> +		if (irq < 0)
> +			return irq;
>   
>   		ret = devm_request_irq(vpu->dev, irq,
>   				       vpu->variant->irqs[i].handler, 0,

