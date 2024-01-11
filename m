Return-Path: <linux-media+bounces-3583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B466F82B451
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 18:50:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9ACF1C23D68
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 17:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A26852F78;
	Thu, 11 Jan 2024 17:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KGpPxU1C"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C496B50276
	for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 17:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB6A7AF2;
	Thu, 11 Jan 2024 18:48:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1704995319;
	bh=CPJMLiFl0h1s+NuHs6XzxHLFQOo41N2qclqBgNPo/PI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KGpPxU1CSDKUqEZ8vOCSnQWH+kh+18dY1uhfpiMiKJUVtASa5aIaweSxyjW0LxeSe
	 16v9hfYDFCwwCqKONlSyDcJZ/q7ESNvT5DBwyFEQTOtWL4PHuftlunU+eKSOWUUTXf
	 Ru0H7CKLDjG8tDV2jBWvknV9a9c6pPmWEwIbe4g8=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231203165959.GA22111@pendragon.ideasonboard.com>
References: <20231201150614.63300-1-marex@denx.de> <20231203165959.GA22111@pendragon.ideasonboard.com>
Subject: Re: [PATCH] media: nxp: isi: Check whether pad is non-NULL before access
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Marek Vasut <marex@denx.de>
Date: Thu, 11 Jan 2024 17:49:41 +0000
Message-ID: <170499538140.3227220.17574476088989803181@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Laurent Pinchart (2023-12-03 16:59:59)
> Hi Marek,
>=20
> Thank you for the patch.
>=20
> On Fri, Dec 01, 2023 at 04:06:04PM +0100, Marek Vasut wrote:
> > The pad can be NULL if media controller routing is not set up correctly.
> > Check whether the pad is NULL before using it, otherwise it is possible
> > to achieve NULL pointer dereference.
>=20
> Could you share more information about how to misconfigure the routing ?

You simply do 'nothing'.

--
Kieran


>=20
> > Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > ---
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-media@vger.kernel.org
> > ---
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/=
drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > index 792f031e032ae..44354931cf8a1 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > @@ -160,8 +160,14 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_cros=
sbar *xbar,
> >       }
> > =20
> >       pad =3D media_pad_remote_pad_first(&xbar->pads[sink_pad]);
> > -     sd =3D media_entity_to_v4l2_subdev(pad->entity);
> > +     if (!pad) {
> > +             dev_dbg(xbar->isi->dev,
> > +                     "no pad connected to crossbar input %u\n",
> > +                     sink_pad);
> > +             return ERR_PTR(-EPIPE);
> > +     }
> > =20
> > +     sd =3D media_entity_to_v4l2_subdev(pad->entity);
> >       if (!sd) {
> >               dev_dbg(xbar->isi->dev,
> >                       "no entity connected to crossbar input %u\n",
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

