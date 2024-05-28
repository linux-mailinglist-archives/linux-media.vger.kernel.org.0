Return-Path: <linux-media+bounces-12055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D04F8D142F
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 08:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3ACA1F21CAE
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 06:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083D34F207;
	Tue, 28 May 2024 06:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hGeO0ygB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC58DF6B
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 06:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716876559; cv=none; b=CmqFX+h7f01TVEjTiZDqE1YqXd2vvobqmZQ90+Zu8rWsiAnBMLbt/cK9iGcJnjePPQI51ldqb5Whk/HGEba77Djt07oFOkrEHNx/lJiU2qUxu1PVzHX0tKKRy2zssTExv/qu8MDkSWmq0Qa23VGrFbmcsEM0bny4PyJ+oyhnm+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716876559; c=relaxed/simple;
	bh=ADyt6tZ5dT8q907PgMs4FTsLTOQPQYt5e9LY3SbUHRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPBoqwl8xJEtjuq5Jcis4hsYp4VTNlxcDNgFnQeMo2t6WYr2kfNIbEnl4p/NLYFtPXOAkBYkf4W7glXbfgdAukRoHuwWs10e2HHMLDBsuVDSJDRDfT6Ujgh+PCh7tJi6ydap9fLWXuGCUH8SHzsaA/4dMVoU4ZQUwktizbwahVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hGeO0ygB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716876557; x=1748412557;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ADyt6tZ5dT8q907PgMs4FTsLTOQPQYt5e9LY3SbUHRw=;
  b=hGeO0ygBuIYJcJkWq08466XIScP6tGpGF5fweF4PWub3bB8U5suwL7j1
   owEqY3zkGXRdef8lpxKqS1Qh39DwGlcr0Ete9FAFQqakRsrb/L1jkvQ1L
   U5h4j0rhWDuDEagmFDS223nPs0MjIp9wb2dQMEimNlw/wi/7XulDF3j8Z
   P1XL1ybKHnKYM47rEVJS06iJDoJJAOsdZroPpsxtHFZEoqSzA+FlNMmNH
   DHRJYiyL3WVJ6bXUh73mhx53YQG6LsE5KqS6+svDSI8VdNmkpHrtimLry
   SXWyQMbKRycXRi2jXCYiLGvOtb78zmKtyU5pautQao4H3XFl/94rULhKH
   Q==;
X-CSE-ConnectionGUID: 61SUIzOBTGGm0sk+2RQuxA==
X-CSE-MsgGUID: kzKPcePUSeOPh3aHScwvXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="12975391"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="12975391"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 23:09:16 -0700
X-CSE-ConnectionGUID: 4KuR4NA+Qw61D22omb5R5A==
X-CSE-MsgGUID: iFlvT29zRx2FFHTnXFPNsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="72367831"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 23:09:16 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 84C7111FA4A;
	Tue, 28 May 2024 09:09:12 +0300 (EEST)
Date: Tue, 28 May 2024 06:09:12 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v6 2/4] media: v4l: Support obtaining link frequency via
 get_mbus_config
Message-ID: <ZlV1CAEpU8eqSeTM@kekkonen.localdomain>
References: <20240516122539.30787-1-sakari.ailus@linux.intel.com>
 <20240516122539.30787-3-sakari.ailus@linux.intel.com>
 <auogsnxxlad6e43phqhtu4njj5vzps5njmvuk7fcmiitnj4imn@dms3jrdfyi3s>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auogsnxxlad6e43phqhtu4njj5vzps5njmvuk7fcmiitnj4imn@dms3jrdfyi3s>

Hi Jacopo,

On Fri, May 17, 2024 at 12:31:43PM +0200, Jacopo Mondi wrote:
> On Thu, May 16, 2024 at 03:25:37PM GMT, Sakari Ailus wrote:
> > Add link_freq field to struct v4l2_mbus_config in order to pass the link
> > frequency to the receiving sub-device.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-common.c | 11 ++++++++---
> >  include/media/v4l2-mediabus.h         |  2 ++
> >  2 files changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > index 01650aed7c30..ff859a340c5d 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -506,13 +506,18 @@ EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
> >  s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> >  			     unsigned int div)
> >  {
> > +	struct v4l2_mbus_config mbus_config = {};
> >  	struct v4l2_subdev *sd;
> > +	int ret;
> >
> >  	sd = media_entity_to_v4l2_subdev(pad->entity);
> > -	if (!sd)
> > -		return -ENODEV;
> > +	ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
> > +			       &mbus_config);
> > +	if (ret < 0 && ret != -ENOIOCTLCMD)
> > +		return ret;
> 
> Should we do like what we did with endpoint matching ? (let alone the
> fact we then backtracked on that.. :)

Hmm. What exactly are you suggesting?

> 
> WARN to encourage tx drivers to implement get_mbus_config and
> advertise the link freq through it ?

Why? If the value is conveyed by the control, there's no reason to copy it
here, is it?

> 
> >
> > -	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> > +	return mbus_config.link_freq ?:
> > +		__v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> >  }
> >  EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> >  #endif /* CONFIG_MEDIA_CONTROLLER */
> > diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> > index 5bce6e423e94..cc5f776dc662 100644
> > --- a/include/media/v4l2-mediabus.h
> > +++ b/include/media/v4l2-mediabus.h
> > @@ -148,6 +148,7 @@ enum v4l2_mbus_type {
> >  /**
> >   * struct v4l2_mbus_config - media bus configuration
> >   * @type: interface type
> > + * @link_freq: The link frequency. See also V4L2_CID_LINK_FREQ control.
> >   * @bus: bus configuration data structure
> >   * @bus.parallel: embedded &struct v4l2_mbus_config_parallel.
> >   *		  Used if the bus is parallel or BT.656.
> > @@ -162,6 +163,7 @@ enum v4l2_mbus_type {
> >   */
> >  struct v4l2_mbus_config {
> >  	enum v4l2_mbus_type type;
> > +	u64 link_freq;
> 
> I will retaliate that link_freq has different meaning for serial and
> parallel busses, and it would feel more natural having something like
> 
> mipi_csi2.link_freq
> parallel.pixel_clock
> 
> or do you think it's an overkill ?

How is the meaning different? The value reflects the frequency on both
buses.

> 
> >  	union {
> >  		struct v4l2_mbus_config_parallel parallel;
> >  		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;

-- 
Kind regards,

Sakari Ailus

