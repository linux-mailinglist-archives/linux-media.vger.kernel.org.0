Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 323C3CFCA5
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 16:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbfJHOn6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 10:43:58 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:35981 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbfJHOn5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 10:43:57 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iHqiS-0001Ok-Mm; Tue, 08 Oct 2019 16:43:56 +0200
Message-ID: <1570545836.18914.10.camel@pengutronix.de>
Subject: Re: [PATCH] media: hantro: relax s_fmt(out) busy error
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sasha Hauer <kernel@pengutronix.de>
Date:   Tue, 08 Oct 2019 16:43:56 +0200
In-Reply-To: <CAHD77HmL-m9TgZJ7GO=E_gBW=Av9D68AY1FTuxBM2sUSQgNPSQ@mail.gmail.com>
References: <20191008123850.641-1-p.zabel@pengutronix.de>
         <CAHD77HmL-m9TgZJ7GO=E_gBW=Av9D68AY1FTuxBM2sUSQgNPSQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On Tue, 2019-10-08 at 23:05 +0900, Tomasz Figa wrote:
> Hi Philipp,
> 
> On Tue, Oct 8, 2019 at 9:38 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> > 
> > Setting the output format resets the capture queue, so we return -EBUSY
> > while the capture queue has buffers allocated. If capture dimensions
> > and pixel format don't change though, we can allow setting the output
> > format without reallocating the capture queue.
> > 
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> > This applies on top of https://patchwork.linuxtv.org/patch/59337/
> > ("media: hantro: Fix s_fmt for dynamic resolution changes").
> > ---
> >  drivers/staging/media/hantro/hantro_v4l2.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> > index 586d243cc3cc..05c3edce27a9 100644
> > --- a/drivers/staging/media/hantro/hantro_v4l2.c
> > +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> > @@ -368,7 +368,7 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
> >         struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> >         struct hantro_ctx *ctx = fh_to_ctx(priv);
> >         struct vb2_queue *vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> > -       const struct hantro_fmt *formats;
> > +       const struct hantro_fmt *raw_vpu_fmt, *formats;
> >         unsigned int num_fmts;
> >         int ret;
> > 
> > @@ -394,8 +394,16 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
> >                  */
> >                 peer_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
> >                                           V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> > -               if (vb2_is_busy(peer_vq))
> > -                       return -EBUSY;
> > +               if (vb2_is_busy(peer_vq)) {
> > +                       formats = hantro_get_formats(ctx, &num_fmts);
> > +                       raw_vpu_fmt = hantro_get_default_fmt(formats, num_fmts,
> > +                                                            false);
> > +
> > +                       if (ctx->dst_fmt.width != pix_mp->width ||
> > +                           ctx->dst_fmt.height != pix_mp->height ||
> > +                           ctx->dst_fmt.pixelformat != raw_vpu_fmt->fourcc)
> 
> First of all, thanks for the patch! I'd like to ask you to clarify a few things:
> 1) What's the use case for S_FMT(OUTPUT) without changing neither
> resolution nor pixelformat?

Userspace that currently does not follow the stateless codec spec
correctly, and allocates capture buffers before setting the output
format because libva:

https://github.com/bootlin/libva-v4l2-request/pull/26

It would be better to lazily allocate the capture buffers when the
context is spun up there, it just seemed strange that S_FMT(OUTPUT)
would error even with identical parameters.

> 2) Is it correct to compare dst_fmt with pix_fmt? My understanding is
> that width/height of the OUTPUT queue is the coded size of the stream
> (a stream parameter), while width/height of the CAPTURE queue is the
> frame buffer size, which can be different from the stream coded size.
> Perhaps we should compare with ctx->src_fmt instead?

A call to hantro_reset_raw_fmt() will set dst_fmt width/height to
src_fmt width/height later in this function, so this should make no
difference.

regards
Philipp
