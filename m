Return-Path: <linux-media+bounces-21361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE86F9C6A9C
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 09:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96EE61F23F2A
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 08:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AAA18A6C4;
	Wed, 13 Nov 2024 08:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmfKFoG5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C29189BB2
	for <linux-media@vger.kernel.org>; Wed, 13 Nov 2024 08:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731486921; cv=none; b=VIK64/eAao6chn7lEJ3LpJ5rsCuAhB0HuvNQSoMYJqqQdi0PSbgTfLcURmBcnvVT1td9R3jIiELlAx8CK/ZYVyKJHZaZrS5/23CZbVlzWf/W4Q1x2XZUPDln0tK6LGU5lGcBUK1J3J3QibRGqbhvF6PQhQs2+xKraaIuMTMQgIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731486921; c=relaxed/simple;
	bh=zLjAEgHQrbQef/c5sdFJc1LYO2md/Oe+S4Oh3ZRv97o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKcE3+oNMpQbsvfNn5/Os7yY709arn9B1O+DZ9GyqQX44zDGt3qq+zoJNEi8RITRrARcrF4MfkxOOYxOrVtZZiOc9iRk9ENhFFFWmL0PD2UOBD39ptkuEdeR9t9EpKKbvne4ayQwSaScdOzPiFLiapcagBNgj/O3WEcnZFIuhfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmfKFoG5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731486920; x=1763022920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zLjAEgHQrbQef/c5sdFJc1LYO2md/Oe+S4Oh3ZRv97o=;
  b=nmfKFoG5njgNcDdYKc2sbaWW8pX2mynrW+llC34Bs3yCRvPK+OIYYl6/
   dribo7zlmi/s5bp2UcNf1c/acb0Ow4TKjArgi0HIshBvJFO8/XF7jreGA
   cJsS2rOjVNe2QB7s9CXyttubLdaOM/JeaW5OwqdNqxuCO9yDY1dyvAnyN
   BSsOmiMcFHXc9IpNR3SgTKI57HxOp+iWfeki7hi7lVU8QkG6aDVhyWCtl
   j5Vkc2C+DwJnWoar7+A47OdGa8bFzy8PuEAJIcZUNZB0SZ+VGloRKLJZV
   cXKSYhg3H4pnGEFqBVPvCw+au/ZRIh7cB4Ea7nbmKnMAGXZkRAQhRCBZW
   g==;
X-CSE-ConnectionGUID: Rm3WHB1iSOqGz1OeXBMn5A==
X-CSE-MsgGUID: lFMvjiq2TziF2rKK6ocPhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31457936"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="31457936"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 00:35:19 -0800
X-CSE-ConnectionGUID: tQX+TH6dQCWJK8Zz35Mwtw==
X-CSE-MsgGUID: q/qYsD0EQKusA2rFcTtI7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="87543451"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 00:35:16 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3B3DF11F72D;
	Wed, 13 Nov 2024 10:35:13 +0200 (EET)
Date: Wed, 13 Nov 2024 08:35:13 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
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
	Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [RFC 4/4] media: v4l: ctrl: Add V4L2_CID_CONFIG_MODEL control
Message-ID: <ZzRkwVlNLzXQmWoK@kekkonen.localdomain>
References: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
 <20241011075535.588140-5-sakari.ailus@linux.intel.com>
 <137d5e38-b9fd-4274-8877-e5f71365242c@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <137d5e38-b9fd-4274-8877-e5f71365242c@xs4all.nl>

Hi Hans,

Thank you for the review.

On Wed, Nov 13, 2024 at 09:03:57AM +0100, Hans Verkuil wrote:
> On 11/10/2024 09:55, Sakari Ailus wrote:
> > Add the V4L2_CID_CONFIG_MODEL control for the configuration model.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 4 ++++
> >  .../userspace-api/media/v4l/subdev-config-model.rst          | 2 ++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c                    | 5 +++++
> >  include/uapi/linux/v4l2-controls.h                           | 3 +++
> >  4 files changed, 14 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > index 27803dca8d3e..928e8e3eed7f 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > @@ -55,3 +55,7 @@ Image Process Control IDs
> >      control value divided by e.g. 0x100, meaning that to get no
> >      digital gain the control value needs to be 0x100. The no-gain
> >      configuration is also typically the default.
> > +
> > +``V4L2_CID_CONFIG_MODEL (bitmask)``
> > +    Which configuration models the sub-device supports. Please see
> > +    :ref:`media_subdev_config_model`.
> 
> First of all the naming is confusing: since this is specific to sub-devices, it
> should at least have 'SUBDEV' in the name. I first thought this reported the

I don't object in principle, but the reason why I didn't add that in v1 was
the names would get quite long. Maybe V4L2_CID_SUBDEV_CFG_MODEL?

> model name or something like that, I'm not sure "configuration model" is a very
> good name.

Feel free to propose a different one. :-)

> 
> Secondly, is this supposed to be valid for all subdevices? Only for sensors?
> Would an HDMI-to-CSI bridge qualify?

I think it could but we should have a use case for it. In other words,
something we can't reasonably express using existing means. In this case
it's a number of interfaces and device type specific behaviour (see the 3rd
patch).

> 
> Thirdly, only V4L2_CID_CONFIG_MODEL_COMMON_RAW is defined right now. What other
> models do you have in mind? What models can co-exist (since this is a bitmask)?

We could have different raw camera models if needed. I don't have any
planned right now, though.

> 
> Finally, why choose a control for this? Should this perhaps be better done as
> a field in media_entity_desc/media_v2_entity?

I don't think it's a great fit. This is largely about V4L2 (to some but
lesser extent about MC) and we traditionally have avoided MC -> V4L2
dependencies.

-- 
Kind regards,

Sakari Ailus

