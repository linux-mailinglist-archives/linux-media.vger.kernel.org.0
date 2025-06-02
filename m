Return-Path: <linux-media+bounces-33925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0B1ACAFA4
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 15:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46EFA7A7A4B
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 13:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C8F222564;
	Mon,  2 Jun 2025 13:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oA+w3gT6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91082221FCA;
	Mon,  2 Jun 2025 13:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748872178; cv=none; b=k3K80/XGgXpfsyOsEJKwEAhB2vfcAPgxkjcV8ui5BmK2qurNp4PbulVtdsoLSoE2lRQrzICHaRzPVf75ddUIxRVdYDeNhkg9g1SvEPKwaOxIHEo/388iyB10cQWbaigPzpGKYkylwLG6q2o/j6CM58WqvRiZ7kt9/L0T/+OeGQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748872178; c=relaxed/simple;
	bh=fEgCmJn14YCLg4Nbmc/Dmo0gdmseyNkH1UNBp79XPPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZrKLS4QJQ00hjw4Ulv5zBF+bZBrG5+TFQd+8dB6n36yh8+tODeE5Nh3CBLkZ54Smh9mQFASIfQ3UM9weyTWVDP9cQKm4A8xfpX5ksEUsTFJhaFuohYa1CdV2ksNb3s0bwBQunfOjX4uD2ClLTPlKvS2aMXbA85scRCU8xFa5izU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oA+w3gT6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3413FC9;
	Mon,  2 Jun 2025 15:49:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748872173;
	bh=fEgCmJn14YCLg4Nbmc/Dmo0gdmseyNkH1UNBp79XPPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oA+w3gT6dezzAvebr9CuEBqd7//cajhNEmJ38RUlrN5c+4KVeRL0VydPKmm/aVKiV
	 jUQvB8g8FbQoQm1LQoU9jUso+G6InD25uGH2Yw7wYRz/Sua20s92vdlVn9mDkQ02I/
	 9ZB0HvXevDwwWVWi9T7zJkn1dToivRIqEldIo1jg=
Date: Mon, 2 Jun 2025 16:49:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 13/15] media: rcar-csi2: Call get_frame_desc to find
 out VC & DT (Gen3)
Message-ID: <20250602134926.GB23515@pendragon.ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-13-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530-rcar-streams-v3-13-026655df7138@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Fri, May 30, 2025 at 04:50:42PM +0300, Tomi Valkeinen wrote:
> Call get_frame_desc to find out VC & DT, for Gen3 platforms, instead of
> hardcoding the VC routing and deducing the DT based on the mbus format.
> 
> If the source subdevice doesn't implement .get_frame_desc, we use a
> fallback case where we assume there's a single stream with VC = 0 and DT
> based on the mbus format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 113 +++++++++++++++++++----------
>  1 file changed, 76 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index b9f83aae725a..8f708196ef49 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -71,10 +71,7 @@ struct rcar_csi2;
>  #define FLD_REG				0x1c
>  #define FLD_FLD_NUM(n)			(((n) & 0xff) << 16)
>  #define FLD_DET_SEL(n)			(((n) & 0x3) << 4)
> -#define FLD_FLD_EN4			BIT(3)
> -#define FLD_FLD_EN3			BIT(2)
> -#define FLD_FLD_EN2			BIT(1)
> -#define FLD_FLD_EN			BIT(0)
> +#define FLD_FLD_EN(ch)			BIT(ch)
>  
>  /* Automatic Standby Control */
>  #define ASTBY_REG			0x20
> @@ -1066,52 +1063,94 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>  static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
>  				     struct v4l2_subdev_state *state)
>  {
> -	const struct rcar_csi2_format *format;
> -	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
> -	const struct v4l2_mbus_framefmt *fmt;
> +	u32 phycnt, vcdt = 0, vcdt2 = 0;
> +	u32 fld = FLD_DET_SEL(1);
> +	struct v4l2_mbus_frame_desc source_fd;
> +	struct v4l2_subdev_route *route;
>  	unsigned int lanes;
> -	unsigned int i;
>  	int mbps, ret;
> +	u8 ch = 0;
>  
> -	/* Use the format on the sink pad to compute the receiver config. */
> -	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
> +	ret = v4l2_subdev_call(priv->remote, pad, get_frame_desc,
> +			       priv->remote_pad, &source_fd);
> +	if (ret && ret != -ENOIOCTLCMD) {
> +		return ret;
> +	} else if (ret == -ENOIOCTLCMD) {

	if (ret && ret != -ENOIOCTLCMD)
		return ret;

	if (ret == -ENOIOCTLCMD) {

> +		/* Create a fallback source_fd */
> +		struct v4l2_mbus_frame_desc *fd = &source_fd;
> +		const struct rcar_csi2_format *format;
> +		struct v4l2_mbus_framefmt *fmt;
>  
> -	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
> -		fmt->width, fmt->height,
> -		fmt->field == V4L2_FIELD_NONE ? 'p' : 'i');
> +		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
> +		if (!fmt)
> +			return -EINVAL;
>  
> -	/* Code is validated in set_fmt. */
> -	format = rcsi2_code_to_fmt(fmt->code);
> -	if (!format)
> -		return -EINVAL;
> +		format = rcsi2_code_to_fmt(fmt->code);
> +		if (!format)
> +			return -EINVAL;
>  
> -	/*
> -	 * Enable all supported CSI-2 channels with virtual channel and
> -	 * data type matching.
> -	 *
> -	 * NOTE: It's not possible to get individual datatype for each
> -	 *       source virtual channel. Once this is possible in V4L2
> -	 *       it should be used here.
> -	 */
> -	for (i = 0; i < priv->info->num_channels; i++) {
> +		memset(fd, 0, sizeof(*fd));
> +
> +		fd->num_entries = 1;
> +		fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +		fd->entry[0].stream = 0;
> +		fd->entry[0].pixelcode = fmt->code;
> +		fd->entry[0].bus.csi2.vc = 0;
> +		fd->entry[0].bus.csi2.dt = format->datatype;
> +	}
> +
> +	for_each_active_route(&state->routing, route) {
> +		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;

const

> +		const struct v4l2_mbus_framefmt *fmt;
> +		const struct rcar_csi2_format *format;
> +		unsigned int i;
> +		u8 vc, dt;
>  		u32 vcdt_part;
>  
> -		if (priv->channel_vc[i] < 0)
> -			continue;
> +		for (i = 0; i < source_fd.num_entries; i++) {
> +			if (source_fd.entry[i].stream == route->sink_stream) {

No need to check the pad ?

> +				source_entry = &source_fd.entry[i];
> +				break;
> +			}
> +		}
> +
> +		if (!source_entry) {
> +			dev_err(priv->dev,
> +				"Failed to find stream from source frame desc\n");
> +			return -EPIPE;
> +		}
>  
> -		vcdt_part = VCDT_SEL_VC(priv->channel_vc[i]) | VCDT_VCDTN_EN |
> -			VCDT_SEL_DTN_ON | VCDT_SEL_DT(format->datatype);
> +		vc = source_entry->bus.csi2.vc;
> +		dt = source_entry->bus.csi2.dt;
> +
> +		vcdt_part = VCDT_SEL_VC(vc) | VCDT_VCDTN_EN |
> +			VCDT_SEL_DTN_ON | VCDT_SEL_DT(dt);

I would drop the vc and dt variables and write

		vcdt_part = VCDT_SEL_VC(source_entry->bus.csi2.vc)
			  | VCDT_VCDTN_EN | VCDT_SEL_DTN_ON
			  | VCDT_SEL_DT(source_entry->bus.csi2.dt);

>  
>  		/* Store in correct reg and offset. */
> -		if (i < 2)
> -			vcdt |= vcdt_part << ((i % 2) * 16);
> +		if (ch < 2)
> +			vcdt |= vcdt_part << ((ch % 2) * 16);
>  		else
> -			vcdt2 |= vcdt_part << ((i % 2) * 16);
> -	}
> +			vcdt2 |= vcdt_part << ((ch % 2) * 16);
> +
> +		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK,
> +						   route->sink_stream);
> +		if (!fmt)
> +			return -EINVAL;
> +
> +		dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
> +			fmt->width, fmt->height,
> +			fmt->field == V4L2_FIELD_NONE ? 'p' : 'i');
>  
> -	if (fmt->field == V4L2_FIELD_ALTERNATE)
> -		fld = FLD_DET_SEL(1) | FLD_FLD_EN4 | FLD_FLD_EN3 | FLD_FLD_EN2
> -			| FLD_FLD_EN;
> +		/* Code is validated in set_fmt. */

Then why don't you drop the !format check ?

> +		format = rcsi2_code_to_fmt(fmt->code);
> +		if (!format)
> +			return -EINVAL;
> +
> +		if (fmt->field == V4L2_FIELD_ALTERNATE)
> +			fld |= FLD_FLD_EN(ch);
> +
> +		ch++;
> +	}
>  
>  	/*
>  	 * Get the number of active data lanes inspecting the remote mbus

-- 
Regards,

Laurent Pinchart

