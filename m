Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39DA46AB1B
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 16:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387649AbfGPO4e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 10:56:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47002 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727849AbfGPO4e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 10:56:34 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C678564;
        Tue, 16 Jul 2019 16:56:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1563288991;
        bh=zFyue+2SYmyR4MR/pVlbXIdfZG9EcTW85Y6qZdeRk20=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=okL74VpSqxIhSuJwV2IjI7KCiZQ+jlzCPcVvJwWjA8pYoDavVbPOWCLXw9gmSpQUX
         yO8SZaU3zIMph1WLhWlRKw7R9IoIkp6GgtdcvO/AxcFVN5R2DKS7pD1rYmJZxMnhdG
         aKa4KdTh2SgF15bbIw77sfpL5TxW42nvjA51mvww=
Subject: Re: [PATCH 4/4] rcar-vin: Clean up how format is set on subdevice
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190705045557.25463-1-niklas.soderlund+renesas@ragnatech.se>
 <20190705045557.25463-5-niklas.soderlund+renesas@ragnatech.se>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <9347e593-9c86-0cbc-50d3-8f1ffc684e53@ideasonboard.com>
Date:   Tue, 16 Jul 2019 15:56:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190705045557.25463-5-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On 05/07/2019 05:55, Niklas Söderlund wrote:
> With support for V4L2_FIELD_ALTERNATE added it's possible to clean up
> how formats are set on the subdevice. This makes the code easier to read
> as variable names now more clearly express their intent.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 44 ++++++++++-----------
>  1 file changed, 21 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index bc96ed563e365448..fa6cc1b76f02133e 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -170,7 +170,7 @@ static int rvin_reset_format(struct rvin_dev *vin)
>  
>  static int rvin_try_format(struct rvin_dev *vin, u32 which,
>  			   struct v4l2_pix_format *pix,
> -			   struct v4l2_rect *crop, struct v4l2_rect *compose)
> +			   struct v4l2_rect *src_rect)
>  {
>  	struct v4l2_subdev *sd = vin_to_source(vin);
>  	struct v4l2_subdev_pad_config *pad_cfg;
> @@ -189,24 +189,24 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
>  	if (!rvin_format_from_pixel(vin, pix->pixelformat))
>  		pix->pixelformat = RVIN_DEFAULT_FORMAT;
>  
> -	v4l2_fill_mbus_format(&format.format, pix, vin->mbus_code);
> -
>  	/* Allow the video device to override field and to scale */
>  	field = pix->field;
>  	width = pix->width;
>  	height = pix->height;
>  
> +	v4l2_fill_mbus_format(&format.format, pix, vin->mbus_code);
> +
>  	ret = v4l2_subdev_call(sd, pad, set_fmt, pad_cfg, &format);
>  	if (ret < 0 && ret != -ENOIOCTLCMD)
>  		goto done;
>  
>  	v4l2_fill_pix_format(pix, &format.format);
>  
> -	if (crop) {
> -		crop->top = 0;
> -		crop->left = 0;
> -		crop->width = pix->width;
> -		crop->height = pix->height;
> +	if (src_rect) {
> +		src_rect->top = 0;
> +		src_rect->left = 0;
> +		src_rect->width = pix->width;
> +		src_rect->height = pix->height;
>  	}
>  
>  	if (field != V4L2_FIELD_ANY)
> @@ -216,17 +216,10 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
>  	pix->height = height;
>  
>  	rvin_format_align(vin, pix);
> -
> -	if (compose) {
> -		compose->top = 0;
> -		compose->left = 0;
> -		compose->width = pix->width;
> -		compose->height = pix->height;
> -	}
>  done:
>  	v4l2_subdev_free_pad_config(pad_cfg);
>  
> -	return 0;
> +	return ret;

This return value change looks suspiciously like a small bug-fix.
Does it deserve it's own patch and fixes tag for the stable trees?



>  }
>  
>  static int rvin_querycap(struct file *file, void *priv,
> @@ -246,29 +239,34 @@ static int rvin_try_fmt_vid_cap(struct file *file, void *priv,
>  {
>  	struct rvin_dev *vin = video_drvdata(file);
>  
> -	return rvin_try_format(vin, V4L2_SUBDEV_FORMAT_TRY, &f->fmt.pix, NULL,
> -			       NULL);
> +	return rvin_try_format(vin, V4L2_SUBDEV_FORMAT_TRY, &f->fmt.pix, NULL);
>  }
>  
>  static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
>  			      struct v4l2_format *f)
>  {
>  	struct rvin_dev *vin = video_drvdata(file);
> -	struct v4l2_rect crop, compose;
> +	struct v4l2_rect fmt_rect, src_rect;
>  	int ret;
>  
>  	if (vb2_is_busy(&vin->queue))
>  		return -EBUSY;
>  
>  	ret = rvin_try_format(vin, V4L2_SUBDEV_FORMAT_ACTIVE, &f->fmt.pix,
> -			      &crop, &compose);
> +			      &src_rect);
>  	if (ret)
>  		return ret;
>  
>  	vin->format = f->fmt.pix;
> -	v4l2_rect_map_inside(&vin->crop, &crop);
> -	v4l2_rect_map_inside(&vin->compose, &compose);
> -	vin->src_rect = crop;
> +
> +	fmt_rect.top = 0;
> +	fmt_rect.left = 0;
> +	fmt_rect.width = vin->format.width;
> +	fmt_rect.height = vin->format.height;
> +
> +	v4l2_rect_map_inside(&vin->crop, &src_rect);
> +	v4l2_rect_map_inside(&vin->compose, &fmt_rect);
> +	vin->src_rect = src_rect;
>  
>  	return 0;
>  }
> 

