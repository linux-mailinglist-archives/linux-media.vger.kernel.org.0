Return-Path: <linux-media+bounces-3584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD6E82B457
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 18:52:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72E3A1C23CFD
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 17:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F119552F8A;
	Thu, 11 Jan 2024 17:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JOvk6OsJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1F952F73
	for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 17:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 240ACAF2;
	Thu, 11 Jan 2024 18:51:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1704995479;
	bh=rvMAyDi2/28n5q2gJe8sEQRhKPzwHB58Mu1Z3cPyYBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JOvk6OsJoTVEVJK0V3BTiSunk0BjhxrshU6MJ6tap9Gt9yWOyMRy0qq22F/I2Tsq/
	 atsC4iE1axCyKZbiMA0L/dCGTRgqYX5rfOnW5MZnaOOOkqg4k7a7zeJ48kh+O8A69L
	 bQteRkYMSx2BQujV4Ubh1YcgG2aQ/0hMvIrPdAPY=
Date: Thu, 11 Jan 2024 19:52:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	NXP Linux Team <linux-imx@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: nxp: isi: Check whether pad is non-NULL before
 access
Message-ID: <20240111175231.GC6806@pendragon.ideasonboard.com>
References: <20231201150614.63300-1-marex@denx.de>
 <20231203165959.GA22111@pendragon.ideasonboard.com>
 <170499538140.3227220.17574476088989803181@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170499538140.3227220.17574476088989803181@ping.linuxembedded.co.uk>

On Thu, Jan 11, 2024 at 05:49:41PM +0000, Kieran Bingham wrote:
> Quoting Laurent Pinchart (2023-12-03 16:59:59)
> > Hi Marek,
> > 
> > Thank you for the patch.
> > 
> > On Fri, Dec 01, 2023 at 04:06:04PM +0100, Marek Vasut wrote:
> > > The pad can be NULL if media controller routing is not set up correctly.
> > > Check whether the pad is NULL before using it, otherwise it is possible
> > > to achieve NULL pointer dereference.
> > 
> > Could you share more information about how to misconfigure the routing ?
> 
> You simply do 'nothing'.

The default configuration should be working one. I think that should
then be fixed too (in a separate patch).

> > > Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > ---
> > > Cc: Fabio Estevam <festevam@gmail.com>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-media@vger.kernel.org
> > > ---
> > >  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > > index 792f031e032ae..44354931cf8a1 100644
> > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > > @@ -160,8 +160,14 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_crossbar *xbar,
> > >       }
> > >  
> > >       pad = media_pad_remote_pad_first(&xbar->pads[sink_pad]);
> > > -     sd = media_entity_to_v4l2_subdev(pad->entity);
> > > +     if (!pad) {
> > > +             dev_dbg(xbar->isi->dev,
> > > +                     "no pad connected to crossbar input %u\n",
> > > +                     sink_pad);
> > > +             return ERR_PTR(-EPIPE);
> > > +     }
> > >  
> > > +     sd = media_entity_to_v4l2_subdev(pad->entity);
> > >       if (!sd) {
> > >               dev_dbg(xbar->isi->dev,
> > >                       "no entity connected to crossbar input %u\n",
> > 
> > -- 
> > Regards,
> > 
> > Laurent Pinchart

-- 
Regards,

Laurent Pinchart

