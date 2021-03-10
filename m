Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70ADC333CBC
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 13:41:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbhCJMkv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 07:40:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbhCJMkY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 07:40:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEDB8C061760;
        Wed, 10 Mar 2021 04:40:23 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07FCBF3;
        Wed, 10 Mar 2021 13:40:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615380021;
        bh=L1Qfhi4dDxGV3PGZ3CwD9ZsY/EKffY6u6Z68u5bbnLo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gPNnaBR79mVacN8LMMQICbM2FlbqYsa0kYRZKfqnpUyWh4q6cwzeSdm35F92pzwr6
         rah1HfARz0A45uDlgqcZ4TcOWE1sHds6pOD3yiUgLg4daxHTw/nY1/LowuPQ8uYiGP
         /Ht1mRVvyI7UyHUn75cnQKoDOerwx51XWbl25NMo=
Date:   Wed, 10 Mar 2021 14:39:48 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pavel Machek <pavel@denx.de>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 2/3] media: i2c: imx219: Serialize during stream
 start/stop
Message-ID: <YEi+FBRbXBJch1DM@pendragon.ideasonboard.com>
References: <20210310122014.28353-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210310122014.28353-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210310122014.28353-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Wed, Mar 10, 2021 at 12:20:13PM +0000, Lad Prabhakar wrote:
> Serialize during stream start/stop in suspend/resume callbacks.

Could you please explain why this is needed ?

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/i2c/imx219.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index f0cf1985a4dc..87c021de1460 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -1172,8 +1172,10 @@ static int __maybe_unused imx219_suspend(struct device *dev)
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct imx219 *imx219 = to_imx219(sd);
>  
> +	mutex_lock(&imx219->mutex);
>  	if (imx219->streaming)
>  		imx219_stop_streaming(imx219);
> +	mutex_unlock(&imx219->mutex);
>  
>  	return 0;
>  }
> @@ -1184,11 +1186,13 @@ static int __maybe_unused imx219_resume(struct device *dev)
>  	struct imx219 *imx219 = to_imx219(sd);
>  	int ret;
>  
> +	mutex_lock(&imx219->mutex);
>  	if (imx219->streaming) {
>  		ret = imx219_start_streaming(imx219);
>  		if (ret)
>  			goto error;
>  	}
> +	mutex_unlock(&imx219->mutex);
>  
>  	return 0;
>  
> @@ -1197,6 +1201,7 @@ static int __maybe_unused imx219_resume(struct device *dev)
>  	imx219->streaming = false;
>  	__v4l2_ctrl_grab(imx219->vflip, false);
>  	__v4l2_ctrl_grab(imx219->hflip, false);
> +	mutex_unlock(&imx219->mutex);
>  
>  	return ret;
>  }

-- 
Regards,

Laurent Pinchart
