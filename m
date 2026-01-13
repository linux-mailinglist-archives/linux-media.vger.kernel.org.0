Return-Path: <linux-media+bounces-50619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CC3D1B7B5
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 22:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD5E43033F99
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 21:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B339634FF46;
	Tue, 13 Jan 2026 21:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4ctMJ7q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186E134E777
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 21:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768341232; cv=none; b=Gul6hpsamsBfE09ZKs9nPhX2z1jx3x25e3p7eJhOMpzk+w04rmmsf7exrl2mum4Ad2h4IsMNwBUsdXPn91Vzyh2okvAxj7V5hB569nkfYK6lnuN8kkYZrAH2YX0dnBsm3uiQJSF3GuqN6ykCEJX7qMetXwYjL0MgZxSa2K86KTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768341232; c=relaxed/simple;
	bh=hnuBox38Y+VtYISdg/ZDoUfeDSzZ6++3HDy8T0H91e8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sPYVLA4lyIY2uofWatqhcj6oOR9qEfJxOKPnZl1o06a20imF9CPn6y3ZezUeLsdpjBCdeDneFVZF7ips1AAxcAfsl7faLS5FmVZq0Wy8d+jn2nb6FhXWkQnX1cBiqYyHqGu8RiFsM2Wd4csMMyj06OOahispGsVy56VazMPayl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4ctMJ7q; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768341230; x=1799877230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hnuBox38Y+VtYISdg/ZDoUfeDSzZ6++3HDy8T0H91e8=;
  b=C4ctMJ7qGQILkNCSBoqm99eEidbZpvkIToc8MP9pJFvTrTfsuzND7qcf
   n1TtCX6EkQ7RoqAHddlv3GQzS64o9x2JpUjMbJXXToseieE707cw65fve
   BblVa7fE4CRC9DTdIifIs2znHFS+Z//Xu7ym7xO9KLukZjUZCLoS1cR0S
   +uTjar4pq3g1oEOfYYHE+go0051Y5mkWHfWLNeDds3Qz3BqFApK5anO2Z
   fpR85HZprhdKYbVOpGasvmfj05VhOl8LGw0/6V9wl0OACX2HIxhE/zH7B
   Mx+GCIAVqaSiBa0tZEw/yU8TdZCeKZj9k5YkBe5T7gqvhoWLj2z1X/1FT
   Q==;
X-CSE-ConnectionGUID: UAYmUStPTbyuZ78Brm5hfw==
X-CSE-MsgGUID: +LDmWBMPRuaPNvV7DFrf0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80358130"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="80358130"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 13:53:49 -0800
X-CSE-ConnectionGUID: 9fQZVIQ3TNSjenr0Uhhzmg==
X-CSE-MsgGUID: 1bwrjO+pSXaC0L6LF4bBBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="208960606"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.58])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 13:53:43 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6B60611FBC5;
	Tue, 13 Jan 2026 23:53:41 +0200 (EET)
Date: Tue, 13 Jan 2026 23:53:41 +0200
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
Subject: Re: [PATCH v10 20/64] media: Documentation: Document raw mbus codes
 and CFA for cameras
Message-ID: <aWa-5ehr5pCGl4yb@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-21-sakari.ailus@linux.intel.com>
 <0b89e587-20c8-4aee-b07b-3d796df4bcf6@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b89e587-20c8-4aee-b07b-3d796df4bcf6@nxp.com>

Hi Mirela,

On Wed, Jul 23, 2025 at 01:15:25AM +0300, Mirela Rabulea wrote:
> Hi Sakari,
> 
> On 6/19/25 14:57, Sakari Ailus wrote:
> > 
> > 
> > Document the use of raw mbus codes for camera sensors and how the
> > V4L2_CID_COLOR_PATTERN and V4L2_CID_COLOR_PATTERN_FLIP controls are used
> > to convey the color filter array pattern on UAPI.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   .../userspace-api/media/drivers/camera-sensor.rst   | 13 +++++++++++++
> >   .../media/v4l/ext-ctrls-image-source.rst            |  4 ++++
> >   2 files changed, 17 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > index 919a50e8b9d9..9f68d24dfe0b 100644
> > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > @@ -37,6 +37,19 @@ format set on a source pad at the end of the device's internal pipeline.
> > 
> >   Most sensor drivers are implemented this way.
> > 
> > +V4L2_CID_COLOR_PATTERN, raw mbus formats, flipping and cropping
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +For raw image data originating from camera sensors, specific :ref:`raw mbus
> > +codes MEDIA_BUS_FMT_RAW_x (where 'x' is the bit depth)
> > +<v4l2-mbus-pixelcode-generic-raw>` are used as Color Filter Array (CFA) agnostic
> > +raw formats. The ``V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>``
> > +control in the same sub-device defines the native color pattern of the
> > +device. Flipping may further affect the readout pattern as indicated by the
> > +``V4L2_CID_COLOR_PATTERN_FLIP <image-source-control-color-pattern-flip>``
> 
> The links for V4L2_CID_COLOR_PATTERN and V4L2_CID_COLOR_PATTERN_FLIP are not
> working, need a :ref?

Will be fixed for v12 (if wasn't for v11).

-- 
Regards,

Sakari Ailus

