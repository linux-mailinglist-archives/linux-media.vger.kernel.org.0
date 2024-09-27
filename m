Return-Path: <linux-media+bounces-18705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAE89888A6
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 18:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 756CE1F22958
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 16:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452181C1AA4;
	Fri, 27 Sep 2024 16:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQycrSD9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCDE200A3;
	Fri, 27 Sep 2024 16:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727452883; cv=none; b=MbTITho5nn9VSpWU9U/b1nieF5M+oAiqlq8lFjKa2T1XvQolBuLXNXhTQZx8C4iz97sUjKYbmPcV3qfXACnK/ZQfbjcozOrYS2HVQpSEfz4Qhdq6dDNnnqGOgraeuQ7tBJTdLAXCj1mZVjydxsR68HPvRiTymg21PIWEiyErnTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727452883; c=relaxed/simple;
	bh=ML4bUSiL9vWSGJG2FlDF3bvvDk9dX/mDX9Fx3HwVjfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/PbICkCY4OeqRQA0kMBVfRZSTAjClu140/ZEsUPHhZYfaZEERCWmfv7llEWZPmr7JKm1N5shtuOfXgLewKUdqsTDyj8V2ksgPORVPsxbXMGxsNfjMxPJUZsF/beAQKBDYEb9zrmFk/FntLEdvfosdK0o3oxUn1zEE9AlKJMqJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CQycrSD9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727452882; x=1758988882;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ML4bUSiL9vWSGJG2FlDF3bvvDk9dX/mDX9Fx3HwVjfA=;
  b=CQycrSD960Vc2hganxkoYS2K2unKeh5qQIcrxF7WZz98WXnrZEY/5G5y
   A9Cjibateng18tKIC5Ij4QrWeSS3nk2HGlFzaihk3NzCSVLa18xCB3vWL
   0+avJ39ga/tOei7sB7WCSbvC/lUCgTdE9Ex345O1uBvYcTZBNTA9YfDTA
   JO794Slsu13ADC4vNiKIJXV8I6epi4tXmNbRS47ZHr0HgqccQuziVIyj0
   Hl/KDM9x9NRb1z4JtxIK80dbyPeijn4J2a5U9fmUF9DaU2JqfXrepu0LA
   YLnaLFS6UxrPGHLf4NsxGfE0mju51vri2QJUC/HX8NjG+djXDbiSW1OzB
   g==;
X-CSE-ConnectionGUID: /CzqOtRnR3+UyPnEwxf/Yg==
X-CSE-MsgGUID: dOlPpVFDQfCBj9Q0K4l0pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="49129534"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="49129534"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 09:01:21 -0700
X-CSE-ConnectionGUID: ERXO9FCDTvOhNgMlz6XQsQ==
X-CSE-MsgGUID: w/2fPN6HQTatXxXL7cy9Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="73002111"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 09:01:14 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 81E1511F817;
	Fri, 27 Sep 2024 19:01:10 +0300 (EEST)
Date: Fri, 27 Sep 2024 16:01:10 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 11/11] media: i2c: ov5645: Report streams using frame
 descriptors
Message-ID: <ZvbWxsOtF7PGrbsz@kekkonen.localdomain>
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910170610.226189-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ZvWBlivUaZ92KoAI@kekkonen.localdomain>
 <20240926174819.GK21788@pendragon.ideasonboard.com>
 <ZvWumaGsMPGGwPaS@kekkonen.localdomain>
 <CA+V-a8uGmyrSQQULY9sS9r-Ss_Gxw7OBtbYjFYOMpLJ_e=ZRGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8uGmyrSQQULY9sS9r-Ss_Gxw7OBtbYjFYOMpLJ_e=ZRGg@mail.gmail.com>

Hi Prabhakar,

On Fri, Sep 27, 2024 at 04:31:31PM +0100, Lad, Prabhakar wrote:
> Hi Sakari and Laurent,
> 
> On Thu, Sep 26, 2024 at 7:57 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > On Thu, Sep 26, 2024 at 08:48:19PM +0300, Laurent Pinchart wrote:
> > > On Thu, Sep 26, 2024 at 03:45:26PM +0000, Sakari Ailus wrote:
> > > > Hi Prabhakar,
> > > >
> > > > Thanks for the set. It looks largely very nice to me, after addressing
> > > > Laurent's comments. A few comments here and possibly on other patches...
> > > >
> > > > On Tue, Sep 10, 2024 at 06:06:10PM +0100, Prabhakar wrote:
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > Implement the .get_frame_desc() subdev operation to report information
> > > > > about streams to the connected CSI-2 receiver. This is required to let
> > > > > the CSI-2 receiver driver know about virtual channels and data types for
> > > > > each stream.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > ---
> > > > >  drivers/media/i2c/ov5645.c | 28 ++++++++++++++++++++++++++++
> > > > >  1 file changed, 28 insertions(+)
> > > > >
> > > > > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > > > > index 7f1133292ffc..c24eb6e7a7b5 100644
> > > > > --- a/drivers/media/i2c/ov5645.c
> > > > > +++ b/drivers/media/i2c/ov5645.c
> > > > > @@ -28,6 +28,7 @@
> > > > >  #include <linux/regulator/consumer.h>
> > > > >  #include <linux/slab.h>
> > > > >  #include <linux/types.h>
> > > > > +#include <media/mipi-csi2.h>
> > > > >  #include <media/v4l2-ctrls.h>
> > > > >  #include <media/v4l2-event.h>
> > > > >  #include <media/v4l2-fwnode.h>
> > > > > @@ -829,6 +830,32 @@ static const struct v4l2_ctrl_ops ov5645_ctrl_ops = {
> > > > >   .s_ctrl = ov5645_s_ctrl,
> > > > >  };
> > > > >
> > > > > +static int ov5645_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > > > > +                          struct v4l2_mbus_frame_desc *fd)
> > > > > +{
> > > > > + const struct v4l2_mbus_framefmt *fmt;
> > > > > + struct v4l2_subdev_state *state;
> > > > > +
> > > > > + if (pad != OV5645_PAD_SOURCE)
> > > > > +         return -EINVAL;
> > > >
> > > > As you have a single source pad, and pretty much all sensor drivers will, I
> > > > think it'd be nice to add a check for this (that it's not an internal pad)
> > > > to the caller side in v4l2-subdev.c. And of course drop this one.
> > >
> > > What check would you add, just verifying that the pad is a source pad ?
> >
> > I think you could add that, too, besides the absence of the internal flag.
> >
> Checking only for the source flag should suffice, as the
> MEDIA_PAD_FL_INTERNAL flag cannot be set for a source pad because
> media_entity_pads_init() enforces this restriction.
> 
> Do you agree?

Works for me.

-- 
Sakari Ailus

