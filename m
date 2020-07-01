Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D073F210478
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 09:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbgGAHGm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 03:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727847AbgGAHGm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 03:06:42 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48FB4C061755
        for <linux-media@vger.kernel.org>; Wed,  1 Jul 2020 00:06:42 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jqWpC-00022p-6y; Wed, 01 Jul 2020 09:06:30 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jqWpB-0007vN-7U; Wed, 01 Jul 2020 09:06:29 +0200
Date:   Wed, 1 Jul 2020 09:06:29 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: allegro: Fix some NULL vs IS_ERR() checks in probe
Message-ID: <20200701070629.GA16164@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
References: <20200619143007.GC267142@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200619143007.GC267142@mwanda>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:05:04 up 132 days, 14:35, 107 users,  load average: 0.07, 0.20,
 0.16
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 19 Jun 2020 17:30:07 +0300, Dan Carpenter wrote:
> The devm_ioremap() function doesn't return error pointers, it returns
> NULL on error.
> 
> Fixes: f20387dfd065 ("media: allegro: add Allegro DVT video IP core driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/staging/media/allegro-dvt/allegro-core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
> index 70f133a842dd..3ed66aae741d 100644
> --- a/drivers/staging/media/allegro-dvt/allegro-core.c
> +++ b/drivers/staging/media/allegro-dvt/allegro-core.c
> @@ -3065,9 +3065,9 @@ static int allegro_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  	regs = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> -	if (IS_ERR(regs)) {
> +	if (!regs) {
>  		dev_err(&pdev->dev, "failed to map registers\n");
> -		return PTR_ERR(regs);
> +		return -ENOMEM;
>  	}
>  	dev->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
>  					    &allegro_regmap_config);
> @@ -3085,9 +3085,9 @@ static int allegro_probe(struct platform_device *pdev)
>  	sram_regs = devm_ioremap(&pdev->dev,
>  				 sram_res->start,
>  				 resource_size(sram_res));
> -	if (IS_ERR(sram_regs)) {
> +	if (!sram_regs) {
>  		dev_err(&pdev->dev, "failed to map sram\n");
> -		return PTR_ERR(sram_regs);
> +		return -ENOMEM;
>  	}
>  	dev->sram = devm_regmap_init_mmio(&pdev->dev, sram_regs,
>  					  &allegro_sram_config);
> -- 
> 2.27.0
> 
> 
