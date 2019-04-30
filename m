Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60EA9FACC
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 15:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbfD3Nt4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 09:49:56 -0400
Received: from retiisi.org.uk ([95.216.213.190]:43624 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727138AbfD3Ntz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 09:49:55 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 4C576634C7B;
        Tue, 30 Apr 2019 16:49:45 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hLT8i-0000hV-Td; Tue, 30 Apr 2019 16:49:44 +0300
Date:   Tue, 30 Apr 2019 16:49:44 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Nicholas Mc Guire <hofrat@opentech.at>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: smiapp: core: add range to usleep_range
Message-ID: <20190430134944.6sutxdztj6crgo6w@valkosipuli.retiisi.org.uk>
References: <1554603364-10500-1-git-send-email-hofrat@opentech.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554603364-10500-1-git-send-email-hofrat@opentech.at>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicholas,

On Sun, Apr 07, 2019 at 04:16:02AM +0200, Nicholas Mc Guire wrote:
> Allow the hrtimer subsystem to coalesce delay timers of lower accuracy
> by providing a suitable range
> 
> Signed-off-by: Nicholas Mc Guire <hofrat@opentech.at>
> ---
> 
> Problem located by an experimental coccinelle script
> 
> hrtimers in atomic context have limited accuracy due to possible
> context-switching and interruption so the accuracy is limited 
> anyway. Giving the hrtimer subsystem a reasonable range for merging
> hrtimers helps to reduce the load on the hrtimer subsystem. As this
> delays do not seem to mandate high accuracy the range of a factor
> two seems acceptable.
> 
> Patch was compile tested with: x86_64_defconfig + MEDIA_SUPPORT=m,
> MEDIA_CAMERA_SUPPORT=y, MEDIA_CONTROLLER=y, VIDEO_V4L2_SUBDEV_API=y,
> VIDEO_SMIAPP=m                                                                                               
> (with a number of sparse warnings on sizeof() usage)
> 
> Patch is against 5.1-rc3 (localversion-next is next-20190405)

The delays are exact for the reason that they are user-visible delays in
image capturing related use cases. Sometimes milliseconds matter, or at
least adding more does not help.

> 
>  drivers/media/i2c/smiapp/smiapp-core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
> index 58a45c3..c0c29ec 100644
> --- a/drivers/media/i2c/smiapp/smiapp-core.c
> +++ b/drivers/media/i2c/smiapp/smiapp-core.c
> @@ -1222,19 +1222,19 @@ static int smiapp_power_on(struct device *dev)
>  		dev_err(&client->dev, "failed to enable vana regulator\n");
>  		return rval;
>  	}
> -	usleep_range(1000, 1000);
> +	usleep_range(1000, 2000);
>  
>  	rval = clk_prepare_enable(sensor->ext_clk);
>  	if (rval < 0) {
>  		dev_dbg(&client->dev, "failed to enable xclk\n");
>  		goto out_xclk_fail;
>  	}
> -	usleep_range(1000, 1000);
> +	usleep_range(1000, 2000);
>  
>  	gpiod_set_value(sensor->xshutdown, 1);
>  
>  	sleep = SMIAPP_RESET_DELAY(sensor->hwcfg->ext_clk);
> -	usleep_range(sleep, sleep);
> +	usleep_range(sleep, sleep*2);
>  
>  	mutex_lock(&sensor->mutex);
>  
> @@ -1381,7 +1381,7 @@ static int smiapp_power_off(struct device *dev)
>  
>  	gpiod_set_value(sensor->xshutdown, 0);
>  	clk_disable_unprepare(sensor->ext_clk);
> -	usleep_range(5000, 5000);
> +	usleep_range(5000, 10000);
>  	regulator_disable(sensor->vana);
>  	sensor->streaming = false;
>  

-- 
Sakari Ailus
