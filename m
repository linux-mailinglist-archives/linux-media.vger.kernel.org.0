Return-Path: <linux-media+bounces-19190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7561E9937E6
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 22:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB5C51F21901
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 20:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7BF1DE4CA;
	Mon,  7 Oct 2024 20:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jPNHNFFf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52FC1DE2D3;
	Mon,  7 Oct 2024 20:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728331572; cv=none; b=fqhdmEVUz0TiOqIjbVrA2b3ekLwnTPxR2C+5PLXC+yYpskH0+EwSRKccpSfLg0t6g2uqQ7MVhkmcJIrYYtl6HWlDqjh/OhZ23A/YXaBC2iSWD4t8EHK46RLZNEumI+Ks12WfbRNs5ah4FPnYLuhTuAJ6w3w67Hv+KYnkACxo3BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728331572; c=relaxed/simple;
	bh=fF+pVLgA3Hex/Fn5K86ObxcJMLlJ2PovFtoJ6BAxvAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8aBFNZ+wcKTxJF1NBtXDrFprIEapEwZWqpXlhmWWnIsNP1lh1rFOnpkqq3bROyWsQ69zZ10f77SpxkvtxANhac4PMEoa5wIVfY3YPc0QQqL3ru1weHpnHVBnRO543171a7OVg6afD59SVlkvrwHaFc8z3AijdYagV5ez3SSrrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jPNHNFFf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [132.205.230.14])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8ECA12EC;
	Mon,  7 Oct 2024 22:04:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728331473;
	bh=fF+pVLgA3Hex/Fn5K86ObxcJMLlJ2PovFtoJ6BAxvAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jPNHNFFf5BM8Wsl91oB26SQm5Su22Wwpm4oybF58QnZciWdUYMIWHwajndpk/TH6D
	 2EE9N5Ub9jKATh2jmfDbMSrlUAViTK8eHwWYJ+63SNqh2PK4ZdIOaz1qkWxr86UydF
	 uAH6hAeeFiQw6RDz/IuAlIiPVmOgGsNkDjVeF0X8=
Date: Mon, 7 Oct 2024 23:06:03 +0300
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
Subject: Re: [PATCH v4 13/17] media: rzg2l-cru: video: Implement
 .link_validate() callback
Message-ID: <20241007200603.GA28812@pendragon.ideasonboard.com>
References: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241007184839.190519-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241007184839.190519-14-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Mon, Oct 07, 2024 at 07:48:35PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Implement the `.link_validate()` callback for the video node and move the
> format checking into this function. This change allows the removal of
> `rzg2l_cru_mc_validate_format()`.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 91 ++++++++++---------
>  1 file changed, 47 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index ceb9012c9d70..385b4242db2f 100644
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
> @@ -995,6 +951,52 @@ static const struct v4l2_file_operations rzg2l_cru_fops = {
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
> +	const struct rzg2l_cru_ip_format *ip_fmt;
> +	struct v4l2_subdev *subdev;
> +	struct rzg2l_cru_dev *cru;
> +	struct media_pad *remote;
> +	int ret;
> +
> +	remote = link->source;
> +	subdev = media_entity_to_v4l2_subdev(remote->entity);
> +	fmt.pad = remote->index;

	subdev = media_entity_to_v4l2_subdev(link->source->entity);
	fmt.pad = link->source->index;

and drop the remote variable. Or, if you prefer keeping it, rename it to
source.

> +	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
> +	if (ret < 0)
> +		return ret == -ENOIOCTLCMD ? -EINVAL : ret;
> +
> +	cru = container_of(media_entity_to_video_device(link->sink->entity),
> +			   struct rzg2l_cru_dev, vdev);
> +	video_fmt = rzg2l_cru_ip_format_to_fmt(cru->format.pixelformat);
> +	if (!video_fmt)
> +		return -EPIPE;

Can this happen, doesn't the s_fmt handler on the video device ensure
that pixelformat is always valid.

> +	ip_fmt = rzg2l_cru_ip_code_to_fmt(fmt.format.code);
> +	if (!ip_fmt)
> +		return -EPIPE;

Same question here.

> +
> +	if (fmt.format.width != cru->format.width ||
> +	    fmt.format.height != cru->format.height ||
> +	    fmt.format.field != cru->format.field ||
> +	    video_fmt->code != fmt.format.code ||
> +	    ip_fmt->format != cru->format.pixelformat)

The last two line seem to implement the same check.

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
> @@ -1006,6 +1008,7 @@ static void rzg2l_cru_v4l2_init(struct rzg2l_cru_dev *cru)
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

