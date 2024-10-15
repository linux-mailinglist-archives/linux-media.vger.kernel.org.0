Return-Path: <linux-media+bounces-19664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D09FB99E424
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 12:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AE481F231AC
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 10:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722D41EF0AD;
	Tue, 15 Oct 2024 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oR45qBQ9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DD71EF084;
	Tue, 15 Oct 2024 10:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728988432; cv=none; b=kl5r6rw5WlcEJbjrJEH2rDiu0cpRKq5J0KpI3LbzYziPC4hWYkpfljEXhNGH3xJUJU71roM33in8RXCUT9MT7fUQBpRBGPe/hB2gP1oi0xg1OW86/UwNU+zzLGXGlvy6vczXth5b0c0QA6zFZJxfLssbpL/g8vDy0KZovCA6Zrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728988432; c=relaxed/simple;
	bh=HL/jnE1WqweHPGzwcCPIQU5c+Ncx9S2AY76RTDl/6C4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBsxNzUJbXn7K8gWHlRoyuMdo2f+uAK+w3+CYwHf5O5epDDxSH9tG2fHj1ax9la5o9pPYeIKilqEYlsPY3AgsoJVeLbF+AVfY/5wvCD64vp6ODNiepfeK8t8jyyNjhw4ENGJBcc5uwOdc+vvOWHROtCD2RKd8DdJY1LJCq7OnM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oR45qBQ9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [185.143.39.11])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A5A9A34;
	Tue, 15 Oct 2024 12:32:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728988328;
	bh=HL/jnE1WqweHPGzwcCPIQU5c+Ncx9S2AY76RTDl/6C4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oR45qBQ9FMNqA1s5f4U7pH5PHCwPDpPi2ewSXhzFUnLlwFm2PCAALuMgYBB7yz8bv
	 arHGUXNLbyqiZkGaRxJqyHMQwfXvEig/EiWLQf9JXuZ3ZeuWp0veQyDbN/rmofo7a3
	 LHJ3wG6ga2v62BNaIWEg6cwCMbtB2w4Mcv4yddXI=
Date: Tue, 15 Oct 2024 13:33:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 18/22] media: rzg2l-cru: video: Implement
 .link_validate() callback
Message-ID: <20241015103346.GL5682@pendragon.ideasonboard.com>
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241011173052.1088341-19-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011173052.1088341-19-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Fri, Oct 11, 2024 at 06:30:48PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Implement the `.link_validate()` callback for the video node and move the
> format checking into this function. This change allows the removal of
> `rzg2l_cru_mc_validate_format()`.

I would add here that the fmt.format.code and fmt.format.field checks
can be dropped as the subdev .set_fmt() handler ensures that those
fields always hold valid values.

> 
> Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 82 +++++++++----------
>  1 file changed, 38 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 0cc69a7440bf..df6114cbe5c7 100644
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
> @@ -532,10 +492,6 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
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
> @@ -986,6 +942,43 @@ static const struct v4l2_file_operations rzg2l_cru_fops = {
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
> +	const struct rzg2l_cru_ip_format *video_fmt;
> +	struct v4l2_subdev *subdev;
> +	struct rzg2l_cru_dev *cru;
> +	int ret;
> +
> +	subdev = media_entity_to_v4l2_subdev(link->source->entity);
> +	fmt.pad = link->source->index;
> +	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
> +	if (ret < 0)
> +		return ret == -ENOIOCTLCMD ? -EINVAL : ret;
> +
> +	cru = container_of(media_entity_to_video_device(link->sink->entity),
> +			   struct rzg2l_cru_dev, vdev);
> +	video_fmt = rzg2l_cru_ip_format_to_fmt(cru->format.pixelformat);
> +
> +	if (fmt.format.width != cru->format.width ||
> +	    fmt.format.height != cru->format.height ||
> +	    fmt.format.field != cru->format.field ||
> +	    video_fmt->code != fmt.format.code)
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
> @@ -997,6 +990,7 @@ static void rzg2l_cru_v4l2_init(struct rzg2l_cru_dev *cru)
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

