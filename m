Return-Path: <linux-media+bounces-41662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C631B41C0A
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 12:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC025682BAA
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 10:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5CF32F0C73;
	Wed,  3 Sep 2025 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D5wYktHf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48459258CDF
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 10:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756896064; cv=none; b=aYbDCPkf+o3mlRXYOaSyR0nOVQOS4RdP4nTPt8btY62APNzfSyMhQmLMzt6Z4Kj29Dvz+ajGK3enzHkWt4H/AwFtVjX86f2VU1JX2A1oCUPDjRRzAEMQdB3y8hGH5eZIYkfJ/F08r5pYcQ8rqhsw2I21XEzQPTS/Zhuy9KctREg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756896064; c=relaxed/simple;
	bh=dYyv7DDP442jWFVTBD5t8XDpuYoTeiTFXmvNyT+Ysao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HblwKgkSdSyYNiPX+CZ4uttbabP6r4rdWCqAFEsOCpUy3tcEeHWu0Lb5hs1SPyvIJOw3XdxXydc79Gsw9k8c29fPZ0rneY+ROGgW7G2UlX39hzUSFnXn9KBBebkRKzSODQnZY7NXMoYJROCYE0LOR7feQI6RWu2JbUdbcYuJG1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D5wYktHf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756896062; x=1788432062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dYyv7DDP442jWFVTBD5t8XDpuYoTeiTFXmvNyT+Ysao=;
  b=D5wYktHf5R7cEPKqmip5JomEfydGvmktd1Bvj3auGs/qUk4UbWtS/Js8
   PUmiFF6FXJXkjIRisvDr+SiOfMI+2cfOXWhf7DLXK8R0VAnIk41KEwENK
   rZg+5n/PhE2XTBL8XguP8Q3cJtl0fwQ2guIMziKiNv5B+BJNr6tVeHgOU
   igY3VWYty2c3mf5RYNcPoTEBLddKZ6QDQFhly2sskECI67PcPRoywT4+d
   gKr4FymyhFKpM0qddbwoqezZR7NDs9UaYN4IZrWcIwZfFmj1/Qf5n53Wj
   06WEGktGus+fBYHTtmmopI7LbvKQ0PJYszQhKlw8BQwdUQOK4zxhRuvA8
   g==;
X-CSE-ConnectionGUID: f8oKWR+3RDKsn0MyDUNauw==
X-CSE-MsgGUID: gZ59f/9ERxyGQPd0NtqhnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="69465848"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="69465848"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 03:41:02 -0700
X-CSE-ConnectionGUID: ro2/xt3OSGS4NIvNObTjDQ==
X-CSE-MsgGUID: hZrcqdlzSHGAQS1SyNqWsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="175911922"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.204])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 03:40:55 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8B9C011F99F;
	Wed, 03 Sep 2025 13:40:51 +0300 (EEST)
Date: Wed, 3 Sep 2025 13:40:51 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 21/66] media: v4l: uapi: Add a control for color
 pattern flipping effect
Message-ID: <aLgbM8Vg7oPar5Y2@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-22-sakari.ailus@linux.intel.com>
 <b2yrfklofl6qpoekmy3r745gk4fvgdlpcdppatwwr3y34kn5zv@xusoi3rasdrc>
 <aLgXmb-ANkC5JNYD@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLgXmb-ANkC5JNYD@kekkonen.localdomain>

Hi Jacopo,

On Wed, Sep 03, 2025 at 01:25:30PM +0300, Sakari Ailus wrote:
> Hi Jacopo,
> 
> On Mon, Sep 01, 2025 at 04:34:56PM +0200, Jacopo Mondi wrote:
> > Hi Sakari
> > 
> > On Mon, Aug 25, 2025 at 12:50:22PM +0300, Sakari Ailus wrote:
> > > Add a bitmask control (V4L2_CID_COLOR_PATTERN_FLIP) to tell whether
> > > flipping results in a change in the sensor's color pattern, separately
> > > horizontally and vertically. The information is essential for raw formats
> > > when using generic raw mbus codes.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
> > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  2 ++
> > >  include/uapi/linux/v4l2-controls.h                     |  6 ++++++
> > >  3 files changed, 18 insertions(+)
> > >
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > index 0fcd60d8c621..ef3784d1119a 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > @@ -133,3 +133,13 @@ Image Source Control IDs
> > >        - Raw Bayer, with alternating lines beginning with green, blue pixels and
> > >          red, green pixels.
> > >        - 3
> > > +
> > > +``V4L2_CID_COLOR_PATTERN_FLIP (bitmask)``
> > 
> > I still believe that having this and V4L2_CTRL_FLAG_MODIFY_LAYOUT
> > might be confusing. Should sensor driver that registers H/VFLIP still
> > mark those controls as V4L2_CTRL_FLAG_MODIFY_LAYOUT or should they
> > implement V4L2_CID_COLOR_PATTERN_FLIP, or do both ?
> > 
> > Should we deprectate V4L2_CTRL_FLAG_MODIFY_LAYOUT for flip controls ?
> > In this case I think the documentation of the flag should be updated.
> 
> Good question. I don't think the flag provides any useful information to
> the userspace in this case, it's just a matter of UAPI consistency.
> 
> How about setting set the flag to these controls in the control framework?
> I can add a patch for that.

Of course this is not workable as-is as the flag would be present on the
*FLIP controls.

This would be still worked around in the control framework, based on the
value of the flip control, but I think it'd be more practical to document
the flag does not apply to generic raw mbus codes or as you suggested, to
media bus codes at all. The patch that added it is
bf587efff165e0563cc9d2227e49eeba7eb50434 .

-- 
Regards,

Sakari Ailus

