Return-Path: <linux-media+bounces-9490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 031D38A65C1
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 10:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3BC528541A
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 08:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE7F15B964;
	Tue, 16 Apr 2024 08:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l17yl4jy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB5215B542
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 08:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713254926; cv=none; b=hbleXtvzDo3aQIc/4RUEBpks1aqEs3SnbWZ4dXI3uJfsEtam6WrLxd41s6grbvpXDjTTMcxo5EIOSyOZuM/iW9/lwPRSs/JoDVOrtUbTvk0LEOuuFlLQzm0XkSW38Ds+4QjTMGOyN0Z3btza6rcXsUPDUgBTevkw64FwUVzqEEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713254926; c=relaxed/simple;
	bh=tNVfew8TqCKIeQHGbw2lc69R71ipJg+dyvvA2PfsQ58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivm6XNu4ye3jma/A3bF/06Fb6j5XrDOtGimo582dwBH7doOTqEaJ5YPFGmExlHW3s9eodnJyf1MmLQv6gaeuv7X+zW6nuY4T2AU/fr3+9DomGWjMmcESqC9QeinnqWOpvWnmN9EctP0NnAsEEPjx0/6CogDjp/xDpO9CBYFapF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l17yl4jy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713254923; x=1744790923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tNVfew8TqCKIeQHGbw2lc69R71ipJg+dyvvA2PfsQ58=;
  b=l17yl4jynNeH8LRzKKeLeGcHfhLD+UzR6ZlVEx7m9cKdC1l3Bwyvq+TR
   6SmpjTtQxGMYGlsu2Sq7ij+0Euj6uIYeN1dVWMgtRePDxr3qSR/lytuHK
   Y19X95VXtWXFbgk4tu0X5OlTh/AU1VMLk2ckQgKg64PR7XSIdYlWLRfI2
   b3c7bmpuzPeefM/dv8OiAbuqcCqwIXwCs9nZ5otDavw693ZLDHOBUvOBN
   ZrE4/zCKNyleBnVdKLNSGxVbEzn0F6mnEh1jweBAOm92LkbsMf+4UrWsl
   LaeM1E5H32yuoJlJKR4BweMVlMdnoL2WB8epCMoRZCRFOfXqJLO2CmXZx
   w==;
X-CSE-ConnectionGUID: sXDrS8psSaGZ72T2UfQL5Q==
X-CSE-MsgGUID: MQk48aJtR3+G7Z7CwUZKXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8540324"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8540324"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 01:08:42 -0700
X-CSE-ConnectionGUID: NYGyZy+DTbCtdqZapqYWTQ==
X-CSE-MsgGUID: PalhF5jtSW2niDUCscfoIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="26834412"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 01:08:41 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6B2A111FAB0;
	Tue, 16 Apr 2024 11:08:38 +0300 (EEST)
Date: Tue, 16 Apr 2024 08:08:38 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 16/38] media: v4l: subdev: Allow a larger number of
 routes than there's room for
Message-ID: <Zh4yBgwi1poXrVpO@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-17-sakari.ailus@linux.intel.com>
 <20240320015319.GU8501@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240320015319.GU8501@pendragon.ideasonboard.com>

On Wed, Mar 20, 2024 at 03:53:19AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Mar 13, 2024 at 09:24:54AM +0200, Sakari Ailus wrote:
> > On VIDIOC_SUBDEV_[GS]_ROUTING, only return as many routes back to the user
> > as there's room. Do not consider it an error if more routes existed.
> > Simply inform the user there are more routes.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/v4l/vidioc-subdev-g-routing.rst              |  4 ----
> >  drivers/media/v4l2-core/v4l2-subdev.c                  | 10 +++-------
> >  2 files changed, 3 insertions(+), 11 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > index 6eb6a59570dc..08b8d17cef3f 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > @@ -147,10 +147,6 @@ On success 0 is returned, on error -1 and the ``errno`` variable is set
> >  appropriately. The generic error codes are described at the
> >  :ref:`Generic Error Codes <gen-errors>` chapter.
> >  
> > -ENOSPC
> > -   The application provided ``num_routes`` is not big enough to contain
> > -   all the available routes the subdevice exposes.
> > -
> 
> I wonder if this patch should be squashed with the previous two. You
> update the documentation in 14/38 already.

I'll do that.

-- 
Sakari Ailus

