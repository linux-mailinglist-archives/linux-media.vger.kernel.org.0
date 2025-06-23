Return-Path: <linux-media+bounces-35590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D018AE3896
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 10:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 166B01894D69
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 08:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9DB122E004;
	Mon, 23 Jun 2025 08:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m/o+PGZi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E04E22DF9A
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 08:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667788; cv=none; b=WK2+I4PwLw2aWE8PsORDYfwjsBSmsE7GNo3sZLuJRv8HMAc/JtaxIvTL1bYV5pNas9qsg6EWE0aGkVVLKlPKEkifikwq+7ulGhgmAh0TwGNJjBnjd4kvx2VtSQPIiHtzJFTwyNeewkvkOH6Q/9Gaf1ksPwwOrfBOo4/HliEWtqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667788; c=relaxed/simple;
	bh=7k+uRXKdCsdc11MCrt6ccEEriyVrh0P1NovjeuwzEJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guN2pmayzEbvi8iSRBD/hWFBXJ9OKittvXcu0Uk120nyOZMYFWIpvlHF1CA66CmGhMO09Nlcb96gFo1Ta2R6XAPcN9+Vj0H4bmS7iNnUZw31aWcfAVQ2Llv9OSyVr4seHHoJ+Y7P7bKG3SQP1tUJmEVlG1eSkhPnersD7LY4bOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m/o+PGZi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-136-88.net.vodafone.it [5.90.136.88])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49E21D77;
	Mon, 23 Jun 2025 10:36:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750667768;
	bh=7k+uRXKdCsdc11MCrt6ccEEriyVrh0P1NovjeuwzEJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m/o+PGZiPuR+LdHLGnN7E081+3hNRb4le/kbN5x7QToFs5a22eRx1MuoSnk2u8UWX
	 4oUA11/OauJCAfmXAfgxAdP0FVsSGEYNMSpLnOlwCbg0mEwKtp7VN4DjLuewM2NgT9
	 Ni92VMmlAgDDcHgoCPLkDyB23kckVRogA+xL0gDI=
Date: Mon, 23 Jun 2025 10:36:20 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Julien Massot <julien.massot@collabora.com>, 
	Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hans@jjverkuil.nl>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 5/5] media: i2c: max96714: Drop check on number of active
 routes
Message-ID: <i5hgs5q3ofl3qfbo4lek7xs4oqdhklqa44jfemjrrohnaddkwd@pmcjwl57g4hk>
References: <20250619204712.16099-1-laurent.pinchart@ideasonboard.com>
 <20250619204712.16099-6-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619204712.16099-6-laurent.pinchart@ideasonboard.com>

hi Laurent

On Thu, Jun 19, 2025 at 11:47:12PM +0300, Laurent Pinchart wrote:
> The subdev core now limits the number of active routes to
> V4L2_FRAME_DESC_ENTRY_MAX. Drop the duplicated check in the max96714
> driver.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

thanks
   j

> ---
>  drivers/media/i2c/max96714.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
> index 159753b13777..5d14cefe0eae 100644
> --- a/drivers/media/i2c/max96714.c
> +++ b/drivers/media/i2c/max96714.c
> @@ -370,13 +370,6 @@ static int _max96714_set_routing(struct v4l2_subdev *sd,
>  	};
>  	int ret;
>
> -	/*
> -	 * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, until
> -	 * frame desc is made dynamically allocated.
> -	 */
> -	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
> -		return -EINVAL;
> -
>  	ret = v4l2_subdev_routing_validate(sd, routing,
>  					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
>  	if (ret)
> --
> Regards,
>
> Laurent Pinchart
>
>

