Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65446565AA0
	for <lists+linux-media@lfdr.de>; Mon,  4 Jul 2022 18:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233673AbiGDQJb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jul 2022 12:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbiGDQJ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jul 2022 12:09:29 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF975FE1;
        Mon,  4 Jul 2022 09:09:25 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca [66.171.169.34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 137006601602;
        Mon,  4 Jul 2022 17:09:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1656950963;
        bh=tsdjOo4Ixywnge9o2kF/3jfry9i+C/wJYR0HjZ1Mfww=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=M8rctOWbKFzPbUNOSN1sArW1yha7Sfb3DBNFrzbCHHmtj0LaBtyXsgh/wt8R1oQcV
         v5Vhuz84gwkeSGnWdpPYBLJ2PfP3LOJG4B+8ugpY3LB+qTWEv+PDOS6QAFXTVE9M1p
         Iq4Mp5u+bBbqKuvZ095NTX8K/17WD3A/PUIgDv1udar7R7HCK4nNHrnJMn4TdlPS0I
         kGbaMmXhvqYiFV82CRy9MFG6WFcfR9JsLze186b/Gt2mlY8F2+ZV6mxLnD2Je7WNr5
         ForrWokOSp/TM/N451zYAV08s4xAQtxfYs+Hv2Fmkc63iUdLNgzYppTIMgDrEfxFeN
         VdVvwGYqukUuQ==
Message-ID: <6bf11fc50bf43a25d02b4ca45c66099d14cdc0e5.camel@collabora.com>
Subject: Re: [PATCH] hantro: Fix RK3399 H.264 format advertising
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Date:   Mon, 04 Jul 2022 12:09:13 -0400
In-Reply-To: <29056fd2b8ca260ebf7d3babb6c8cf2bf68a112a.camel@collabora.com>
References: <20220629195624.45745-1-ezequiel@vanguardiasur.com.ar>
         <29056fd2b8ca260ebf7d3babb6c8cf2bf68a112a.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 29 juin 2022 =C3=A0 16:07 -0400, Nicolas Dufresne a =C3=A9crit=
=C2=A0:
> Hi Ezequiel,
>=20
> Le mercredi 29 juin 2022 =C3=A0 16:56 -0300, Ezequiel Garcia a =C3=A9crit=
=C2=A0:
> > Commit 1f82f2df523cb ("media: hantro: Enable H.264 on Rockchip VDPU2")
> > enabled H.264 on some SoCs with VDPU2 cores. This had the side-effect
> > of exposing H.264 coded format as supported on RK3399.
> >=20
> > Fix this and clarify how the codec is explicitly disabled on RK399 on
>=20
> RK399 -> RK3399
>=20
> > this driver.
> >=20
> > Fixes: 1f82f2df523cb ("media: hantro: Enable H.264 on Rockchip VDPU2")
> > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>=20
> Thanks for fixing this. The bogus format (without associated controls) is=
 not

Sorry:
* is now

> gone. With the right video node value:
>=20
>   v4l2-ctl -D -dN --list-formats-out
>=20
> Tested-By: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>=20
> > ---
> >  .../staging/media/hantro/rockchip_vpu_hw.c    | 60 ++++++++++++++++---
> >  1 file changed, 53 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/s=
taging/media/hantro/rockchip_vpu_hw.c
> > index 098486b9ec27..26e16b5a6a70 100644
> > --- a/drivers/staging/media/hantro/rockchip_vpu_hw.c
> > +++ b/drivers/staging/media/hantro/rockchip_vpu_hw.c
> > @@ -182,7 +182,7 @@ static const struct hantro_fmt rk3288_vpu_dec_fmts[=
] =3D {
> >  	},
> >  };
> > =20
> > -static const struct hantro_fmt rk3399_vpu_dec_fmts[] =3D {
> > +static const struct hantro_fmt rockchip_vdpu2_dec_fmts[] =3D {
> >  	{
> >  		.fourcc =3D V4L2_PIX_FMT_NV12,
> >  		.codec_mode =3D HANTRO_MODE_NONE,
> > @@ -236,6 +236,47 @@ static const struct hantro_fmt rk3399_vpu_dec_fmts=
[] =3D {
> >  	},
> >  };
> > =20
> > +static const struct hantro_fmt rk3399_vpu_dec_fmts[] =3D {
> > +	{
> > +		.fourcc =3D V4L2_PIX_FMT_NV12,
> > +		.codec_mode =3D HANTRO_MODE_NONE,
> > +		.frmsize =3D {
> > +			.min_width =3D FMT_MIN_WIDTH,
> > +			.max_width =3D FMT_FHD_WIDTH,
> > +			.step_width =3D MB_DIM,
> > +			.min_height =3D FMT_MIN_HEIGHT,
> > +			.max_height =3D FMT_FHD_HEIGHT,
> > +			.step_height =3D MB_DIM,
> > +		},
> > +	},
> > +	{
> > +		.fourcc =3D V4L2_PIX_FMT_MPEG2_SLICE,
> > +		.codec_mode =3D HANTRO_MODE_MPEG2_DEC,
> > +		.max_depth =3D 2,
> > +		.frmsize =3D {
> > +			.min_width =3D FMT_MIN_WIDTH,
> > +			.max_width =3D FMT_FHD_WIDTH,
> > +			.step_width =3D MB_DIM,
> > +			.min_height =3D FMT_MIN_HEIGHT,
> > +			.max_height =3D FMT_FHD_HEIGHT,
> > +			.step_height =3D MB_DIM,
> > +		},
> > +	},
> > +	{
> > +		.fourcc =3D V4L2_PIX_FMT_VP8_FRAME,
> > +		.codec_mode =3D HANTRO_MODE_VP8_DEC,
> > +		.max_depth =3D 2,
> > +		.frmsize =3D {
> > +			.min_width =3D FMT_MIN_WIDTH,
> > +			.max_width =3D FMT_UHD_WIDTH,
> > +			.step_width =3D MB_DIM,
> > +			.min_height =3D FMT_MIN_HEIGHT,
> > +			.max_height =3D FMT_UHD_HEIGHT,
> > +			.step_height =3D MB_DIM,
> > +		},
> > +	},
> > +};
> > +
> >  static irqreturn_t rockchip_vpu1_vepu_irq(int irq, void *dev_id)
> >  {
> >  	struct hantro_dev *vpu =3D dev_id;
> > @@ -548,8 +589,8 @@ const struct hantro_variant rk3288_vpu_variant =3D =
{
> > =20
> >  const struct hantro_variant rk3328_vpu_variant =3D {
> >  	.dec_offset =3D 0x400,
> > -	.dec_fmts =3D rk3399_vpu_dec_fmts,
> > -	.num_dec_fmts =3D ARRAY_SIZE(rk3399_vpu_dec_fmts),
> > +	.dec_fmts =3D rockchip_vdpu2_dec_fmts,
> > +	.num_dec_fmts =3D ARRAY_SIZE(rockchip_vdpu2_dec_fmts),
> >  	.codec =3D HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
> >  		 HANTRO_H264_DECODER,
> >  	.codec_ops =3D rk3399_vpu_codec_ops,
> > @@ -560,6 +601,11 @@ const struct hantro_variant rk3328_vpu_variant =3D=
 {
> >  	.num_clocks =3D ARRAY_SIZE(rockchip_vpu_clk_names),
> >  };
> > =20
> > +/*
> > + * H.264 decoding explicitly disabled in RK3399.
> > + * This ensures userspace applications use the Rockchip VDEC core,
> > + * which has better performance.
> > + */
> >  const struct hantro_variant rk3399_vpu_variant =3D {
> >  	.enc_offset =3D 0x0,
> >  	.enc_fmts =3D rockchip_vpu_enc_fmts,
> > @@ -579,8 +625,8 @@ const struct hantro_variant rk3399_vpu_variant =3D =
{
> > =20
> >  const struct hantro_variant rk3568_vpu_variant =3D {
> >  	.dec_offset =3D 0x400,
> > -	.dec_fmts =3D rk3399_vpu_dec_fmts,
> > -	.num_dec_fmts =3D ARRAY_SIZE(rk3399_vpu_dec_fmts),
> > +	.dec_fmts =3D rockchip_vdpu2_dec_fmts,
> > +	.num_dec_fmts =3D ARRAY_SIZE(rockchip_vdpu2_dec_fmts),
> >  	.codec =3D HANTRO_MPEG2_DECODER |
> >  		 HANTRO_VP8_DECODER | HANTRO_H264_DECODER,
> >  	.codec_ops =3D rk3399_vpu_codec_ops,
> > @@ -596,8 +642,8 @@ const struct hantro_variant px30_vpu_variant =3D {
> >  	.enc_fmts =3D rockchip_vpu_enc_fmts,
> >  	.num_enc_fmts =3D ARRAY_SIZE(rockchip_vpu_enc_fmts),
> >  	.dec_offset =3D 0x400,
> > -	.dec_fmts =3D rk3399_vpu_dec_fmts,
> > -	.num_dec_fmts =3D ARRAY_SIZE(rk3399_vpu_dec_fmts),
> > +	.dec_fmts =3D rockchip_vdpu2_dec_fmts,
> > +	.num_dec_fmts =3D ARRAY_SIZE(rockchip_vdpu2_dec_fmts),
> >  	.codec =3D HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER |
> >  		 HANTRO_VP8_DECODER | HANTRO_H264_DECODER,
> >  	.codec_ops =3D rk3399_vpu_codec_ops,
>=20
> And code looks good (just found a small commit message typo).
>=20
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>=20
> regards,
> Nicolas
>=20
>=20

