Return-Path: <linux-media+bounces-19056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B03E98F1DC
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 16:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 423451F223BD
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 14:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1181A01BC;
	Thu,  3 Oct 2024 14:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cs3GY/pw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866EF19F428;
	Thu,  3 Oct 2024 14:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727967079; cv=none; b=Vbuw17UFRTOvL9owbaQmYn9TOqxkw7TG6uAe+OqjtpPciae+acSiq/52VawcppMLQDrKorNvtjsgLkU2G4SpOM/bdCK1l3BOCZxpeQbKJDSCbDDmqk65/YDB2jhmq1z7F8xi95bZ0UUtUy6wwfnSeCBjmaB+hePdxmPMD0abSOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727967079; c=relaxed/simple;
	bh=MVQuBuKhF39e/IyRt9k1crldXIDeyH9xoxELjFnJh5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQ+pshoUZ+pK4z/eLcGHz7FSEkJsQfT0/u6dpRsNaMp32SThwOBZ55OnQew6KM9P7WmR1jrzChjKq8ckRwBWY8IKTtlJvnhB2VjTPimcJngD9OXJGyB/8Dq6vTR2ZcFFj4tEk72iZKif/N//IGs303wmXcdyaVfXaLz3mwKCAKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cs3GY/pw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A531118D;
	Thu,  3 Oct 2024 16:49:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727966982;
	bh=MVQuBuKhF39e/IyRt9k1crldXIDeyH9xoxELjFnJh5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cs3GY/pwE+KFCKGdwGpD7drNRu/YcsfptEKsr80estgj4FnJmlRRHuppqdc/t+TV7
	 Ec8Icc1zELaqvDvrgHmHzDLMqU4NaKgnGc3t8bQg/9jYyA0aG+KeAwXCsaX0wgmXmD
	 C7c6DXRxp+Jp1WfX7Y+rFSh+Z/0WmjVjcZ+GMrrg=
Date: Thu, 3 Oct 2024 17:51:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 13/17] media: rzg2l-cru: video: Implement
 .link_validate() callback
Message-ID: <20241003145112.GE5468@pendragon.ideasonboard.com>
References: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241001140919.206139-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241001140919.206139-14-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Oct 01, 2024 at 03:09:15PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Implement the `.link_validate()` callback for the video node and move the
> format checking into this function. This change allows the removal of
> `rzg2l_cru_mc_validate_format()`.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - New patch
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 99 ++++++++++---------
>  1 file changed, 55 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index ceb9012c9d70..c6c82b9b130a 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -189,46 +189,6 @@ static void rzg2l_cru_buffer_queue(struct vb2_buffer *vb)
>  	spin_unlock_irqrestore(&cru->qlock, flags);
>  }
>  
> -static int rzg2l_cru_mc_validate_format(struct rzg2l_cru_dev *cru,
> -					struct v4l2_subdev *sd,
> -					struct media_pad *pad)
> -{
> -	struct v4l2_subdev_format fmt = {
> -		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> -	};
> -
> -	fmt.pad = pad->index;
> -	if (v4l2_subdev_call_state_active(sd, pad, get_fmt, &fmt))
> -		return -EPIPE;
> -
> -	switch (fmt.format.code) {
> -	case MEDIA_BUS_FMT_UYVY8_1X16:
> -		break;
> -	default:
> -		return -EPIPE;
> -	}
> -
> -	switch (fmt.format.field) {
> -	case V4L2_FIELD_TOP:
> -	case V4L2_FIELD_BOTTOM:
> -	case V4L2_FIELD_NONE:
> -	case V4L2_FIELD_INTERLACED_TB:
> -	case V4L2_FIELD_INTERLACED_BT:
> -	case V4L2_FIELD_INTERLACED:
> -	case V4L2_FIELD_SEQ_TB:
> -	case V4L2_FIELD_SEQ_BT:
> -		break;
> -	default:
> -		return -EPIPE;
> -	}
> -
> -	if (fmt.format.width != cru->format.width ||
> -	    fmt.format.height != cru->format.height)
> -		return -EPIPE;
> -
> -	return 0;
> -}
> -
>  static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
>  				    int slot, dma_addr_t addr)
>  {
> @@ -531,10 +491,6 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
>  		return stream_off_ret;
>  	}
>  
> -	ret = rzg2l_cru_mc_validate_format(cru, sd, pad);
> -	if (ret)
> -		return ret;
> -
>  	pipe = media_entity_pipeline(&sd->entity) ? : &cru->vdev.pipe;
>  	ret = video_device_pipeline_start(&cru->vdev, pipe);
>  	if (ret)
> @@ -995,6 +951,60 @@ static const struct v4l2_file_operations rzg2l_cru_fops = {
>  	.read		= vb2_fop_read,
>  };
>  
> +/* -----------------------------------------------------------------------------
> + * Media entity operations
> + */
> +
> +static int rzg2l_cru_video_link_validate(struct media_link *link)
> +{
> +	struct v4l2_subdev_format fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +	};
> +	struct v4l2_subdev *subdev;
> +	struct media_entity *entity;
> +	struct rzg2l_cru_dev *cru;
> +	struct media_pad *remote;
> +	int ret;
> +
> +	entity = link->sink->entity;
> +	remote = link->source;
> +
> +	subdev = media_entity_to_v4l2_subdev(remote->entity);
> +	fmt.pad = remote->index;
> +	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
> +	if (ret < 0)
> +		return ret == -ENOIOCTLCMD ? -EINVAL : ret;
> +
> +	if (!rzg2l_cru_ip_code_to_fmt(fmt.format.code))
> +		return -EPIPE;

Here you should check that the format on the subdev matches the format
on the video device.

> +
> +	switch (fmt.format.field) {
> +	case V4L2_FIELD_TOP:
> +	case V4L2_FIELD_BOTTOM:
> +	case V4L2_FIELD_NONE:
> +	case V4L2_FIELD_INTERLACED_TB:
> +	case V4L2_FIELD_INTERLACED_BT:
> +	case V4L2_FIELD_INTERLACED:
> +	case V4L2_FIELD_SEQ_TB:
> +	case V4L2_FIELD_SEQ_BT:
> +		break;
> +	default:
> +		return -EPIPE;
> +	}

Instead of checking the field here, shouldn't it be forced to a valid
value in the subdev .set_fmt() function ? The link validation handler is
responsible for validating that the configuration of the two sides of
the link (IP subdev and video device) match. The driver shouldn't allow
setting formats that can't be supported.

What you should check here is that the field of the subdev and the
field of the video device match.

> +
> +	cru = container_of(media_entity_to_video_device(entity),

You can drop the local entity variable and write

	cru = container_of(media_entity_to_video_device(link->sink->entity),

> +			   struct rzg2l_cru_dev, vdev);
> +	if (fmt.format.width != cru->format.width ||
> +	    fmt.format.height != cru->format.height)
> +		return -EPIPE;
> +
> +	return 0;
> +}
> +
> +static const struct media_entity_operations rzg2l_cru_video_media_ops = {
> +	.link_validate = rzg2l_cru_video_link_validate,
> +};
> +
>  static void rzg2l_cru_v4l2_init(struct rzg2l_cru_dev *cru)
>  {
>  	struct video_device *vdev = &cru->vdev;
> @@ -1006,6 +1016,7 @@ static void rzg2l_cru_v4l2_init(struct rzg2l_cru_dev *cru)
>  	vdev->lock = &cru->lock;
>  	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
>  	vdev->device_caps |= V4L2_CAP_IO_MC;
> +	vdev->entity.ops = &rzg2l_cru_video_media_ops;
>  	vdev->fops = &rzg2l_cru_fops;
>  	vdev->ioctl_ops = &rzg2l_cru_ioctl_ops;
>  

-- 
Regards,

Laurent Pinchart

