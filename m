Return-Path: <linux-media+bounces-21153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B41D69C1D26
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 13:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D91401C22CEB
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 12:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644B11E7C38;
	Fri,  8 Nov 2024 12:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RxTavILa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1290C1E7C36
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 12:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731069576; cv=none; b=ehb3SlvyMts9BOV5KWi3UWH/+IcK2By6mvZc3iWU9wvFB1jbkCicFKSF8E7a/DqQW0ZcMFDlQSdcvV3DGNaLh+hznDHRWLmgbkJR3nfkVuVn17kKIO+/TlflnqnMH6PvrDcGyNrgUzL6paiO87C+zuIqOjkFzqN+muMU/FIqtuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731069576; c=relaxed/simple;
	bh=GmuQ/RATaJNGPAHgNA9Q5uDJf+oFUaGdhd171k6ZS/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uoK4LFuJKWIZSB2uim9Fikiutdn6IcEMnSiPI+BGzROr+g/oF3+w8NQrmQv226mGqu6PU94G6F7ytLxC8GaRXzzXQD8h3W5lbOiYEcNOn077iycPk5YJzKc6z+CP9RAmIcOTm7yrMoGw2HFP80D4IBsq1zrTau+4wUxRvtMck+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RxTavILa; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731069575; x=1762605575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GmuQ/RATaJNGPAHgNA9Q5uDJf+oFUaGdhd171k6ZS/Y=;
  b=RxTavILa1OFN+sIPz/vM8IsiUVXzCwhUYThWiae8bw4D1moYio088iBj
   MlCt0ixtM7MrcI4YF0OOztF6lqe0zPCwwYcx01Hq36RBEtdrATDjVSssy
   Sq9GgI8AnAwt+Fgd7Nj5dvfkhma9wwIALJ5I1lfnUP3FNFLT6UDAyuR9I
   c7e9cr4QdYit7eOOUWCJaQ3QcKEOCneLIYPMoWvskG0DShpxSI9XQUouj
   ItikVFKCt1PPh4RO7KSrA237pKXkJFnygvG5HFcLZ5xbfY4Bg9ZxeIsnR
   8SspcxVHYNHtWZYNEuqy/UJRxrLJAvsG5Y5xom/n7aIw+/UILYW5pVXq3
   g==;
X-CSE-ConnectionGUID: LT3Av+HvT5e/YGlye77xHw==
X-CSE-MsgGUID: S5GIWErPTL6mcmUnOgiFlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="33810669"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="33810669"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 04:39:34 -0800
X-CSE-ConnectionGUID: OwwlBYVfQrOnbHBSD9hfOg==
X-CSE-MsgGUID: OZCFgdOkS2SGDSRTh/+UAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="85168037"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 04:39:31 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 32AD911F9BF;
	Fri,  8 Nov 2024 14:39:28 +0200 (EET)
Date: Fri, 8 Nov 2024 12:39:28 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [RFC 2/4] media: Documentation: Reword split of sensor driver to
 two classes
Message-ID: <Zy4GgLRlige9wG87@kekkonen.localdomain>
References: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
 <20241011075535.588140-3-sakari.ailus@linux.intel.com>
 <x2ho2gb7v45a5dyj4urs6czbfftpalsb4kpg3ypq657nodfq5u@st74gzew454p>
 <20241022193958.GD9497@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022193958.GD9497@pendragon.ideasonboard.com>

Hi Laurent, Jacopo,

On Tue, Oct 22, 2024 at 10:39:58PM +0300, Laurent Pinchart wrote:
> On Tue, Oct 22, 2024 at 05:12:58PM +0200, Jacopo Mondi wrote:
> > On Fri, Oct 11, 2024 at 10:55:33AM +0300, Sakari Ailus wrote:
> > > The sensor drivers do not configure the output size of the sensors but the
> > > entire internal pipeline. Reflect this in the documentation.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../userspace-api/media/drivers/camera-sensor.rst      | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > index d82cd803e337..ad4049ff7eec 100644
> > > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > @@ -10,11 +10,13 @@ used to control the camera sensor drivers.
> > >
> > >  You may also find :ref:`media_writing_camera_sensor_drivers` useful.
> > >
> > > -Frame size
> > > -----------
> > > +Sensor internal pipeline configuration
> > > +--------------------------------------
> > >
> > > -There are two distinct ways to configure the frame size produced by camera
> > > -sensors.
> > > +The camera sensors have an internal processing pipeline including cropping and
> > 
> > As a non native speaker I'm probably wrong, but "The" followed by a plural
> > name to identify a category sounds weird to me.
> > 
> > What about just
> > "Camera sensors have"
> 
> That's better, yes.

Agreed.

> 
> > > +binning functionality. The sensor drivers belong to two distinct classes, freely
> > 
> > functionalities ?
> 
> "functionality" is uncountable when it means "The ability to do a task,
> performance, or execution; a set of functions that something is able or
> equipped to perform".
> 
> > Same question for "The sensor drivers", just "Sensor drivers" ?
> >
> > > +configurable and register list based drivers, depending on how the driver
> 
> s/ based/-based/

There are about four other instances of this, I can change those too...

> 
> > 
> > s/drivers/ones ?
> 
> The English language is less concerned about repetitions than French,
> and I assume also Italian. "[...] and register list-based ones" sound
> less natural to me.

Yes, yes, yes, yes.

> 
> > > +configures this functionality.
> > 
> > configures the pipeline.
> 
> Ack on this change.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

-- 
Regards,

Sakari Ailus

