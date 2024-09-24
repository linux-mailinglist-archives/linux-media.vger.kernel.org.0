Return-Path: <linux-media+bounces-18531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ABD984E11
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 00:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A8521F226D2
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 22:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98971791F4;
	Tue, 24 Sep 2024 22:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LH8jRoVk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F0D824A1;
	Tue, 24 Sep 2024 22:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727218015; cv=none; b=g9yNPSGZLXySNkMXPYQccny+u1FXvUDuK/301b3uWiOB1+TnNkWq3KuCJ7IGMUCzfq9GSwh6j0OVkVlKg/usu90A803zl+JRWxVKWDBgfHZfCf3/d1dSOicRUn+G8sMp1fcXMYFSUsDrOfNg6lCBe0Rl+heGOvKEEaTdhlcVePg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727218015; c=relaxed/simple;
	bh=cLMN5y7g9qQ1xUdjNjFks5rUy1+8qbkby9ATGY70NIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzL9oUzwi9FhMD0qh09mv5mfWkDzDG4ByWmj5vDpOcZKIv4HWixxRaC+644FKAz/+1p7VIC+wA1s0GAWDwkCBeVLb/HI4toPtzh8jFl6n29Ora9W51jv7csyuNIQ9L1C2dAYFkbrLy+KyxM8fW6LpP0gL+idiiV/IHysZ7kgwgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LH8jRoVk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39261161;
	Wed, 25 Sep 2024 00:45:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727217925;
	bh=cLMN5y7g9qQ1xUdjNjFks5rUy1+8qbkby9ATGY70NIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LH8jRoVkhGQ7qXANPqEU0UEzYhSRYMV6Pn2sqT1eCuTRP7XxPxSw3LBoFr1MxSXah
	 2pTECD2DrinVvlxGrcLF5AMS6CbB6Z0M/931o74ZzllHYv7XC9ey+id8XFvrQ5W7+S
	 5VMoBhzvFjrTR2+QAbqmBNWF0VexwN5pBXLIv3Gw=
Date: Wed, 25 Sep 2024 01:46:19 +0300
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
Subject: Re: [PATCH v2 06/11] media: i2c: ov5645: Drop `power_lock` mutex
Message-ID: <20240924224619.GO7165@pendragon.ideasonboard.com>
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910170610.226189-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910170610.226189-7-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Tue, Sep 10, 2024 at 06:06:05PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Drop mutex while applying controls and just rely on
> pm_runtime_get_if_in_use() call.

Here too the commit message should explain why the mutex can be dropped.
Given that it is only used in .s_ctrl(), and the control framework
serializes calls to the function, the mutex is not needed.

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ov5645.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index 45687d004004..25c60afcc0ec 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -106,8 +106,6 @@ struct ov5645 {
>  	u8 timing_tc_reg20;
>  	u8 timing_tc_reg21;
>  
> -	struct mutex power_lock; /* lock to protect power state */
> -
>  	struct gpio_desc *enable_gpio;
>  	struct gpio_desc *rst_gpio;
>  };
> @@ -782,11 +780,8 @@ static int ov5645_s_ctrl(struct v4l2_ctrl *ctrl)
>  					     struct ov5645, ctrls);
>  	int ret;
>  
> -	mutex_lock(&ov5645->power_lock);
> -	if (!pm_runtime_get_if_in_use(ov5645->dev)) {
> -		mutex_unlock(&ov5645->power_lock);
> +	if (!pm_runtime_get_if_in_use(ov5645->dev))
>  		return 0;
> -	}
>  
>  	switch (ctrl->id) {
>  	case V4L2_CID_SATURATION:
> @@ -817,7 +812,6 @@ static int ov5645_s_ctrl(struct v4l2_ctrl *ctrl)
>  
>  	pm_runtime_mark_last_busy(ov5645->dev);
>  	pm_runtime_put_autosuspend(ov5645->dev);
> -	mutex_unlock(&ov5645->power_lock);
>  
>  	return ret;
>  }
> @@ -1124,8 +1118,6 @@ static int ov5645_probe(struct i2c_client *client)
>  	if (IS_ERR(ov5645->rst_gpio))
>  		return dev_err_probe(dev, PTR_ERR(ov5645->rst_gpio), "cannot get reset gpio\n");
>  
> -	mutex_init(&ov5645->power_lock);
> -
>  	v4l2_ctrl_handler_init(&ov5645->ctrls, 9);
>  	v4l2_ctrl_new_std(&ov5645->ctrls, &ov5645_ctrl_ops,
>  			  V4L2_CID_SATURATION, -4, 4, 1, 0);
> @@ -1245,7 +1237,6 @@ static int ov5645_probe(struct i2c_client *client)
>  	media_entity_cleanup(&ov5645->sd.entity);
>  free_ctrl:
>  	v4l2_ctrl_handler_free(&ov5645->ctrls);
> -	mutex_destroy(&ov5645->power_lock);
>  
>  	return ret;
>  }
> @@ -1262,7 +1253,6 @@ static void ov5645_remove(struct i2c_client *client)
>  	if (!pm_runtime_status_suspended(ov5645->dev))
>  		ov5645_set_power_off(ov5645->dev);
>  	pm_runtime_set_suspended(ov5645->dev);
> -	mutex_destroy(&ov5645->power_lock);
>  }
>  
>  static const struct i2c_device_id ov5645_id[] = {

-- 
Regards,

Laurent Pinchart

