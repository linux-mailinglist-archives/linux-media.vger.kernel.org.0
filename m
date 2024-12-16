Return-Path: <linux-media+bounces-23455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1C09F2B7D
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 09:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCE0A7A1731
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 08:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5605A1FF7B4;
	Mon, 16 Dec 2024 08:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fzDZ+d/U"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241FC1FF61B
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 08:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734336452; cv=none; b=Zq3rbm7GHKE+p8LffBy9+5wLQIScrjzTLLB1JXBJW3qzeBYuPI7Pp1oamw8rMRfGbYTbW2Z9HvSPcbRtTbnPJgpjnQzH5AHcRszIlUdW1faH700cHCNm+3IzNL1R5rKPTtWIRWkOHxl9gltSw+eHvPMBLYYvMO2DXCI/IWOaEcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734336452; c=relaxed/simple;
	bh=QFoYG7zBMz8cW4jrxPFTKjd9uAXn7eGRLfIgSAh3PKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndQQkGkojZ9nag5BLONvtxJBQY2SpznXQthlaa0xsUBCS63IsmKi8ExqyMjfMg8ZvthEhpWr6InBTJ+DCOg7b2mdmVgxNLXUxIbQoACKHn7dKAPiiT/EXh6Zdb/hgQnNYb9NOoSZhZF1o9YnMBq8CbxYgoAZzKWgWvwcLiwixi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fzDZ+d/U; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734336451; x=1765872451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QFoYG7zBMz8cW4jrxPFTKjd9uAXn7eGRLfIgSAh3PKY=;
  b=fzDZ+d/UV/GqrZ//6U7xPJ8nYCnGRUTC8WATvyPejkOeNoQzZ6PzGxyN
   dR0p+bt5SrRUOnNJKkbZgTR6iWMupA31POhMomkqnzYFP1mYjMe0Zcaus
   M75pI92G47xgH8lLbUyHYqsyUaN9jiHPM9RxUP6/kz240h8DCGiDw+8ni
   YZwNf8M4Rj2VZtlq+e5AVN4QKRUThnDDXAw+jRaDRVh8DlUvJON0WHeEB
   IaEJyGu1bUoez66I7iIy9lcGANI3+Mns3NtFFKiV8dqEpo/ULF0InSMxL
   eHqG1LCU6VTOQSxGsbG6WscSqkpbZTdrB0oWNQ3p7IpyAt4Rs55Nao/jI
   Q==;
X-CSE-ConnectionGUID: ox7a688fT46uDfrzH0LaYg==
X-CSE-MsgGUID: aysYl5vPTjeWf7lvVJab4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="57194562"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="57194562"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 00:07:31 -0800
X-CSE-ConnectionGUID: K/60UvT0RviI6hfvdz1Qrg==
X-CSE-MsgGUID: Y2sSe9pKQ0CxMG03fTp4Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="97032752"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 00:07:29 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 81C3B11F9F7;
	Mon, 16 Dec 2024 10:07:26 +0200 (EET)
Date: Mon, 16 Dec 2024 08:07:26 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v7 3/5] media: Documentation: Update link frequency
 driver documentation
Message-ID: <Z1_fvqg5uuRLDt_A@kekkonen.localdomain>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-4-sakari.ailus@linux.intel.com>
 <uk6uc7i3v6bpuphqvrhbkqisammkimgbgoas5g4tsakkcbj2jh@d4rss77am2c2>
 <Z1vfK0cUW9sgBPLt@kekkonen.localdomain>
 <20241215170240.GH9975@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241215170240.GH9975@pendragon.ideasonboard.com>

Hi Laurent,

On Sun, Dec 15, 2024 at 07:02:40PM +0200, Laurent Pinchart wrote:
> On Fri, Dec 13, 2024 at 07:15:55AM +0000, Sakari Ailus wrote:
> > On Thu, Dec 12, 2024 at 05:53:53PM +0100, Jacopo Mondi wrote:
> > > On Tue, Dec 10, 2024 at 09:59:04AM +0200, Sakari Ailus wrote:
> > > > Add the get_mbus_config() as the means for conveying the link frequency
> > > > towards the receiver drivers.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  Documentation/driver-api/media/tx-rx.rst | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> > > > index dd09484df1d3..1430c330fd52 100644
> > > > --- a/Documentation/driver-api/media/tx-rx.rst
> > > > +++ b/Documentation/driver-api/media/tx-rx.rst
> > > > @@ -49,6 +49,10 @@ Link frequency
> > > >  The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
> > > >  receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
> > > >
> > > > +On devices where the link frequency isn't configurable, the link_freq field of
> > > > +struct v4l2_mbus_config is recommended over controls for conveying the link
> > > > +frequency to the downstream driver in the pipeline.
> > > 
> > > When read in its entirety, the paragraphs
> > > 
> > >  Link frequency
> > >  ^^^^^^^^^^^^^^
> > > 
> > >  The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
> > >  receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
> > > 
> > >  On devices where the link frequency isn't configurable, the link_freq field of
> > >  struct v4l2_mbus_config is recommended over controls for conveying the link
> > >  frequency.
> > > 
> > > Sounds simpler without the last 7 words.
> > > 
> > > A nit and just tastes maybe
> > 
> > I used:
> > 
> > On devices where the link frequency isn't configurable, using the ``link_freq``
> > field of struct v4l2_mbus_config is recommended over controls.
> 
> Is it a recommendation for the transmitter driver or the receiver driver
> ? If it's a recommendation for the transmitter driver, does that mean it
> should not implement V4L2_CID_LINK_FREQ in that case ? How about the
> need to expose the link frequency to userspace when it's fixed ?

For the transmitter. Receivers do not implement get_mbus_config op. I can
add a note on this.

The only reason this has been exposed to the user space is because it's
been a control that has been modifiable. Also HDMI to CSI-2 bridges work
this way.

The LINK_FREQ control is also an integer menu so the same control couldn't
be used as-is. These were the reasons why the earlier review concluded with
impelmenting this via get_mbus_config().

> 
> I think the documentation needs further clarification to clearly explain
> what transmitters should do and what receivers should do.

I can add this.

> 
> > > 
> > > I like where this is going!
> > > 
> > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 

-- 
Regards,

Sakari Ailus

