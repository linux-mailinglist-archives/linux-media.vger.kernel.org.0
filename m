Return-Path: <linux-media+bounces-9545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0018A6F02
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 16:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC43A2864E9
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 14:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C2D1304B9;
	Tue, 16 Apr 2024 14:50:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7422712DDAE
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 14:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713279041; cv=none; b=W+mKtve1J9eE6bQM5xKlr0p9/cywWoHA9+F5lczxU6NElJdOu1DLgXcigccislNwVJBePXHSS5z+8g5sS66IyyM/PpNL8r9T0ZH9UbiVEwyMbvRQgMOoWxhjltkih5X976LrWwNSnvVZjDPLP4s5wsnuoqjdQ7lF44b2wEYjT8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713279041; c=relaxed/simple;
	bh=+IniyZz110U2KrVYzUJRDath+xcu8291bnZ/MWJpfWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwedfJrOUxyGlwnvVtAw0CH2pn0bBuzRFOhg7YEzvyfmlBGqAaEkrtA8S3DNCl1bCWe9RSZdOHjMNHHWS+1o4OTiPPOqqjesMLK46RM9ymWzIxqfdFfAXX1l43e5OehAv5qwuDMIqg+wsD3LkTel7Br8OSZQpB9tCrwi7u1rElw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: tle3tr03TjiIHSjPIub7QA==
X-CSE-MsgGUID: 7ggIUPWCTT6QVcr6HZaj7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12508518"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="12508518"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 07:50:40 -0700
X-CSE-ConnectionGUID: UN0L0e6rQFi4U/SlsRzaIg==
X-CSE-MsgGUID: seiLgdaWRv2vMZBywWjGQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="26707105"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 07:50:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1rwk8o-00000004j3e-3THy;
	Tue, 16 Apr 2024 17:50:34 +0300
Date: Tue, 16 Apr 2024 17:50:34 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 11/23] media: atomisp: Remove test pattern generator
 (TPG) support
Message-ID: <Zh6QOmFbeC-G6RMe@smile.fi.intel.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
 <20240415120220.219480-12-hdegoede@redhat.com>
 <Zh08SP60QytSz3aQ@smile.fi.intel.com>
 <294058a6-72dd-4973-95ee-eaed0c908131@redhat.com>
 <CAHp75Ve2tyqYM0ChjW=ETjJ27xNmtJ3dDK-2pneanuQEwyFRxg@mail.gmail.com>
 <171327825938.342316.14749757279066216268@ping.linuxembedded.co.uk>
 <171327844339.342316.3750832654489118780@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171327844339.342316.3750832654489118780@ping.linuxembedded.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 16, 2024 at 03:40:43PM +0100, Kieran Bingham wrote:
> Quoting Kieran Bingham (2024-04-16 15:37:39)
> > Quoting Andy Shevchenko (2024-04-16 14:34:45)
> > > On Tue, Apr 16, 2024 at 12:25 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > > > On 4/15/24 4:40 PM, Andy Shevchenko wrote:
> > > > > On Mon, Apr 15, 2024 at 02:02:08PM +0200, Hans de Goede wrote:

...

> > > > >>              unsigned int hblank_cycles = 100,
> > > > >>              vblank_lines = 6,
> > > > >>              width,
> > > > >
> > > > > Urgh... These comma operators probably is subject to replace with separate
> > > > > definitions or being grouped on a single line (as it suppose to be in this
> > > > > case).
> > > >
> > > > That indeed is ugly, but fixing this is out of scope for this patch,
> > > > so I've added an extra patch to the set to address this:
> > > >
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/commit/?h=media-atomisp&id=48d93af9d9b0fd40a21a656cb8cd8e25700bfed5
> > > 
> > > WFM, thanks!
> > > 
> > > Btw (yes, I see you tagged that already, so just FYI then)
> > > (1 + (stream->config.pixels_per_clock == 2));
> > > is an interesting way of using
> > > 
> > >  (stream->config.pixels_per_clock == 2) ? 2 : 1);
> > > 
> > > which likely can produce slightly better code (due to use of constant
> > > 2 twice), although it is a pure speculation by me.
> 
> Ooops, I didn't mean to send that. Well I wrote something but then
> closed it when I wasn't going to bother and instead some how sent an
> empty mail ..
> 
> So now I guess I should actually say what I wasn't going to end up
> saying? haha.
> 
> This was too intriguing (to me) so I threw it in godbolt, and for
> various levels of compiler optimsations, both options generate the same
> code, even with -O0. Of course the different optimsation levels produce
> different code, but the two options above always match at the given
> level.

Thanks for playing with this.

The issue with the original code is readability and potential oddity about
boolean to integer conversion. That said, I prefer my variant for the sake
of clarity.

> Fun with godbolt ;-)
> 
> https://godbolt.org/z/hYjrvK6hn

-- 
With Best Regards,
Andy Shevchenko



