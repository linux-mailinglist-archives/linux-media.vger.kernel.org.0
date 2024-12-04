Return-Path: <linux-media+bounces-22627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1A69E3C9A
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 15:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F1742819CE
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 14:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C4F1F758D;
	Wed,  4 Dec 2024 14:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIEN5Al6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AE91F759D
	for <linux-media@vger.kernel.org>; Wed,  4 Dec 2024 14:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733322065; cv=none; b=p8bK6hpB8saY0l7nEIGEZtYZsYurGsupvphWBSCzOG5eJ2M4P0tQ+oWpxZmkH8Y0QLMUZgHr+0R4m/IMrgsWakXkmT9N4ZL0LbCw/YZIgifIguiHlglSHJUgllCSkhEBETtO814nEMcRB1SR72ro0uUUZmDJ85iiL28ZHpwuVTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733322065; c=relaxed/simple;
	bh=BUCTVhvMaz6rJCULKhhhHzOX7PEdSf878x5SBwHZu5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAwTOcfoOyWv5YKr6y4wPhH2kyPRt+LMlF/O+JTW6puMdj/oKxlTFAChBM/obDkfK5lxfNjJFWET4h3bJ+H66fsSyKLcqjEp/LIX0jP3j48RDpW5DMaFf/mbGfBCcf70lNqqLc8ktF8mQYWj/ssNtuvRWgSwVTfp5nOOcqNnXjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIEN5Al6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733322064; x=1764858064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BUCTVhvMaz6rJCULKhhhHzOX7PEdSf878x5SBwHZu5k=;
  b=lIEN5Al6GtLqT3TJ52JbAK13ayGSqh83OOXw01IycAXFh5lDzbVBEFhG
   n5OkUsBLj/r0R1UNvyo6Uey3E6Pj1WhGkEcBJ4G9iQvPQqi/BxidEWzWu
   ZNgv+czS6/s3ic1iJ+Dg474Kwm+zenxoNbs12/dySzks9qCD84lNSZYGv
   nezkd00o7Z474vaOtpVrN5r4n9LlSlZW7e+7clV+AaLiRQK/pep0nTYQT
   /enHCcGqsIEKpC3DiLo8CQXBYHlMZPpTaS2U9roTLIf0JaYVYeP3bBhxc
   R1S86L8kNb/nN2PEAD9uOWYRC4h3HgEln0NqHTs3fYSOo8IcT9AqsIdob
   g==;
X-CSE-ConnectionGUID: K1f4o2GEQ+i/E3RvDXn6IQ==
X-CSE-MsgGUID: w2G7bhugSd2ZQH2enXiw8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44620431"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44620431"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 06:20:57 -0800
X-CSE-ConnectionGUID: EkcuKVUnR22bEyzX6NYqyw==
X-CSE-MsgGUID: oCCbkantTkafDlw5DSPNRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="93454086"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 06:20:51 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8743711F89A;
	Wed,  4 Dec 2024 16:20:48 +0200 (EET)
Date: Wed, 4 Dec 2024 14:20:48 +0000
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
Subject: Re: [RFC v3 4/9] media: Documentation: Add subdev configuration
 models, raw sensor model
Message-ID: <Z1BlQMYCIb5Kcipi@kekkonen.localdomain>
References: <20241129095142.87196-1-sakari.ailus@linux.intel.com>
 <20241129095142.87196-5-sakari.ailus@linux.intel.com>
 <5jxcc3ije4vytvponvl3k6weosr445xgy6bgnfn74dcfwf7loo@w26fnwxncbqo>
 <Z1BXlmDT-1EflH1c@kekkonen.localdomain>
 <xqpuqi6ct4gin7s7grdawboasnuucpnadcfm67b2ga4l2l4d7f@3amdf2zdh2il>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xqpuqi6ct4gin7s7grdawboasnuucpnadcfm67b2ga4l2l4d7f@3amdf2zdh2il>

Hi Jacopo,

On Wed, Dec 04, 2024 at 02:37:21PM +0100, Jacopo Mondi wrote:
> > > > +Common raw camera sensor model
> > > > +------------------------------
> > > > +
> > > > +The common raw camera sensor model defines a set of enumeration and
> > > > +configuration interfaces (formats, selections etc.) that cover the vast majority
> > > > +of funcitionality of raw camera sensors. Not all of the interfaces are
> > >
> > > s/funcitionality/functionalities
> >
> > I'd say singular is right in this case. Maybe Kieran or Dave have an
> > opinion as well? :-)
> 
> 
> Then
> s/funcitionality/functionality
> 
> :)

Ah, indeed. ;-)

...

> > > > +targets are omitted, the further selection rectangle or format is instead
> > > > +related to the previous implemented selection rectangle. For instance, if the
> > > > +sensor supports binning but not analogue crop, then the binning configuration
> > > > +(``V4L2_SEL_TGT_COMPOSE`` selection target) is done in relation to the visible
> > > > +pixel area (``V4L2_SEL_TGT_CROP_DEFAULT`` selection target).
> > >
> > > Let alone the fact I would have used, say, digital crop as an example
> > > of an optional feature, I think allowing to read all the possible
> > > targets would save userspace keeping track of what target the
> > > rectangle they want to configure refers to.
> >
> > This is how the selection API works. If we want to deviate from that, it's
> > another thing, but currently if a driver doesn't support configuring
> > a selection, it won't support that target either.
> >
> > If we required all selection rectangles to be supported even if they
> > wouldn't be configurable, then it'd be up to user to try to change them to
> > see if they can be modified. I'm not sure if that would be an improvement
> > as a whole.
> >
> 
> Yeah, probably a set-then-verify-if-changed is more cumbersome than
> detecting an -EINVAL on set_selection.
> 
> I'm fine with this as long as all the mentioned targets are readable.

Currently it's how this is documented in V4L2 sub-device UAPI
documentation: if you have nothing to configure, then there's no selection
target either.

> > > This makes me think it is intentional not to document digital
> > > scaling/post-scaler crop in this version ?
> >
> > Not in this patch, no. :-)
> >
> > I'm fine merging this to the 5th patch if there's an agreement they should
> > be merged together (probably?).
> >
> 
> I would probably merge the two, yes

Ack. Let's wait for the discussion to conclude.

-- 
Kind regards,

Sakari Ailus

