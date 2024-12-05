Return-Path: <linux-media+bounces-22686-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 882D19E50F6
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 10:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F19F518823A5
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 09:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7F01D5AA8;
	Thu,  5 Dec 2024 09:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F0ALNzqe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4DA17B506
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 09:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733390001; cv=none; b=UTNunoAqM/JLNsGf9imzMB368zuPwyegbTWHTvoeCk2NhhL6bDZuP/D7aiW8VYrMMmI7OLgwMmqtDgye8aJFvhl2FMl2ZmNfdJkTpMczUUHWDOW+FvficPC3eHvzwBPZSestchbVkKPH8WYouymgQ6gMUA3UMX/7YnfSXom7uIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733390001; c=relaxed/simple;
	bh=n/qmFQtWcorIOIBiJzXnlneYGKR1JBCc9lTPSR4Q13Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bcJBGWcjxm4Bs7iB5jU0zEFgLr2rS79Q0OvMbcXjVoPjaTsQqy0mRwkKG4f4RhKux2k5NKK+IJX9Ivy3FV7lSwRkTWHwV9xREzjQfWcih6OYkBEoFeAkFIeUwQNu5G+3PEIv7V0X17K5GUQR8VkmeGffqYME4LQkkqESsN3nZQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F0ALNzqe; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733390000; x=1764926000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n/qmFQtWcorIOIBiJzXnlneYGKR1JBCc9lTPSR4Q13Y=;
  b=F0ALNzqe2DhRqi5ZVh8+8wILFPF4LuII9Ht8Yww9XQmQ49HCFhCiGl4c
   8kvCYY6ZgroRC94lpPgTUwznSFmt9rWkJBZhP/xjnIdymQfV0ahyyG0Qo
   mMfjwbdr+WQ0847wH3GQABcwCXGQNvY9lPrpHkzyQ/+6q8nk7rn/rbhBk
   SZDyre8ZXFYIAW8DQte2slvsu20yBysaGonAizM4d+T5hwTMOGmhIMnZn
   aLXNdZrt2GBhnK/BSioxAlHa3f3QWaXLEbl2mfeP79y6TLuBLHUb9w2KF
   MICW+SBlAYgFtBQUu7Mr9HdltBnMMBHWybQ3aj5Oi7Q2YxmC/Hq/IVe4I
   A==;
X-CSE-ConnectionGUID: vNVMcr+TTwSR6BBa5Q4ZJw==
X-CSE-MsgGUID: 41zDNxQGRv+4nwCE5hlitA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33430165"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="33430165"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 01:13:20 -0800
X-CSE-ConnectionGUID: nicBO9FrRySRGDjRxjwDew==
X-CSE-MsgGUID: 2AEwXjYUSqyeH9DJeZh8+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="124957830"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 01:13:13 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id ED4D811F775;
	Thu,  5 Dec 2024 11:13:10 +0200 (EET)
Date: Thu, 5 Dec 2024 09:13:10 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
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
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: Re: [RFC v3 6/9] media: uapi: Add V4L2_CID_CONFIG_MODEL control
Message-ID: <Z1FuprFCIcIDL7t9@kekkonen.localdomain>
References: <20241129095142.87196-1-sakari.ailus@linux.intel.com>
 <20241129095142.87196-7-sakari.ailus@linux.intel.com>
 <xn6tlmb5ntq63mgss263ezicnniuhy6553sr4bhp2iav5hz4fs@tlnp2hhpzd52>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xn6tlmb5ntq63mgss263ezicnniuhy6553sr4bhp2iav5hz4fs@tlnp2hhpzd52>

Hi Jacopo,

On Thu, Dec 05, 2024 at 09:43:35AM +0100, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Fri, Nov 29, 2024 at 11:51:39AM +0200, Sakari Ailus wrote:
> > Add the V4L2_CID_CONFIG_MODEL control for the configuration model.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 4 ++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c                    | 5 +++++
> >  include/uapi/linux/v4l2-controls.h                           | 3 +++
> >  3 files changed, 12 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > index 27803dca8d3e..928e8e3eed7f 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> 
> I was initially not sure this belongs to "Image process" controls, but
> having had a look at the existing ones I'm not sure there are better
> places.

Good question. Let's keep it here for the time being. I'm not sure any
other extended control class is a better target. Maybe old user controls? I
wonder what Hans would think.

> 
> I would have considered "Camera Controls" but I'm not sure it's -that-
> better
> 
> > @@ -55,3 +55,7 @@ Image Process Control IDs
> >      control value divided by e.g. 0x100, meaning that to get no
> >      digital gain the control value needs to be 0x100. The no-gain
> >      configuration is also typically the default.
> > +
> > +``V4L2_CID_CONFIG_MODEL (bitmask)``
> > +    Which configuration models the sub-device supports. Please see
> > +    :ref:`media_subdev_config_model`.
> 
> Other RO controls in the file (such as PIXEL_RATE) specify "this
> control is read-only"

I'll add that.

> 
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > index 1ea52011247a..24c9c25e20d1 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1164,6 +1164,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >  	case V4L2_CID_TEST_PATTERN:		return "Test Pattern";
> >  	case V4L2_CID_DEINTERLACING_MODE:	return "Deinterlacing Mode";
> >  	case V4L2_CID_DIGITAL_GAIN:		return "Digital Gain";
> > +	case V4L2_CID_CONFIG_MODEL:		return "Sub-device configuration model";
> >
> >  	/* DV controls */
> >  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > @@ -1481,6 +1482,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >  	case V4L2_CID_DV_RX_POWER_PRESENT:
> >  		*type = V4L2_CTRL_TYPE_BITMASK;
> >  		break;
> > +	case V4L2_CID_CONFIG_MODEL:
> > +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +		*type = V4L2_CTRL_TYPE_BITMASK;
> > +		break;
> >  	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
> >  	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
> >  		*type = V4L2_CTRL_TYPE_INTEGER;
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index 974fd254e573..0152240229ab 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -1225,6 +1225,9 @@ enum v4l2_jpeg_chroma_subsampling {
> >  #define V4L2_CID_TEST_PATTERN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 3)
> >  #define V4L2_CID_DEINTERLACING_MODE		(V4L2_CID_IMAGE_PROC_CLASS_BASE + 4)
> >  #define V4L2_CID_DIGITAL_GAIN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 5)
> > +#define V4L2_CID_CONFIG_MODEL			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 6)
> > +
> > +#define V4L2_CID_CONFIG_MODEL_COMMON_RAW	(1ULL << 0)
> 
> I wonder if "COMMON_" couldn't be removed.

We might have different models for raw sensors. These are just for the
current ones but new ones will have new functionality and we may need to
make changes that won't be compliant. Maybe in that case we'd have v2 or
something though.

> 
> Anyway, all nits or mostly questions, whatever is fine really
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thank you!

-- 
Kind regards,

Sakari Ailus

