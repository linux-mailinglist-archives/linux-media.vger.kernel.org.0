Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97C746E4DC
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2019 13:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbfGSLNg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jul 2019 07:13:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42488 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727486AbfGSLNg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jul 2019 07:13:36 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 398E631C;
        Fri, 19 Jul 2019 13:13:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1563534813;
        bh=EqNaxrCSQse1jkAajeLes8Tq1EhXDA+QGPqmVawruqk=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=Qy2qOZdSp6lHroJ1p8VjpQKIxnj+ieLN3R+8yuO3thrhy7dKE0g/lO9yhqJr3KVY0
         FWKH0FolDzW1UAPgY2WAv82HD+a8lpzRBq1SJo2eIRDbwB07wD8WTUQxcRquQnoz8i
         pBYTsJHtLi+TAzGWeXsEt5RWMRmmXybMNf0qkZo4=
Subject: Re: [PATCH 3/4] rcar-vin: Add support for V4L2_FIELD_ALTERNATE
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190705045557.25463-1-niklas.soderlund+renesas@ragnatech.se>
 <20190705045557.25463-4-niklas.soderlund+renesas@ragnatech.se>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <f79a9674-a6e0-7695-0542-ac1e55d50a97@ideasonboard.com>
Date:   Fri, 19 Jul 2019 12:13:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190705045557.25463-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On 05/07/2019 05:55, Niklas Söderlund wrote:
> The hardware is capable to passing V4L2_FIELD_ALTERNATE to user-space.
> Allow users to request this field format but still default to using the
> hardware interlacer if alternating is not explicitly requested.

I'm afraid I have found this patch quite difficult to review accurately ...

I think I can infer that we are removing an existing workaround where
V4L2_FIELD_ALTERNATE was converted to V4L2_FIELD_INTERLACED_xx formats,
and also now where we used to store 'frame' heights, we store 'field'
heights...

Is that somewhere close as an approximation? (Perhaps it might be good
to detail some of that in the commit message, at least any bits that are
accurate of course)


I might have to look at this again later, or let some other eyeballs
look as I'm afraid I don't feel that I've got a good overview of it yet.

I wonder if it could be split in anyway to be clearer, but it's hard to
tell :-)

Perhaps it's just me being unable to see all the changes at once.


< Some of my discussion comments below might seem out of order, as I've
made multiple passes through this :-D >

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c  | 54 +++++++++++----------
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 31 +++++-------
>  2 files changed, 42 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 372d6b106b9970d2..7ac1733455221fe0 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -526,12 +526,17 @@ static void rvin_set_coeff(struct rvin_dev *vin, unsigned short xs)
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
> @@ -554,16 +559,11 @@ static void rvin_crop_scale_comp_gen2(struct rvin_dev *vin)
>  	rvin_write(vin, 0, VNSPPOC_REG);
>  	rvin_write(vin, 0, VNSLPOC_REG);
>  	rvin_write(vin, vin->format.width - 1, VNEPPOC_REG);
> -	switch (vin->format.field) {
> -	case V4L2_FIELD_INTERLACED:
> -	case V4L2_FIELD_INTERLACED_TB:
> -	case V4L2_FIELD_INTERLACED_BT:
> +
> +	if (V4L2_FIELD_IS_INTERLACED(vin->format.field))

Ok, so I had to go check - V4L2_FIELD_IS_INTERLACED() does not include
'_ALTERNATE' - so this hunk is an improvement, but a somewhat unrelated
change.

Perhaps this could be split out to before this patch, anything to
simplify this patch would be good.

>  		rvin_write(vin, vin->format.height / 2 - 1, VNELPOC_REG);
> -		break;
> -	default:
> +	else
>  		rvin_write(vin, vin->format.height - 1, VNELPOC_REG);
> -		break;
> -	}
>  
>  	vin_dbg(vin,
>  		"Pre-Clip: %ux%u@%u:%u YS: %d XS: %d Post-Clip: %ux%u@%u:%u\n",
> @@ -577,21 +577,9 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
>  	/* Set Start/End Pixel/Line Pre-Clip */
>  	rvin_write(vin, vin->crop.left, VNSPPRC_REG);
>  	rvin_write(vin, vin->crop.left + vin->crop.width - 1, VNEPPRC_REG);
> +	rvin_write(vin, vin->crop.top, VNSLPRC_REG);
> +	rvin_write(vin, vin->crop.top + vin->crop.height - 1, VNELPRC_REG);

Should those be s/vin->crop.height/crop_height/ ? <edit - no>

How come there's no comparable if (V4L2_FIELD_IS_INTERLACED... in this
function?

Oh - because actually rvin_crop_scale_comp_gen2() is called from within
this function. They are not parallel functions for two implementations.


>  
> -	switch (vin->format.field) {
> -	case V4L2_FIELD_INTERLACED:
> -	case V4L2_FIELD_INTERLACED_TB:
> -	case V4L2_FIELD_INTERLACED_BT:
> -		rvin_write(vin, vin->crop.top / 2, VNSLPRC_REG);
> -		rvin_write(vin, (vin->crop.top + vin->crop.height) / 2 - 1,
> -			   VNELPRC_REG);
> -		break;

So - I think if i understand correctly - we used to store the
frame-height in vin->crop, and now we store the field height.

Is that right ?
 (where field-height == frame-height on progressive frames)



> -	default:
> -		rvin_write(vin, vin->crop.top, VNSLPRC_REG);
> -		rvin_write(vin, vin->crop.top + vin->crop.height - 1,
> -			   VNELPRC_REG);
> -		break;
> -	}
>  
>  	/* TODO: Add support for the UDS scaler. */
>  	if (vin->info->model != RCAR_GEN3)
> @@ -636,6 +624,9 @@ static int rvin_setup(struct rvin_dev *vin)
>  		vnmc = VNMC_IM_ODD_EVEN;
>  		progressive = true;
>  		break;
> +	case V4L2_FIELD_ALTERNATE:
> +		vnmc = VNMC_IM_ODD_EVEN;
> +		break;
>  	default:
>  		vnmc = VNMC_IM_ODD;
>  		break;
> @@ -788,6 +779,18 @@ static bool rvin_capture_active(struct rvin_dev *vin)
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
> @@ -937,7 +940,7 @@ static irqreturn_t rvin_irq(int irq, void *data)
>  
>  	/* Capture frame */
>  	if (vin->queue_buf[slot]) {
> -		vin->queue_buf[slot]->field = vin->format.field;
> +		vin->queue_buf[slot]->field = rvin_get_active_field(vin, vnms);
>  		vin->queue_buf[slot]->sequence = vin->sequence;
>  		vin->queue_buf[slot]->vb2_buf.timestamp = ktime_get_ns();
>  		vb2_buffer_done(&vin->queue_buf[slot]->vb2_buf,
> @@ -1064,6 +1067,7 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
>  		case V4L2_FIELD_TOP:
>  		case V4L2_FIELD_BOTTOM:
>  		case V4L2_FIELD_NONE:
> +		case V4L2_FIELD_ALTERNATE:
>  			break;
>  		case V4L2_FIELD_INTERLACED_TB:
>  		case V4L2_FIELD_INTERLACED_BT:
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index d5e860ba6d9a2409..bc96ed563e365448 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -106,15 +106,7 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
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

Ok - now I get it, this used to double the format height to work around
the lack of _ALTERNATE implementation on the sink pad/device...

So this part is removal of the existing workaround.


>  		break;
>  	default:
>  		pix->field = RVIN_DEFAULT_FIELD;
> @@ -153,15 +145,25 @@ static int rvin_reset_format(struct rvin_dev *vin)
>  
>  	v4l2_fill_pix_format(&vin->format, &fmt.format);

This call v4l2_fill_pix_format() does the following:
 "vin->format.field = fmt.format.field;"

Ok - so that's obtaining the *source pad format*

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

And here we are resetting the vin->format which looks like it represents
the VIN sink device right?

I guess we are changing alternate-fields to interlaced frames to prevent
the driver from 'passing through' alternate formats to maintain the
user-space experience here?


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
> @@ -205,13 +207,6 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
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

And this part is just removing of the previous workaround right?


>  	}
>  
>  	if (field != V4L2_FIELD_ANY)
> 

