Return-Path: <linux-media+bounces-5552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE02685D737
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 12:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68BED1F222F4
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 11:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D3544C87;
	Wed, 21 Feb 2024 11:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PhD3pagG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358E544C84
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 11:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708515440; cv=none; b=m8j4bw3Hyp3WyjWWIoxgFy+ItjFkvaP/c69nS8otZ293mZogEQWKSipuBdr3L0nX5+EAn4TtMILbgZ+W2ryAFKlplnL2gSUJBPVWZRfdQX7VHzDUHPTpVSGdCjyfhxE3d2H5amVlve/tDccPfornbSyRBtXGTyGHbfMA4w3w3nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708515440; c=relaxed/simple;
	bh=g2sfnr4UXn+GHrqPDV8M3GxliepjwhwNlNjEwW51keo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBBxyjW2pI6WM9c3cJZbLGZG6G4oyHYRr28g4y2n06GZkaTWarQPFY/HdyNk1szxRurpam97qf8NyfIp2nbkPE7x7clTu98YZ0Jt8YyKFpGWAOmRFc7K57zmY8iFdzidD16cyTeNbX7BTlTZFIsGT7bsYIFahBMwF8f8zE1fObo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PhD3pagG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708515439; x=1740051439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g2sfnr4UXn+GHrqPDV8M3GxliepjwhwNlNjEwW51keo=;
  b=PhD3pagGJil5UzJs/KibyqW6uWDJaUeQ7DBvaYtmUX0DWqihqGwKthNZ
   l97xeTCZwM8Er3Nxlr8AnLyiPgxfIqPHvvGsh+DPw4DxPeKqeY6VoSkF4
   T9w8x0qvxfYvIMIFKPVOOEtCS5baD93KAVS88mvhIz6OeTPYAlgSoMdzk
   Hs2W/Mx3yyMIkG0hRqsKV3ZKXfusTCruMEH4oPem5ypLaIUaSAgob/WDv
   2Q4BlXmsoMn3RIW6tGt7N8UR+9+ANxO30RMbr2OwF3OofAjC+6HCWEBd3
   BU1pnzAznbpt12FVpuICJnor/8Q2DOjiOkNI0RCMzISLxwORcz8qUkVAC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2793189"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2793189"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 03:37:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5470493"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 03:37:18 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BABBA11F855;
	Wed, 21 Feb 2024 13:37:14 +0200 (EET)
Date: Wed, 21 Feb 2024 11:37:14 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 24/29] media: Documentation: Document how Media device
 resources are released
Message-ID: <ZdXgaoIpt12ICnQO@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-25-sakari.ailus@linux.intel.com>
 <20240207144304.GU23702@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207144304.GU23702@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Feb 07, 2024 at 04:43:04PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Dec 20, 2023 at 12:37:08PM +0200, Sakari Ailus wrote:
> > Document that after unregistering, Media device memory resources are
> > released by the release() callback rather than by calling
> > media_device_cleanup().
> > 
> > Also add that driver memory resources should be bound to the Media device,
> > not V4L2 device.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/driver-api/media/mc-core.rst | 18 ++++++++++++++++--
> >  include/media/media-device.h               |  6 ++++--
> >  2 files changed, 20 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
> > index 2456950ce8ff..346f67760671 100644
> > --- a/Documentation/driver-api/media/mc-core.rst
> > +++ b/Documentation/driver-api/media/mc-core.rst
> > @@ -46,13 +46,27 @@ Drivers initialise media device instances by calling
> >  :c:func:`media_device_init()`. After initialising a media device instance, it is
> >  registered by calling :c:func:`__media_device_register()` via the macro
> >  ``media_device_register()`` and unregistered by calling
> > -:c:func:`media_device_unregister()`. An initialised media device must be
> > -eventually cleaned up by calling :c:func:`media_device_cleanup()`.
> > +:c:func:`media_device_unregister()`. The resources of an unregistered media
> 
> "of an unregistered media device" sounds weird here, I interpret it as
> applying only to media devices that have never been registered.

How about "newly unregistered"?

> 
> > +device will be released by the ``release()`` callback of :c:type:`media_device`
> > +ops, which will be called when the last user of the media device has released it
> > +calling :c:func:`media_device_put()`.
> > +
> > +The ``release()`` callback is the way all the resources of the media device are
> > +released once :c:func:`media_device_init()` has been called. This is also
> > +relevant during device driver's probe function as the ``release()`` callback
> > +will also have to be able to safely release the resources related to a partially
> > +initialised media device.
> >  
> >  Note that it is not allowed to unregister a media device instance that was not
> >  previously registered, or clean up a media device instance that was not
> >  previously initialised.
> 
> Does this need an update, as we don't cleanup explicitly instead ?

I think this should remain unchanged, at least as long as there are drivers
using the old API.

> 
> >  
> > +Media device and driver's per-device context
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +Drivers should use the struct media_device_ops ``release()`` callback to release
> > +their own resources and not e.g. that of the struct v4l2_device.
> > +
> >  Entities
> >  ^^^^^^^^
> >  
> > diff --git a/include/media/media-device.h b/include/media/media-device.h
> > index c6816be0eee8..98e1892f1b51 100644
> > --- a/include/media/media-device.h
> > +++ b/include/media/media-device.h
> > @@ -250,8 +250,10 @@ void media_device_init(struct media_device *mdev);
> >   *
> >   * @mdev:	pointer to struct &media_device
> >   *
> > - * This function that will destroy the graph_mutex that is
> > - * initialized in media_device_init().
> > + * This function that will destroy the graph_mutex that is initialized in
> 
> While at it, s/that will/will/

Yes.

> 
> > + * media_device_init(). Note that *only* drivers that do not manage releasing
> > + * the memory of th media device itself call this function. This function is
> 
> s/of th/of the/
> 
> "that do not manage releasing the memory of the media device itself" is
> hard to understand for someone who hasn't paid close attention to the
> development of this series. This text needs improvements.

Hmm. How about:

Note that only drivers that do not have a proper release callback of the
struct media_device call this function.

> 
> > + * thus effectively DEPRECATED.
> >   */
> >  void media_device_cleanup(struct media_device *mdev);
> >  
> 

-- 
Regards,

Sakari Ailus

