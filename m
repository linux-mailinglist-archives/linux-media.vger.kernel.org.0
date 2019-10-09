Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9EC7D0971
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 10:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727355AbfJIISb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 04:18:31 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33050 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfJIISb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Oct 2019 04:18:31 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63C934FF;
        Wed,  9 Oct 2019 10:18:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570609109;
        bh=4IIctmFYDxVRfUglCrCRwS/1ElqpQLuWK30VH08/iJc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qaRTrOeLPd3K1N2RH8sCYK6JL6l3p7APxwUMYZrOYnJ9GZG+DuHGwhGvzS9sPRGax
         rOTjchA1YwtPhcBEn+m7G0LE5hmdvZ/F9dm4B34ThapPlFqrIvthUeGVoTPUMzp4m7
         76oO3e51CjhTreEQwCpfU5XQL7Jg+vG5VbFglkqY=
Date:   Wed, 9 Oct 2019 11:18:28 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] rcar-vin: Rename wrongly named rectangle
Message-ID: <20191009081828.GD22998@pendragon.ideasonboard.com>
References: <20191008232201.1768407-1-niklas.soderlund+renesas@ragnatech.se>
 <20191008232201.1768407-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191008232201.1768407-2-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Wed, Oct 09, 2019 at 01:22:00AM +0200, Niklas Söderlund wrote:
> After recent refactoring the rectangle named crop no longer reflects it
> usage, to contain the source rectangle. Fix this by renaming it. There
> is no functional change.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index a7ee44dd248ea0a1..f809350c514c337c 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -181,7 +181,8 @@ static int rvin_reset_format(struct rvin_dev *vin)
>  
>  static int rvin_try_format(struct rvin_dev *vin, u32 which,
>  			   struct v4l2_pix_format *pix,
> -			   struct v4l2_rect *crop, struct v4l2_rect *compose)
> +			   struct v4l2_rect *src_rect,
> +			   struct v4l2_rect *compose)
>  {
>  	struct v4l2_subdev *sd = vin_to_source(vin);
>  	struct v4l2_subdev_pad_config *pad_cfg;
> @@ -214,11 +215,11 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
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
> @@ -266,21 +267,21 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
>  			      struct v4l2_format *f)
>  {
>  	struct rvin_dev *vin = video_drvdata(file);
> -	struct v4l2_rect crop, compose;
> +	struct v4l2_rect src_rect, compose;
>  	int ret;
>  
>  	if (vb2_is_busy(&vin->queue))
>  		return -EBUSY;
>  
>  	ret = rvin_try_format(vin, V4L2_SUBDEV_FORMAT_ACTIVE, &f->fmt.pix,
> -			      &crop, &compose);
> +			      &src_rect, &compose);
>  	if (ret)
>  		return ret;
>  
>  	vin->format = f->fmt.pix;
> -	v4l2_rect_map_inside(&vin->crop, &crop);
> +	v4l2_rect_map_inside(&vin->crop, &src_rect);
>  	v4l2_rect_map_inside(&vin->compose, &compose);
> -	vin->src_rect = crop;
> +	vin->src_rect = src_rect;
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
