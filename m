Return-Path: <linux-media+bounces-35622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FA9AE3E72
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 13:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 784D11897B50
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 11:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533FA23C512;
	Mon, 23 Jun 2025 11:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bnO4gPuN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27CE1B808;
	Mon, 23 Jun 2025 11:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750679242; cv=none; b=gFsHZbo87gpYDeOqiLihE0mRBiVGTXEvNrJyrQ+gnJa5Mzqqw4n4Olx5ojFF8DwSNhU8xR6KtVm4d5Y/I7Gocpf+JFVZh7odGg5IQtlzbD+7iXodpJrDdVC/wNkRMxTE90Jzt9ILK33FqgtOavjBVNE/OBR6+inqG0imp6m9R20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750679242; c=relaxed/simple;
	bh=oHIQGmhVZk1bws7ooyBVG45/Q0gIQsMf18p3cWsR55Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sl9JllWsHUkbXKEKCS6wietsHBjByi3ldQ8GxlfGO01YpFlKJ8aks6xrB8HVlGlhk/3Ye3QG5GOn5f+LJ8WPenOrRnYmBR/woLVY3v08DT0+vf0VSclxeTzUn+c4cRtwzR/Raiqwwnc22oxP14Qa0/5daXnpqgOlcayvsF69nPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bnO4gPuN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B07C2198D;
	Mon, 23 Jun 2025 13:47:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750679221;
	bh=oHIQGmhVZk1bws7ooyBVG45/Q0gIQsMf18p3cWsR55Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bnO4gPuNBRCiyLmakXSRcFDiwdhL4FGmCD3/CF2YxwUjHyDOFd/uaOn5dYBqvaFTk
	 bzzZyvDeqxO0ftEUIKTgViC3lylvEzfyf+XTjhROhYB+inUyHKlSjJaZaIWRtIYTZy
	 OdjH/PzrwzCKQ3lHlwC11awVPI0dYDESYbEHllww=
Date: Mon, 23 Jun 2025 14:46:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc: =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH RESEND v4 3/5] media: i2c: imx214: Make use of CCS PLL
 calculator
Message-ID: <20250623114658.GB32376@pendragon.ideasonboard.com>
References: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
 <20250621-imx214_ccs_pll-v4-3-12178e5eb989@apitzsch.eu>
 <20250621181751.GA9125@pendragon.ideasonboard.com>
 <ed0b8fe3a20111477cafb1de7b399afb99caaa0c.camel@apitzsch.eu>
 <20250622171320.GA826@pendragon.ideasonboard.com>
 <CAPybu_2WF=t4jnwsrTSCiSZ4T7Sck4-fCoub33=P_6KvdZ5ePg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPybu_2WF=t4jnwsrTSCiSZ4T7Sck4-fCoub33=P_6KvdZ5ePg@mail.gmail.com>

Hi Ricardo,

On Mon, Jun 23, 2025 at 11:31:17AM +0200, Ricardo Ribalda Delgado wrote:
> On Sun, Jun 22, 2025 at 7:13 PM Laurent Pinchart wrote:
> > On Sun, Jun 22, 2025 at 05:34:56PM +0200, André Apitzsch wrote:
> > > Am Samstag, dem 21.06.2025 um 21:17 +0300 schrieb Laurent Pinchart:
> > > > On Sat, Jun 21, 2025 at 11:37:27AM +0200, André Apitzsch via B4 Relay wrote:
> > > > > From: André Apitzsch <git@apitzsch.eu>
> > > > >
> > > > > Calculate PLL parameters based on clock frequency and link
> > > > > frequency.
> > > > >
> > > > > Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > Signed-off-by: André Apitzsch <git@apitzsch.eu>
> > > > > ---
> > > > >  drivers/media/i2c/Kconfig  |   1 +
> > > > >  drivers/media/i2c/imx214.c | 213 ++++++++++++++++++++++++++++++++++++---------
> > > > >  2 files changed, 175 insertions(+), 39 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > > index
> > > > > e68202954a8fd4711d108cf295d5771246fbc406..08db8abeea218080b0bf5bfe6
> > > > > cf82f1c0b100c4a 100644
> > > > > --- a/drivers/media/i2c/Kconfig
> > > > > +++ b/drivers/media/i2c/Kconfig
> > > > > [..]
> > > > > @@ -1224,42 +1336,52 @@ static int imx214_parse_fwnode(struct
> > > > > device *dev)
> > > > >   if (!endpoint)
> > > > >   return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
> > > > >
> > > > > - ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
> > > > > + bus_cfg->bus_type = V4L2_MBUS_CSI2_DPHY;
> > > > > + ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, bus_cfg);
> > > > > + fwnode_handle_put(endpoint);
> > > >
> > > > ... drop this. Up to you.
> > > >
> > > > >   if (ret) {
> > > > >   dev_err_probe(dev, ret, "parsing endpoint node failed\n");
> > > > > - goto done;
> > > > > + goto error;
> > > >
> > > > You can return ret here.
> > > >
> > > > >   }
> > > > >
> > > > >   /* Check the number of MIPI CSI2 data lanes */
> > > > > - if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
> > > > > + if (bus_cfg->bus.mipi_csi2.num_data_lanes != 4) {
> > > > >   ret = dev_err_probe(dev, -EINVAL,
> > > > >       "only 4 data lanes are currently supported\n");
> > > > > - goto done;
> > > > > + goto error;
> > > > >   }
> > > > >
> > > > > - if (bus_cfg.nr_of_link_frequencies != 1)
> > > > > + if (bus_cfg->nr_of_link_frequencies != 1)
> > > > >   dev_warn(dev, "Only one link-frequency supported, please review
> > > > > your DT. Continuing anyway\n");
> > > >
> > > > Now that the driver can calculate PLL parameters dynamically, it
> > > > would be nice to lift this restriction and make the link frequency
> > > > control writable, in a separate patch on top of this series.
> > >
> > > Maybe this could be postponed, as I don't have any use for it at the
> > > moment and I don't want to further delay this series.
> >
> > When I said "on top", I didn't mean in a new version of this series. We
> > can merge this first, and then lift this restriction. I don't have an
> > imx214-based device so I can't do it myself and test it :-/
> >
> > > > > - for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
> > > > > - if (bus_cfg.link_frequencies[i] == IMX214_DEFAULT_LINK_FREQ)
> > > > > + for (i = 0; i < bus_cfg->nr_of_link_frequencies; i++) {
> > > > > + u64 freq = bus_cfg->link_frequencies[i];
> > > > > + struct ccs_pll pll;
> > > > > +
> > > > > + if (!imx214_pll_calculate(imx214, &pll, freq))
> > > > >   break;
> > > > > - if (bus_cfg.link_frequencies[i] ==
> > > > > -     IMX214_DEFAULT_LINK_FREQ_LEGACY) {
> > > > > + if (freq == IMX214_DEFAULT_LINK_FREQ_LEGACY) {
> > > > >   dev_warn(dev,
> > > > >   "link-frequencies %d not supported, please review your DT.
> > > > > Continuing anyway\n",
> > > > >   IMX214_DEFAULT_LINK_FREQ);
> > > > > + freq = IMX214_DEFAULT_LINK_FREQ;
> > > > > + if (imx214_pll_calculate(imx214, &pll, freq))
> > > > > + continue;
> > > > > + bus_cfg->link_frequencies[i] = freq;
> > > > >   break;
> > > > >   }
> > > >
> > > > How about separating the IMX214_DEFAULT_LINK_FREQ_LEGACY check from
> > > > the PLL calculation ? Something like
> > > >
> > > >  u64 freq = bus_cfg->link_frequencies[i];
> > > >  struct ccs_pll pll;
> > > >
> > > >  if (freq == IMX214_DEFAULT_LINK_FREQ_LEGACY) {
> > > >  dev_warn(dev,
> > > >  "link-frequencies %d not supported, please review your DT.
> > > > Continuing anyway\n",
> > > >  IMX214_DEFAULT_LINK_FREQ);
> > > >  freq = IMX214_DEFAULT_LINK_FREQ;
> > > >  bus_cfg->link_frequencies[i] = freq;
> > > >  }
> > >
> > > With PLL calculation, 480000000 (=IMX214_DEFAULT_LINK_FREQ_LEGACY)
> > > might be a valid link frequency explicitly set by the user. I'm not
> > > sure whether it is a good idea to overwrite the link frequency, before
> > > trying the PLL calculation. That's why I would keep the code the way it
> > > is.
> >
> > The current code accepts both IMX214_DEFAULT_LINK_FREQ (600 MHz) and
> > IMX214_DEFAULT_LINK_FREQ_LEGACY (400 MHz), and programs the PLL with (as
> > far as I understand) a 600 MHz clock frequency in either case. To avoid
> > a change in behaviour, I think overriding the 400 MHz frequency with 600
> > MHz in this patch would be best. We could then drop that in a later
> > patch, possibly by patching the clock frequency in a platform-specific
> > driver instead of the imx214 driver.
> >
> > > >  if (!imx214_pll_calculate(imx214, &pll, freq))
> > > >  break;
> > > >
> > > > It will then become easier to drop this legacy support from the
> > > > driver. What platform(s) are know to specify an incorrect link
> > > > frequency ?
> > >
> > > I don't know.
> >
> > Ricardo, do you have any information about this ?
> 
> This was for a development platform for Qualcomm, think of a pizero
> like, but with a Snapdragon device.
> 
> There was a Qtechnology product based on that platform. I asked them
> if they could provide me a device for testing, but it has been
> discontinued and  replaced with something better.
> 
> We can start to deprecate the clock quirk if you want.

That would be great. Thanks for the confirmation.

By deprecate, do you mean first printing a message for a few kernel
releases, or can we just drop it in the next version of this patch ?

> > > > >   }
> > > > >
> > > > > - if (i == bus_cfg.nr_of_link_frequencies)
> > > > > + if (i == bus_cfg->nr_of_link_frequencies)
> > > > >   ret = dev_err_probe(dev, -EINVAL,
> > > > > -     "link-frequencies %d not supported, please review your DT\n",
> > > > > -     IMX214_DEFAULT_LINK_FREQ);
> > > > > +     "link-frequencies %lld not supported, please review your
> > > > > DT\n",
> > > > > +     bus_cfg->nr_of_link_frequencies ?
> > > > > +     bus_cfg->link_frequencies[0] : 0);
> > > > >
> > > > > -done:
> > > > > - v4l2_fwnode_endpoint_free(&bus_cfg);
> > > > > - fwnode_handle_put(endpoint);
> > > > > + return 0;
> > > > > +
> > > > > +error:
> > > > > + v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
> > > > >   return ret;
> > > > >  }
> > > > >
> > > > > @@ -1299,7 +1421,7 @@ static int imx214_probe(struct i2c_client
> > > > > *client)
> > > > >   return dev_err_probe(dev, PTR_ERR(imx214->regmap),
> > > > >        "failed to initialize CCI\n");
> > > > >
> > > > > - ret = imx214_parse_fwnode(dev);
> > > > > + ret = imx214_parse_fwnode(dev, imx214);
> > > > >   if (ret)
> > > > >   return ret;
> > > > >
> > > > > @@ -1310,7 +1432,9 @@ static int imx214_probe(struct i2c_client
> > > > > *client)
> > > > >   * Enable power initially, to avoid warnings
> > > > >   * from clk_disable on power_off
> > > > >   */
> > > > > - imx214_power_on(imx214->dev);
> > > > > + ret = imx214_power_on(imx214->dev);
> > > > > + if (ret < 0)
> > > > > + goto error_fwnode;
> > > >
> > > > This change seems to belong to a separate patch.
> > > >
> > > > >
> > > > >   ret = imx214_identify_module(imx214);
> > > > >   if (ret)
> > > > > @@ -1341,6 +1465,12 @@ static int imx214_probe(struct i2c_client
> > > > > *client)
> > > > >   pm_runtime_set_active(imx214->dev);
> > > > >   pm_runtime_enable(imx214->dev);
> > > > >
> > > > > + ret = imx214_pll_update(imx214);
> > > > > + if (ret < 0) {
> > > > > + dev_err_probe(dev, ret, "failed to update PLL\n");
> > > > > + goto error_subdev_cleanup;
> > > > > + }
> > > >
> > > > I would move this to imx214_ctrls_init().
> > > >
> > > > > +
> > > > >   ret = v4l2_async_register_subdev_sensor(&imx214->sd);
> > > > >   if (ret < 0) {
> > > > >   dev_err_probe(dev, ret,
> > > > > @@ -1366,6 +1496,9 @@ static int imx214_probe(struct i2c_client
> > > > > *client)
> > > > >  error_power_off:
> > > > >   imx214_power_off(imx214->dev);
> > > > >
> > > > > +error_fwnode:
> > > > > + v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
> > > > > +
> > > > >   return ret;
> > > > >  }
> > > > >
> > > > > @@ -1378,6 +1511,8 @@ static void imx214_remove(struct i2c_client
> > > > > *client)
> > > > >   v4l2_subdev_cleanup(sd);
> > > > >   media_entity_cleanup(&imx214->sd.entity);
> > > > >   v4l2_ctrl_handler_free(&imx214->ctrls);
> > > > > + v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
> > > > > +
> > > > >   pm_runtime_disable(&client->dev);
> > > > >   if (!pm_runtime_status_suspended(&client->dev)) {
> > > > >   imx214_power_off(imx214->dev);

-- 
Regards,

Laurent Pinchart

