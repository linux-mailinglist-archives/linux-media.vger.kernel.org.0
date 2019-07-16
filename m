Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49FFE6AAB5
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 16:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728390AbfGPOkM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 10:40:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46362 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbfGPOkM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 10:40:12 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BFC78564;
        Tue, 16 Jul 2019 16:40:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1563288010;
        bh=Bd631ZIC+oCiXOw9pWOJdoCUJbqSG8BV6kIIJ4bmPUA=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=M+OB2SZTK+rwDdo/InqymwVcG4ys/ZBhLfDi5cllmiWHCmhrsJT33Sw1I1CVk3h61
         U2T1acwEG6mT/U7R8yLDdFJyEwvKGeLlV+0MebccodxNG4zMAjmCikrHyAtkNbaH85
         jLxJ++DvOm2B4EeJI+IPB7pDaDdFKLjPCdOKOqVs=
Subject: Re: [PATCH 1/4] rcar-vin: Rename rectangle holding holding the video
 source information
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190705045557.25463-1-niklas.soderlund+renesas@ragnatech.se>
 <20190705045557.25463-2-niklas.soderlund+renesas@ragnatech.se>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <b4ea4f7a-1a35-b514-3068-a790f7d7c541@ideasonboard.com>
Date:   Tue, 16 Jul 2019 15:40:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190705045557.25463-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On 05/07/2019 05:55, Niklas Söderlund wrote:
> The variable to hold the video source information dimensions was poorly
> named 'source'. This is confusing as a lot of other members of struts

s/struts/structs/

> share the same name with different purposes, rename it src_rect in
> preparation of refactoring code.
> 

Sounds reasonable to me, and matches the other _rect instances in the
code base.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 33 +++++++++++----------
>  drivers/media/platform/rcar-vin/rcar-vin.h  |  4 +--
>  2 files changed, 19 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 04d798d8070f912c..2d94e700a473572c 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -155,13 +155,13 @@ static int rvin_reset_format(struct rvin_dev *vin)
>  
>  	rvin_format_align(vin, &vin->format);
>  
> -	vin->source.top = 0;
> -	vin->source.left = 0;
> -	vin->source.width = vin->format.width;
> -	vin->source.height = vin->format.height;
> +	vin->src_rect.top = 0;
> +	vin->src_rect.left = 0;
> +	vin->src_rect.width = vin->format.width;
> +	vin->src_rect.height = vin->format.height;
>  
> -	vin->crop = vin->source;
> -	vin->compose = vin->source;
> +	vin->crop = vin->src_rect;
> +	vin->compose = vin->src_rect;
>  
>  	return 0;
>  }
> @@ -273,7 +273,7 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
>  	vin->format = f->fmt.pix;
>  	vin->crop = crop;
>  	vin->compose = compose;
> -	vin->source = crop;
> +	vin->src_rect = crop;
>  
>  	return 0;
>  }
> @@ -311,8 +311,8 @@ static int rvin_g_selection(struct file *file, void *fh,
>  	case V4L2_SEL_TGT_CROP_BOUNDS:
>  	case V4L2_SEL_TGT_CROP_DEFAULT:
>  		s->r.left = s->r.top = 0;
> -		s->r.width = vin->source.width;
> -		s->r.height = vin->source.height;
> +		s->r.width = vin->src_rect.width;
> +		s->r.height = vin->src_rect.height;
>  		break;
>  	case V4L2_SEL_TGT_CROP:
>  		s->r = vin->crop;
> @@ -354,21 +354,22 @@ static int rvin_s_selection(struct file *file, void *fh,
>  	case V4L2_SEL_TGT_CROP:
>  		/* Can't crop outside of source input */
>  		max_rect.top = max_rect.left = 0;
> -		max_rect.width = vin->source.width;
> -		max_rect.height = vin->source.height;
> +		max_rect.width = vin->src_rect.width;
> +		max_rect.height = vin->src_rect.height;
>  		v4l2_rect_map_inside(&r, &max_rect);
>  
> -		v4l_bound_align_image(&r.width, 6, vin->source.width, 0,
> -				      &r.height, 2, vin->source.height, 0, 0);
> +		v4l_bound_align_image(&r.width, 6, vin->src_rect.width, 0,
> +				      &r.height, 2, vin->src_rect.height, 0, 0);
>  
> -		r.top  = clamp_t(s32, r.top, 0, vin->source.height - r.height);
> -		r.left = clamp_t(s32, r.left, 0, vin->source.width - r.width);
> +		r.top  = clamp_t(s32, r.top, 0,
> +				 vin->src_rect.height - r.height);
> +		r.left = clamp_t(s32, r.left, 0, vin->src_rect.width - r.width);
>  
>  		vin->crop = s->r = r;
>  
>  		vin_dbg(vin, "Cropped %dx%d@%d:%d of %dx%d\n",
>  			r.width, r.height, r.left, r.top,
> -			vin->source.width, vin->source.height);
> +			vin->src_rect.width, vin->src_rect.height);
>  		break;
>  	case V4L2_SEL_TGT_COMPOSE:
>  		/* Make sure compose rect fits inside output format */
> diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> index ac1a6fe90015ed69..f91cf1f26afe7a52 100644
> --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> @@ -176,7 +176,7 @@ struct rvin_info {
>   *
>   * @crop:		active cropping
>   * @compose:		active composing
> - * @source:		active size of the video source
> + * @src_rect:		active size of the video source
>   * @std:		active video standard of the video source
>   */
>  struct rvin_dev {
> @@ -213,7 +213,7 @@ struct rvin_dev {
>  
>  	struct v4l2_rect crop;
>  	struct v4l2_rect compose;
> -	struct v4l2_rect source;
> +	struct v4l2_rect src_rect;
>  	v4l2_std_id std;
>  };
>  
> 

