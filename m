Return-Path: <linux-media+bounces-35893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C2EAE89C7
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 18:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEF6A4A161C
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 16:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EE62D4B66;
	Wed, 25 Jun 2025 16:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIVaB9ou"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F602C375A
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 16:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750868931; cv=none; b=Rk/qh+ze1PmYkfbnK8N8/JLckROzTQGapsxRn4+s+TZJi5CZQlyldqUg0Q22/V13OkjMFmYXVDKyhqbvGZoGYVehiTRv8CJjPJ7IvcxyQxVBAl0iYKM+kFvwzJVDhznz6wVMvCv89+dLGHlF+TB3+M9J/H04/h79djtSE421c1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750868931; c=relaxed/simple;
	bh=jGHlD2pfU0sMVNpQKvgUhxmE8I5pgPIEMj68vmPv748=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1/UNap6Sy5SiLqkf0U+jqeFjirpb+aioMBwsIfvAznMEZIfN9Fi12f15gCGxkH+O31GujnU7Ep6m+TB4CsyWIqqSY3hxz+RUTWHaOT685LjwagYYntUTmY44wp5PW36uZmWf4LWYQwbc8iIh1CG5JSlRn0X5qr3XVxcrg+xmwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIVaB9ou; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750868929; x=1782404929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jGHlD2pfU0sMVNpQKvgUhxmE8I5pgPIEMj68vmPv748=;
  b=OIVaB9ouNDHwMPPhNSQMhN3D5JWIFYDt/Re3iLMCQdlhvJq4NQ4gpBXh
   M7M/Jwwx7dn0ubMPyZnK06iVip6rmelroXY9bZmSdvOZQDZ0q3gMd6gk8
   72UW3zHfhPyK1VrTQ8GFetOyU00OHrikmThi6lnyx8MPNdWfyMBOe0sBI
   /XWiF4nEU3pZ2Uxx96XOCxo5w7rZO77aUD5fQiNt6cmv/6wjukGMWiN0N
   qwCPYjrr2Kj8eMbS64ISf66e/E75N84fdVXDu0Mr44S/OajXec5mt7Ts4
   MMMKi8qc4dNdxi10g8slhMhffB5Km10wPV+TC6RUEBJQPk+vRGLXMYlgs
   Q==;
X-CSE-ConnectionGUID: 3NXc1gnjRE6+OKHL5klgQA==
X-CSE-MsgGUID: zpwHXbadQT+pfow1l5jV0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="55772530"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="55772530"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:28:48 -0700
X-CSE-ConnectionGUID: WvpalZM/RYiJE6d5b+X9/g==
X-CSE-MsgGUID: wFV9iv//S4C5e5PJnr54lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="152391834"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.57])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:28:47 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B72B011F737;
	Wed, 25 Jun 2025 19:28:43 +0300 (EEST)
Date: Wed, 25 Jun 2025 16:28:43 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 10/13] media: v4l2-subdev: Add debug prints to
 v4l2_subdev_collect_streams()
Message-ID: <aFwju1xWor3_8EhX@kekkonen.localdomain>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-11-sakari.ailus@linux.intel.com>
 <20250619222323.GN32166@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619222323.GN32166@pendragon.ideasonboard.com>

Hi Laurent,

On Fri, Jun 20, 2025 at 01:23:23AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Jun 19, 2025 at 11:15:43AM +0300, Sakari Ailus wrote:
> > Print streams found by v4l2_subdev_collect_streams() at debug level.
> 
> Explaining why you found this useful could help.
> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 932fca795d4a..c549a462dac7 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -2219,6 +2219,8 @@ static void v4l2_subdev_collect_streams(struct v4l2_subdev *sd,
> >  		*found_streams = BIT_ULL(0);
> >  		*enabled_streams =
> >  			(sd->enabled_pads & BIT_ULL(pad)) ? BIT_ULL(0) : 0;
> > +		dev_dbg(sd->dev,
> > +			"collect_streams: sub-device does not support streams\n");
> 
> You print the subdev name below, I would print it here too. Maybe
> 
> 			"collect_streams: '%s':%u: streams not supported\n",
> 			sd->entity.name, pad);

Makes sense.

> 
> >  		return;
> >  	}
> >  
> > @@ -2237,6 +2239,9 @@ static void v4l2_subdev_collect_streams(struct v4l2_subdev *sd,
> >  		if (src_cfg->enabled)
> >  			*enabled_streams |= BIT_ULL(src_cfg->stream);
> >  	}
> 
> Please add a blank line here.
> 
> > +	dev_dbg(sd->dev,
> > +		"collect_streams: %s:%u found %#llx enabled %#llx\n",
> 
> 		"collect_streams: '%s':%u: found %#llx, enabled: %#llx\n",
> 
> or possibly
> 
> 		"%s: '%s':%u: found %#llx, enabled: %#llx\n", __func__,
> 
> (same above).

I prefer collect_streams: only as it's shorter, there's no possibility for
confusion in any case.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you!

> 
> > +		sd->entity.name, pad, *found_streams, *enabled_streams);
> >  }
> >  
> >  static void v4l2_subdev_set_streams_enabled(struct v4l2_subdev *sd,
> 

-- 
Regards,

Sakari Ailus

