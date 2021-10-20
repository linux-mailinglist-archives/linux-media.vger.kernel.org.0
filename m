Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3774349C2
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 13:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbhJTLJb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 07:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbhJTLJa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 07:09:30 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C60C06161C
        for <linux-media@vger.kernel.org>; Wed, 20 Oct 2021 04:07:13 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id t16so24750333eds.9
        for <linux-media@vger.kernel.org>; Wed, 20 Oct 2021 04:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1ws8ir5ko7b0963hak0dKo3NQDeBkVKurbFdaZzXm40=;
        b=XX4I+Zqs/y42xREnKW33FnJsaDsPetXdcY/7GGlC90XtyZU+q0bY5l687mIPUxv7j2
         DyerOXdh/LMpsQ0EgxNZlUQlzDWXdeKzfdgmM+6Uv7FqNP3/qi/p58U0NfDejq9dhuCf
         k2M0RhUDDnGBZaAAoMQDOnyiXQvh0YF+WieyYnCLouQTjiVFmyKIKjs8jLOBCo5DVeDZ
         Ti/kpyFvrVJ6rfajCvVYRIfyh4FtnjhVGOUDDSRxMa9aBJU1ddLv9E35dc4WqU59mCO4
         VNa0UDF/lKtcZNBWLLM8VQhz+MkroCG/et2MfxxggLlXoxBodVEjSsEOZD94svYGOxCW
         0pbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1ws8ir5ko7b0963hak0dKo3NQDeBkVKurbFdaZzXm40=;
        b=uHOclc/tj5yQScvUyc2ev2OALetqIe6kz0mfYWQ6VkeeG+Qyb8/VuaQVpPHBOkUjyM
         OjC554e0tP3NbAXPppAzwXxx4t3GkT8rt1659lY+BQU/MGuG/etTVPndbP8a8LXL6vfp
         PW/oi117AMmXnMaJvqQJ+L8r7oMm83QX0dT6WDHFq9q+rNL7M7isvdgv5sKqE2Arroe9
         wlrChqA3J47ZkhcELlPnWBmPcterhymFL6KzFsHb4DFI43twj9bSCqzBzAwtSu7mVLcv
         12StQ2AaT0rqKSBFZb/8X/MChELzNlKB4ohbc8fs6Swch2t17C65zfPr70DuBwPcJ4fO
         YmNw==
X-Gm-Message-State: AOAM531WLT+PyqEWTB4DKHQX/7EOkww72eYa8e3e/FsLNPf5pQ1+CGGZ
        rTbNB3Ilc6ETGQJ0WcuJu/77VSURDe3YhN1BWQ0l1A==
X-Google-Smtp-Source: ABdhPJxtvbwU5/cek1swkiwSJlnKeKc0aRlKBlFXx+3wtzS/wsdMQAOZjGPJ5fdvUyy9ZqsH1yof6w52yPU+GPQX5PE=
X-Received: by 2002:a17:906:3944:: with SMTP id g4mr46487185eje.426.1634728031784;
 Wed, 20 Oct 2021 04:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210929160439.6601-1-andrzej.p@collabora.com>
 <3448839.R56niFO833@kista> <84fd4395-5cac-c933-7639-dd3cd844a9cf@collabora.com>
 <11847752.O9o76ZdvQC@kista>
In-Reply-To: <11847752.O9o76ZdvQC@kista>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Wed, 20 Oct 2021 08:06:59 -0300
Message-ID: <CAAEAJfBYwbUrjUFvs70u8YkuBgrCK6LuYdT9Y2Om7OLo6_cV1g@mail.gmail.com>
Subject: Re: Re: [PATCH v7 11/11] media: hantro: Support NV12 on the G2 core
To:     =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jernej,

On Tue, 19 Oct 2021 at 13:38, Jernej =C5=A0krabec <jernej.skrabec@gmail.com=
> wrote:
>
> Hi Andrzej!
>
> Dne petek, 15. oktober 2021 ob 19:19:47 CEST je Andrzej Pietrasiewicz
> napisal(a):
> > Hi Jernej,
> >
> > W dniu 14.10.2021 o 19:42, Jernej =C5=A0krabec pisze:
> > > Hi Andrzej!
> > >
> > > Dne sreda, 29. september 2021 ob 18:04:39 CEST je Andrzej Pietrasiewi=
cz
> > > napisal(a):
> > >> The G2 decoder block produces NV12 4x4 tiled format (NV12_4L4).
> > >> Enable the G2 post-processor block, in order to produce regular NV12=
.
> > >>
> > >> The logic in hantro_postproc.c is leveraged to take care of allocati=
ng
> > >> the extra buffers and configure the post-processor, which is
> > >> significantly simpler than the one on the G1.
> > >
> > > Quick summary of discussion on LibreELEC Slack:
> > > When using NV12 format on Allwinner H6 variant of G2 (needs some driv=
er
> > > changes), I get frames out of order. If I use native NV12 tiled forma=
t,
> frames
> > > are ordered correctly.
> > >
> > > Currently I'm not sure if this is issue with my changes or is this ge=
neral
> > > issue.
> > >
> > > I would be grateful if anyone can test frame order with and without
> > > postprocessing enabled on imx8. Take some dynamic video with a lot of
> short
> > > scenes. It's pretty obvious when frames are out of order.
> > >
> >
> > I checked on imx8 and cannot observe any such artifacts.
>
> I finally found the issue. As you mentioned on Slack, register write orde=
r once
> already affected decoding. Well, it's the case again. I made hacky test a=
nd
> moved postproc enable call after output buffers are set and it worked. So=
, this
> is actually core quirk which is obviously fixed in newer variants.
>

Ugh, good catch.

What happens if you move all the calls to HANTRO_PP_REG_WRITE_S
(HANTRO_PP_REG_WRITE does a relaxed write)?

Or what happens if the HANTRO_PP_REG_WRITE(vpu, out_luma_base, dst_dma)
is moved to be done after all the other registers?

> This makes this series with minor adaptations completely working on H6. I=
 see
> no reason not to merge whole series.
>

Do you have plans to submit your H6 work on top of this?

Thanks,
Ezequiel


> Thanks for testing.
>
> Best regards,
> Jernej
>
> >
> > Andrzej
> >
> > > However, given that frames themself are correctly decoded and without
> > > postprocessing in right order, that shouldn't block merging previous
> patches.
> > > I tried few different videos and frames were all decoded correctly.
> > >
> > > Best regards,
> > > Jernej
> > >
> > >>
> > >> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > >> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> > >> ---
> > >>   .../staging/media/hantro/hantro_g2_vp9_dec.c  |  6 ++--
> > >>   drivers/staging/media/hantro/hantro_hw.h      |  1 +
> > >>   .../staging/media/hantro/hantro_postproc.c    | 31 +++++++++++++++=
++++
> > >>   drivers/staging/media/hantro/imx8m_vpu_hw.c   | 11 +++++++
> > >>   4 files changed, 46 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/drivers/staging/media/hantro/hantro_g2_vp9_dec.c b/driv=
ers/
> > > staging/media/hantro/hantro_g2_vp9_dec.c
> > >> index 7f827b9f0133..1a26be72c878 100644
> > >> --- a/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
> > >> +++ b/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
> > >> @@ -152,7 +152,7 @@ static void config_output(struct hantro_ctx *ctx=
,
> > >>    hantro_reg_write(ctx->dev, &g2_out_dis, 0);
> > >>    hantro_reg_write(ctx->dev, &g2_output_format, 0);
> > >>
> > >> -  luma_addr =3D vb2_dma_contig_plane_dma_addr(&dst->base.vb.vb2_buf=
,
> > > 0);
> > >> +  luma_addr =3D hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf)=
;
> > >>    hantro_write_addr(ctx->dev, G2_OUT_LUMA_ADDR, luma_addr);
> > >>
> > >>    chroma_addr =3D luma_addr + chroma_offset(ctx, dec_params);
> > >> @@ -191,7 +191,7 @@ static void config_ref(struct hantro_ctx *ctx,
> > >>    hantro_reg_write(ctx->dev, &ref_reg->hor_scale, (refw << 14) /
> > > dst->vp9.width);
> > >>    hantro_reg_write(ctx->dev, &ref_reg->ver_scale, (refh << 14) /
> > > dst->vp9.height);
> > >>
> > >> -  luma_addr =3D vb2_dma_contig_plane_dma_addr(&buf->base.vb.vb2_buf=
,
> > > 0);
> > >> +  luma_addr =3D hantro_get_dec_buf_addr(ctx, &buf->base.vb.vb2_buf)=
;
> > >>    hantro_write_addr(ctx->dev, ref_reg->y_base, luma_addr);
> > >>
> > >>    chroma_addr =3D luma_addr + chroma_offset(ctx, dec_params);
> > >> @@ -236,7 +236,7 @@ static void config_ref_registers(struct hantro_c=
tx
> *ctx,
> > >>    config_ref(ctx, dst, &ref_regs[1], dec_params, dec_params-
> > >> golden_frame_ts);
> > >>    config_ref(ctx, dst, &ref_regs[2], dec_params, dec_params-
> > >> alt_frame_ts);
> > >>
> > >> -  mv_addr =3D vb2_dma_contig_plane_dma_addr(&mv_ref->base.vb.vb2_bu=
f,
> > > 0) +
> > >> +  mv_addr =3D hantro_get_dec_buf_addr(ctx, &mv_ref->base.vb.vb2_buf=
) +
> > >>              mv_offset(ctx, dec_params);
> > >>    hantro_write_addr(ctx->dev, G2_REF_MV_ADDR(0), mv_addr);
> > >>
> > >> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/stag=
ing/
> > > media/hantro/hantro_hw.h
> > >> index 2961d399fd60..3d4a5dc1e6d5 100644
> > >> --- a/drivers/staging/media/hantro/hantro_hw.h
> > >> +++ b/drivers/staging/media/hantro/hantro_hw.h
> > >> @@ -274,6 +274,7 @@ extern const struct hantro_variant
> rk3399_vpu_variant;
> > >>   extern const struct hantro_variant sama5d4_vdec_variant;
> > >>
> > >>   extern const struct hantro_postproc_ops hantro_g1_postproc_ops;
> > >> +extern const struct hantro_postproc_ops hantro_g2_postproc_ops;
> > >>
> > >>   extern const u32 hantro_vp8_dec_mc_filter[8][6];
> > >>
> > >> diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/driver=
s/
> > > staging/media/hantro/hantro_postproc.c
> > >> index 4549aec08feb..79a66d001738 100644
> > >> --- a/drivers/staging/media/hantro/hantro_postproc.c
> > >> +++ b/drivers/staging/media/hantro/hantro_postproc.c
> > >> @@ -11,6 +11,7 @@
> > >>   #include "hantro.h"
> > >>   #include "hantro_hw.h"
> > >>   #include "hantro_g1_regs.h"
> > >> +#include "hantro_g2_regs.h"
> > >>
> > >>   #define HANTRO_PP_REG_WRITE(vpu, reg_name, val) \
> > >>   { \
> > >> @@ -99,6 +100,21 @@ static void hantro_postproc_g1_enable(struct
> hantro_ctx
> > > *ctx)
> > >>    HANTRO_PP_REG_WRITE(vpu, display_width, ctx->dst_fmt.width);
> > >>   }
> > >>
> > >> +static void hantro_postproc_g2_enable(struct hantro_ctx *ctx)
> > >> +{
> > >> +  struct hantro_dev *vpu =3D ctx->dev;
> > >> +  struct vb2_v4l2_buffer *dst_buf;
> > >> +  size_t chroma_offset =3D ctx->dst_fmt.width * ctx->dst_fmt.height=
;
> > >> +  dma_addr_t dst_dma;
> > >> +
> > >> +  dst_buf =3D hantro_get_dst_buf(ctx);
> > >> +  dst_dma =3D vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> > >> +
> > >> +  hantro_write_addr(vpu, G2_RS_OUT_LUMA_ADDR, dst_dma);
> > >> +  hantro_write_addr(vpu, G2_RS_OUT_CHROMA_ADDR, dst_dma +
> > > chroma_offset);
> > >> +  hantro_reg_write(vpu, &g2_out_rs_e, 1);
> > >> +}
> > >> +
> > >>   void hantro_postproc_free(struct hantro_ctx *ctx)
> > >>   {
> > >>    struct hantro_dev *vpu =3D ctx->dev;
> > >> @@ -127,6 +143,9 @@ int hantro_postproc_alloc(struct hantro_ctx *ctx=
)
> > >>    if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_H264_SLICE)
> > >>            buf_size +=3D hantro_h264_mv_size(ctx->dst_fmt.width,
> > >>                                            ctx-
> > >> dst_fmt.height);
> > >> +  else if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_VP9_FRAME)
> > >> +          buf_size +=3D hantro_vp9_mv_size(ctx->dst_fmt.width,
> > >> +                                         ctx-
> > >> dst_fmt.height);
> > >>
> > >>    for (i =3D 0; i < num_buffers; ++i) {
> > >>            struct hantro_aux_buf *priv =3D &ctx->postproc.dec_q[i];
> > >> @@ -152,6 +171,13 @@ static void hantro_postproc_g1_disable(struct
> > > hantro_ctx *ctx)
> > >>    HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x0);
> > >>   }
> > >>
> > >> +static void hantro_postproc_g2_disable(struct hantro_ctx *ctx)
> > >> +{
> > >> +  struct hantro_dev *vpu =3D ctx->dev;
> > >> +
> > >> +  hantro_reg_write(vpu, &g2_out_rs_e, 0);
> > >> +}
> > >> +
> > >>   void hantro_postproc_disable(struct hantro_ctx *ctx)
> > >>   {
> > >>    struct hantro_dev *vpu =3D ctx->dev;
> > >> @@ -172,3 +198,8 @@ const struct hantro_postproc_ops
> hantro_g1_postproc_ops
> > > =3D {
> > >>    .enable =3D hantro_postproc_g1_enable,
> > >>    .disable =3D hantro_postproc_g1_disable,
> > >>   };
> > >> +
> > >> +const struct hantro_postproc_ops hantro_g2_postproc_ops =3D {
> > >> +  .enable =3D hantro_postproc_g2_enable,
> > >> +  .disable =3D hantro_postproc_g2_disable,
> > >> +};
> > >> diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/
> staging/
> > > media/hantro/imx8m_vpu_hw.c
> > >> index 455a107ffb02..1a43f6fceef9 100644
> > >> --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
> > >> +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> > >> @@ -132,6 +132,14 @@ static const struct hantro_fmt imx8m_vpu_dec_fm=
ts[]
> =3D {
> > >>    },
> > >>   };
> > >>
> > >> +static const struct hantro_fmt imx8m_vpu_g2_postproc_fmts[] =3D {
> > >> +  {
> > >> +          .fourcc =3D V4L2_PIX_FMT_NV12,
> > >> +          .codec_mode =3D HANTRO_MODE_NONE,
> > >> +          .postprocessed =3D true,
> > >> +  },
> > >> +};
> > >> +
> > >>   static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] =3D {
> > >>    {
> > >>            .fourcc =3D V4L2_PIX_FMT_NV12_4L4,
> > >> @@ -301,6 +309,9 @@ const struct hantro_variant imx8mq_vpu_g2_varian=
t =3D {
> > >>    .dec_offset =3D 0x0,
> > >>    .dec_fmts =3D imx8m_vpu_g2_dec_fmts,
> > >>    .num_dec_fmts =3D ARRAY_SIZE(imx8m_vpu_g2_dec_fmts),
> > >> +  .postproc_fmts =3D imx8m_vpu_g2_postproc_fmts,
> > >> +  .num_postproc_fmts =3D ARRAY_SIZE(imx8m_vpu_g2_postproc_fmts),
> > >> +  .postproc_ops =3D &hantro_g2_postproc_ops,
> > >>    .codec =3D HANTRO_HEVC_DECODER | HANTRO_VP9_DECODER,
> > >>    .codec_ops =3D imx8mq_vpu_g2_codec_ops,
> > >>    .init =3D imx8mq_vpu_hw_init,
> > >> --
> > >> 2.17.1
> > >>
> > >>
> > >
> > >
> >
> >
>
>
