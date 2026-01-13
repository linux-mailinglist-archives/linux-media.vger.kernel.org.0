Return-Path: <linux-media+bounces-50560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 79200D18F8C
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 13:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5BD6305FDE5
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 12:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99AB438E5F5;
	Tue, 13 Jan 2026 12:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KfNjEQ5T"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE33626CE04
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 12:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768308385; cv=none; b=LNs3Io0MGMQhXO8Odqppm32jbXRf6Q4XkXqKryMYmNNeBplUOhdjdTtekBuKjmd7iS6/UcZXVdZuyiPSI39YIhccn2ZHp3Q01sr7j2uTcw8NWfmzvzBLYLD292cxW79FfxItPXKjrbRwzB3BcuOXUDuRFf/5mNyNYJaH208GPhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768308385; c=relaxed/simple;
	bh=DKQXxhkCvubWY0GFs/v50+eHRFKYyjjzxEncbnTnbjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KtQBZqQATJD8BCilqCWOmkx22A0IuBfDe6720+UIrKkaTSmR0dZRTjU7X1quDyCbzjtJohYnvsuiZpZ5veslj/852Hqz6KqUKmkEbvgYAKDlA5YiSeKxsF89LzclIgVGy+hK9HpKQfX1vJfjfA5C/XrhlDqTh1gJDQuBZGjNe80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KfNjEQ5T; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768308384; x=1799844384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DKQXxhkCvubWY0GFs/v50+eHRFKYyjjzxEncbnTnbjA=;
  b=KfNjEQ5T+OoIlC3Q8+X6+xRFs1RNlSo1JvOy7gIwBm6N01ApmawyFmh4
   nXO9UieCcKEG4GTvH80gP6smNVUec0aGTcUBXemZ03aMgCCO8kHqe+cO5
   RHNXNAvtRmjHwtgXBbUZMj4EbmvXIFhAL9WdUGHH08jzckdUE5Ihq+Qz7
   0Bb/wvcIHdfzfmPYxlZJk+nXz2NoFwfmBdBhN0zOXprsnw/yyNC8G2zSb
   l5i65iJYoYHtTZ13oTiD9Sx5jafORyQo1+dLTPCDWGu1u+LlQKNXqookL
   mHDs/lWP+Q82K2nX3BjpxN0fpUWZfImwofPwCtWTkv5QSTaj4Ikqxn89l
   Q==;
X-CSE-ConnectionGUID: QPTuycctQXSLw1J2fZF9rw==
X-CSE-MsgGUID: CsquVucBR9OpSDf0rzjW7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69670596"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69670596"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 04:46:23 -0800
X-CSE-ConnectionGUID: VRmaIk0fSO22bEnMueu5Tg==
X-CSE-MsgGUID: fA2PQBMlSEWvmwP+ceN94Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="209430987"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.182])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 04:46:16 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DEA8611F9B2;
	Tue, 13 Jan 2026 14:46:13 +0200 (EET)
Date: Tue, 13 Jan 2026 14:46:13 +0200
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
Subject: Re: [PATCH v10 19/64] media: v4l: uapi: Add a control for color
 pattern flipping effect
Message-ID: <aWY-ldR_PMFcI1LR@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-20-sakari.ailus@linux.intel.com>
 <ce6153ae-10fe-4160-b1d7-4b431f4d45f3@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce6153ae-10fe-4160-b1d7-4b431f4d45f3@nxp.com>

Hi Mirela,

On Wed, Jul 23, 2025 at 01:14:44AM +0300, Mirela Rabulea wrote:
> Hi Sakari,
> 
> On 6/19/25 14:57, Sakari Ailus wrote:
> > 
> > 
> > Add a bitmask control (V4L2_CID_COLOR_PATTERN_FLIP) to tell whether
> > flipping results in a change in the sensor's color pattern, separately
> > horizontally and vertically. The information is essential for raw formats
> > when using generic raw mbus codes.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
> >   drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  2 ++
> >   include/uapi/linux/v4l2-controls.h                     |  5 +++++
> >   3 files changed, 17 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > index b19aaaffbce0..43a62a85afb8 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > @@ -131,3 +131,13 @@ Image Source Control IDs
> >         - Raw Bayer, with alternating lines beginning with green, blue pixels and
> >           red, green pixels.
> >         - 3
> > +
> > +``V4L2_CID_COLOR_PATTERN_FLIP (bitmask)``
> > +    Whether the horizontal or vertical flipping controls (V4L2_CID_HFLIP and
> 
> Maybe "Report whether the horizontal or vertical flipping controls..."
> sounds more like a sentence?

How about "This control determines whether..."?

> 
> Also, it looks like this is also a read-only control, so it would be nice to
> mention it also in this doc.

Agreed.

-- 
Kind regards,

Sakari Ailus

