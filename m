Return-Path: <linux-media+bounces-43241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A52B2BA2FFC
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 10:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E074E1C21977
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 08:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67FF296BB6;
	Fri, 26 Sep 2025 08:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZrQsmMkv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A40C25DAFF;
	Fri, 26 Sep 2025 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758876393; cv=none; b=MT0yPoSaR1rkbFX02//IEWSivAJbn3wjvd0+zbjPKk5IvnwIchDjZQjXtZv1VkmGDw0gKZ9YZRaYDyylh3xGViyRMtE/hf+lABXNc2r7G76+malm8xSdlL/RvPdTJN7a25vFNNSX2mEelr/EIrFTb4qXAvumJ0Z1eatNtFu8RDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758876393; c=relaxed/simple;
	bh=IUA1ANsoSDf4ynFNcNEX5PCTUFJtU9aJS/An4xPjPW4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=DDi3AwdQF2kATtzTJqBpftKNFac1QUKAexMh93gJqwnTPHic+2qrGvpRvrmk3ODNGdpXSQR1SCuV0pUro9UlUAuAfu1/AxqM9XMsu7JhgAIN3kAgdAOKxo739pSGV92OkeY6SHzLA6jBLutZhFmDOEEifYj4S11fJLV2MJ/P/8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZrQsmMkv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from thinkpad.ideasonboard.com (cpc90716-aztw32-2-0-cust408.18-1.cable.virginm.net [86.26.101.153])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43FF81807;
	Fri, 26 Sep 2025 10:45:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758876301;
	bh=IUA1ANsoSDf4ynFNcNEX5PCTUFJtU9aJS/An4xPjPW4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZrQsmMkvFij0yY31VIvySARzvzdhWNfhnXkQnUrONYi17lCK3I/2qDmzyhBdTSJxL
	 dN3HbjbpWxRuWVge+mXh5887a+MeWz59bmy6T+ocVoozAj0AHJ1zwKwW1L6iKWBrJi
	 GQ2d7SrtwAsUz2uQQAegMhsnMOBp5a89Epi8fOsY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aNW4zDRAREUZ7v8k@lizhi-Precision-Tower-5810>
References: <20250925-active-data-lanes-v4-0-8b54e3d5af6c@ideasonboard.com> <20250925-active-data-lanes-v4-3-8b54e3d5af6c@ideasonboard.com> <aNW4zDRAREUZ7v8k@lizhi-Precision-Tower-5810>
Subject: Re: [PATCH v4 3/4] media: imx-mipi-csis: Store the number of data_lanes configured in dt
From: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
To: Frank Li <Frank.li@nxp.com>
Date: Fri, 26 Sep 2025 09:46:22 +0100
Message-ID: <175887638283.180868.8800087471301856681@isaac-ThinkPad-T16-Gen-2>
User-Agent: alot/0.10

Hi Frank,

Thank you for your review!

Quoting Frank Li (2025-09-25 22:49:00)
> On Thu, Sep 25, 2025 at 04:54:28PM +0100, Isaac Scott wrote:
> > The number of active data lanes in use on a MIPI CSI2 bus is not
> > necessarily always the maximum. To allow us to configure the number of
> > data lanes actively in use, store the maximum to ensure we can configure
> > a number of data lanes that is supported.
> >
>=20
> This patch just add num_data_lanes, and use csis->num_data_lanes instead
> of bus.num_data_lanes.
>=20
> So commit message not reflect what you did
>=20
> "
> media: imx-mipi-csis: Add num_data_lanes in mipi_csis_device
>=20
> Add num_data_lanes field in mipi_csis_device, set equal to
> csis->bus.num_data_lanes. Prepare to support cases where the number of
> active data lanes differs from the maximum supported lanes.
>=20
> No functional changes.
> "

Yes, that is much better, thank you for your suggestions (on this and
the next patch), I'll wait to see if there are any other comments and
improve my commit messages in the next version.

Best wishes,
Isaac

>=20
> Frank
>=20
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media=
/platform/nxp/imx-mipi-csis.c
> > index 7c2a679dca2e..838a1ad123b5 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -351,6 +351,8 @@ struct mipi_csis_device {
> >       u32 hs_settle;
> >       u32 clk_settle;
> >
> > +     unsigned int num_data_lanes;
> > +
> >       spinlock_t slock;       /* Protect events */
> >       struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
> >       struct dentry *debugfs_root;
> > @@ -573,7 +575,7 @@ static void mipi_csis_system_enable(struct mipi_csi=
s_device *csis, int on)
> >       val =3D mipi_csis_read(csis, MIPI_CSIS_DPHY_CMN_CTRL);
> >       val &=3D ~MIPI_CSIS_DPHY_CMN_CTRL_ENABLE;
> >       if (on) {
> > -             mask =3D (1 << (csis->bus.num_data_lanes + 1)) - 1;
> > +             mask =3D (1 << (csis->num_data_lanes + 1)) - 1;
> >               val |=3D (mask & MIPI_CSIS_DPHY_CMN_CTRL_ENABLE);
> >       }
> >       mipi_csis_write(csis, MIPI_CSIS_DPHY_CMN_CTRL, val);
> > @@ -623,7 +625,7 @@ static int mipi_csis_calculate_params(struct mipi_c=
sis_device *csis,
> >
> >       /* Calculate the line rate from the pixel rate. */
> >       link_freq =3D v4l2_get_link_freq(csis->source.pad, csis_fmt->widt=
h,
> > -                                    csis->bus.num_data_lanes * 2);
> > +                                    csis->num_data_lanes * 2);
> >       if (link_freq < 0) {
> >               dev_err(csis->dev, "Unable to obtain link frequency: %d\n=
",
> >                       (int)link_freq);
> > @@ -668,7 +670,7 @@ static void mipi_csis_set_params(struct mipi_csis_d=
evice *csis,
> >                                const struct v4l2_mbus_framefmt *format,
> >                                const struct csis_pix_format *csis_fmt)
> >  {
> > -     int lanes =3D csis->bus.num_data_lanes;
> > +     int lanes =3D csis->num_data_lanes;
> >       u32 val;
> >
> >       val =3D mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
> > @@ -1366,8 +1368,9 @@ static int mipi_csis_async_register(struct mipi_c=
sis_device *csis)
> >       }
> >
> >       csis->bus =3D vep.bus.mipi_csi2;
> > +     csis->num_data_lanes =3D csis->bus.num_data_lanes;
> >
> > -     dev_dbg(csis->dev, "data lanes: %d\n", csis->bus.num_data_lanes);
> > +     dev_dbg(csis->dev, "max data lanes: %d\n", csis->bus.num_data_lan=
es);
> >       dev_dbg(csis->dev, "flags: 0x%08x\n", csis->bus.flags);
> >
> >       asd =3D v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
> >
> > --
> > 2.43.0
> >

