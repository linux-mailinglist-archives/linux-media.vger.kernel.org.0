Return-Path: <linux-media+bounces-45720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 32676C1170F
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 21:53:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CECE54E0266
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 20:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD9E31CA68;
	Mon, 27 Oct 2025 20:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="mHeCG0mL"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE95263F38;
	Mon, 27 Oct 2025 20:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761598382; cv=pass; b=MEg+DYToXcsdqN+DsR7s8qZHO8EXi4BFzB9KPZIj68Hp2JKazQp0UWV2xciNBiTKqSJpcFJK+XiwUlS3CVvQJg54R9v15FY/7RRB5idE5zY5Qbnkwut5Twc28FDMmvqu1+1bxNmgfSNQHqFf7KizaCbJ4b+ivns+U6mVx2nEa9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761598382; c=relaxed/simple;
	bh=lT4yYQEiXL2fiuo6cZfQdDRFPJblObe8O9TJMORxbec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mjj9/ly+PVlhBJgsfmheac6TPixgMKS01/lQXnf5jU3fxtar+SPDfNl9wlbrx/bez2dUG2hMFNRHG3PKPc46moOU/PQ0EVmI0CVXns2OyaDjcob+EF0yPToyhd2pEbWzDmxLZ4KN5oLsQoZbLrplZVtTf7NCcmtZ6s6fmmys/Xk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=mHeCG0mL; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4cwQgk56dlz49QHV;
	Mon, 27 Oct 2025 22:52:50 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1761598373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PpWJMkv1GotNjvJChkdBR4H/p47JF7KiPPhuGs2SFx8=;
	b=mHeCG0mLr+PonGVs7AXVtS9v7BMOalr0DxIpK71K9pR5OKogAS9QFr+vRcrN6Ep0Fl/djo
	tt6b3M7yxB0vK8GMRQRHs6/63qEDblKZKXHdNa8G63bS/Htfr28u0LHPADeIIgJNfuuXDZ
	6MZlFtUvJb4G4uR6upA3K5sKXzg6NnJPjrTwykuaBNbKWsmQcW03TgD8pqTdGkwlZeuMUt
	S/aLYP8naFX5yf+fj3L+l0MZRG7Q4oued6LK5bjxckv9ibk4Gk1rUxWN/wg7nVgGmrwEAb
	27lhhDE1LKclYYKK31nQ7p+qipmfAxYz3pJAIxgyOsAWGzWOzE6IWp8c2AVa3g==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1761598373; a=rsa-sha256;
	cv=none;
	b=dBcShO51D0+TWSnpaZZPwCKi9AMmKwfhWpqszufIy7uzpIsER0cwSbrMxoPNQ1Apc7BayA
	5BAMnpv62tsL2BekP9Yemcy4sOG9LkJKcBAIDIaMU+Se9l7GgnaYVFsfcPips5wl9PuaU7
	x+aaqHOGix5946TDqbMZBfqPtnYtU/A6m/N64avIM8wJz+u/9zba9L8uwJslSLVzrvjpoD
	FiHObnRDapfC7Yll4xgrtUpnZRVHbSJCiAJEjUt9He3egOe6GE02fC39pD/XCRU6UD0BDn
	TCTRP8da2b4LYaD1dNugF2B/lHYBq1RgT8dlmlGPejc3qNaEPBdavM580oxRXQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1761598373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PpWJMkv1GotNjvJChkdBR4H/p47JF7KiPPhuGs2SFx8=;
	b=EHOyX8RLjurWVZII3Sj0T8BzlBoH3T/kHmRQTV8PBsGVU6gyyUKub606IOAcYincrUxIeJ
	v3C52Tv4JyzcK6efVzw8FAEMe2osrfhoNcpOlKsLIOMaReuvR8sqRSwT5HQZf6ZsaHSRwQ
	/kWf8ns4Y8moblopczksARx7FRnpesf6YQRvsjUK1npadrRk6Rbp3KoR51Uzx0YWF96j83
	5RfNy7e/nvcoun6ynNpAj12FwEfHMz3qKg2ynHb6dkiC/31Sz3wGdqnt2DC+pG1PQeLxLb
	7ChVMMLIrxypHYGIo8/Ec+lknWGx6CGYtRDwwXnIeOElmPglXhMLTGBP2GDYgg==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 7C671634C51;
	Mon, 27 Oct 2025 22:52:50 +0200 (EET)
Date: Mon, 27 Oct 2025 22:52:50 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Frank Li <Frank.li@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 17/31] media: synopsys: move imx6-mipi-csi2.c to
 synopsys/mipi-csi2.c
Message-ID: <aP_bogkrwIkbZIRh@valkosipuli.retiisi.eu>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-17-c9286fbb34b9@nxp.com>
 <aP83D-ndmlv5Jns8@valkosipuli.retiisi.eu>
 <aP+fztk12FK4IWYK@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP+fztk12FK4IWYK@lizhi-Precision-Tower-5810>

Hi Frank,

On Mon, Oct 27, 2025 at 12:37:34PM -0400, Frank Li wrote:
> On Mon, Oct 27, 2025 at 11:10:39AM +0200, Sakari Ailus wrote:
> > Hi Frank,
> >
> > On Thu, Aug 21, 2025 at 04:15:52PM -0400, Frank Li wrote:
> > > Move dw MIPI CSI2 common part drivers/staging/media/imx/imx6-mipi-csi2.c
> > > under synopsys to let more SoC can reuse it.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/media/platform/synopsys/Kconfig                      | 12 ++++++++++++
> > >  drivers/media/platform/synopsys/Makefile                     |  2 ++
> > >  .../imx6-mipi-csi2.c => media/platform/synopsys/mipi-csi2.c} |  0
> > >  drivers/staging/media/imx/Kconfig                            |  1 +
> > >  drivers/staging/media/imx/Makefile                           |  2 +-
> > >  5 files changed, 16 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/platform/synopsys/Kconfig b/drivers/media/platform/synopsys/Kconfig
> > > index 4fd521f78425a96985fa3b6b017deef36631d1a9..e54dad835349d420dead6d5313c0623567c28c0b 100644
> > > --- a/drivers/media/platform/synopsys/Kconfig
> > > +++ b/drivers/media/platform/synopsys/Kconfig
> > > @@ -1,3 +1,15 @@
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > >
> > > +config VIDEO_SYNOPSYS_MIPI_CSI2
> > > +        tristate "Synopsys DesignWare MIPI CSI2 Receiver common library"
> > > +        depends on VIDEO_DEV
> > > +        select MEDIA_CONTROLLER
> > > +        select VIDEO_V4L2_SUBDEV_API
> > > +        select VIDEOBUF2_DMA_CONTIG
> > > +        help
> > > +          Common library for MIPI CSI2 Controller.
> > > +
> > > +          To compile this driver as a module, choose M here. The module
> > > +          will be called synopsys_hdmirx
> > > +
> > >  source "drivers/media/platform/synopsys/hdmirx/Kconfig"
> > > diff --git a/drivers/media/platform/synopsys/Makefile b/drivers/media/platform/synopsys/Makefile
> > > index 3b12c574dd67c072901108d88cad64ca3a723938..045ed3177738e6d28aa223804b79e6774e141dc8 100644
> > > --- a/drivers/media/platform/synopsys/Makefile
> > > +++ b/drivers/media/platform/synopsys/Makefile
> > > @@ -1,2 +1,4 @@
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > >  obj-y += hdmirx/
> > > +
> > > +obj-$(CONFIG_VIDEO_SYNOPSYS_MIPI_CSI2) += mipi-csi2.o
> >
> > Please give the module a more specific name.
> 
> How about dw-mipi-csi2.o? but it is already under synopsys. Our spec only
> show synopsys mipi csi2, and have not code naming for it.
> 
> Or mipi-csi2-v150.o (but it also supports more versions).
> 
> which one do you prefer?

I'd use dw-mipi-csi2.o.

-- 
Regards,

Sakari Ailus

