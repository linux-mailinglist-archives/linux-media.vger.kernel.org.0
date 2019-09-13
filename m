Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1105CB212A
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 15:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389334AbfIMNfH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 09:35:07 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44780 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388524AbfIMNfG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 09:35:06 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9BEE33A;
        Fri, 13 Sep 2019 15:35:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568381703;
        bh=c/DAu/9ejvbLN+ifE60METToH39xCkPgvfOhCF6zG5k=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=vRlaGWJRFnapzzZRdY1xiNIO04+538y0Q1bUaksxLUj/SQUnYgA8QLUemLlJsNRng
         is3gfY6yXB5xtcW/mhOiHzC4wGrtsCu58Kiu7/YaHkx44/UQGJzsO+fuiLwsq8N5ay
         nLVdq28H4Zp82DjJsxNAq7jHpTSvEOI7DNaA8pzo=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v3 5/6] rcar-vin: Add support for V4L2_FIELD_ALTERNATE
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190904215409.30136-1-niklas.soderlund+renesas@ragnatech.se>
 <20190904215409.30136-6-niklas.soderlund+renesas@ragnatech.se>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <61fd1036-2d11-4761-6cab-93b70a44baf6@ideasonboard.com>
Date:   Fri, 13 Sep 2019 14:34:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904215409.30136-6-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/09/2019 22:54, Niklas Söderlund wrote:
> The hardware is capable to passing V4L2_FIELD_ALTERNATE to user-space.

s/to/of/

> Allow users to request this field format but still default to using the
> hardware interlacer if alternating is not explicitly requested.
> 
> Before this change a sensor providing data using alternate would be
> always combined to an interlaced frame. After this change the user can

s/would be always/would always be/

> request to receive frames as alternate if the sensor provides it.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c  | 43 +++++++++++++--------
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 31 +++++++--------
>  2 files changed, 39 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 7d40d71c863265c9..c7859b329dd4f02a 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -529,12 +529,17 @@ static void rvin_set_coeff(struct rvin_dev *vin, unsigned short xs)
>  
>  static void rvin_crop_scale_comp_gen2(struct rvin_dev *vin)
>  {
> +	unsigned int crop_height;
>  	u32 xs, ys;
>  
>  	/* Set scaling coefficient */
> +	crop_height = vin->crop.height;
> +	if (V4L2_FIELD_IS_INTERLACED(vin->format.field))
> +		crop_height *= 2;
> +
>  	ys = 0;
> -	if (vin->crop.height != vin->compose.height)
> -		ys = (4096 * vin->crop.height) / vin->compose.height;
> +	if (crop_height != vin->compose.height)
> +		ys = (4096 * crop_height) / vin->compose.height;
>  	rvin_write(vin, ys, VNYS_REG);
>  
>  	xs = 0;
> @@ -578,21 +583,9 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
>  	/* Set Start/End Pixel/Line Pre-Clip */
>  	rvin_write(vin, vin->crop.left, VNSPPRC_REG);
>  	rvin_write(vin, vin->crop.left + vin->crop.width - 1, VNEPPRC_REG);
> +	rvin_write(vin, vin->crop.top, VNSLPRC_REG);
> +	rvin_write(vin, vin->crop.top + vin->crop.height - 1, VNELPRC_REG);
>  
> -	switch (vin->format.field) {
> -	case V4L2_FIELD_INTERLACED:
> -	case V4L2_FIELD_INTERLACED_TB:
> -	case V4L2_FIELD_INTERLACED_BT:
> -		rvin_write(vin, vin->crop.top / 2, VNSLPRC_REG);
> -		rvin_write(vin, (vin->crop.top + vin->crop.height) / 2 - 1,
> -			   VNELPRC_REG);
> -		break;
> -	default:
> -		rvin_write(vin, vin->crop.top, VNSLPRC_REG);
> -		rvin_write(vin, vin->crop.top + vin->crop.height - 1,
> -			   VNELPRC_REG);
> -		break;
> -	}
>  
>  	/* TODO: Add support for the UDS scaler. */
>  	if (vin->info->model != RCAR_GEN3)
> @@ -636,6 +629,9 @@ static int rvin_setup(struct rvin_dev *vin)
>  		vnmc = VNMC_IM_ODD_EVEN;
>  		progressive = true;
>  		break;
> +	case V4L2_FIELD_ALTERNATE:
> +		vnmc = VNMC_IM_ODD_EVEN;
> +		break;
>  	default:
>  		vnmc = VNMC_IM_ODD;
>  		break;
> @@ -794,6 +790,18 @@ static bool rvin_capture_active(struct rvin_dev *vin)
>  	return rvin_read(vin, VNMS_REG) & VNMS_CA;
>  }
>  
> +static enum v4l2_field rvin_get_active_field(struct rvin_dev *vin, u32 vnms)
> +{
> +	if (vin->format.field == V4L2_FIELD_ALTERNATE) {
> +		/* If FS is set it is an Even field. */
> +		if (vnms & VNMS_FS)
> +			return V4L2_FIELD_BOTTOM;
> +		return V4L2_FIELD_TOP;
> +	}
> +
> +	return vin->format.field;
> +}
> +
>  static void rvin_set_slot_addr(struct rvin_dev *vin, int slot, dma_addr_t addr)
>  {
>  	const struct rvin_video_format *fmt;
> @@ -943,7 +951,7 @@ static irqreturn_t rvin_irq(int irq, void *data)
>  
>  	/* Capture frame */
>  	if (vin->queue_buf[slot]) {
> -		vin->queue_buf[slot]->field = vin->format.field;
> +		vin->queue_buf[slot]->field = rvin_get_active_field(vin, vnms);
>  		vin->queue_buf[slot]->sequence = vin->sequence;
>  		vin->queue_buf[slot]->vb2_buf.timestamp = ktime_get_ns();
>  		vb2_buffer_done(&vin->queue_buf[slot]->vb2_buf,
> @@ -1070,6 +1078,7 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
>  		case V4L2_FIELD_TOP:
>  		case V4L2_FIELD_BOTTOM:
>  		case V4L2_FIELD_NONE:
> +		case V4L2_FIELD_ALTERNATE:
>  			break;
>  		case V4L2_FIELD_INTERLACED_TB:
>  		case V4L2_FIELD_INTERLACED_BT:
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 3f175e2e0a9a1389..a7ee44dd248ea0a1 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -117,15 +117,7 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
>  	case V4L2_FIELD_INTERLACED_TB:
>  	case V4L2_FIELD_INTERLACED_BT:
>  	case V4L2_FIELD_INTERLACED:
> -		break;
>  	case V4L2_FIELD_ALTERNATE:
> -		/*
> -		 * Driver does not (yet) support outputting ALTERNATE to a
> -		 * userspace. It does support outputting INTERLACED so use
> -		 * the VIN hardware to combine the two fields.
> -		 */
> -		pix->field = V4L2_FIELD_INTERLACED;
> -		pix->height *= 2;
>  		break;
>  	default:
>  		pix->field = RVIN_DEFAULT_FIELD;
> @@ -164,15 +156,25 @@ static int rvin_reset_format(struct rvin_dev *vin)
>  
>  	v4l2_fill_pix_format(&vin->format, &fmt.format);
>  
> -	rvin_format_align(vin, &vin->format);
> -
>  	vin->src_rect.top = 0;
>  	vin->src_rect.left = 0;
>  	vin->src_rect.width = vin->format.width;
>  	vin->src_rect.height = vin->format.height;
>  
> +	/*  Make use of the hardware interlacer by default. */
> +	if (vin->format.field == V4L2_FIELD_ALTERNATE) {
> +		vin->format.field = V4L2_FIELD_INTERLACED;
> +		vin->format.height *= 2;
> +	}
> +
> +	rvin_format_align(vin, &vin->format);
> +
>  	vin->crop = vin->src_rect;
> -	vin->compose = vin->src_rect;
> +
> +	vin->compose.top = 0;
> +	vin->compose.left = 0;
> +	vin->compose.width = vin->format.width;
> +	vin->compose.height = vin->format.height;
>  
>  	return 0;
>  }
> @@ -217,13 +219,6 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
>  		crop->left = 0;
>  		crop->width = pix->width;
>  		crop->height = pix->height;
> -
> -		/*
> -		 * If source is ALTERNATE the driver will use the VIN hardware
> -		 * to INTERLACE it. The crop height then needs to be doubled.
> -		 */
> -		if (pix->field == V4L2_FIELD_ALTERNATE)
> -			crop->height *= 2;
>  	}
>  
>  	if (field != V4L2_FIELD_ANY)
> 

