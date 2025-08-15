Return-Path: <linux-media+bounces-39986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80940B27F47
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 13:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 356535E76C8
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 11:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2302882D9;
	Fri, 15 Aug 2025 11:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y4e3KVOK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD4A286417;
	Fri, 15 Aug 2025 11:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755257817; cv=none; b=t3XJd7DeLcTkwxfw+aWTvkT4jYwd8gCsdWJwcsipZt+JuvRNj4EV7d5EG5gw+pjxRiXC2Kbdu4YugXymtU410TUEWatAVLfFHiP+ODtrFiL5ER9bXJFBzXKqypaOTgcxd2bA7ss/FxbcZ0hboSs4dn5HLy+nLp8e0O/VxDxO2Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755257817; c=relaxed/simple;
	bh=2GIMgu8NPtt6P2qI5ejUuahA1+6uQNRov1RsqwBWiqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jjHoMddiuPx6BVQyoUPQpqAm73Q9geoOrQ9IDEXUUuETtV/oK1+qLjM5f2apmUJw2z0f2jLSDMMnzJV89Pqo1/Ym4IFfN4KzkU3XhJ5PGNGU7P04kSGI/RY6qQVtem96WYdGbAs59J3hvKuLCePNn1Y5TDZfXTAzj+8K5+AgAHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Y4e3KVOK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 26128605;
	Fri, 15 Aug 2025 13:35:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755257758;
	bh=2GIMgu8NPtt6P2qI5ejUuahA1+6uQNRov1RsqwBWiqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y4e3KVOK2J0XXmCqgj9JJfIrcgYxrrI+rTidxCHGaWXadY1ai6uVWvVchaozmrBsU
	 WmCsl4otPF8doCkfsyoLO18ZUHqBQUM1ngLtQE8HYes4PNC0qzwKnBsDjCx2iCGfHP
	 b3fPKZ0X6xpvtJyKPqtNsM4xe44EmFHXQNmXLbY8=
Date: Fri, 15 Aug 2025 14:36:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, linux-media@vger.kernel.org,
	rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm,
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] imx-mipi-csis: Get the number of active lanes from
 mbus_config
Message-ID: <20250815113633.GM6201@pendragon.ideasonboard.com>
References: <20250814113701.165644-1-isaac.scott@ideasonboard.com>
 <aJ77VTtZy96JJCHE@valkosipuli.retiisi.eu>
 <20250815103205.GJ6201@pendragon.ideasonboard.com>
 <aJ8ZJFSn5Wxhj2Aj@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aJ8ZJFSn5Wxhj2Aj@valkosipuli.retiisi.eu>

On Fri, Aug 15, 2025 at 11:25:24AM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Fri, Aug 15, 2025 at 01:32:05PM +0300, Laurent Pinchart wrote:
> > On Fri, Aug 15, 2025 at 09:18:13AM +0000, Sakari Ailus wrote:
> > > On Thu, Aug 14, 2025 at 12:37:01PM +0100, Isaac Scott wrote:
> > > > Although 4 lanes may be physically available, we may not be using all of
> > > > them. Get the number of configured lanes in the case a driver has
> > > > implemented the get_mbus_config op.
> > > > 
> > > > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > > > 
> > > > ---
> > > > 
> > > > Currently, the imx-mipi-csis driver parses the device tree to determine
> > > > the number of configured lanes for the CSI receiver. This may be
> > > > incorrect in the case that the connected device only uses a subset of
> > > > lanes, for example. Allow the drivers for these cameras to create a
> > > > mbus_config to configure the number of lanes that are actually being
> > > > used.
> > > > 
> > > > If the driver does not support the get_mbus_config op, this patch will
> > > > have no functional change.
> > > > 
> > > > Compile tested against media-master (v6.17-rc1)
> > > > ---
> > > >  drivers/media/platform/nxp/imx-mipi-csis.c | 41 ++++++++++++++++++++++
> > > >  1 file changed, 41 insertions(+)
> > > > 
> > > > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > > index 2beb5f43c2c0..efe4e2ad0382 100644
> > > > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > > > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > > @@ -939,6 +939,43 @@ static struct mipi_csis_device *sd_to_mipi_csis_device(struct v4l2_subdev *sdev)
> > > >  	return container_of(sdev, struct mipi_csis_device, sd);
> > > >  }
> > > >  
> > > > +static int mipi_csis_get_active_lanes(struct v4l2_subdev *sd)
> > > > +{
> > > > +	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > > > +	struct v4l2_mbus_config mbus_config = { 0 };
> > > > +	int ret;
> > > > +
> > > > +	ret = v4l2_subdev_call(csis->source.sd, pad, get_mbus_config,
> > > > +			       0, &mbus_config);
> > > > +	if (ret == -ENOIOCTLCMD) {
> > > > +		dev_dbg(csis->dev, "No remote mbus configuration available\n");
> > > > +		return 0;
> > > > +	}
> > > > +
> > > > +	if (ret) {
> > > > +		dev_err(csis->dev, "Failed to get remote mbus configuration\n");
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
> > > > +		dev_err(csis->dev, "Unsupported media bus type %u\n",
> > > > +			mbus_config.type);
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	if (mbus_config.bus.mipi_csi2.num_data_lanes > csis->bus.num_data_lanes) {
> > > > +		dev_err(csis->dev,
> > > > +			"Unsupported mbus config: too many data lanes %u\n",
> > > > +			mbus_config.bus.mipi_csi2.num_data_lanes);
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	csis->bus.num_data_lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
> > 
> > There's a bug here, you override the number of lanes retrieved from DT,
> > which is the number of connected lanes, with the number of lanes used by
> > the source for its particular configuration. You will never be able to
> > then use more lanes in a different source configuration.
> > 
> > > > +	dev_dbg(csis->dev, "Number of lanes: %d\n", csis->bus.num_data_lanes);
> > > 
> > > None of the above is really specific to this driver. Could you instead
> > > implement a function that parses the information from the fwnode endpoint
> > > and uses mbus configuration on top?
> > 
> > That would need to parse the endpoint every time we start streaming, it
> > doesn't sound ideal.
> 
> Perhaps not, but does that matter in practice? Parsing the endpoint is,
> after all, fairly trivial. The advantage would be simplifying drivers.

It's trivial from a code point of view, but it's not a cheap operation.
I'd like to avoid making starting streaming more expensive.

> Alternatively we could think of caching this information somewhere but I
> don't think it's worth it.

Drivers likely need to parse endpoints for other reasons. I'd cache the
value in drivers, like done today, and pass it to a get_active_lanes
helper.

> > > The function could take struct media_pad pointer as an argument, or struct
> > > v4l2_subdev pointer and the pad number.
> > > 
> > > I wonder if any other parameters could change dynamically but I can't think
> > > of that now, so perhaps just the number of lanes is what the function
> > > should indeed return.
> > > 
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > >  static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> > > >  {
> > > >  	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > > > @@ -965,6 +1002,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> > > >  	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
> > > >  	csis_fmt = find_csis_format(format->code);
> > > >  
> > > > +	ret = mipi_csis_get_active_lanes(sd);
> > > > +	if (ret < 0)
> > > > +		dev_dbg(csis->dev, "Failed to get active lanes: %d", ret);
> > > > +
> > > >  	ret = mipi_csis_calculate_params(csis, csis_fmt);
> > > >  	if (ret < 0)
> > > >  		goto err_unlock;

-- 
Regards,

Laurent Pinchart

