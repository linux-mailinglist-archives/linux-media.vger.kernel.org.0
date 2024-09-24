Return-Path: <linux-media+bounces-18527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDB0984DF0
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 00:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22F15282D10
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 22:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD7B154BFE;
	Tue, 24 Sep 2024 22:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bl9r6jfn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63804146019;
	Tue, 24 Sep 2024 22:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727217384; cv=none; b=PZpmOIKTJUVMjpem1wOPND/d2rn7Zj9OobNRGVDCqXh28KFD10+K5GSUApOscZvDP3o5qLjcYGWXFpEmIBDgCiurOrj191tfxb1DXa1xqsBfqHV7Z2KZfY+RxMg+a52fHHPhVvTJfVcfgm6KaYGnc5FgeRAva3Ki1wT/5TRaFPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727217384; c=relaxed/simple;
	bh=X69ThD0b9mRH+MXp1bIygXFFZE6gpgs0P6dYS8RmyBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KzG/+fBIC6ln3e2cH3dgBsgWTBAoPGhieyO86sbrNRW1L3fDSTWii7E1Yubx57sTUZlDRz6AEMi92sRQltsKZS2QOVseEeBNvV2v2huGJkKeqVkZq860RV5Np9QNbni6oR2INOVXM9mbJAULf6Uepc6zlt/QjzFV94CHs/6Eko8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bl9r6jfn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98011169;
	Wed, 25 Sep 2024 00:34:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727217294;
	bh=X69ThD0b9mRH+MXp1bIygXFFZE6gpgs0P6dYS8RmyBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bl9r6jfnPdS4WV4GTnF7s4TKN++ApBKyHnE5NvHoO2rLqE2H0euqWDsVGGoYC3S0S
	 tbfZcFjvXgKUD/U7IJ//NgEBEsU/xCbQaPVXwv7QejLraJYshAjDV1SvuErROkhR4i
	 3UpemqVKCGU6bcqZZf9HtTCzjEt0S3ZQ13+xMUI0=
Date: Wed, 25 Sep 2024 01:35:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 02/11] media: i2c: ov5645: Use local `dev` pointer for
 subdev device assignment
Message-ID: <20240924223548.GK7165@pendragon.ideasonboard.com>
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910170610.226189-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910170610.226189-3-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Tue, Sep 10, 2024 at 06:06:01PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> While assigning the subdev device pointer, use the local `dev` pointer
> which is already extracted from the `i2c_client` pointer.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ov5645.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index 6eedd0310b02..ab3a419df2df 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -1187,7 +1187,7 @@ static int ov5645_probe(struct i2c_client *client)
>  	ov5645->sd.internal_ops = &ov5645_internal_ops;
>  	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
>  	ov5645->pad.flags = MEDIA_PAD_FL_SOURCE;
> -	ov5645->sd.dev = &client->dev;
> +	ov5645->sd.dev = dev;
>  	ov5645->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  
>  	ret = media_entity_pads_init(&ov5645->sd.entity, 1, &ov5645->pad);

-- 
Regards,

Laurent Pinchart

