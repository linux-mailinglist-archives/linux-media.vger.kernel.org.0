Return-Path: <linux-media+bounces-41663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 385BAB41C84
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 13:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36EA61BA4384
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 11:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC912F4A14;
	Wed,  3 Sep 2025 11:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bl58IP4S"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69E92F361B
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 11:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756897229; cv=none; b=gnsSJI3wmVq0Oj6bH2WgWJXLHOSJOYi2eb2POW9guX5oGZjTD80A7qBWnZK8uQGuHKUSw359kbTKah1ZRqbF+C4+xwhaB0bQ3PEEFGJRuuCm9mB9aXWe3uEKfLvnw1isy7qpNoYhr4iRbTEFmWwi1bg3vsUHp2eaTfN4HuMKiJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756897229; c=relaxed/simple;
	bh=gbJ/DhHCF40zZI4zKkxLYssbN7AiC9uMwxv3sRCWFKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gweyjtHC6Rbn9BUkBKu/ChzS4wtxJ+0qx9qMmCJtNrzzxHaEsS98xzSqC6h6BiWFVny+ZdaA2XU8NW+0tty+us4l9HXIASwmI6AFeReuH0+FSVuuxYrVk4oeUHsxKtXy8gG13jsbvYtRFZ9JV3HxqRgubCyuRmw2a3Zq6vjHHYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bl58IP4S; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756897228; x=1788433228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gbJ/DhHCF40zZI4zKkxLYssbN7AiC9uMwxv3sRCWFKY=;
  b=bl58IP4SYBE9u7HPRHcfCOwDqQPQb1BYVRXj0lBMc3H8XiZfKGXx/ZXY
   rrAXzdVBoh3zDkpvWCjTxJAmQhbySvHSROEzL/K+rkl2e3NWO5BI97JLf
   zk8zmnqvxias0m5pogugGVsTjU3AShtJsOcaex5jt6w+nNuJIYW8Fuv8J
   sO9JuVlyAcfjrC6OcMpvx4bs41FMG2cLfd0OYLJ/fWmOP4TC9JORaEP37
   2dkEONZ23vXa9F6hLysLKbGP3jEE8G1tt3TgwOeqIV/p3lRYodjiUxpfL
   Ogb/eDaZJ0JkO8PknWjf294bCy6PRa6Yw8uaLo28qMF6E6VOaAzS22iuG
   g==;
X-CSE-ConnectionGUID: nnzj4FkHQG+KfhvAAapI3w==
X-CSE-MsgGUID: E0b53iNuRa+9+xxON/CMnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="69467481"
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="69467481"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 04:00:27 -0700
X-CSE-ConnectionGUID: Nh4hhp1yQc6Dz0M8RRd4Qg==
X-CSE-MsgGUID: om9OkghFQvqdhaM9suoSmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="175914368"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.204])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 04:00:20 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6117B11F99F;
	Wed, 03 Sep 2025 14:00:17 +0300 (EEST)
Date: Wed, 3 Sep 2025 14:00:17 +0300
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
Subject: Re: [PATCH v11 23/66] media: Documentation: Document raw mbus codes
 and CFA for cameras
Message-ID: <aLgfwejfIRC6qDoB@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-24-sakari.ailus@linux.intel.com>
 <5ajf3ywfraxumrcm6a6mrwgcl6koutghyivftuhbcxs3tcwi7f@6toxy2ikdkwv>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ajf3ywfraxumrcm6a6mrwgcl6koutghyivftuhbcxs3tcwi7f@6toxy2ikdkwv>

Hi Jacopo,

On Mon, Sep 01, 2025 at 04:59:42PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Aug 25, 2025 at 12:50:24PM +0300, Sakari Ailus wrote:
> > Document the use of raw mbus codes for camera sensors and how the
> > V4L2_CID_COLOR_PATTERN and V4L2_CID_COLOR_PATTERN_FLIP controls are used
> > to convey the color filter array pattern on UAPI.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/drivers/camera-sensor.rst   | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > index 75fd9166383f..a8e0e4accbc9 100644
> > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > @@ -39,6 +39,19 @@ format set on a source pad at the end of the device's internal pipeline.
> >
> >  Most sensor drivers are implemented this way.
> >
> > +V4L2_CID_COLOR_PATTERN, raw mbus formats, flipping and cropping
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> This will appear as a subsection of
> 
> "2.1. Sensor internal pipeline configuration"
> 
> With
> 
> 2.1.1. Freely configurable camera sensor drivers
> 2.1.2. Register list-based drivers
> 2.1.3. V4L2_CID_COLOR_PATTERN, raw mbus formats, flipping and cropping
> 
> I don't know if it's intentional or not, but I would rather make out
> of this a paragraph of its own, as it will be done for
> 
> 2.3. Rotation, orientation and flipping
> 2.4. Binning and sub-sampling

It's all related to sensor internal pipeline configuration. It's not wrong
to put them after it instead of under though. I don't have a strong opinion
either way.

> 
> etc
> 
> > +
> > +For raw image data originating from camera sensors, specific :ref:`raw mbus
> > +codes MEDIA_BUS_FMT_RAW_x (where 'x' is the bit depth)
> > +<v4l2-mbus-pixelcode-generic-raw>` are used as Color Filter Array (CFA) agnostic
> > +raw formats. The ``V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>``
> 
> This and the below ``V4L2_CID_COLOR_PATTERN_FLIP ...`` links are
> broken.
> 
> Shuould this be
> 
> :ref:`V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>`
> 
> > +control in the same sub-device defines the native color pattern of the
> > +device. Flipping may further affect the readout pattern as indicated by the
> > +``V4L2_CID_COLOR_PATTERN_FLIP <image-source-control-color-pattern-flip>``
> 
> and this
> 
> :ref:`V4L2_CID_COLOR_PATTERN_FLIP <image-source-control-color-pattern-flip>`
> 
> instead ?

Yes.

> 
> > +control. Further on, cropping also has an effect on the pattern if cropped
> > +amount is not divisible by the size of the pattern, horizontally and vertically.
> > +
> >  Frame interval configuration
> >  ----------------------------
> >

-- 
Regards,

Sakari Ailus

