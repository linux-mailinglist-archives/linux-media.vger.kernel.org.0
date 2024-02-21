Return-Path: <linux-media+bounces-5553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 322A485D740
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 12:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60A761C21FE5
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 11:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E464A482E9;
	Wed, 21 Feb 2024 11:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sh+LN06s"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF3647A7E
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 11:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708515544; cv=none; b=aNQ0lAmDULacOM7TwwENPVCAxH+f/XEOoNnXFRVlJULS4iLrH7gFDaIXtDKJQIWVG8GZkcTU3+9YRQCmbFGxaYbaODC2m7+fYN0I8VVS5ZV4BHoU5/77e1syWo2f0sTUhDnSFmad7uyhbaYTMJevY+cifOi7yl/1dqu3+z3WDLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708515544; c=relaxed/simple;
	bh=CLkILmfv4nh/seV3/oJXZm9VhKocJm56ozr4r3n8jGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hHh1cykP9iAvmChJEe5Klg4ITf7BkH30TvmAX9Im+tAXiau18xaY21vcmTvXHTbw995nspewgxPzhKvjYMl4UyZHQt9wPmvab7e+efhRsE2wJwANGrivpYECFC0KieqesDKtxHfYyZEQUL9sMjCxTVFAiis/twMYqo77bzT3r3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sh+LN06s; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708515542; x=1740051542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CLkILmfv4nh/seV3/oJXZm9VhKocJm56ozr4r3n8jGE=;
  b=Sh+LN06sUrsVNNMBPKcrHp7703ALUHr066qxim0QVAUZgcOhkxGNzccZ
   6sxMWYlRm5cijGJzqKCiSk2vGTLMuCJ8GnoNClCJFVU6RfnvNZkmSoDgO
   eXofTbkTwflGgiZQIMxtcanir5Aa6G+Zs5JH2tqO6OB8de+sGSsOvyvc/
   8JSRDH/kg18GPX8iuKCr84RngpgbOCwNCdNu0hwuU+my5NKkLX9tRP0J+
   oCJ2Cg8zWvmjpivXhDFZb1Q85g8Ff0MhUyQM6gKiKKH7gsGTbu8Q2T7CE
   hjvJp/bnSltgzMFGmcgAnSv4bcvX5dw9sm+/Yccatf7A6KLwVlMhvu3ga
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="6485011"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="6485011"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 03:39:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="35892190"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 03:39:01 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 59ABF11F855;
	Wed, 21 Feb 2024 13:38:57 +0200 (EET)
Date: Wed, 21 Feb 2024 11:38:57 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 23/29] media: vimc: Release resources on media device
 release
Message-ID: <ZdXg0VOTQRsdtJCB@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-24-sakari.ailus@linux.intel.com>
 <5f37ef41-151e-4320-8921-06e32a936818@xs4all.nl>
 <ZdXWN4wPqT7XdK7K@kekkonen.localdomain>
 <20240221110222.GB31348@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221110222.GB31348@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Feb 21, 2024 at 01:02:22PM +0200, Laurent Pinchart wrote:
> On Wed, Feb 21, 2024 at 10:53:43AM +0000, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Mon, Feb 05, 2024 at 04:02:24PM +0100, Hans Verkuil wrote:
> > > On 20/12/2023 11:37, Sakari Ailus wrote:
> > > > Release all the resources when the media device is related, moving away
> > 
> > s/related/released/
> > 
> > > > form the struct v4l2_device used for that purpose.
> > > 
> > > form -> from
> > 
> > Yes.
> > 
> > > 
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  drivers/media/test-drivers/vimc/vimc-core.c | 15 +++++++++------
> > > >  1 file changed, 9 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
> > > > index af127476e920..3e59f8c256c7 100644
> > > > --- a/drivers/media/test-drivers/vimc/vimc-core.c
> > > > +++ b/drivers/media/test-drivers/vimc/vimc-core.c
> > > > @@ -264,13 +264,12 @@ static int vimc_add_subdevs(struct vimc_device *vimc)
> > > >  	return 0;
> > > >  }
> > > >  
> > > > -static void vimc_v4l2_dev_release(struct v4l2_device *v4l2_dev)
> > > > +static void vimc_mdev_release(struct media_device *mdev)
> > > >  {
> > > >  	struct vimc_device *vimc =
> > > > -		container_of(v4l2_dev, struct vimc_device, v4l2_dev);
> > > > +		container_of_const(mdev, struct vimc_device, mdev);
> > > 
> > > Why this change?
> > 
> > I changed the line already. There's no reason to continue using
> > container_of() instead of container_of_const() that takes const-ness into
> > account, too.
> 
> It should then be at least mentioned in the commit message.

I can add that.

> 
> Any plan to switch to container_of_const() globally in the subsystem ?

This should of course be done.

I can post patches at some point unless someone gets there first. I can't
promise a quick schedule though.

-- 
Regards,

Sakari Ailus

