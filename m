Return-Path: <linux-media+bounces-45581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4789BC0B3D5
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 22:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B453F3AED98
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 21:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F4A280033;
	Sun, 26 Oct 2025 21:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kVLf5p/x"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0376921CC7B;
	Sun, 26 Oct 2025 21:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761512748; cv=none; b=rZiZYoAqO2cGuyEwBE5kmg3lj5qU0BWs3Zo+kW/0EDxsxUTaH1AkgjeSbuYpIKdDZH8ZCTgob/vmfMpiD5aIf7OBcSjIKbYqiOzkgBfEf0C9ZQNdgEGLQ14fUc/QLDBT3/w/mFEfMy6TPJPYGZPLcCNOZxbBNcVwCWds2iuIBBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761512748; c=relaxed/simple;
	bh=xTj7C6WHH0BI7SqvDLyoTT6OhQ/FzKwl1zNN0hIXilQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJA8QwuaABfq3WVw1fAQNi7r6yHlS/KT6BMgaE9VYY5uGQDLNBdPRdaEz7c++fHYCx6mPoDb4pB7nsYmXKOSJgz+RyjePUdTYINLxu61JWDBflmTtMWKyqREsfKv3FpZOEBRmD0KUSI3LbCVB7Ro4AaGSGMWUrVS1ZqF7gT1MH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kVLf5p/x; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BA7FC21B1;
	Sun, 26 Oct 2025 22:03:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761512638;
	bh=xTj7C6WHH0BI7SqvDLyoTT6OhQ/FzKwl1zNN0hIXilQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kVLf5p/xQFj9mU76DCtLwHZIGUUY97M91qW3pyyHielFFD1/woCia5P227FV+CFCt
	 dmwAMdKjaYFx5WRqCuEWgGSUzssbRePFV2QF94sFM0EhelsueX9BEDGYiHfGYZG0VY
	 He7B8z5iPAEcPA9HWciuu/0Ry3ltkfSr9g4AeWhQ=
Date: Sun, 26 Oct 2025 23:05:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: mchehab@kernel.org, rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Frank.Li@nxp.com
Subject: Re: [PATCH v5 2/4] media: imx-mipi-csis: Move redundant debug print
 in probe
Message-ID: <20251026210530.GD1025@pendragon.ideasonboard.com>
References: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
 <20251022102228.275627-3-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251022102228.275627-3-isaac.scott@ideasonboard.com>

Hi Isaac,

Thank you for the patch.

On Wed, Oct 22, 2025 at 11:22:26AM +0100, Isaac Scott wrote:
> The number of data lanes is already printed as part of
> mipi_csis_async_register(), making the first part of this print
> redundant. Remove the redundant print, and move the debug print for
> clock frequency to mipi_csis_parse_dt().

There's a bit of room for improvement in the commit message. If you read
it in isolation, without looking at the code change first, you'll see
things like "this print" being quite unclear. No need to change it, just
keep it in mind for your next patch series :-)

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index d5de7854f579..7c2a679dca2e 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1481,6 +1481,7 @@ static int mipi_csis_parse_dt(struct mipi_csis_device *csis)
>  	struct device_node *node = csis->dev->of_node;
>  
>  	of_property_read_u32(node, "clock-frequency", &csis->clk_frequency);
> +	dev_dbg(csis->dev, "clock frequency: %u\n", csis->clk_frequency);
>  
>  	csis->num_channels = 1;
>  	of_property_read_u32(node, "fsl,num-channels", &csis->num_channels);
> @@ -1566,9 +1567,6 @@ static int mipi_csis_probe(struct platform_device *pdev)
>  			goto err_unregister_all;
>  	}
>  
> -	dev_info(dev, "lanes: %d, freq: %u\n",
> -		 csis->bus.num_data_lanes, csis->clk_frequency);
> -
>  	return 0;
>  
>  err_unregister_all:

-- 
Regards,

Laurent Pinchart

