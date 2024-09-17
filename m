Return-Path: <linux-media+bounces-18351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D9C97B4E6
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 22:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7396428115F
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 20:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF921917C9;
	Tue, 17 Sep 2024 20:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JMSU0cB4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A98613C3D5
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 20:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726606155; cv=none; b=acamYyLmZbUrw7mgR7wZYGjtt6H6nom2VluCJTeqmS7GEjLIJplGpzXYLZ0T0pCZcUrrtD9ZB6+jjBmCQHAASGDTRQzXPN1WnipZMj7L3udHODcfKBwNo4Q/2jnIQ6uHCYKssiWWXUEBwlXJxe8lGLkGBuvvt52JCE4QG+PHQzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726606155; c=relaxed/simple;
	bh=dZJJdV3m/5jpmW1oZIDkAsVaUz+TbEBW9dJWgxSQWpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFc3Kgqk8obcjMTj9SVfT+Qo1Xkb0sgswabTLcutPIxIgZWm0kbXCIwKoRoAYLNGpDgOmBzTPgQN1Uf092dg7wiQyqOXMEZTNispJfuIAz+sAUaMI2Asc6b2mQvV1vRJAd41AUQdCO3866AdAe4PaG0+IieaaeyP8Tkqi7kivxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JMSU0cB4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726606153; x=1758142153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dZJJdV3m/5jpmW1oZIDkAsVaUz+TbEBW9dJWgxSQWpY=;
  b=JMSU0cB4ex0ax4bz5zmfkyri4GnucK87kSnMJEJzIq358g2oewZkyEGq
   MPjRWbJEGA+onRCjW1Qg+LG+a0vYyYRRdtA62ZuQy2hsaDadBDwC+3ufo
   VZ8NuiUbH+Bxu7UEU/hrbtm8DucKQnefp8uI0/59K4FEanzwbmSO9UIYg
   tGr8InO9dekyOkGK297TY1H0xvB8fKJPfZRj9cwhLco/sojtjDtIAkO42
   yLcb/fdBT2jVOteAUZWM3X9LL9DWJ6BA2unTX4SKqE5iATZ0MuT/jLBjG
   9R8vT/R/Teg41tk5Q6HeWM6EWP88s8nX8IugTzrNw3Mh88Ee9tlEMunJM
   w==;
X-CSE-ConnectionGUID: 74ikXy9yQn6wgiJIB4SqtQ==
X-CSE-MsgGUID: 8orjPJT8TqazVD7qIFVD1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="29384873"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="29384873"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 13:49:12 -0700
X-CSE-ConnectionGUID: /862+qN4SQO7RtbTRowXAg==
X-CSE-MsgGUID: FuNQnbeOSiOFGHOQ8rhHSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="69635632"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 13:49:11 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 75BD811F9C3;
	Tue, 17 Sep 2024 17:53:30 +0300 (EEST)
Date: Tue, 17 Sep 2024 14:53:30 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Alain Volmat <alain.volmat@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH 1/2] media: Documentation: Deprecate s_stream video op,
 update docs
Message-ID: <ZumX6smKJtGXa0b1@kekkonen.localdomain>
References: <20240917124345.16681-1-sakari.ailus@linux.intel.com>
 <6a869a88-9fb0-43fd-99f9-9c465419e4cf@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a869a88-9fb0-43fd-99f9-9c465419e4cf@ideasonboard.com>

Moi,

On Tue, Sep 17, 2024 at 05:22:29PM +0300, Tomi Valkeinen wrote:
> On 17/09/2024 15:43, Sakari Ailus wrote:
> > The scope of the s_stream video operation is now fully supported by
> > {enable,disable}_straems. Explicitly document the s_stream() op as
> > deprecated and update the related documentation.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   Documentation/driver-api/media/camera-sensor.rst |  8 ++++----
> >   Documentation/driver-api/media/tx-rx.rst         | 11 ++++++-----
> >   include/media/v4l2-subdev.h                      |  5 +++--
> >   3 files changed, 13 insertions(+), 11 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > index b4920b34cebc..c290833165e6 100644
> > --- a/Documentation/driver-api/media/camera-sensor.rst
> > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > @@ -81,10 +81,10 @@ restart when the system is resumed. This requires coordination between the
> >   camera sensor and the rest of the camera pipeline. Bridge drivers are
> >   responsible for this coordination, and instruct camera sensors to stop and
> >   restart streaming by calling the appropriate subdev operations
> > -(``.s_stream()``, ``.enable_streams()`` or ``.disable_streams()``). Camera
> > -sensor drivers shall therefore **not** keep track of the streaming state to
> > -stop streaming in the PM suspend handler and restart it in the resume handler.
> > -Drivers should in general not implement the system PM handlers.
> > +(``.enable_streams()`` or ``.disable_streams()``). Camera sensor drivers shall
> 
> I didn't go through the docs, but I think we need to make it clear somewhere
> that v4l2_subdev_enable_streams() and v4l2_subdev_disable_streams() _must_
> be used to enable/disable the streaming in the source subdevice, and the
> related subdev callbacks must not be called directly.

It was in the header but not in tx-rx.rst. I added it there for v2.

> 
> Also, v4l2_subdev_enable_streams() and v4l2_subdev_disable_streams() kernel
> doc doesn't seem to clarify that if the driver using those functions does
> not support streams, it should use BIT_ULL(1) as the streams_mask parameter.

BIT_ULL(0)?

I'll add that, too.

-- 
Terveisin,

Sakari Ailus

