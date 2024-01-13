Return-Path: <linux-media+bounces-3663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D386A82C849
	for <lists+linux-media@lfdr.de>; Sat, 13 Jan 2024 01:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 078881C22897
	for <lists+linux-media@lfdr.de>; Sat, 13 Jan 2024 00:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A95C36B;
	Sat, 13 Jan 2024 00:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UGOCvBoT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A1D1847
	for <linux-media@vger.kernel.org>; Sat, 13 Jan 2024 00:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C90ECD1;
	Sat, 13 Jan 2024 01:20:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1705105213;
	bh=R/zzRox++yMy7MO30KGrApvAfhvsXJGcF9atA8vtXic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UGOCvBoTeIr+KSef0nmTO76unwVAUjjIoICXlx0I9p5qqaYtV5TsoA9DdrMxO8MWL
	 zWtxsN22G/93i7iTGcup4fkosvbfu4yAv2pcq2Kq/jNnCHQplfZ5+12LNnCbZV8FMH
	 dVWtsGWPFPWYrei01bymcUnYSLIT2/Wi6vxMTq5c=
Date: Sat, 13 Jan 2024 02:21:26 +0200
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
Message-ID: <20240113002126.GA10307@pendragon.ideasonboard.com>
References: <20231201150614.63300-1-marex@denx.de>
 <20231203165959.GA22111@pendragon.ideasonboard.com>
 <170499538140.3227220.17574476088989803181@ping.linuxembedded.co.uk>
 <20240111175231.GC6806@pendragon.ideasonboard.com>
 <20240113000359.GA5439@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240113000359.GA5439@pendragon.ideasonboard.com>

On Sat, Jan 13, 2024 at 02:03:59AM +0200, Laurent Pinchart wrote:
> On Thu, Jan 11, 2024 at 07:52:33PM +0200, Laurent Pinchart wrote:
> > On Thu, Jan 11, 2024 at 05:49:41PM +0000, Kieran Bingham wrote:
> > > Quoting Laurent Pinchart (2023-12-03 16:59:59)
> > > > Hi Marek,
> > > > 
> > > > Thank you for the patch.
> > > > 
> > > > On Fri, Dec 01, 2023 at 04:06:04PM +0100, Marek Vasut wrote:
> > > > > The pad can be NULL if media controller routing is not set up correctly.
> > > > > Check whether the pad is NULL before using it, otherwise it is possible
> > > > > to achieve NULL pointer dereference.
> > > > 
> > > > Could you share more information about how to misconfigure the routing ?
> > > 
> > > You simply do 'nothing'.
> > 
> > The default configuration should be working one. I think that should
> > then be fixed too (in a separate patch).
> 
> I managed to reproduce the issue (I had to heavily hack libcamera, by
> default it would reject incorrect configurations before triggering the
> kernel bug). The default configuration of the crossbar switch is fine,
> this patch is the right fix.

Actually, I think this should be fixed by catching the pipeline
misconfiguration at validation time, not when enabling streams. It would
make this patch redundant, but I think we can still merge it for
additional safety, especially as it may take more time to implement the
validation time check.

> I'd like to expand the commit message with a clearer description of the
> erronous configuration. Marek, are you fine with the following commit
> message ?
> 
> --------
> When translating source to sink streams in the crossbar subdev, the
> driver tries to locate the remote subdev connected to the sink pad. The
> remote pad may be NULL, if userspace tries to enable a stream that ends
> at an unconnected crossbar sink. When that occurs, the driver
> dereferences the NULL pad, leading to a crash.
> 
> Prevent the crash by checking if the pad is NULL before using it, and
> return an error if it is.
> --------
> 
> If so I'll update it locally, no need for a new version.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > > > > Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> > > > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > > > ---
> > > > > Cc: Fabio Estevam <festevam@gmail.com>
> > > > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > > Cc: linux-media@vger.kernel.org
> > > > > ---
> > > > >  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 8 +++++++-
> > > > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > > > > index 792f031e032ae..44354931cf8a1 100644
> > > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > > > > @@ -160,8 +160,14 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_crossbar *xbar,
> > > > >       }
> > > > >  
> > > > >       pad = media_pad_remote_pad_first(&xbar->pads[sink_pad]);
> > > > > -     sd = media_entity_to_v4l2_subdev(pad->entity);
> > > > > +     if (!pad) {
> > > > > +             dev_dbg(xbar->isi->dev,
> > > > > +                     "no pad connected to crossbar input %u\n",
> > > > > +                     sink_pad);
> > > > > +             return ERR_PTR(-EPIPE);
> > > > > +     }
> > > > >  
> > > > > +     sd = media_entity_to_v4l2_subdev(pad->entity);
> > > > >       if (!sd) {
> > > > >               dev_dbg(xbar->isi->dev,
> > > > >                       "no entity connected to crossbar input %u\n",

-- 
Regards,

Laurent Pinchart

