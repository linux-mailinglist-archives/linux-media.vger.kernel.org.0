Return-Path: <linux-media+bounces-27024-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A80DAA45BF2
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 11:37:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B1551733B4
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 10:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A8124DFF4;
	Wed, 26 Feb 2025 10:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hU/NC5SW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3362459FF
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 10:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740566200; cv=none; b=DrpRQQsHk1P2KNZG3h1UzdV0DmDPaMHb2It5ZehJSoxOr06pIwIBXQpAp+9irWKuWFkUM/lbvv9yhO2fN1K1YNwI1kS+8srQXTB35y+qkGD9WI3Oxd4Os5qY4M4YvY3um9ttf9w0V2krA2fh0hxPQm+iT+APTgkqbM0t9Tlieoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740566200; c=relaxed/simple;
	bh=e554ks+2FldgqMPGtxf68rjq+LTeYZiPJPFz7adX9H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrFxsVBpTjHFN0h/XoOjI9+YPqDYvC01k8KcFDbPLnSf34iEQWI3fflA9r5vcn3H5DsFx1ldBlp+x6u91SQ9SjKdCKA/++w5yRXAlSPQyEGKxZ29r0W4E5d6HRkO480S4SjdEYJeTs4SeNJq5ZG8LK4Jx7PrHvcK6ycSpWQ0dBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hU/NC5SW; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740566197; x=1772102197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=e554ks+2FldgqMPGtxf68rjq+LTeYZiPJPFz7adX9H8=;
  b=hU/NC5SW5QD4VEnBnQm9WGmrRIuXI04SbL0BZIs+vDo9z9KJ86/LEZYK
   tBv4vNZe1g36chvT6L4AgcA4vOTs20+1Z5NBywQTp6uIFLitPXyhzZ6sK
   jMdWYh6Gfmph4JYjbevrAlu+RUJAoZ+/QtcsD/tvn1OM+BBVLAkxuor8C
   oYziPQcl0GtRDrm0hsDibzWpm5vfCbReKZa0m0Wcy3sj1F++c7mFWnqKM
   tqf/VBvu/i47Xtb/gNsOx1Eu2A0ndnoKRoyKYWU3+zGsQNZn8SYarbvZY
   rQ3MlZ+HazbJBWtsKnUFItFtt3gC5keEBtqT/wtmZWPdipKVT6irUWYEX
   w==;
X-CSE-ConnectionGUID: xwXL+fopTCKv8KKUofzsVw==
X-CSE-MsgGUID: twEp80uPSrGxxDUJMNofVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="63869815"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="63869815"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 02:36:36 -0800
X-CSE-ConnectionGUID: 4TEITQTHSkm3Eb4Z2pJYuQ==
X-CSE-MsgGUID: 56Wc9cOXSweegVqy/4Y+5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117158511"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 02:36:31 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1BF5B11F7E2;
	Wed, 26 Feb 2025 12:36:28 +0200 (EET)
Date: Wed, 26 Feb 2025 10:36:28 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: linux-media@vger.kernel.org,
	Julien Vuillaumier <julien.vuillaumier@nxp.com>, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
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
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC v5 04/15] media: Documentation: Add subdev configuration
 models, raw sensor model
Message-ID: <Z77urMm_7CDT_Cgz@kekkonen.localdomain>
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
 <20250203085853.1361401-5-sakari.ailus@linux.intel.com>
 <89f75abe-6db9-4cb7-ae51-7eeb6fc0600b@nxp.com>
 <dfa7f382-e537-4d91-870d-fed5d6d13060@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dfa7f382-e537-4d91-870d-fed5d6d13060@nxp.com>

Hi Mirela,

On Wed, Feb 26, 2025 at 11:17:43AM +0200, Mirela Rabulea wrote:
> Hi Sakari,
> 
> On 09.02.2025 17:42, Mirela Rabulea wrote:
> > Hi Sakari,
> > 
> > Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> > 
> > Regards,
> > 
> > Mirela
> > 
> > On 03.02.2025 10:58, Sakari Ailus wrote:
> > > Sub-device configuration models define what V4L2 API elements are
> > > available on a compliant sub-device and how do they behave.
> > > 
> > > The patch also adds a model for common raw sensors.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > ---
> > >   .../media/drivers/camera-sensor.rst           |   4 +
> > >   .../media/v4l/common-raw-sensor.dia           | 441 ++++++++++++++++++
> > >   .../media/v4l/common-raw-sensor.svg           | 134 ++++++
> > >   .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
> > >   .../media/v4l/subdev-config-model.rst         | 209 +++++++++
> > >   5 files changed, 790 insertions(+)
> > >   create mode 100644
> > > Documentation/userspace-api/media/v4l/common-raw-sensor.dia
> > >   create mode 100644
> > > Documentation/userspace-api/media/v4l/common-raw-sensor.svg
> > >   create mode 100644
> > > Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > > 
> > > ...
> 
> > > +
> > > +Common raw camera sensor model
> > > +------------------------------
> > > +
> > > +The common raw camera sensor model defines a set of enumeration and
> > > +configuration interfaces (formats, selections etc.) that cover the
> > > vast majority
> > > +of functionality of raw camera sensors. Not all of the interfaces are
> > > +necessarily offered by all drivers.
> > > +
> > > +A sub-device complies with the common raw sensor model if the
> > > +``V4L2_CONFIG_MODEL_COMMON_RAW`` bit is set in the
> > > ``V4L2_CID_CONFIG_MODEL``
> > > +control of the sub-device.
> > > +
> > > +The common raw camera sensor model is aligned with
> > > +:ref:`media_using_camera_sensor_drivers`. Please refer to that
> > > regarding aspects
> > > +not specified here.
> > > +
> > > +Each camera sensor implementing the common raw sensor model exposes
> > > a single
> > > +V4L2 sub-device. The sub-device contains a single source pad (0)
> > > and two or more
> > > +internal pads: an image data internal pad (1) and optionally an
> > > embedded data
> > > +pad (2). Additionally, further internal pads may be supported for other
> > > +features, in which case they are documented separately for the
> > > given device.
> 
> One more question here, to be sure I understand correctly. So, in order to
> be compliant with the common raw camera sensor model, in case a raw sensor
> will need more than 2 internal pads, the expectation is to keep image on pad
> 0, edata on pad 1, and add more needed pads? Or is it acceptable that a
> driver completely changes the pad numbering according to it's needs, as long
> as it is documented?
> 
> The case I am targeting is os08a20 hdr sensor, with: pad1-image long
> exposure, pad2-edata, pad3-image short exposure. So far, so good, I guess.
> 
> I don't know if there will be such a case for a sensor driver which does not
> support embedded data, but will need to support other internal pads, and in
> such a case, how should pad numbering look like?

Good question.

I think we could change the common raw sensor model in such a way that the
embedded data internal pad is the first one using a metadata mbus code,
instead of using a plain number.

Laurent, any thoughts?

-- 
Kind regards,

Sakari Ailus

