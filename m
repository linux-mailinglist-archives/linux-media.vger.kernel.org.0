Return-Path: <linux-media+bounces-13566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F00E890D65D
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 16:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02DF92940C7
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F4313CA97;
	Tue, 18 Jun 2024 14:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rnMy1+TL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4790C13C3CC;
	Tue, 18 Jun 2024 14:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718722688; cv=none; b=IbzAE+ZOH/pXk4edrXY7a+7mLTBSkMZ15pmBtDGaU56l340fyU4rvqX99ThwghUgsS7cQuzPUR6TF7MZKttvBbkYTIcPWoezfOcPhJsGbfFurNdc+FxzaGVU+2iz+KZVykpXiCxCsalwaFgHJiqp+7RAWGywGxEAvMQPP+AhGNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718722688; c=relaxed/simple;
	bh=FfBfk4IiBL7rYz6Kron5YiLxqmoCUtlBLzCLV8YJOss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpXMDbBdXmAmc6PEUg6ELo0CgmYsDC3+BPCFLu1+ZDmRTkxeH54O+sfqZf3brp84FY3rKRH92IsT3z28psos+PPd4vp2G+fLAry+STiXLJ7mWa34q8HpTkPaXUVTAcSUSGkjUU72hERjFYC+97uoiEQ8NbsZMMyjlApfWTmYdOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rnMy1+TL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 258FE564;
	Tue, 18 Jun 2024 16:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718722667;
	bh=FfBfk4IiBL7rYz6Kron5YiLxqmoCUtlBLzCLV8YJOss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rnMy1+TL+nzRpOKX7lCQWCunw0sjLE1lsGu+EtaYtM1WuO9ba2vpBZ1P6mYm3G/bV
	 IwTDAH4IHYVC26cWt92Bq+fjBWMck8H8AgR9Patq/XIs1gp9VT8ZHpHfn6jXzeLXS2
	 q+vCdoLyOGRL49H4pSkDQrNZuzEGzzOYFPToQCn8=
Date: Tue, 18 Jun 2024 17:57:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-vin: Add support for RAW10
Message-ID: <20240618145742.GB16353@pendragon.ideasonboard.com>
References: <20240417120230.4086364-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240417120230.4086364-1-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Wed, Apr 17, 2024 at 02:02:30PM +0200, Niklas Söderlund wrote:
> Some R-Car SoCs are capable of capturing RAW10. Add support for it
> using the V4L2_PIX_FMT_Y10 pixel format, which I think is the correct
> format to express RAW10 unpacked to users.

MEDIA_BUS_FMT_Y10_1X10 and V4L2_PIX_FMT_Y10 are correct if the input
geenrates monochrome data. If the source produces bayer data, you need a
bayer pixel format and media bus code.

The bayer media bus codes should be easy to handle (you just need to add
them to the switch/case in rvin_setup()). The pixel formats are a bit
more annoying, as you'll need to update rvin_mc_validate_format() and
rvin_enum_fmt_vid_cap().

I don't like how V4L2 handles bayer formats, and that's something that
is on Sakari's and my radar to fix, probably sooner than later, by
introducing RAWx media bus codes and pixel formats.

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since RFC
> - Fix spelling in rcar-vin.h
> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-core.c |  1 +
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c  | 12 ++++++++++++
>  drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c |  8 ++++++++
>  drivers/media/platform/renesas/rcar-vin/rcar-vin.h  |  4 +++-
>  4 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index 809c3a38cc4a..e9675cb8faa2 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -1279,6 +1279,7 @@ static const struct rvin_info rcar_info_r8a779a0 = {
>  	.use_mc = true,
>  	.use_isp = true,
>  	.nv12 = true,
> +	.raw10 = true,
>  	.max_width = 4096,
>  	.max_height = 4096,
>  };
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index e2c40abc6d3d..dd290054dfe7 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -123,7 +123,9 @@
>  /* Video n Data Mode Register bits */
>  #define VNDMR_A8BIT(n)		(((n) & 0xff) << 24)
>  #define VNDMR_A8BIT_MASK	(0xff << 24)
> +#define VNDMR_RMODE_RAW10	(2 << 19)
>  #define VNDMR_YMODE_Y8		(1 << 12)
> +#define VNDMR_YC_THR		(1 << 11)
>  #define VNDMR_EXRGB		(1 << 8)
>  #define VNDMR_BPSM		(1 << 4)
>  #define VNDMR_ABIT		(1 << 2)
> @@ -780,6 +782,9 @@ static int rvin_setup(struct rvin_dev *vin)
>  	case MEDIA_BUS_FMT_Y8_1X8:
>  		vnmc |= VNMC_INF_RAW8;
>  		break;
> +	case MEDIA_BUS_FMT_Y10_1X10:
> +		vnmc |= VNMC_INF_RGB666;
> +		break;
>  	default:
>  		break;
>  	}
> @@ -888,6 +893,9 @@ static int rvin_setup(struct rvin_dev *vin)
>  			dmr = 0;
>  		}
>  		break;
> +	case V4L2_PIX_FMT_Y10:
> +		dmr = VNDMR_RMODE_RAW10 | VNDMR_YC_THR;
> +		break;
>  	default:
>  		vin_err(vin, "Invalid pixelformat (0x%x)\n",
>  			vin->format.pixelformat);
> @@ -1270,6 +1278,10 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
>  		if (vin->format.pixelformat != V4L2_PIX_FMT_GREY)
>  			return -EPIPE;
>  		break;
> +	case MEDIA_BUS_FMT_Y10_1X10:
> +		if (vin->format.pixelformat != V4L2_PIX_FMT_Y10)
> +			return -EPIPE;
> +		break;
>  	default:
>  		return -EPIPE;
>  	}
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> index bb4b07bed28d..e7298688541d 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> @@ -86,6 +86,10 @@ static const struct rvin_video_format rvin_formats[] = {
>  		.fourcc			= V4L2_PIX_FMT_GREY,
>  		.bpp			= 1,
>  	},
> +	{
> +		.fourcc			= V4L2_PIX_FMT_Y10,
> +		.bpp			= 4,

Isn't Y10 stored in 2 bytes per pixel, not 4 ?

> +	},
>  };
>  
>  const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
> @@ -106,6 +110,10 @@ const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
>  		if (!vin->info->nv12 || !(BIT(vin->id) & 0x3333))
>  			return NULL;
>  		break;
> +	case V4L2_PIX_FMT_Y10:
> +		if (!vin->info->raw10)
> +			return NULL;
> +		break;
>  	default:
>  		break;
>  	}

You need to update rvin_enum_fmt_vid_cap() too.

> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> index 997a66318a29..f87d4bc9e53e 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> @@ -151,7 +151,8 @@ struct rvin_group_route {
>   * @model:		VIN model
>   * @use_mc:		use media controller instead of controlling subdevice
>   * @use_isp:		the VIN is connected to the ISP and not to the CSI-2
> - * @nv12:		support outputing NV12 pixel format
> + * @nv12:		support outputting NV12 pixel format
> + * @raw10:		support outputting RAW10 pixel format
>   * @max_width:		max input width the VIN supports
>   * @max_height:		max input height the VIN supports
>   * @routes:		list of possible routes from the CSI-2 recivers to
> @@ -163,6 +164,7 @@ struct rvin_info {
>  	bool use_mc;
>  	bool use_isp;
>  	bool nv12;
> +	bool raw10;
>  
>  	unsigned int max_width;
>  	unsigned int max_height;

-- 
Regards,

Laurent Pinchart

