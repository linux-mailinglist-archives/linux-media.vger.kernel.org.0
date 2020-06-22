Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7EA920378A
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2020 15:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728510AbgFVNKS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 09:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728377AbgFVNKR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 09:10:17 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 756FDC061794
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 06:10:17 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id k15so12975190otp.8
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 06:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F+fxtByV8XJfBDQUCtfrNN7N2L9LcG9m+MouCilHhEg=;
        b=krWaNh6mktbYPiJFXjhvO2GGm/lh3IAexn5C5zlaHNYtpbtuX6nEX3dHxttasrcEBQ
         r2Ke+i7ksGb0Zg3OHvJLCRpJCmj5t2cPKaC6n/Bu7vNWbIwo7oyAMpXdzNjOz75YkXz9
         FKnRmUSO+pL/YuFF4vDZJ4m0WKsQyvSwGoT0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F+fxtByV8XJfBDQUCtfrNN7N2L9LcG9m+MouCilHhEg=;
        b=UW2SDk83bUARttMnRCmmYF4uroyVUm/9n00lJQZ4TbV0QO7psD4cRvM6noYPh9Dlmj
         27rZgVY94HLCwT5NJCnWeL/+6n0QCFVOTaP9S5Sjwz3gcdwVExs7wADMIQgwTBdvM3ro
         kZyTN4G9XDI78jvy0dDB6hdrb/t0Nnkc4ubYYkCdwzT31w12K6b10+9m7AE9dbVCAxBe
         ZUI6LfYh0JDsrKe36rcowRMKmWnKeyVT7nNdk38LYuRhDOfJ+4r91JWqkxZz+2m0hmAc
         PcFsWbMT1aAeYHWzM/iH2QmgVXT/pzVvdr1WBkZ9OIuNGvt+vGNUo9bv2upBLl3ZOZUP
         1pew==
X-Gm-Message-State: AOAM533dUbDxr+Juve4wpeoezt5fkuET1q1Nq+g6JZqDts7HOb7Gfgx0
        WJUkFH6sOMvuEf9hHsQO1A4Hxgc5ULI=
X-Google-Smtp-Source: ABdhPJynzyxgoe7dsJTSboP7YC7Yj/BwTvH/UUSvsKF7TwLd2YXeSqoDsu9JznRdmvCyA7jgG1vQ9A==
X-Received: by 2002:a9d:1ec2:: with SMTP id n60mr13027423otn.1.1592831414965;
        Mon, 22 Jun 2020 06:10:14 -0700 (PDT)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com. [209.85.161.44])
        by smtp.gmail.com with ESMTPSA id i2sm3257160otr.49.2020.06.22.06.10.13
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2020 06:10:13 -0700 (PDT)
Received: by mail-oo1-f44.google.com with SMTP id e12so3333996oou.2
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 06:10:13 -0700 (PDT)
X-Received: by 2002:a4a:3e48:: with SMTP id t69mr1635161oot.38.1592831412617;
 Mon, 22 Jun 2020 06:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200520082723.96136-1-acourbot@chromium.org> <20200520082723.96136-8-acourbot@chromium.org>
 <1592549952.23952.3.camel@mtksdaap41>
In-Reply-To: <1592549952.23952.3.camel@mtksdaap41>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Mon, 22 Jun 2020 22:10:00 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUiGtbBhfEoCVeTkQe1XrDea7wRUkybxtqQEThtQmJTwQ@mail.gmail.com>
Message-ID: <CAPBb6MUiGtbBhfEoCVeTkQe1XrDea7wRUkybxtqQEThtQmJTwQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] media: mtk-vcodec: venc: remove redundant code
To:     Tiffany Lin <tiffany.lin@mediatek.com>
Cc:     Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 19, 2020 at 3:59 PM Tiffany Lin <tiffany.lin@mediatek.com> wrote:
>
> On Wed, 2020-05-20 at 17:27 +0900, Alexandre Courbot wrote:
> > vidioc_try_fmt() does clamp height and width when called on the OUTPUT
> > queue, so clamping them prior to calling this function is redundant. Set
> > the queue's parameters after calling vidioc_try_fmt() so we can use the
> > values it computed.
> >
>
> vidioc_try_fmt clamps height and width only when f->type ==
> V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
>
> Does this cleanup pass v4l2 compliance test?

It doesn't result in more tests failing at least. :) But although I
cannot test with a pristine upstream version, it seems like some tests
are not passing to begin with. If you have different results with a
true upstream I would like to hear about it. Otherwise I am willing to
help with getting all the tests in the green.

Regarding this particular patch, you are right that we may end up
writing an unclamped size in q_data. It's probably better to drop it
for now.

> I recall compliance test will try different fmt and make sure driver
> response enough information?
>
>
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> >  .../media/platform/mtk-vcodec/mtk_vcodec_enc.c   | 16 ++++------------
> >  1 file changed, 4 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > index 05743a745a11..f0af78f112db 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > @@ -449,7 +449,6 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
> >       struct mtk_q_data *q_data;
> >       int ret, i;
> >       const struct mtk_video_fmt *fmt;
> > -     struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
> >
> >       vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
> >       if (!vq) {
> > @@ -474,20 +473,13 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
> >               f->fmt.pix.pixelformat = fmt->fourcc;
> >       }
> >
> > -     pix_fmt_mp->height = clamp(pix_fmt_mp->height,
> > -                             MTK_VENC_MIN_H,
> > -                             MTK_VENC_MAX_H);
> > -     pix_fmt_mp->width = clamp(pix_fmt_mp->width,
> > -                             MTK_VENC_MIN_W,
> > -                             MTK_VENC_MAX_W);
> > -
> > -     q_data->visible_width = f->fmt.pix_mp.width;
> > -     q_data->visible_height = f->fmt.pix_mp.height;
> > -     q_data->fmt = fmt;
> > -     ret = vidioc_try_fmt(f, q_data->fmt);
> > +     ret = vidioc_try_fmt(f, fmt);
> >       if (ret)
> >               return ret;
> >
> > +     q_data->fmt = fmt;
> > +     q_data->visible_width = f->fmt.pix_mp.width;
> > +     q_data->visible_height = f->fmt.pix_mp.height;
> >       q_data->coded_width = f->fmt.pix_mp.width;
> >       q_data->coded_height = f->fmt.pix_mp.height;
> >
>
