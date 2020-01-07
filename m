Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9DEA132979
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 16:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727968AbgAGPBY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 10:01:24 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:51407 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727559AbgAGPBY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Jan 2020 10:01:24 -0500
Received: from [IPv6:2001:420:44c1:2577:cd88:93ae:ae73:3d6c]
 ([IPv6:2001:420:44c1:2577:cd88:93ae:ae73:3d6c])
        by smtp-cloud7.xs4all.net with ESMTPA
        id oqM8iLQnaN9dwoqMCiVvtj; Tue, 07 Jan 2020 16:01:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578409281; bh=dlauqvpQGYg8gIzE7vt8zEOQtKQRNLpz0TQmKxid07E=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=v8NiblhlR4I4zf8BhwkynPxs+nkGAGPktfWgiHivQwkx7TB+rzag5U979DVi4ZXCe
         1yaoGIh3JzsfAv0i8+c7U9BjMFDmwuSQuudtjjDjyMI3XQyl0xc/0J/79sJ+MmjrXH
         kUUO3XY+/WTVBzXDfEYkZAxj7VmqmlcaFEAiIglPOlNkPhepLHJRU8GZ7Ysxm7orSU
         HaZB0hjCKJyf7t8Bo/X7K7a5Lbj0ZYVSFUSZ3mTN+umHbNG0Sofz8QnKFDR8usZYXk
         7+J50Zx7Rsgfj+AWbOIQmweCO/pGvJacXvUtYg1L+Wn/6+4Z+J0zOVf//pIeczWBKl
         IPSWSUB5Wtnig==
Subject: Re: [PATCH v2 2/4] media: cedrus: hevc: Add support for scaling
 matrix
To:     Jernej Skrabec <jernej.skrabec@siol.net>, mchehab@kernel.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com
Cc:     gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
References: <20191213160428.54303-1-jernej.skrabec@siol.net>
 <20191213160428.54303-3-jernej.skrabec@siol.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4ac91ed5-a220-6a04-b1da-de27a306f8f2@xs4all.nl>
Date:   Tue, 7 Jan 2020 16:01:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191213160428.54303-3-jernej.skrabec@siol.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJY5ZdhhQ3Y8+/P4/PuY0Rn2kVBZ9dF7xWsX+alTuLCOoBo1MAlmbGpH0BJQwiEfcX6mzWQWrw43Fjb6azKuPYOyiu4d7kpHVAdU3P3+owyW7rCWaFj9
 Yo5I5K9KdiH4FpoxJ+LNc/gaGo0Vrm1HKcYty/e1/OWe2fLePr0Yg4he6atVOFXLCuYNa0BQXJLxW7mcgahVHXT2/kH8YuSLKSkukPeJBGY0p3w7saI+EqQL
 RHN6+VAvLPX977K6NMUM0h2VFDoP2P41iZ+3OdacAJwmhtnaf2//gGMpgFqPGODlM4GKippmALkM2OU+3GVbmfHTWHKHgDNZvlITCZSJidsoi/jM/9Uavk9b
 XizEZJO1Z2s4FRuEgwrNEu7oHOZLO7QIyguPGRmyp30KQK9eGABAVwfBgsskrnRAWyjOLP0bZeh8kzgQiJqRsXPpo9+M7xTSVEIb8wy+VC9XiYiDu1xp6UUL
 NrpAlDKzgUlelznxL9ypi53wqkEnFOsTSHtkMvPzz1sb8dRBFe2YYZt3Wr5BwfskLOaZfy2ORwNKevMohp7mdqwLAxRI1QvTA+1vw52yZtiAef3nTOvU380S
 3SYh+e9/DzAlmFhzm9iyZ090/WzsYi+xPyzq0CksIxpm6g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/13/19 5:04 PM, Jernej Skrabec wrote:
> HEVC frames may use scaling list feature. Add support for it.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c   |  7 ++
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |  2 +
>  .../staging/media/sunxi/cedrus/cedrus_h265.c  | 70 ++++++++++++++++++-
>  .../staging/media/sunxi/cedrus/cedrus_regs.h  |  2 +
>  5 files changed, 81 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
> index c6ddd46eff82..bf68bc6b20c8 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -116,6 +116,13 @@ static const struct cedrus_control cedrus_controls[] = {
>  		.codec		= CEDRUS_CODEC_H265,
>  		.required	= true,
>  	},
> +	{
> +		.cfg = {
> +			.id	= V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX,
> +		},
> +		.codec		= CEDRUS_CODEC_H265,
> +		.required	= true,

Should this be true? This means that existing applications are now
suddenly required to always pass the scaling matrix for every buffer.

Especially since the commit log says: 'HEVC frames *may* use scaling list
feature', indicating that this is an optional feature.

Regards,

	Hans

> +	},
>  	{
>  		.cfg = {
>  			.id	= V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE,
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
> index 96765555ab8a..d945f4f0ff2d 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -73,6 +73,7 @@ struct cedrus_h265_run {
>  	const struct v4l2_ctrl_hevc_sps			*sps;
>  	const struct v4l2_ctrl_hevc_pps			*pps;
>  	const struct v4l2_ctrl_hevc_slice_params	*slice_params;
> +	const struct v4l2_ctrl_hevc_scaling_matrix	*scaling_matrix;
>  };
>  
>  struct cedrus_run {
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> index 4a2fc33a1d79..327ed6c264dc 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> @@ -66,6 +66,8 @@ void cedrus_device_run(void *priv)
>  			V4L2_CID_MPEG_VIDEO_HEVC_PPS);
>  		run.h265.slice_params = cedrus_find_control_data(ctx,
>  			V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS);
> +		run.h265.scaling_matrix = cedrus_find_control_data(ctx,
> +			V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX);
>  		break;
>  
>  	default:
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> index 6945dc74e1d7..888bfd5ca224 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -220,6 +220,69 @@ static void cedrus_h265_pred_weight_write(struct cedrus_dev *dev,
>  	}
>  }
>  
> +static void cedrus_h265_write_scaling_list(struct cedrus_ctx *ctx,
> +					   struct cedrus_run *run)
> +{
> +	const struct v4l2_ctrl_hevc_scaling_matrix *scaling;
> +	struct cedrus_dev *dev = ctx->dev;
> +	u32 i, j, k, val;
> +
> +	scaling = run->h265.scaling_matrix;
> +
> +	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_DC_COEF0,
> +		     (scaling->scaling_list_dc_coef_32x32[1] << 24) |
> +		     (scaling->scaling_list_dc_coef_32x32[0] << 16) |
> +		     (scaling->scaling_list_dc_coef_16x16[1] << 8) |
> +		     (scaling->scaling_list_dc_coef_16x16[0] << 0));
> +
> +	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_DC_COEF1,
> +		     (scaling->scaling_list_dc_coef_16x16[5] << 24) |
> +		     (scaling->scaling_list_dc_coef_16x16[4] << 16) |
> +		     (scaling->scaling_list_dc_coef_16x16[3] << 8) |
> +		     (scaling->scaling_list_dc_coef_16x16[2] << 0));
> +
> +	cedrus_h265_sram_write_offset(dev, VE_DEC_H265_SRAM_OFFSET_SCALING_LISTS);
> +
> +	for (i = 0; i < 6; i++)
> +		for (j = 0; j < 8; j++)
> +			for (k = 0; k < 8; k += 4) {
> +				val = ((u32)scaling->scaling_list_8x8[i][j + (k + 3) * 8] << 24) |
> +				      ((u32)scaling->scaling_list_8x8[i][j + (k + 2) * 8] << 16) |
> +				      ((u32)scaling->scaling_list_8x8[i][j + (k + 1) * 8] << 8) |
> +				      scaling->scaling_list_8x8[i][j + k * 8];
> +				cedrus_write(dev, VE_DEC_H265_SRAM_DATA, val);
> +			}
> +
> +	for (i = 0; i < 2; i++)
> +		for (j = 0; j < 8; j++)
> +			for (k = 0; k < 8; k += 4) {
> +				val = ((u32)scaling->scaling_list_32x32[i][j + (k + 3) * 8] << 24) |
> +				      ((u32)scaling->scaling_list_32x32[i][j + (k + 2) * 8] << 16) |
> +				      ((u32)scaling->scaling_list_32x32[i][j + (k + 1) * 8] << 8) |
> +				      scaling->scaling_list_32x32[i][j + k * 8];
> +				cedrus_write(dev, VE_DEC_H265_SRAM_DATA, val);
> +			}
> +
> +	for (i = 0; i < 6; i++)
> +		for (j = 0; j < 8; j++)
> +			for (k = 0; k < 8; k += 4) {
> +				val = ((u32)scaling->scaling_list_16x16[i][j + (k + 3) * 8] << 24) |
> +				      ((u32)scaling->scaling_list_16x16[i][j + (k + 2) * 8] << 16) |
> +				      ((u32)scaling->scaling_list_16x16[i][j + (k + 1) * 8] << 8) |
> +				      scaling->scaling_list_16x16[i][j + k * 8];
> +				cedrus_write(dev, VE_DEC_H265_SRAM_DATA, val);
> +			}
> +
> +	for (i = 0; i < 6; i++)
> +		for (j = 0; j < 4; j++) {
> +			val = ((u32)scaling->scaling_list_4x4[i][j + 12] << 24) |
> +			      ((u32)scaling->scaling_list_4x4[i][j + 8] << 16) |
> +			      ((u32)scaling->scaling_list_4x4[i][j + 4] << 8) |
> +			      scaling->scaling_list_4x4[i][j];
> +			cedrus_write(dev, VE_DEC_H265_SRAM_DATA, val);
> +		}
> +}
> +
>  static void cedrus_h265_setup(struct cedrus_ctx *ctx,
>  			      struct cedrus_run *run)
>  {
> @@ -499,7 +562,12 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
>  
>  	/* Scaling list. */
>  
> -	reg = VE_DEC_H265_SCALING_LIST_CTRL0_DEFAULT;
> +	if (sps->flags & V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED) {
> +		cedrus_h265_write_scaling_list(ctx, run);
> +		reg = VE_DEC_H265_SCALING_LIST_CTRL0_FLAG_ENABLED;
> +	} else {
> +		reg = VE_DEC_H265_SCALING_LIST_CTRL0_DEFAULT;
> +	}
>  	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
>  
>  	/* Neightbor information address. */
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> index 7beb03d3bb39..0d9449fe2b28 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> @@ -492,6 +492,8 @@
>  #define VE_DEC_H265_ENTRY_POINT_OFFSET_ADDR	(VE_ENGINE_DEC_H265 + 0x64)
>  #define VE_DEC_H265_TILE_START_CTB		(VE_ENGINE_DEC_H265 + 0x68)
>  #define VE_DEC_H265_TILE_END_CTB		(VE_ENGINE_DEC_H265 + 0x6c)
> +#define VE_DEC_H265_SCALING_LIST_DC_COEF0	(VE_ENGINE_DEC_H265 + 0x78)
> +#define VE_DEC_H265_SCALING_LIST_DC_COEF1	(VE_ENGINE_DEC_H265 + 0x7c)
>  
>  #define VE_DEC_H265_LOW_ADDR			(VE_ENGINE_DEC_H265 + 0x80)
>  
> 

