Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5B12B45DE
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 15:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729689AbgKPOaX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 09:30:23 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49040 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729232AbgKPOaW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 09:30:22 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F100A1B;
        Mon, 16 Nov 2020 15:30:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1605537020;
        bh=rR37HXyKQVppSVr7uNljcu2P32cneLHCYXtZv9IIvdw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lFsueI1xpEnF6ohptEVBw/81CQN+hJ2y+ISFi6FUcw8iSv7zYKYWcopxLVgXY6yio
         g+RcbrF1L3jMyX4OgUPvjg3M2IvFm7fFZsP9H6hZIQ9mUrpfjXlq7iW72dZWHCvl9c
         iZYNhwirrdWQRwZynRtNW/ojjffXKcTbnAf6ybak=
Date:   Mon, 16 Nov 2020 16:30:15 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org, dave.stevenson@raspberrypi.com
Subject: Re: [PATCH] media: i2c: imx219: Declare that the driver can create
 events
Message-ID: <20201116143015.GK6540@pendragon.ideasonboard.com>
References: <20201116132244.30081-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201116132244.30081-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Thank you for the patch.

On Mon, Nov 16, 2020 at 02:22:44PM +0100, Dafna Hirschfeld wrote:
> The flag V4L2_SUBDEV_FL_HAS_EVENTS is required if the subdev can
> generate events. It can create events from the ctrl handler, therefore
> this is required.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

We should probably revisit this in the V4L2 core, as all subdevs that
handle controls can generate events, it shouldn't need to be manually
implemented in each of them.

> ---
> This patch fixes compliance issues found in imx219:
> 
> fail: v4l2-test-controls.cpp(830): failed to find event for control 'Exposure'
>     test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
> 
>  drivers/media/i2c/imx219.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index ef2b1a6a0f4a..ba1c5e59ddf4 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -1503,7 +1503,8 @@ static int imx219_probe(struct i2c_client *client)
>  
>  	/* Initialize subdev */
>  	imx219->sd.internal_ops = &imx219_internal_ops;
> -	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +			    V4L2_SUBDEV_FL_HAS_EVENTS;
>  	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  
>  	/* Initialize source pad */

-- 
Regards,

Laurent Pinchart
