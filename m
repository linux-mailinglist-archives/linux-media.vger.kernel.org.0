Return-Path: <linux-media+bounces-10807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2CE8BC3C1
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 22:53:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 119811F220C0
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 20:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559DF757EA;
	Sun,  5 May 2024 20:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ewabBWTn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9AB3A28D;
	Sun,  5 May 2024 20:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714942420; cv=none; b=UMoHpgXceJTGZUm/FC1xOBY4gaYKOIY2QEYK/2dR9EhElI/TBm4Ivd1PvbQkpHRDwZrzemTLIvMFZjVBLkNHc1P67NhnvzJEuy6d2m1qu1ZRnmuFPlIRfI5imxzfoou3Tzo7BBYuG93y72W+n8J1/C0XtGGvEo1HQJ4q/bLBzjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714942420; c=relaxed/simple;
	bh=WLr36l3u3CQ4wGcILmT3LqcV2B263RaK/90EfetVXh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kw/gSUz3dtYbUMvhWUezIWHxbBxowXofTGpN0mlDQ7i28pTyg7OJ89zJ0fBx6BVw3SQm9nWOp3MtWALJQs6/JWhqVEetfdjjaPnxURKjUEmQrR+pGeapI2I3wZLrhpvaYEo5Ag4JRlkrxxAX5qIYHfc2+UdqHwvJskR3MLKa55Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ewabBWTn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A34C63B;
	Sun,  5 May 2024 22:53:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714942416;
	bh=WLr36l3u3CQ4wGcILmT3LqcV2B263RaK/90EfetVXh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ewabBWTnW36wF7b0MRJPM2+dLn8aPqzUtKaqeNnbG48UOFmKOpEgfvdANYBSc9JBe
	 F85i80xCGiuuTnehQ9t2YmpXf4OMazGaFNWFLMo2Ps2ZnzvFXQnZzxC5qpT6SpZU3z
	 8pTZoP0DUFqeYMKPxFp5jS+OHBECNcaGfTM6x1gk=
Date: Sun, 5 May 2024 23:53:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 03/11] media: rcar-csi2: Cleanup subdevice in remove()
Message-ID: <20240505205330.GB23227@pendragon.ideasonboard.com>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
 <20240503155127.105235-4-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240503155127.105235-4-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Fri, May 03, 2024 at 05:51:18PM +0200, Jacopo Mondi wrote:
> Cleanup the V4L2 subdevice in the driver's remove function to
> ensure its async connection are freed, and guarantee in future that
> the subdev active state is cleaned up.
> 
> Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 249e58c77176..2d464e43a5be 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1938,6 +1938,7 @@ static void rcsi2_remove(struct platform_device *pdev)
>  	v4l2_async_nf_unregister(&priv->notifier);
>  	v4l2_async_nf_cleanup(&priv->notifier);
>  	v4l2_async_unregister_subdev(&priv->subdev);
> +	v4l2_subdev_cleanup(&priv->subdev);
>  
>  	pm_runtime_disable(&pdev->dev);
>  

-- 
Regards,

Laurent Pinchart

