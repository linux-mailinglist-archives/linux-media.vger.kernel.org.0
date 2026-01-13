Return-Path: <linux-media+bounces-50628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DBCD1BA0F
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 23:45:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4632B3053FBF
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 22:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F843385B1;
	Tue, 13 Jan 2026 22:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AIGX9Od+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC3E36920F
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 22:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768344314; cv=none; b=sMOMxAuhpDwpoxzxff65yv5AaKIIyCaP190IRAfbdJhgAVWzwhcgLhFI+wLTer9vIAQiFRfcOCnASk2Ewwtv59DsuhHmFuUmqcg09OuJncwzKLDm31cDWOmuhDslO3qxdmiV0JcI6Aa9WI9GFSqwbxOZCu72SXQpPZdrZEIHXIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768344314; c=relaxed/simple;
	bh=31l4ZqMrQBeGUngJhAvFeZ6DgUoCsl/VWLZM/GI5/gM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIQ1Dx2c2IxHq/R1JItLihg79gdh750BgUY8KMPgsLCNWFNTkGDqqJx+hYVmaHl84bhqQAJyIdfu5IfEW4VDO9PWO1a1YIv9K8Yylg8iyKEADLM4eKyQRzpsRkMS+euffqzwHhF5UTZvMvQsVXgHINSY4cYCgJSG043+4Xpf/4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AIGX9Od+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768344313; x=1799880313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=31l4ZqMrQBeGUngJhAvFeZ6DgUoCsl/VWLZM/GI5/gM=;
  b=AIGX9Od+GlwygsNzUsOy79gLzmOnogZliVRNZ/fBjLRfsdAfC51T9l7w
   PFNgYzcVI1wNtbUsqANkyQkM+UWKUHaLuPoBF25T+icgumHXsvrm4mIgM
   741ISTvEzcO9qDGTdCpev3O1rH1goHhUfMaD/fpZpAApqq56ALTZcaiwY
   q7mmw1l21NT3crvtI5JSMyjCLGsZSgI2V9AsaLnCMPzmNpLEBKFHa0S7S
   Tgg82y9zNSJbqIXSQsyhqxY83Isrt9CN4CVfh/O8eFZ6sD961Wd3Cf9oz
   gBWZ83VjaDyHDaZPM3Q0YadLFZHpU5AeF8nPYPcA/6/dfzYrABaJfQY5V
   w==;
X-CSE-ConnectionGUID: ypz+k18cQAGTWdpQ2Uh7lA==
X-CSE-MsgGUID: +GvINTrjQT6U8HLO8raccA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="57195094"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="57195094"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 14:45:11 -0800
X-CSE-ConnectionGUID: 15GXUS7/QQ2+avslDeig0Q==
X-CSE-MsgGUID: E5yNpfUQSQOhfPtHTt6sxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="204581387"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.58])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 14:45:05 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D3293120831;
	Wed, 14 Jan 2026 00:45:02 +0200 (EET)
Date: Wed, 14 Jan 2026 00:45:02 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>, linux-media@vger.kernel.org,
	hans@jjverkuil.nl, Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
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
Subject: Re: [PATCH v10 19/64] media: v4l: uapi: Add a control for color
 pattern flipping effect
Message-ID: <aWbK7r29E0BHE1L7@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-20-sakari.ailus@linux.intel.com>
 <ce6153ae-10fe-4160-b1d7-4b431f4d45f3@nxp.com>
 <aWY-ldR_PMFcI1LR@kekkonen.localdomain>
 <20260113223940.GF30544@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113223940.GF30544@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Jan 14, 2026 at 12:39:40AM +0200, Laurent Pinchart wrote:
> On Tue, Jan 13, 2026 at 02:46:13PM +0200, Sakari Ailus wrote:
> > Hi Mirela,
> > 
> > On Wed, Jul 23, 2025 at 01:14:44AM +0300, Mirela Rabulea wrote:
> > > Hi Sakari,
> > > 
> > > On 6/19/25 14:57, Sakari Ailus wrote:
> > > > 
> > > > 
> > > > Add a bitmask control (V4L2_CID_COLOR_PATTERN_FLIP) to tell whether
> > > > flipping results in a change in the sensor's color pattern, separately
> > > > horizontally and vertically. The information is essential for raw formats
> > > > when using generic raw mbus codes.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >   .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
> > > >   drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  2 ++
> > > >   include/uapi/linux/v4l2-controls.h                     |  5 +++++
> > > >   3 files changed, 17 insertions(+)
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > index b19aaaffbce0..43a62a85afb8 100644
> > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > @@ -131,3 +131,13 @@ Image Source Control IDs
> > > >         - Raw Bayer, with alternating lines beginning with green, blue pixels and
> > > >           red, green pixels.
> > > >         - 3
> > > > +
> > > > +``V4L2_CID_COLOR_PATTERN_FLIP (bitmask)``
> > > > +    Whether the horizontal or vertical flipping controls (V4L2_CID_HFLIP and
> > > 
> > > Maybe "Report whether the horizontal or vertical flipping controls..."
> > > sounds more like a sentence?
> > 
> > How about "This control determines whether..."?
> 
> "whether" normally requires a correlative "or". You could write "This

It could, but it doesn't have to.

> control determines if the horizontal or vertical flipping controls ...".

Both would be correct AFAICT.

-- 
Regards,

Sakari Ailus

