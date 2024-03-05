Return-Path: <linux-media+bounces-6413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A64718718A4
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 09:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F4561F22EC1
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 08:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BFE24EB22;
	Tue,  5 Mar 2024 08:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEQ3irPy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8234CB58
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 08:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709628770; cv=none; b=BwqAye2b+1rxoqvdkt51f9MFkmF2+5ufbbHT4QOe07oziWcb1w/QmQnowBcfqrvhttAo3P8MwVmqqubHr24NtfdgUdfR9Z6LzTwmTs6VXJl51lYIYvSK+1NEyhsmzNs1HyhLSpHKHKYwiGbD8y0XylOD0QDzEKJtb/i9mp7C1UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709628770; c=relaxed/simple;
	bh=KOh0z4IJ9HTRIpjUXkXH9yhu0GkfaUyJK7/4ZV0MD2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAfScuCKmFVhpIaOs1Pu3BoNv0WH9CSlHAFRyFGRwBgqp+tEyALHhC1HPVJHoFvL5UlcpIzZeX4vjeqWDxiPGx1TVv5ZQfwK+XN+sFJabCl5Yv4/7EutIR9tQvq6ZJ6JJcUfl60rkhZmcoxjDwYnlzR/exwlDBplVdCIsPOTpG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEQ3irPy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709628768; x=1741164768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KOh0z4IJ9HTRIpjUXkXH9yhu0GkfaUyJK7/4ZV0MD2A=;
  b=TEQ3irPyMO6Mhy8LopkJdh9b2Iwv7P4ta3il170gPIgtqF7i6BvP94l5
   HfEEp+CsXJ033bwD38qd/0jK/jHuOdCD9uTg9cTnfNpPRyHvVrLmMjFlR
   qXINqaruOD8FELFSR5AgqlAB6jIGbhwQ0nTViRJLy+q8za9lg1koS74dF
   BqTW+Y12bFi6ZBzzKC2MbWNzHmp8ZFb4kavzHD7WW4npsT95nUFWz48bx
   2rTgG89nLnZws0BIEB8KuQUWGRJM9rVbttHSuaTunk3mCATRITgax2JEW
   7d/Lqf3K/WrInzrKA8QKghT44WcKzJ05vZR+V8++ejIir1WxFcJlgjvJy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4090539"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4090539"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 00:52:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="40296034"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 00:52:46 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5B22011F871;
	Tue,  5 Mar 2024 10:52:43 +0200 (EET)
Date: Tue, 5 Mar 2024 08:52:43 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 10/29] media: mc: Delete character device early
Message-ID: <ZebdW6d54exGrAup@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-11-sakari.ailus@linux.intel.com>
 <20240207100810.GG23702@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207100810.GG23702@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Feb 07, 2024 at 12:08:10PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Dec 20, 2023 at 12:36:54PM +0200, Sakari Ailus wrote:
> > The parent of the character device related to the media devnode is the
> > media devnode. Thus the character device needs to be released before the
> > media devnode's release function. Move it to unregistering of the media
> > devnode, which mirrors adding the character device in conjunction with
> > registering the media devnode.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > ---
> >  drivers/media/mc/mc-devnode.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> > index 7e22938dfd81..8bc7450ac144 100644
> > --- a/drivers/media/mc/mc-devnode.c
> > +++ b/drivers/media/mc/mc-devnode.c
> > @@ -51,9 +51,6 @@ static void media_devnode_release(struct device *cd)
> >  
> >  	mutex_lock(&media_devnode_lock);
> >  
> > -	/* Delete the cdev on this minor as well */
> > -	cdev_del(&devnode->cdev);
> > -
> >  	/* Mark device node number as free */
> >  	clear_bit(devnode->minor, media_devnode_nums);
> 
> Should this be moved to media_devnode_unregister() too ? It can be done
> in a separate patch.

Good question. Yes, I think that seems reasonable. The minor isn't needed
after unregistering the device.

> 
> >  
> > @@ -270,6 +267,7 @@ void media_devnode_unregister(struct media_devnode *devnode)
> >  	clear_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
> >  	mutex_unlock(&media_devnode_lock);
> >  
> > +	cdev_del(&devnode->cdev);
> 
> I initially wondered if this could raise with the cdev access in
> media_open(), as the media_devnode_lock is released just before calling
> cdev_dev(), but my understanding is that the dev/open race is properly
> handled in the cdev layer.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

> 
> I wonder if a similar change in v4l2-dev.c would be beneficial.

Quite possibly. Let's see...

-- 
Kind regards,

Sakari Ailus

