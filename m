Return-Path: <linux-media+bounces-45600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D64C0B974
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 02:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 118233B74C9
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 01:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C9D271A9D;
	Mon, 27 Oct 2025 01:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cSr4M6GX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268192459C5;
	Mon, 27 Oct 2025 01:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761527985; cv=none; b=Ty2/PCT4qtzHc+npmyjuL+mvF7cA/28L72389I0UHNMIyoFlc7hjatIOekF5rfGQ+s9lcgtDmt3HvZPlNvW1zmn6cW5MhltWicqsJ+TkLyPR2Qc2j4fEkre00J4lAtoAoWGRf59bxarg65IkmyYVA6+hCLGvR0ya+UwACn3CSt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761527985; c=relaxed/simple;
	bh=FS+KlOZTayfUweHo35RYfizlXiiTS/dCMqOAye4j6/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJGPq10OVDgKqpc+hSiarMZn1QFFdfe8tot/58wSCenIcl109MdccldGbr0SlYelsd06EMPlomFBNkMG/dHy1qXDzHSV3EsyD/bYp/CUvh+esW8MIkv41bGcEKyGsgN82cx1MCDxWxi0qcY7CfLZXie/wj2h8n3QuWla1Mn/amc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cSr4M6GX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8594D14A6;
	Mon, 27 Oct 2025 02:17:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761527873;
	bh=FS+KlOZTayfUweHo35RYfizlXiiTS/dCMqOAye4j6/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cSr4M6GXYmVqXJ9DNbAIsvskO1G8IzD4w5TqPONHF5q/NBWj+wASYuTLdhVHb38C2
	 7YKeykbbg0p9Y3WWXgQjfVYQejOJXz1HsTyGjxy1DTjXtadyc/uwMysXRqBDDPCp/p
	 1q1pdqj5EsuYsjtJ1H0vlJ1rVgpwGLaEfTbbQTHY=
Date: Mon, 27 Oct 2025 03:19:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 02/31] media: v4l2-common: Add helper function
 v4l_get_required_align_by_bpp()
Message-ID: <20251027011927.GS13023@pendragon.ideasonboard.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-2-c9286fbb34b9@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250821-95_cam-v3-2-c9286fbb34b9@nxp.com>

On Thu, Aug 21, 2025 at 04:15:37PM -0400, Frank Li wrote:
> Add helper v4l_get_required_align_by_bpp() to help get width alignment
> requirement. Basic replace below logic and enhance to any 2^[0..31] in
> drivers/media/platform/nxp/imx-mipi-csis.c
> 
> mipi_csis_set_fmt(
> {
>         ...
> 
>         switch (csis_fmt->width % 8) {
>         case 0:
>                 align = 0;
>                 break;
>         case 4:
>                 align = 1;
>                 break;
>         case 2:
>         case 6:
>                 align = 2;
>                 break;
>         default:
>                 /* 1, 3, 5, 7 */
>                 align = 3;
>                 break;
>         }
> 	...
> }
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> The same patch will be see at https://lore.kernel.org/imx/20250729-imx8qxp_pcam-v4-2-4dfca4ed2f87@nxp.com/
> dw csi2 patch also this
> ---
>  include/media/v4l2-common.h | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 39dd0c78d70f7b935c2e10f9767646d2cedd3079..0a9da5e8daaddf26903d9ff4bed08b283dcd38b2 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -704,4 +704,34 @@ static inline bool v4l2_is_quant_valid(__u8 quantization)
>  	       quantization == V4L2_QUANTIZATION_LIM_RANGE;
>  }
>  
> +/**
> + * v4l_get_required_align_by_bpp - get align requirement for
> + *	v4l_bound_align_image(). (bpp * width) % (1 << align) have to be 0.
> + *	given number bpp, get width's alignment requirement. For example,
> + *	if align is 3, means require bpp * width must be multiples of 8.
> + *	    bpp     return  width's requirememnt
> + *	    0       0       none
> + *	    1       3       8 (need 3 zero bits)
> + *	    2       2       4
> + *	    3       3       8
> + *	    4       1       2
> + *	    5       3       8
> + *	    6       2       4
> + *	    7       3       8

This is supposed to be a brief one-line description. The rest of the
documentation goes after the argument.

Also, have checked the formatting of the generated documentation ?

> + * @bpp: input bpp

I have no idea if this is a bits per pixel or bytes per pixel value. I'm
actually not sure what the function is even supposed to do. It feels
it's really a ad-hoc helper, I would like to see it being used in
multiple drivers to see if it makes sense.

> + * @align: expected alignment, 2^(align).
> + *
> + * return: required alignment.
> + */
> +static inline u32 v4l_get_required_align_by_bpp(u32 bpp, u32 align)
> +{
> +	int pos;
> +
> +	if (bpp == 0)
> +		return 0;
> +
> +	pos = ffs(bpp) - 1;
> +	return pos > align ? 0 : align - pos;
> +}
> +
>  #endif /* V4L2_COMMON_H_ */
> 

-- 
Regards,

Laurent Pinchart

