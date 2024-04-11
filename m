Return-Path: <linux-media+bounces-9083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E62A08A0AD3
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 10:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 231B11C21D6E
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 08:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30FF413FD64;
	Thu, 11 Apr 2024 08:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xg4X3QHC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E29D664DD
	for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 08:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712822801; cv=none; b=R43FKzAo4nHyZnPc6vEu0zbeuohPFhbr1+z22fg9O81+jisEdfGEk/udHXr7pCy2x+UiS7XKBHb4ctzBgb1l0KSoalGdVYffZOO+1zBkM8GkRdrvZl4ddspgeH6OHZduJUOrHK4ZBH6pvXJXkmz5aMhBAnBJrN7fqLBhXyNJb14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712822801; c=relaxed/simple;
	bh=bGeTsGEI7Yclw4iQ3tTICb1wwjWRc50seXYsqzd+vAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBSxlL7JPi1shVieqErGVfikxKrWkCJtSTYreLJ8/bB3MEywqQ+LzvuB+NIuaeI2aBSHGGG1UHb10NDT53NCipQD2NawKC4tSy6rP3V0b1411yKPyd36tfT8Qc1Maf3A1l+gUVw1Xy9P5kU5pgkTyeZLBWbzxo3p1J7FB7W6AcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xg4X3QHC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712822800; x=1744358800;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bGeTsGEI7Yclw4iQ3tTICb1wwjWRc50seXYsqzd+vAo=;
  b=Xg4X3QHC3JpHduQtxZPCBUtfu75pfRDLlydErDbg6TdUAo4oWhKPwepZ
   c5E+9BtVJ/FIg1SLJqGoEIMrrLXT5nCM0SsUrRVSKLYGfIHcNtY7fW8kD
   deq5yuMsxxqWcsN9dCPLvhHRzi3K3JUQ8GHCadHeMeJdt2z4FNPwe8fmO
   ewTsUkNEZ1O0nbg+4uT7bg5Mioz8jFVYdPlcbZw7EYG5kDZywNoCM2cul
   y1Ro7psPl/zf+f88NxPPsxJon7X5g8mvLdoDvkH1PfqJdumcNWYLQ9ZyF
   bXQZ71uJhJVjJXPAOQaDIEm8Mt0ONJDW+u5TXhWK8jGHpqbfYvfTYhjth
   Q==;
X-CSE-ConnectionGUID: MSxUVfptSwWJD1ASgketHw==
X-CSE-MsgGUID: TVl7fciDRA6J0RMxHAY31Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19371618"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="19371618"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 01:06:39 -0700
X-CSE-ConnectionGUID: m6ZZ7kvNS2izAFIJHitpKg==
X-CSE-MsgGUID: cpJel6SURRW+FbLI/7UPAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="25607470"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 01:06:36 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2FBFD12035C;
	Thu, 11 Apr 2024 11:06:34 +0300 (EEST)
Date: Thu, 11 Apr 2024 08:06:34 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 13/38] media: v4l: subdev: Copy argument back to user
 also for S_ROUTING
Message-ID: <ZheaCoyO_iTPE6mm@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-14-sakari.ailus@linux.intel.com>
 <20240320003907.GR8501@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240320003907.GR8501@pendragon.ideasonboard.com>

Hi Laurent,

Thanks for the review.

On Wed, Mar 20, 2024 at 02:39:07AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Mar 13, 2024 at 09:24:51AM +0200, Sakari Ailus wrote:
> > As the user needs to know what went wrong for S_ROUTING, copy array
> > arguments back to the user.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-ioctl.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index d125d23e4e61..95bd56145d38 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -3415,11 +3415,14 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
> >  	 * FIXME: subdev IOCTLS are partially handled here and partially in
> >  	 * v4l2-subdev.c and the 'always_copy' flag can only be set for IOCTLS
> >  	 * defined here as part of the 'v4l2_ioctls' array. As
> > -	 * VIDIOC_SUBDEV_G_ROUTING needs to return results to applications even
> > -	 * in case of failure, but it is not defined here as part of the
> > +	 * VIDIOC_SUBDEV_[GS]_ROUTING needs to return results to applications
> 
> s/needs/need/

I'd say "needs" is correct.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> > +	 * even in case of failure, but it is not defined here as part of the
> >  	 * 'v4l2_ioctls' array, insert an ad-hoc check to address that.
> >  	 */
> > -	if (err < 0 && !always_copy && cmd != VIDIOC_SUBDEV_G_ROUTING)
> > +	if (cmd == VIDIOC_SUBDEV_G_ROUTING || cmd == VIDIOC_SUBDEV_S_ROUTING)
> > +		always_copy = true;
> > +
> > +	if (err < 0 && !always_copy)
> >  		goto out;
> >  
> >  	if (has_array_args) {
> 

-- 
Regards,

Sakari Ailus

