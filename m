Return-Path: <linux-media+bounces-19626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D54E599D5F6
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 19:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53A62B24C61
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 17:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 394AD1C8781;
	Mon, 14 Oct 2024 17:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f37HxR4E"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC81D1C75F3;
	Mon, 14 Oct 2024 17:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728928505; cv=none; b=MRCDedimYaN9bcHy7BwlKGL89M9W0Szf6TOAZwLoXZ8eigyiPH4xdt0rEyBtHDuspU4Nuu2iDV/62vAhWVsziYcRvz/rE7HwgB/g2aOWyiOdVq8vlt9AWMQA5xl/3qmD8xQhmFCJgLBEpKmDrXVpimf6GVtDYJ4WNOq5Ck30Cq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728928505; c=relaxed/simple;
	bh=XFkxICuLISQtarmpHa26eTxLUZ1Aq/Ypudx9pZHytG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lN7kjvR7luBf3gR4uVIQejN5lORyZJOy/Zuer6KHG/poOAcgUd0DZ5f6x//RRpO64PHK5IQj36KvZlcWTKqisEju1VcS+95FsjAGXUQ7r/dsFpMsCsOZbBuaAetDIsTNWghgOBb20hQH6wWSjoUH6OK0P+Nq2j0LJgevuRQGECk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f37HxR4E; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [23.233.251.139])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5DDB8BE;
	Mon, 14 Oct 2024 19:53:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728928400;
	bh=XFkxICuLISQtarmpHa26eTxLUZ1Aq/Ypudx9pZHytG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f37HxR4EuCQOj+7lko6w6NHcjxYe4iE6O9yr3qO0gGgmtN1X+nuxeh6wCv7HDAENb
	 9Nz1odLAkBNYBy+5kyBmGhVGPJx68vR0NlKg70bs/Yd6A8Tm8aZzad1FgruLJ7gWjK
	 X65TfbObHpkCLh8wIvnqZ5LCE+khpMW1m1JDCzX8=
Date: Mon, 14 Oct 2024 20:54:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: sakari.ailus@linux.intel.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5645: add HAS_EVENTS support
Message-ID: <20241014175452.GB13238@pendragon.ideasonboard.com>
References: <20241014173840.412695-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241014173840.412695-1-tomm.merciai@gmail.com>

Hi Tommaso,

Thank you for the patch.

On Mon, Oct 14, 2024 at 07:38:40PM +0200, Tommaso Merciai wrote:
> Controls can be exposed to userspace via a v4l-subdevX device, and
> userspace has to be able to subscribe to control events so that it is
> notified when the control changes value.
> Add missing HAS_EVENTS support: flag and .(un)subscribe_event().
> 
> Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> ---
>  drivers/media/i2c/ov5645.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index 0c32bd2940ec..2c5145d5c616 100644
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
> @@ -1034,6 +1035,11 @@ static const struct v4l2_subdev_video_ops ov5645_video_ops = {
>  	.s_stream = ov5645_s_stream,
>  };
>  
> +static const struct v4l2_subdev_core_ops ov5645_subdev_core_ops = {
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
>  static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
>  	.enum_mbus_code = ov5645_enum_mbus_code,
>  	.enum_frame_size = ov5645_enum_frame_size,
> @@ -1043,6 +1049,7 @@ static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
>  };
>  
>  static const struct v4l2_subdev_ops ov5645_subdev_ops = {
> +	.core = &ov5645_subdev_core_ops,
>  	.video = &ov5645_video_ops,
>  	.pad = &ov5645_subdev_pad_ops,
>  };
> @@ -1178,7 +1185,8 @@ static int ov5645_probe(struct i2c_client *client)
>  
>  	v4l2_i2c_subdev_init(&ov5645->sd, client, &ov5645_subdev_ops);
>  	ov5645->sd.internal_ops = &ov5645_internal_ops;
> -	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +			    V4L2_SUBDEV_FL_HAS_EVENTS;

Instead of patching every subdev driver, should we handle all of this in
the subdev core ? If a control handler is set for the subdev, we could
set the HAS_EVENTS flag automatically, and default to
v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
if there are no control operations.

>  	ov5645->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	ov5645->sd.dev = &client->dev;
>  	ov5645->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;

-- 
Regards,

Laurent Pinchart

