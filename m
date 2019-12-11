Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEDE911A96D
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 11:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728636AbfLKK7P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 05:59:15 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45804 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727469AbfLKK7P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 05:59:15 -0500
Received: by mail-wr1-f66.google.com with SMTP id j42so23478003wrj.12;
        Wed, 11 Dec 2019 02:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZJ6q3Z6ceKXrm+SRlu2SJJixCZ2doGfehevk1AA5ByM=;
        b=K1ojBJTpeL2Wboiq1cJE1Qq1n1g2bh/8V9dHPWgDVEGYy3w7g72D4KX55XVKKdXmbK
         twQeRiS4RHTOb+jek8lMpidtbUZHZ56k/3uCiXXG5/+Hkw/rxpi9nXFgX2fFiuSZt9gx
         33t0fTYw2WNQcXFMUfbK17IUcJIqUG/f7ENFXDkP/+HZFFhEV/HUUyHXlqyaRHTlZqP+
         W1hQAb3DcSM8/OMvm51Xzaphnh3Jfeo+cHO0F9nvSfAt5q5JciBAe7LhcaGyG570Cgc+
         6ckP1RX5m9u+nWZ060GCRdifB5D99LuUhnhQKM7RWCVZCXEGwohrxalOaTxi1DYQbRQS
         L75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZJ6q3Z6ceKXrm+SRlu2SJJixCZ2doGfehevk1AA5ByM=;
        b=CWNGOWdCBGIM5YUnP8RUDubrLjs1VwD1l1Qx4Tk0y+BfZrg0HXeGBRMZIAbnfxWJxo
         06Ln4n/GRXgkNas+fN1pQG9aG+SUxWXkiVg7HD/4VOytDvHCs0jcVZlEtqQAONhjlDfE
         epH2R/ebVeKuTkVhAHHk+lucDCnbA+mtzvryFwr5/wHxodA9599JwB1WOp+GMW89PeSn
         JeLB7umwH7g6IpZrVI93kTQqubohZoD+toQ7xEQypEF2FO9Ej+UeSfaVRtuTORVJCLhP
         mAB77OhJkKvdr5ozVJHI/3EIBx27vOJQlQNQDb3/sLUY3yeDHFC8uCh2tikVyIx9DYY+
         Mkpw==
X-Gm-Message-State: APjAAAW1ifWSe1V4yw3gzKPTwvQFDZCmgljpGzMh54SRiF7Dj5Ef78ei
        O+eWwIH4bSbmgOdv7l/+a88=
X-Google-Smtp-Source: APXvYqzYgisCayrNKaxODP8N7xFYdT2hZz1hxEtmhPqbWlMtOUVzxlgJNwPz8lQm54UI/lwzuPutcw==
X-Received: by 2002:adf:dc86:: with SMTP id r6mr3304746wrj.68.1576061953285;
        Wed, 11 Dec 2019 02:59:13 -0800 (PST)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id o19sm1215640wmc.18.2019.12.11.02.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 02:59:12 -0800 (PST)
Date:   Wed, 11 Dec 2019 10:59:08 +0000
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: imx7-mipi-csis: Add the missed
 v4l2_async_notifier_cleanup in remove
Message-ID: <20191211105908.dw4lnuble3ejlnil@arch-thunder.localdomain>
References: <20191209085828.16183-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191209085828.16183-1-hslester96@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Chuhong,
Thanks for the patch.

On Mon, Dec 09, 2019 at 04:58:28PM +0800, Chuhong Yuan wrote:
> All drivers in imx call v4l2_async_notifier_cleanup() after unregistering
> the notifier except this driver.
> This should be a miss and we need to add the call to fix it.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index 99166afca071..2bfa85bb84e7 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -1105,6 +1105,7 @@ static int mipi_csis_remove(struct platform_device *pdev)
>  	mipi_csis_debugfs_exit(state);
>  	v4l2_async_unregister_subdev(&state->mipi_sd);
>  	v4l2_async_notifier_unregister(&state->subdev_notifier);
> +	v4l2_async_notifier_cleanup(&state->subdev_notifier);
>  
>  	pm_runtime_disable(&pdev->dev);
>  	mipi_csis_pm_suspend(&pdev->dev, true);
> -- 
> 2.24.0
> 
