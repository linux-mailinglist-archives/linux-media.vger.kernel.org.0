Return-Path: <linux-media+bounces-50618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC14BD1B6D4
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 22:36:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1EE3B304B4DD
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 21:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B76329361;
	Tue, 13 Jan 2026 21:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkrBNZaN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6CC22D7B1
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 21:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768340162; cv=none; b=cWxHz+AhiKZqZ7nE/ioZh1b0MsYF0vBm7jKNgP4WL/5O9+G/ReSLxkzv7zBJth2jav0nBpyDgLMN0XRHg1pKsC5VQHW7tP6XfqBdvqqNlL42exPkZHwBsuQh91gCfMCSpKThviRVi+Zcs42wvA3Wzx6LF4JgxpuEAOsoLHii4sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768340162; c=relaxed/simple;
	bh=aHO1/HMgLn3fVHLwCJ4wD9ZTmmKHYYgfiP0nh7mwCJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JupvFSd5b4+3KBIyjrrznfaKHB/lw0IX5MbDlk0/hbYV7WlW4eCFtnS10D+rgVt7ObiBqoapx9A59IV/99hfxxzelpfyzco/Qa77bix1Il881la8a52kk5jMonEiVla8AHDjK/U/OfxyiEaxb4nAmEo6uBp52GouA1T2gLtq39E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkrBNZaN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768340161; x=1799876161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aHO1/HMgLn3fVHLwCJ4wD9ZTmmKHYYgfiP0nh7mwCJI=;
  b=OkrBNZaNM7UEgc/H570QrBek24SxHq33/syGvhy2HH2rfgrbGeIrexXL
   F1diwAorqzYbGvzTYiz0wTEFVAbo1tF3lErgY2lo/LdrlXz/Q4wLlzwd2
   eYZ9rQpQW9J+0so6hu0eNcxvw8WWa2EOzYn7QJa1x33MyOhWAMI9wzK/p
   M8V23Luoq4YihKSH/il1NjcicW7d2CfJUyyGTamWreJDSwc5Eg7wEr2GV
   LZVwJwgrRB/X/lkK5h/4Jnm21qavECo2R+CANmcjlUah5j4l9acZcwUEA
   Gi8UKWH2yND2fpGdD6HUgdPXKg04n9WTsrGnPOtPuOb+ucK2byNE/rFPQ
   g==;
X-CSE-ConnectionGUID: 3GkZ16OtR7m6Uok0ZkXarw==
X-CSE-MsgGUID: baKbZOH2T6uo9sP/FrgicA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92305633"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="92305633"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 13:36:01 -0800
X-CSE-ConnectionGUID: HQTzMtACT3G+UMRqIiryGw==
X-CSE-MsgGUID: /ZTAT75dQty1OcD4zcXJRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204286154"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.58])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 13:35:54 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DE33E11FBC5;
	Tue, 13 Jan 2026 23:35:51 +0200 (EET)
Date: Tue, 13 Jan 2026 23:35:51 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
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
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 13/64] media: mc: Add INTERNAL pad flag
Message-ID: <aWa6t-7akazzsrzo@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-14-sakari.ailus@linux.intel.com>
 <ba1e16e7-d61f-4d3f-9b82-b8014d0f1368@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba1e16e7-d61f-4d3f-9b82-b8014d0f1368@nxp.com>

Hi Mirela,

On Wed, Jul 23, 2025 at 01:11:10AM +0300, Mirela Rabulea wrote:
> Hi Sakari,
> 
> On 6/19/25 14:57, Sakari Ailus wrote:
> > Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
> > 
> > 
> > Internal sink pads will be used as routing endpoints in V4L2 [GS]_ROUTING
> > IOCTLs, to indicate that the stream begins in the entity. Internal sink
> > pads are pads that have both SINK and INTERNAL flags set.
> > 
> > Also prevent creating links to pads that have been flagged as internal and
> > initialising SOURCE pads with INTERNAL flag set.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >   .../userspace-api/media/mediactl/media-types.rst  |  9 +++++++++
> >   drivers/media/mc/mc-entity.c                      | 15 ++++++++++++---
> >   include/uapi/linux/media.h                        |  1 +
> >   3 files changed, 22 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> > index 6332e8395263..200c37a1da26 100644
> > --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> > +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> > @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
> >   .. _MEDIA-PAD-FL-SINK:
> >   .. _MEDIA-PAD-FL-SOURCE:
> >   .. _MEDIA-PAD-FL-MUST-CONNECT:
> > +.. _MEDIA-PAD-FL-INTERNAL:
> > 
> >   .. flat-table:: Media pad flags
> >       :header-rows:  0
> > @@ -381,6 +382,14 @@ Types and flags used to represent the media graph elements
> >            enabled links even when this flag isn't set; the absence of the flag
> >            doesn't imply there is none.
> > 
> > +    *  -  ``MEDIA_PAD_FL_INTERNAL``
> > +       -  The internal flag indicates an internal pad that has no external
> > +         connections. As they are internal to entities, internal pads shall not
> > +         be connected with links.
> > +
> > +         The internal flag may currently be present only in a sink pad where it
> > +         indicates that the :ref:``stream <media-glossary-stream>`` originates
> 
> The link to stream does not work in the generated documentation.
> 
> Other than that, hope to see this one merged soon :)
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>

Thank you. I'll fix this for v12.

-- 
Kind regards,

Sakari Ailus

