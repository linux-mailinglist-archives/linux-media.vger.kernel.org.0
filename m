Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF75356E1F
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 16:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348016AbhDGOFt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 10:05:49 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:34841 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234067AbhDGOFm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Apr 2021 10:05:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id U8oAlSJzRMxedU8oDlIhgv; Wed, 07 Apr 2021 16:05:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617804330; bh=fm44WbDRvg5ne0yHElY/ZyexmCrcHUZfm1JrxKKHYXg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=aBi0K7CfEbQR3dOy/Dnkf6U3bpGGiR4dImI1ENRMrd+iOMAYetDNcOE91Z8j8c1yC
         98QOz9QKMQJ7o0rAL7En+I9RvzA80St63ktEqw9ROlHcY5ZDdFUm4NgFitcZOG+tnu
         5Z1t4Zt0gbDXm3gy687VY76pnednaqr7IO51V1TZHSeefFyzr/GQU6gCvCfttw/d+C
         wCes29Y50tdio3sxOpP7NsPNqIKN/+1kH6v9jJO0GwazL0J90gS5hQdaLIcNoBq9PD
         SXGIdhXsy2HKIAnGTaG/4IauQ0ILoRX++5JlV010XIz4QudfpmWj9vo0nXdpXYD3yv
         0grmeMe/tWusA==
Subject: Re: [PATCH] staging: axis-fifo: media/meson: remove redundant dev_err
 call
To:     Muhammad Usama Anjum <musamaanjum@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" 
        <linux-media@vger.kernel.org>,
        "open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" 
        <linux-amlogic@lists.infradead.org>,
        "moderated list:ARM/Amlogic Meson SoC support" 
        <linux-arm-kernel@lists.infradead.org>
Cc:     linqiheng@huawei.com, kernel-janitors@vger.kernel.org,
        dan.carpenter@oracle.com
References: <20210407101047.GA1491258@LEGION>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <93218bc8-2cbb-bacc-f985-876a842261c4@xs4all.nl>
Date:   Wed, 7 Apr 2021 16:05:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210407101047.GA1491258@LEGION>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJuuT3CZKUYbj5nNz8R/l8wm1VJrpjTtQH6J0CmLwm7ghIJ918q0+hbMonNISO7KHY8ltQTOpTNtDRJ8Usjw2cLayCjTim5Lj6hbxFqYwUVV/Qtx3fJy
 o0P69y7rvrQfzlLdxH8b3CC78srRQDzdHZJ/x7+amPLWayrB6sc/NMDGDF/cHG6rq/ogA/QwcDjLzibQZp+Ly/oyZywn54zrOCrapWyEC5vw5TRHmZP+c90l
 e6/WiNqO+9zXEPoCZluWJONhoR13VC9A5NrFKRPpOI2J0KxRzbPO4Gn7FH5boVqwzH6s50YHCu/ZKfyl4Ahkf70ldCPaUaP4WnWApKXZKfrCYdd0267PJ4MB
 KxbTjy/4zMZDTC6dZR06qj+JvYW9hvbSONGDCTvmjSAPmMpwJ/DIB5Yq60JfhrVeth0c3dq1te5hwtjReUKEgA9j8tl3pXMpRJ14neeQEs+WEKPmNIy7rVq5
 MLFvYKzilglPPRkGrvsVc97xsoAZnFQ/oablebOTuOfMNKlP/yzYJCOruNtcprpg4nCj+gkXxPkK8cyRe9qTkTMevzx20QTWiPsIxFXgNgvzgUVHFZQyH6sO
 xfkWiBGP+m5OgIhW44sDGDqPdU32hrBv6XcmD+Zu7+WhTsSYh5Sgbd4gujKk3QKL+oiqqoqI4kevS4yXbdXk6+sjioXy5RvgJ6HrECyButS1+fSOwvT/tBs2
 K4PVCUJwHESaKQ8za4+7i4rHtqUjK+Uoi9tfuavJjs+QR1XeqkcFTw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Muhammad,

On 07/04/2021 12:10, Muhammad Usama Anjum wrote:
> devm_ioremap_resource() prints error message in itself. Remove the
> dev_err call to avoid redundant error message.

Please split this up into two separate patches! They are independent
changes and these two drivers are maintained by different people as well.

The patch itself looks OK, but it really has to be two separate patches.

Regards,

	Hans

> 
> Signed-off-by: Muhammad Usama Anjum <musamaanjum@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c   | 1 -
>  drivers/staging/media/meson/vdec/vdec.c | 8 ++------
>  2 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 2bb1c2e9cb57..ed9281089738 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -853,7 +853,6 @@ static int axis_fifo_probe(struct platform_device *pdev)
>  	fifo->base_addr = devm_ioremap_resource(fifo->dt_device, r_mem);
>  	if (IS_ERR(fifo->base_addr)) {
>  		rc = PTR_ERR(fifo->base_addr);
> -		dev_err(fifo->dt_device, "can't remap IO resource (%d)\n", rc);
>  		goto err_initial;
>  	}
>  
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> index 5d4db7a5b4b5..e51d69c4729d 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -1008,17 +1008,13 @@ static int vdec_probe(struct platform_device *pdev)
>  
>  	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dos");
>  	core->dos_base = devm_ioremap_resource(dev, r);
> -	if (IS_ERR(core->dos_base)) {
> -		dev_err(dev, "Couldn't remap DOS memory\n");
> +	if (IS_ERR(core->dos_base))
>  		return PTR_ERR(core->dos_base);
> -	}
>  
>  	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "esparser");
>  	core->esparser_base = devm_ioremap_resource(dev, r);
> -	if (IS_ERR(core->esparser_base)) {
> -		dev_err(dev, "Couldn't remap ESPARSER memory\n");
> +	if (IS_ERR(core->esparser_base))
>  		return PTR_ERR(core->esparser_base);
> -	}
>  
>  	core->regmap_ao =
>  		syscon_regmap_lookup_by_phandle(dev->of_node,
> 

