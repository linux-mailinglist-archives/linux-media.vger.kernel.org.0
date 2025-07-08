Return-Path: <linux-media+bounces-37140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAECAFD251
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 18:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AE81173733
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 16:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509562E5411;
	Tue,  8 Jul 2025 16:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FjMjtOT/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05BF215F5C
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 16:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751992958; cv=none; b=lMltmtu5KlSgdFlSog8ZSUFFIaX2U74doa2H3TAdo0xprAxBPBzMqs3ohQL1jXv1qzA+LLd3A39pj7Pyv4IobEowBdvMr8lcR//dbZzn5xCoGxD7exoRD8UL6rlpyeFASdxQAcsulUdoDiYlTKxvA+ajex31KgnlayVeEYEZIHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751992958; c=relaxed/simple;
	bh=AUGzBC+R6hc6ocfNC24PNrcgmBzyADjxkbY8rsrZeMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKsNYqKZtEMaVZ23ui95e19EvaNMjW7hCTlTWd0D6MoWaSMFMPu+eHoZY4hgkAuNm+5iIICa+pGdYeW3XkfSWvAC7eDKPf6Sanfrp8/AtR3n6QsqbauyVfGp+sqQIJ7w7/3AafW4c54CroVoFjTz5JquvmEuh00u+jWo2qh13sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FjMjtOT/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-136-241.net.vodafone.it [5.90.136.241])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B08C838;
	Tue,  8 Jul 2025 18:42:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751992925;
	bh=AUGzBC+R6hc6ocfNC24PNrcgmBzyADjxkbY8rsrZeMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FjMjtOT/Bzto0SR6Dr2N4XEhLZAzBMo8A8kZ3Ua42RZ2QegN38M3R3lRX0ZXtWr4S
	 vT6+xfHARXoooHNEyK3wIFMKyEDSucmdOG0V4zYsc+J4a8lb8eTKjCv3lfxkiVcmCK
	 nCNcKVo0hhM1HrHj1je4fKwM8J4NYfyHIMjJnePU=
Date: Tue, 8 Jul 2025 18:42:26 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Heiko Stuebner <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Dafna Hirschfeld <dafna@fastmail.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] media: rkisp1: Use video_device_state
Message-ID: <wbgl5stjwtdosmlrp4dk37v5xfhtkzfry2wsnz37lem5szzg55@kyffhz5ockii>
References: <20250703-vdev-state-v1-0-d647a5e4986d@ideasonboard.com>
 <20250703-vdev-state-v1-3-d647a5e4986d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250703-vdev-state-v1-3-d647a5e4986d@ideasonboard.com>

Hi Jai

On Thu, Jul 03, 2025 at 06:02:10PM -0700, Jai Luthra wrote:
> Use the newly introduced video_device_state to store the active v4l2
> format for the video device.
>
> Additionally, perform the stride calculation when required instead of
> storing it in the driver context structure.
>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-capture.c      | 113 +++++++++------------
>  .../media/platform/rockchip/rkisp1/rkisp1-common.h |   4 -
>  2 files changed, 50 insertions(+), 67 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 6dcefd144d5abe358323e37ac6133c6134ac636e..f3f2a7c3c11319470f6619cb83a87d39ee21ba61 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -11,6 +11,7 @@
>  #include <linux/delay.h>
>  #include <linux/pm_runtime.h>
>  #include <media/v4l2-common.h>
> +#include <media/v4l2-dev.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-fh.h>
>  #include <media/v4l2-ioctl.h>
> @@ -482,7 +483,9 @@ static void rkisp1_irq_frame_end_enable(struct rkisp1_capture *cap)
>
>  static void rkisp1_mp_config(struct rkisp1_capture *cap)
>  {
> -	const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
> +	const struct v4l2_pix_format_mplane *pixm =
> +		&cap->vnode.vdev.state.vid_fmt.fmt.pix_mp;

We'll need helpers to get the correct format given a video device

In example:
struct v4l2_pix_format_mplane *video_device_state_get_mplane_fmt(vdev)

> +	u32 stride = pixm->plane_fmt[0].bytesperline / cap->pix.info->bpp[0];
>  	struct rkisp1_device *rkisp1 = cap->rkisp1;
>  	u32 reg;
>
> @@ -494,11 +497,11 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
>  		     rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CR));
>
>  	if (rkisp1_has_feature(rkisp1, MAIN_STRIDE)) {
> -		rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_LLENGTH, cap->stride);
> +		rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_LLENGTH, stride);
>  		rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_PIC_WIDTH, pixm->width);
>  		rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_PIC_HEIGHT, pixm->height);
>  		rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_PIC_SIZE,
> -			     cap->stride * pixm->height);
> +			     stride * pixm->height);
>  	}
>
>  	rkisp1_irq_frame_end_enable(cap);
> @@ -546,7 +549,9 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
>
>  static void rkisp1_sp_config(struct rkisp1_capture *cap)
>  {
> -	const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
> +	const struct v4l2_pix_format_mplane *pixm =
> +		&cap->vnode.vdev.state.vid_fmt.fmt.pix_mp;
> +	u32 stride = pixm->plane_fmt[0].bytesperline / cap->pix.info->bpp[0];
>  	struct rkisp1_device *rkisp1 = cap->rkisp1;
>  	u32 mi_ctrl, reg;
>
> @@ -557,11 +562,11 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
>  	rkisp1_write(rkisp1, cap->config->mi.cr_size_init,
>  		     rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CR));
>
> -	rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_LLENGTH, cap->stride);
> +	rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_LLENGTH, stride);
>  	rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_PIC_WIDTH, pixm->width);
>  	rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_PIC_HEIGHT, pixm->height);
>  	rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_PIC_SIZE,
> -		     cap->stride * pixm->height);
> +		     stride * pixm->height);
>
>  	rkisp1_irq_frame_end_enable(cap);
>
> @@ -704,7 +709,8 @@ static const struct rkisp1_capture_ops rkisp1_capture_ops_sp = {
>
>  static int rkisp1_dummy_buf_create(struct rkisp1_capture *cap)
>  {
> -	const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
> +	const struct v4l2_pix_format_mplane *pixm =
> +		&cap->vnode.vdev.state.vid_fmt.fmt.pix_mp;
>  	struct rkisp1_dummy_buffer *dummy_buf = &cap->buf.dummy;
>
>  	dummy_buf->size = max3(rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_Y),
> @@ -869,7 +875,8 @@ static int rkisp1_vb2_queue_setup(struct vb2_queue *queue,
>  				  struct device *alloc_devs[])
>  {
>  	struct rkisp1_capture *cap = queue->drv_priv;
> -	const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
> +	const struct v4l2_pix_format_mplane *pixm =
> +		&cap->vnode.vdev.state.vid_fmt.fmt.pix_mp;
>  	unsigned int i;
>
>  	if (*num_planes) {
> @@ -894,7 +901,8 @@ static int rkisp1_vb2_buf_init(struct vb2_buffer *vb)
>  	struct rkisp1_buffer *ispbuf =
>  		container_of(vbuf, struct rkisp1_buffer, vb);
>  	struct rkisp1_capture *cap = vb->vb2_queue->drv_priv;
> -	const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
> +	const struct v4l2_pix_format_mplane *pixm =
> +		&cap->vnode.vdev.state.vid_fmt.fmt.pix_mp;
>  	unsigned int i;
>
>  	memset(ispbuf->buff_addr, 0, sizeof(ispbuf->buff_addr));
> @@ -936,10 +944,12 @@ static void rkisp1_vb2_buf_queue(struct vb2_buffer *vb)
>  static int rkisp1_vb2_buf_prepare(struct vb2_buffer *vb)
>  {
>  	struct rkisp1_capture *cap = vb->vb2_queue->drv_priv;
> +	const struct v4l2_pix_format_mplane *pixm =
> +		&cap->vnode.vdev.state.vid_fmt.fmt.pix_mp;
>  	unsigned int i;
>
> -	for (i = 0; i < cap->pix.fmt.num_planes; i++) {
> -		unsigned long size = cap->pix.fmt.plane_fmt[i].sizeimage;
> +	for (i = 0; i < pixm->num_planes; i++) {
> +		unsigned long size = pixm->plane_fmt[i].sizeimage;
>
>  		if (vb2_plane_size(vb, i) < size) {
>  			dev_err(cap->rkisp1->dev,
> @@ -1278,7 +1288,7 @@ rkisp1_find_fmt_cfg(const struct rkisp1_capture *cap, const u32 pixelfmt)
>  	return NULL;
>  }
>
> -static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
> +static void rkisp1_adj_fmt(const struct rkisp1_capture *cap,
>  			   struct v4l2_pix_format_mplane *pixm,
>  			   const struct rkisp1_capture_fmt_cfg **fmt_cfg,
>  			   const struct v4l2_format_info **fmt_info)
> @@ -1317,22 +1327,20 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
>  		*fmt_info = info;
>  }
>
> -static void rkisp1_set_fmt(struct rkisp1_capture *cap,
> -			   struct v4l2_pix_format_mplane *pixm)
> -{
> -	rkisp1_try_fmt(cap, pixm, &cap->pix.cfg, &cap->pix.info);
> -
> -	cap->pix.fmt = *pixm;
> -	cap->stride = pixm->plane_fmt[0].bytesperline / cap->pix.info->bpp[0];
> -}
> -
> -static int rkisp1_try_fmt_vid_cap_mplane(struct file *file, void *fh,
> +static int rkisp1_adj_fmt_vid_cap_mplane(struct file *file, void *priv,
>  					 struct v4l2_format *f)
>  {
>  	struct rkisp1_capture *cap = video_drvdata(file);
> +	struct video_device_state *state = priv;
>
> -	rkisp1_try_fmt(cap, &f->fmt.pix_mp, NULL, NULL);
> +	if (state->which == VIDEO_DEVICE_FORMAT_ACTIVE) {
> +		rkisp1_adj_fmt(cap, &f->fmt.pix_mp, &cap->pix.cfg,
> +			       &cap->pix.info);
> +	} else {
> +		rkisp1_adj_fmt(cap, &f->fmt.pix_mp, NULL, NULL);
> +	}

This I'm not sure is desirable.

Applying the format on a video device happens when the streaming is
started. IOW if you set fmt while the device is streaming you get back
ebusy (and I think your first patch implement that already).

So do you need to update cap->pix here ? Or can you operate on a the
v4l2_format stored in the state regardless of the
FORMAT_ACTIVE/FORMAT_TRY and when streaming is started update the
driver-specific info with the format info stored in the 'active'
state ? This means that we'll need helpers that given a vdev return
the 'active' format, ie the one stored in the state embedded in the
video device.

>
> +	state->vid_fmt = *f;
>  	return 0;
>  }
>
> @@ -1399,31 +1407,6 @@ static int rkisp1_enum_framesizes(struct file *file, void *fh,
>  	return 0;
>  }
>
> -static int rkisp1_s_fmt_vid_cap_mplane(struct file *file,
> -				       void *priv, struct v4l2_format *f)
> -{
> -	struct rkisp1_capture *cap = video_drvdata(file);
> -	struct rkisp1_vdev_node *node =
> -				rkisp1_vdev_to_node(&cap->vnode.vdev);
> -
> -	if (vb2_is_busy(&node->buf_queue))
> -		return -EBUSY;
> -
> -	rkisp1_set_fmt(cap, &f->fmt.pix_mp);
> -
> -	return 0;
> -}
> -
> -static int rkisp1_g_fmt_vid_cap_mplane(struct file *file, void *fh,
> -				       struct v4l2_format *f)
> -{
> -	struct rkisp1_capture *cap = video_drvdata(file);
> -
> -	f->fmt.pix_mp = cap->pix.fmt;
> -
> -	return 0;
> -}
> -
>  static int
>  rkisp1_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
>  {
> @@ -1444,9 +1427,9 @@ static const struct v4l2_ioctl_ops rkisp1_v4l2_ioctl_ops = {
>  	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
>  	.vidioc_streamon = vb2_ioctl_streamon,
>  	.vidioc_streamoff = vb2_ioctl_streamoff,
> -	.vidioc_try_fmt_vid_cap_mplane = rkisp1_try_fmt_vid_cap_mplane,
> -	.vidioc_s_fmt_vid_cap_mplane = rkisp1_s_fmt_vid_cap_mplane,
> -	.vidioc_g_fmt_vid_cap_mplane = rkisp1_g_fmt_vid_cap_mplane,
> +	.vidioc_try_fmt_vid_cap_mplane = rkisp1_adj_fmt_vid_cap_mplane,
> +	.vidioc_s_fmt_vid_cap_mplane = rkisp1_adj_fmt_vid_cap_mplane,
> +	.vidioc_g_fmt_vid_cap_mplane = video_device_g_fmt_vid,
>  	.vidioc_enum_fmt_vid_cap = rkisp1_enum_fmt_vid_cap_mplane,
>  	.vidioc_enum_framesizes = rkisp1_enum_framesizes,
>  	.vidioc_querycap = rkisp1_querycap,
> @@ -1461,8 +1444,10 @@ static int rkisp1_capture_link_validate(struct media_link *link)
>  	struct v4l2_subdev *sd =
>  		media_entity_to_v4l2_subdev(link->source->entity);
>  	struct rkisp1_capture *cap = video_get_drvdata(vdev);
> +	const struct v4l2_pix_format_mplane *pixm =
> +		&vdev->state.vid_fmt.fmt.pix_mp;
>  	const struct rkisp1_capture_fmt_cfg *fmt =
> -		rkisp1_find_fmt_cfg(cap, cap->pix.fmt.pixelformat);
> +		rkisp1_find_fmt_cfg(cap, pixm->pixelformat);
>  	struct v4l2_subdev_format sd_fmt = {
>  		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>  		.pad = link->source->index,
> @@ -1473,16 +1458,16 @@ static int rkisp1_capture_link_validate(struct media_link *link)
>  	if (ret)
>  		return ret;
>
> -	if (sd_fmt.format.height != cap->pix.fmt.height ||
> -	    sd_fmt.format.width != cap->pix.fmt.width ||
> +	if (sd_fmt.format.height != pixm->height ||
> +	    sd_fmt.format.width != pixm->width ||
>  	    sd_fmt.format.code != fmt->mbus) {
>  		dev_dbg(cap->rkisp1->dev,
>  			"link '%s':%u -> '%s':%u not valid: 0x%04x/%ux%u != 0x%04x/%ux%u\n",
>  			link->source->entity->name, link->source->index,
>  			link->sink->entity->name, link->sink->index,
>  			sd_fmt.format.code, sd_fmt.format.width,
> -			sd_fmt.format.height, fmt->mbus, cap->pix.fmt.width,
> -			cap->pix.fmt.height);
> +			sd_fmt.format.height, fmt->mbus, pixm->width,
> +			pixm->height);
>  		return -EPIPE;
>  	}
>
> @@ -1531,6 +1516,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
>  	};
>  	struct v4l2_device *v4l2_dev = &cap->rkisp1->v4l2_dev;
>  	struct video_device *vdev = &cap->vnode.vdev;
> +	struct v4l2_pix_format_mplane *pixm;
>  	struct rkisp1_vdev_node *node;
>  	struct vb2_queue *q;
>  	int ret;
> @@ -1548,6 +1534,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
>  	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
>  			    V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
>  	vdev->entity.ops = &rkisp1_media_ops;
> +	set_bit(V4L2_FL_USES_STATE, &vdev->flags);

I think we should introduce an helper in the core that allows drivers
to init the device state.

As suggested in the review of patch 1 this could look like

        video_device_state_alloc(size)

Where the framework allocates the state for the driver (allocating the
requested size) and then calls a driver's callback to initialize the
state.

I'm not 100% sure where the callback (analogue to subdev's
.init_state()) should live though.

struct video_device has
- const struct v4l2_file_operations *fops;
- const struct v4l2_ioctl_ops *ioctl_ops

and in none of these an .init_state() operation would fit well.

It also has
	/* callbacks */
	void (*release)(struct video_device *vdev);

we could add one
        int (*init_state)(struct video_device_state *state);

but it seems pretty rough done this way.

Another option, but I don't think it's right, it's
media_entity_operations.

What do you think ?

>  	video_set_drvdata(vdev, cap);
>  	vdev->vfl_dir = VFL_DIR_RX;
>  	node->pad.flags = MEDIA_PAD_FL_SINK;
> @@ -1572,6 +1559,13 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
>
>  	vdev->queue = q;
>
> +	vdev->state.vid_fmt.type = q->type;
> +	pixm = &vdev->state.vid_fmt.fmt.pix_mp;
> +	pixm->pixelformat = V4L2_PIX_FMT_YUYV;
> +	pixm->width = RKISP1_DEFAULT_WIDTH;
> +	pixm->height = RKISP1_DEFAULT_HEIGHT;
> +	rkisp1_adj_fmt(cap, pixm, &cap->pix.cfg, &cap->pix.info);
> +
>  	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
>  	if (ret)
>  		goto error;
> @@ -1598,7 +1592,6 @@ static void
>  rkisp1_capture_init(struct rkisp1_device *rkisp1, enum rkisp1_stream_id id)
>  {
>  	struct rkisp1_capture *cap = &rkisp1->capture_devs[id];
> -	struct v4l2_pix_format_mplane pixm;
>
>  	memset(cap, 0, sizeof(*cap));
>  	cap->id = id;
> @@ -1616,12 +1609,6 @@ rkisp1_capture_init(struct rkisp1_device *rkisp1, enum rkisp1_stream_id id)
>  	}
>
>  	cap->is_streaming = false;
> -
> -	memset(&pixm, 0, sizeof(pixm));
> -	pixm.pixelformat = V4L2_PIX_FMT_YUYV;
> -	pixm.width = RKISP1_DEFAULT_WIDTH;
> -	pixm.height = RKISP1_DEFAULT_HEIGHT;
> -	rkisp1_set_fmt(cap, &pixm);
>  }
>
>  int rkisp1_capture_devs_register(struct rkisp1_device *rkisp1)
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index ca952fd0829ba7d923ad42fec92840ccd422b6e5..7c1556bc5980f937ff2c503282bb5623283bda1a 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -304,7 +304,6 @@ struct rkisp1_device;
>   *		  handler to stop the streaming by waiting on the 'done' wait queue.
>   *		  If the irq handler is not called, the stream is stopped by the callback
>   *		  after timeout.
> - * @stride:       the line stride for the first plane, in pixel units
>   * @buf.lock:	  lock to protect buf.queue
>   * @buf.queue:	  queued buffer list
>   * @buf.dummy:	  dummy space to store dropped data
> @@ -314,7 +313,6 @@ struct rkisp1_device;
>   * @buf.next:	  the buffer used for next frame
>   * @pix.cfg:	  pixel configuration
>   * @pix.info:	  a pointer to the v4l2_format_info of the pixel format
> - * @pix.fmt:	  buffer format
>   */
>  struct rkisp1_capture {
>  	struct rkisp1_vdev_node vnode;
> @@ -325,7 +323,6 @@ struct rkisp1_capture {
>  	bool is_streaming;
>  	bool is_stopping;
>  	wait_queue_head_t done;
> -	unsigned int stride;
>  	struct {
>  		/* protects queue, curr and next */
>  		spinlock_t lock;
> @@ -337,7 +334,6 @@ struct rkisp1_capture {
>  	struct {
>  		const struct rkisp1_capture_fmt_cfg *cfg;
>  		const struct v4l2_format_info *info;
> -		struct v4l2_pix_format_mplane fmt;
>  	} pix;
>  };
>
>
> --
> 2.49.0
>
>

