Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3DA21EF65E
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 13:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgFELXX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 07:23:23 -0400
Received: from retiisi.org.uk ([95.216.213.190]:38794 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725997AbgFELXX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Jun 2020 07:23:23 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 741B7634C87;
        Fri,  5 Jun 2020 14:21:53 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jhAQ5-0004H6-EG; Fri, 05 Jun 2020 14:21:53 +0300
Date:   Fri, 5 Jun 2020 14:21:53 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND 2 PATCH] media: marvell-ccic: Add support for runtime PM
Message-ID: <20200605112153.GM9947@valkosipuli.retiisi.org.uk>
References: <20200601192124.172650-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200601192124.172650-1-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lubomir,

Thanks for the patch.

On Mon, Jun 01, 2020 at 09:21:24PM +0200, Lubomir Rintel wrote:
> On MMP3, the camera block lives on na separate power island. We want to

s/on \Kn//

> turn it off if the CCIC is not in use to conserve power.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  drivers/media/platform/marvell-ccic/mcam-core.c  |  3 +++
>  drivers/media/platform/marvell-ccic/mmp-driver.c | 12 ++++++++----
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
> index 09775b6624c6b..c2cd1d461bd06 100644
> --- a/drivers/media/platform/marvell-ccic/mcam-core.c
> +++ b/drivers/media/platform/marvell-ccic/mcam-core.c
> @@ -24,6 +24,7 @@
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/videodev2.h>
> +#include <linux/pm_runtime.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-ctrls.h>
> @@ -901,6 +902,7 @@ static void mcam_clk_enable(struct mcam_camera *mcam)

The clocks look like something that rather should be controlled by the
device's runtime PM state. Could it be put behind suspend/resume callbacks?

>  {
>  	unsigned int i;
>  
> +	pm_runtime_get_sync(mcam->dev);
>  	for (i = 0; i < NR_MCAM_CLK; i++) {
>  		if (!IS_ERR(mcam->clk[i]))
>  			clk_prepare_enable(mcam->clk[i]);
> @@ -915,6 +917,7 @@ static void mcam_clk_disable(struct mcam_camera *mcam)
>  		if (!IS_ERR(mcam->clk[i]))
>  			clk_disable_unprepare(mcam->clk[i]);
>  	}
> +	pm_runtime_put(mcam->dev);
>  }
>  
>  /* ---------------------------------------------------------------------- */
> diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/media/platform/marvell-ccic/mmp-driver.c
> index 92b92255dac66..eec482d16805b 100644
> --- a/drivers/media/platform/marvell-ccic/mmp-driver.c
> +++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
> @@ -24,6 +24,7 @@
>  #include <linux/list.h>
>  #include <linux/pm.h>
>  #include <linux/clk.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "mcam-core.h"
>  
> @@ -313,10 +314,12 @@ static int mmpcam_probe(struct platform_device *pdev)
>  	cam->irq = res->start;
>  	ret = devm_request_irq(&pdev->dev, cam->irq, mmpcam_irq, IRQF_SHARED,
>  					"mmp-camera", mcam);
> -	if (ret == 0) {
> -		mmpcam_add_device(cam);
> -		return 0;
> -	}
> +	if (ret)
> +		goto out;
> +
> +	mmpcam_add_device(cam);
> +	pm_runtime_enable(&pdev->dev);

If you enable runtime PM here, there's a chance the clocks have been
prepared and enabled before this.

How about moving registerin clocks after this instead? Looking at the
current code, they are registered too early.

> +	return 0;
>  
>  out:
>  	fwnode_handle_put(mcam->asd.match.fwnode);
> @@ -332,6 +335,7 @@ static int mmpcam_remove(struct mmp_camera *cam)
>  
>  	mmpcam_remove_device(cam);
>  	mccic_shutdown(mcam);
> +	pm_runtime_force_suspend(mcam->dev);
>  	return 0;
>  }
>  

-- 
Kind regards,

Sakari Ailus
