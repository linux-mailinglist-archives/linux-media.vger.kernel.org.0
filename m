Return-Path: <linux-media+bounces-41675-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45431B41F40
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 14:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01F1C165844
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 12:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17DA2FF177;
	Wed,  3 Sep 2025 12:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjRKWe6C"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4302C11EC
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 12:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756903108; cv=none; b=TJ6vWaddDLUZ/R7cTCHNEOoyNrcEiUOikZF4g66ogNy4R6RcvB+jviALAubIBxAypfjp0MWGySBaoxMkYhz6iVgWKlG0kzLNSFJ+QLRW5kUiHgpIoemjJDqMGW9JeH7urmaT/1PSxs2LESWJEQDIZFyB602iR27oc5DhwPPxUE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756903108; c=relaxed/simple;
	bh=HeNT+fw4DpwJvzbwBS4ipjjwzv3m+kSmKpd9W5s8XHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kv42Zf2oIEndbS7ecc1EQZxD/PZdyGTF5zw/WrbtqAekkcLUzkvag4956rtlFqRI3nErQ50O/AsUihf1LT4GiM7Ww5moBfxT3VdSvgRF99FTxL94kXj3Y6I9ztPCjrIhlYuk6uiNZjcjYup1xx43QN3z78rx+dUvNykka0veJYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VjRKWe6C; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756903107; x=1788439107;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HeNT+fw4DpwJvzbwBS4ipjjwzv3m+kSmKpd9W5s8XHI=;
  b=VjRKWe6Co3ZfkwyXQF2gTqz1NN8loCYWfLbsYQT5I5o+KGv1uci1+VU2
   AGavAQaGMyZVIrL6voaPEYefqb9JEFdOC682EkXSRZC8KePfCSrWZydpv
   x9Hnl+KgJHdTSIeOBOpF/L4tNWo+2NSlxTvZUqRKTqTOS39hYWSL2Kg7T
   wsvszSu4KezxjNObswDKvPQRl6sqJy1wFhGb5uiAnp2QxirjBJZYnmyRU
   LCj8GkXew9p3AAmwIJnXMdqplwxDifjIPi8Q1MhLip6QLLjuB0JUgRtg4
   lQ+2vfdhZdk7wBOw2oidu9Npe4CglnTPFlKa2hCqubcy8sr7UFDktUPDu
   g==;
X-CSE-ConnectionGUID: sxeDgS7FRl6wFhtPh3WhHA==
X-CSE-MsgGUID: +c03QOJ/Sf6HhNbOtIu4OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="69474841"
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="69474841"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 05:38:26 -0700
X-CSE-ConnectionGUID: 6iSUrKrdTD2hTzts2UFYsA==
X-CSE-MsgGUID: 4daTstK3SzyliDEMIjgEiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="171951746"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.204])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 05:38:19 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 692F011F99F;
	Wed, 03 Sep 2025 15:38:17 +0300 (EEST)
Date: Wed, 3 Sep 2025 15:38:17 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 21/66] media: v4l: uapi: Add a control for color
 pattern flipping effect
Message-ID: <aLg2ue1ZRRgDq6DS@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-22-sakari.ailus@linux.intel.com>
 <b2yrfklofl6qpoekmy3r745gk4fvgdlpcdppatwwr3y34kn5zv@xusoi3rasdrc>
 <aLgXmb-ANkC5JNYD@kekkonen.localdomain>
 <aLgbM8Vg7oPar5Y2@kekkonen.localdomain>
 <4sfyzce5u5akvsvrvkwclcchhhdvusv6erorc4xsrelf7o63zd@ef4ca7f6vycg>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4sfyzce5u5akvsvrvkwclcchhhdvusv6erorc4xsrelf7o63zd@ef4ca7f6vycg>

Hi Jacopo,

On Wed, Sep 03, 2025 at 02:18:35PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Wed, Sep 03, 2025 at 01:40:51PM +0300, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Wed, Sep 03, 2025 at 01:25:30PM +0300, Sakari Ailus wrote:
> > > Hi Jacopo,
> > >
> > > On Mon, Sep 01, 2025 at 04:34:56PM +0200, Jacopo Mondi wrote:
> > > > Hi Sakari
> > > >
> > > > On Mon, Aug 25, 2025 at 12:50:22PM +0300, Sakari Ailus wrote:
> > > > > Add a bitmask control (V4L2_CID_COLOR_PATTERN_FLIP) to tell whether
> > > > > flipping results in a change in the sensor's color pattern, separately
> > > > > horizontally and vertically. The information is essential for raw formats
> > > > > when using generic raw mbus codes.
> > > > >
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > ---
> > > > >  .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
> > > > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  2 ++
> > > > >  include/uapi/linux/v4l2-controls.h                     |  6 ++++++
> > > > >  3 files changed, 18 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > > index 0fcd60d8c621..ef3784d1119a 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > > @@ -133,3 +133,13 @@ Image Source Control IDs
> > > > >        - Raw Bayer, with alternating lines beginning with green, blue pixels and
> > > > >          red, green pixels.
> > > > >        - 3
> > > > > +
> > > > > +``V4L2_CID_COLOR_PATTERN_FLIP (bitmask)``
> > > >
> > > > I still believe that having this and V4L2_CTRL_FLAG_MODIFY_LAYOUT
> > > > might be confusing. Should sensor driver that registers H/VFLIP still
> > > > mark those controls as V4L2_CTRL_FLAG_MODIFY_LAYOUT or should they
> > > > implement V4L2_CID_COLOR_PATTERN_FLIP, or do both ?
> > > >
> > > > Should we deprectate V4L2_CTRL_FLAG_MODIFY_LAYOUT for flip controls ?
> > > > In this case I think the documentation of the flag should be updated.
> > >
> > > Good question. I don't think the flag provides any useful information to
> > > the userspace in this case, it's just a matter of UAPI consistency.
> 
> "in this case" you mean if the sub-dev registers
> V4L2_CID_COLOR_PATTERN_FLIP ?

When used with generic raw formats.

> 
> > >
> > > How about setting set the flag to these controls in the control framework?
> > > I can add a patch for that.
> >
> > Of course this is not workable as-is as the flag would be present on the
> > *FLIP controls.
> >
> > This would be still worked around in the control framework, based on the
> > value of the flip control, but I think it'd be more practical to document
> > the flag does not apply to generic raw mbus codes or as you suggested, to
> > media bus codes at all. The patch that added it is
> > bf587efff165e0563cc9d2227e49eeba7eb50434 .
> 
> I think documenting it as deprecated for sub-devs that use generic raw
> mbus codes and register V4L2_CID_COLOR_PATTERN_FLIP it's possibily the
> best we can do ?

It is used currently to tell that the pattern (and so the mbus code)
changes with flipping controls.

-- 
Regards,

Sakari Ailus

