Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA30B2F123C
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 13:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbhAKMXA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 07:23:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbhAKMXA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 07:23:00 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A24FC061794
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 04:22:20 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id m23so17630114ioy.2
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 04:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E3TObj0DpnQ+C6+diTMVXIRK8fmCTHUzn1Fp+y0pweE=;
        b=ZGDMj2yXM/sj19/ajRO5Z3wQwVep6XJ3i5tFwpvUIEBz7202mNkOILo5acwjn/Q/On
         p1HhQRcnCM8uvdlT6VFHgeQcnbTfbQATmu+he4Vn4HBQpgZyKHgW6pyoSdH+TdDoeR53
         q2Vf5u0VpfCoo4pE/BEzVZLGebm7L0rtZiGeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E3TObj0DpnQ+C6+diTMVXIRK8fmCTHUzn1Fp+y0pweE=;
        b=LMc6cljRCRmx4VJjVhWqG2avOjAO1FFgYX82Kfr0UuzAadCNsqr2xz855T9uS8y2gb
         /NusADyPNRZG7cIS/uXCbMM8dMRBgnKhO98Lpeigf8YCWb1CnCug6XgWuOQ51/S/9iDe
         ke5o2NU7rQfs+WafMawC/aHAbzGPw8GeTLy9FLQQ5OEnFy79E1nLs+rcenfAxqKYmYEL
         JGrGjJnYaB5CgHvyigKebGFeSmwzJxyK0XdGIJuMn04ENIrAyUMCyAk/y9QO6teMRExp
         4fWJ8m6XmpBJn90IZybs6usZU2SXeJNljBOje7RDkE+A93tCU+nQbLIxaTYctK8cnNmR
         Bdtg==
X-Gm-Message-State: AOAM532Xv/CIBxGgNXa00ZpyTNnUkHcXexpUIex73962H6jBFQNz2htA
        nbijZd6mmN+kKlfTdKzlEeffBTcyoqm2C4Y2
X-Google-Smtp-Source: ABdhPJxoOGkoMFab0IYmEQTbrZP4suNSy963BbZS24s64gi+Qic966HE4UuXBTlDhXNBmEBpM/+RNQ==
X-Received: by 2002:a05:6638:b16:: with SMTP id a22mr13918266jab.56.1610367739423;
        Mon, 11 Jan 2021 04:22:19 -0800 (PST)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com. [209.85.166.53])
        by smtp.gmail.com with ESMTPSA id h17sm11268418ioz.12.2021.01.11.04.22.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 04:22:18 -0800 (PST)
Received: by mail-io1-f53.google.com with SMTP id z5so17546534iob.11
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 04:22:18 -0800 (PST)
X-Received: by 2002:a6b:c414:: with SMTP id y20mr14242726ioa.150.1610367737624;
 Mon, 11 Jan 2021 04:22:17 -0800 (PST)
MIME-Version: 1.0
References: <20210111113529.45488-1-ribalda@chromium.org> <ef218bf2bd948961079237686b58a00ca1b125bf.camel@collabora.com>
 <CANiDSCsX3k7xeC7Sr2T2SxHqspay+i054rAuv-NYCQpFRNuGeg@mail.gmail.com>
In-Reply-To: <CANiDSCsX3k7xeC7Sr2T2SxHqspay+i054rAuv-NYCQpFRNuGeg@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 11 Jan 2021 13:22:06 +0100
X-Gmail-Original-Message-ID: <CANiDSCuy9MPK8qpwEz4CTta54i6S=k3DsempGLYssU2NtFGM3Q@mail.gmail.com>
Message-ID: <CANiDSCuy9MPK8qpwEz4CTta54i6S=k3DsempGLYssU2NtFGM3Q@mail.gmail.com>
Subject: Re: [PATCH] hantro: Format IOCTLs compliance fixes
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel

On Mon, Jan 11, 2021 at 12:55 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Ezequiel
>
> On Mon, Jan 11, 2021 at 12:48 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> >
> > Hi Ricardo,
> >
> > On Mon, 2021-01-11 at 12:35 +0100, Ricardo Ribalda wrote:
> > > Clear the reserved fields.
> > >
> > > Fixes:
> > >   fail: v4l2-test-formats.cpp(482): pix_mp.plane_fmt[0].reserved not zeroed
> > > test VIDIOC_TRY_FMT: FAIL
> > >   fail: v4l2-test-formats.cpp(482): pix_mp.plane_fmt[0].reserved not zeroed
> > > test VIDIOC_S_FMT: FAIL
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/staging/media/hantro/hantro_v4l2.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> > > index b668a82d40ad..9b384fbffc93 100644
> > > --- a/drivers/staging/media/hantro/hantro_v4l2.c
> > > +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> > > @@ -239,6 +239,7 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
> > >         const struct hantro_fmt *fmt, *vpu_fmt;
> > >         bool capture = V4L2_TYPE_IS_CAPTURE(type);
> > >         bool coded;
> > > +       int i;
> > >
> > >         coded = capture == ctx->is_encoder;
> > >
> > > @@ -293,6 +294,10 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
> > >                         pix_mp->width * pix_mp->height * fmt->max_depth;
> > >         }
> > >
> > > +       for (i = 0; i < pix_mp->num_planes; i++)
> > > +               memset(pix_mp->plane_fmt[i].reserved, 0,
> > > +                      sizeof(pix_mp->plane_fmt[i].reserved));
> > > +
> >
> > This looks like something that should be handled at the core,
> > probably in drivers/media/v4l2-core/v4l2-ioctl.c::v4l_try_fmt().
>
> The core does clear the reserved field from v4l2_pix_format_mplane,

My bad, It is also clearing the per plane reserved field. I was
testing in an old kernel.

The grep it is still valid though. We can remove all the memsets in the drivers.

> but not the reserved field for every plane. I can try to add it to the
> core as well. At least these drivers have code duplication:



>
> git grep reserved | grep memset | grep plane_fmt
> drivers/media/pci/intel/ipu3/ipu3-cio2.c:
> memset(mpix->plane_fmt[0].reserved, 0,
> drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c:
> memset(pix_mp->plane_fmt[i].reserved, 0,
> drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c:
> memset(&(pix_fmt_mp->plane_fmt[i].reserved[0]), 0x0,
> drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c:
> memset(&(pix_fmt_mp->plane_fmt[i].reserved[0]), 0x0,
> drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c:
> memset(&(pix->plane_fmt[i].reserved[0]), 0x0,
> drivers/media/platform/rcar_fdp1.c:
> memset(pix->plane_fmt[i].reserved, 0,
> drivers/media/platform/rcar_fdp1.c:
> memset(pix->plane_fmt[2].reserved, 0,
> drivers/media/platform/rcar_jpu.c:
> memset(pix->plane_fmt[0].reserved, 0,
> drivers/media/platform/rcar_jpu.c:
> memset(pix->plane_fmt[i].reserved, 0,
> drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c:
> memset(pix->plane_fmt[i].reserved, 0,
> drivers/media/platform/ti-vpe/vpe.c:
> memset(plane_fmt->reserved, 0, sizeof(plane_fmt->reserved));
> drivers/media/test-drivers/vicodec/vicodec-core.c:
> memset(pix_mp->plane_fmt[0].reserved, 0,
> drivers/staging/media/hantro/hantro_v4l2.c:
> memset(pix_mp->plane_fmt[i].reserved, 0,
> drivers/staging/media/ipu3/ipu3-v4l2.c: memset(pixm->plane_fmt[0].reserved, 0,
>
> >
> > Thanks,
> > Ezequiel
> >
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
