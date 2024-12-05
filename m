Return-Path: <linux-media+bounces-22721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFE39E59F0
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 16:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E77916CB2A
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 15:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067CE21CA1F;
	Thu,  5 Dec 2024 15:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="UoqO9PPk";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jglWqUKt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C85D21A425;
	Thu,  5 Dec 2024 15:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733413184; cv=none; b=tbHjXHOFHXpZSCvGpgtKHqayDVqozlNZBmyCrGfYMS/EC0mmHjEHCxrJa3OWz75abOoJWDdUfRV3g10y/+G/eL8nYGyW9XNllZBX/nHjKPJ7xFpd7hgBho9wk5B0GWid48PzaDGldjRwjMCd5GQBrcc2cQyCLj8qd+3RCgsOKkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733413184; c=relaxed/simple;
	bh=5+7hECp5xkP8gbtm0wMjU8SewxcsbplPrOFyu+3WZMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YvJ7oRyi1f0Dusyx7sYGUMLt41AHlBg/6dvKEVr5v6c+qeKmKwj2FYrMfTWfrBpEVEkLkQgE/3vIDcHFLdiNMDWTu5msqI+PUY/jg3PdIp4l5Fv1VldmuHKWSNenfk0uBAQNjcRCt2GE4B49vDuCMFKgzgVdTVdrINSXg6C0Azo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=UoqO9PPk; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=jglWqUKt reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1733413180; x=1764949180;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bITlpbaxJZ/ELoBexWwZ37dzybUATEmdzTJTeCJOdUs=;
  b=UoqO9PPklD4wNdll1vza8hu2Cawu/GNqhhOoI2CfB+T4+9ctNbBReK/n
   hciYpqUa4LsYcB1ArOtFhmNOi78TFLv0LePrGt8IqYRX8/W3Uo2mG6cmh
   rpmbXQRmWs5IIMC3Pa21OcjkczE8pXX53B0OyLZh1AqfODxLx7k9Pseki
   yOiIXcVF4B+E3SYT+4xaLPeVwM5ltkjU5pzJi72p83CBteAEGWQPGKZQB
   7OKMQT+liX2UIFmrzoWhebJgcAujKn6ixk6lGxQeTYzAvE97f8CDUuR4M
   3dPIsxGzhlrr2emkapTBh9a+1ErWfyP30mZ9wx0YqcdplNOFJn/C4f9tq
   w==;
X-CSE-ConnectionGUID: QIQQHHRvSUCxCFxzGq0uLg==
X-CSE-MsgGUID: lciEpNtRTu+EqC5iYhRfKA==
X-IronPort-AV: E=Sophos;i="6.12,210,1728943200"; 
   d="scan'208";a="40435594"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 05 Dec 2024 16:39:37 +0100
X-CheckPoint: {6751C939-10-F5DC7025-F79421CB}
X-MAIL-CPID: D7BACB0F9DFF492E6B3DFE2FE5CB2D96_0
X-Control-Analysis: str=0001.0A682F28.6751C93A.0019,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1D60160A43;
	Thu,  5 Dec 2024 16:39:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1733413173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bITlpbaxJZ/ELoBexWwZ37dzybUATEmdzTJTeCJOdUs=;
	b=jglWqUKtPxsplmsR67CkjKnm3GPFeNYZ+33ZpbMDegN2VzbsUsSNStUMqWq7f/NAamdhvz
	ys19VGl9kakyogCFGseboz6ZPnonF1lhFtEVpLxcK1SvVLCbhGgVO0i8igUPUJ+gyn7syu
	e5NPqbOjafNf9UroaitX+VbIYEQarWaYOAsDWEWpP2HKsrVKVPf4hjbNLmIHfyRJQ3Z4Dh
	IuVgmLi8a2IN/pI1Us8rRht0xzd+qW4qRKNsslp2X2AVTD/mxk9ADpvGbDpXqGtS7jcfk1
	kKF2ZX8T/aeyLGjQIiTx06a/tlO0O91Lpr64iyLW4glg8fxPkfTBnENVxwdQTA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] media: i2c: imx290: Limit analogue gain according to module
Date: Thu, 05 Dec 2024 16:39:30 +0100
Message-ID: <2214258.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAPY8ntCeYOtBhEKCcygsT-aAHJ8rxo5qP0NdjE9DMJmHCxZzsA@mail.gmail.com>
References: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com> <4950196.GXAFRqVoOG@steina-w> <CAPY8ntCeYOtBhEKCcygsT-aAHJ8rxo5qP0NdjE9DMJmHCxZzsA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Dave,

Am Donnerstag, 5. Dezember 2024, 16:37:01 CET schrieb Dave Stevenson:
> Hi Alexander
>=20
> On Thu, 5 Dec 2024 at 15:22, Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> >
> > Hi Dave,
> >
> > Am Mittwoch, 20. November 2024, 20:17:03 CET schrieb Dave Stevenson:
> > > The imx327 only supports up to 29.4dB of analogue gain, vs
> > > the imx290 going up to 30dB. Both are in 0.3dB steps.
> >
> > While I agree for 30dB on imx290, my (maybe outdated) Rev0.2 datasheet =
says
> > up to 27dB in 0.3dB steps.
>=20
> For IMX327, I have revision E17Z06B93 2019/03/25.
>=20
> The revision control section for Rev0.3 lists
> Page 1: "Correction: Max analog gain 27dB - 29.4dB"
> Page 74: "Correction: Max Gain 69dB -> 71.4dB"
>=20
> The graph in "Gain Adjustment Function" (page 74) also shows values
> above 27dB as being purely analogue gain. Certainly 0x62 is red for
> analogue, which would be a gain of 29.4dB. The next dot is 0x64 (30dB)
> and blue, so we have to trust the text for 0x63 being 29.4dB analogue
> and 0.3dB digital gain.
>=20
> So I'm happy that the limit is 29.4dB.

Okay, this is a newer datasheet. So assume this is correct.

Thanks for clarification.
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Best regards,
Alexander


>   Dave
>=20
> > Despite that this change looks good.
> >
> > Best regards,
> > Alexander
> >
> > > As we now have model specific config, fix this mismatch,
> > > and delete the comment referencing it.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  drivers/media/i2c/imx290.c | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index ee698c99001d..da654deb444a 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -176,6 +176,7 @@ struct imx290_model_info {
> > >       enum imx290_colour_variant colour_variant;
> > >       const struct cci_reg_sequence *init_regs;
> > >       size_t init_regs_num;
> > > +     unsigned int max_analog_gain;
> > >       const char *name;
> > >  };
> > >
> > > @@ -876,14 +877,10 @@ static int imx290_ctrl_init(struct imx290 *imx2=
90)
> > >        * up to 72.0dB (240) add further digital gain. Limit the range=
 to
> > >        * analog gain only, support for digital gain can be added sepa=
rately
> > >        * if needed.
> > > -      *
> > > -      * The IMX327 and IMX462 are largely compatible with the IMX290=
, but
> > > -      * have an analog gain range of 0.0dB to 29.4dB and 42dB of dig=
ital
> > > -      * gain. When support for those sensors gets added to the drive=
r, the
> > > -      * gain control should be adjusted accordingly.
> > >        */
> > >       v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > > -                       V4L2_CID_ANALOGUE_GAIN, 0, 100, 1, 0);
> > > +                       V4L2_CID_ANALOGUE_GAIN, 0,
> > > +                       imx290->model->max_analog_gain, 1, 0);
> > >
> > >       /*
> > >        * Correct range will be determined through imx290_ctrl_update =
setting
> > > @@ -1441,18 +1438,21 @@ static const struct imx290_model_info imx290_=
models[] =3D {
> > >               .colour_variant =3D IMX290_VARIANT_COLOUR,
> > >               .init_regs =3D imx290_global_init_settings_290,
> > >               .init_regs_num =3D ARRAY_SIZE(imx290_global_init_settin=
gs_290),
> > > +             .max_analog_gain =3D 100,
> > >               .name =3D "imx290",
> > >       },
> > >       [IMX290_MODEL_IMX290LLR] =3D {
> > >               .colour_variant =3D IMX290_VARIANT_MONO,
> > >               .init_regs =3D imx290_global_init_settings_290,
> > >               .init_regs_num =3D ARRAY_SIZE(imx290_global_init_settin=
gs_290),
> > > +             .max_analog_gain =3D 100,
> > >               .name =3D "imx290",
> > >       },
> > >       [IMX290_MODEL_IMX327LQR] =3D {
> > >               .colour_variant =3D IMX290_VARIANT_COLOUR,
> > >               .init_regs =3D imx290_global_init_settings_327,
> > >               .init_regs_num =3D ARRAY_SIZE(imx290_global_init_settin=
gs_327),
> > > +             .max_analog_gain =3D 98,
> > >               .name =3D "imx327",
> > >       },
> > >  };
> > >
> > >
> >
> >
> > --
> > TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> > Amtsgericht M=FCnchen, HRB 105018
> > Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> > http://www.tq-group.com/
> >
> >
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



