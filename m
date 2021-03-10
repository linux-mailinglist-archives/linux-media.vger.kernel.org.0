Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25AB6333CDF
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 13:50:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232073AbhCJMt2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 07:49:28 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33770 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbhCJMtX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 07:49:23 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D88C0F3;
        Wed, 10 Mar 2021 13:49:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615380561;
        bh=PfudLm8IB8UcKwqnvgrPKNV/7E2BOCVn2FSW4I+2Yy0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iqesv+DcwzHjhsCvShM24On6+r7/w6NtllyuF0Ay6aKG1vYizwGwkk+LUX0rhwLx4
         iMAhNqlxcTegyD2AJnar0T24BQbyL550uq4r+BXh6Ubpf0TRKHt45iHsCWn7UyPVeB
         vQu08wullLmN9CHRB1wEYiaFSQCK8QgPAfcEBsoc=
Date:   Wed, 10 Mar 2021 14:48:47 +0200
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
Subject: Re: [PATCH 3/3] media: i2c: imx219: Balance runtime PM use-count in
 resume callback
Message-ID: <YEjAL22jNXvpe23W@pendragon.ideasonboard.com>
References: <20210310122014.28353-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210310122014.28353-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210310122014.28353-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Wed, Mar 10, 2021 at 12:20:14PM +0000, Lad Prabhakar wrote:
> The runtime PM use-count gets incremented in imx219_set_stream() call
> when streaming is started this needs to be balanced by calling
> pm_runtime_put() upon failure to start stream in resume callback.
> 
> Fixes: 1283b3b8f82b9 ("media: i2c: Add driver for Sony IMX219 sensor")
> Reported-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/i2c/imx219.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 87c021de1460..afffc85cd265 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -1184,6 +1184,7 @@ static int __maybe_unused imx219_resume(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct imx219 *imx219 = to_imx219(sd);
> +	struct i2c_client *client;
>  	int ret;
>  
>  	mutex_lock(&imx219->mutex);
> @@ -1197,7 +1198,9 @@ static int __maybe_unused imx219_resume(struct device *dev)
>  	return 0;
>  
>  error:
> +	client = v4l2_get_subdevdata(&imx219->sd);
>  	imx219_stop_streaming(imx219);
> +	pm_runtime_put(&client->dev);
>  	imx219->streaming = false;
>  	__v4l2_ctrl_grab(imx219->vflip, false);
>  	__v4l2_ctrl_grab(imx219->hflip, false);

Similarly to the __v4l2_ctrl_grab(), it could be better to move
pm_runtime_put() to imx219_stop_streaming().

-- 
Regards,

Laurent Pinchart
