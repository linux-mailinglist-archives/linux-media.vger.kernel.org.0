Return-Path: <linux-media+bounces-28591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA95A6C586
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 22:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DDB23B3B96
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 21:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C96232367;
	Fri, 21 Mar 2025 21:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GYP6fsDD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F2D231C9F;
	Fri, 21 Mar 2025 21:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742594222; cv=none; b=VSojLZpcC7JcvIyP+rxGOaHunUwkIeMdj9KVONOsPwOPyDxpyr9o+ulSqQEycPCl2m3JOArMo4NbUv7HlkY0dBmETmcH2dMsC/FSB66LGIiMeuCrjc4dtjFqdLc9JMbJyweOCmlOTXhohRfyiZSzbHd1175olfp8z5APWb3JENg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742594222; c=relaxed/simple;
	bh=XAGvWynXDWibkIhhVTdU5IuUHx6RupfoFAXHu1BGyqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B85+SyGYsHqZEaYoIjH5YlE1Pmmr0oOqbjT7MtxBUezWYzj1KnWDStdsmdubZXxkfIQLeX3sJ3uREz2/Jf0vJlU1KAMhzFkLxygL69Uqw+vPGKb+VuincBZITvwnuaT0R+RKxDOqjYMvzpHjYfoh7jFcD/wH319q/ciGz3VxUr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GYP6fsDD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [194.75.195.10])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B0CB346;
	Fri, 21 Mar 2025 22:55:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742594113;
	bh=XAGvWynXDWibkIhhVTdU5IuUHx6RupfoFAXHu1BGyqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GYP6fsDDN5istxHehr7hViEXFogC6ddM1avVzyy71EUe0MI93LhKbSmAJXWc4suOU
	 CDFKFHmLauYXh9bxWpNyeks+aSeWceXA3K/t/+i//ev6uDVcnBPADJXZeXSfuDJTdj
	 POntF3JRH2F+9CPXEzwzTLZkuki+vqvr5y+U3Q1Q=
Date: Fri, 21 Mar 2025 23:56:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v6 7/7] media: vsp1: pipe: Add RAW Bayer formats mapping
Message-ID: <20250321215634.GB11255@pendragon.ideasonboard.com>
References: <20250321-v4h-iif-v6-0-361e9043026a@ideasonboard.com>
 <20250321-v4h-iif-v6-7-361e9043026a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321-v4h-iif-v6-7-361e9043026a@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Fri, Mar 21, 2025 at 04:45:39PM +0100, Jacopo Mondi wrote:
> Add formats definition for RAW Bayer formats in vsp1_pipe.c.
> 
> 8-bits RAW Bayer pixel formats map on VSP format RGB332.

s/map on/map to/

> 10, 12 and 16 bits RAW Bayer pixel formats map on RGB565 insted.
> 
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
> v3->v4:
> - Fix SWAP bits for RAW 10, 12 and 16
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_pipe.c | 72 ++++++++++++++++++++++++-
>  1 file changed, 71 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> index 8e9be3ec1b4d..a51061738edc 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> @@ -30,10 +30,80 @@
>   */
>  
>  static const struct vsp1_format_info vsp1_video_formats[] = {
> -	{ V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
> +	/* Raw Bayer 8-bit: Maps on RGB332 */
> +	{ V4L2_PIX_FMT_SBGGR8, MEDIA_BUS_FMT_Y8_1X8,
> +	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 8, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SGBRG8, MEDIA_BUS_FMT_Y8_1X8,
> +	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 8, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SGRBG8, MEDIA_BUS_FMT_Y8_1X8,
> +	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 8, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SRGGB8, MEDIA_BUS_FMT_Y8_1X8,
>  	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
>  	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
>  	  1, { 8, 0, 0 }, false, false, 1, 1, false },

Similarly to the media bus codes, could we have a single entry, using
V4L2_PIX_FMT_GREY ? Same below with V4L2_PIX_FMT_Y10, V4L2_PIX_FMT_Y12
and V4L2_PIX_FMT_Y16.

This would still duplicate entries, as V4L2_PIX_FMT_Y1[026] are
essentially treated the same, and they are identical to
V4L2_PIX_FMT_RGB565. We could ask the ISP driver to use
V4L2_PIX_FMT_RGB565 (and V4L2_PIX_FMT_RGB332 for 8-bit raw) when
configuring the VSPX, but that's a bit of a hack.

Another option would be to handle the translation in
vsp1_vspx_rwpf_set_subdev_fmt(). I would still in that case only expect
the V4L2_PIX_FMT_GREY and V4L2_PIX_FMT_Y* 4CCs from the ISP driver. This
patch could then be dropped.

What's your preference ?

> +
> +	/* Raw Bayer 10/12/16-bit: Maps on RGB565 */
> +	{ V4L2_PIX_FMT_SBGGR10, MEDIA_BUS_FMT_Y10_1X10,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS,
> +	  1, { 10, 0, 0 }, false, false, 1, 1, false },

The bpp values are used to calculate memory offsets. Unless I'm
mistaken, you should use 16 here, not 10.

> +	{ V4L2_PIX_FMT_SGBRG10, MEDIA_BUS_FMT_Y10_1X10,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS,
> +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SGRBG10, MEDIA_BUS_FMT_Y10_1X10,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS,
> +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SRGGB10, MEDIA_BUS_FMT_Y10_1X10,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS,
> +	  1, { 10, 0, 0 }, false, false, 1, 1, false },
> +
> +	{ V4L2_PIX_FMT_SBGGR12, MEDIA_BUS_FMT_Y12_1X12,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS,
> +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SGBRG12, MEDIA_BUS_FMT_Y12_1X12,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS,
> +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SGRBG12, MEDIA_BUS_FMT_Y12_1X12,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS,
> +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SRGGB12, MEDIA_BUS_FMT_Y12_1X12,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS,
> +	  1, { 12, 0, 0 }, false, false, 1, 1, false },
> +
> +	{ V4L2_PIX_FMT_SBGGR16, MEDIA_BUS_FMT_Y16_1X16,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS,
> +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SGBRG16, MEDIA_BUS_FMT_Y16_1X16,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS,
> +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SGRBG16, MEDIA_BUS_FMT_Y16_1X16,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS,
> +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_SRGGB16, MEDIA_BUS_FMT_Y16_1X16,
> +	  VI6_FMT_RGB_565, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS,
> +	  1, { 16, 0, 0 }, false, false, 1, 1, false },
> +
> +	{ V4L2_PIX_FMT_RGB332, MEDIA_BUS_FMT_ARGB8888_1X32,
> +	  VI6_FMT_RGB_332, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
> +	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> +	  1, { 10, 0, 0 }, false, false, 1, 1, false },

This doesn't seem right, the patch is changing the V4L2_PIX_FMT_RGB332.

>  	{ V4L2_PIX_FMT_ARGB444, MEDIA_BUS_FMT_ARGB8888_1X32,
>  	  VI6_FMT_ARGB_4444, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
>  	  VI6_RPF_DSWAP_P_WDS,

-- 
Regards,

Laurent Pinchart

