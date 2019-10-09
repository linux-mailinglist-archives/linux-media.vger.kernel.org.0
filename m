Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DBE1D098B
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 10:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727766AbfJIIWI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 04:22:08 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33100 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbfJIIWI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Oct 2019 04:22:08 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D13E4FF;
        Wed,  9 Oct 2019 10:22:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570609325;
        bh=Y+KSH6nSGL5cW7yaY/NCGo/BbkGGillsBvpqQPdf7F4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=okCCgBgW4HShQVv+6u16Ov7CeR5U01tCbiGIseD65mnfdujwNF6zfMNsj82Z6gcpq
         +h61eEJwF6vFrjShW586LMyHUt/x87NtM3dexuJAd8VNANQuSvctcXxycTkaBwaG5/
         0Tlt+wwKRvtAPDmdtWTRE7FUj0myU6MypkEwSpLI=
Date:   Wed, 9 Oct 2019 11:22:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] rcar-vin: Create compose rectangle where it is used
Message-ID: <20191009082204.GE22998@pendragon.ideasonboard.com>
References: <20191008232201.1768407-1-niklas.soderlund+renesas@ragnatech.se>
 <20191008232201.1768407-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191008232201.1768407-3-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nklas,

Thank you for the patch.

On Wed, Oct 09, 2019 at 01:22:01AM +0200, Niklas Söderlund wrote:
> The rectangle used to correct the compose settings when changing the
> format was created inside a helper function and not where it was used.
> This is confusing and makes the code harder to read, fix this.
> 
> This cleanup is made possible due to refactoring elsewhere and there is
> no functional change.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 25 +++++++++------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index f809350c514c337c..9a9b89c0dc0b3be4 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -181,8 +181,7 @@ static int rvin_reset_format(struct rvin_dev *vin)
>  
>  static int rvin_try_format(struct rvin_dev *vin, u32 which,
>  			   struct v4l2_pix_format *pix,
> -			   struct v4l2_rect *src_rect,
> -			   struct v4l2_rect *compose)
> +			   struct v4l2_rect *src_rect)
>  {
>  	struct v4l2_subdev *sd = vin_to_source(vin);
>  	struct v4l2_subdev_pad_config *pad_cfg;
> @@ -229,13 +228,6 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
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
> @@ -259,28 +251,33 @@ static int rvin_try_fmt_vid_cap(struct file *file, void *priv,
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
> -	struct v4l2_rect src_rect, compose;
> +	struct v4l2_rect fmt_rect, src_rect;

I would rename fmt_rect to something more descriptive. Maybe full_rect,
compose_bounds, ... ? Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	int ret;
>  
>  	if (vb2_is_busy(&vin->queue))
>  		return -EBUSY;
>  
>  	ret = rvin_try_format(vin, V4L2_SUBDEV_FORMAT_ACTIVE, &f->fmt.pix,
> -			      &src_rect, &compose);
> +			      &src_rect);
>  	if (ret)
>  		return ret;
>  
>  	vin->format = f->fmt.pix;
> +
> +	fmt_rect.top = 0;
> +	fmt_rect.left = 0;
> +	fmt_rect.width = vin->format.width;
> +	fmt_rect.height = vin->format.height;
> +
>  	v4l2_rect_map_inside(&vin->crop, &src_rect);
> -	v4l2_rect_map_inside(&vin->compose, &compose);
> +	v4l2_rect_map_inside(&vin->compose, &fmt_rect);
>  	vin->src_rect = src_rect;
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart
