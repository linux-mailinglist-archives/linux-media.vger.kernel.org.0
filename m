Return-Path: <linux-media+bounces-10809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F31E28BC3DA
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 23:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 308601C21225
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 21:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E647603A;
	Sun,  5 May 2024 21:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RX6ER8i8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975D16CDD2;
	Sun,  5 May 2024 21:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714942878; cv=none; b=a+M70TbPX3VYqn3IayUe46EuE5LNi85dhWyqSoe/t+GgyZ2TD0Yxo+cRJD+DUcCPvb6Bc9+Z3mJCK+/Xe3KR9fCDUmQpNyggw7f4AQJf7RF6ymFBOw+wh/T5Xgs8tmXMKziIdrOvj100REHINXs4YkdJHWGsnXGdH1v+IAaU7I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714942878; c=relaxed/simple;
	bh=NfxBxZKdDPCUT+W5IjXVZJweW3C07oHa+tdX9TFN33U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2I2dK5c+qP29L5N7rbRjARlt/3kab0qqbxFGV/C54tM97PyyOEFAZS/7W4rd4/MaUxzdJgF5Ylym2Pfdk0Syuy4jURA0Ic/7ffhcy2hPlH73k+bNq2PtflzDzFTCVO5OZXA+O0U85vnj8pgAxI19VfbqsOMKH9OB2mge2Sq6iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RX6ER8i8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 514AF63B;
	Sun,  5 May 2024 23:01:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714942873;
	bh=NfxBxZKdDPCUT+W5IjXVZJweW3C07oHa+tdX9TFN33U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RX6ER8i8ZB+O5ce9yi+LYJiIaLdRsI8bB49l+Y6i7Ge/oSCcxPi34X+3tB+I4YOGA
	 2WTyNLVn49vwHI7RvanV9CXcfR2KnCejo/LCwIS84hSUSmS99rzx8Dap+tbBnYzTJX
	 kMXE+JjAvMi4CfEEnzU5xiokujrlGkb5WDUdnWoE=
Date: Mon, 6 May 2024 00:01:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 05/11] media: adv748x-csi2: Initialize subdev format
Message-ID: <20240505210106.GC23227@pendragon.ideasonboard.com>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
 <20240503155127.105235-6-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240503155127.105235-6-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Fri, May 03, 2024 at 05:51:20PM +0200, Jacopo Mondi wrote:
> Initialize the subdevice format to the default 1280x720 YUV 4:2:2.
> 
> The subdevice format is propagated from the frontend (HDMI or AFE) to
> the CSI-2 tx, but it was not initialized during the CSI-2 tx
> registration.
> 
> Use YUYV8 1280x720 as default format as it's supported by both TXes in
> all supported configurations (1, 2 or 4 CSI-2 lanes).
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index 5b265b722394..9da7f6742a2b 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -14,6 +14,13 @@
>  
>  #include "adv748x.h"
>  
> +static const struct v4l2_mbus_framefmt adv748x_csi2_default_fmt = {
> +	.width = 1280,
> +	.height = 720,
> +	.code = MEDIA_BUS_FMT_YUYV8_1X16,
> +	.field = V4L2_FIELD_NONE,
> +};
> +
>  int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx, unsigned int vc)
>  {
>  	return tx_write(tx, ADV748X_CSI_VC_REF, vc << ADV748X_CSI_VC_REF_SHIFT);
> @@ -311,6 +318,8 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
>  	if (ret)
>  		return ret;
>  
> +	tx->format = adv748x_csi2_default_fmt;
> +

This looks OK, so

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

But patch 08/11 removes the tx->format field, so I think you could as
well drop this patch.

>  	ret = v4l2_async_subdev_endpoint_add(&tx->sd,
>  					     of_fwnode_handle(state->endpoints[tx->port]));
>  	if (ret)

-- 
Regards,

Laurent Pinchart

