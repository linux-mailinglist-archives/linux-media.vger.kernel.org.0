Return-Path: <linux-media+bounces-23464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFBE9F2EF2
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 12:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 060F8166EB2
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 11:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD26F203D5B;
	Mon, 16 Dec 2024 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wmdPj+8X"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0214C7C
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 11:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734347825; cv=none; b=IAV9uXCfxghnurUvHyaWjVQ7rHFcMdtLmJFiJHKggw5c7y6W6mSGPOufCkdhn7I6NdCwCO/BEm6+HEFknWiB2aNt0FWS1lVQkJNFP7sPBEAQbmmIE/I6fNaLlCqgLXMKaN7bqg1z4bNC5JfYaZo5nUiYYUVLWKYdsfRGfQ6lr6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734347825; c=relaxed/simple;
	bh=LoDt/I84iOmUn85JbiXoz1l5K6vlVGvplgKlEDzuhL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aermP3XDiCb/acU1x7JoiBohq7ara61xdXx140CITYk5ZaQ3XKyvNSS3U50hSsd+935WTwFV7bXcAv/JB17PIDrmQpcuEf3zKk2zUSxwFoaduOxyJ1wyYEqE35IXMnolBF9VrnAIB8w5ZTXKQIszUHbFj9uilUh7OlzjpV+QlZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wmdPj+8X; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB86413C;
	Mon, 16 Dec 2024 12:16:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734347786;
	bh=LoDt/I84iOmUn85JbiXoz1l5K6vlVGvplgKlEDzuhL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wmdPj+8Xb0ULIoF3sPMG9ewH36j1B5HtQWrtsgpY85+YgxhXrkNV9TWyRihaUGHtF
	 wxVe1QEJ/VMNQI6CU1MG4Z1dzq4XQhUur9h65smVvyud3NI4dN5x7QSej8ZSNBD2H7
	 5VfwVGdKcU5i1opWPKJlNJvMkH1j2ZasBmuo5l2Q=
Date: Mon, 16 Dec 2024 13:16:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH v7 2/5] media: v4l: Support obtaining link frequency via
 get_mbus_config
Message-ID: <20241216111645.GL32204@pendragon.ideasonboard.com>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-3-sakari.ailus@linux.intel.com>
 <20241215165935.GG9975@pendragon.ideasonboard.com>
 <Z1_o8yHTYygdZtex@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z1_o8yHTYygdZtex@kekkonen.localdomain>

On Mon, Dec 16, 2024 at 08:46:43AM +0000, Sakari Ailus wrote:
> On Sun, Dec 15, 2024 at 06:59:35PM +0200, Laurent Pinchart wrote:
> > On Tue, Dec 10, 2024 at 09:59:03AM +0200, Sakari Ailus wrote:
> > > Add link_freq field to struct v4l2_mbus_config in order to pass the link
> > > frequency to the receiving sub-device.
> > 
> > The documentation of v4l2_get_link_freq() should be expanded to explain
> > the new mode of operation. It should document which of the supported
> > methods are recommended for new drivers.
> > 
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-common.c | 11 ++++++++---
> > >  include/media/v4l2-mediabus.h         |  2 ++
> > >  2 files changed, 10 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > > index 9fe74c7e064f..88fbd5608f00 100644
> > > --- a/drivers/media/v4l2-core/v4l2-common.c
> > > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > > @@ -508,13 +508,18 @@ EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
> > >  s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> > >  			     unsigned int div)
> > >  {
> > > +	struct v4l2_mbus_config mbus_config = {};
> > 
> > Isn't mbus_config fully populated by the .get_mbus_config() operation ?
> > That should be documented in the .get_mbus_config() operation
> > documentation.
> 
> It's a good practice to zero the memory before drivers get to work on it. I
> presume drivers will set the fields that are relevant for them and ignore
> the rest.
> 
> I can add a note on get_mbus_config() the drivers should set all struct
> fields to known values.

Thanks.

> > >  	struct v4l2_subdev *sd;
> > > +	int ret;
> > >  
> > >  	sd = media_entity_to_v4l2_subdev(pad->entity);
> > > -	if (!sd)
> > > -		return -ENODEV;
> > > +	ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
> > > +			       &mbus_config);
> > > +	if (ret < 0 && ret != -ENOIOCTLCMD)
> > > +		return ret;
> > >  
> > > -	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> > > +	return mbus_config.link_freq ?:
> > > +		__v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> > 
> > 	if (mbus_config.link_freq)
> > 		return mbus_config.link_freq;
> > 
> > 	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> 
> Whether this would be cleaner is debatable at least. I can switch if you
> insist though.

I think it's nicer. You could even write

 	if (mbus_config.link_freq)
 		return mbus_config.link_freq;

	/*
	 * Fall back to using the link frequency control if the media bus config
	 * doesn't provide a link frequency.
	 */
 	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);

> > I wonder if we should also add a message in case link_freq is 0, to get
> > drivers to convert to reporting the link frequency through
> > .get_mbus_config() if they already implement the operation.
> 
> I'm not sure this will be useful: in most cases the LINK_FREQ control is
> used and for a reason: it's user-configurable. Drivers should only populate
> the field if the link frequency is determined by the driver. For the
> receiver drivers it does not matter: they use v4l2_get_link_freq().

I think this depends on whether or not driver that have a configurable
link frequency should report the current value through
.get_mbus_config(). I think that drivers that implement
.get_mbus_config() should, for consistency.

> > >  }
> > >  EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> > >  #endif /* CONFIG_MEDIA_CONTROLLER */
> > > diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> > > index 5bce6e423e94..cc5f776dc662 100644
> > > --- a/include/media/v4l2-mediabus.h
> > > +++ b/include/media/v4l2-mediabus.h
> > > @@ -148,6 +148,7 @@ enum v4l2_mbus_type {
> > >  /**
> > >   * struct v4l2_mbus_config - media bus configuration
> > >   * @type: interface type
> > > + * @link_freq: The link frequency. See also V4L2_CID_LINK_FREQ control.
> > 
> > Not a candidate for this series, but I'd like to simplify drivers by
> > implementing the LINK_FREQ control automatically.
> > 
> > >   * @bus: bus configuration data structure
> > >   * @bus.parallel: embedded &struct v4l2_mbus_config_parallel.
> > >   *		  Used if the bus is parallel or BT.656.
> > > @@ -162,6 +163,7 @@ enum v4l2_mbus_type {
> > >   */
> > >  struct v4l2_mbus_config {
> > >  	enum v4l2_mbus_type type;
> > > +	u64 link_freq;
> > >  	union {
> > >  		struct v4l2_mbus_config_parallel parallel;
> > >  		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;

-- 
Regards,

Laurent Pinchart

