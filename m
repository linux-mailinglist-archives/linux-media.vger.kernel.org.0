Return-Path: <linux-media+bounces-35588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01523AE3883
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 10:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 540151894CC8
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 08:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150D922DFF3;
	Mon, 23 Jun 2025 08:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n07ABvKK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091B9231A42
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 08:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667718; cv=none; b=PncqO01LBma5KEwhDfYqWgbjknStnvJUTcAVi2j7a1SKBKK/KiWjZcDI4i3hcZ1wLpzZGHkzSzsr60rB3MpmqTK1XG12Vy46w+nt4wDjHs/2ZseX6540rbjvErknt+U8jkqcbfbrJShRoc9JSUqx/Ut30yHTrESWK2lcmmu2/D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667718; c=relaxed/simple;
	bh=P+9SlvC1IsWIc5QNvXklMNzET1qM7jr2Ezh8nr/iAJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ll/52Uc5yB62o7jlSzdq/GDCsLGOWTa1rFW/n5pLrclghJQoZ18WVqH3Cf6Qr3FuDR4lNDChF0O3/aQbdb4VZUiyaZm8pgQijL4ZjPXWXAD0wnYzpcBKarJCmU9dKr5rpj0KIi1J2tsmiyIVyeaoL1yiSVz9nbuWyGt4HEUjytY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n07ABvKK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-136-88.net.vodafone.it [5.90.136.88])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FDCDD77;
	Mon, 23 Jun 2025 10:34:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750667699;
	bh=P+9SlvC1IsWIc5QNvXklMNzET1qM7jr2Ezh8nr/iAJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n07ABvKKAFRrtHZPPglkAwCXvy4ffKhgguFHZHZSd8DcWia+tee5EuOtS/QbpDGnn
	 /hTyWmWy70OrjdLsFO8C1xiauo2DBNStnOur9bV0gnO69tqA1YN9xU8bSVgW4TwtW9
	 qKeZ66BZhnM+rj0Xoq0ySurFGB2JEITOg5j2G8WI=
Date: Mon, 23 Jun 2025 10:35:12 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Julien Massot <julien.massot@collabora.com>, 
	Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hans@jjverkuil.nl>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/5] media: i2c: ds90ub953: Drop check on number of
 active routes
Message-ID: <5c6aljqw5g3o2hev4koa3z6n455nk3tguf6osxl7i2jo2na55n@m6ina6av5u3o>
References: <20250619204712.16099-1-laurent.pinchart@ideasonboard.com>
 <20250619204712.16099-4-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619204712.16099-4-laurent.pinchart@ideasonboard.com>

Hi Laurent

On Thu, Jun 19, 2025 at 11:47:10PM +0300, Laurent Pinchart wrote:
> The subdev core now limits the number of active routes to
> V4L2_FRAME_DESC_ENTRY_MAX. Drop the duplicated check in the ds90ub953
> driver.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/i2c/ds90ub953.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
> index 46569381b332..c80f5061a13a 100644
> --- a/drivers/media/i2c/ds90ub953.c
> +++ b/drivers/media/i2c/ds90ub953.c
> @@ -456,14 +456,6 @@ static int _ub953_set_routing(struct v4l2_subdev *sd,
>  	};
>  	int ret;
>
> -	/*
> -	 * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, until
> -	 * frame desc is made dynamically allocated.
> -	 */
> -
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

