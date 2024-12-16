Return-Path: <linux-media+bounces-23456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 905A99F2B86
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 09:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7794D163C2D
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 08:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20941FF7AC;
	Mon, 16 Dec 2024 08:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ikwH+8pE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761F41CEAD5
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 08:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734336534; cv=none; b=r2huMiqxkhqjrl2cRlTGeYR53lV9qC4wfXa5reGt9T3R/wI1npa9NP0oQCKmDC1IOFhIMOgunDPMyNccgmsp9qVD8nJcIWsicu9oKrgRg9c7C6ziqxoz+u3VNH/DihzQPJAq/z/gWtVoa3wOoFlJAAecB9dXnXP5faDz2eBZ9XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734336534; c=relaxed/simple;
	bh=CVkAOaspQEXjjohcoKLrXQLAoKgRirgLpDJIGD9hj20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKfNtC4G0rBx+3ItuMf2IiB5J9mhDcdKUF/H82HjsPDUxMZlLn0WAgUfx6pt+CqioWOjpus9zitqP616IYPnMjA492zqioYw6pExxCrDtyhl3zalnrCG5g7k4IEbgx6yB/kPUdLcKwKN6L/urafD6SOznXks1gdAkzdEGykbA00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ikwH+8pE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734336532; x=1765872532;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CVkAOaspQEXjjohcoKLrXQLAoKgRirgLpDJIGD9hj20=;
  b=ikwH+8pE4uwkN6tRDGpIf8Y35J9ho3btQJKW7/EH/B6nBaRvNVrC0Ivq
   TWDlrBxW9m03Q+xCtXzTXdllWrjO4X85bBk1DvF1YC17zYFO9GXkIxF10
   ALrHvnsJQmEGJzWdDED3xdyxjkl2B6G2VXTxsaeChJDhFD7uCL2Bjqvph
   jMEOtEUMJ0MxJQZ5SKQI5t0CCLJobXObC/Vk5AxKjSC6H0JXVJ0OdGtI4
   CQcOdDCAOrem/EwPhyAMCtdB2It2JcuGfkf/QMNTFvC2IMt7JNC0U/zTy
   YMnCr0m5zTtzvwD0UDYw640zXYhIH0BQiyQLC7FF6Yr4bjcGGfiJMhhUB
   w==;
X-CSE-ConnectionGUID: m282LSnmSwSdzf83XTxBgQ==
X-CSE-MsgGUID: RIqcSSQ9TyKFcua0Bq9MbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="46105954"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="46105954"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 00:08:52 -0800
X-CSE-ConnectionGUID: CPfbyPZnRpSLRxKQwKZS6A==
X-CSE-MsgGUID: uRSpZF5WRTS+7lQi2POwIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97554323"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 00:08:51 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 20DB011F9F7;
	Mon, 16 Dec 2024 10:08:48 +0200 (EET)
Date: Mon, 16 Dec 2024 08:08:48 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v7 3/5] media: Documentation: Update link frequency
 driver documentation
Message-ID: <Z1_gEFn84e1qanp1@kekkonen.localdomain>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-4-sakari.ailus@linux.intel.com>
 <uk6uc7i3v6bpuphqvrhbkqisammkimgbgoas5g4tsakkcbj2jh@d4rss77am2c2>
 <Z1vfK0cUW9sgBPLt@kekkonen.localdomain>
 <20241215170240.GH9975@pendragon.ideasonboard.com>
 <Z1_fvqg5uuRLDt_A@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1_fvqg5uuRLDt_A@kekkonen.localdomain>

On Mon, Dec 16, 2024 at 08:07:26AM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Sun, Dec 15, 2024 at 07:02:40PM +0200, Laurent Pinchart wrote:
> > On Fri, Dec 13, 2024 at 07:15:55AM +0000, Sakari Ailus wrote:
> > > On Thu, Dec 12, 2024 at 05:53:53PM +0100, Jacopo Mondi wrote:
> > > > On Tue, Dec 10, 2024 at 09:59:04AM +0200, Sakari Ailus wrote:
> > > > > Add the get_mbus_config() as the means for conveying the link frequency
> > > > > towards the receiver drivers.
> > > > >
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > ---
> > > > >  Documentation/driver-api/media/tx-rx.rst | 4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> > > > > index dd09484df1d3..1430c330fd52 100644
> > > > > --- a/Documentation/driver-api/media/tx-rx.rst
> > > > > +++ b/Documentation/driver-api/media/tx-rx.rst
> > > > > @@ -49,6 +49,10 @@ Link frequency
> > > > >  The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
> > > > >  receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
> > > > >
> > > > > +On devices where the link frequency isn't configurable, the link_freq field of
> > > > > +struct v4l2_mbus_config is recommended over controls for conveying the link
> > > > > +frequency to the downstream driver in the pipeline.
> > > > 
> > > > When read in its entirety, the paragraphs
> > > > 
> > > >  Link frequency
> > > >  ^^^^^^^^^^^^^^
> > > > 
> > > >  The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
> > > >  receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
> > > > 
> > > >  On devices where the link frequency isn't configurable, the link_freq field of
> > > >  struct v4l2_mbus_config is recommended over controls for conveying the link
> > > >  frequency.
> > > > 
> > > > Sounds simpler without the last 7 words.
> > > > 
> > > > A nit and just tastes maybe
> > > 
> > > I used:
> > > 
> > > On devices where the link frequency isn't configurable, using the ``link_freq``
> > > field of struct v4l2_mbus_config is recommended over controls.
> > 
> > Is it a recommendation for the transmitter driver or the receiver driver
> > ? If it's a recommendation for the transmitter driver, does that mean it
> > should not implement V4L2_CID_LINK_FREQ in that case ? How about the
> > need to expose the link frequency to userspace when it's fixed ?
> 
> For the transmitter. Receivers do not implement get_mbus_config op. I can
> add a note on this.

This text is already under "Transmitter drivers".

-- 
Sakari Ailus

