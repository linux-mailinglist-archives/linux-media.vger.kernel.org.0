Return-Path: <linux-media+bounces-38998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A1FB1D2BB
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 08:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABEDC1AA2282
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 06:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A270225417;
	Thu,  7 Aug 2025 06:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TcVZcez7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286B4222576
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 06:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754549810; cv=none; b=LB7kh8eTzsyFMrCBVfo6eaW1G7X9JcdTkkAflE2e0+q5NZ9wrCjK25jH/UyMk3k4+fRmM2sATb8Nhm1PJXJfL9BENMnDIzoOOoQj1kP+yuukX3E8SNtHVjRXvw/1SXJv6xtrEpII/dGTMec5wwEjQCfQkq90b0RdQSd75FYvVcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754549810; c=relaxed/simple;
	bh=Y92yggbYFi/gIWg6jGgCTaNHZk7vyKjahwbr2sbyubQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=oORUY16jLe1/rkDRA5tkgqtHsAOhzhDt1D/CS3QVxjwi9ASA/7kfLF8r2og+CAEbh+r5jhnuNculAWnW1sakO9hsyTZ5RqH1Pp2UdB/VvJglOSBundq36fh9pOalUf7x3l0iUYjQ7fcjhuoa0RhM/Riwolmiev4IW79ysyaMcgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TcVZcez7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.86.196])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C0031E5F;
	Thu,  7 Aug 2025 08:55:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754549748;
	bh=Y92yggbYFi/gIWg6jGgCTaNHZk7vyKjahwbr2sbyubQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=TcVZcez7Dxyk8WChF2DckZ2GFifcFd17iMyBkkJobxAHMizvkY9kXvJIWsuElriiU
	 CtyqDahPbE54PZXKKDwCr9hqRuRQC9gcvD3U+wJuBfZxyhkWKZeb6PoI/yIQ6KhWTu
	 MdlaYNjX1SIa4V557PNjeMwN4GakmD+kt71YD63Y=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250714171632.GA13846@pendragon.ideasonboard.com>
References: <20250703-vdev-state-v1-0-d647a5e4986d@ideasonboard.com> <20250703-vdev-state-v1-1-d647a5e4986d@ideasonboard.com> <3yifjhhqjrryg2fnfep6yqpxlvc3y5drh54smwajptfzy75tuu@dfsl6g5ktxbw> <175227804873.3930831.3557651361410884449@freya> <20250714171632.GA13846@pendragon.ideasonboard.com>
Subject: Re: [PATCH RFC 1/3] media: v4l2-core: Add support for video device state
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Heiko Stuebner <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Dafna Hirschfeld <dafna@fastmail.com>, linux-media@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 07 Aug 2025 12:26:23 +0530
Message-ID: <175454978334.269012.560122713345103297@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Hi Laurent,

Thanks for the review.

Quoting Laurent Pinchart (2025-07-14 22:46:32)
> On Fri, Jul 11, 2025 at 04:54:08PM -0700, Jai Luthra wrote:
> > Quoting Jacopo Mondi (2025-07-08 09:26:29)
> > > On Thu, Jul 03, 2025 at 06:02:08PM -0700, Jai Luthra wrote:
> > > > Simplify video capture device drivers by maintaining active and try
> > > > states to track the v4l2 formats (for video and metadata capture) o=
f the
> > > > device.
>=20
> I think you should split this patch in two, one introducing the active
> state, and another one introducing the try state.
>=20

Ack.

> > > >
> > > > A lot of boilerplate in the drivers can be reduced by combining the
> > > > implementation of s_fmt and try_fmt hooks, and using a framework he=
lper
> > > > for the g_fmt hook.
> > > >
> > > > To achieve this, we pass the newly introduced state structure to the
> > > > hooks through the already existing private void pointer. For S_FMT,=
 we
> > > > pass the pointer to the active state and enforce that the vb2 queue=
 is
> > > > not busy before calling the driver hook.
>=20
> Is that the right thing to do ? The framework doesn't enforce that
> constraint at the moment and lets drivers implement it. If there's no
> good reason to do so, then the constraint should be enforced by the core
> unconditionally, for all drivers (and that should be split to a patch of
> its own). Otherwise, if there are use cases where a driver could
> meaningfully handle VIDIOC_S_FMT while streaming, we should let drivers
> enforce the constraint.
>=20

I ran a crude script across drivers/media to check this, and about 40% of
the drivers don't have a vb2_is_busy() or vb2_is_streaming() check in their
s_fmt hooks, even though most of them use a vb2 queue:

https://paste.debian.net/1390097/

Out of those missing, quite a few are false negatives, as either their
hooks call a second function for the actual s_fmt operation, which does
have a vb2_is_(busy|streaming) check, or they don't allow setting formats
and reuse the g_fmt function.

The final list of drivers missing any kind of vb2 check is relatively
small:

bttv_s_fmt_vbi_cap (drivers/media/pci/bt8xx/bttv-vbi.c:261) # Has internal =
checks for EBUSY

cx18_s_fmt_vid_cap (drivers/media/pci/cx18/cx18-ioctl.c:121) # Has internal=
 checks for EBUSY
cx18_s_fmt_vbi_cap (drivers/media/pci/cx18/cx18-ioctl.c:330) # Has internal=
 checks for EBUSY
cx18_s_fmt_sliced_vbi_cap (drivers/media/pci/cx18/cx18-ioctl.c:360) # Has i=
nternal checks for EBUSY

cio2_v4l2_s_fmt (drivers/media/pci/intel/ipu3/ipu3-cio2.c:1126)

ivtv_s_fmt_vid_cap (drivers/media/pci/ivtv/ivtv-ioctl.c:567) # Has internal=
 checks for EBUSY
ivtv_s_fmt_vbi_cap (drivers/media/pci/ivtv/ivtv-ioctl.c:598) # Has internal=
 checks for EBUSY
ivtv_s_fmt_sliced_vbi_cap (drivers/media/pci/ivtv/ivtv-ioctl.c:610) # Has i=
nternal checks for EBUSY

ivtv_s_fmt_vid_out (drivers/media/pci/ivtv/ivtv-ioctl.c:629)
ivtv_s_fmt_vid_out_overlay (drivers/media/pci/ivtv/ivtv-ioctl.c:674)

empress_s_fmt_vid_cap (drivers/media/pci/saa7134/saa7134-empress.c:116)
saa7134_s_fmt_vid_cap (drivers/media/pci/saa7134/saa7134-video.c:1107)

tw68_s_fmt_vid_cap (drivers/media/pci/tw68/tw68-video.c:644)

zoran_s_fmt_vid_cap (drivers/media/pci/zoran/zoran_driver.c:510)

allegro_s_fmt_vid_out (drivers/media/platform/allegro-dvt/allegro-core.c:33=
95)

c3_isp_cap_s_fmt_mplane (drivers/media/platform/amlogic/c3/isp/c3-isp-captu=
re.c:435)

wave5_vpu_dec_s_fmt_cap (drivers/media/platform/chips-media/wave5/wave5-vpu=
-dec.c:548)
wave5_vpu_dec_s_fmt_out (drivers/media/platform/chips-media/wave5/wave5-vpu=
-dec.c:679)
wave5_vpu_enc_s_fmt_cap (drivers/media/platform/chips-media/wave5/wave5-vpu=
-enc.c:412)
wave5_vpu_enc_s_fmt_out (drivers/media/platform/chips-media/wave5/wave5-vpu=
-enc.c:516)

isp_video_s_fmt_mplane (drivers/media/platform/samsung/exynos4-is/fimc-isp-=
video.c:414)

sun4i_csi_s_fmt_vid_cap (drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.=
c:141)

vidioc_s_fmt_vid_overlay (drivers/media/platform/ti/omap/omap_vout.c:719)

isp_video_set_format (drivers/media/platform/ti/omap3isp/ispvideo.c:674)
isp_video_set_format (drivers/media/platform/ti/omap3isp/ispvideo.c:674)

vidioc_s_fmt_out_mplane (drivers/media/platform/verisilicon/hantro_v4l2.c:6=
49) # Separate checks for is_streaming/is_busy depending upon encoder vs de=
coder
vidioc_s_fmt_cap_mplane (drivers/media/platform/verisilicon/hantro_v4l2.c:6=
55) # Only encoder checks is_busy

viacam_s_fmt_vid_cap (drivers/media/platform/via/via-camera.c:872)

visl_s_fmt_vid_cap (drivers/media/test-drivers/visl/visl-video.c:492)

vivid_s_fmt_cap (drivers/media/test-drivers/vivid/vivid-core.c:545)
vivid_s_fmt_cap_mplane (drivers/media/test-drivers/vivid/vivid-core.c:575)
vidioc_s_fmt_vid_out (drivers/media/test-drivers/vim2m.c:1047)
vidioc_s_fmt_vid_out_mplane (drivers/media/test-drivers/vim2m.c:1071)
vidioc_s_fmt_vbi_cap (drivers/media/usb/cx231xx/cx231xx-video.c:1455)
vidioc_s_fmt_sliced_vbi_cap (drivers/media/test-drivers/vivid/vivid-vbi-cap=
.h:21)
vidioc_s_fmt_vbi_out (drivers/media/test-drivers/vivid/vivid-vbi-out.h:14)
vidioc_s_fmt_sliced_vbi_out (drivers/media/test-drivers/vivid/vivid-vbi-out=
.h:18)
vidioc_s_fmt_sdr_cap (drivers/media/test-drivers/vivid/vivid-sdr-cap.h:18)
vidioc_s_fmt_vid_out_overlay (drivers/media/test-drivers/vivid/vivid-vid-ou=
t.h:30)

vidioc_s_fmt_vbi_cap (drivers/media/usb/cx231xx/cx231xx-video.c:1455)

pvr2_s_fmt_vid_cap (drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:453)


Quite a few of those are VBI or test drivers. But some relevant cases are
encoders/decoders or ISP drivers that may allow changing resolution or
format mid stream.

So I'm not sure if we can add a framework-level check for this. Let me know
what you think?

> > > > For TRY_FMT, we pass the
> > > > pointer to the temporary state stored in the file handle. Finally, =
we
> > > > introduce a framework helper for the g_fmt hook that the drivers can
> > > > use.
> > > >
> > > > The private void pointer argument already had some rare uses, so we
> > > > switch away from using it in the v4l_*ctrl functions to access
> > > > file->private_data, instead doing that access directly. Some driver=
s'
> > > > hooks might still expect it to point to file->private_data, so we
> > > > replace it with the state pointer only if a driver selects the
> > > > V4L2_FL_USES_STATE flag while registering the device.
> > > >
> > > > State support may be extended in the future to other device types, =
such
> > > > as video/metadata output or M2M devices.
> > > >
> > > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-dev.c   | 32 ++++++++++++++++++++++
> > > >  drivers/media/v4l2-core/v4l2-fh.c    |  1 +
> > > >  drivers/media/v4l2-core/v4l2-ioctl.c | 44 ++++++++++++++++++++++++=
------
> > > >  include/media/v4l2-dev.h             | 52 ++++++++++++++++++++++++=
++++++++++++
> > > >  include/media/v4l2-fh.h              |  5 +++-
> > > >  5 files changed, 125 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l=
2-core/v4l2-dev.c
> > > > index c369235113d98ae26c30a1aa386e7d60d541a66e..b8227d5508dc5bd7757=
06264739e5db2d577f7fd 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > > > @@ -27,6 +27,7 @@
> > > >  #include <linux/uaccess.h>
> > > >
> > > >  #include <media/v4l2-common.h>
> > > > +#include <media/v4l2-dev.h>
> > >=20
> > > v4l2-common includes this already
> >=20
> > Ah okay, somehow clangd wasn't happy with it, will drop this in next re=
vision.
> >=20
> > >=20
> > > >  #include <media/v4l2-device.h>
> > > >  #include <media/v4l2-ioctl.h>
> > > >  #include <media/v4l2-event.h>
> > > > @@ -163,6 +164,34 @@ void video_device_release_empty(struct video_d=
evice *vdev)
> > > >  }
> > > >  EXPORT_SYMBOL(video_device_release_empty);
> > > >
> > > > +int video_device_g_fmt_vid(struct file *file, void *priv,
> > >=20
> > > The function prototype (and documentation) names the second parameter
> > > state.
> > >=20
> >=20
> > Will fix.
> >=20
> > > > +                        struct v4l2_format *fmt)
> > > > +{
> > > > +     struct video_device_state *state =3D priv;
> > > > +
> > > > +     if (WARN_ON_ONCE(!state))
> > > > +             return -EINVAL;
> > > > +
> > > > +     *fmt =3D state->vid_fmt;
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +EXPORT_SYMBOL(video_device_g_fmt_vid);
> > > > +
> > > > +int video_device_g_fmt_meta(struct file *file, void *priv,
> > > > +                         struct v4l2_format *fmt)
> > > > +{
> > > > +     struct video_device_state *state =3D priv;
> > > > +
> > > > +     if (WARN_ON_ONCE(!state))
> > > > +             return -EINVAL;
> > > > +
> > > > +     *fmt =3D state->meta_fmt;
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +EXPORT_SYMBOL(video_device_g_fmt_meta);
> > > > +
> > >=20
> > > These two helpers, and the presence of two struct v4l2_format
> > > 'vid_fmt' and 'meta_fmt' are a bit puzzling to me.
> > >=20
> > > A video device will handle one buffer type and struct v4l2_format
> > > accomodates all type of buffers in the 'fmt' union member.
> > >=20
> > > Why do you store two of them in the video device state ?
> >=20
> > I stored both as I was also looking at RPi CFE video nodes, which suppo=
rts
> > both video and metadata capture in a single video device.
>=20
> That's correct, but not at the same time. The driver should be
> refactored to use a single v4l2_format, and we should have a single
> video_device_g_fmt() helper.
>=20
> > These may explode even more in future for some M2M device with video +
> > metdata. We will have to store and provide helpers for 4 combinations t=
hen,
> > of capture & output formats for both video & metadata usecases.
>=20
> Note the rp1-cfe driver already supports both metadata capture and
> metadata output.
>=20
> > > >  static inline void video_get(struct video_device *vdev)
> > > >  {
> > > >       get_device(&vdev->dev);
> > > > @@ -927,6 +956,9 @@ int __video_register_device(struct video_device=
 *vdev,
> > > >       spin_lock_init(&vdev->fh_lock);
> > > >       INIT_LIST_HEAD(&vdev->fh_list);
> > > >
> > > > +     /* video_device_state support */
> > > > +     vdev->state.which =3D VIDEO_DEVICE_FORMAT_ACTIVE;
> > > > +
> > > >       /* Part 1: check device type */
> > > >       switch (type) {
> > > >       case VFL_TYPE_VIDEO:
> > > > diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2=
-core/v4l2-fh.c
> > > > index 90eec79ee995a2d214590beeacc91b9f8f33236d..d246e05f8ef1244e212=
412caa5c9c6788a5c948a 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-fh.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-fh.c
> > > > @@ -37,6 +37,7 @@ void v4l2_fh_init(struct v4l2_fh *fh, struct vide=
o_device *vdev)
> > > >       INIT_LIST_HEAD(&fh->available);
> > > >       INIT_LIST_HEAD(&fh->subscribed);
> > > >       fh->sequence =3D -1;
> > > > +     fh->state.which =3D VIDEO_DEVICE_FORMAT_TRY;
> > > >       mutex_init(&fh->subscribe_lock);
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(v4l2_fh_init);
> > > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v=
4l2-core/v4l2-ioctl.c
> > > > index 650dc1956f73d2f1943b56c42140c7b8d757259f..78a0db364725ec6641b=
e37d0c4804edb222a9154 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > @@ -21,6 +21,7 @@
> > > >
> > > >  #include <media/media-device.h> /* for media_set_bus_info() */
> > > >  #include <media/v4l2-common.h>
> > > > +#include <media/v4l2-dev.h>
> > > >  #include <media/v4l2-ioctl.h>
> > > >  #include <media/v4l2-ctrls.h>
> > > >  #include <media/v4l2-fh.h>
> > > > @@ -1745,6 +1746,15 @@ static int v4l_s_fmt(const struct v4l2_ioctl=
_ops *ops,
> > > >       if (ret)
> > > >               return ret;
> > > >
> > > > +     /*
> > > > +      * Make sure queue isn't busy for devices that use state, as =
they have a
> > > > +      * single implementation for .s_fmt and .try_fmt, and rely on=
 us to make
> > > > +      * sure the queue is not busy when calling for the .s_fmt case
> > > > +      */
> > > > +     if (test_bit(V4L2_FL_USES_STATE, &vfd->flags) && vfd->queue &&
> > > > +         vb2_is_busy(vfd->queue))
> > > > +             return -EBUSY;
> > > > +
> > > >       ret =3D v4l_enable_media_source(vfd);
> > > >       if (ret)
> > > >               return ret;
> > > > @@ -2293,7 +2303,7 @@ static int v4l_queryctrl(const struct v4l2_io=
ctl_ops *ops,
> > > >       struct v4l2_query_ext_ctrl qec =3D {};
> > > >       struct v4l2_queryctrl *p =3D arg;
> > > >       struct v4l2_fh *vfh =3D
> > > > -             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NU=
LL;
> > > > +             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->p=
rivate_data : NULL;
>=20
> This should be split to a separate patch with a clear commit message.
>=20
> > > >       int ret;
> > > >
> > > >       if (vfh && vfh->ctrl_handler)
> > > > @@ -2318,7 +2328,7 @@ static int v4l_query_ext_ctrl(const struct v4=
l2_ioctl_ops *ops,
> > > >       struct video_device *vfd =3D video_devdata(file);
> > > >       struct v4l2_query_ext_ctrl *p =3D arg;
> > > >       struct v4l2_fh *vfh =3D
> > > > -             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NU=
LL;
> > > > +             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->p=
rivate_data : NULL;
> > > >
> > > >       if (vfh && vfh->ctrl_handler)
> > > >               return v4l2_query_ext_ctrl(vfh->ctrl_handler, p);
> > > > @@ -2335,7 +2345,7 @@ static int v4l_querymenu(const struct v4l2_io=
ctl_ops *ops,
> > > >       struct video_device *vfd =3D video_devdata(file);
> > > >       struct v4l2_querymenu *p =3D arg;
> u> > >       struct v4l2_fh *vfh =3D
> > > > -             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NU=
LL;
> > > > +             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->p=
rivate_data : NULL;
> > > >
> > > >       if (vfh && vfh->ctrl_handler)
> > > >               return v4l2_querymenu(vfh->ctrl_handler, p);
> > > > @@ -2352,7 +2362,7 @@ static int v4l_g_ctrl(const struct v4l2_ioctl=
_ops *ops,
> > > >       struct video_device *vfd =3D video_devdata(file);
> > > >       struct v4l2_control *p =3D arg;
> > > >       struct v4l2_fh *vfh =3D
> > > > -             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NU=
LL;
> > > > +             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->p=
rivate_data : NULL;
> > > >       struct v4l2_ext_controls ctrls;
> > > >       struct v4l2_ext_control ctrl;
> > > >
> > > > @@ -2384,7 +2394,7 @@ static int v4l_s_ctrl(const struct v4l2_ioctl=
_ops *ops,
> > > >       struct video_device *vfd =3D video_devdata(file);
> > > >       struct v4l2_control *p =3D arg;
> > > >       struct v4l2_fh *vfh =3D
> > > > -             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NU=
LL;
> > > > +             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->p=
rivate_data : NULL;
> > > >       struct v4l2_ext_controls ctrls;
> > > >       struct v4l2_ext_control ctrl;
> > > >       int ret;
> > > > @@ -2414,7 +2424,7 @@ static int v4l_g_ext_ctrls(const struct v4l2_=
ioctl_ops *ops,
> > > >       struct video_device *vfd =3D video_devdata(file);
> > > >       struct v4l2_ext_controls *p =3D arg;
> > > >       struct v4l2_fh *vfh =3D
> > > > -             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NU=
LL;
> > > > +             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->p=
rivate_data : NULL;
> > > >
> > > >       p->error_idx =3D p->count;
> > > >       if (vfh && vfh->ctrl_handler)
> > > > @@ -2435,7 +2445,7 @@ static int v4l_s_ext_ctrls(const struct v4l2_=
ioctl_ops *ops,
> > > >       struct video_device *vfd =3D video_devdata(file);
> > > >       struct v4l2_ext_controls *p =3D arg;
> > > >       struct v4l2_fh *vfh =3D
> > > > -             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NU=
LL;
> > > > +             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->p=
rivate_data : NULL;
> > > >
> > > >       p->error_idx =3D p->count;
> > > >       if (vfh && vfh->ctrl_handler)
> > > > @@ -2456,7 +2466,7 @@ static int v4l_try_ext_ctrls(const struct v4l=
2_ioctl_ops *ops,
> > > >       struct video_device *vfd =3D video_devdata(file);
> > > >       struct v4l2_ext_controls *p =3D arg;
> > > >       struct v4l2_fh *vfh =3D
> > > > -             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NU=
LL;
> > > > +             test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? file->p=
rivate_data : NULL;
> > > >
> > > >       p->error_idx =3D p->count;
> > > >       if (vfh && vfh->ctrl_handler)
> > > > @@ -3057,6 +3067,21 @@ void v4l_printk_ioctl(const char *prefix, un=
signed int cmd)
> > > >  }
> > > >  EXPORT_SYMBOL(v4l_printk_ioctl);
> > > >
> > > > +static struct video_device_state *
> > > > +video_device_get_state(struct video_device *vfd, struct v4l2_fh *v=
fh,
> > > > +                    unsigned int cmd, void *arg)
> > > > +{
> > > > +     switch (cmd) {
> > > > +     default:
> > > > +             return NULL;
> > > > +     case VIDIOC_G_FMT:
> > > > +     case VIDIOC_S_FMT:
> > > > +             return &vfd->state;
> > > > +     case VIDIOC_TRY_FMT:
> > > > +             return &vfh->state;
> > > > +     }
> > > > +}
> > > > +
> > > >  static long __video_do_ioctl(struct file *file,
> > > >               unsigned int cmd, void *arg)
> > > >  {
> > > > @@ -3081,6 +3106,9 @@ static long __video_do_ioctl(struct file *fil=
e,
> > > >       if (test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags))
> > > >               vfh =3D file->private_data;
> > > >
> > > > +     if (vfh && test_bit(V4L2_FL_USES_STATE, &vfd->flags))
> > > > +             fh =3D video_device_get_state(vfd, vfh, cmd, arg);
> > > > +
>=20
> That's very dangerous, using the same void pointer for two different
> purposes depending on the USES_STATE flag. I think you should start with
> some refactoring to move away from using a void pointer.
>=20
> The first step is to remove direct setting of file->private_data in
> drivers. Quite a few do so because they need to allocate the structure
> containing the v4l2_fh. They therefore can't call v4l2_fh_open(), which
> sets file->private_data, but call v4l2_fh_init(), set the private_data
> field, and then call v4l2_fh_add(). In many cases it seems
> v4l2_fh_init() could set file->private_data. You will need to check all
> drivers that set the field directly, see if any of them set
> file->private_data to a value different than the v4l2_fh pointer, and if
> that could be fixed.
>=20
> (Note that some drivers set the private_data field of a debugfs file, or
> an ALSA device. Don't mistakenly consider those as direct usage of
> private_data conflicting with V4L2_FL_USES_V4L2_FH.)
>=20
> If we're lucky, we'll be able to remove manual usage of private_data in
> drivers. In that case, we could then either
>=20
> - Patch ioctl handlers in drivers to use file->private_data to access
>   the v4l2_fh and stop using the void *fh argument, and then replace the
>   void *fh argument with a video_device_state *state.
>=20
> - Add a video_device_state *state argument to the ioctl handlers, if we
>   decide to keep the fh pointer. In that case we should replace void *fh
>   with v4l2_fh *fh.
>=20
> If there are drivers left that can't easily stop setting private_data
> manually, let's discuss them.
>=20
> > > >       /*
> > > >        * We need to serialize streamon/off with queueing new reques=
ts.
> > > >        * These ioctls may trigger the cancellation of a streaming
> > > > diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> > > > index 1b6222fab24eda96cbe459b435431c01f7259366..8e6e7799212cd07ae4a=
d3dfc85912c21a9bcab2d 100644
> > > > --- a/include/media/v4l2-dev.h
> > > > +++ b/include/media/v4l2-dev.h
> > > > @@ -89,12 +89,18 @@ struct dentry;
> > > >   *   set by the core when the sub-devices device nodes are registe=
red with
> > > >   *   v4l2_device_register_ro_subdev_nodes() and used by the sub-de=
vice ioctl
> > > >   *   handler to restrict access to some ioctl calls.
> > > > + * @V4L2_FL_USES_STATE:
> > > > + *   indicates that the &struct video_device has state support.
> > > > + *   The active video and metadata formats are stored in video_dev=
ice.state,
> > > > + *   and the try video and metadata formats are stored in v4l2_fh.=
state.
> > > > + *   All new drivers should use it.
> > > >   */
> > > >  enum v4l2_video_device_flags {
> > > >       V4L2_FL_REGISTERED              =3D 0,
> > > >       V4L2_FL_USES_V4L2_FH            =3D 1,
> > > >       V4L2_FL_QUIRK_INVERTED_CROP     =3D 2,
> > > >       V4L2_FL_SUBDEV_RO_DEVNODE       =3D 3,
> > > > +     V4L2_FL_USES_STATE              =3D 4,
> > > >  };
> > > >
> > > >  /* Priority helper functions */
> > > > @@ -214,6 +220,30 @@ struct v4l2_file_operations {
> > > >       int (*release) (struct file *);
> > > >  };
> > > >
> > > > +/**
> > > > + * enum video_device_format_whence - Video device format type
> > > > + *
> > > > + * @V4L2_DEVICE_FORMAT_TRY: from VIDIOC_TRY_FMT, for negotiation o=
nly
> > > > + * @V4L2_DEVICE_FORMAT_ACTIVE: from VIDIOC_S_FMT, applied to the d=
evice
> > > > + */
> > > > +enum video_device_format_whence {
> > > > +     VIDEO_DEVICE_FORMAT_TRY =3D 0,
> > > > +     VIDEO_DEVICE_FORMAT_ACTIVE =3D 1,
> > > > +};
> > >=20
> > > I'm not sure we need these. More on this on the drivers
> > > implementation in the next patches.
>=20
> I agree, this should not be needed at this point. The whole point of
> states is that drivers should not care whether they're operating on a
> TRY or ACTIVE state. There are exceptions with subdevs for historical
> reasons, but we shouldn't repeat that here.
>=20
> It may make sense to later add TRY/ACTIVE identifiers for the UAPI, but
> within drivers they should not be used. How about repurposing the
> .try_fmt() and .s_fmt() ioctl handlers for drivers support states, by
> using .try_fmt() first to adjust the format and store it in the state
> (ACTIVE or TRY, that shouldn't matter to drivers), and then using
> .s_fmt() to apply the state to the device ? The V4L2 core should call
> .try_fmt() first followed by .s_fmt() when V4L2_FL_USES_STATE is set.
> The vast majority of state-aware drivers will configure the device when
> starting streaming, so they won't need to implement .s_fmt().
>=20
> Now that I wrote this, the plan may conflict with my comment above
> regarding leaving the busy check in drivers. Let's figure that one
> first, and see if we need to let drivers known on what state they're
> operating. I think repurposing .try_fmt() and .s_fmt() should be done
> regardless.

I'm not sure splitting makes a lot of sense if we are leaving the
vb2_is_busy checks inside the driver. We might have a scenario where the
active state is updated by .try_fmt() while device is streaming, but it
doesn't get applied till the next STREAMOFF and STREAMON.. which would lead
to wrong format being returned by .g_fmt() during this time.

>=20
> > > > +
> > > > +/**
> > > > + * struct video_device_state - Used for storing video device state=
 information.
> > > > + *
> > > > + * @vid_fmt: Format of the video capture stream
> > > > + * @meta_fmt: Format of the metadata capture stream
> > > > + * @which: is this a TRY or ACTIVE format?
> > > > + */
> > > > +struct video_device_state {
> > > > +     struct v4l2_format vid_fmt;
> > > > +     struct v4l2_format meta_fmt;
> > > > +     enum video_device_format_whence which;
> > > > +};
> > > > +
> > > >  /*
> > > >   * Newer version of video_device, handled by videodev2.c
> > > >   *   This version moves redundant code from video device code to
> > > > @@ -238,6 +268,7 @@ struct v4l2_file_operations {
> > > >   * @queue: &struct vb2_queue associated with this device node. May=
 be NULL.
> > > >   * @prio: pointer to &struct v4l2_prio_state with device's Priorit=
y state.
> > > >   *    If NULL, then v4l2_dev->prio will be used.
> > > > + * @state: &struct video_device_state, holds the active state for =
the device.
> > > >   * @name: video device name
> > > >   * @vfl_type: V4L device type, as defined by &enum vfl_devnode_type
> > > >   * @vfl_dir: V4L receiver, transmitter or m2m
> > > > @@ -283,6 +314,7 @@ struct video_device {
> > > >       struct vb2_queue *queue;
> > > >
> > > >       struct v4l2_prio_state *prio;
> > > > +     struct video_device_state state;
> > >=20
> > > One of the key design requirement it's the ability for drivers to
> > > sub-class video_device_state. One possibile way to obtain this is to
> > > dynamically allocate the state either by deferring to the driver's the
> > > allocation (so that they can allocate a bigger structure) or by
> > > passing to the framework the size it has to allocate.
> > >=20
> > > In any case, I'm afraid the state should be allocated dynamically,
> > > either in the drivers' init_state() (or similar) callback or by the
> > > framework with a size hint from the driver.
> > >=20
> > > What do you think ?
> >=20
> > Ah okay, I missed that. Should be possible to make this dynamically
> > allocatable by the driver. It will also tie into Sakari's suggestion of
> > creating a helper for initializing the state.
>=20
> Yes, I agree with Jacopo and Sakari here. The state should be
> dynamically allocated, and you should add an operation to initialize it.
>=20
> > > >
> > > >       /* device info */
> > > >       char name[64];
> > > > @@ -540,6 +572,26 @@ static inline int video_is_registered(struct v=
ideo_device *vdev)
> > > >       return test_bit(V4L2_FL_REGISTERED, &vdev->flags);
> > > >  }
> > > >
> > > > +/**
> > > > + * video_device_g_fmt_vid() - fill video v4l2_format from the stat=
e.
> > > > + *
> > > > + * @file: pointer to struct file
> > > > + * @state: pointer to video device state
> > > > + * @format: pointer to &struct v4l2_format
> > > > + */
> > > > +int video_device_g_fmt_vid(struct file *file, void *state,
> > > > +                        struct v4l2_format *format);
> > > > +
> > > > +/**
> > > > + * video_device_g_fmt_meta() - fill metadata v4l2_format from the =
state.
> > > > + *
> > > > + * @file: pointer to struct file
> > > > + * @state: pointer to video device state
> > > > + * @format: pointer to &struct v4l2_format
> > > > + */
> > > > +int video_device_g_fmt_meta(struct file *file, void *state,
> > > > +                         struct v4l2_format *format);
> > > > +
> > > >  /**
> > > >   * v4l2_debugfs_root - returns the dentry of the top-level "v4l2" =
debugfs dir
> > > >   *
> > > > diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
> > > > index b5b3e00c8e6a0b082d9cd8a0c972a5094adcb6f2..02579f87ba99d0c849a=
0865f8cc4295446c39f94 100644
> > > > --- a/include/media/v4l2-fh.h
> > > > +++ b/include/media/v4l2-fh.h
> > > > @@ -18,7 +18,8 @@
> > > >  #include <linux/list.h>
> > > >  #include <linux/videodev2.h>
> > > >
> > > > -struct video_device;
> > > > +#include <media/v4l2-dev.h>
> > > > +
>=20
> You will be able to go back to forward declarations once you replace the
> state field below with a pointer.
>=20
> > > >  struct v4l2_ctrl_handler;
> > > >
> > > >  /**
> > > > @@ -28,6 +29,7 @@ struct v4l2_ctrl_handler;
> > > >   * @vdev: pointer to &struct video_device
> > > >   * @ctrl_handler: pointer to &struct v4l2_ctrl_handler
> > > >   * @prio: priority of the file handler, as defined by &enum v4l2_p=
riority
> > > > + * @state: try state used for format negotiation on the video devi=
ce
> > > >   *
> > > >   * @wait: event' s wait queue
> > > >   * @subscribe_lock: serialise changes to the subscribed list; guar=
antee that
> > > > @@ -44,6 +46,7 @@ struct v4l2_fh {
> > > >       struct video_device     *vdev;
> > > >       struct v4l2_ctrl_handler *ctrl_handler;
> > > >       enum v4l2_priority      prio;
> > > > +     struct video_device_state state;
> > > >
> > > >       /* Events */
> > > >       wait_queue_head_t       wait;
> > > >
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

Will fix other comments, and rebase on top of Jacopo's series before
posting v2.

Thanks,
Jai

