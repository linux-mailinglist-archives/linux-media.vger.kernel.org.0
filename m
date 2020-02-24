Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C31B16A8FD
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2020 15:58:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727909AbgBXO6m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Feb 2020 09:58:42 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56302 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727841AbgBXO6f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Feb 2020 09:58:35 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 340182961E8;
        Mon, 24 Feb 2020 14:58:33 +0000 (GMT)
Date:   Mon, 24 Feb 2020 15:58:30 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Maxime Jourdan <mjourdan@baylibre.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Brian Starkey <Brian.Starkey@arm.com>, kernel@collabora.com
Subject: Re: [RFC PATCH v3 1/6] media: v4l2: Extend pixel formats to unify
 single/multi-planar handling (and more)
Message-ID: <20200224155830.0c4005e8@collabora.com>
In-Reply-To: <CAMO6nayxqZnHnKmUw3szoieomEpphtLNn=_HL5F-OgJiz5FxMQ@mail.gmail.com>
References: <20191008091119.7294-1-boris.brezillon@collabora.com>
        <20191008091119.7294-2-boris.brezillon@collabora.com>
        <CAMO6nayxqZnHnKmUw3szoieomEpphtLNn=_HL5F-OgJiz5FxMQ@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 24 Feb 2020 15:17:31 +0100
Maxime Jourdan <mjourdan@baylibre.com> wrote:

> Hi Boris,
> On Tue, Oct 8, 2019 at 11:11 AM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > This is part of the multiplanar and singleplanar unification process.
> > v4l2_ext_pix_format is supposed to work for both cases.
> >
> > We also add the concept of modifiers already employed in DRM to expose
> > HW-specific formats (like tiled or compressed formats) and allow
> > exchanging this information with the DRM subsystem in a consistent way.
> >
> > Note that V4L2_BUF_TYPE_VIDEO[_OUTPUT]_OVERLAY and
> > V4L2_BUF_TYPE_VIDEO_{CAPTURE,OUTPUT}_MPLANE types are no longer accepted
> > in v4l2_ext_format and will be rejected if you use the {G,S,TRY}EXT_FMT
> > ioctls. V4L2_BUF_TYPE_VIDEO_{CAPTURE,OUTPUT}_MPLANE is dropped as part
> > of the multiplanar/singleplanar unification.
> > V4L2_BUF_TYPE_VIDEO[_OUTPUT]_OVERLAY seems to be used mostly on old
> > drivers and supporting it would require some extra rework.
> >
> > New hooks have been added to v4l2_ioctl_ops to support those new ioctls
> > in drivers, but, in the meantime, the core takes care of converting
> > {S,G,TRY}_EXT_FMT requests into {S,G,TRY}_FMT so that old drivers can
> > still work if the userspace app/lib uses the new ioctls.
> > The conversion is also done the other around to allow userspace
> > apps/libs using {S,G,TRY}_FMT to work with drivers implementing the
> > _ext_ hooks.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > Changes in v3:
> > - Rebased on top of media/master (post 5.4-rc1)
> >
> > Changes in v2:
> > - Move the modifier in v4l2_ext_format (was formerly placed in
> >   v4l2_ext_plane)
> > - Fix a few bugs in the converters and add a strict parameter to
> >   allow conversion of uninitialized/mis-initialized objects
> > ---
> >  drivers/media/v4l2-core/v4l2-dev.c   |  24 +-
> >  drivers/media/v4l2-core/v4l2-ioctl.c | 699 ++++++++++++++++++++++++---
> >  include/media/v4l2-ioctl.h           |  33 ++
> >  include/uapi/linux/videodev2.h       |  81 ++++
> >  4 files changed, 754 insertions(+), 83 deletions(-)
> >  
> <snip>
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 51b912743f0f..78e14c1dc76f 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c  
> <snip>
> > @@ -1044,6 +1128,197 @@ static void v4l_sanitize_format(struct v4l2_format *fmt)
> >                sizeof(fmt->fmt.pix) - offset);
> >  }
> >
> > +int v4l2_ext_format_to_format(const struct v4l2_ext_format *e,
> > +                             struct v4l2_format *f, bool mplane_cap,
> > +                             bool strict)
> > +{
> > +       const struct v4l2_plane_ext_pix_format *pe;
> > +       struct v4l2_plane_pix_format *p;
> > +       unsigned int i;
> > +
> > +       memset(f, 0, sizeof(*f));
> > +
> > +       switch (e->type) {
> > +       case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> > +       case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> > +               /*
> > +                * Make sure no modifier is required before doing the
> > +                * conversion.
> > +                */
> > +               if (e->fmt.pix.modifier && strict)
> > +                       return -EINVAL;  
> 
> In my driver, I set the modifier of regular pixel formats to
> DRM_FORMAT_MOD_LINEAR, which conflicted with this check.

I guess we could check for != MOD_LINEAR && != MOD_INVALID.

> 
> IMHO this check should be dropped entirely in case userspace is
> already handling the modifiers itself using the previous V4L format
> API.

I'm not sure. Shouldn't we catch cases where the ext -> !ext format
conversion implies information loss?

> 
> > +
> > +               if ((e->fmt.pix.num_planes > VIDEO_MAX_PLANES ||
> > +                    !e->fmt.pix.num_planes) && strict)
> > +                       return -EINVAL;
> > +  
> <snip>
> > @@ -1466,6 +1741,38 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
> >         return ret;
> >  }
> >
> > +static int v4l_g_fmt_ext_pix(const struct v4l2_ioctl_ops *ops,
> > +                            struct file *file, void *fh,
> > +                            struct v4l2_format *f)
> > +{
> > +       struct v4l2_ext_format ef = {
> > +               .type = f->type,  
> 
> This can set ef.type to an invalid value
> (V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE or
> V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) which will have adverse effects
> later on.

Oops, indeed. MPLANE formats should be reduced to their !MPLANE
equivalent.

> 
> > +       };
> > +       int ret;
> > +
> > +       switch (f->type) {
> > +       case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> > +       case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> > +               ret = ops->vidioc_g_ext_fmt_vid_cap(file, fh, &ef.fmt.pix);
> > +               break;
> > +
> > +       case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> > +       case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> > +               ret = ops->vidioc_g_ext_fmt_vid_out(file, fh, &ef.fmt.pix);
> > +               break;
> > +
> > +       default:
> > +               return -EINVAL;
> > +       }
> > +
> > +       if (ret)
> > +               return ret;
> > +
> > +       return v4l2_ext_format_to_format(&ef, f,
> > +                                        V4L2_TYPE_IS_MULTIPLANAR(f->type),
> > +                                        true);
> > +}
> > +
> >  static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
> >                                 struct file *file, void *fh, void *arg)
> >  {  
> <snip>
> 
> I picked up on this patch since I wanted to add DRM modifiers to the
> format API, so that we could do a V4L -> Userspace -> DRM pipeline
> that included modifiers from start to end. I was glad to find yours,
> thanks!
> Overall the driver transition was very smooth and apart from the 2
> issues I encountered, userspace (ffmpeg using v4l2 decoding in this
> case) kept working nicely using the previous format API.
> 
> Regarding ENUM_FMT, I feel like it should expose DRM modifiers as
> well. The driver would fill that field with all possible combinations
> (xor'd) of modifiers for a specific pixfmt.

You might want to have a look at [1] (a few adjustments have been
suggested during the last media summit).

[1]https://lore.kernel.org/linux-media/CAAFQd5AN1nCWwtGVRp0BasQHZvXwesMx4g2FU=KL4ZyZzPq81g@mail.gmail.com/T/
