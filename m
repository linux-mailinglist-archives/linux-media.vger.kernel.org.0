Return-Path: <linux-media+bounces-18528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE8A984DF3
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 00:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78BE1B220AA
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 22:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9D8154BFE;
	Tue, 24 Sep 2024 22:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ahIkG43N"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCF413D8A3;
	Tue, 24 Sep 2024 22:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727217497; cv=none; b=FQkKh+8uBiO+6x3WYJLPpLiMLA+evk3tc5ULllslUp0o9BlDnnsv+CZv91nmpKPpzHcSQ9j9v/COMerrbpFwCvUFviZTzQh8tn22HaCx6TP4IG/sBszlgVbMrX5LE5yCwp6q30KVM3pLvaMlDF0gBKxCB1/J1ea2cd7qK0P5mas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727217497; c=relaxed/simple;
	bh=VvKB6MMAlqdfY/lMbwGwVxKE1jzAwDYr2aw1Z7cs+NM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjS7accDLIvz58A6LxN4JbefnBCXFS6EuKiuXWmn0Bc5nw1vB76Tb1J8rFcKMEH5Qbt8Gi3NxY3MFk9D21Sz1MwjI3/EfDl9cVCp97Kw+hJkm11arUdI6Sh7gd3rj3JDXVatClkgeIj1fX69g+CS+QYOQD6U7FcaH9UFxINq4Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ahIkG43N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32406169;
	Wed, 25 Sep 2024 00:36:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727217406;
	bh=VvKB6MMAlqdfY/lMbwGwVxKE1jzAwDYr2aw1Z7cs+NM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ahIkG43N1jGM8UhxeF4akXKzkorvsuh14NDTLjA7R42Of2mlTnZEBRyYtza3Lpobi
	 M6tNfaSIk7FXygYq982rk50Y7xEhiEyGWGqgfIwpKdyCBulmG2GXVfWzuliSlUSpLM
	 ThZM341I0DOyptNB94hlz1ssUED9BDd0ly9UJL44=
Date: Wed, 25 Sep 2024 01:37:40 +0300
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
Subject: Re: [PATCH v2 03/11] media: i2c: ov5645: Enable runtime PM after
 v4l2_async_register_subdev()
Message-ID: <20240924223740.GL7165@pendragon.ideasonboard.com>
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910170610.226189-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910170610.226189-4-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Sep 10, 2024 at 06:06:02PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> To simplify the probe error path, enable runtime PM after the
> v4l2_async_register_subdev() call.
> 
> This change ensures that runtime PM is only enabled once the subdevice
> registration is successful, avoiding unnecessary cleanup in the error
> path.

The subdev could start being used as soon as it gets registered, so
runtime PM initialization should happen before
v4l2_async_register_subdev().

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/i2c/ov5645.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index ab3a419df2df..78b86438c798 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -1239,18 +1239,17 @@ static int ov5645_probe(struct i2c_client *client)
>  		goto power_down;
>  	}
>  
> -	pm_runtime_set_active(dev);
> -	pm_runtime_get_noresume(dev);
> -	pm_runtime_enable(dev);
> -
>  	ov5645_init_state(&ov5645->sd, NULL);
>  
>  	ret = v4l2_async_register_subdev(&ov5645->sd);
>  	if (ret < 0) {
>  		dev_err(dev, "could not register v4l2 device\n");
> -		goto err_pm_runtime;
> +		goto power_down;
>  	}
>  
> +	pm_runtime_set_active(dev);
> +	pm_runtime_get_noresume(dev);
> +	pm_runtime_enable(dev);
>  	pm_runtime_set_autosuspend_delay(dev, 1000);
>  	pm_runtime_use_autosuspend(dev);
>  	pm_runtime_mark_last_busy(dev);
> @@ -1258,9 +1257,6 @@ static int ov5645_probe(struct i2c_client *client)
>  
>  	return 0;
>  
> -err_pm_runtime:
> -	pm_runtime_disable(dev);
> -	pm_runtime_put_noidle(dev);
>  power_down:
>  	ov5645_set_power_off(dev);
>  free_entity:

-- 
Regards,

Laurent Pinchart

