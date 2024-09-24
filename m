Return-Path: <linux-media+bounces-18526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6AE984DED
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 00:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A67C1B243C4
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 22:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664F514C5AF;
	Tue, 24 Sep 2024 22:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Kl5+6y61"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8FE139D07;
	Tue, 24 Sep 2024 22:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727217361; cv=none; b=QlhH3moCJIFmGPDFejUa0/t6rpwr6pRY+WZJVb89DKUaG1bfGwv2xDEAXpyoQd6F05SRgenoV7V6eYzZdCQWInhgl3aCmzsmIgkKGAPhZDQDJUErJndxv2uC1NDAGIf8UvYrIX4kbF4SBMkuj9ovpN/QNCIRSLDPc3MYULL6eUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727217361; c=relaxed/simple;
	bh=rgB0PV0c7KbZbJOi/cWNbAlJadZ/8RCZoiJ03Cr4wec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkI/ZkqLKAQ7yJxfcobwxFhAlxAJeUs/7cf+sKPKk6Sqij+oPioLnIiNgkEsTDMibu1KLmZbjNqbPJlORS+SlQioWf5tefGBz4P9Krjby6gY+j7w7aKubW/leeoS1Czp5jRcwPONg3hE01LsdJNbAu0cdw9E6qxuEOBrqu7rm20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Kl5+6y61; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EFA8169;
	Wed, 25 Sep 2024 00:34:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727217270;
	bh=rgB0PV0c7KbZbJOi/cWNbAlJadZ/8RCZoiJ03Cr4wec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kl5+6y61zISE4LjS1u77Udw+e3T5EP9G4pqj3eZ2e/r6So2GbF2QfjbfVDLzFUePC
	 PWpbEu8CVWk69nyRb8duxR8rr7RwT2Qn7v+bj7nEAJkHjR9hQG4J77ZD81njijF587
	 k1jbUgIryU/qL2C5djd/ge5jVn5eRUdQqz9fB1xg=
Date: Wed, 25 Sep 2024 01:35:23 +0300
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
Subject: Re: [PATCH v2 01/11] media: i2c: ov5645: Add
 V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
Message-ID: <20240924223523.GJ7165@pendragon.ideasonboard.com>
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910170610.226189-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910170610.226189-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Sep 10, 2024 at 06:06:00PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The OV5645 sensor exposes controls, so the V4L2_SUBDEV_FL_HAS_EVENTS flag
> should be set and implement subscribe_event and unsubscribe_event hooks.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ov5645.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index 019979f553b1..6eedd0310b02 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -29,6 +29,7 @@
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  #include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
>  
> @@ -1042,7 +1043,13 @@ static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
>  	.get_selection = ov5645_get_selection,
>  };
>  
> +static const struct v4l2_subdev_core_ops ov5645_core_ops = {
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
>  static const struct v4l2_subdev_ops ov5645_subdev_ops = {
> +	.core = &ov5645_core_ops,
>  	.video = &ov5645_video_ops,
>  	.pad = &ov5645_subdev_pad_ops,
>  };
> @@ -1178,7 +1185,7 @@ static int ov5645_probe(struct i2c_client *client)
>  
>  	v4l2_i2c_subdev_init(&ov5645->sd, client, &ov5645_subdev_ops);
>  	ov5645->sd.internal_ops = &ov5645_internal_ops;
> -	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
>  	ov5645->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	ov5645->sd.dev = &client->dev;
>  	ov5645->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> -- 
> 2.34.1
> 

-- 
Regards,

Laurent Pinchart

