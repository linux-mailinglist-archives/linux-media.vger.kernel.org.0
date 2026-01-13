Return-Path: <linux-media+bounces-50624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD4ED1B933
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 23:21:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AD7D730082D1
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 22:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8578E36215D;
	Tue, 13 Jan 2026 22:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIOjMLph"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABBC352F89
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 22:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768342860; cv=none; b=X8l3JhZTTbBAYztDd9T5WtcrGsvolywpeatqLsFFSvZcG8t3vuvRDicX2UmjoLpOmG76VBpeeQWF6lzcrUEFjTAepO4m7z3srdD8lTVQn/bstwrvomGvl0LrEBG3rgR+PA6ZLvGmVj3oYeLodwc5dDvI2ZcCmj5rBqcSOJmHwqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768342860; c=relaxed/simple;
	bh=ucEGbb5bBBfL22ip+iffxcX0KVTu95nthaJSSfZZaOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btMbZyYStDOL1QUixWgKE8PTpeAnTTmDMfhreufl0dVSz4HYesS4v+9PQ/ZMWxHBHo2NeOJcxDrvVAXnVyg7qyaMQfBgo1M1rMOKQ3eHxPIJvOo1Vtvo628uU4NGq2WaV2Ob1s5kYXGIfo6ANI7zt7dvxisyRKMT+cg+FknhnP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIOjMLph; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768342859; x=1799878859;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ucEGbb5bBBfL22ip+iffxcX0KVTu95nthaJSSfZZaOU=;
  b=TIOjMLphqmGfEMpojCGyGn2szjxFl+m+k71GdBdkZwfS7fcWXbtIpNgk
   7SU7ZLzr4lK2LWn04S9NxXz9F0PF0yP/3YFbRjqlU/LEwna6Xs1jTs3D3
   s2V8pcc7cShpcAIo5Y53SarMED4G5LNCcJzXsR/bMbjEGRFjTEOw2lEMJ
   PaEmGWk846LDX75W4u91ha3b5fcfVGQW1uXu88hFz5+h1yCRM6R8RB9ih
   GDrGy5Xd4r2YhOVgIuG2TNGVt0az/FUQWE1HbCsDiGWAR1Te6jiIVHWcz
   Q5QNuBbM+3OYhkN+SJx2TR4xgqgxqd95rQPnF4kA0MjzFmrLZCGD8wtpo
   w==;
X-CSE-ConnectionGUID: KWfXWytERdKIqZSfXP/BGQ==
X-CSE-MsgGUID: qTrUrMx/RQGnWoIwKaI+fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73495837"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="73495837"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 14:20:58 -0800
X-CSE-ConnectionGUID: vESE4WhSSU6KBbWlUrPZGg==
X-CSE-MsgGUID: sgJJ26dJSpG/GJIfHGCafA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="204780706"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.58])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 14:20:52 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 253DE120831;
	Wed, 14 Jan 2026 00:20:50 +0200 (EET)
Date: Wed, 14 Jan 2026 00:20:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
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
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 40/64] media: Documentation: Add subdev configuration
 models, raw sensor model
Message-ID: <aWbFQl_sTXdCrOPW@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-41-sakari.ailus@linux.intel.com>
 <aWZbAuW6qx_ZYZVS@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWZbAuW6qx_ZYZVS@zed>

Hi Jacopo,

Thank you for the review.

On Tue, Jan 13, 2026 at 03:50:01PM +0100, Jacopo Mondi wrote:
> > +Routes
> > +^^^^^^
> > +
> > +A sub-device conforming to common raw camera sensor model implements the
> > +following routes.
> > +
> > +.. flat-table:: Routes
> > +    :header-rows: 1
> > +
> > +    * - Sink pad/stream
> > +      - Source pad/stream
> > +      - Static (X/M(aybe)/-)
> > +      - Mandatory (X/-)
> > +      - Synopsis
> 
> In my understanding a route can be
> 
>         - Mandatory (Y/N)
>         - Static (Y/N)
> 
> I found the Maybe/- options confusing
> 
> What does it mean "Maybe" here ? Ehtier a route is static or not, the
> "Maybe" and "No" cases seems to express the same concept in my
> opinion...

It depends on the hardware. This should in fact be "immutable" instead of
"static" actually -- there's been some flux of terminology over the course
of the set.

-- 
Regards,

Sakari Ailus

