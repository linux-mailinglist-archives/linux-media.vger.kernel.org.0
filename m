Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 477C0338B2
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 20:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbfFCS7V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 14:59:21 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:40165 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbfFCS7V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 14:59:21 -0400
Received: by mail-qk1-f196.google.com with SMTP id c70so1146118qkg.7
        for <linux-media@vger.kernel.org>; Mon, 03 Jun 2019 11:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=DPXA/0wnHBzOXGWUem3WKi27tTQOyZuH85bYvVVoCwc=;
        b=MqevoBPPGoxfiML5mGkvoQ7J073oNolir8VC5Z/RqzvxyxIyjLPcgk4VlzM2JvoDZi
         XY4wDo0LFYESbMtqVF0Zx0vhB061T4/82jZiHuMHSfGdy9VtyUg1RnTmCvsl7Qfp6Bst
         drWXqhm4ajObqroANF/SVbObhsQK1IkbxwoXQSdUgzSc7SQxaE0lPUQTI245moY+XPgv
         08eSzUBY2KaUdYidEJ+8+cn3cJHcOLkGTBLry3A1fwfDlekYMRG4V9gj9qkVGcgedkl2
         4yvzUlv7os6ilZic8mL01m/Xbzu1z75uWZMvKPUb41DhnwyK9kVluUk0zZ52gRuwiOgL
         gxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=DPXA/0wnHBzOXGWUem3WKi27tTQOyZuH85bYvVVoCwc=;
        b=aSy2UoURK3mrEiCTggsKdeWpAnJYtjMdYTW6XCrzhG0j9fL3E+LQuns3f3JPukWtcO
         Y0SbKMJXG5oxRJj1K+cdHbus8ZbyPRvunw47S4ZlYQmv4jNJpNyTzRcxEFTQwSvTm35Y
         e9HIlzmNfwONl1wZquQ2cwgZ7sMhHrI35hhdtIbeQq8idKKWS1DaFQDQiv8Y3RFfbgHC
         jXOLcYvQ+zi5Pz/xLekXPrSX8V8DpB8Fqmhf+onOfMXxW3SjYAzrGtZzvS+v7coKsnXn
         vj/OtmfWfScwhi5EISkreUjf6ZJ1QO9C9zmT4D1kF4fYLCZBWjuIuLgKv4JbhNWbfE2/
         YK3g==
X-Gm-Message-State: APjAAAUKptoDscuJXpvIkIlMktnz2sbsGXqzCDp0wu+K4MVWe/Y61E1i
        PUg6slPKtnzSwsVoO/ldzz8g3g==
X-Google-Smtp-Source: APXvYqzxVdGVGQ5Hmx1e+qBI/dDZ6+VueuiWKGVfTKn4n9eRp8HP4cqAeJjWM9GEYTviGlVEb+WDfg==
X-Received: by 2002:a37:dcc7:: with SMTP id v190mr23500464qki.286.1559588359024;
        Mon, 03 Jun 2019 11:59:19 -0700 (PDT)
Received: from tpx230-nicolas (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id y8sm10239290qth.22.2019.06.03.11.59.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 03 Jun 2019 11:59:17 -0700 (PDT)
Message-ID: <7646814d5251d32e3610535688768bde77ceebf4.camel@ndufresne.ca>
Subject: Re: [PATCH v3 09/10] media: hantro: add initial i.MX8MM support
 (untested)
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Date:   Mon, 03 Jun 2019 14:59:15 -0400
In-Reply-To: <a49db696-a31e-7f80-f2c3-bcb162c03dee@xs4all.nl>
References: <20190531085523.10892-1-p.zabel@pengutronix.de>
         <20190531085523.10892-10-p.zabel@pengutronix.de>
         <a49db696-a31e-7f80-f2c3-bcb162c03dee@xs4all.nl>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-HwfOUH1ske5Hp8O2rs06"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-HwfOUH1ske5Hp8O2rs06
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 03 juin 2019 =C3=A0 14:54 +0200, Hans Verkuil a =C3=A9crit :
> On 5/31/19 10:55 AM, Philipp Zabel wrote:
> > This should enable MPEG-2 decoding on the Hantro G1 and JPEG encoding o=
n
> > the Hantro H1 on i.MX8MM.
>=20
> That's the i.MX8M Mini, right? I think that's the official name for this
> SoC.
>=20
> In any case, I don't like merging this until someone was able to test it.

Could you clarify what you have in mind by this ? Normally Boris will
test the change for regression on the RK, and Philipp is clearly
testing on it's I.MX8MM eval board.

I could bootstrap my evaluation board to reproduce, but I don't really
see the value.

>=20
> Regards,
>=20
> 	Hans
>=20
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Changes since v2 [1]:
> >  - Adapted to changes in patches 4 and 5
> >=20
> > [1] https://patchwork.linuxtv.org/patch/56425/
> > ---
> >  drivers/staging/media/hantro/hantro_drv.c   |   1 +
> >  drivers/staging/media/hantro/hantro_hw.h    |   1 +
> >  drivers/staging/media/hantro/imx8m_vpu_hw.c | 137 ++++++++++++++++++++
> >  3 files changed, 139 insertions(+)
> >=20
> > diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/stagin=
g/media/hantro/hantro_drv.c
> > index bf88e594d440..ef2b29d50100 100644
> > --- a/drivers/staging/media/hantro/hantro_drv.c
> > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > @@ -419,6 +419,7 @@ static const struct of_device_id of_hantro_match[] =
=3D {
> >  	{ .compatible =3D "rockchip,rk3328-vpu", .data =3D &rk3328_vpu_varian=
t, },
> >  	{ .compatible =3D "rockchip,rk3288-vpu", .data =3D &rk3288_vpu_varian=
t, },
> >  	{ .compatible =3D "nxp,imx8mq-vpu", .data =3D &imx8mq_vpu_variant, },
> > +	{ .compatible =3D "nxp,imx8mm-vpu", .data =3D &imx8mm_vpu_variant, },
> >  	{ /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, of_hantro_match);
> > diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging=
/media/hantro/hantro_hw.h
> > index fd6ad017a1cf..1c69669dba54 100644
> > --- a/drivers/staging/media/hantro/hantro_hw.h
> > +++ b/drivers/staging/media/hantro/hantro_hw.h
> > @@ -82,6 +82,7 @@ extern const struct hantro_variant rk3399_vpu_variant=
;
> >  extern const struct hantro_variant rk3328_vpu_variant;
> >  extern const struct hantro_variant rk3288_vpu_variant;
> >  extern const struct hantro_variant imx8mq_vpu_variant;
> > +extern const struct hantro_variant imx8mm_vpu_variant;
> > =20
> >  void hantro_watchdog(struct work_struct *work);
> >  void hantro_run(struct hantro_ctx *ctx);
> > diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/stag=
ing/media/hantro/imx8m_vpu_hw.c
> > index 3da5cbd1eab1..fbe84c5f5619 100644
> > --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
> > +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> > @@ -15,14 +15,17 @@
> >  #define CTRL_SOFT_RESET		0x00
> >  #define RESET_G1		BIT(1)
> >  #define RESET_G2		BIT(0)
> > +#define RESET_H1		BIT(2)
> > =20
> >  #define CTRL_CLOCK_ENABLE	0x04
> >  #define CLOCK_G1		BIT(1)
> >  #define CLOCK_G2		BIT(0)
> > +#define CLOCK_H1		BIT(2)
> > =20
> >  #define CTRL_G1_DEC_FUSE	0x08
> >  #define CTRL_G1_PP_FUSE		0x0c
> >  #define CTRL_G2_DEC_FUSE	0x10
> > +#define CTRL_H1_ENC_FUSE	0x14
> > =20
> >  static void imx8m_soft_reset(struct hantro_dev *vpu, u32 reset_bits)
> >  {
> > @@ -73,6 +76,30 @@ static int imx8mq_runtime_resume(struct hantro_dev *=
vpu)
> >  	return 0;
> >  }
> > =20
> > +static int imx8mm_runtime_resume(struct hantro_dev *vpu)
> > +{
> > +	int ret;
> > +
> > +	ret =3D clk_bulk_prepare_enable(vpu->variant->num_clocks, vpu->clocks=
);
> > +	if (ret) {
> > +		dev_err(vpu->dev, "Failed to enable clocks\n");
> > +		return ret;
> > +	}
> > +
> > +	imx8m_soft_reset(vpu, RESET_G1 | RESET_G2 | RESET_H1);
> > +	imx8m_clk_enable(vpu, CLOCK_G1 | CLOCK_G2 | RESET_H1);
> > +
> > +	/* Set values of the fuse registers */
> > +	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_DEC_FUSE);
> > +	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_PP_FUSE);
> > +	writel(0xffffffff, vpu->ctrl_base + CTRL_G2_DEC_FUSE);
> > +	writel(0xffffffff, vpu->ctrl_base + CTRL_H1_ENC_FUSE);
> > +
> > +	clk_bulk_disable_unprepare(vpu->variant->num_clocks, vpu->clocks);
> > +
> > +	return 0;
> > +}
> > +
> >  /*
> >   * Supported formats.
> >   */
> > @@ -97,6 +124,43 @@ static const struct hantro_fmt imx8m_vpu_dec_fmts[]=
 =3D {
> >  	},
> >  };
> > =20
> > +static const struct hantro_fmt imx8mm_vpu_enc_fmts[] =3D {
> > +	{
> > +		.fourcc =3D V4L2_PIX_FMT_YUV420M,
> > +		.codec_mode =3D HANTRO_MODE_NONE,
> > +		.enc_fmt =3D RK3288_VPU_ENC_FMT_YUV420P,
> > +	},
> > +	{
> > +		.fourcc =3D V4L2_PIX_FMT_NV12M,
> > +		.codec_mode =3D HANTRO_MODE_NONE,
> > +		.enc_fmt =3D RK3288_VPU_ENC_FMT_YUV420SP,
> > +	},
> > +	{
> > +		.fourcc =3D V4L2_PIX_FMT_YUYV,
> > +		.codec_mode =3D HANTRO_MODE_NONE,
> > +		.enc_fmt =3D RK3288_VPU_ENC_FMT_YUYV422,
> > +	},
> > +	{
> > +		.fourcc =3D V4L2_PIX_FMT_UYVY,
> > +		.codec_mode =3D HANTRO_MODE_NONE,
> > +		.enc_fmt =3D RK3288_VPU_ENC_FMT_UYVY422,
> > +	},
> > +	{
> > +		.fourcc =3D V4L2_PIX_FMT_JPEG,
> > +		.codec_mode =3D HANTRO_MODE_JPEG_ENC,
> > +		.max_depth =3D 2,
> > +		.header_size =3D JPEG_HEADER_SIZE,
> > +		.frmsize =3D {
> > +			.min_width =3D 96,
> > +			.max_width =3D 8192,
> > +			.step_width =3D JPEG_MB_DIM,
> > +			.min_height =3D 32,
> > +			.max_height =3D 8192,
> > +			.step_height =3D JPEG_MB_DIM,
> > +		},
> > +	},
> > +};
> > +
> >  static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
> >  {
> >  	struct hantro_dev *vpu =3D dev_id;
> > @@ -115,6 +179,25 @@ static irqreturn_t imx8m_vpu_g1_irq(int irq, void =
*dev_id)
> >  	return IRQ_HANDLED;
> >  }
> > =20
> > +static irqreturn_t imx8mm_vpu_h1_irq(int irq, void *dev_id)
> > +{
> > +	struct hantro_dev *vpu =3D dev_id;
> > +	enum vb2_buffer_state state;
> > +	u32 status, bytesused;
> > +
> > +	status =3D vepu_read(vpu, VEPU_REG_INTERRUPT);
> > +	bytesused =3D vepu_read(vpu, VEPU_REG_STR_BUF_LIMIT) / 8;
> > +	state =3D (status & VEPU_REG_INTERRUPT_FRAME_RDY) ?
> > +		 VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
> > +
> > +	vepu_write(vpu, 0, VEPU_REG_INTERRUPT);
> > +	vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
> > +
> > +	hantro_irq_done(vpu, bytesused, state);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> >  static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
> >  {
> >  	vpu->dec_base =3D vpu->bases[0];
> > @@ -123,6 +206,15 @@ static int imx8mq_vpu_hw_init(struct hantro_dev *v=
pu)
> >  	return 0;
> >  }
> > =20
> > +static int imx8mm_vpu_hw_init(struct hantro_dev *vpu)
> > +{
> > +	vpu->dec_base =3D vpu->bases[0];
> > +	vpu->enc_base =3D vpu->bases[2];
> > +	vpu->ctrl_base =3D vpu->bases[vpu->variant->num_regs - 1];
> > +
> > +	return 0;
> > +}
> > +
> >  static void imx8m_vpu_g1_reset(struct hantro_ctx *ctx)
> >  {
> >  	struct hantro_dev *vpu =3D ctx->dev;
> > @@ -130,6 +222,13 @@ static void imx8m_vpu_g1_reset(struct hantro_ctx *=
ctx)
> >  	imx8m_soft_reset(vpu, RESET_G1);
> >  }
> > =20
> > +static void imx8mm_vpu_h1_reset(struct hantro_ctx *ctx)
> > +{
> > +	struct hantro_dev *vpu =3D ctx->dev;
> > +
> > +	imx8m_soft_reset(vpu, RESET_H1);
> > +}
> > +
> >  /*
> >   * Supported codec ops.
> >   */
> > @@ -143,6 +242,21 @@ static const struct hantro_codec_ops imx8mq_vpu_co=
dec_ops[] =3D {
> >  	},
> >  };
> > =20
> > +static const struct hantro_codec_ops imx8mm_vpu_codec_ops[] =3D {
> > +	[HANTRO_MODE_MPEG2_DEC] =3D {
> > +		.run =3D hantro_g1_mpeg2_dec_run,
> > +		.reset =3D imx8m_vpu_g1_reset,
> > +		.init =3D hantro_mpeg2_dec_init,
> > +		.exit =3D hantro_mpeg2_dec_exit,
> > +	},
> > +	[HANTRO_MODE_JPEG_ENC] =3D {
> > +		.run =3D hantro_h1_jpeg_enc_run,
> > +		.reset =3D imx8mm_vpu_h1_reset,
> > +		.init =3D hantro_jpeg_enc_init,
> > +		.exit =3D hantro_jpeg_enc_exit,
> > +	},
> > +};
> > +
> >  /*
> >   * VPU variants.
> >   */
> > @@ -169,3 +283,26 @@ const struct hantro_variant imx8mq_vpu_variant =3D=
 {
> >  	.reg_names =3D imx8mq_reg_names,
> >  	.num_regs =3D ARRAY_SIZE(imx8mq_reg_names)
> >  };
> > +
> > +static const struct hantro_irq imx8mm_irqs[] =3D {
> > +	{ "g1", imx8m_vpu_g1_irq },
> > +	{ "g2", NULL /* TODO: imx8m_vpu_g2_irq */ },
> > +	{ "h1", imx8mm_vpu_h1_irq },
> > +};
> > +
> > +static const char * const imx8mm_reg_names[] =3D { "g1", "g2", "h1", "=
ctrl" };
> > +
> > +const struct hantro_variant imx8mm_vpu_variant =3D {
> > +	.dec_fmts =3D imx8m_vpu_dec_fmts,
> > +	.num_dec_fmts =3D ARRAY_SIZE(imx8m_vpu_dec_fmts),
> > +	.codec =3D HANTRO_MPEG2_DECODER,
> > +	.codec_ops =3D imx8mm_vpu_codec_ops,
> > +	.init =3D imx8mm_vpu_hw_init,
> > +	.runtime_resume =3D imx8mm_runtime_resume,
> > +	.irqs =3D imx8mm_irqs,
> > +	.num_irqs =3D ARRAY_SIZE(imx8mm_irqs),
> > +	.clk_names =3D { "g1", "g2", "h1", "bus" },
> > +	.num_clocks =3D 4,
> > +	.reg_names =3D imx8mm_reg_names,
> > +	.num_regs =3D ARRAY_SIZE(imx8mm_reg_names)
> > +};
> >=20

--=-HwfOUH1ske5Hp8O2rs06
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iFwEABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXPVuAwAKCRBxUwItrAao
HHKaAJQL3xRO9YuFy0z93TbRailnjSheAJ9UQHBtCHvn0gMAr4RBzClHryk2Qw==
=vZLR
-----END PGP SIGNATURE-----

--=-HwfOUH1ske5Hp8O2rs06--

