Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE423F461A
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 09:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235407AbhHWHyk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 03:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235288AbhHWHyk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 03:54:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FDFDC061575
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 00:53:58 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mI4mJ-00059D-8d; Mon, 23 Aug 2021 09:53:55 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mI4mH-00061E-6Z; Mon, 23 Aug 2021 09:53:53 +0200
Date:   Mon, 23 Aug 2021 09:53:53 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Nadezda Lutovinova <lutovinova@ispras.ru>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: Re: [PATCH] media: allegro: request irq after initializing
 mbox_status
Message-ID: <20210823075353.GC28846@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Nadezda Lutovinova <lutovinova@ispras.ru>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
References: <20210819154935.19826-1-lutovinova@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210819154935.19826-1-lutovinova@ispras.ru>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:41:07 up 186 days, 11:04, 82 users,  load average: 0.24, 0.33,
 0.29
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nadezda,

On Thu, 19 Aug 2021 18:49:35 +0300, Nadezda Lutovinova wrote:
> If IRQ occurs between calling  devm_request_threaded_irq() and
> allegro_firmware_request_nowait(), then null pointer dereference
> occurs since dev->mbox_status wasn't initialized yet but used
> in allegro_mbox_notify(). 

Thanks for the patch. As explained in [0], this is not an issue.

> 
> The patch puts registration of the interrupt handler after
> initializing of neccesery data.

The interrupt handler must be registered during the execution of
allegro_fw_callback(), because the driver exchanges messages with the firmware
during the bring up. With this patch this is not guaranteed anymore.

Michael

[0] https://lore.kernel.org/linux-media/20210511072834.GC17882@pengutronix.de/

> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Nadezda Lutovinova <lutovinova@ispras.ru>
> ---
>  .../media/platform/allegro-dvt/allegro-core.c | 24 +++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
> index 887b492e4ad1..9c1997ff74e8 100644
> --- a/drivers/media/platform/allegro-dvt/allegro-core.c
> +++ b/drivers/media/platform/allegro-dvt/allegro-core.c
> @@ -3707,18 +3707,6 @@ static int allegro_probe(struct platform_device *pdev)
>  		return PTR_ERR(dev->sram);
>  	}
>  
> -	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0)
> -		return irq;
> -	ret = devm_request_threaded_irq(&pdev->dev, irq,
> -					allegro_hardirq,
> -					allegro_irq_thread,
> -					IRQF_SHARED, dev_name(&pdev->dev), dev);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "failed to request irq: %d\n", ret);
> -		return ret;
> -	}
> -
>  	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
>  	if (ret)
>  		return ret;
> @@ -3732,6 +3720,18 @@ static int allegro_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +	ret = devm_request_threaded_irq(&pdev->dev, irq,
> +					allegro_hardirq,
> +					allegro_irq_thread,
> +					IRQF_SHARED, dev_name(&pdev->dev), dev);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to request irq: %d\n", ret);
> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  
> -- 
> 2.17.1
> 
> 
