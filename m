Return-Path: <linux-media+bounces-41531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B27A6B3F8E6
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 10:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE5F4189433B
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 08:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9562E9EB8;
	Tue,  2 Sep 2025 08:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y4QJEfV4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568752E9EAC;
	Tue,  2 Sep 2025 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756802415; cv=none; b=UT/+0z8gOS6RgYsHPcXXErJcLcM6qkcKkY0t30EvvCXofLfysy64oruv8BITtWThPId51i6BBcoqafI7wc2/nFcI0ouBP+nq1CDULr2uHfqJ/T5cYUB0+NitPQRkbH9BvSD9HQLxSjs5YgOtgm7oh9IW3xpjrGfF7Vco3sLKDyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756802415; c=relaxed/simple;
	bh=uW30a3YGTsj0W+a1T1uBxXtDwEFQcaARUE4pQoMLTho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vxd1ofCkRQXAfRMIVEwZSSbR95XMZN3nJimEHZoFgS71nxpDMHPxGH8sik6yAr3itqnXOkI0txgqx6+/4Vwktd1RbSt0evoOimOlO2FXD8gqOTPnr9aivVp1JzCMurcKOa6Uubu8W3EdB5J/RV/rXpGLnuTdjp65eIKlKF4/iQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Y4QJEfV4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 16AAE8D4;
	Tue,  2 Sep 2025 10:39:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756802345;
	bh=uW30a3YGTsj0W+a1T1uBxXtDwEFQcaARUE4pQoMLTho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y4QJEfV44G6twamlObXx/YUAwG4jsdoQmQZ0+PVfIeC6qznJSEbkOUgh5TP82K8+b
	 UwpKKOye4Z3lvjYOeQqzYHikdnDKSG33TVMIx+RPavpwIDV8wV3s+knDCyOJkenzoq
	 7/OeHc9NAmbQ2L0duFwCNJGHXztiyUQ1oiQ51X3k=
Date: Tue, 2 Sep 2025 10:39:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "G.N. Zhou" <guoniu.zhou@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <frank.li@nxp.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH v5 3/4] media: imx8mq-mipi-csi2: Explicitly
 release reset
Message-ID: <20250902083952.GE13448@pendragon.ideasonboard.com>
References: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
 <20250901-csi2_imx8ulp-v5-3-67964d1471f3@nxp.com>
 <20250901153632.GA13448@pendragon.ideasonboard.com>
 <AS8PR04MB9080AD8135277660ACE41FF0FA06A@AS8PR04MB9080.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AS8PR04MB9080AD8135277660ACE41FF0FA06A@AS8PR04MB9080.eurprd04.prod.outlook.com>

On Tue, Sep 02, 2025 at 02:21:58AM +0000, G.N. Zhou wrote:
> On Monday, September 1, 2025 11:37 PM, Laurent Pinchart wrote:
> > On Mon, Sep 01, 2025 at 02:25:31PM +0800, Guoniu Zhou wrote:
> > > Call reset_control_deassert() to explicitly release reset to make sure
> > > reset bits are cleared since platform like i.MX8ULP can't clear reset
> > > bits automatically.
> > >
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > ---
> > >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 8 ++------
> > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > index 2bf11984690af2e687a3217e465697333d9d995d..6b83aa85af42e1dac25cf29056863680c1f89402
> > > 100644
> > > --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > @@ -337,18 +337,14 @@ static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)  {
> > >       int ret;
> > >
> > > -     /*
> > > -      * these are most likely self-clearing reset bits. to make it
> > > -      * more clear, the reset-imx7 driver should implement the
> > > -      * .reset() operation.
> > 
> > What happened to this plan, would it be feasible to implement the
> 
> Since reset in ULP isn't self-clearing, so need to release the reset before return.
> And I think it's no side effect to call reset_control_deassert() here since it makes
> more clear and readable about software reset implementation.
> 
> > .reset() operation in the relevant drivers to be able to use
> > reset_control_reset() here ?
> 
> Implement the .reset() operation in in the relevant drivers should have same effect
> like here. If you agree, I prefer to use the patch here since less changes usually mean
> low risk.

I'm OK with that.

> > > -      */
> > >       ret = reset_control_assert(state->rst);
> > >       if (ret < 0) {
> > >               dev_err(state->dev, "Failed to assert resets: %d\n", ret);
> > >               return ret;
> > >       }
> > >
> > > -     return 0;
> > > +     /* Explicitly release reset to make sure reset bits are cleared. */
> > > +     return reset_control_deassert(state->rst);
> > >  }
> > >
> > >  static void imx8mq_mipi_csi_set_params(struct csi_state *state)

-- 
Regards,

Laurent Pinchart

