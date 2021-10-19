Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D69433C7D
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 18:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234413AbhJSQkR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 12:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234421AbhJSQkR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 12:40:17 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20332C06161C;
        Tue, 19 Oct 2021 09:38:04 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id n7-20020a05600c4f8700b00323023159e1so3871408wmq.2;
        Tue, 19 Oct 2021 09:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Z1opZpU9zwBaMLcauW3InbpqOYm4kbEPOFB4HuXEpk=;
        b=AGRBX5iTNNq6cDPIqewIc0SINW3yihYPsa/Z1qYz/XHBoin+DomTGrBtnrMJ0IcuYt
         u5aaSe+BMvb+OMTgHvjPNEoOsb1yswdHLpQaLmD23KIa4RU44kZgXWcrMVZNZFURhv3W
         fd/0GOQAGaAB2li8p206KZA//Yli++vGixkd5S45IIanFMKJ1ORWo75Zg3gGeqZ8K7fm
         FUD0q3yvIsMXiRsMqiQfh9H/QacbGXp5Kj1LUzDdBp96GsacKptBSakHrzKWL5uHk1ZG
         kK94FKbT2ohH1gvjz7RNQJG2f0G+MH5xmqQ4whhmBytQ7sRhQqu2+u8mplFvrD7H1EJd
         w6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Z1opZpU9zwBaMLcauW3InbpqOYm4kbEPOFB4HuXEpk=;
        b=Rz4Tv/+KN++tkJWJ2h0gmYqfOTSk3TRncA/hwAB1N6fzZkoxG0dwETPMZf3/WWd8qt
         iNIwefYu9D7kCBiSJ2Z18vn/xjCdMpX/atDHGsqmqTrNKkShY9uGhT+EgVPJIuP1wY1z
         EXBn5n9WfQQfIstkB5cexcBkf4T/LQWgXwgp1uDZ8mY2jlcCIzyjmmlhMjtivhq+j1CQ
         6myJ5lNuXJLypJQHWGkP8Tw5RY597onixFualE8tiYATopRWTWUP/1vvhF0QN2yTmp1F
         RP1Cq5cVd6zW5PU9J8tfv1B+VLjuR/GZ5TdbjpoKeGkVE7jmuC500ALtvdnD6yeZ8871
         9PoQ==
X-Gm-Message-State: AOAM531aoD3IqCxzqnn3PfWMNRevcJ0B1P5iUUuqIb06yD0NyocCRNNp
        Bew4cISHfBenmoOGWKZcoCcRDH4zGZuO5w==
X-Google-Smtp-Source: ABdhPJygqxvii/E7OaYZ4Q4AymN+aUH6LqCk7yxz+ZrfhV9JssPto3Xc8N7zkV98cdJ5rvAfPql4Yw==
X-Received: by 2002:a05:600c:896:: with SMTP id l22mr7234197wmp.92.1634661482738;
        Tue, 19 Oct 2021 09:38:02 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id g8sm2304291wrx.26.2021.10.19.09.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 09:38:02 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
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
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: Re: [PATCH v7 11/11] media: hantro: Support NV12 on the G2 core
Date:   Tue, 19 Oct 2021 18:38:00 +0200
Message-ID: <11847752.O9o76ZdvQC@kista>
In-Reply-To: <84fd4395-5cac-c933-7639-dd3cd844a9cf@collabora.com>
References: <20210929160439.6601-1-andrzej.p@collabora.com> <3448839.R56niFO833@kista> <84fd4395-5cac-c933-7639-dd3cd844a9cf@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrzej!

Dne petek, 15. oktober 2021 ob 19:19:47 CEST je Andrzej Pietrasiewicz=20
napisal(a):
> Hi Jernej,
>=20
> W dniu 14.10.2021 o 19:42, Jernej =C5=A0krabec pisze:
> > Hi Andrzej!
> >=20
> > Dne sreda, 29. september 2021 ob 18:04:39 CEST je Andrzej Pietrasiewicz
> > napisal(a):
> >> The G2 decoder block produces NV12 4x4 tiled format (NV12_4L4).
> >> Enable the G2 post-processor block, in order to produce regular NV12.
> >>
> >> The logic in hantro_postproc.c is leveraged to take care of allocating
> >> the extra buffers and configure the post-processor, which is
> >> significantly simpler than the one on the G1.
> >=20
> > Quick summary of discussion on LibreELEC Slack:
> > When using NV12 format on Allwinner H6 variant of G2 (needs some driver
> > changes), I get frames out of order. If I use native NV12 tiled format,=
=20
frames
> > are ordered correctly.
> >=20
> > Currently I'm not sure if this is issue with my changes or is this gene=
ral
> > issue.
> >=20
> > I would be grateful if anyone can test frame order with and without
> > postprocessing enabled on imx8. Take some dynamic video with a lot of=20
short
> > scenes. It's pretty obvious when frames are out of order.
> >=20
>=20
> I checked on imx8 and cannot observe any such artifacts.

I finally found the issue. As you mentioned on Slack, register write order =
once=20
already affected decoding. Well, it's the case again. I made hacky test and=
=20
moved postproc enable call after output buffers are set and it worked. So, =
this=20
is actually core quirk which is obviously fixed in newer variants.

This makes this series with minor adaptations completely working on H6. I s=
ee=20
no reason not to merge whole series.

Thanks for testing.

Best regards,
Jernej

>=20
> Andrzej
>=20
> > However, given that frames themself are correctly decoded and without
> > postprocessing in right order, that shouldn't block merging previous=20
patches.
> > I tried few different videos and frames were all decoded correctly.
> >=20
> > Best regards,
> > Jernej
> >=20
> >>
> >> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> >> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> >> ---
> >>   .../staging/media/hantro/hantro_g2_vp9_dec.c  |  6 ++--
> >>   drivers/staging/media/hantro/hantro_hw.h      |  1 +
> >>   .../staging/media/hantro/hantro_postproc.c    | 31 +++++++++++++++++=
++
> >>   drivers/staging/media/hantro/imx8m_vpu_hw.c   | 11 +++++++
> >>   4 files changed, 46 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/staging/media/hantro/hantro_g2_vp9_dec.c b/driver=
s/
> > staging/media/hantro/hantro_g2_vp9_dec.c
> >> index 7f827b9f0133..1a26be72c878 100644
> >> --- a/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
> >> +++ b/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
> >> @@ -152,7 +152,7 @@ static void config_output(struct hantro_ctx *ctx,
> >>   	hantro_reg_write(ctx->dev, &g2_out_dis, 0);
> >>   	hantro_reg_write(ctx->dev, &g2_output_format, 0);
> >>  =20
> >> -	luma_addr =3D vb2_dma_contig_plane_dma_addr(&dst->base.vb.vb2_buf,
> > 0);
> >> +	luma_addr =3D hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf);
> >>   	hantro_write_addr(ctx->dev, G2_OUT_LUMA_ADDR, luma_addr);
> >>  =20
> >>   	chroma_addr =3D luma_addr + chroma_offset(ctx, dec_params);
> >> @@ -191,7 +191,7 @@ static void config_ref(struct hantro_ctx *ctx,
> >>   	hantro_reg_write(ctx->dev, &ref_reg->hor_scale, (refw << 14) /
> > dst->vp9.width);
> >>   	hantro_reg_write(ctx->dev, &ref_reg->ver_scale, (refh << 14) /
> > dst->vp9.height);
> >>  =20
> >> -	luma_addr =3D vb2_dma_contig_plane_dma_addr(&buf->base.vb.vb2_buf,
> > 0);
> >> +	luma_addr =3D hantro_get_dec_buf_addr(ctx, &buf->base.vb.vb2_buf);
> >>   	hantro_write_addr(ctx->dev, ref_reg->y_base, luma_addr);
> >>  =20
> >>   	chroma_addr =3D luma_addr + chroma_offset(ctx, dec_params);
> >> @@ -236,7 +236,7 @@ static void config_ref_registers(struct hantro_ctx=
=20
*ctx,
> >>   	config_ref(ctx, dst, &ref_regs[1], dec_params, dec_params-
> >> golden_frame_ts);
> >>   	config_ref(ctx, dst, &ref_regs[2], dec_params, dec_params-
> >> alt_frame_ts);
> >>  =20
> >> -	mv_addr =3D vb2_dma_contig_plane_dma_addr(&mv_ref->base.vb.vb2_buf,
> > 0) +
> >> +	mv_addr =3D hantro_get_dec_buf_addr(ctx, &mv_ref->base.vb.vb2_buf) +
> >>   		  mv_offset(ctx, dec_params);
> >>   	hantro_write_addr(ctx->dev, G2_REF_MV_ADDR(0), mv_addr);
> >>  =20
> >> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/stagin=
g/
> > media/hantro/hantro_hw.h
> >> index 2961d399fd60..3d4a5dc1e6d5 100644
> >> --- a/drivers/staging/media/hantro/hantro_hw.h
> >> +++ b/drivers/staging/media/hantro/hantro_hw.h
> >> @@ -274,6 +274,7 @@ extern const struct hantro_variant=20
rk3399_vpu_variant;
> >>   extern const struct hantro_variant sama5d4_vdec_variant;
> >>  =20
> >>   extern const struct hantro_postproc_ops hantro_g1_postproc_ops;
> >> +extern const struct hantro_postproc_ops hantro_g2_postproc_ops;
> >>  =20
> >>   extern const u32 hantro_vp8_dec_mc_filter[8][6];
> >>  =20
> >> diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/
> > staging/media/hantro/hantro_postproc.c
> >> index 4549aec08feb..79a66d001738 100644
> >> --- a/drivers/staging/media/hantro/hantro_postproc.c
> >> +++ b/drivers/staging/media/hantro/hantro_postproc.c
> >> @@ -11,6 +11,7 @@
> >>   #include "hantro.h"
> >>   #include "hantro_hw.h"
> >>   #include "hantro_g1_regs.h"
> >> +#include "hantro_g2_regs.h"
> >>  =20
> >>   #define HANTRO_PP_REG_WRITE(vpu, reg_name, val) \
> >>   { \
> >> @@ -99,6 +100,21 @@ static void hantro_postproc_g1_enable(struct=20
hantro_ctx
> > *ctx)
> >>   	HANTRO_PP_REG_WRITE(vpu, display_width, ctx->dst_fmt.width);
> >>   }
> >>  =20
> >> +static void hantro_postproc_g2_enable(struct hantro_ctx *ctx)
> >> +{
> >> +	struct hantro_dev *vpu =3D ctx->dev;
> >> +	struct vb2_v4l2_buffer *dst_buf;
> >> +	size_t chroma_offset =3D ctx->dst_fmt.width * ctx->dst_fmt.height;
> >> +	dma_addr_t dst_dma;
> >> +
> >> +	dst_buf =3D hantro_get_dst_buf(ctx);
> >> +	dst_dma =3D vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> >> +
> >> +	hantro_write_addr(vpu, G2_RS_OUT_LUMA_ADDR, dst_dma);
> >> +	hantro_write_addr(vpu, G2_RS_OUT_CHROMA_ADDR, dst_dma +
> > chroma_offset);
> >> +	hantro_reg_write(vpu, &g2_out_rs_e, 1);
> >> +}
> >> +
> >>   void hantro_postproc_free(struct hantro_ctx *ctx)
> >>   {
> >>   	struct hantro_dev *vpu =3D ctx->dev;
> >> @@ -127,6 +143,9 @@ int hantro_postproc_alloc(struct hantro_ctx *ctx)
> >>   	if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_H264_SLICE)
> >>   		buf_size +=3D hantro_h264_mv_size(ctx->dst_fmt.width,
> >>   						ctx-
> >> dst_fmt.height);
> >> +	else if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_VP9_FRAME)
> >> +		buf_size +=3D hantro_vp9_mv_size(ctx->dst_fmt.width,
> >> +					       ctx-
> >> dst_fmt.height);
> >>  =20
> >>   	for (i =3D 0; i < num_buffers; ++i) {
> >>   		struct hantro_aux_buf *priv =3D &ctx->postproc.dec_q[i];
> >> @@ -152,6 +171,13 @@ static void hantro_postproc_g1_disable(struct
> > hantro_ctx *ctx)
> >>   	HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x0);
> >>   }
> >>  =20
> >> +static void hantro_postproc_g2_disable(struct hantro_ctx *ctx)
> >> +{
> >> +	struct hantro_dev *vpu =3D ctx->dev;
> >> +
> >> +	hantro_reg_write(vpu, &g2_out_rs_e, 0);
> >> +}
> >> +
> >>   void hantro_postproc_disable(struct hantro_ctx *ctx)
> >>   {
> >>   	struct hantro_dev *vpu =3D ctx->dev;
> >> @@ -172,3 +198,8 @@ const struct hantro_postproc_ops=20
hantro_g1_postproc_ops
> > =3D {
> >>   	.enable =3D hantro_postproc_g1_enable,
> >>   	.disable =3D hantro_postproc_g1_disable,
> >>   };
> >> +
> >> +const struct hantro_postproc_ops hantro_g2_postproc_ops =3D {
> >> +	.enable =3D hantro_postproc_g2_enable,
> >> +	.disable =3D hantro_postproc_g2_disable,
> >> +};
> >> diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/
staging/
> > media/hantro/imx8m_vpu_hw.c
> >> index 455a107ffb02..1a43f6fceef9 100644
> >> --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
> >> +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> >> @@ -132,6 +132,14 @@ static const struct hantro_fmt imx8m_vpu_dec_fmts=
[]=20
=3D {
> >>   	},
> >>   };
> >>  =20
> >> +static const struct hantro_fmt imx8m_vpu_g2_postproc_fmts[] =3D {
> >> +	{
> >> +		.fourcc =3D V4L2_PIX_FMT_NV12,
> >> +		.codec_mode =3D HANTRO_MODE_NONE,
> >> +		.postprocessed =3D true,
> >> +	},
> >> +};
> >> +
> >>   static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] =3D {
> >>   	{
> >>   		.fourcc =3D V4L2_PIX_FMT_NV12_4L4,
> >> @@ -301,6 +309,9 @@ const struct hantro_variant imx8mq_vpu_g2_variant =
=3D {
> >>   	.dec_offset =3D 0x0,
> >>   	.dec_fmts =3D imx8m_vpu_g2_dec_fmts,
> >>   	.num_dec_fmts =3D ARRAY_SIZE(imx8m_vpu_g2_dec_fmts),
> >> +	.postproc_fmts =3D imx8m_vpu_g2_postproc_fmts,
> >> +	.num_postproc_fmts =3D ARRAY_SIZE(imx8m_vpu_g2_postproc_fmts),
> >> +	.postproc_ops =3D &hantro_g2_postproc_ops,
> >>   	.codec =3D HANTRO_HEVC_DECODER | HANTRO_VP9_DECODER,
> >>   	.codec_ops =3D imx8mq_vpu_g2_codec_ops,
> >>   	.init =3D imx8mq_vpu_hw_init,
> >> --=20
> >> 2.17.1
> >>
> >>
> >=20
> >=20
>=20
>=20


