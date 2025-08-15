Return-Path: <linux-media+bounces-39980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A6FB27E49
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 12:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FF7B6881B1
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 10:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9517D2FDC34;
	Fri, 15 Aug 2025 10:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V7Ysf9D5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCBB27604E;
	Fri, 15 Aug 2025 10:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755253951; cv=none; b=JOsfwKMS6ZPORP6+wfwVqKfNHMPU8qBOBihTflvhogmB0dDLGsKCIaA0S6NUwgw5gXL0n3pWfZHkNycyZZcQ0h82gLiz17RRs4t+TD5tQCITOb7BdJJYzPhJO17s6+dc03+Tx52IIlEQNSZ0yna1C65gmv6d4a+yvyIq0ebwZLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755253951; c=relaxed/simple;
	bh=Tf06S22oGZwz4QF7IIkMPTnPInylNOcha5gpHU9syJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qL26yLtAyO+2+G+2IoOL9KNwWioGEzCHGLfPfut0+bTR4NKhpUgK9y1M0XXjj3iFPfYTUylybzaT8Xu9XEjqFH5Rzc8TVMN1J0hoCGyw5tX7jOwLWgtS/JedO4boT62XIVpMJ2I5NlhVy5O0sm/FF4sDt/xnOqaZt2gPFDBv6B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=V7Ysf9D5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id ECEBD56D;
	Fri, 15 Aug 2025 12:31:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755253891;
	bh=Tf06S22oGZwz4QF7IIkMPTnPInylNOcha5gpHU9syJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V7Ysf9D5tktEaio/i6U2xspkdXxnp5hU0YBvOeLUAdQMu23AJ3fFGyWF1x2D9mK4Y
	 U3/AgvCR06LNwzwhJf4TgGDJw1E1EYmvLXVCeriW6EdevB68Dyj/f3xZM1RWE6dL/2
	 +hmQixZP0RPM/VmfoTG98thARprSrbdTcnQGySmk=
Date: Fri, 15 Aug 2025 13:32:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, linux-media@vger.kernel.org,
	rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm,
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] imx-mipi-csis: Get the number of active lanes from
 mbus_config
Message-ID: <20250815103205.GJ6201@pendragon.ideasonboard.com>
References: <20250814113701.165644-1-isaac.scott@ideasonboard.com>
 <aJ77VTtZy96JJCHE@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aJ77VTtZy96JJCHE@valkosipuli.retiisi.eu>

On Fri, Aug 15, 2025 at 09:18:13AM +0000, Sakari Ailus wrote:
> On Thu, Aug 14, 2025 at 12:37:01PM +0100, Isaac Scott wrote:
> > Although 4 lanes may be physically available, we may not be using all of
> > them. Get the number of configured lanes in the case a driver has
> > implemented the get_mbus_config op.
> > 
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > 
> > ---
> > 
> > Currently, the imx-mipi-csis driver parses the device tree to determine
> > the number of configured lanes for the CSI receiver. This may be
> > incorrect in the case that the connected device only uses a subset of
> > lanes, for example. Allow the drivers for these cameras to create a
> > mbus_config to configure the number of lanes that are actually being
> > used.
> > 
> > If the driver does not support the get_mbus_config op, this patch will
> > have no functional change.
> > 
> > Compile tested against media-master (v6.17-rc1)
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 41 ++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> > 
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index 2beb5f43c2c0..efe4e2ad0382 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -939,6 +939,43 @@ static struct mipi_csis_device *sd_to_mipi_csis_device(struct v4l2_subdev *sdev)
> >  	return container_of(sdev, struct mipi_csis_device, sd);
> >  }
> >  
> > +static int mipi_csis_get_active_lanes(struct v4l2_subdev *sd)
> > +{
> > +	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > +	struct v4l2_mbus_config mbus_config = { 0 };
> > +	int ret;
> > +
> > +	ret = v4l2_subdev_call(csis->source.sd, pad, get_mbus_config,
> > +			       0, &mbus_config);
> > +	if (ret == -ENOIOCTLCMD) {
> > +		dev_dbg(csis->dev, "No remote mbus configuration available\n");
> > +		return 0;
> > +	}
> > +
> > +	if (ret) {
> > +		dev_err(csis->dev, "Failed to get remote mbus configuration\n");
> > +		return ret;
> > +	}
> > +
> > +	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
> > +		dev_err(csis->dev, "Unsupported media bus type %u\n",
> > +			mbus_config.type);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (mbus_config.bus.mipi_csi2.num_data_lanes > csis->bus.num_data_lanes) {
> > +		dev_err(csis->dev,
> > +			"Unsupported mbus config: too many data lanes %u\n",
> > +			mbus_config.bus.mipi_csi2.num_data_lanes);
> > +		return -EINVAL;
> > +	}
> > +
> > +	csis->bus.num_data_lanes = mbus_config.bus.mipi_csi2.num_data_lanes;

There's a bug here, you override the number of lanes retrieved from DT,
which is the number of connected lanes, with the number of lanes used by
the source for its particular configuration. You will never be able to
then use more lanes in a different source configuration.

> > +	dev_dbg(csis->dev, "Number of lanes: %d\n", csis->bus.num_data_lanes);
> 
> None of the above is really specific to this driver. Could you instead
> implement a function that parses the information from the fwnode endpoint
> and uses mbus configuration on top?

That would need to parse the endpoint every time we start streaming, it
doesn't sound ideal.

> The function could take struct media_pad pointer as an argument, or struct
> v4l2_subdev pointer and the pad number.
> 
> I wonder if any other parameters could change dynamically but I can't think
> of that now, so perhaps just the number of lanes is what the function
> should indeed return.
> 
> > +
> > +	return 0;
> > +}
> > +
> >  static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> >  {
> >  	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > @@ -965,6 +1002,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> >  	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
> >  	csis_fmt = find_csis_format(format->code);
> >  
> > +	ret = mipi_csis_get_active_lanes(sd);
> > +	if (ret < 0)
> > +		dev_dbg(csis->dev, "Failed to get active lanes: %d", ret);
> > +
> >  	ret = mipi_csis_calculate_params(csis, csis_fmt);
> >  	if (ret < 0)
> >  		goto err_unlock;

-- 
Regards,

Laurent Pinchart

