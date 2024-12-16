Return-Path: <linux-media+bounces-23451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 616029F2B26
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 08:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11B97188370F
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 07:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7561FF1C4;
	Mon, 16 Dec 2024 07:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lhts9QaS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78651FF1D6
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 07:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734335238; cv=none; b=WB9o1mN8V7fMQHbtrDEmactqjEAQI2YObIKYxpic6dEsAzaTs3RbA/nuPC1BqMIT5dU3Q0pVGOtRTHe+9Fb2zHcOuJQmpv6+m3qLXi5cYUg+WRuOCbxwP+yukDM/xTBeuhl76pG2kLy2amFxag0kLFcOP4JK0eerWfsPy3IgHS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734335238; c=relaxed/simple;
	bh=4oj85QoLLTVrKEvw03cjOk+kV7+sWVwQoNlnhywINEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5bn0sny+ezPg9kIwl7giAl1oOP2h1HM8Xo8Ma38fbtHEPA2Lcmw8PE/nDwHLkegLW72JpEpvIjLnoS+Rrf9g9c11EVyuaTV76SS37Ze4w7ydLhfFUEvRUboibmr9l5SMADr+9oAqLGS2tPWb7jOattB8NBDq0xa4FubINCLqFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lhts9QaS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734335236; x=1765871236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4oj85QoLLTVrKEvw03cjOk+kV7+sWVwQoNlnhywINEs=;
  b=Lhts9QaS3Jb3J7pb+MU+3pKasq3ifUc0xZuwIvNSlgRcyP2dd+ZM6NGm
   ggDLq4KuXWlX9/2EjMOidUDxu3V+mUeZQe2wfo8a34aslyCk6CKoz4o4M
   Nby7+wcQZgqER/zM5M0X3/6HZI3kmRJTHdE9QrZ2dzfnrptRsxi7cMeVz
   PyKiyejKH1nrUHquBBDyFKOCt2bO7JKeXFmHibd16JCwMP/O0F13E+aeu
   oTuoV36SajaT2WcH0uRTn2QNy/KHytvO8NphP8c/LUxMEEC7Z2oPM5bxC
   yW6aNBXyP4Q7oK4+GlC6iQxk00f0lhZmcVJohsyH06QbXuwAjq+Mhoo+c
   A==;
X-CSE-ConnectionGUID: TFUO1P0zTj6+FsM+75vlRg==
X-CSE-MsgGUID: WXVGrkLwS7WJ+R4d5wxf5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34006370"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34006370"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 23:47:16 -0800
X-CSE-ConnectionGUID: zHmDrMWQSNidv5OXsAY0Pw==
X-CSE-MsgGUID: PtsEKQ0STgODljs2BYDGqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="97548316"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 23:47:15 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0E39F11F775;
	Mon, 16 Dec 2024 09:47:12 +0200 (EET)
Date: Mon, 16 Dec 2024 07:47:12 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH v7 5/5] media: intel/ipu6: Obtain link frequency from a
 sub-device
Message-ID: <Z1_bAI3PQdDNG_VJ@kekkonen.localdomain>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-6-sakari.ailus@linux.intel.com>
 <20241215170832.GI9975@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241215170832.GI9975@pendragon.ideasonboard.com>

Hi Laurent,

On Sun, Dec 15, 2024 at 07:08:32PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.

Thank you for the review. I asked you to review a set but it wasn't this
one:
<URL:https://lore.kernel.org/linux-media/20241129095142.87196-1-sakari.ailus@linux.intel.com/T/#t>.
:-)

> 
> I think this should come before 4/5.
> 
> On Tue, Dec 10, 2024 at 09:59:06AM +0200, Sakari Ailus wrote:
> > Obtain the link frequency from the sub-device instead of a control
> > handler. This allows obtaining it using the get_mbus_config() sub-device
> > pad op that which is only supported by the IVSC driver.
> 
> "which is the only method supported by the IVSC driver"
> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 12 +++---------
> >  1 file changed, 3 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > index 051898ce53f4..da8581a37e22 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > @@ -80,25 +80,19 @@ static const struct ipu6_csi2_error dphy_rx_errors[] = {
> >  s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2)
> >  {
> >  	struct media_pad *src_pad;
> > -	struct v4l2_subdev *ext_sd;
> > -	struct device *dev;
> >  
> >  	if (!csi2)
> >  		return -EINVAL;
> >  
> > -	dev = &csi2->isys->adev->auxdev.dev;
> >  	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
> 
> Not a candidate for this patch, but can the source change, or can it be
> cached at probe time (or notifier bound time) ?

It could be, but why would you do that?

This would also prevent connecting multiple sensors to a single CSI-2
receiver.

> 
> >  	if (IS_ERR(src_pad)) {
> > -		dev_err(dev, "can't get source pad of %s (%ld)\n",
> > +		dev_err(&csi2->isys->adev->auxdev.dev,
> > +			"can't get source pad of %s (%ld)\n",
> >  			csi2->asd.sd.name, PTR_ERR(src_pad));
> >  		return PTR_ERR(src_pad);
> >  	}
> >  
> > -	ext_sd = media_entity_to_v4l2_subdev(src_pad->entity);
> > -	if (WARN(!ext_sd, "Failed to get subdev for %s\n", csi2->asd.sd.name))
> > -		return -ENODEV;
> > -
> > -	return v4l2_get_link_freq(ext_sd->ctrl_handler, 0, 0);
> > +	return v4l2_get_link_freq(src_pad, 0, 0);
> >  }
> >  
> >  static int csi2_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
> 

-- 
Regards,

Sakari Ailus

