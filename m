Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D73E4333CCF
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 13:45:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbhCJMpK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 07:45:10 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33724 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231922AbhCJMpI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 07:45:08 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A23CCF3;
        Wed, 10 Mar 2021 13:45:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615380306;
        bh=Hh/wbqpS2bI3vg2h7cXW9suyxITAoalNGEkviFTVRj4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OdoZM4/KyQEStBlvzCfFHADNxtRfp3wP5C/BnK0xJGlLEcjG3VXku4Q2iKfaIZbRL
         lgh7qlNJDtaAOOUlcAcqO2Wozpdve5vLa/msWLTFR77KIoe20xrI7V/6mspin/LwzZ
         EsuVoeaVdWJ5xTMKz0Qq84a67RMgZSk8+LC7KAHg=
Date:   Wed, 10 Mar 2021 14:44:33 +0200
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
Subject: Re: [PATCH 1/3] media: i2c: imx219: Enable vflip and hflip controls
 on stream stop
Message-ID: <YEi/Mcb3KX/Q6vwa@pendragon.ideasonboard.com>
References: <20210310122014.28353-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210310122014.28353-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210310122014.28353-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Wed, Mar 10, 2021 at 12:20:12PM +0000, Lad Prabhakar wrote:
> Enable vflip and hflip controls in resume error path when streaming
> is stopped.
> 
> Fixes: 1283b3b8f82b9 ("media: i2c: Add driver for Sony IMX219 sensor")
> Reported-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/i2c/imx219.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 6e3382b85a90..f0cf1985a4dc 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -1195,6 +1195,8 @@ static int __maybe_unused imx219_resume(struct device *dev)
>  error:
>  	imx219_stop_streaming(imx219);
>  	imx219->streaming = false;
> +	__v4l2_ctrl_grab(imx219->vflip, false);
> +	__v4l2_ctrl_grab(imx219->hflip, false);

It's not very nice to do this manually in imx219_resume(). Shouldn't we
move the __v4l2_ctrl_grab() calls from imx219_set_stream() to
imx219_start_streaming() and imx219_stop_streaming() instead ?

>  
>  	return ret;
>  }

-- 
Regards,

Laurent Pinchart
