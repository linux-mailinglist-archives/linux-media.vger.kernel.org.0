Return-Path: <linux-media+bounces-13057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D297B9055C2
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 16:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29B8228208B
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 14:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6881617F38E;
	Wed, 12 Jun 2024 14:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F5qbBw8M"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EAC17F389
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718203934; cv=none; b=I/TrLtKvzQeezwOXF1AXKDkjeozgDikawj84qbZa+YQCwI9KXu5ZLl9UnXWq7ad3Zcz1zYwrA8WZfKr0T4qki7aiSVddZR9xbV3om1wrd8HyetHiBbUZ2qBCkiPkDtOKg5Oi0O1z8kJUEcB5nTtFRjTwjqFL5oyXMeSY55HoQGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718203934; c=relaxed/simple;
	bh=Du9wV4qEDQjl46YWOy2U8W8xVKlY9GY9N+Nu37OUkWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCru+qVbP3+C5NrgbxNkptNK1Rv4otowMUMgPJ9g/vcN73b8ZEAqmZOwFI1yww3A2v5QAvRsM9O6X5B0fmskW5frs0NewGPYgiS8kkcpbVV23CiSuH6oU8zSAzfrhoj7JoKzVpvAmBRZyqtOFAbic5eIRa3+Qc2gRrz4/y2PGfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F5qbBw8M; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 144D3230;
	Wed, 12 Jun 2024 16:51:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718203916;
	bh=Du9wV4qEDQjl46YWOy2U8W8xVKlY9GY9N+Nu37OUkWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F5qbBw8MT72evrUenlBmF+Qc1F/Y4ssZwRi2auWrpTJ7N9YGtybrEbI7qcgG0LhUk
	 QVBr7jRsP7WgOMayEMMNAhDXR/ms8g92dP0X6OBhI7vuq+rcGdum2ftIMBiPOLMHw4
	 G5e7XzzhqTblUXa3Y68Pk2uSOP/rmYzhUEd5CsfM=
Date: Wed, 12 Jun 2024 17:51:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 4/8] media: rkisp1: Add support for ext format
Message-ID: <20240612145149.GA16379@pendragon.ideasonboard.com>
References: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
 <20240605165434.432230-5-jacopo.mondi@ideasonboard.com>
 <f6279fd6-abe6-440b-9acc-e8641bba5252@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f6279fd6-abe6-440b-9acc-e8641bba5252@ideasonboard.com>

On Wed, Jun 12, 2024 at 11:46:17AM +0100, Daniel Scally wrote:
> Hi Jacopo, thanks for the patch
> 
> On 05/06/2024 17:54, Jacopo Mondi wrote:
> > Add support to the rkisp1 driver for the extensible parameters format.
> >
> > Allow the driver to enumerate the existing and the new format and
> > implement support for the try_fmt and s_fmt operations.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Isn't this too early in the set? I'd expect this to come after the
> actual support for handling the extensible buffers was done.

Agreed.

> > ---
> >   .../platform/rockchip/rkisp1/rkisp1-common.h  |  1 +
> >   .../platform/rockchip/rkisp1/rkisp1-params.c  | 87 +++++++++++++++++--
> >   2 files changed, 79 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > index 2a715f964f6e..0bddae8dbdb1 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > @@ -383,6 +383,7 @@ struct rkisp1_params {
> >   	spinlock_t config_lock; /* locks the buffers list 'params' */
> >   	struct list_head params;
> >   
> > +	struct v4l2_meta_format metafmt;

This could be turned to a static const pointer, pointing to an entry
from rkisp1_params_formats, as none of the fields can be further
modified by userspace once a format is selected. Up to you.

> >   	enum v4l2_quantization quantization;
> >   	enum v4l2_ycbcr_encoding ycbcr_encoding;
> >   	enum rkisp1_fmt_raw_pat_type raw_type;
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > index 1f449f29b241..6f99c7dad758 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > @@ -33,6 +33,34 @@
> >   #define RKISP1_ISP_CC_COEFF(n) \
> >   			(RKISP1_CIF_ISP_CC_COEFF_0 + (n) * 4)
> >   
> > +enum rkisp1_params_formats {
> > +	RKISP1_PARAMS_FIXED,
> > +	RKISP1_PARAMS_EXTENSIBLE,
> > +	RKISP1_PARAMS_NUM_FMT,
> > +};
> > +
> > +static const struct v4l2_meta_format rkisp1_params_formats[] = {
> > +	[RKISP1_PARAMS_FIXED] = {
> > +		.dataformat = V4L2_META_FMT_RK_ISP1_PARAMS,
> > +		.buffersize = sizeof(struct rkisp1_params_cfg),
> > +	},
> > +	[RKISP1_PARAMS_EXTENSIBLE] = {
> > +		.dataformat = V4L2_META_FMT_RK_ISP1_EXT_PARAMS,
> > +		.buffersize = sizeof(struct rkisp1_ext_params_cfg),
> > +	},
> > +};
> > +
> > +static const struct v4l2_meta_format *
> > +rkisp1_params_get_format_info(u32 dataformat)
> > +{
> > +	for (unsigned int i = 0; i < RKISP1_PARAMS_NUM_FMT; i++) {

Use ARRAY_SIZE(rkisp1_params_formats) instead of RKISP1_PARAMS_NUM_FMT,
that's safer. Same below, and drop RKISP1_PARAMS_NUM_FMT

> > +		if (rkisp1_params_formats[i].dataformat == dataformat)
> > +			return &rkisp1_params_formats[i];
> > +	}
> > +
> > +	return &rkisp1_params_formats[RKISP1_PARAMS_FIXED];
> > +}
> > +
> >   static inline void
> >   rkisp1_param_set_bits(struct rkisp1_params *params, u32 reg, u32 bit_mask)
> >   {
> > @@ -1742,11 +1770,13 @@ static int rkisp1_params_enum_fmt_meta_out(struct file *file, void *priv,
> >   					   struct v4l2_fmtdesc *f)
> >   {
> >   	struct video_device *video = video_devdata(file);
> > +	const struct v4l2_meta_format *metafmt;
> >   
> > -	if (f->index > 0 || f->type != video->queue->type)
> > +	if (f->index >= RKISP1_PARAMS_NUM_FMT || f->type != video->queue->type)
> >   		return -EINVAL;
> >   
> > -	f->pixelformat = V4L2_META_FMT_RK_ISP1_PARAMS;
> > +	metafmt = &rkisp1_params_formats[f->index];
> > +	f->pixelformat = metafmt->dataformat;

You could drop the metafmt variable:

	f->pixelformat = rkisp1_params_formats[f->index].dataformat;

> >   
> >   	return 0;
> >   }
> > @@ -1755,14 +1785,44 @@ static int rkisp1_params_g_fmt_meta_out(struct file *file, void *fh,
> >   					struct v4l2_format *f)
> >   {
> >   	struct video_device *video = video_devdata(file);
> > +	struct rkisp1_params *params = video_get_drvdata(video);
> >   	struct v4l2_meta_format *meta = &f->fmt.meta;
> >   
> >   	if (f->type != video->queue->type)
> >   		return -EINVAL;
> >   
> >   	memset(meta, 0, sizeof(*meta));
> > -	meta->dataformat = V4L2_META_FMT_RK_ISP1_PARAMS;
> > -	meta->buffersize = sizeof(struct rkisp1_params_cfg);
> > +	*meta = params->metafmt;

You can drop the memset now that you assign the whole structure.

> > +
> > +	return 0;
> > +}
> > +
> > +static int rkisp1_params_try_fmt_meta_out(struct file *file, void *fh,
> > +					  struct v4l2_format *f)
> > +{
> > +	struct video_device *video = video_devdata(file);
> > +	struct v4l2_meta_format *meta = &f->fmt.meta;
> > +
> > +	if (f->type != video->queue->type)
> > +		return -EINVAL;
> > +
> > +	*meta = *rkisp1_params_get_format_info(meta->dataformat);
> > +
> > +	return 0;
> > +}
> > +
> > +static int rkisp1_params_s_fmt_meta_out(struct file *file, void *fh,
> > +					struct v4l2_format *f)
> > +{
> > +	struct video_device *video = video_devdata(file);
> > +	struct rkisp1_params *params = video_get_drvdata(video);
> > +	struct v4l2_meta_format *meta = &f->fmt.meta;
> > +
> > +	if (f->type != video->queue->type)
> > +		return -EINVAL;
> > +
> > +	*meta = *rkisp1_params_get_format_info(meta->dataformat);
> > +	params->metafmt = *meta;
> >   
> >   	return 0;
> >   }
> > @@ -1792,8 +1852,8 @@ static const struct v4l2_ioctl_ops rkisp1_params_ioctl = {
> >   	.vidioc_streamoff = vb2_ioctl_streamoff,
> >   	.vidioc_enum_fmt_meta_out = rkisp1_params_enum_fmt_meta_out,
> >   	.vidioc_g_fmt_meta_out = rkisp1_params_g_fmt_meta_out,
> > -	.vidioc_s_fmt_meta_out = rkisp1_params_g_fmt_meta_out,
> > -	.vidioc_try_fmt_meta_out = rkisp1_params_g_fmt_meta_out,
> > +	.vidioc_s_fmt_meta_out = rkisp1_params_s_fmt_meta_out,
> > +	.vidioc_try_fmt_meta_out = rkisp1_params_try_fmt_meta_out,
> >   	.vidioc_querycap = rkisp1_params_querycap,
> >   	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
> >   	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> > @@ -1805,13 +1865,16 @@ static int rkisp1_params_vb2_queue_setup(struct vb2_queue *vq,
> >   					 unsigned int sizes[],
> >   					 struct device *alloc_devs[])
> >   {
> > +	struct rkisp1_params *params = vq->drv_priv;
> > +	size_t buf_size = params->metafmt.buffersize;
> > +
> >   	*num_buffers = clamp_t(u32, *num_buffers,
> >   			       RKISP1_ISP_PARAMS_REQ_BUFS_MIN,
> >   			       RKISP1_ISP_PARAMS_REQ_BUFS_MAX);
> >   
> >   	*num_planes = 1;
> >   
> > -	sizes[0] = sizeof(struct rkisp1_params_cfg);
> > +	sizes[0] = buf_size;
>
> sizes[0] = params->metafmt.buffersize; would save a variable - up to you.
>
> >   
> >   	return 0;
> >   }
> > @@ -1831,10 +1894,14 @@ static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
> >   
> >   static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
> >   {
> > -	if (vb2_plane_size(vb, 0) < sizeof(struct rkisp1_params_cfg))
> > +	struct vb2_queue *vq = vb->vb2_queue;
> > +	struct rkisp1_params *params = vq->drv_priv;
> > +	size_t buf_size = params->metafmt.buffersize;
> > +
> > +	if (vb2_plane_size(vb, 0) < buf_size)
> >   		return -EINVAL;
> >   
> > -	vb2_set_plane_payload(vb, 0, sizeof(struct rkisp1_params_cfg));
> > +	vb2_set_plane_payload(vb, 0, buf_size);
> >   
> >   	return 0;
> >   }
> > @@ -1929,6 +1996,8 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
> >   	else
> >   		params->ops = &rkisp1_v10_params_ops;
> >   
> > +	params->metafmt = rkisp1_params_formats[RKISP1_PARAMS_FIXED];
> > +
> >   	video_set_drvdata(vdev, params);
> >   
> >   	node->pad.flags = MEDIA_PAD_FL_SOURCE;

-- 
Regards,

Laurent Pinchart

