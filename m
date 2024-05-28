Return-Path: <linux-media+bounces-12065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A9F8D1600
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 10:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C23FE1F227F3
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 08:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5136213BC04;
	Tue, 28 May 2024 08:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZdtluKWA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239B671738
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 08:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716883937; cv=none; b=SirRijVAsePOrpPv5deJ1mGOO551GJzoTt/3taQRBnSAsfq8syGUHhSpLc1mCTfCtbDyFbqIv/p/5BV/YwJ9cp1bk0AD+ZrBvoiumcK6yYF/c+5/mBxR9fbdRYG0SWGSRvqyRFjbLIYZN9f6COQ6UU+vkpaaoWEMeClWTQ5rOaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716883937; c=relaxed/simple;
	bh=9UH13LXD4kgrY8LR/JJv4cvwu5B2KIk7HUfrktmUKIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pw/8orpV4RxRjc2px8NeiS/DwWPWUEul60J3KsaW6GvmJ+rtpKPewYY7Y/YledbA06WcYC/CJVI/H0SgrddhcSfEN+3hIHSk4ef7ybIhQ6zo8uzjtAgWYCfO7OgO9WiNTfESnLh3uwGchCIks58uLzg9PdqcEDkoyzslkzemumk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZdtluKWA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716883936; x=1748419936;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9UH13LXD4kgrY8LR/JJv4cvwu5B2KIk7HUfrktmUKIo=;
  b=ZdtluKWAJakRGR5sJFr1VNDtSHvD3K5FdhJbTZmNJC07ujoYsYsCC7oH
   v8Rq0kIFims7ADpaUGxMm/JTR6y9DIYto10H7JMI1lUsUkxtrX0tq6CLG
   HXUyrpCxppkUYEyx71W2rhD3JAF/gabn2mVnWPa/O+wqg7/jJFaeQjGFg
   QTTZllqg3lH7BaoPTL3OFNUCjBoh35rZmUzBd+Vkis4BXJRXeanOkBORB
   6y+13yWXgbEyxsOFIikR83OoVD26VtMItomV/DxFWLkoBuDDuTvBQEQmF
   g8F3RSxlj0EqzCGOldZ3tANTpiF5dtLJkioSraneyzQJnH1Kk+P2cifxm
   g==;
X-CSE-ConnectionGUID: NkHvFPv5TzWAThfCAW1w3g==
X-CSE-MsgGUID: ZqKOB/RGTQigoakQFSZTbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="17046653"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="17046653"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 01:12:15 -0700
X-CSE-ConnectionGUID: J9y/TUHTRi2H/THjAuSpiQ==
X-CSE-MsgGUID: 09dUwHdFQIuxvWMWHCOV3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="58170072"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 01:12:14 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B0EED11FA4A;
	Tue, 28 May 2024 11:12:11 +0300 (EEST)
Date: Tue, 28 May 2024 08:12:11 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v6 2/4] media: v4l: Support obtaining link frequency via
 get_mbus_config
Message-ID: <ZlWR24e5UHLvdrAi@kekkonen.localdomain>
References: <20240516122539.30787-1-sakari.ailus@linux.intel.com>
 <20240516122539.30787-3-sakari.ailus@linux.intel.com>
 <auogsnxxlad6e43phqhtu4njj5vzps5njmvuk7fcmiitnj4imn@dms3jrdfyi3s>
 <ZlV1CAEpU8eqSeTM@kekkonen.localdomain>
 <zxforr3b6ahagkkqghqhxzn555wjq6edubcvybtopj5n636vj6@f5jms6q2rwzn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zxforr3b6ahagkkqghqhxzn555wjq6edubcvybtopj5n636vj6@f5jms6q2rwzn>

Hi Jacopo,

On Tue, May 28, 2024 at 09:16:06AM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Tue, May 28, 2024 at 06:09:12AM GMT, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Fri, May 17, 2024 at 12:31:43PM +0200, Jacopo Mondi wrote:
> > > On Thu, May 16, 2024 at 03:25:37PM GMT, Sakari Ailus wrote:
> > > > Add link_freq field to struct v4l2_mbus_config in order to pass the link
> > > > frequency to the receiving sub-device.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-common.c | 11 ++++++++---
> > > >  include/media/v4l2-mediabus.h         |  2 ++
> > > >  2 files changed, 10 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > > > index 01650aed7c30..ff859a340c5d 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-common.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > > > @@ -506,13 +506,18 @@ EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
> > > >  s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> > > >  			     unsigned int div)
> > > >  {
> > > > +	struct v4l2_mbus_config mbus_config = {};
> > > >  	struct v4l2_subdev *sd;
> > > > +	int ret;
> > > >
> > > >  	sd = media_entity_to_v4l2_subdev(pad->entity);
> > > > -	if (!sd)
> > > > -		return -ENODEV;
> > > > +	ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
> > > > +			       &mbus_config);
> > > > +	if (ret < 0 && ret != -ENOIOCTLCMD)
> > > > +		return ret;
> > >
> > > Should we do like what we did with endpoint matching ? (let alone the
> > > fact we then backtracked on that.. :)
> >
> > Hmm. What exactly are you suggesting?
> >
> 
> See below
> 
> > >
> > > WARN to encourage tx drivers to implement get_mbus_config and
> > > advertise the link freq through it ?
> >
> > Why? If the value is conveyed by the control, there's no reason to copy it
> > here, is it?
> >
> 
> My understanding is that using get_mbus_config() is preferred, but
> yes, if the control is in place the same value should be propagated
> through both path, which is probably a biy silly, yeah.

The problem is that few drivers implement get_mbus_config() and they
actually shouldn't if the configuration is fixed. I've actually thought of
adding a helper to obtain the information in struct v4l2_mbus_config from
the V4L2 fwnode endpoint but it's not implemented.

> 
> Ok, ignore the suggestion then
> 
> > >
> > > >
> > > > -	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> > > > +	return mbus_config.link_freq ?:
> > > > +		__v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> > > >  #endif /* CONFIG_MEDIA_CONTROLLER */
> > > > diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> > > > index 5bce6e423e94..cc5f776dc662 100644
> > > > --- a/include/media/v4l2-mediabus.h
> > > > +++ b/include/media/v4l2-mediabus.h
> > > > @@ -148,6 +148,7 @@ enum v4l2_mbus_type {
> > > >  /**
> > > >   * struct v4l2_mbus_config - media bus configuration
> > > >   * @type: interface type
> > > > + * @link_freq: The link frequency. See also V4L2_CID_LINK_FREQ control.
> > > >   * @bus: bus configuration data structure
> > > >   * @bus.parallel: embedded &struct v4l2_mbus_config_parallel.
> > > >   *		  Used if the bus is parallel or BT.656.
> > > > @@ -162,6 +163,7 @@ enum v4l2_mbus_type {
> > > >   */
> > > >  struct v4l2_mbus_config {
> > > >  	enum v4l2_mbus_type type;
> > > > +	u64 link_freq;
> > >
> > > I will retaliate that link_freq has different meaning for serial and
> > > parallel busses, and it would feel more natural having something like
> > >
> > > mipi_csi2.link_freq
> > > parallel.pixel_clock
> > >
> > > or do you think it's an overkill ?
> >
> > How is the meaning different? The value reflects the frequency on both
> > buses.
> 
> The meaning is slightly different. For a parallel bus the "link_freq"
> is actually the pixel clock (and thus "link_freq" is an ill-defined concept
> for parallel busses ?). For serial busses there actually is a "link
> frequency" which corresponds to the clock lane frequency.

It's not different on parallel buses: there's a clock signal, too, and the
data lines do use the same frequency. The frequency of that clock is the
link frequency. The pixel clock can be different still as multiple samples
on the bus may be required to obtain a single pixel.

> 
> In general, however we define it, the link_freq is a bus property and
> feels better placed inside the per-bus structures to me.
> 
> Up to you
> 
> >
> > >
> > > >  	union {
> > > >  		struct v4l2_mbus_config_parallel parallel;
> > > >  		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
> >

-- 
Kind regards,

Sakari Ailus

