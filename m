Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 317E4F47B7
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 12:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389383AbfKHLwT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 06:52:19 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:42054 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733014AbfKHLwS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 06:52:18 -0500
Received: by mail-ed1-f68.google.com with SMTP id m13so4770066edv.9
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2019 03:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IOnxCFh4YN+0QSSZGQhAPojghrwSZUgGpZPmxcpF31E=;
        b=GjMU9TWSMias72NYZf8/pIAPsYqBU2Md+VpsSiGnnatFFveAw6xtOCFAzEi4WXWZHz
         nRfnfimUDj7TuifnpQh3avxk4E2EOp9sjleGFUPM5EGuAX5M85TUlLhYwm1B4mQl9a2c
         0QMn+HUckzrpkgHa6z0QEbNfrdWxRlJE0y1OA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IOnxCFh4YN+0QSSZGQhAPojghrwSZUgGpZPmxcpF31E=;
        b=MCggzVwlE029caACFju1AJFzapmdQlXC5tpKpT94dAwtLRPWGP63NMgcVRvoO39CzU
         N6kGwpqRQlMUGdnHK74h8vqeAtS1XGdy6trNufxjd0BDp1jGiIDimwtoYJpiqbSvFv2+
         +73965ReGUy4LE5lEC7z+rAIkVoPME5fmxb28AgGmFsIKl9tNghcXic9M5QnaLL23cp4
         miMDhor1EKw1YCsIsQpNZLXYXSCtWCGjoFYvM1+f1Cyp8HVko0u49w8RxS4qFavFOTMP
         98GkUiQ+iqrWVARUdCnlwI8oREzNQXpvYwqQaHWxNj6AzwhvmCCg6/NMIHGRlwQscloY
         oz0A==
X-Gm-Message-State: APjAAAV8UTlRYWf1aijCwrRRgX4i0Z3TgXpdHCDRTjfSldfU+mYP9cJ0
        pKOuzp8c1+/8aq/jRVFFHpsOYhheKtGhnQ==
X-Google-Smtp-Source: APXvYqxPeRemRgyxYiO62skw0ReDj49aib9GpGdslTAZ2xAs+L5MmGjpa4XtUUpHmF5bE76FN3PKtg==
X-Received: by 2002:a17:906:1dc4:: with SMTP id v4mr8123809ejh.248.1573213936642;
        Fri, 08 Nov 2019 03:52:16 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id m20sm134671edb.60.2019.11.08.03.52.14
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2019 03:52:14 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id a11so6733511wra.6
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2019 03:52:14 -0800 (PST)
X-Received: by 2002:adf:e505:: with SMTP id j5mr7683403wrm.46.1573213933783;
 Fri, 08 Nov 2019 03:52:13 -0800 (PST)
MIME-Version: 1.0
References: <20191007174505.10681-1-ezequiel@collabora.com>
 <20191007174505.10681-2-ezequiel@collabora.com> <20191108111950.717db5ce@collabora.com>
In-Reply-To: <20191108111950.717db5ce@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 8 Nov 2019 20:52:02 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DiAnP5pc4SoPV3aDM7k71wYmPtAHzN7thquf47EOioHw@mail.gmail.com>
Message-ID: <CAAFQd5DiAnP5pc4SoPV3aDM7k71wYmPtAHzN7thquf47EOioHw@mail.gmail.com>
Subject: Re: [PATCH v2 for 5.4 1/4] media: hantro: Fix s_fmt for dynamic
 resolution changes
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 8, 2019 at 7:20 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Mon,  7 Oct 2019 14:45:02 -0300
> Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> > Commit 953aaa1492c53 ("media: rockchip/vpu: Prepare things to support decoders")
> > changed the conditions under S_FMT was allowed for OUTPUT
> > CAPTURE buffers.
> >
> > However, and according to the mem-to-mem stateless decoder specification,
> > in order to support dynamic resolution changes, S_FMT should be allowed
> > even if OUTPUT buffers have been allocated.
> >
> > Relax decoder S_FMT restrictions on OUTPUT buffers, allowing a resolution
> > modification, provided the pixel format stays the same.
> >
> > Tested on RK3288 platforms using ChromiumOS Video Decode/Encode Accelerator Unittests.
> >
> > Fixes: 953aaa1492c53 ("media: rockchip/vpu: Prepare things to support decoders")
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > --
> > v2:
> > * Call try_fmt_out before using the format,
> >   pointed out by Philipp.
> >
> >  drivers/staging/media/hantro/hantro_v4l2.c | 28 +++++++++++++++-------
> >  1 file changed, 19 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> > index 3dae52abb96c..586d243cc3cc 100644
> > --- a/drivers/staging/media/hantro/hantro_v4l2.c
> > +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> > @@ -367,19 +367,26 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
> >  {
> >       struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> >       struct hantro_ctx *ctx = fh_to_ctx(priv);
> > +     struct vb2_queue *vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> >       const struct hantro_fmt *formats;
> >       unsigned int num_fmts;
> > -     struct vb2_queue *vq;
> >       int ret;
> >
> > -     /* Change not allowed if queue is busy. */
> > -     vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> > -     if (vb2_is_busy(vq))
> > -             return -EBUSY;
> > +     ret = vidioc_try_fmt_out_mplane(file, priv, f);
> > +     if (ret)
> > +             return ret;
> >
> >       if (!hantro_is_encoder_ctx(ctx)) {
> >               struct vb2_queue *peer_vq;
> >
> > +             /*
> > +              * In other to support dynamic resolution change,
>
>                       ^ order
>
> > +              * the decoder admits a resolution change, as long
> > +              * as the pixelformat remains. Can't be done if streaming.
> > +              */
> > +             if (vb2_is_streaming(vq) || (vb2_is_busy(vq) &&
> > +                 pix_mp->pixelformat != ctx->src_fmt.pixelformat))
> > +                     return -EBUSY;
>
> Sorry to chime in only now, but I'm currently looking at the VP9 spec
> and it seems the resolution is allowed to change dynamically [1] (I
> guess the same applies to VP8). IIU the spec correctly, coded frames
> using the new resolution can reference decoded frames using the old
> one (can be higher or lower res BTW). If we force a streamoff to change
> the resolution (as seems to be the case here), we'll lose those ref
> frames (see the hantro_return_bufs() in stop streaming), right?
> Hans, Tomasz, any idea how this dynamic resolution change could/should
> be supported?

The same problem applies to stateful decoders as well. This is an
inherent limitation of the current V4L2 API. To handle this kind of
streams we would have to make the format a per-buffer parameter,
rather than per-queue as it is defined currently.

Best regards,
Tomasz

>
> >               /*
> >                * Since format change on the OUTPUT queue will reset
> >                * the CAPTURE queue, we can't allow doing so
> > @@ -389,12 +396,15 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
> >                                         V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> >               if (vb2_is_busy(peer_vq))
> >                       return -EBUSY;
> > +     } else {
> > +             /*
> > +              * The encoder doesn't admit a format change if
> > +              * there are OUTPUT buffers allocated.
> > +              */
> > +             if (vb2_is_busy(vq))
> > +                     return -EBUSY;
> >       }
> >
> > -     ret = vidioc_try_fmt_out_mplane(file, priv, f);
> > -     if (ret)
> > -             return ret;
> > -
> >       formats = hantro_get_formats(ctx, &num_fmts);
> >       ctx->vpu_src_fmt = hantro_find_format(formats, num_fmts,
> >                                             pix_mp->pixelformat);
>
> [1] Section "5.16 Reference frame scaling" of
>     https://storage.googleapis.com/downloads.webmproject.org/docs/vp9/vp9-bitstream-specification-v0.6-20160331-draft.pdf
