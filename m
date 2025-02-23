Return-Path: <linux-media+bounces-26736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8D2A41161
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 20:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D0011899E29
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40771DB95E;
	Sun, 23 Feb 2025 19:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kZQ4j/Zx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B235D8F0;
	Sun, 23 Feb 2025 19:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740340465; cv=none; b=CZnSF3VPExPxvSJviSTChgGPGambuXBWZhU5D3YWyylyNGhDKfHupf6CBzCV+tl534NZWRSK3YN9gxMiPGPL1g8IF09npnG6qu+ey7wpzzVl9Tyrb6kA2oAQqv8wwpcZ4Dg0UtoBHNCkd6+CiLUMOVKCbK4h6SMs02pOdDt++Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740340465; c=relaxed/simple;
	bh=KiyupSaVstdB8pPkd0tAAghiZJTw5AaEaNQGsQhhg50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=orG3sk+bTvQrVkN/PGA21FffGc3U0xTQ95W86YP63N1pKsMR6z5nCD2teOZaTOWqEKI7sgTzFv0hdrNoOI1G9BwIfEQxoYEm5tYvKGffJO1h7CnkVMfuZBY59Edu3lqMLsfoZRSQVMUjFQM8Q8lZcvp00Chmvdwu+6DQAEJjFxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kZQ4j/Zx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A8E14DC;
	Sun, 23 Feb 2025 20:52:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740340376;
	bh=KiyupSaVstdB8pPkd0tAAghiZJTw5AaEaNQGsQhhg50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kZQ4j/ZxOVEV9TDMVRt+yCGa/hopFEQTvvsLKbHFaxLsYR4cZ8k+ibs8pCVBJw1D5
	 QoutPxTeyDdBBHnViiGzAFBC5SLK5+Pu5fH+m04pDAq7yBUH8RkAKNrMI4RFmo5B/N
	 tZzN15K91c3YRVegasD2JGbMM7WjrhAa7uWLG+4o=
Date: Sun, 23 Feb 2025 21:54:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/18] media: rzg2l-cru: Pass resolution limits via OF
 data
Message-ID: <20250223195405.GG8330@pendragon.ideasonboard.com>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-13-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250221155532.576759-13-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

Thank you for the patch.

On Fri, Feb 21, 2025 at 04:55:26PM +0100, Tommaso Merciai wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Pass `max_width` and `max_height` as part of the OF data to facilitate the
> addition of support for RZ/G3E and RZ/V2H(P) SoCs. These SoCs have a
> maximum resolution of 4096x4096 as compared to 2800x4095 on RZ/G2L SoC.
> This change prepares the driver for easier integration of these SoCs by
> defining the resolution limits in the `rzg2l_cru_info` structure.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-core.c   |  2 ++
>  .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++--
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 13 +++++++++----
>  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c  |  5 +++--
>  4 files changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index abc2a979833a..19f93b7fe6fb 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -355,6 +355,8 @@ static const u16 rzg2l_cru_regs[] = {
>  };
>  
>  static const struct rzg2l_cru_info rzgl2_cru_info = {
> +	.max_width = 2800,
> +	.max_height = 4095,
>  	.regs = rzg2l_cru_regs,
>  };
>  
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 00c3f7458e20..6a621073948a 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -27,9 +27,7 @@
>  #define RZG2L_CRU_CSI2_VCHANNEL		4
>  
>  #define RZG2L_CRU_MIN_INPUT_WIDTH	320
> -#define RZG2L_CRU_MAX_INPUT_WIDTH	2800
>  #define RZG2L_CRU_MIN_INPUT_HEIGHT	240
> -#define RZG2L_CRU_MAX_INPUT_HEIGHT	4095
>  
>  enum rzg2l_csi2_pads {
>  	RZG2L_CRU_IP_SINK = 0,
> @@ -81,6 +79,8 @@ struct rzg2l_cru_ip_format {
>  };
>  
>  struct rzg2l_cru_info {
> +	unsigned int max_width;
> +	unsigned int max_height;
>  	const u16 *regs;
>  };
>  
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index 76a2b451f1da..7836c7cd53dc 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -148,6 +148,8 @@ static int rzg2l_cru_ip_set_format(struct v4l2_subdev *sd,
>  				   struct v4l2_subdev_state *state,
>  				   struct v4l2_subdev_format *fmt)
>  {
> +	struct rzg2l_cru_dev *cru = v4l2_get_subdevdata(sd);
> +	const struct rzg2l_cru_info *info = cru->info;
>  	struct v4l2_mbus_framefmt *src_format;
>  	struct v4l2_mbus_framefmt *sink_format;
>  
> @@ -170,9 +172,9 @@ static int rzg2l_cru_ip_set_format(struct v4l2_subdev *sd,
>  	sink_format->ycbcr_enc = fmt->format.ycbcr_enc;
>  	sink_format->quantization = fmt->format.quantization;
>  	sink_format->width = clamp_t(u32, fmt->format.width,
> -				     RZG2L_CRU_MIN_INPUT_WIDTH, RZG2L_CRU_MAX_INPUT_WIDTH);
> +				     RZG2L_CRU_MIN_INPUT_WIDTH, info->max_width);
>  	sink_format->height = clamp_t(u32, fmt->format.height,
> -				      RZG2L_CRU_MIN_INPUT_HEIGHT, RZG2L_CRU_MAX_INPUT_HEIGHT);
> +				      RZG2L_CRU_MIN_INPUT_HEIGHT, info->max_height);
>  
>  	fmt->format = *sink_format;
>  
> @@ -197,6 +199,9 @@ static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
>  					struct v4l2_subdev_state *state,
>  					struct v4l2_subdev_frame_size_enum *fse)
>  {
> +	struct rzg2l_cru_dev *cru = v4l2_get_subdevdata(sd);
> +	const struct rzg2l_cru_info *info = cru->info;
> +
>  	if (fse->index != 0)
>  		return -EINVAL;
>  
> @@ -205,8 +210,8 @@ static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
>  
>  	fse->min_width = RZG2L_CRU_MIN_INPUT_WIDTH;
>  	fse->min_height = RZG2L_CRU_MIN_INPUT_HEIGHT;
> -	fse->max_width = RZG2L_CRU_MAX_INPUT_WIDTH;
> -	fse->max_height = RZG2L_CRU_MAX_INPUT_HEIGHT;
> +	fse->max_width = info->max_width;
> +	fse->max_height = info->max_height;
>  
>  	return 0;
>  }
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index f25fd9b35c55..9e5e79c6ca98 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -690,6 +690,7 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
>  static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
>  				   struct v4l2_pix_format *pix)
>  {
> +	const struct rzg2l_cru_info *info = cru->info;
>  	const struct rzg2l_cru_ip_format *fmt;
>  
>  	fmt = rzg2l_cru_ip_format_to_fmt(pix->pixelformat);
> @@ -712,8 +713,8 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
>  	}
>  
>  	/* Limit to CRU capabilities */
> -	v4l_bound_align_image(&pix->width, 320, RZG2L_CRU_MAX_INPUT_WIDTH, 1,
> -			      &pix->height, 240, RZG2L_CRU_MAX_INPUT_HEIGHT, 2, 0);
> +	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
> +			      &pix->height, 240, info->max_height, 2, 0);
>  
>  	pix->bytesperline = pix->width * fmt->bpp;
>  	pix->sizeimage = pix->bytesperline * pix->height;

-- 
Regards,

Laurent Pinchart

