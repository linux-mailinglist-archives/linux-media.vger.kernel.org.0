Return-Path: <linux-media+bounces-41458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB6FB3EAF2
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 17:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6760F204AA1
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 15:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6632F0C41;
	Mon,  1 Sep 2025 15:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uRCQ1bUW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8608A1DEFE8;
	Mon,  1 Sep 2025 15:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756740618; cv=none; b=FzOqAnJuHaFAlzt+XQqLEVblsihzrbaigceV838y1Ot/CsUTDD5O3lBW9rvozMkFke9p4rJa0qNwwF2YatuWIxzlNw6uSE3huANttoZzhKpoK4FZrYiYa+TrgC2QuWETrHgefP4tSnF/7J4NFHgZA70/Gaf7P57V+ExD/5VmEW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756740618; c=relaxed/simple;
	bh=kX/tZVYiEk5ptHhznnvQ9//utnSoIvf0wDikGmrLZD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qlf7ZTTblTaNXDMDsjaMPyrGOxUXrtlEEaEzxEzAx6QQCo82Nj81KUAhaxqSSuPo4a/1vLDbWGy8kxs7wWwBXvP/28T7bdBx8PtCfp9+sD6sDCcaJ7PEGsqmWrUQWcyC9H/VH+ay2auM017qdfqg29HxXCcdqe46d/hZNm6E5Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uRCQ1bUW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BFC9EB63;
	Mon,  1 Sep 2025 17:29:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756740547;
	bh=kX/tZVYiEk5ptHhznnvQ9//utnSoIvf0wDikGmrLZD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uRCQ1bUWAoopTIxGVntirUbeLed9iVrDYu/KGOXF1pNadYVR0TUSnhluZh/tPMFJL
	 SWS1RDZ+0dS5ARvJsLgAkXvtWX+Rc3+kWa8MtqhLgdyHoCjA5wZJnjVRpH7ENJKCfi
	 MNvVz8/rU5JtklAakY97YN9G8lKhAgSbC+WQwdNc=
Date: Mon, 1 Sep 2025 17:29:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v2] media: rzg2l-cru: csi-2: Support RZ/V2H input sizes
Message-ID: <20250901152954.GH1705@pendragon.ideasonboard.com>
References: <20250829-rzv2h-cru-sizes-v2-1-cc5050ddb145@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250829-rzv2h-cru-sizes-v2-1-cc5050ddb145@ideasonboard.com>

On Fri, Aug 29, 2025 at 01:12:14PM +0200, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> The CRU version on the RZ/V2H SoC supports larger input sizes
> (4096x4096) compared to the version on the RZ/G2L (2800x4095).
> 
> Store the per-SoC min/max sizes in the device match info and use them
> in place of the hardcoded ones.
> 
> While at it, use the min sizes reported by the info structure to replace
> the RZG2L_CSI2_DEFAULT_WIDTH/HEIGHT macros.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---

Spurious ---

> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
> Changes in v2:
> - Use the size values in the rzg2l_csi2_info instea of going through
>   macros
> - Use min_width/min_height to initialize the format and drop
>   RZG2L_CSI2_DEFAULT_WIDTH/HEIGHT
> - Add Tommaso's tag
> - Link to v1: https://lore.kernel.org/r/20250826-rzv2h-cru-sizes-v1-1-dbdfc54bba11@ideasonboard.com
> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  | 41 ++++++++++++++--------
>  1 file changed, 26 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 1520211e74185fea3bca85f36239254f6b4651db..183598d6cf0b255f779b4398e027d626ad1f3c1b 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -96,13 +96,6 @@
>  
>  #define VSRSTS_RETRIES			20
>  
> -#define RZG2L_CSI2_MIN_WIDTH		320
> -#define RZG2L_CSI2_MIN_HEIGHT		240
> -#define RZG2L_CSI2_MAX_WIDTH		2800
> -#define RZG2L_CSI2_MAX_HEIGHT		4095
> -
> -#define RZG2L_CSI2_DEFAULT_WIDTH	RZG2L_CSI2_MIN_WIDTH
> -#define RZG2L_CSI2_DEFAULT_HEIGHT	RZG2L_CSI2_MIN_HEIGHT
>  #define RZG2L_CSI2_DEFAULT_FMT		MEDIA_BUS_FMT_UYVY8_1X16
>  
>  enum rzg2l_csi2_pads {
> @@ -137,6 +130,10 @@ struct rzg2l_csi2_info {
>  	int (*dphy_enable)(struct rzg2l_csi2 *csi2);
>  	int (*dphy_disable)(struct rzg2l_csi2 *csi2);
>  	bool has_system_clk;
> +	unsigned int min_width;
> +	unsigned int min_height;
> +	unsigned int max_width;
> +	unsigned int max_height;
>  };
>  
>  struct rzg2l_csi2_timings {
> @@ -418,6 +415,10 @@ static const struct rzg2l_csi2_info rzg2l_csi2_info = {
>  	.dphy_enable = rzg2l_csi2_dphy_enable,
>  	.dphy_disable = rzg2l_csi2_dphy_disable,
>  	.has_system_clk = true,
> +	.min_width = 320,
> +	.min_height = 240,
> +	.max_width = 2800,
> +	.max_height = 4095,
>  };
>  
>  static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
> @@ -542,6 +543,10 @@ static const struct rzg2l_csi2_info rzv2h_csi2_info = {
>  	.dphy_enable = rzv2h_csi2_dphy_enable,
>  	.dphy_disable = rzv2h_csi2_dphy_disable,
>  	.has_system_clk = false,
> +	.min_width = 320,
> +	.min_height = 240,

As the minimum for all SoCs is the same, I'd keep the MIN macros.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	.max_width = 4096,
> +	.max_height = 4096,
>  };
>  
>  static int rzg2l_csi2_mipi_link_setting(struct v4l2_subdev *sd, bool on)
> @@ -631,6 +636,7 @@ static int rzg2l_csi2_set_format(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *state,
>  				 struct v4l2_subdev_format *fmt)
>  {
> +	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
>  	struct v4l2_mbus_framefmt *src_format;
>  	struct v4l2_mbus_framefmt *sink_format;
>  
> @@ -653,9 +659,11 @@ static int rzg2l_csi2_set_format(struct v4l2_subdev *sd,
>  	sink_format->ycbcr_enc = fmt->format.ycbcr_enc;
>  	sink_format->quantization = fmt->format.quantization;
>  	sink_format->width = clamp_t(u32, fmt->format.width,
> -				     RZG2L_CSI2_MIN_WIDTH, RZG2L_CSI2_MAX_WIDTH);
> +				     csi2->info->min_width,
> +				     csi2->info->max_width);
>  	sink_format->height = clamp_t(u32, fmt->format.height,
> -				      RZG2L_CSI2_MIN_HEIGHT, RZG2L_CSI2_MAX_HEIGHT);
> +				     csi2->info->min_height,
> +				     csi2->info->max_height);
>  	fmt->format = *sink_format;
>  
>  	/* propagate format to source pad */
> @@ -668,9 +676,10 @@ static int rzg2l_csi2_init_state(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state)
>  {
>  	struct v4l2_subdev_format fmt = { .pad = RZG2L_CSI2_SINK, };
> +	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
>  
> -	fmt.format.width = RZG2L_CSI2_DEFAULT_WIDTH;
> -	fmt.format.height = RZG2L_CSI2_DEFAULT_HEIGHT;
> +	fmt.format.width = csi2->info->min_width;
> +	fmt.format.height = csi2->info->min_height;
>  	fmt.format.field = V4L2_FIELD_NONE;
>  	fmt.format.code = RZG2L_CSI2_DEFAULT_FMT;
>  	fmt.format.colorspace = V4L2_COLORSPACE_SRGB;
> @@ -697,16 +706,18 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_subdev *sd,
>  				      struct v4l2_subdev_state *sd_state,
>  				      struct v4l2_subdev_frame_size_enum *fse)
>  {
> +	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
> +
>  	if (fse->index != 0)
>  		return -EINVAL;
>  
>  	if (!rzg2l_csi2_code_to_fmt(fse->code))
>  		return -EINVAL;
>  
> -	fse->min_width = RZG2L_CSI2_MIN_WIDTH;
> -	fse->min_height = RZG2L_CSI2_MIN_HEIGHT;
> -	fse->max_width = RZG2L_CSI2_MAX_WIDTH;
> -	fse->max_height = RZG2L_CSI2_MAX_HEIGHT;
> +	fse->min_width = csi2->info->min_width;
> +	fse->min_height = csi2->info->min_height;
> +	fse->max_width = csi2->info->max_width;
> +	fse->max_height = csi2->info->max_height;
>  
>  	return 0;
>  }
> 
> ---
> base-commit: 16428e2449ab96cce27be6ab17b750b404c76c7c
> change-id: 20250826-rzv2h-cru-sizes-371ff5a88081

-- 
Regards,

Laurent Pinchart

