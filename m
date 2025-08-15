Return-Path: <linux-media+bounces-39991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9724EB28010
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 14:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFB181B6707E
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 12:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB22287279;
	Fri, 15 Aug 2025 12:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="GlNwJ9iB"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF90D278157;
	Fri, 15 Aug 2025 12:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755261295; cv=pass; b=dkR9m+wo2CjYiOZ282q+I1tgZBnks85ftzoLCNPw3pta2b0tXxZpUBlxWg8NYOqsVJXOvsVcmhxwKbTm+f3mLyweT+usBnGW1x2jDEzKLWOoncAka2DdZyV5kgZucV3uEoN6JLZCEqDSejFvT3HQsHDFzspoUSWAq0BRfcMEnFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755261295; c=relaxed/simple;
	bh=tntn9cbIgPUt1BursIk5NYzmJyQ1zyzXYOnVlKbw8OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2dPULVp3WzmWdYyvzDO9kJBp9ZZ+qgFYo+yJVK/zV+wD4fC44o2ljUHk9/N4CYaGW7dnMW36d/DvKAokAtEJO3aadSX0bAHJ00GXrB+Oqfb7zDmIUZqzRGfIb79WoLq61TaKxZxgu/+KrEjbdHL712MYoHcAwI03U4opVMDlCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=GlNwJ9iB; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4c3M4h4gHNz49PyD;
	Fri, 15 Aug 2025 15:34:44 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1755261286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j/6Mcw8r3LsssT5hKIfF2I2kyTfi7DM26e0QtcBjbYI=;
	b=GlNwJ9iBkw3glbp0ymIiCl63fTe5CZCe5pJslQbr1vG/kkI6fxWrY35JpmCqwJM/nz16Fm
	xaO4q+bYwr8bKDJpEKt9Bvu0jD7j0PIIS8ivY6qOkq2o/C1sN6VdWjgUpg7whIbSqZzxna
	FMpKOUZB1p2uopOxN+j7K+DU98KiqSerX3UkAqzN8OA5cv30EJw1ZEovF9LMAMRulfWy1h
	9Nj51K92Df2RCEoiy0jUZMG1OtIIlLFgqkxwjgty5u03Y+olIueRWSgqsa01iNZjJDg4UV
	9OcuGbzWCHKZJo+8tORvWJF+T3E84YvHGjnp7afMmpZEElhwOlBTaWqsRLLsRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1755261286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j/6Mcw8r3LsssT5hKIfF2I2kyTfi7DM26e0QtcBjbYI=;
	b=kCSurF1hkNHj6s7D5U303HsLuULSF6jJxI0QR8Z760AtTzH2wH/1ziX34RATtcTI3JsWnp
	c7mbgno8qs7Cib4xDHD7dt2PY5XsZ+U3wC5MFytag8YBNefdASUH5cLFebqlbcYFurUxCE
	nL5aLhJ5xfb9ck9KRZckUHHttQKPMFNN57UBwaqLx1nDrUtf64I7sLWJwGP7+3bq9WlV3Z
	Z46w/oq221jc+bVWPIsxEJI6aI+EI7hR/T/gihUGJecpFLY1IVfaGlCafAlE76zzJETe8a
	IYiVbtm3m7LKNgjoeYYnfqIOp7hfWeIgF1TRCqB6V71EjUh7hr7RfntS1qYJKg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1755261286; a=rsa-sha256;
	cv=none;
	b=pef/pESmcs78EUdIVq28pz9/x/msj/tjvZJmM31B5rDcbrfLkPuYfFKBgocj7pffI6UBmX
	6T/4H592XkX/LWtJJzbqNr87hTY3SMeZonwBikXXrrDPUpIBS1FyafXOb/fsAhtc0J6RYy
	Hlw7K0JPH+qUzxvYGdJGHHmQ3bPuFuKrXI1+FaZ+yr5V+4Nn3i5anqq0ORdONI9ISjT9hW
	b8LtQFgQNwHXMPvIJUcJj2XCoC2nfYU1cCDaSjhFaM3QEQPlSWbOY37lNW87rWnJfDIwY5
	kPHyMOLL6Hjdrrch9pKVm5MQfeeGwdXDVYGs22vNwYG3vdblP6hhP5a3/p6c5g==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id CBFB4634C93;
	Fri, 15 Aug 2025 15:33:45 +0300 (EEST)
Date: Fri, 15 Aug 2025 12:33:46 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, linux-media@vger.kernel.org,
	rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm,
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] imx-mipi-csis: Get the number of active lanes from
 mbus_config
Message-ID: <aJ8pKs_6YpAiPjlq@valkosipuli.retiisi.eu>
References: <20250814113701.165644-1-isaac.scott@ideasonboard.com>
 <aJ77VTtZy96JJCHE@valkosipuli.retiisi.eu>
 <20250815103205.GJ6201@pendragon.ideasonboard.com>
 <aJ8ZJFSn5Wxhj2Aj@valkosipuli.retiisi.eu>
 <20250815113633.GM6201@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250815113633.GM6201@pendragon.ideasonboard.com>

Hi Laurent,

On Fri, Aug 15, 2025 at 02:36:33PM +0300, Laurent Pinchart wrote:
> On Fri, Aug 15, 2025 at 11:25:24AM +0000, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > On Fri, Aug 15, 2025 at 01:32:05PM +0300, Laurent Pinchart wrote:
> > > On Fri, Aug 15, 2025 at 09:18:13AM +0000, Sakari Ailus wrote:
> > > > On Thu, Aug 14, 2025 at 12:37:01PM +0100, Isaac Scott wrote:
> > > > > Although 4 lanes may be physically available, we may not be using all of
> > > > > them. Get the number of configured lanes in the case a driver has
> > > > > implemented the get_mbus_config op.
> > > > > 
> > > > > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > > > > 
> > > > > ---
> > > > > 
> > > > > Currently, the imx-mipi-csis driver parses the device tree to determine
> > > > > the number of configured lanes for the CSI receiver. This may be
> > > > > incorrect in the case that the connected device only uses a subset of
> > > > > lanes, for example. Allow the drivers for these cameras to create a
> > > > > mbus_config to configure the number of lanes that are actually being
> > > > > used.
> > > > > 
> > > > > If the driver does not support the get_mbus_config op, this patch will
> > > > > have no functional change.
> > > > > 
> > > > > Compile tested against media-master (v6.17-rc1)
> > > > > ---
> > > > >  drivers/media/platform/nxp/imx-mipi-csis.c | 41 ++++++++++++++++++++++
> > > > >  1 file changed, 41 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > > > index 2beb5f43c2c0..efe4e2ad0382 100644
> > > > > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > > > > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > > > @@ -939,6 +939,43 @@ static struct mipi_csis_device *sd_to_mipi_csis_device(struct v4l2_subdev *sdev)
> > > > >  	return container_of(sdev, struct mipi_csis_device, sd);
> > > > >  }
> > > > >  
> > > > > +static int mipi_csis_get_active_lanes(struct v4l2_subdev *sd)
> > > > > +{
> > > > > +	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > > > > +	struct v4l2_mbus_config mbus_config = { 0 };
> > > > > +	int ret;
> > > > > +
> > > > > +	ret = v4l2_subdev_call(csis->source.sd, pad, get_mbus_config,
> > > > > +			       0, &mbus_config);
> > > > > +	if (ret == -ENOIOCTLCMD) {
> > > > > +		dev_dbg(csis->dev, "No remote mbus configuration available\n");
> > > > > +		return 0;
> > > > > +	}
> > > > > +
> > > > > +	if (ret) {
> > > > > +		dev_err(csis->dev, "Failed to get remote mbus configuration\n");
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
> > > > > +		dev_err(csis->dev, "Unsupported media bus type %u\n",
> > > > > +			mbus_config.type);
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	if (mbus_config.bus.mipi_csi2.num_data_lanes > csis->bus.num_data_lanes) {
> > > > > +		dev_err(csis->dev,
> > > > > +			"Unsupported mbus config: too many data lanes %u\n",
> > > > > +			mbus_config.bus.mipi_csi2.num_data_lanes);
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	csis->bus.num_data_lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
> > > 
> > > There's a bug here, you override the number of lanes retrieved from DT,
> > > which is the number of connected lanes, with the number of lanes used by
> > > the source for its particular configuration. You will never be able to
> > > then use more lanes in a different source configuration.
> > > 
> > > > > +	dev_dbg(csis->dev, "Number of lanes: %d\n", csis->bus.num_data_lanes);
> > > > 
> > > > None of the above is really specific to this driver. Could you instead
> > > > implement a function that parses the information from the fwnode endpoint
> > > > and uses mbus configuration on top?
> > > 
> > > That would need to parse the endpoint every time we start streaming, it
> > > doesn't sound ideal.
> > 
> > Perhaps not, but does that matter in practice? Parsing the endpoint is,
> > after all, fairly trivial. The advantage would be simplifying drivers.
> 
> It's trivial from a code point of view, but it's not a cheap operation.
> I'd like to avoid making starting streaming more expensive.

How cheap is "not cheap"? I'd be surprised if parsing an endpoint took more
time than e.g. an I²C register write. Of course it depends on the CPU...

> 
> > Alternatively we could think of caching this information somewhere but I
> > don't think it's worth it.
> 
> Drivers likely need to parse endpoints for other reasons. I'd cache the
> value in drivers, like done today, and pass it to a get_active_lanes
> helper.

Then drivers presumably would also validate this against the endpoint
configuration, wouldn't they? That's extra code in every CSI-2 receiver
driver.

> 
> > > > The function could take struct media_pad pointer as an argument, or struct
> > > > v4l2_subdev pointer and the pad number.
> > > > 
> > > > I wonder if any other parameters could change dynamically but I can't think
> > > > of that now, so perhaps just the number of lanes is what the function
> > > > should indeed return.
> > > > 
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > >  static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> > > > >  {
> > > > >  	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > > > > @@ -965,6 +1002,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> > > > >  	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
> > > > >  	csis_fmt = find_csis_format(format->code);
> > > > >  
> > > > > +	ret = mipi_csis_get_active_lanes(sd);
> > > > > +	if (ret < 0)
> > > > > +		dev_dbg(csis->dev, "Failed to get active lanes: %d", ret);
> > > > > +
> > > > >  	ret = mipi_csis_calculate_params(csis, csis_fmt);
> > > > >  	if (ret < 0)
> > > > >  		goto err_unlock;
> 

-- 
Regards,

Sakari Ailus

