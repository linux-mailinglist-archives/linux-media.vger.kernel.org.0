Return-Path: <linux-media+bounces-23467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CC89F300E
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 13:05:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81A381614FA
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 12:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D71204C11;
	Mon, 16 Dec 2024 12:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="akrqa/XY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679DE20012C
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 12:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734350726; cv=none; b=SxtkZEvAilSqVNa7z9yozgKLtDeQsEz3tGuV4NkGcpHgTZDor+2w5NRIm+4Zmip5RxRegfdyiZPGkpVRJi34KjgEFnCk1k4nyTJQL72tc4Bj6HnIYiKpusRCcKBZVPqSdLgbPjP7mhQzBe/cYxhyeyaiifTBjape7SCxjuOVpA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734350726; c=relaxed/simple;
	bh=7+XAQ5f9Oryizk28Fg0T9ObwoKCpfcUiYbi5X4cv00w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QzCDbAdukX3u6Xm7jo0y53KcP+QcsK/e2qdhsAY2mACQ4uYaMK0Lk8SRMH2QGThs7aCBh5ToApIG5H/7NkI5Oxy7OIvTmohemnXDc43Y+Dcx7CPJxc4csY9ANzZPqPl0TTRURnLlYVoy9O6LUvlSMjI24tk61QoipbDdMviSEZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=akrqa/XY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734350724; x=1765886724;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7+XAQ5f9Oryizk28Fg0T9ObwoKCpfcUiYbi5X4cv00w=;
  b=akrqa/XYqpC9IZe7m16pmh77wp8dr8/fg+vE3X3gboDMwqyWtwuszIlW
   YDYMvV4e2h3Tj6l80ZliNY2kEnlDVqIvMX2Q0xpMU9dU2d4541INxubsD
   jVSrtx6mCTpyKhI3FM7UEV0iEFkLqq4dbfJqrBEccsJUAjAHK9M9oBCa5
   jwuMERgTMIU8u8V0RlNhiM/XYldm6AqCwW+MwPjbhCSFz5IsSIO8DRGVd
   QTTVMNX/O9I3FMbgT6uVjH6zHMtchslQL9lJwUkOEi1FkH5B2rZe5CiIC
   /8U4DsUzJtdGx2K9t4VFs2GTAp6BQd1j3jUGEjzbmsT5iXwXrSq5j4mMo
   A==;
X-CSE-ConnectionGUID: QDCplkS8Tc+xoR7pPPivlg==
X-CSE-MsgGUID: LXi8V8V+SFqxoVNo4bfTqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45734270"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45734270"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 04:05:24 -0800
X-CSE-ConnectionGUID: SocZOQPXQimWHs7dovREIw==
X-CSE-MsgGUID: 3FvkstOaRq2UusqxHmAF4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97616007"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 04:05:23 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BD49A11F9F7;
	Mon, 16 Dec 2024 14:05:19 +0200 (EET)
Date: Mon, 16 Dec 2024 12:05:19 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v7 3/5] media: Documentation: Update link frequency
 driver documentation
Message-ID: <Z2AXf51lqJMEi-aj@kekkonen.localdomain>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-4-sakari.ailus@linux.intel.com>
 <uk6uc7i3v6bpuphqvrhbkqisammkimgbgoas5g4tsakkcbj2jh@d4rss77am2c2>
 <Z1vfK0cUW9sgBPLt@kekkonen.localdomain>
 <20241215170240.GH9975@pendragon.ideasonboard.com>
 <Z1_fvqg5uuRLDt_A@kekkonen.localdomain>
 <20241216112026.GA24498@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216112026.GA24498@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, Dec 16, 2024 at 01:20:26PM +0200, Laurent Pinchart wrote:
> On Mon, Dec 16, 2024 at 08:07:26AM +0000, Sakari Ailus wrote:
> > On Sun, Dec 15, 2024 at 07:02:40PM +0200, Laurent Pinchart wrote:
> > > On Fri, Dec 13, 2024 at 07:15:55AM +0000, Sakari Ailus wrote:
> > > > On Thu, Dec 12, 2024 at 05:53:53PM +0100, Jacopo Mondi wrote:
> > > > > On Tue, Dec 10, 2024 at 09:59:04AM +0200, Sakari Ailus wrote:
> > > > > > Add the get_mbus_config() as the means for conveying the link frequency
> > > > > > towards the receiver drivers.
> > > > > >
> > > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > ---
> > > > > >  Documentation/driver-api/media/tx-rx.rst | 4 ++++
> > > > > >  1 file changed, 4 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> > > > > > index dd09484df1d3..1430c330fd52 100644
> > > > > > --- a/Documentation/driver-api/media/tx-rx.rst
> > > > > > +++ b/Documentation/driver-api/media/tx-rx.rst
> > > > > > @@ -49,6 +49,10 @@ Link frequency
> > > > > >  The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
> > > > > >  receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
> > > > > >
> > > > > > +On devices where the link frequency isn't configurable, the link_freq field of
> > > > > > +struct v4l2_mbus_config is recommended over controls for conveying the link
> > > > > > +frequency to the downstream driver in the pipeline.
> > > > > 
> > > > > When read in its entirety, the paragraphs
> > > > > 
> > > > >  Link frequency
> > > > >  ^^^^^^^^^^^^^^
> > > > > 
> > > > >  The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
> > > > >  receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
> > > > > 
> > > > >  On devices where the link frequency isn't configurable, the link_freq field of
> > > > >  struct v4l2_mbus_config is recommended over controls for conveying the link
> > > > >  frequency.
> > > > > 
> > > > > Sounds simpler without the last 7 words.
> > > > > 
> > > > > A nit and just tastes maybe
> > > > 
> > > > I used:
> > > > 
> > > > On devices where the link frequency isn't configurable, using the ``link_freq``
> > > > field of struct v4l2_mbus_config is recommended over controls.
> > > 
> > > Is it a recommendation for the transmitter driver or the receiver driver
> > > ? If it's a recommendation for the transmitter driver, does that mean it
> > > should not implement V4L2_CID_LINK_FREQ in that case ? How about the
> > > need to expose the link frequency to userspace when it's fixed ?
> > 
> > For the transmitter. Receivers do not implement get_mbus_config op. I can
> > add a note on this.
> 
> They don't implement it, but they call it. I wasn't sure if this
> documentation was from the point of view of the caller or callee. As you
> mentioned separately that it's located in the transmitter section, that
> makes it clearer, but we can also improve the test:
> 
> Drivers that have a fixed link frequency should report it through the
> ``.get_mbus_config()`` subdev operation, in the``link_freq`` field of
> struct v4l2_mbus_config, instead of through controls.

This isn't correct: the link frequency isn't fixed, it's just not
user-configurable. How about:

Drivers that do not have user-configurable link frequency should report it
through the ``.get_mbus_config()`` subdev pad operation, in the ``link_freq``
field of struct v4l2_mbus_config, instead of through controls.

The ReST seems to be in line with the rest.

-- 
Sakari Ailus

