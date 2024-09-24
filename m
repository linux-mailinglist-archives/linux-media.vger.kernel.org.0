Return-Path: <linux-media+bounces-18530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EB9984E0D
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 00:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAB191C23C0B
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 22:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1420617BEB2;
	Tue, 24 Sep 2024 22:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="il7/+4l5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD09178362;
	Tue, 24 Sep 2024 22:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727217928; cv=none; b=X3X3elO1THY/t1QtzfbAFCcI8z7DGl+KXrwUTGVFqTsvX6280TfJO695zmRL5B80O6S4DmfJQMCY2CSOknh3Do/h3gtKpuHnaOLcKcCYvcMHWewQOU4YXfOKyeZg2JEAOc0Og0X8RQm2z4PKDSEUJD5rg649K05PA1k+M5OjXe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727217928; c=relaxed/simple;
	bh=uim7C4vvPrdwvh+osDnm8ht+Ng8pk0TX2bkZhQ+rUtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLsLWu4rj1tqJpJ4n+E07aH0GCDLhvBT9WaXG0m9Agwz4nwiUiqXmDZvgZg6eBSUF+00OGoTRkpgUpDJBNAXMci+5dI9BXusxIeNjnyq5gRWuFarq0LbR27i3L+72gs15kgKJgOy5amSRa+cVeH9l4+AqYjKsTCDpNWEOTWOncY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=il7/+4l5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 568357E2;
	Wed, 25 Sep 2024 00:43:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727217838;
	bh=uim7C4vvPrdwvh+osDnm8ht+Ng8pk0TX2bkZhQ+rUtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=il7/+4l5abAjx9PlNq9KIjh69iZTk9kVzD8Z1aQWWztKZrhN0ss9HUH+mrSp7J7Hc
	 Y44SEnsJlQmrb5SADfxmMauP7IqVK968pKWnkWI79T2905+0033OhYk+vwo48oA58L
	 4/T1fH1VGjCPQhxLImVbNZhm25aflnO+q7GWUnlI=
Date: Wed, 25 Sep 2024 01:44:52 +0300
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
Subject: Re: [PATCH v2 05/11] media: i2c: ov5645: Use
 v4l2_async_register_subdev_sensor()
Message-ID: <20240924224452.GN7165@pendragon.ideasonboard.com>
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910170610.226189-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910170610.226189-6-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Tue, Sep 10, 2024 at 06:06:04PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Make use v4l2_async_register_subdev_sensor() helper to register
> the subdev.

The commit message should explain why.

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ov5645.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index 9e6ff1f1b9ac..45687d004004 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -1223,7 +1223,7 @@ static int ov5645_probe(struct i2c_client *client)
>  
>  	ov5645_init_state(&ov5645->sd, NULL);
>  
> -	ret = v4l2_async_register_subdev(&ov5645->sd);
> +	ret = v4l2_async_register_subdev_sensor(&ov5645->sd);
>  	if (ret < 0) {
>  		dev_err_probe(dev, ret, "could not register v4l2 device\n");
>  		goto power_down;

-- 
Regards,

Laurent Pinchart

