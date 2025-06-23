Return-Path: <linux-media+bounces-35589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A56AE3893
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 10:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF1861894CC6
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 08:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97B622FE0A;
	Mon, 23 Jun 2025 08:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PXl4j2ku"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BEA22FDFF
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 08:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667744; cv=none; b=ap4/R+Iv/y+RjN2Zlni2tCYlTP4GTFz8/xUQrcSuK2kHfdxFbR1QZO0FSgZqDCaLuZmaE+yZCHNr0ehcisDXdRR+dXHPPIamijylOsqg+OvKhIRce9H/Sh6hCns5P3XYgqaQsGa289Y5EeQ/iSi+iQURn+RS/u8oLIsFWIWp9ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667744; c=relaxed/simple;
	bh=RU3oIZfQWSZmDkWFmYKWe6fwOy4wP7W39AEVM1+pB+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uCFu/HD0MroGobXFyT9pAh4mxSqTsT2I3DnJnXBxPTBA+aQKZ0J0658E+U3wH/lNuft67CrNlhwyQ8Uu6SzAEk/SXYEregA5T+58IWoeijZaOOvZhqMMkWDYZmfUgQxXGH+q1yocPKueimUkybAWsGtFbpze3tAEPeeSbGGQ7f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PXl4j2ku; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-136-88.net.vodafone.it [5.90.136.88])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56AF0D77;
	Mon, 23 Jun 2025 10:35:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750667724;
	bh=RU3oIZfQWSZmDkWFmYKWe6fwOy4wP7W39AEVM1+pB+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PXl4j2kuSMA7Yrevucq0ZeiWaFPWdm03dm5AGgjeNNvH8XHhSnyglQAsSYhTUjysF
	 IEVrzFT9yoWLss5anA4yPanmrkZvRsn2M27kPNxxytAPiMVBwpgfgV075MQi5wa6AO
	 pBvv5NMw0ezpoKLVCnVRb2TrLMl6dOaQ53pTXw3c=
Date: Mon, 23 Jun 2025 10:35:35 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Julien Massot <julien.massot@collabora.com>, 
	Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hans@jjverkuil.nl>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 4/5] media: i2c: ds90ub960: Drop check on number of
 active routes
Message-ID: <wbbijmcy2tfdod2qwmbthy5d35xmpelptxdeln6lvocsphpy7i@334a7xt56kcw>
References: <20250619204712.16099-1-laurent.pinchart@ideasonboard.com>
 <20250619204712.16099-5-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619204712.16099-5-laurent.pinchart@ideasonboard.com>

Hi Laurent

On Thu, Jun 19, 2025 at 11:47:11PM +0300, Laurent Pinchart wrote:
> The subdev core now limits the number of active routes to
> V4L2_FRAME_DESC_ENTRY_MAX. Drop the duplicated check in the ds90ub960
> driver.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/i2c/ds90ub960.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index 5dde8452739b..967e580890ea 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -2773,14 +2773,6 @@ static int _ub960_set_routing(struct v4l2_subdev *sd,
>  	};
>  	int ret;
>
> -	/*
> -	 * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, until
> -	 * frame desc is made dynamically allocated.
> -	 */
> -
> -	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
> -		return -E2BIG;
> -
>  	ret = v4l2_subdev_routing_validate(sd, routing,
>  					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
>  					   V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX);
> --
> Regards,
>
> Laurent Pinchart
>
>

