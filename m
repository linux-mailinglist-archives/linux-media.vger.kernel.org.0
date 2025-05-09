Return-Path: <linux-media+bounces-32127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCDAAB1142
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 12:53:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69B4D4C7921
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732AA28ECE0;
	Fri,  9 May 2025 10:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gUS8uAuV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5AE277011
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 10:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788018; cv=none; b=LoEgmf1gDmJH+eTi1cTw4b4xUCAlM4B1cybGttfPKt/6E9QPpCxFHoHPu3RvIVTcAMxQrQ2aB7kchKkIUZnWpSV+5U6F7q+b4TVu9VHRh3NL0r8MnVySRB82cnxbV6ViS9HvLWWiBrNDPRza+MKscQrhT9UA2KmLylj2dN0oOoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788018; c=relaxed/simple;
	bh=SuWbZbnxEatcvUAx8umOew0tnyUDszWHKUwBVTjj0rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgB0UVAAx896kipIpCeIGGLhcj0xqz4+BCV2pmSp8nPDpcHwffVCnWKTWO7Yz+ZwEjKBxXFka6g2qbtFtL25UIknSwip3glnvP4YB8ifkno70qq6QtnopEcUSERszyqPAI9pXPR5GeDId4S+UnZMwo5tECnPr0z+UMy/8gEPLcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gUS8uAuV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746788018; x=1778324018;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SuWbZbnxEatcvUAx8umOew0tnyUDszWHKUwBVTjj0rQ=;
  b=gUS8uAuVN+PmmsHipc2GUDSWKixZ6Rrky4cvhuOeNHlhSqsTPbK6zOfZ
   QCZDBkviajfrkYolGNduHQR6HQMmY4sgQnV6XMyPKKsvuP7ghebAL3byk
   JUVC9e04ylJdDfL39Ovk2wfLdiAsBk23n9N06pHX9//XwuqnqNPPUYBi8
   XLSe92ethSLykrh7Xgc2hodP782xVjRs5y2QDagE3HgnrMTnbdP5ou/sn
   D7eayYkuza91GGuvibJnZfg33RGkdK2iN0LnpMs/eJwRYLdR215ZBa8pK
   G01IYLJihBO7BRUIAmfSyHRPYWLwa/wXy7SOFfsNg+sMiekPQOPmcmvzS
   g==;
X-CSE-ConnectionGUID: 06nIRqbRSOW1D1RuVMc8ag==
X-CSE-MsgGUID: zdBOmOdCTleL9+0EQnoELg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="71119988"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="71119988"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 03:53:37 -0700
X-CSE-ConnectionGUID: bHbIiarmRdOBm2YfpE0Gag==
X-CSE-MsgGUID: pXo9frvpRlGr+MbNrPhA5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="159880423"
Received: from opintica-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.244.95])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 03:53:29 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CB2611201E3;
	Fri,  9 May 2025 13:53:26 +0300 (EEST)
Date: Fri, 9 May 2025 10:53:26 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>,
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
Message-ID: <aB3epuwBBNlivsES@kekkonen.localdomain>
References: <f6d44024-a78e-42b8-971a-797ed8fbb1ff@jjverkuil.nl>
 <aBjYnrvg-_T-7xRi@kekkonen.localdomain>
 <20250509094005.GA30047@pendragon.ideasonboard.com>
 <7c4d419a-613c-420e-8885-01ebb006f345@redhat.com>
 <aB3bpdDrn0TKdleD@kekkonen.localdomain>
 <20250509104656.GF28896@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509104656.GF28896@pendragon.ideasonboard.com>

Hi Laurent,

On Fri, May 09, 2025 at 12:46:56PM +0200, Laurent Pinchart wrote:
> On Fri, May 09, 2025 at 10:40:37AM +0000, Sakari Ailus wrote:
> > On Fri, May 09, 2025 at 12:13:57PM +0200, Hans de Goede wrote:
> > > On 9-May-25 11:40 AM, Laurent Pinchart wrote:
> > > > On Mon, May 05, 2025 at 03:26:22PM +0000, Sakari Ailus wrote:
> > > >> Hans, Laurent, others,
> > > >>
> > > >> On Fri, May 02, 2025 at 10:15:27AM +0200, Hans Verkuil wrote:
> > > >>> 16:35-17:30: Hans Verkuil: Status of Media CI/Multi-committers
> > > >>>
> > > >>> Please reply with corrections, questions, etc. to the agenda.
> > > >>
> > > >> As it seems we might have a little bit of time left, I'd like to propose a
> > > >> keysigning party we haven't done for a few years now. We have some new
> > > >> people here and the folks who have been around for longer have new keys,
> > > >> too.
> > > >>
> > > >> This is what we did the previous time
> > > >> <URL:https://lore.kernel.org/linux-media/YxhplLKtRAQzlSK/@pendragon.ideasonboard.com/>.
> > > >>
> > > >> I wonder if Laurent would like to do the same this time around. I can also
> > > >> help with the arrangements.
> > > > 
> > > > I don't mind signing keys, but I won't have time to organize it. Feel
> > > > free to take the lead :-)
> > > 
> > > Embeddedrecipes will also have a key-signing event, see:
> > > 
> > > https://embedded-recipes.org/2025/attend/
> > > 
> > > So it might be best if people who want to have their keys signed
> > > just join that ?
> > 
> > It's very nice they do. I presume many attendees will also attend ER
> > keysigning party but I'm not sure how many. As we're moving to the new
> > multi-committer model, having potential committers' keys signed by the
> > maintainers is even more important now than it used to be.
> 
> Unless I'm missing something, the multi-committer model won't make use
> of GPG to push and merge.

There's no direct dependency to that at the moment. In the future we may
not want to trust infrastructure as much as we do at the moment, and
changing that probably means using GPG in a way or another.

-- 
Sakari Ailus

