Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B35A34C31D
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 07:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbhC2FlD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 01:41:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38184 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhC2Fkt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 01:40:49 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FA7A31A;
        Mon, 29 Mar 2021 07:40:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616996448;
        bh=M+O4pVog9pyrgXcwvV+quwHz6zhH4X1o4rwZx7fhm54=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lMeQSparGayQ3zn55aBltWn7u4oChcG8QvlYYOPXf/4kRgI9ax/xMwVmZ5EEwsW/8
         Q/lJVz66UEBWH+KOn7/fKUhinkZPPFxXoIayJBaU0RtEr4meCJpOTu712lbVtx380b
         DEVdmXfNB5WFDsmA6MpifMWxTbYcDoIDs2EMsgcc=
Date:   Mon, 29 Mar 2021 08:40:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sebastian Fricke <sebastian.fricke@posteo.net>
Cc:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, heiko@sntech.de
Subject: Re: [PATCH v2] media: rkisp1: Increase ISP input resolution limit
Message-ID: <YGFoNJ1erlKroQGB@pendragon.ideasonboard.com>
References: <20210326062329.53103-1-sebastian.fricke@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210326062329.53103-1-sebastian.fricke@posteo.net>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sebastian,

Thank you for the patch.

On Fri, Mar 26, 2021 at 07:23:30AM +0100, Sebastian Fricke wrote:
> The current implementation limits the maximum sink pad resolution to
> 4032x3024, which is mentioned by the Rockchip TRM as the maximum size
> to handle black level calibration. But the ISP can actually set it's

s/calibration/correction/
s/it's/its/

> sink pad format to a size of 4416x3312.
> Allow higher sink pad resolutions in order to allow a bigger range of
> sensor modes to be used with the RkISP1.
> Apply the previous limit to the sink pad crop instead of the format to
> satisfy the requirement of the ISP.
> 
> Signed-off-by: Sebastian Fricke <sebastian.fricke@posteo.net>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes since v1:
> - Improve the name of the new macro -> s/*_PROCESSING/*_CROP/
> - Add a descriptive comment to explain why we need those 2 new macros
> - Combine the separated 2 patches into a single one as patch 2 was
>   depending on patch 1, which would have introduced a bisection breakage
>   (Thanks to Laurent Pinchart)
> 
> This patch was tested with a NanoPC-T4 and a OV13850, which provides a
> resolution of 4224x3136.
> ---
>  .../platform/rockchip/rkisp1/rkisp1-common.h   | 18 +++++++++++++-----
>  .../platform/rockchip/rkisp1/rkisp1-isp.c      |  8 ++++++--
>  2 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 038c303a8aed..553a4b12becf 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -29,11 +29,19 @@
>  #define RKISP1_ISP_SD_SRC BIT(0)
>  #define RKISP1_ISP_SD_SINK BIT(1)
>  
> -/* min and max values for the widths and heights of the entities */
> -#define RKISP1_ISP_MAX_WIDTH		4032
> -#define RKISP1_ISP_MAX_HEIGHT		3024
> -#define RKISP1_ISP_MIN_WIDTH		32
> -#define RKISP1_ISP_MIN_HEIGHT		32
> +/*
> + * min and max values for the widths and heights of the entities
> + * The ISP device accepts input resolutions of up to 4416x3312, but
> + * it can only process resolutions of 4032x3024 internally.
> + * Therefore the crop resolution is limited to 4032x3024, the
> + * sink pad crop is applied automatically when the format is set.
> + */
> +#define RKISP1_ISP_MAX_WIDTH			4416
> +#define RKISP1_ISP_MAX_HEIGHT			3312
> +#define RKISP1_ISP_MAX_WIDTH_CROP		4032
> +#define RKISP1_ISP_MAX_HEIGHT_CROP		3024
> +#define RKISP1_ISP_MIN_WIDTH			32
> +#define RKISP1_ISP_MIN_HEIGHT			32
>  
>  #define RKISP1_RSZ_MP_SRC_MAX_WIDTH		4416
>  #define RKISP1_RSZ_MP_SRC_MAX_HEIGHT		3312
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 2e5b57e3aedc..a8274e84a64b 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -758,9 +758,13 @@ static void rkisp1_isp_set_sink_crop(struct rkisp1_isp *isp,
>  					  which);
>  
>  	sink_crop->left = ALIGN(r->left, 2);
> -	sink_crop->width = ALIGN(r->width, 2);
> +	sink_crop->width = clamp_t(u32, ALIGN(r->width, 2),
> +				   RKISP1_ISP_MIN_WIDTH,
> +				   RKISP1_ISP_MAX_WIDTH_CROP);
>  	sink_crop->top = r->top;
> -	sink_crop->height = r->height;
> +	sink_crop->height = clamp_t(u32, r->height,
> +				    RKISP1_ISP_MIN_HEIGHT,
> +				    RKISP1_ISP_MAX_HEIGHT_CROP);
>  	rkisp1_sd_adjust_crop(sink_crop, sink_fmt);
>  
>  	*r = *sink_crop;

-- 
Regards,

Laurent Pinchart
