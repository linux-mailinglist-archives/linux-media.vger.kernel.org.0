Return-Path: <linux-media+bounces-41778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6256B43FE8
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 17:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D65E6171BBA
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 15:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51A0308F3B;
	Thu,  4 Sep 2025 15:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cl98NBHP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B29302CDA;
	Thu,  4 Sep 2025 15:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756998148; cv=none; b=NdjXzK7wV4bnxmCaO5oRTn3vZTiopj7HUlqp+k27BKJJ63v8HU98fpowq0SG4mtYcAK4bYKq+bzC7qQDiCtez1Q5wYzmJXUHxwhBFHu1+gnOekdPCe1WRPG41EnQF74WznnoIPBhmb5RsNB/AjkkX0RUQekQVOwUxDrk7TSPVU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756998148; c=relaxed/simple;
	bh=mH9Qa53DW8rPCvOMKW7s4T0USBUdqkx8bGES1nfIJtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQsla3JgVFL/JItD4TbX11jTfxXdzyoBZpEwC56kvDkpm1BW4kEjjREYZQ5RyST2bIKN3tCMG7JQRWumUZ7wbbi/g0r0MA1moQJPEMCKItGdamLtPcau8E+1kZBxU81gLTXD/eUrtpYU2YgJ920ilLS40OoEAoh9fYiiajcQ/L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cl98NBHP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 77E6818B9;
	Thu,  4 Sep 2025 17:01:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756998064;
	bh=mH9Qa53DW8rPCvOMKW7s4T0USBUdqkx8bGES1nfIJtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cl98NBHPhv8LuCGb6sR/py4+vw3iWwjNP/4f5ksPgnzKCh0fcSyh0rfe9BttjWpEg
	 m0kGsY2utSojhny9N0pv2QghIQw7qIZp6mZIZsme5LJXSPkV/8ImfwDbUgIiR9LQGD
	 IiKP+HjihV1AwWqsl2HinB2tMnMK9Xrt93pDqSdc=
Date: Thu, 4 Sep 2025 17:01:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, rmfrfs@gmail.com,
	martink@posteo.de, kernel@puri.sm, mchehab@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hverkuil@kernel.org,
	nicolas.dufresne@collabora.com, sakari.ailus@linux.intel.com,
	tomi.valkeinen@ideasonboard.com, jonas@kwiboo.se,
	dan.scally+renesas@ideasonboard.com, m.szyprowski@samsung.com,
	mehdi.djait@linux.intel.com, niklas.soderlund+renesas@ragnatech.se
Subject: Re: [PATCH v2 2/3] media: imx-mipi-csis: Store the number of
 data_lanes configured in dt
Message-ID: <20250904150153.GB6174@pendragon.ideasonboard.com>
References: <20250903102243.1563527-1-isaac.scott@ideasonboard.com>
 <20250903102243.1563527-3-isaac.scott@ideasonboard.com>
 <aLhfu0KK5NHIGH/W@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLhfu0KK5NHIGH/W@lizhi-Precision-Tower-5810>

On Wed, Sep 03, 2025 at 11:33:15AM -0400, Frank Li wrote:
> On Wed, Sep 03, 2025 at 11:22:41AM +0100, Isaac Scott wrote:
> > The number of lanes actively used by a MIPI CSI transmitter may differ
> > from that which is defined in device tree. To allow us to be able to set
> > the number of configured lanes without changing the maximum lane count,
> > store the number of lanes configured in device tree, and adjust the
> > debug print to reflect the device tree value.
> >
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index 2beb5f43c2c0..fc89325f2f94 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -313,6 +313,8 @@ struct mipi_csis_device {
> >  	u32 hs_settle;
> >  	u32 clk_settle;
> >
> > +	unsigned int max_data_lanes;
> > +
> 
> is num_data_lanes better? you get from vep.bus.mipi_csi2.num_data_lanes

That's a good point, but I think I prefer max_data_lanes here as it
conveys better the fact that the field stores the maximum number of data
lanes that can be used, not the number of data lanes being used at a
given point of time.

This being said, why do we need this ? The maximum number of data lanes
can be accessed through csis->bus.num_data_lanes. I've looked at patch
3/3 to answer this question, it there csis->bus.num_data_lanes is
modified to store the number of data lanes used at runtime. I think it
would be better to consider csis->bus as immutable after probe, and
store the number of used data lanes in csis->num_data_lanes.

Isaac, could you replace this patch by another one that adds
csis->num_data_lanes, sets it to csis->bus.num_data_lanes in
mipi_csis_async_register(), and replace usage of
csis->bus.num_data_lanes with csis->num_data_lanes through the driver ?
Patch 3/3 should then modify csis->num_data_lanes, not
csis->bus.num_data_lanes.

> >  	spinlock_t slock;	/* Protect events */
> >  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
> >  	struct dentry *debugfs_root;
> > @@ -1299,8 +1301,9 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
> >  	}
> >
> >  	csis->bus = vep.bus.mipi_csi2;
> > +	csis->max_data_lanes = vep.bus.mipi_csi2.num_data_lanes;
> >
> > -	dev_dbg(csis->dev, "data lanes: %d\n", csis->bus.num_data_lanes);
> > +	dev_dbg(csis->dev, "data lanes: %d\n", csis->max_data_lanes);
> >  	dev_dbg(csis->dev, "flags: 0x%08x\n", csis->bus.flags);
> >
> >  	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,

-- 
Regards,

Laurent Pinchart

