Return-Path: <linux-media+bounces-6405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9ED871608
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 07:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 171E7285CDD
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 06:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0217BAE1;
	Tue,  5 Mar 2024 06:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TbGEMPNa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028FF1EB2A
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 06:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709621421; cv=none; b=EnET9vvvcnBXfCHgWsXuGMqZOzT6cuZ/u2oerkI+Mbs/Udo+1zip0J4Bjn2iV1Ul+X1lbhZKIscDCfj/mzBN/9wq+2EBTTgfxwEOZwNEy8XtfhkYXOff8Qgy422IpDAt7Td39hY3+p7mbf4d12vKlky4jdsfFgvVxbBRe83Kk7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709621421; c=relaxed/simple;
	bh=g9iCYnwVzF6MY9u/QtG6TEIKcQOnCkeogVWLu8wu4Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NoM7V52HtR5rnK7i05UIs3puXoNCCqDQzZ9pIPUn9Pe2UKASPnNmxbQDFfI1dbikWlS8TFtEzr6CBHzG799agMZnL2xhzT1KrKpoRnRmiurCWvMWf9mEtxnycN3XDDZXSGnQdBTp01L8aawXj8OztEH3BgqEKDKKK2iYC0Yr/lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TbGEMPNa; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709621420; x=1741157420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g9iCYnwVzF6MY9u/QtG6TEIKcQOnCkeogVWLu8wu4Bo=;
  b=TbGEMPNa7rA8pDrSPjvqPZgi9+KjOY4vaZpxXpTWxjH5sLYykYlgF7k+
   7GUSUVx7dyX7p7FkMSLYSt+/cmSgZFcr0DiPuYkCv7Mi7wsSbVx1muRc4
   6/3vQCoSoW6AkssG1BL0A8c80Jb1vmAMp52q0RhHdDWzJAU8MzVlHeApF
   j/2zcZxfLhv2sFVMZ/ojfgL5cxfnja4LThnHR4CGE79cfcpNf8hLERdWq
   JiKLZDu2EL7/0OgV86gFXVfu2lo0kxCde7dBPGvWL6PLNoMADXVItH20g
   Ywf8zXbwgbXYslG8TWtx/P7e31ah9xK5qoOwHov5z69H0KqhtG9l4RFX7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4321282"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4321282"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 22:50:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="13937537"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 22:50:19 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4827C11F8B1;
	Tue,  5 Mar 2024 08:50:15 +0200 (EET)
Date: Tue, 5 Mar 2024 06:50:15 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH 1/1] media: Kconfig: Select MEDIA_CONTROLLER for
 VIDEO_V4L2_SUBDEV_API
Message-ID: <ZebAp9eOS4Awsfwp@kekkonen.localdomain>
References: <20240304185125.33713-1-sakari.ailus@linux.intel.com>
 <20240304225907.GA12503@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304225907.GA12503@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, Mar 05, 2024 at 12:59:07AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Mar 04, 2024 at 08:51:25PM +0200, Sakari Ailus wrote:
> > MEDIA_CONTROLLER has no dependencies and VIDEO_V4L2_SUBDEV_API depends on
> > it. Select MEDIA_CONTROLLER instead of depending on it. This way Kconfig
> > options elsewhere do only need to select VIDEO_V4L2_SUBDEV_API, not both.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > Mostly untested but seems reasonable. MEDIA_CONTROLLER has no dependencies
> > anymore.
> 
> It seems reasonable to me too, but I think it would make sense to drop
> in the same patch the manual selection of MEDIA_CONTROLLER for the
> Kconfig symbols that already select VIDEO_V4L2_SUBDEV_API.

This should be done, yes, but I'd add a separate patch for it: this one
doesn't require changes elsewhere as such, just enables making them. Same
for the other, few users that depend on MEDIA_CONTROLLER, they need to be
converted, too.

> 
> >  drivers/media/v4l2-core/Kconfig | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
> > index 331b8e535e5b..d55eff3f31b0 100644
> > --- a/drivers/media/v4l2-core/Kconfig
> > +++ b/drivers/media/v4l2-core/Kconfig
> > @@ -10,7 +10,8 @@ config VIDEO_V4L2_I2C
> >  
> >  config VIDEO_V4L2_SUBDEV_API
> >  	bool
> > -	depends on VIDEO_DEV && MEDIA_CONTROLLER
> > +	depends on VIDEO_DEV
> > +	select MEDIA_CONTROLLER
> >  	help
> >  	  Enables the V4L2 sub-device pad-level userspace API used to configure
> >  	  video format, size and frame rate between hardware blocks.

-- 
Regards,

Sakari Ailus

