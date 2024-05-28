Return-Path: <linux-media+bounces-12060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 088978D152B
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 09:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BEBA1C2266D
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 07:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9CD73196;
	Tue, 28 May 2024 07:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ldvo5RxN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BC34F201
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 07:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716880578; cv=none; b=Ktkeo+mM9qK7IdOuSGoPDquBInckNkwwtaukS2SyK0fSN5YtkcSxEeQXtczeq/4hdiMLxsSZ3nRuHFOBSsX3HU4aYmjXQPcQVTrFTnU9F7+61rVLNxj9MDRMz8jLWnP/B6M/+iMZ9JEJk/Fy9P1k7NIXn/0aHc4nJTOMsSHAj6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716880578; c=relaxed/simple;
	bh=nUa22CBN9hDYxdLDCmD6oV2f7LSLJYHmaQpEcrdUL1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JEmk/YsudjkKlE4/OaAS8tZUyjovlMevqhMRke0aw+ueZwSfBzS3Ih7r3If2PLSqKMc8Hrx4Sg5lcT9LaLUyKnEeLsEjs1xbHzJoA87cQOi/9zzhqT/lqXruaHFyttDqzs5SfFR2qIFrV/hA6ijp+9WSvQeRafsDtQcpQytCWBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ldvo5RxN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA6A5B53;
	Tue, 28 May 2024 09:16:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716880566;
	bh=nUa22CBN9hDYxdLDCmD6oV2f7LSLJYHmaQpEcrdUL1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ldvo5RxNwH4PfQ7uB2fvFWe+C25ZRFoVRqf+kZkDeximxP80vQiUZYbAaTfJPmV9y
	 6PBMKhTSIqIPXhv7VMisVZV08vgBp2Iog5kzLXJvOqgjUWPmks4PzScKOBpUhWIIOY
	 +gkbBdbPyffqdBLzU7njshiE3gHMwWcrXk4XXdmA=
Date: Tue, 28 May 2024 09:16:06 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, 
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v6 2/4] media: v4l: Support obtaining link frequency via
 get_mbus_config
Message-ID: <zxforr3b6ahagkkqghqhxzn555wjq6edubcvybtopj5n636vj6@f5jms6q2rwzn>
References: <20240516122539.30787-1-sakari.ailus@linux.intel.com>
 <20240516122539.30787-3-sakari.ailus@linux.intel.com>
 <auogsnxxlad6e43phqhtu4njj5vzps5njmvuk7fcmiitnj4imn@dms3jrdfyi3s>
 <ZlV1CAEpU8eqSeTM@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZlV1CAEpU8eqSeTM@kekkonen.localdomain>

Hi Sakari

On Tue, May 28, 2024 at 06:09:12AM GMT, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Fri, May 17, 2024 at 12:31:43PM +0200, Jacopo Mondi wrote:
> > On Thu, May 16, 2024 at 03:25:37PM GMT, Sakari Ailus wrote:
> > > Add link_freq field to struct v4l2_mbus_config in order to pass the link
> > > frequency to the receiving sub-device.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-common.c | 11 ++++++++---
> > >  include/media/v4l2-mediabus.h         |  2 ++
> > >  2 files changed, 10 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > > index 01650aed7c30..ff859a340c5d 100644
> > > --- a/drivers/media/v4l2-core/v4l2-common.c
> > > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > > @@ -506,13 +506,18 @@ EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
> > >  s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> > >  			     unsigned int div)
> > >  {
> > > +	struct v4l2_mbus_config mbus_config = {};
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
> >
> > Should we do like what we did with endpoint matching ? (let alone the
> > fact we then backtracked on that.. :)
>
> Hmm. What exactly are you suggesting?
>

See below

> >
> > WARN to encourage tx drivers to implement get_mbus_config and
> > advertise the link freq through it ?
>
> Why? If the value is conveyed by the control, there's no reason to copy it
> here, is it?
>

My understanding is that using get_mbus_config() is preferred, but
yes, if the control is in place the same value should be propagated
through both path, which is probably a biy silly, yeah.

Ok, ignore the suggestion then

> >
> > >
> > > -	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> > > +	return mbus_config.link_freq ?:
> > > +		__v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
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
> > >   * @bus: bus configuration data structure
> > >   * @bus.parallel: embedded &struct v4l2_mbus_config_parallel.
> > >   *		  Used if the bus is parallel or BT.656.
> > > @@ -162,6 +163,7 @@ enum v4l2_mbus_type {
> > >   */
> > >  struct v4l2_mbus_config {
> > >  	enum v4l2_mbus_type type;
> > > +	u64 link_freq;
> >
> > I will retaliate that link_freq has different meaning for serial and
> > parallel busses, and it would feel more natural having something like
> >
> > mipi_csi2.link_freq
> > parallel.pixel_clock
> >
> > or do you think it's an overkill ?
>
> How is the meaning different? The value reflects the frequency on both
> buses.

The meaning is slightly different. For a parallel bus the "link_freq"
is actually the pixel clock (and thus "link_freq" is an ill-defined concept
for parallel busses ?). For serial busses there actually is a "link
frequency" which corresponds to the clock lane frequency.

In general, however we define it, the link_freq is a bus property and
feels better placed inside the per-bus structures to me.

Up to you

>
> >
> > >  	union {
> > >  		struct v4l2_mbus_config_parallel parallel;
> > >  		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
>
> --
> Kind regards,
>
> Sakari Ailus

