Return-Path: <linux-media+bounces-27298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B46A2A4B1FC
	for <lists+linux-media@lfdr.de>; Sun,  2 Mar 2025 15:01:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C42E916B657
	for <lists+linux-media@lfdr.de>; Sun,  2 Mar 2025 14:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262BD1E5B96;
	Sun,  2 Mar 2025 14:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sq3dsIiq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE0A23F36D;
	Sun,  2 Mar 2025 14:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740924092; cv=none; b=fA/GF0YUUTgqUvS6hS5yC7j2PHNswezCh5yYR6onNk4xmgy5w9Z0dF9qsm031MlVmMyHMDYZvtB/bP7JZC1MrfGKtwW9uw5/QqF3ZRTszk7SmBfLfs/SWONmyMQKtfiYQBrUwK+Rhb9Sb44NJQ1FfGgN8FQSHN0aIeSxiuoI250=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740924092; c=relaxed/simple;
	bh=bTV7+x8UNyjpkw5uWuSg3TKlageT3ncj5wk/ovRFjc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2tURSLuYU+qFE/+HBaAU5giQbMVztctMxB3DstNGbEVOHKREhyNboNZKc5EvjrmKPOzsmYl66em9ZfgKNtPTm5CFI/Tws7va94IjCRHLWlM9uCqnuqEVHP1vnETT37ksIoeDEGGd676hUzTHEc+mg0Yty8uR03UL/qHPttg/hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sq3dsIiq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4510B670;
	Sun,  2 Mar 2025 14:59:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740923998;
	bh=bTV7+x8UNyjpkw5uWuSg3TKlageT3ncj5wk/ovRFjc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sq3dsIiqHa67eUS5TRCzPWkqRkVEinxtGskHh4uzdQVnvPyyKtVU+ydKknmzANQGU
	 T8DvmSIXiAv+cxg6Y5Vs9Gr4DvTpYa1dYkfhwSBGKgEGl0I2PFL+oJLlpq5SJHWjqO
	 kkyCqvGdwOXjoc12hwBqb0YDFTniDMRqa/M4UVTY=
Date: Sun, 2 Mar 2025 16:01:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 5/6] media: vsp1: rwpf: Support RAW Bayer and ISP
 config
Message-ID: <20250302140110.GM18557@pendragon.ideasonboard.com>
References: <20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com>
 <20250224-v4h-iif-v2-5-0305e3c1fe2d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250224-v4h-iif-v2-5-0305e3c1fe2d@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Mon, Feb 24, 2025 at 09:19:45PM +0100, Jacopo Mondi wrote:
> With the forthcoming support for VSPX the r/wpf unit will be used
> to perform memory access on the behalf of the ISP units.
> 
> Prepare to support reading from external memory images in RAW Bayer
> format and ISP configuration parameters by expanding the list
> of supported media bus codes.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_rwpf.c | 97 +++++++++++++++++++++++--
>  1 file changed, 92 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> index 93b0ed5fd0da0c6a182dbbfe1e54eb8cfd66c493..aef7b3d53a2171cda028a272f587641b4a8f85dc 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> @@ -10,18 +10,102 @@
>  #include <media/v4l2-subdev.h>
>  
>  #include "vsp1.h"
> +#include "vsp1_pipe.h"

I don't think this is needed.

>  #include "vsp1_rwpf.h"
>  #include "vsp1_video.h"
>  
>  #define RWPF_MIN_WIDTH				1
>  #define RWPF_MIN_HEIGHT				1
>  
> +struct vsp1_rwpf_codes {
> +	const u32 *codes;
> +	unsigned int num_codes;
> +};
> +
>  static const u32 rwpf_mbus_codes[] = {
>  	MEDIA_BUS_FMT_ARGB8888_1X32,
>  	MEDIA_BUS_FMT_AHSV8888_1X32,
>  	MEDIA_BUS_FMT_AYUV8_1X32,
>  };
>  
> +static const struct vsp1_rwpf_codes rwpf_codes = {
> +	.codes = rwpf_mbus_codes,
> +	.num_codes = ARRAY_SIZE(rwpf_mbus_codes),
> +};
> +
> +static const u32 vspx_rpf0_mbus_codes[] = {
> +	MEDIA_BUS_FMT_SBGGR8_1X8,
> +	MEDIA_BUS_FMT_SGBRG8_1X8,
> +	MEDIA_BUS_FMT_SGRBG8_1X8,
> +	MEDIA_BUS_FMT_SRGGB8_1X8,
> +	MEDIA_BUS_FMT_SBGGR10_1X10,
> +	MEDIA_BUS_FMT_SGBRG10_1X10,
> +	MEDIA_BUS_FMT_SGRBG10_1X10,
> +	MEDIA_BUS_FMT_SRGGB10_1X10,
> +	MEDIA_BUS_FMT_SBGGR12_1X12,
> +	MEDIA_BUS_FMT_SGBRG12_1X12,
> +	MEDIA_BUS_FMT_SGRBG12_1X12,
> +	MEDIA_BUS_FMT_SRGGB12_1X12,
> +	MEDIA_BUS_FMT_SBGGR16_1X16,
> +	MEDIA_BUS_FMT_SGBRG16_1X16,
> +	MEDIA_BUS_FMT_SGRBG16_1X16,
> +	MEDIA_BUS_FMT_SRGGB16_1X16,

Same comment as in 1/6,

	MEDIA_BUS_FMT_Y8_1X8,
	MEDIA_BUS_FMT_Y10_1X10,
	MEDIA_BUS_FMT_Y12_1X12,
	MEDIA_BUS_FMT_Y16_1X16,

> +	MEDIA_BUS_FMT_METADATA_FIXED
> +};
> +
> +static const struct vsp1_rwpf_codes vspx_rpf0_codes = {
> +	.codes = vspx_rpf0_mbus_codes,
> +	.num_codes = ARRAY_SIZE(vspx_rpf0_mbus_codes),
> +};
> +
> +static const u32 vspx_rpf1_mbus_codes[] = {
> +	MEDIA_BUS_FMT_SBGGR8_1X8,
> +	MEDIA_BUS_FMT_SGBRG8_1X8,
> +	MEDIA_BUS_FMT_SGRBG8_1X8,
> +	MEDIA_BUS_FMT_SRGGB8_1X8,
> +	MEDIA_BUS_FMT_SBGGR10_1X10,
> +	MEDIA_BUS_FMT_SGBRG10_1X10,
> +	MEDIA_BUS_FMT_SGRBG10_1X10,
> +	MEDIA_BUS_FMT_SRGGB10_1X10,
> +	MEDIA_BUS_FMT_SBGGR12_1X12,
> +	MEDIA_BUS_FMT_SGBRG12_1X12,
> +	MEDIA_BUS_FMT_SGRBG12_1X12,
> +	MEDIA_BUS_FMT_SRGGB12_1X12,
> +	MEDIA_BUS_FMT_SBGGR16_1X16,
> +	MEDIA_BUS_FMT_SGBRG16_1X16,
> +	MEDIA_BUS_FMT_SGRBG16_1X16,
> +	MEDIA_BUS_FMT_SRGGB16_1X16,

Here too.

> +};
> +
> +static const struct vsp1_rwpf_codes vspx_rpf1_codes = {
> +	.codes = vspx_rpf1_mbus_codes,
> +	.num_codes = ARRAY_SIZE(vspx_rpf1_mbus_codes),
> +};
> +
> +static const struct vsp1_rwpf_codes *vsp1_rwpf_codes(struct v4l2_subdev *sd)
> +{
> +	struct vsp1_rwpf *rwpf = to_rwpf(sd);
> +	struct vsp1_entity *ent = &rwpf->entity;
> +
> +	/* Only VSPX supports reading Bayer formats. */
> +	if (!vsp1_feature(ent->vsp1, VSP1_HAS_IIF))
> +		return &rwpf_codes;
> +
> +	if (ent->type == VSP1_ENTITY_RPF) {
> +		switch (ent->index) {
> +		case 0:
> +			/* VSPX RPF0 supports ISP config data too. */
> +			return &vspx_rpf0_codes;
> +		case 1:
> +			return &vspx_rpf1_codes;
> +		default:

This should never happen. See below for a proposal on how to handle it.

> +			return &rwpf_codes;
> +		}
> +	}
> +
> +	return &rwpf_codes;

You could lower indentation with

	if (ent->type != VSP1_ENTITY_RPF)
		return &rwpf_codes;

	/* Only VSPX supports reading Bayer formats. */
	if (!vsp1_feature(ent->vsp1, VSP1_HAS_IIF))
		return &rwpf_codes;

	switch (ent->index) {
	case 0:
		/* VSPX RPF0 supports ISP config data too. */
		return &vspx_rpf0_codes;
	case 1:
		return &vspx_rpf1_codes;
	default:
		return &rwpf_codes;
	}

> +}

Would it make sense to call this function at init time, and store the
const struct vsp1_rwpf_codes pointer in the vsp1_rwpf structure ? You
could rename vsp1_rwpf_init_ctrls() to vsp1_rwpf_init() (or add a
vsp1_rwpf_init() function that calls vsp1_rwpf_init_ctrls()) and handle
the format initialization there. If the RPF index is > 1,
vsp1_rwpf_init() should return an error (callers should be fixed to
handle the error, that's a patch that can be applied on its own
already).

> +
>  /* -----------------------------------------------------------------------------
>   * V4L2 Subdevice Operations
>   */
> @@ -30,10 +114,12 @@ static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
>  				    struct v4l2_subdev_state *sd_state,
>  				    struct v4l2_subdev_mbus_code_enum *code)
>  {
> -	if (code->index >= ARRAY_SIZE(rwpf_mbus_codes))
> +	const struct vsp1_rwpf_codes *codes = vsp1_rwpf_codes(subdev);
> +
> +	if (code->index >= codes->num_codes)
>  		return -EINVAL;
>  
> -	code->code = rwpf_mbus_codes[code->index];
> +	code->code = codes->codes[code->index];
>  
>  	return 0;
>  }
> @@ -54,6 +140,7 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
>  				struct v4l2_subdev_state *sd_state,
>  				struct v4l2_subdev_format *fmt)
>  {
> +	const struct vsp1_rwpf_codes *codes = vsp1_rwpf_codes(subdev);
>  	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
>  	struct v4l2_subdev_state *state;
>  	struct v4l2_mbus_framefmt *format;
> @@ -69,11 +156,11 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
>  	}
>  
>  	/* Default to YUV if the requested format is not supported. */
> -	for (i = 0; i < ARRAY_SIZE(rwpf_mbus_codes); ++i) {
> -		if (fmt->format.code == rwpf_mbus_codes[i])
> +	for (i = 0; i < codes->num_codes; ++i) {
> +		if (fmt->format.code == codes->codes[i])
>  			break;
>  	}
> -	if (i == ARRAY_SIZE(rwpf_mbus_codes))
> +	if (i == codes->num_codes)
>  		fmt->format.code = MEDIA_BUS_FMT_AYUV8_1X32;

This isn't a valid format for the VSP-X. I would pick codes->codes[0] as
a default.

>  
>  	format = v4l2_subdev_state_get_format(state, fmt->pad);
> 

-- 
Regards,

Laurent Pinchart

