Return-Path: <linux-media+bounces-18560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 624D49864CE
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 18:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 832F41C23B3D
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 16:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3ECD80C0A;
	Wed, 25 Sep 2024 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="P1baD7/l"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715B38288F;
	Wed, 25 Sep 2024 16:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727281585; cv=none; b=qNDqYDwNVqAPeV6w3LM8SeNO1dCzwFkg7Xqy6PIKot2gz+Kuzk+HdPbcTV1ysgwUFmyHvtw139U9WkOrHC1jPzu+sZ989r2ly0tyo1vExezzEzNWaoisrsdxYiByui34xRFQYE+QECwJ1oFl8ZkEEkndgdSqOzlpsHYBjHaxCHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727281585; c=relaxed/simple;
	bh=fUBReA9Oa2MdEPzZp8Px3H5TN5AN1XPNmd8MSRduDvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAt7EUzNoM3LoFpPUYLVZAULHOSBpfkXq2ydl7THCl7/UFqIyjvunEd90+NRqnjhMLBdHe8swZBoM+ZfaAAxcyH4hSzcmPRzSj/hdG1zHut53nNr0/tb242em113KgBWePYIrGcjgVXn+ucJ6XNKGuJEmSBwzAgrjoCulMU4CvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=P1baD7/l; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 885F97E2;
	Wed, 25 Sep 2024 18:24:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727281493;
	bh=fUBReA9Oa2MdEPzZp8Px3H5TN5AN1XPNmd8MSRduDvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P1baD7/liO60LXfuKDyQyIDPCCPS+D+bl1KqqThdv2wq9b7/pLQERE9qqXGJTKGUr
	 6snz/zKzdhbPlPYAvj2400QvDm5p9XPgGD0Cv9jj27SVP6+C9vFEDA8DAaJvRciEJV
	 AdvKd5I/s4Y/glmWbw+OyrQJvGV+9/fY/TzrVqu0=
Date: Wed, 25 Sep 2024 19:26:19 +0300
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
Subject: Re: [PATCH v2 11/11] media: i2c: ov5645: Report streams using frame
 descriptors
Message-ID: <20240925162619.GB27666@pendragon.ideasonboard.com>
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910170610.226189-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910170610.226189-12-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Sep 10, 2024 at 06:06:10PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Implement the .get_frame_desc() subdev operation to report information
> about streams to the connected CSI-2 receiver. This is required to let
> the CSI-2 receiver driver know about virtual channels and data types for
> each stream.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/i2c/ov5645.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index 7f1133292ffc..c24eb6e7a7b5 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -28,6 +28,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-fwnode.h>
> @@ -829,6 +830,32 @@ static const struct v4l2_ctrl_ops ov5645_ctrl_ops = {
>  	.s_ctrl = ov5645_s_ctrl,
>  };
>  
> +static int ov5645_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				 struct v4l2_mbus_frame_desc *fd)
> +{
> +	const struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_subdev_state *state;
> +
> +	if (pad != OV5645_PAD_SOURCE)
> +		return -EINVAL;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +	fmt = v4l2_subdev_state_get_format(state, OV5645_PAD_SOURCE, 0);
> +	v4l2_subdev_unlock_state(state);

Once you unlock the state fmt could change, so you should instead do

	state = v4l2_subdev_lock_and_get_active_state(sd);
	code = v4l2_subdev_state_get_format(state, OV5645_PAD_SOURCE, 0)->code;
	v4l2_subdev_unlock_state(state);

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +	fd->num_entries = 1;
> +
> +	memset(fd->entry, 0, sizeof(fd->entry));
> +
> +	fd->entry[0].pixelcode = fmt->code;
> +	fd->entry[0].stream = 0;
> +	fd->entry[0].bus.csi2.vc = 0;
> +	fd->entry[0].bus.csi2.dt = MIPI_CSI2_DT_YUV422_8B;
> +
> +	return 0;
> +}
> +
>  static int ov5645_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum *code)
> @@ -1062,6 +1089,7 @@ static const struct v4l2_subdev_video_ops ov5645_video_ops = {
>  };
>  
>  static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
> +	.get_frame_desc = ov5645_get_frame_desc,
>  	.enum_mbus_code = ov5645_enum_mbus_code,
>  	.enum_frame_size = ov5645_enum_frame_size,
>  	.get_fmt = v4l2_subdev_get_fmt,

-- 
Regards,

Laurent Pinchart

