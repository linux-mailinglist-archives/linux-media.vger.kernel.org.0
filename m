Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 766E616A829
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2020 15:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbgBXORp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Feb 2020 09:17:45 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54452 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727281AbgBXORp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Feb 2020 09:17:45 -0500
Received: by mail-wm1-f67.google.com with SMTP id z12so5955494wmi.4
        for <linux-media@vger.kernel.org>; Mon, 24 Feb 2020 06:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CXiT4FOI1YGAg1TPfgtXwM0+gqouE7vfcGDjpYsbl1s=;
        b=rjSmR0Mw0sh435wVrQg5nvrNKMlM+gQGkNot9kS+pvURrXO9fAR3FpLt/BCVgFShjE
         bnaBixYQb5l7UIIzPsTW+imKwL7KNuJVCqWAb3ibnEm5AnZuRKkcRPayLiux3FlVXLhi
         4AYylIjHShX3T089qZQEZVWHX+qkFjISXqPWGjuCAErJCZpd98VG0ceZvOwMgB87yUOc
         6Ku5oERpbJ4KEOHCD17eTeDNoZRp1tiki1nqw6Urx+y18me/qgPlq5rJA7xmpXrkn56e
         QIhq8caWobGUyXMtSe45J+8PsanRGtmGYuxCC2zhOcd992UTq1TfoaaqLT0O2G/vM3Yj
         9Beg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CXiT4FOI1YGAg1TPfgtXwM0+gqouE7vfcGDjpYsbl1s=;
        b=L1VIDpmS4hQkj6oarn2PEAzxECizrKkNRefHNaEqSlvmVhlx2HCuaswsGlLjbuN1Ho
         CRQ4zHy5dZBdclt/xR9Z2BolwoefEw7Fue6L5M0B+0eGbkczwkzmbM7LbVEIkOlJeb4H
         YOxBaCKKyyi0KrL+5rniPjgvwpl7wvC3hWr3GIyhpsjG3ZWf//AzRAjEvVeBU7GvJqnj
         EuKPPzEAVHUOqNIogrLdjBOg1m+aDQsIlvACk8kJXB9T7J3AGg5y9bhU456SLwh7w3Ns
         4IFo7dh4tw37BuMoMrXBwcdNp4EH5eM7vVnmjQWp/C7HFn6/kosjeL4AHzl8+yvt9fFk
         cO/g==
X-Gm-Message-State: APjAAAWpVGoh9tNDxC62weAGLA33IUGLFLyexsIw80FPd3/gOgTiFoao
        hPK1Emqb2Fhu/t4gWd/+EfEG0XEHpbeso9kTHPjKjA==
X-Google-Smtp-Source: APXvYqxujsU2o4CjbciXhRdSnE1J9L7rYWLOFBa3v0osbFCo9P99RLzfhOvwrPP3CZHqsETgq5UhbR061zzCwLG9/IE=
X-Received: by 2002:a1c:66d6:: with SMTP id a205mr22163096wmc.10.1582553862129;
 Mon, 24 Feb 2020 06:17:42 -0800 (PST)
MIME-Version: 1.0
References: <20191008091119.7294-1-boris.brezillon@collabora.com> <20191008091119.7294-2-boris.brezillon@collabora.com>
In-Reply-To: <20191008091119.7294-2-boris.brezillon@collabora.com>
From:   Maxime Jourdan <mjourdan@baylibre.com>
Date:   Mon, 24 Feb 2020 15:17:31 +0100
Message-ID: <CAMO6nayxqZnHnKmUw3szoieomEpphtLNn=_HL5F-OgJiz5FxMQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/6] media: v4l2: Extend pixel formats to unify
 single/multi-planar handling (and more)
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Brian Starkey <Brian.Starkey@arm.com>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Boris,
On Tue, Oct 8, 2019 at 11:11 AM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> This is part of the multiplanar and singleplanar unification process.
> v4l2_ext_pix_format is supposed to work for both cases.
>
> We also add the concept of modifiers already employed in DRM to expose
> HW-specific formats (like tiled or compressed formats) and allow
> exchanging this information with the DRM subsystem in a consistent way.
>
> Note that V4L2_BUF_TYPE_VIDEO[_OUTPUT]_OVERLAY and
> V4L2_BUF_TYPE_VIDEO_{CAPTURE,OUTPUT}_MPLANE types are no longer accepted
> in v4l2_ext_format and will be rejected if you use the {G,S,TRY}EXT_FMT
> ioctls. V4L2_BUF_TYPE_VIDEO_{CAPTURE,OUTPUT}_MPLANE is dropped as part
> of the multiplanar/singleplanar unification.
> V4L2_BUF_TYPE_VIDEO[_OUTPUT]_OVERLAY seems to be used mostly on old
> drivers and supporting it would require some extra rework.
>
> New hooks have been added to v4l2_ioctl_ops to support those new ioctls
> in drivers, but, in the meantime, the core takes care of converting
> {S,G,TRY}_EXT_FMT requests into {S,G,TRY}_FMT so that old drivers can
> still work if the userspace app/lib uses the new ioctls.
> The conversion is also done the other around to allow userspace
> apps/libs using {S,G,TRY}_FMT to work with drivers implementing the
> _ext_ hooks.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v3:
> - Rebased on top of media/master (post 5.4-rc1)
>
> Changes in v2:
> - Move the modifier in v4l2_ext_format (was formerly placed in
>   v4l2_ext_plane)
> - Fix a few bugs in the converters and add a strict parameter to
>   allow conversion of uninitialized/mis-initialized objects
> ---
>  drivers/media/v4l2-core/v4l2-dev.c   |  24 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c | 699 ++++++++++++++++++++++++---
>  include/media/v4l2-ioctl.h           |  33 ++
>  include/uapi/linux/videodev2.h       |  81 ++++
>  4 files changed, 754 insertions(+), 83 deletions(-)
>
<snip>
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 51b912743f0f..78e14c1dc76f 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
<snip>
> @@ -1044,6 +1128,197 @@ static void v4l_sanitize_format(struct v4l2_format *fmt)
>                sizeof(fmt->fmt.pix) - offset);
>  }
>
> +int v4l2_ext_format_to_format(const struct v4l2_ext_format *e,
> +                             struct v4l2_format *f, bool mplane_cap,
> +                             bool strict)
> +{
> +       const struct v4l2_plane_ext_pix_format *pe;
> +       struct v4l2_plane_pix_format *p;
> +       unsigned int i;
> +
> +       memset(f, 0, sizeof(*f));
> +
> +       switch (e->type) {
> +       case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> +       case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> +               /*
> +                * Make sure no modifier is required before doing the
> +                * conversion.
> +                */
> +               if (e->fmt.pix.modifier && strict)
> +                       return -EINVAL;

In my driver, I set the modifier of regular pixel formats to
DRM_FORMAT_MOD_LINEAR, which conflicted with this check.

IMHO this check should be dropped entirely in case userspace is
already handling the modifiers itself using the previous V4L format
API.

> +
> +               if ((e->fmt.pix.num_planes > VIDEO_MAX_PLANES ||
> +                    !e->fmt.pix.num_planes) && strict)
> +                       return -EINVAL;
> +
<snip>
> @@ -1466,6 +1741,38 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>         return ret;
>  }
>
> +static int v4l_g_fmt_ext_pix(const struct v4l2_ioctl_ops *ops,
> +                            struct file *file, void *fh,
> +                            struct v4l2_format *f)
> +{
> +       struct v4l2_ext_format ef = {
> +               .type = f->type,

This can set ef.type to an invalid value
(V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE or
V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) which will have adverse effects
later on.

> +       };
> +       int ret;
> +
> +       switch (f->type) {
> +       case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> +       case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +               ret = ops->vidioc_g_ext_fmt_vid_cap(file, fh, &ef.fmt.pix);
> +               break;
> +
> +       case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> +       case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +               ret = ops->vidioc_g_ext_fmt_vid_out(file, fh, &ef.fmt.pix);
> +               break;
> +
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       if (ret)
> +               return ret;
> +
> +       return v4l2_ext_format_to_format(&ef, f,
> +                                        V4L2_TYPE_IS_MULTIPLANAR(f->type),
> +                                        true);
> +}
> +
>  static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
>                                 struct file *file, void *fh, void *arg)
>  {
<snip>

I picked up on this patch since I wanted to add DRM modifiers to the
format API, so that we could do a V4L -> Userspace -> DRM pipeline
that included modifiers from start to end. I was glad to find yours,
thanks!
Overall the driver transition was very smooth and apart from the 2
issues I encountered, userspace (ffmpeg using v4l2 decoding in this
case) kept working nicely using the previous format API.

Regarding ENUM_FMT, I feel like it should expose DRM modifiers as
well. The driver would fill that field with all possible combinations
(xor'd) of modifiers for a specific pixfmt.

Regards,
Maxime
