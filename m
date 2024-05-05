Return-Path: <linux-media+bounces-10806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D3A8BC3BF
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 22:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D63FF1C210A8
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 20:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BAE4757E1;
	Sun,  5 May 2024 20:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Lz8Wov8G"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3CE3A28D;
	Sun,  5 May 2024 20:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714942367; cv=none; b=MSfQg/iRpwxrqNH9+J9Z8vLTbmrIV4gNyhc0bGl2eLHKLk/WJZTeoSiVizYi9I4pXTNG5/048Z8/dPoo2TR0+CnkL/zjghMpf+BoOJ2rzR9yrhYuvXZfW1ds9Supor0NUusjvPGi/fGuv0lcHod2d/DR++Iyxf+TvqU5PwIbzxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714942367; c=relaxed/simple;
	bh=9oz/2y9gIgCa2ykn5AsMBV9dcu51+BtmhS1tFnikHkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/MweUBRSgw+L9DVHPm8Key+DTfIQHlIPJh85mYDASYc0Jwe5TRbvLkGegbAd/dL8OeGKaseuUHOPY8aUYWjsUfjmgNibGAZPXopkTO8sVvn4n3NU52M7RfVpRApEzk1uJ/8vt8IDMqtvUh7FoHHr/SiTlEYni5mzHP5z6T1GuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Lz8Wov8G; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93C4F63B;
	Sun,  5 May 2024 22:52:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714942362;
	bh=9oz/2y9gIgCa2ykn5AsMBV9dcu51+BtmhS1tFnikHkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lz8Wov8Gsv0UcfQl8DC1Pv4mJSxKTGZm9FgtJylgba5XSig/cIbniNG6BSE8iNmcW
	 c0zRlIxvvbHnxj3ikem7Ydbiru4+aWTWql4bpE4EpnSTr3pJl0mbaNNGq+N/zCPH6x
	 lpGHbDdjRN+MywwMnV2jSWc8tz5+ZzLXXX/Tl4ts=
Date: Sun, 5 May 2024 23:52:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 02/11] media: rcar-csi2: Disable runtime_pm in probe error
Message-ID: <20240505205235.GA23227@pendragon.ideasonboard.com>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
 <20240503155127.105235-3-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240503155127.105235-3-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Fri, May 03, 2024 at 05:51:17PM +0200, Jacopo Mondi wrote:
> Disable pm_runtime in the probe() function error path.
> 
> Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 582d5e35db0e..249e58c77176 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1914,12 +1914,14 @@ static int rcsi2_probe(struct platform_device *pdev)
>  
>  	ret = v4l2_async_register_subdev(&priv->subdev);
>  	if (ret < 0)
> -		goto error_async;
> +		goto error_pm_runtime;
>  
>  	dev_info(priv->dev, "%d lanes found\n", priv->lanes);
>  
>  	return 0;
>  
> +error_pm_runtime:
> +	pm_runtime_disable(&pdev->dev);
>  error_async:
>  	v4l2_async_nf_unregister(&priv->notifier);
>  	v4l2_async_nf_cleanup(&priv->notifier);

-- 
Regards,

Laurent Pinchart

