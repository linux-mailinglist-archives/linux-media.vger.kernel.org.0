Return-Path: <linux-media+bounces-37699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A86DB046B9
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 19:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D8334A65C7
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1EC265CDF;
	Mon, 14 Jul 2025 17:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gDuNrm+c"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E911328EA
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 17:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752514714; cv=none; b=sb0vSDpnODuP8eYZavWvHPtS/OGynqsQU/kVYw8xor0Inqfb1chV8SvvwmK4oXKQS6tGqZw2g4br1gpaNXsnEJaSMtAxTcT8IGrdlvgDp8m6aB+J2oKRNjv7W9m41uuSJPSuEjV67VMozTPzEKqDPyVHXKdc8ihgSFsMke47v2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752514714; c=relaxed/simple;
	bh=EvuK6tzDe+ay7edCwzyMCfMJWMtLM51URbyRQHRFlW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFKtiBykx8X7n7FWkrW1cNrB8mz/b9BbtKSR+sFj7vrPBzdiaaH7j3Ntf1/1y3qY+Vs9RhypbP4xAmwCJrB366k/9+zDT8+hRNVolVrVSnc4zSpy9k01TheBkxJs/UcH+bM7tO/F4Co20CJGvFMFfpNZ5zhZGT5ambYikg6CpLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gDuNrm+c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D633A7E4;
	Mon, 14 Jul 2025 19:37:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752514674;
	bh=EvuK6tzDe+ay7edCwzyMCfMJWMtLM51URbyRQHRFlW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gDuNrm+cvmL2lA12/aBivJJdzfB2tfJJ9hJ/WXz+fpOVb3lPKdwKrgiMtXRgRuX2k
	 6A+GvnAgrnQgbbRifqcvGWElyPNzrTCT2QtKiZ4dHoyFE4/EYs/+mU+dkPQAWk6MNi
	 yCXeWeAFYeEl3WvhBwt3kHAaZJxkd212iequNOjs=
Date: Mon, 14 Jul 2025 20:37:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] media: rkisp1: Use video_device_state
Message-ID: <20250714173754.GB13846@pendragon.ideasonboard.com>
References: <20250703-vdev-state-v1-0-d647a5e4986d@ideasonboard.com>
 <20250703-vdev-state-v1-3-d647a5e4986d@ideasonboard.com>
 <wbgl5stjwtdosmlrp4dk37v5xfhtkzfry2wsnz37lem5szzg55@kyffhz5ockii>
 <175227999529.3930831.16226341065141875876@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175227999529.3930831.16226341065141875876@freya>

On Fri, Jul 11, 2025 at 05:26:35PM -0700, Jai Luthra wrote:
> Quoting Jacopo Mondi (2025-07-08 09:42:26)
> > On Thu, Jul 03, 2025 at 06:02:10PM -0700, Jai Luthra wrote:
> > > Use the newly introduced video_device_state to store the active v4l2
> > > format for the video device.
> > >
> > > Additionally, perform the stride calculation when required instead of
> > > storing it in the driver context structure.
> > >
> > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > ---
> > >  .../platform/rockchip/rkisp1/rkisp1-capture.c      | 113 +++++++++------------
> > >  .../media/platform/rockchip/rkisp1/rkisp1-common.h |   4 -
> > >  2 files changed, 50 insertions(+), 67 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > > index 6dcefd144d5abe358323e37ac6133c6134ac636e..f3f2a7c3c11319470f6619cb83a87d39ee21ba61 100644
> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > > @@ -11,6 +11,7 @@
> > >  #include <linux/delay.h>
> > >  #include <linux/pm_runtime.h>
> > >  #include <media/v4l2-common.h>
> > > +#include <media/v4l2-dev.h>
> > >  #include <media/v4l2-event.h>
> > >  #include <media/v4l2-fh.h>
> > >  #include <media/v4l2-ioctl.h>
> > > @@ -482,7 +483,9 @@ static void rkisp1_irq_frame_end_enable(struct rkisp1_capture *cap)
> > >
> > >  static void rkisp1_mp_config(struct rkisp1_capture *cap)
> > >  {
> > > -     const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
> > > +     const struct v4l2_pix_format_mplane *pixm =
> > > +             &cap->vnode.vdev.state.vid_fmt.fmt.pix_mp;
> > 
> > We'll need helpers to get the correct format given a video device
> > 
> > In example:
> > struct v4l2_pix_format_mplane *video_device_state_get_mplane_fmt(vdev)

As there should be a single format in the state, I'd add a helper to
access the v4l2_format, and let drivers extract fmt.pix_fmt themselves.
Also, the state helpers should operate on a state pointer.

Eventually the state should be passed all the way from the top-level to
the leaf functions such as rkisp1_mp_config(), but for the time being a
helper to get the active state can be introduced too. No driver should
*ever* access vdev->state or fh->state manually.

> > > +     u32 stride = pixm->plane_fmt[0].bytesperline / cap->pix.info->bpp[0];
> > >       struct rkisp1_device *rkisp1 = cap->rkisp1;
> > >       u32 reg;
> > >
> > > @@ -494,11 +497,11 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
> > >                    rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CR));
> > >
> > >       if (rkisp1_has_feature(rkisp1, MAIN_STRIDE)) {
> > > -             rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_LLENGTH, cap->stride);
> > > +             rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_LLENGTH, stride);
> > >               rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_PIC_WIDTH, pixm->width);
> > >               rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_PIC_HEIGHT, pixm->height);
> > >               rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_PIC_SIZE,
> > > -                          cap->stride * pixm->height);
> > > +                          stride * pixm->height);
> > >       }
> > >
> > >       rkisp1_irq_frame_end_enable(cap);
> > > @@ -546,7 +549,9 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
> > >
> > >  static void rkisp1_sp_config(struct rkisp1_capture *cap)
> > >  {
> > > -     const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
> > > +     const struct v4l2_pix_format_mplane *pixm =
> > > +             &cap->vnode.vdev.state.vid_fmt.fmt.pix_mp;
> > > +     u32 stride = pixm->plane_fmt[0].bytesperline / cap->pix.info->bpp[0];
> > >       struct rkisp1_device *rkisp1 = cap->rkisp1;
> > >       u32 mi_ctrl, reg;
> > >
> > > @@ -557,11 +562,11 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
> > >       rkisp1_write(rkisp1, cap->config->mi.cr_size_init,
> > >                    rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CR));
> > >
> > > -     rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_LLENGTH, cap->stride);
> > > +     rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_LLENGTH, stride);
> > >       rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_PIC_WIDTH, pixm->width);
> > >       rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_PIC_HEIGHT, pixm->height);
> > >       rkisp1_write(rkisp1, RKISP1_CIF_MI_SP_Y_PIC_SIZE,
> > > -                  cap->stride * pixm->height);
> > > +                  stride * pixm->height);
> > >
> > >       rkisp1_irq_frame_end_enable(cap);
> > >
> > > @@ -704,7 +709,8 @@ static const struct rkisp1_capture_ops rkisp1_capture_ops_sp = {
> > >
> > >  static int rkisp1_dummy_buf_create(struct rkisp1_capture *cap)
> > >  {
> > > -     const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
> > > +     const struct v4l2_pix_format_mplane *pixm =
> > > +             &cap->vnode.vdev.state.vid_fmt.fmt.pix_mp;
> > >       struct rkisp1_dummy_buffer *dummy_buf = &cap->buf.dummy;
> > >
> > >       dummy_buf->size = max3(rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_Y),
> > > @@ -869,7 +875,8 @@ static int rkisp1_vb2_queue_setup(struct vb2_queue *queue,
> > >                                 struct device *alloc_devs[])
> > >  {
> > >       struct rkisp1_capture *cap = queue->drv_priv;
> > > -     const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
> > > +     const struct v4l2_pix_format_mplane *pixm =
> > > +             &cap->vnode.vdev.state.vid_fmt.fmt.pix_mp;
> > >       unsigned int i;
> > >
> > >       if (*num_planes) {
> > > @@ -894,7 +901,8 @@ static int rkisp1_vb2_buf_init(struct vb2_buffer *vb)
> > >       struct rkisp1_buffer *ispbuf =
> > >               container_of(vbuf, struct rkisp1_buffer, vb);
> > >       struct rkisp1_capture *cap = vb->vb2_queue->drv_priv;
> > > -     const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
> > > +     const struct v4l2_pix_format_mplane *pixm =
> > > +             &cap->vnode.vdev.state.vid_fmt.fmt.pix_mp;
> > >       unsigned int i;
> > >
> > >       memset(ispbuf->buff_addr, 0, sizeof(ispbuf->buff_addr));
> > > @@ -936,10 +944,12 @@ static void rkisp1_vb2_buf_queue(struct vb2_buffer *vb)
> > >  static int rkisp1_vb2_buf_prepare(struct vb2_buffer *vb)
> > >  {
> > >       struct rkisp1_capture *cap = vb->vb2_queue->drv_priv;
> > > +     const struct v4l2_pix_format_mplane *pixm =
> > > +             &cap->vnode.vdev.state.vid_fmt.fmt.pix_mp;
> > >       unsigned int i;
> > >
> > > -     for (i = 0; i < cap->pix.fmt.num_planes; i++) {
> > > -             unsigned long size = cap->pix.fmt.plane_fmt[i].sizeimage;
> > > +     for (i = 0; i < pixm->num_planes; i++) {
> > > +             unsigned long size = pixm->plane_fmt[i].sizeimage;
> > >
> > >               if (vb2_plane_size(vb, i) < size) {
> > >                       dev_err(cap->rkisp1->dev,
> > > @@ -1278,7 +1288,7 @@ rkisp1_find_fmt_cfg(const struct rkisp1_capture *cap, const u32 pixelfmt)
> > >       return NULL;
> > >  }
> > >
> > > -static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
> > > +static void rkisp1_adj_fmt(const struct rkisp1_capture *cap,
> > >                          struct v4l2_pix_format_mplane *pixm,
> > >                          const struct rkisp1_capture_fmt_cfg **fmt_cfg,
> > >                          const struct v4l2_format_info **fmt_info)
> > > @@ -1317,22 +1327,20 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
> > >               *fmt_info = info;
> > >  }
> > >
> > > -static void rkisp1_set_fmt(struct rkisp1_capture *cap,
> > > -                        struct v4l2_pix_format_mplane *pixm)
> > > -{
> > > -     rkisp1_try_fmt(cap, pixm, &cap->pix.cfg, &cap->pix.info);
> > > -
> > > -     cap->pix.fmt = *pixm;
> > > -     cap->stride = pixm->plane_fmt[0].bytesperline / cap->pix.info->bpp[0];
> > > -}
> > > -
> > > -static int rkisp1_try_fmt_vid_cap_mplane(struct file *file, void *fh,
> > > +static int rkisp1_adj_fmt_vid_cap_mplane(struct file *file, void *priv,
> > >                                        struct v4l2_format *f)
> > >  {
> > >       struct rkisp1_capture *cap = video_drvdata(file);
> > > +     struct video_device_state *state = priv;
> > >
> > > -     rkisp1_try_fmt(cap, &f->fmt.pix_mp, NULL, NULL);
> > > +     if (state->which == VIDEO_DEVICE_FORMAT_ACTIVE) {
> > > +             rkisp1_adj_fmt(cap, &f->fmt.pix_mp, &cap->pix.cfg,
> > > +                            &cap->pix.info);
> > > +     } else {
> > > +             rkisp1_adj_fmt(cap, &f->fmt.pix_mp, NULL, NULL);
> > > +     }
> > 
> > This I'm not sure is desirable.
> > 
> > Applying the format on a video device happens when the streaming is
> > started. IOW if you set fmt while the device is streaming you get back
> > ebusy (and I think your first patch implement that already).
> > 
> > So do you need to update cap->pix here ? Or can you operate on a the
> > v4l2_format stored in the state regardless of the
> > FORMAT_ACTIVE/FORMAT_TRY and when streaming is started update the
> > driver-specific info with the format info stored in the 'active'
> > state ? This means that we'll need helpers that given a vdev return
> > the 'active' format, ie the one stored in the state embedded in the
> > video device.
> 
> Ah yes, I didn't want to change too much in the driver so kept the function
> as similar as possible.. but I think it would be feasible to fetch the
> driver-specific config and v4l2_format_info when needed, instead of storing
> it in the driver structure.
> 
> The majority of the uses I see for both are fairly contained, during buffer
> init, and in the mp/sp_config functions.

They are used in the following functions:

- rkisp1_mp_config()
- rkisp1_sp_config()
- rkisp1_mp_enable()
- rkisp1_vb2_buf_init()
- rkisp1_set_next_buf()

The first three functions are called from rkisp1_cap_stream_enable(), so
the info and cfg could be looked up there, and passed to the functions.

rkisp1_vb2_buf_init() could look up info and cfg manually, but it could
be more efficient to move the swap to rkisp1_set_next_buf() (not
swapping in the buffer itself, just when writing to the cb_base_ad_init
and cr_base_ad_init registers) as that function will need to access
pix.cfg anyway.

As for rkisp1_set_next_buf(), as the function is called in interrupt
context, it would be best to avoid the cost of looking up the data based
on the format. I'd recommend moving the lookups and setting pix.cfg and
pix.fmt to stream start time, so that rkisp1_set_next_buf() will be able
to access them.

Or you could bite the bullet and implement support for subclassing the
state, in which case the driver could add the cfg and info fields to its
custom state. Accessing the active state from rkisp1_set_next_buf() will
however be possibly problematic due to locking, so I think keeping the
pix.cfg and pix.info storage and moving the lookup to stream start would
be the best solution.

> > >
> > > +     state->vid_fmt = *f;
> > >       return 0;
> > >  }
> > >
> > > @@ -1399,31 +1407,6 @@ static int rkisp1_enum_framesizes(struct file *file, void *fh,
> > >       return 0;
> > >  }
> > >
> > > -static int rkisp1_s_fmt_vid_cap_mplane(struct file *file,
> > > -                                    void *priv, struct v4l2_format *f)
> > > -{
> > > -     struct rkisp1_capture *cap = video_drvdata(file);
> > > -     struct rkisp1_vdev_node *node =
> > > -                             rkisp1_vdev_to_node(&cap->vnode.vdev);
> > > -
> > > -     if (vb2_is_busy(&node->buf_queue))
> > > -             return -EBUSY;
> > > -
> > > -     rkisp1_set_fmt(cap, &f->fmt.pix_mp);
> > > -
> > > -     return 0;
> > > -}
> > > -
> > > -static int rkisp1_g_fmt_vid_cap_mplane(struct file *file, void *fh,
> > > -                                    struct v4l2_format *f)
> > > -{
> > > -     struct rkisp1_capture *cap = video_drvdata(file);
> > > -
> > > -     f->fmt.pix_mp = cap->pix.fmt;
> > > -
> > > -     return 0;
> > > -}
> > > -
> > >  static int
> > >  rkisp1_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
> > >  {
> > > @@ -1444,9 +1427,9 @@ static const struct v4l2_ioctl_ops rkisp1_v4l2_ioctl_ops = {
> > >       .vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> > >       .vidioc_streamon = vb2_ioctl_streamon,
> > >       .vidioc_streamoff = vb2_ioctl_streamoff,
> > > -     .vidioc_try_fmt_vid_cap_mplane = rkisp1_try_fmt_vid_cap_mplane,
> > > -     .vidioc_s_fmt_vid_cap_mplane = rkisp1_s_fmt_vid_cap_mplane,
> > > -     .vidioc_g_fmt_vid_cap_mplane = rkisp1_g_fmt_vid_cap_mplane,
> > > +     .vidioc_try_fmt_vid_cap_mplane = rkisp1_adj_fmt_vid_cap_mplane,
> > > +     .vidioc_s_fmt_vid_cap_mplane = rkisp1_adj_fmt_vid_cap_mplane,
> > > +     .vidioc_g_fmt_vid_cap_mplane = video_device_g_fmt_vid,
> > >       .vidioc_enum_fmt_vid_cap = rkisp1_enum_fmt_vid_cap_mplane,
> > >       .vidioc_enum_framesizes = rkisp1_enum_framesizes,
> > >       .vidioc_querycap = rkisp1_querycap,
> > > @@ -1461,8 +1444,10 @@ static int rkisp1_capture_link_validate(struct media_link *link)
> > >       struct v4l2_subdev *sd =
> > >               media_entity_to_v4l2_subdev(link->source->entity);
> > >       struct rkisp1_capture *cap = video_get_drvdata(vdev);
> > > +     const struct v4l2_pix_format_mplane *pixm =
> > > +             &vdev->state.vid_fmt.fmt.pix_mp;
> > >       const struct rkisp1_capture_fmt_cfg *fmt =
> > > -             rkisp1_find_fmt_cfg(cap, cap->pix.fmt.pixelformat);
> > > +             rkisp1_find_fmt_cfg(cap, pixm->pixelformat);
> > >       struct v4l2_subdev_format sd_fmt = {
> > >               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
> > >               .pad = link->source->index,
> > > @@ -1473,16 +1458,16 @@ static int rkisp1_capture_link_validate(struct media_link *link)
> > >       if (ret)
> > >               return ret;
> > >
> > > -     if (sd_fmt.format.height != cap->pix.fmt.height ||
> > > -         sd_fmt.format.width != cap->pix.fmt.width ||
> > > +     if (sd_fmt.format.height != pixm->height ||
> > > +         sd_fmt.format.width != pixm->width ||
> > >           sd_fmt.format.code != fmt->mbus) {
> > >               dev_dbg(cap->rkisp1->dev,
> > >                       "link '%s':%u -> '%s':%u not valid: 0x%04x/%ux%u != 0x%04x/%ux%u\n",
> > >                       link->source->entity->name, link->source->index,
> > >                       link->sink->entity->name, link->sink->index,
> > >                       sd_fmt.format.code, sd_fmt.format.width,
> > > -                     sd_fmt.format.height, fmt->mbus, cap->pix.fmt.width,
> > > -                     cap->pix.fmt.height);
> > > +                     sd_fmt.format.height, fmt->mbus, pixm->width,
> > > +                     pixm->height);
> > >               return -EPIPE;
> > >       }
> > >
> > > @@ -1531,6 +1516,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
> > >       };
> > >       struct v4l2_device *v4l2_dev = &cap->rkisp1->v4l2_dev;
> > >       struct video_device *vdev = &cap->vnode.vdev;
> > > +     struct v4l2_pix_format_mplane *pixm;
> > >       struct rkisp1_vdev_node *node;
> > >       struct vb2_queue *q;
> > >       int ret;
> > > @@ -1548,6 +1534,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
> > >       vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
> > >                           V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
> > >       vdev->entity.ops = &rkisp1_media_ops;
> > > +     set_bit(V4L2_FL_USES_STATE, &vdev->flags);
> > 
> > I think we should introduce an helper in the core that allows drivers
> > to init the device state.
> > 
> > As suggested in the review of patch 1 this could look like
> > 
> >         video_device_state_alloc(size)
> > 
> > Where the framework allocates the state for the driver (allocating the
> > requested size) and then calls a driver's callback to initialize the
> > state.
> 
> Makes sense.

I don't think you should call video_device_state_alloc() from drivers,
as you'll need to allocate try states the same way, and that will be
handled by the V4L2 core. A V4L2_FL_USES_STATE flag seems fine for now.
When we'll implement support for subclassing states, we will add
.alloc_state() and .destroy_state() operations (and possibly
.duplicate_state()), similar to DRM state handling.

> > I'm not 100% sure where the callback (analogue to subdev's
> > .init_state()) should live though.
> > 
> > struct video_device has
> > - const struct v4l2_file_operations *fops;
> > - const struct v4l2_ioctl_ops *ioctl_ops
> > 
> > and in none of these an .init_state() operation would fit well.
> > 
> > It also has
> >         /* callbacks */
> >         void (*release)(struct video_device *vdev);
> > 
> > we could add one
> >         int (*init_state)(struct video_device_state *state);
> > 
> > but it seems pretty rough done this way.
> > 
> > Another option, but I don't think it's right, it's
> > media_entity_operations.
> > 
> > What do you think ?
> 
> Hmm out of all of those options, a dedicated init_state callback in
> video_device seems the best one to me... all the other ones seem out of
> place.

I'd add a video_device_internal_ops structure for that, and store a
pointer to it in video_device.

> > >       video_set_drvdata(vdev, cap);
> > >       vdev->vfl_dir = VFL_DIR_RX;
> > >       node->pad.flags = MEDIA_PAD_FL_SINK;
> > > @@ -1572,6 +1559,13 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
> > >
> > >       vdev->queue = q;
> > >
> > > +     vdev->state.vid_fmt.type = q->type;
> > > +     pixm = &vdev->state.vid_fmt.fmt.pix_mp;
> > > +     pixm->pixelformat = V4L2_PIX_FMT_YUYV;
> > > +     pixm->width = RKISP1_DEFAULT_WIDTH;
> > > +     pixm->height = RKISP1_DEFAULT_HEIGHT;
> > > +     rkisp1_adj_fmt(cap, pixm, &cap->pix.cfg, &cap->pix.info);
> > > +
> > >       ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
> > >       if (ret)
> > >               goto error;
> > > @@ -1598,7 +1592,6 @@ static void
> > >  rkisp1_capture_init(struct rkisp1_device *rkisp1, enum rkisp1_stream_id id)
> > >  {
> > >       struct rkisp1_capture *cap = &rkisp1->capture_devs[id];
> > > -     struct v4l2_pix_format_mplane pixm;
> > >
> > >       memset(cap, 0, sizeof(*cap));
> > >       cap->id = id;
> > > @@ -1616,12 +1609,6 @@ rkisp1_capture_init(struct rkisp1_device *rkisp1, enum rkisp1_stream_id id)
> > >       }
> > >
> > >       cap->is_streaming = false;
> > > -
> > > -     memset(&pixm, 0, sizeof(pixm));
> > > -     pixm.pixelformat = V4L2_PIX_FMT_YUYV;
> > > -     pixm.width = RKISP1_DEFAULT_WIDTH;
> > > -     pixm.height = RKISP1_DEFAULT_HEIGHT;
> > > -     rkisp1_set_fmt(cap, &pixm);
> > >  }
> > >
> > >  int rkisp1_capture_devs_register(struct rkisp1_device *rkisp1)
> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > index ca952fd0829ba7d923ad42fec92840ccd422b6e5..7c1556bc5980f937ff2c503282bb5623283bda1a 100644
> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > @@ -304,7 +304,6 @@ struct rkisp1_device;
> > >   *             handler to stop the streaming by waiting on the 'done' wait queue.
> > >   *             If the irq handler is not called, the stream is stopped by the callback
> > >   *             after timeout.
> > > - * @stride:       the line stride for the first plane, in pixel units
> > >   * @buf.lock:          lock to protect buf.queue
> > >   * @buf.queue:         queued buffer list
> > >   * @buf.dummy:         dummy space to store dropped data
> > > @@ -314,7 +313,6 @@ struct rkisp1_device;
> > >   * @buf.next:          the buffer used for next frame
> > >   * @pix.cfg:   pixel configuration
> > >   * @pix.info:          a pointer to the v4l2_format_info of the pixel format
> > > - * @pix.fmt:   buffer format
> > >   */
> > >  struct rkisp1_capture {
> > >       struct rkisp1_vdev_node vnode;
> > > @@ -325,7 +323,6 @@ struct rkisp1_capture {
> > >       bool is_streaming;
> > >       bool is_stopping;
> > >       wait_queue_head_t done;
> > > -     unsigned int stride;
> > >       struct {
> > >               /* protects queue, curr and next */
> > >               spinlock_t lock;
> > > @@ -337,7 +334,6 @@ struct rkisp1_capture {
> > >       struct {
> > >               const struct rkisp1_capture_fmt_cfg *cfg;
> > >               const struct v4l2_format_info *info;
> > > -             struct v4l2_pix_format_mplane fmt;
> > >       } pix;
> > >  };
> > >

-- 
Regards,

Laurent Pinchart

