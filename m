Return-Path: <linux-media+bounces-11775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 894368CCEAD
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 10:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C964B21747
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 08:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A2E5101A;
	Thu, 23 May 2024 08:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qLtYRiaX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868A013CFBC
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 08:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716454453; cv=none; b=k+kOoN8noJXL0QN16+MB6fKHvpMYHqAkPqHWKpkYtIC65wFi3qLtYvjpbylQ/aV3ajo3B/+zAtUPR3/FSuGwROOwP/T+lex/MGAwf9l3dum/eVqP87tv5M2wsz8GBCeiLU3BbW+u17MeHDMzCL1hv8QpLw0/mkiGE8PHrpQNrYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716454453; c=relaxed/simple;
	bh=8vkKKUErvtcVzEZbVsgymSoSoEb6IX2+Df9x2+2FXlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQt09/fWgC/o8wYhQuVpqzfLr6/aPr+vd7Eq60jRzrqZ6C7hy4LGo0YidZcGx8/iAIlvvlGrJQ3uBK19zeVqTr5GcmTn1d0WPJ+j8sij2HOIQVAja1Zp5OdumB2tQtWvFrOXhGaskhRcYjYMKcPEDXZ+n764AXA0VNMKqo0Oq3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qLtYRiaX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87C0921D;
	Thu, 23 May 2024 10:53:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716454433;
	bh=8vkKKUErvtcVzEZbVsgymSoSoEb6IX2+Df9x2+2FXlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qLtYRiaXR5DGlD8mS98Sasqbtvh5UD3yK+HHRJFoBPYRoVXbS3hf+If3Zgp53bxsi
	 wuz7rWqsWF3mJEEe+6K5rXoLJQH0DycLzlnyZvfvgukfqlEcpOJl6VCNjntIw4XQMv
	 pvg4IC/96QCN+UdZj5NhoykRIKiRb5Wgoy8OHzpU=
Date: Thu, 23 May 2024 11:53:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH 1/1] media: Kconfig: Select MEDIA_CONTROLLER for
 VIDEO_V4L2_SUBDEV_API
Message-ID: <20240523085356.GA18446@pendragon.ideasonboard.com>
References: <20240304185125.33713-1-sakari.ailus@linux.intel.com>
 <20240304225907.GA12503@pendragon.ideasonboard.com>
 <ZebAp9eOS4Awsfwp@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZebAp9eOS4Awsfwp@kekkonen.localdomain>

On Tue, Mar 05, 2024 at 06:50:15AM +0000, Sakari Ailus wrote:
> On Tue, Mar 05, 2024 at 12:59:07AM +0200, Laurent Pinchart wrote:
> > On Mon, Mar 04, 2024 at 08:51:25PM +0200, Sakari Ailus wrote:
> > > MEDIA_CONTROLLER has no dependencies and VIDEO_V4L2_SUBDEV_API depends on
> > > it. Select MEDIA_CONTROLLER instead of depending on it. This way Kconfig
> > > options elsewhere do only need to select VIDEO_V4L2_SUBDEV_API, not both.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > > Mostly untested but seems reasonable. MEDIA_CONTROLLER has no dependencies
> > > anymore.
> > 
> > It seems reasonable to me too, but I think it would make sense to drop
> > in the same patch the manual selection of MEDIA_CONTROLLER for the
> > Kconfig symbols that already select VIDEO_V4L2_SUBDEV_API.
> 
> This should be done, yes, but I'd add a separate patch for it: this one
> doesn't require changes elsewhere as such, just enables making them. Same
> for the other, few users that depend on MEDIA_CONTROLLER, they need to be
> converted, too.

I'm OK with a separate patch, but can you send one ? :-)

> > >  drivers/media/v4l2-core/Kconfig | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
> > > index 331b8e535e5b..d55eff3f31b0 100644
> > > --- a/drivers/media/v4l2-core/Kconfig
> > > +++ b/drivers/media/v4l2-core/Kconfig
> > > @@ -10,7 +10,8 @@ config VIDEO_V4L2_I2C
> > >  
> > >  config VIDEO_V4L2_SUBDEV_API
> > >  	bool
> > > -	depends on VIDEO_DEV && MEDIA_CONTROLLER
> > > +	depends on VIDEO_DEV
> > > +	select MEDIA_CONTROLLER
> > >  	help
> > >  	  Enables the V4L2 sub-device pad-level userspace API used to configure
> > >  	  video format, size and frame rate between hardware blocks.

-- 
Regards,

Laurent Pinchart

