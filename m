Return-Path: <linux-media+bounces-42907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CAEB8F683
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 10:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A37F18976F3
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 08:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6971F2FD1A5;
	Mon, 22 Sep 2025 08:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Pzp+430z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ADE244685;
	Mon, 22 Sep 2025 08:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758528479; cv=none; b=anX/lt6wJjB9dvYtXRGGaTXY/pAgBF5dJLZrxa4mE07lnKtXhSDVsCHZSVctWBUDFBCqnVaYoCarcWstua7cmJO8jwh+J0z3LEpMYrE1QDlohUCflXyk+uFqG/J+kW6+7nE1sfUu+D1GXhYotHubDd6oScxQcu3sb8WD/+FuL5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758528479; c=relaxed/simple;
	bh=vhNsUXDWD5mlApfmMJfi5q4ViL1LmxbLuD0y5YquSBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZJhpcN70fJmeqXPAaJy4RbfY2yDcm/pd2JFcMFCjikSoth+kC2clVdehokM7i8F1K4f+4sEURWjRmZ3xx+YsZ3r+LFyx/rw8cb9uLmtFFltHpl7AVbG6Mfl2ibHSBrzMbsqt3vv085gkVKhkhNc0nvMRh7BHsGclGtRJJUrOAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Pzp+430z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 54D0BF89;
	Mon, 22 Sep 2025 10:06:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758528392;
	bh=vhNsUXDWD5mlApfmMJfi5q4ViL1LmxbLuD0y5YquSBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pzp+430zL259s4SgzVaIeEXvGiwDzPVPmd9jsSQzvLDxnSNdgcAL7fPJ7Q7RRR3PZ
	 56129ewwGgIXI1tIyeum9dD1sHNrfcGxr0rJfAeE+ClmvRvlQ2emgMG2id2eRaviMX
	 HK7yw9bW6fxlOKWgY+g477a9rXINLXzqA3Goyh7o=
Date: Mon, 22 Sep 2025 11:07:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] media: imx-mipi-csis: Store the number of
 data_lanes configured in dt
Message-ID: <20250922080723.GI10540@pendragon.ideasonboard.com>
References: <20250915-mbus-config-active-lanes-v3-0-97a1282a410b@ideasonboard.com>
 <20250915-mbus-config-active-lanes-v3-2-97a1282a410b@ideasonboard.com>
 <aNDxd9rWjmgrVCd9@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aNDxd9rWjmgrVCd9@valkosipuli.retiisi.eu>

On Mon, Sep 22, 2025 at 09:49:27AM +0300, Sakari Ailus wrote:
> On Mon, Sep 15, 2025 at 02:18:34PM +0100, Isaac Scott wrote:
> > The number of lanes actively used by a MIPI CSI transmitter may differ
> > from that which is defined in device tree. To allow us to be able to set
> > the number of configured lanes without changing the maximum lane count,
> > store the number of lanes configured in device tree, and adjust the
> > debug print to reflect the device tree value.
> > 
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index 2beb5f43c2c0..6afbedfe131e 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -313,6 +313,8 @@ struct mipi_csis_device {
> >  	u32 hs_settle;
> >  	u32 clk_settle;
> >  
> > +	unsigned int num_data_lanes;
> > +
> >  	spinlock_t slock;	/* Protect events */
> >  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
> >  	struct dentry *debugfs_root;
> > @@ -535,7 +537,7 @@ static void mipi_csis_system_enable(struct mipi_csis_device *csis, int on)
> >  	val = mipi_csis_read(csis, MIPI_CSIS_DPHY_CMN_CTRL);
> >  	val &= ~MIPI_CSIS_DPHY_CMN_CTRL_ENABLE;
> >  	if (on) {
> > -		mask = (1 << (csis->bus.num_data_lanes + 1)) - 1;
> > +		mask = (1 << (csis->num_data_lanes + 1)) - 1;
> 
> Please use 1U or BIT() for bit-shifted values.

BIT() isn't appropriate here. GENMASK(csis->num_data_lanes, 0) could be
fine, but this patch just changes the variable, I wouldn't insist in
fixing separate issues.

> >  		val |= (mask & MIPI_CSIS_DPHY_CMN_CTRL_ENABLE);
> >  	}
> >  	mipi_csis_write(csis, MIPI_CSIS_DPHY_CMN_CTRL, val);
> > @@ -586,7 +588,7 @@ static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
> >  
> >  	/* Calculate the line rate from the pixel rate. */
> >  	link_freq = v4l2_get_link_freq(src_pad, csis_fmt->width,
> > -				       csis->bus.num_data_lanes * 2);
> > +				       csis->num_data_lanes * 2);
> >  	if (link_freq < 0) {
> >  		dev_err(csis->dev, "Unable to obtain link frequency: %d\n",
> >  			(int)link_freq);
> > @@ -631,7 +633,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
> >  				 const struct v4l2_mbus_framefmt *format,
> >  				 const struct csis_pix_format *csis_fmt)
> >  {
> > -	int lanes = csis->bus.num_data_lanes;
> > +	int lanes = csis->num_data_lanes;
> >  	u32 val;
> >  
> >  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
> > @@ -1299,8 +1301,10 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
> >  	}
> >  
> >  	csis->bus = vep.bus.mipi_csi2;
> > +	csis->bus.num_data_lanes = vep.bus.mipi_csi2.num_data_lanes;

That doesn't seem to be needed.

> > +	csis->num_data_lanes = csis->bus.num_data_lanes;
> >  
> > -	dev_dbg(csis->dev, "data lanes: %d\n", csis->bus.num_data_lanes);
> > +	dev_dbg(csis->dev, "data lanes: %d\n", csis->num_data_lanes);

Neither is this change. What you print here is the number of connected
data lanes, not the number of effectively used lanes. You could change
it to 

	dev_dbg(csis->dev, "max data lanes: %u\n", csis->bus.num_data_lanes);

You'll want to also update the commit message, which I think needs some
improvement regardless.

> >  	dev_dbg(csis->dev, "flags: 0x%08x\n", csis->bus.flags);
> >  
> >  	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
> > @@ -1498,7 +1502,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
> >  	}
> >  
> >  	dev_info(dev, "lanes: %d, freq: %u\n",
> > -		 csis->bus.num_data_lanes, csis->clk_frequency);
> > +		 csis->num_data_lanes, csis->clk_frequency);

Drop this change too. This message is actually redundant, the number of
lanes is printed in mipi_csis_async_register(). You could submit a
separate patch to remove this, possibly replacing it with a dev_dbg() in
mipi_csis_parse_dt() to print clk_frequency.

> >  
> >  	return 0;
> >  

-- 
Regards,

Laurent Pinchart

