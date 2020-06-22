Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C89B2034BA
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2020 12:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726965AbgFVKXm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 06:23:42 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:57347 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726841AbgFVKXm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 06:23:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id nJc1j11Tpn3JWnJc4jZiTl; Mon, 22 Jun 2020 12:23:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1592821420; bh=f/ULth+WPXG/hWu8Ht7Ecw0hWHHS+idcagxLi4SEmhU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=jF9UasZ/5EAMII3du05bFA3W9vQlYTG5dEezJEWbioY4xYvZsmHYNfLxJi2z7b6p0
         5ns7WKvXbkGZASOIMoGCM1HQEiurIVJwIeseO4ct6UfGOOkGNr73EHu/gqdkP7SeeQ
         sYx1OSGkKngZCOsH+tkZhXpFo4xleDFGg/xDEM3LqbyxmTCNQdsHJT54bZLdwRojl/
         KdoJfa4/D0pjp9naJOh6U5tccPK27QcvjhqUAIs1zhQxon6xqLt/dEDwK0XDnCUeAc
         mcjVM93f0CcA/qTrQrPtVavxhfB0KHvn7HquSWx0qhcdskqD7EDYuq+DFOBx3INJBX
         fEF7eal7bSZsg==
Subject: Re: [PATCH RESEND] media: cros-ec-cec: do not bail on
 device_init_wakeup failure
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org
Cc:     narmstrong@baylibre.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Dariusz Marcinkiewicz <darekm@chromium.org>,
        linux-kernel@vger.kernel.org
References: <20200622100520.143622-1-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ca796f62-7d1f-3391-0373-ec9b98b1c47a@xs4all.nl>
Date:   Mon, 22 Jun 2020 12:23:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200622100520.143622-1-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGXI0eTxzr8KTbetnLgAYjh9qScosjRXUdJOPWPZlPqM6Oq5U2RVg1ofWC1UIDgWz+Xw7odQNObqtVNREyZrgw5+mVn68FuxZ7fnEXM9gP9z9BnlIopo
 KkqQZiNRvZN3iQ8dqnnTjP0OFGF0d2JZoV7pLBIF9YPZ5ps63pulHWiQkLNB32TFqGg1FzvJoZrMbjmbIwMnn296FTb/9Cidk8ceBAdg4YM3d7bqcTpt64jk
 RZkJw3KT3SOqq8Y8X3ryJlMsWks/YBme5p5Q4X0mf20cyepkJFYkhq2MEiMsZXK5sorIzdIxYqe6rscK8rqTgkhbY7h8pMoUkSgpSPW8hW7CFTASdVwF/llk
 vYtOi9fKNF0lDmswHbDUeeTuR5gxDcuX3N4HtEeJJBKmUE2HCdmnhNnmHiiS7zSvHkIkCzrtyWnoTQVVCMvr5yvPDtt7YoqMkucubT/Kd37S5eWU0x/Jl+Kq
 lPlZyhYROrwx0m1vIj2PXitF6bUaQzXO20d1YcWJpJQ3V3iJONqjh5BE6yAL8isb0sWz6nibLvU96vUk
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/06/2020 12:05, Dariusz Marcinkiewicz wrote:
> Do not fail probing when device_init_wakeup fails.
> 
> device_init_wakeup fails when the device is already enabled as wakeup
> device. Hence, the driver fails to probe the device if:
> - The device has already been enabled for wakeup (via e.g. sysfs)
> - The driver has been unloaded and is being loaded again.
> 
> This goal of the patch is to fix the above cases.
> 
> Overwhelming majority of the drivers do not check device_init_wakeup
> return value.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>

This can be CCed to stable, I guess?

Can you provide a Fixes: tag as well?

Regards,

	Hans

> ---
>  drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> index 0e7e2772f08f..2d95e16cd248 100644
> --- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> +++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> @@ -277,11 +277,7 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, cros_ec_cec);
>  	cros_ec_cec->cros_ec = cros_ec;
>  
> -	ret = device_init_wakeup(&pdev->dev, 1);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to initialize wakeup\n");
> -		return ret;
> -	}
> +	device_init_wakeup(&pdev->dev, 1);
>  
>  	cros_ec_cec->adap = cec_allocate_adapter(&cros_ec_cec_ops, cros_ec_cec,
>  						 DRV_NAME,
> 

