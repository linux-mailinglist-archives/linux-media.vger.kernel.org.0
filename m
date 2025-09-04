Return-Path: <linux-media+bounces-41779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 120E3B43FFC
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 17:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F967A049C5
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 15:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231913090D4;
	Thu,  4 Sep 2025 15:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WkUjzkda"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BD23043DC;
	Thu,  4 Sep 2025 15:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756998469; cv=none; b=J+XqmohofolkiB8YNmTxbE8cvUqxEgJGE5sR8Ze65Qr0OepvcUlR9QFk8KQuquwqgtixAaDYRyqlnGjl+4Y8vpXtm2yH4jOYTgMI3wVCDS/WrSwmbJDB3KVMoeBijWn+dmr7ZhBAaH9LpqAHKUilt6Gvy8/4FFfnViHu1FyBGWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756998469; c=relaxed/simple;
	bh=fS0p2XvoEODSzfsL/y2SRg6kik4BTTH3iloa52I6Zwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJMPJjBS8W1MBbpUnRpWwr7vY/BIcDcz+k+VbQY/uRfW+jp5Z5++q+C7+fYCTMJElCwkIGkqezyY+0/PYCHRBka1PMLGsXoUcnBKigE9Nx0+/Mfgq08QIQT5hwdJev6KAH4W7ejM36GwPoQW9C7yiuWY3SLXVlkJ0Gk3zoJe/Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WkUjzkda; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 659D6F09;
	Thu,  4 Sep 2025 17:06:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756998395;
	bh=fS0p2XvoEODSzfsL/y2SRg6kik4BTTH3iloa52I6Zwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WkUjzkdazSd/Ab/viLMONgDttbk+IxhhaO8VT3lz6l273uWHfZ2k4lX1AywQrsQ7I
	 T6O6MDjd2YlzTTZzuXizAuJ11xcf/4fpl4UVbAZQ6p51dRYPMQcIDf+cc5DbSKu2Uv
	 PvRGlGgjqW55TCQynCJ43FPkqb9AXkY00JcMFEbw=
Date: Thu, 4 Sep 2025 17:07:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, rmfrfs@gmail.com,
	martink@posteo.de, kernel@puri.sm, mchehab@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hverkuil@kernel.org,
	nicolas.dufresne@collabora.com, tomi.valkeinen@ideasonboard.com,
	jonas@kwiboo.se, dan.scally+renesas@ideasonboard.com,
	m.szyprowski@samsung.com, mehdi.djait@linux.intel.com,
	niklas.soderlund+renesas@ragnatech.se
Subject: Re: [PATCH v2 1/3] media: v4l: Add helper to get number of active
 lanes via a pad
Message-ID: <20250904150723.GC6174@pendragon.ideasonboard.com>
References: <20250903102243.1563527-1-isaac.scott@ideasonboard.com>
 <20250903102243.1563527-2-isaac.scott@ideasonboard.com>
 <aLlRgRBztMEicEgM@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLlRgRBztMEicEgM@kekkonen.localdomain>

On Thu, Sep 04, 2025 at 11:44:49AM +0300, Sakari Ailus wrote:
> On Wed, Sep 03, 2025 at 11:22:40AM +0100, Isaac Scott wrote:
> > Sometimes, users will not use all of the MIPI CSI 2 lanes available when
> > connecting to the MIPI CSI receiver of their device. Add a helper
> > function that checks the mbus_config for the device driver to allow
> > users to define the number of active data lanes through the
> > get_mbus_config op.
> > 
> > If the driver does not implement this op, fall back to using the number
> > of data lanes specified in device tree.
> > 
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-common.c | 25 +++++++++++++++++++++++++
> >  include/media/v4l2-common.h           |  1 +
> >  2 files changed, 26 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > index 6e585bc76367..8683107b3704 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -571,6 +571,31 @@ s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> >  	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> >  }
> >  EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> > +
> > +unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad, unsigned int dt_lanes)
> 
> This line would benefit from being wrapped.

I'd also rename the dt_lanes parameter to max_data_lanes. "dt" sounds
like data type.

> > +{
> > +	struct v4l2_mbus_config mbus_config = {};
> > +	struct v4l2_subdev *sd;
> > +	unsigned int lanes;
> > +	int ret;
> > +
> > +	sd = media_entity_to_v4l2_subdev(pad->entity);
> > +	ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
> > +			       &mbus_config);
> > +	if (ret < 0 && ret != -ENOIOCTLCMD)
> > +		return ret;
> > +
> > +	if (!mbus_config.bus.mipi_csi2.num_data_lanes)
> > +		return dt_lanes;
> > +
> > +	lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
> > +
> > +	if (lanes < 0 || lanes > dt_lanes)
> 
> lanes is unsigned int so no need to check for less than 0.
> 
> I might just not use a local variable for this, up to you.
> 

A debug message would also be nice.

> > +		return -EINVAL;
> > +
> > +	return lanes;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_get_active_data_lanes);
> >  #endif /* CONFIG_MEDIA_CONTROLLER */
> >  
> >  /*
> > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > index 0a43f56578bc..3f8937260c76 100644
> > --- a/include/media/v4l2-common.h
> > +++ b/include/media/v4l2-common.h
> > @@ -584,6 +584,7 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
> >  	(pad, mul, div)
> >  s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> >  			     unsigned int div);
> 
> Some kernel-doc documentation would be nice.
> 
> > +unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad, unsigned int dt_lanes);
> 
> Please wrap this, too.
> 
> >  #else
> >  #define v4l2_get_link_freq(handler, mul, div)		\
> >  	__v4l2_get_link_freq_ctrl(handler, mul, div)

-- 
Regards,

Laurent Pinchart

