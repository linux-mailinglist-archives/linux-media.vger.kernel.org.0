Return-Path: <linux-media+bounces-35596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B41AE3A8C
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 11:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53039188742B
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 09:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CDC23D285;
	Mon, 23 Jun 2025 09:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s1cju4yn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E3A23C8A8;
	Mon, 23 Jun 2025 09:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750671095; cv=none; b=pNWSsZKPV6NPX0iehKySVSrcSn78KYYvUaTtczmqdgSJI7hQjurt6ZQwXNaxeHEKLgWsVMJcB1kxfoXfTMTHYERQDk++Wpfg1JGjDVa6JOMq2O9MA4XllcrLMZBPyateF6j4y+kMD1k2vNGWyUz7HLLGZh5zUzhIPz9UE//AHfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750671095; c=relaxed/simple;
	bh=VsdfeJJ1hbGO21E4KqYifLzRCmMbubAPRj++2/0zit4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tD7gKDYw9ZCGVGODKtXj4GIBfyfg31xwplA2kSp8HaDeHUA1BADyltnkejRCqpB5I0Us8t0O6Uzv4m2tAVxk24eovvIvuz5iMzmgcHJ2CbdAfsdE/7pAfTGBSw9UqrGOKB9tIAd+TDcTyMokIzDt95lod7uw+hDQuPJ/+mRjpNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s1cju4yn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C07CC4CEF2;
	Mon, 23 Jun 2025 09:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750671095;
	bh=VsdfeJJ1hbGO21E4KqYifLzRCmMbubAPRj++2/0zit4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s1cju4ynEtfb27DxqAfIyPWw+QccoHZXy/cILRWXRC9BCUUTcYZth671pV6kVxzW3
	 bZS+YtCZyyz1futjCyDE8xgu6wjRpKdIgapgHzGyhFEMEg1YT50DHS0tUoRD1Ibsll
	 R+MnnGbwCK0JGc4yk8PVPCja+nHEskLMbz7eSmNWvf4o9UXKvoOVl7DBBh6XIIRJp1
	 n59zpYwXG+SCItsUBO3LfqqZobHpaQzqIfq56gMI+9W10P9GuVO3AF5muMHfr3gU2y
	 86n8lkhz0pqmBQdZDfL2DGLieSB8KPSipauN7EMGINil27ltzveq2tnprwnPXGDo+A
	 t0yF8DokTlciA==
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5290be1aedcso2834848e0c.1;
        Mon, 23 Jun 2025 02:31:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUShzGP1/S/RYbwfyx903qkLuD65goKa99Ua3mEB6g8+kE/fdTcNu7Zaaguyqqnqr9Mg4m0gCbo5gZ5MGk=@vger.kernel.org, AJvYcCUtmrqE+682qLx8qtkaZ2rTBQYX2HhT0y4MnnpLn8eq+zRvgJER6cYMuKPiRkHhRpxFKPi2sjdOmUbj9wok@vger.kernel.org, AJvYcCWNy+lvtnYN93X/F5bPATlznQaI6MwqpFgyuU/UkLAzgtT9b8wyaA+pPz6qA/EljxFX7ujDgidasrnvD8c=@vger.kernel.org, AJvYcCXshy+zEW1rbzQ9F9imrReta9KHPF7qujU3eqj4Rx8k12kaO1DKV52aPizzYtkhcoOzVbCAkZ7Lr4Ob@vger.kernel.org
X-Gm-Message-State: AOJu0YyA/P8V5xiIcTBbDl7BOBQq7F+NjHQLaF+DAc3XqkxdlzprzrvY
	uD7hWzW1lBQBQTYRLyHrQEDUYRDJn+Mk9rdKip0S/rAIwpzvKSMeiQN5dBo+++OQBWRCn7lzY2b
	WUDX1QdY5zyhEKN+XWCluc9wDJZVXt2Y=
X-Google-Smtp-Source: AGHT+IFz8HjnezG1zR147UloDiu7tc7NZbIaEkNDb0AV0ej/bEverhGUrGz1fw9s6NlbMHi5uUyf6V0APJORZMqK2bI=
X-Received: by 2002:a05:6122:4882:b0:520:4806:a422 with SMTP id
 71dfb90a1353d-531aeb929d9mr5790320e0c.3.1750671094254; Mon, 23 Jun 2025
 02:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
 <20250621-imx214_ccs_pll-v4-3-12178e5eb989@apitzsch.eu> <20250621181751.GA9125@pendragon.ideasonboard.com>
 <ed0b8fe3a20111477cafb1de7b399afb99caaa0c.camel@apitzsch.eu> <20250622171320.GA826@pendragon.ideasonboard.com>
In-Reply-To: <20250622171320.GA826@pendragon.ideasonboard.com>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Mon, 23 Jun 2025 11:31:17 +0200
X-Gmail-Original-Message-ID: <CAPybu_2WF=t4jnwsrTSCiSZ4T7Sck4-fCoub33=P_6KvdZ5ePg@mail.gmail.com>
X-Gm-Features: Ac12FXxTrZtaPEPozn4yeGUBc3IN-yDzlj7J5zciRPbs1FoIczjQDRPa5pgF3Bk
Message-ID: <CAPybu_2WF=t4jnwsrTSCiSZ4T7Sck4-fCoub33=P_6KvdZ5ePg@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 3/5] media: i2c: imx214: Make use of CCS PLL calculator
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 7:13=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Andr=C3=A9,
>
> On Sun, Jun 22, 2025 at 05:34:56PM +0200, Andr=C3=A9 Apitzsch wrote:
> > Am Samstag, dem 21.06.2025 um 21:17 +0300 schrieb Laurent Pinchart:
> > > On Sat, Jun 21, 2025 at 11:37:27AM +0200, Andr=C3=A9 Apitzsch via B4 =
Relay wrote:
> > > > From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > > >
> > > > Calculate PLL parameters based on clock frequency and link
> > > > frequency.
> > > >
> > > > Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > > > ---
> > > >  drivers/media/i2c/Kconfig  |   1 +
> > > >  drivers/media/i2c/imx214.c | 213 +++++++++++++++++++++++++++++++++=
+++---------
> > > >  2 files changed, 175 insertions(+), 39 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > index
> > > > e68202954a8fd4711d108cf295d5771246fbc406..08db8abeea218080b0bf5bfe6
> > > > cf82f1c0b100c4a 100644
> > > > --- a/drivers/media/i2c/Kconfig
> > > > +++ b/drivers/media/i2c/Kconfig
> > > > [..]
> > > > @@ -1224,42 +1336,52 @@ static int imx214_parse_fwnode(struct
> > > > device *dev)
> > > >   if (!endpoint)
> > > >   return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
> > > >
> > > > - ret =3D v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
> > > > + bus_cfg->bus_type =3D V4L2_MBUS_CSI2_DPHY;
> > > > + ret =3D v4l2_fwnode_endpoint_alloc_parse(endpoint, bus_cfg);
> > > > + fwnode_handle_put(endpoint);
> > >
> > > ... drop this. Up to you.
> > >
> > > >   if (ret) {
> > > >   dev_err_probe(dev, ret, "parsing endpoint node failed\n");
> > > > - goto done;
> > > > + goto error;
> > >
> > > You can return ret here.
> > >
> > > >   }
> > > >
> > > >   /* Check the number of MIPI CSI2 data lanes */
> > > > - if (bus_cfg.bus.mipi_csi2.num_data_lanes !=3D 4) {
> > > > + if (bus_cfg->bus.mipi_csi2.num_data_lanes !=3D 4) {
> > > >   ret =3D dev_err_probe(dev, -EINVAL,
> > > >       "only 4 data lanes are currently supported\n");
> > > > - goto done;
> > > > + goto error;
> > > >   }
> > > >
> > > > - if (bus_cfg.nr_of_link_frequencies !=3D 1)
> > > > + if (bus_cfg->nr_of_link_frequencies !=3D 1)
> > > >   dev_warn(dev, "Only one link-frequency supported, please review
> > > > your DT. Continuing anyway\n");
> > >
> > > Now that the driver can calculate PLL parameters dynamically, it
> > > would be nice to lift this restriction and make the link frequency
> > > control writable, in a separate patch on top of this series.
> >
> > Maybe this could be postponed, as I don't have any use for it at the
> > moment and I don't want to further delay this series.
>
> When I said "on top", I didn't mean in a new version of this series. We
> can merge this first, and then lift this restriction. I don't have an
> imx214-based device so I can't do it myself and test it :-/
>
> > > > - for (i =3D 0; i < bus_cfg.nr_of_link_frequencies; i++) {
> > > > - if (bus_cfg.link_frequencies[i] =3D=3D IMX214_DEFAULT_LINK_FREQ)
> > > > + for (i =3D 0; i < bus_cfg->nr_of_link_frequencies; i++) {
> > > > + u64 freq =3D bus_cfg->link_frequencies[i];
> > > > + struct ccs_pll pll;
> > > > +
> > > > + if (!imx214_pll_calculate(imx214, &pll, freq))
> > > >   break;
> > > > - if (bus_cfg.link_frequencies[i] =3D=3D
> > > > -     IMX214_DEFAULT_LINK_FREQ_LEGACY) {
> > > > + if (freq =3D=3D IMX214_DEFAULT_LINK_FREQ_LEGACY) {
> > > >   dev_warn(dev,
> > > >   "link-frequencies %d not supported, please review your DT.
> > > > Continuing anyway\n",
> > > >   IMX214_DEFAULT_LINK_FREQ);
> > > > + freq =3D IMX214_DEFAULT_LINK_FREQ;
> > > > + if (imx214_pll_calculate(imx214, &pll, freq))
> > > > + continue;
> > > > + bus_cfg->link_frequencies[i] =3D freq;
> > > >   break;
> > > >   }
> > >
> > > How about separating the IMX214_DEFAULT_LINK_FREQ_LEGACY check from
> > > the PLL calculation ? Something like
> > >
> > >  u64 freq =3D bus_cfg->link_frequencies[i];
> > >  struct ccs_pll pll;
> > >
> > >  if (freq =3D=3D IMX214_DEFAULT_LINK_FREQ_LEGACY) {
> > >  dev_warn(dev,
> > >  "link-frequencies %d not supported, please review your DT.
> > > Continuing anyway\n",
> > >  IMX214_DEFAULT_LINK_FREQ);
> > >  freq =3D IMX214_DEFAULT_LINK_FREQ;
> > >  bus_cfg->link_frequencies[i] =3D freq;
> > >  }
> >
> > With PLL calculation, 480000000 (=3DIMX214_DEFAULT_LINK_FREQ_LEGACY)
> > might be a valid link frequency explicitly set by the user. I'm not
> > sure whether it is a good idea to overwrite the link frequency, before
> > trying the PLL calculation. That's why I would keep the code the way it
> > is.
>
> The current code accepts both IMX214_DEFAULT_LINK_FREQ (600 MHz) and
> IMX214_DEFAULT_LINK_FREQ_LEGACY (400 MHz), and programs the PLL with (as
> far as I understand) a 600 MHz clock frequency in either case. To avoid
> a change in behaviour, I think overriding the 400 MHz frequency with 600
> MHz in this patch would be best. We could then drop that in a later
> patch, possibly by patching the clock frequency in a platform-specific
> driver instead of the imx214 driver.
>
> > >  if (!imx214_pll_calculate(imx214, &pll, freq))
> > >  break;
> > >
> > > It will then become easier to drop this legacy support from the
> > > driver. What platform(s) are know to specify an incorrect link
> > > frequency ?
> >
> > I don't know.
>
> Ricardo, do you have any information about this ?


This was for a development platform for Qualcomm, think of a pizero
like, but with a Snapdragon device.

There was a Qtechnology product based on that platform. I asked them
if they could provide me a device for testing, but it has been
discontinued and  replaced with something better.

We can start to deprecate the clock quirk if you want.

>
> > > >   }
> > > >
> > > > - if (i =3D=3D bus_cfg.nr_of_link_frequencies)
> > > > + if (i =3D=3D bus_cfg->nr_of_link_frequencies)
> > > >   ret =3D dev_err_probe(dev, -EINVAL,
> > > > -     "link-frequencies %d not supported, please review your DT\n",
> > > > -     IMX214_DEFAULT_LINK_FREQ);
> > > > +     "link-frequencies %lld not supported, please review your
> > > > DT\n",
> > > > +     bus_cfg->nr_of_link_frequencies ?
> > > > +     bus_cfg->link_frequencies[0] : 0);
> > > >
> > > > -done:
> > > > - v4l2_fwnode_endpoint_free(&bus_cfg);
> > > > - fwnode_handle_put(endpoint);
> > > > + return 0;
> > > > +
> > > > +error:
> > > > + v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
> > > >   return ret;
> > > >  }
> > > >
> > > > @@ -1299,7 +1421,7 @@ static int imx214_probe(struct i2c_client
> > > > *client)
> > > >   return dev_err_probe(dev, PTR_ERR(imx214->regmap),
> > > >        "failed to initialize CCI\n");
> > > >
> > > > - ret =3D imx214_parse_fwnode(dev);
> > > > + ret =3D imx214_parse_fwnode(dev, imx214);
> > > >   if (ret)
> > > >   return ret;
> > > >
> > > > @@ -1310,7 +1432,9 @@ static int imx214_probe(struct i2c_client
> > > > *client)
> > > >   * Enable power initially, to avoid warnings
> > > >   * from clk_disable on power_off
> > > >   */
> > > > - imx214_power_on(imx214->dev);
> > > > + ret =3D imx214_power_on(imx214->dev);
> > > > + if (ret < 0)
> > > > + goto error_fwnode;
> > >
> > > This change seems to belong to a separate patch.
> > >
> > > >
> > > >   ret =3D imx214_identify_module(imx214);
> > > >   if (ret)
> > > > @@ -1341,6 +1465,12 @@ static int imx214_probe(struct i2c_client
> > > > *client)
> > > >   pm_runtime_set_active(imx214->dev);
> > > >   pm_runtime_enable(imx214->dev);
> > > >
> > > > + ret =3D imx214_pll_update(imx214);
> > > > + if (ret < 0) {
> > > > + dev_err_probe(dev, ret, "failed to update PLL\n");
> > > > + goto error_subdev_cleanup;
> > > > + }
> > >
> > > I would move this to imx214_ctrls_init().
> > >
> > > > +
> > > >   ret =3D v4l2_async_register_subdev_sensor(&imx214->sd);
> > > >   if (ret < 0) {
> > > >   dev_err_probe(dev, ret,
> > > > @@ -1366,6 +1496,9 @@ static int imx214_probe(struct i2c_client
> > > > *client)
> > > >  error_power_off:
> > > >   imx214_power_off(imx214->dev);
> > > >
> > > > +error_fwnode:
> > > > + v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
> > > > +
> > > >   return ret;
> > > >  }
> > > >
> > > > @@ -1378,6 +1511,8 @@ static void imx214_remove(struct i2c_client
> > > > *client)
> > > >   v4l2_subdev_cleanup(sd);
> > > >   media_entity_cleanup(&imx214->sd.entity);
> > > >   v4l2_ctrl_handler_free(&imx214->ctrls);
> > > > + v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
> > > > +
> > > >   pm_runtime_disable(&client->dev);
> > > >   if (!pm_runtime_status_suspended(&client->dev)) {
> > > >   imx214_power_off(imx214->dev);
>
> --
> Regards,
>
> Laurent Pinchart

