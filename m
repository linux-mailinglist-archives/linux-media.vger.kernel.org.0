Return-Path: <linux-media+bounces-32125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E23EAB10F2
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 12:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21BCE165E04
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B587E28F527;
	Fri,  9 May 2025 10:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BxG68z5u"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A273D17BCE
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 10:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746787250; cv=none; b=Xb8zviIKP/H3WPCw8O871S0tyeEO49c8YxlEVBOhQ2mCGo7w99h/QcFbvkzkKUGGBZp9w/KGe6tOk0NyKZsCCzPgQTK0KHHWK03v923Yv1DInXO++I27G7VLig2YXufEliM79tYEWVTVbdYMJPDRVbw7f/VbMfgZq38NQeh9QL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746787250; c=relaxed/simple;
	bh=bao89HZ9S+citERn3dMkh3HZx/0zaUKdiYEZy+brl/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGClUXbMtB4Ng/sZTadvklY5R6haJ/ZJla3RaJyy2eIr+OXiZfj+lMsKlczjcMJw2YrPJ5s37hSfUivI2loI0L3tco/E7Inn+pc647yS32abhkkoWOotSwz+ag4q/WWAxOEvP3CXwD/TsetU/qLr+vTZfSKWhgHx8uvciHzwdmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BxG68z5u; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746787249; x=1778323249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bao89HZ9S+citERn3dMkh3HZx/0zaUKdiYEZy+brl/I=;
  b=BxG68z5uQ211MoifTg25sDG00VN4STvCqw9K8EBc/zvtw4Kn+F0dAgij
   OlFa+w2d/Z10qGkyJuKXGRPP+ahQ/ygFNVNbvSLPGdEKv0XIpwopRHZnF
   qT8j4/RbuOTwNHoV9BBOUY5BKKSP6BRG8qp+pAs9c7O7bbgPClbCHxtiw
   OqW3nBJbrAX4ZSKWERDvz2Il4vJUcUIr2k4dzjHUjsL204c+3gQ5TN+zi
   BuzI6QaXM3g0aNZkXTUFlX1/O7/BL9JuThsZPA4S6+MIy0sVLywzCGozo
   KwV+0a5QknbENeEvsfTvHhwRvyS/u2aPfkSL2id3uKcKvjbzhsNwydkLB
   g==;
X-CSE-ConnectionGUID: +Z1xFIqOSyuxXRcQjqYKlw==
X-CSE-MsgGUID: T7528Y9LTYWK4WI9oF87Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="51268240"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="51268240"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 03:40:48 -0700
X-CSE-ConnectionGUID: ioLhg2XcRzKKE57JXpXpWA==
X-CSE-MsgGUID: 9fA1IhUbRquBWst3ILCcYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="141531190"
Received: from opintica-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.244.95])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 03:40:41 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B2D8F1201E3;
	Fri,  9 May 2025 13:40:37 +0300 (EEST)
Date: Fri, 9 May 2025 10:40:37 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sean Young <sean@mess.org>, Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Tomasz Figa <tfiga@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Steve Cho <stevecho@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Arthur Vinchon <arthur.vinchon@allegrodvt.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Maxime Ripard <mripard@kernel.org>,
	Stefan Klug <stefan.klug@ideasonboard.com>
Subject: Re: [ANN] Media Summit May 13th: Draft Agenda (v4)
Message-ID: <aB3bpdDrn0TKdleD@kekkonen.localdomain>
References: <f6d44024-a78e-42b8-971a-797ed8fbb1ff@jjverkuil.nl>
 <aBjYnrvg-_T-7xRi@kekkonen.localdomain>
 <20250509094005.GA30047@pendragon.ideasonboard.com>
 <7c4d419a-613c-420e-8885-01ebb006f345@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c4d419a-613c-420e-8885-01ebb006f345@redhat.com>

Hi Hans, others,

On Fri, May 09, 2025 at 12:13:57PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 9-May-25 11:40 AM, Laurent Pinchart wrote:
> > On Mon, May 05, 2025 at 03:26:22PM +0000, Sakari Ailus wrote:
> >> Hans, Laurent, others,
> >>
> >> On Fri, May 02, 2025 at 10:15:27AM +0200, Hans Verkuil wrote:
> >>> 16:35-17:30: Hans Verkuil: Status of Media CI/Multi-committers
> >>>
> >>> Please reply with corrections, questions, etc. to the agenda.
> >>
> >> As it seems we might have a little bit of time left, I'd like to propose a
> >> keysigning party we haven't done for a few years now. We have some new
> >> people here and the folks who have been around for longer have new keys,
> >> too.
> >>
> >> This is what we did the previous time
> >> <URL:https://lore.kernel.org/linux-media/YxhplLKtRAQzlSK/@pendragon.ideasonboard.com/>.
> >>
> >> I wonder if Laurent would like to do the same this time around. I can also
> >> help with the arrangements.
> > 
> > I don't mind signing keys, but I won't have time to organize it. Feel
> > free to take the lead :-)
> 
> Embeddedrecipes will also have a key-signing event, see:
> 
> https://embedded-recipes.org/2025/attend/
> 
> So it might be best if people who want to have their keys signed
> just join that ?

It's very nice they do. I presume many attendees will also attend ER
keysigning party but I'm not sure how many. As we're moving to the new
multi-committer model, having potential committers' keys signed by the
maintainers is even more important now than it used to be.

-- 
Regards,

Sakari Ailus

