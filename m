Return-Path: <linux-media+bounces-9484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B31668A653E
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 09:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2E17B219E5
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 07:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D79078C8E;
	Tue, 16 Apr 2024 07:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LtRxcDYX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5131DFEA
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 07:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713253085; cv=none; b=m/X9rNaUbJPdC+OI6m2/YPK3YG3JthB4LQDMzujhgPRw5NyRDA6O/AXMQqaUHyBuc0CK6WaZPmzesgaohHV23pXV+9xuwI0iZEb+GyyuSxSbl7jA2NUQfF8XL8K+4E1qaV5TrjDLo2CQjq/a40k5Nl8hNgM9NJ76LQnce9uJCMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713253085; c=relaxed/simple;
	bh=cEs4j/a+2lNo6eFq4+zuZp7tdhDRsdzWv4sVK+v1VvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnnhYIrVJqOx4S07YBQ4Ql5EOQTLGMCle2cO9Ui1uUp4yGWhWsOO6f47fie+L9OzBvoBBnnNLS1uSqTdaz5jVmE0dJwuKh7qXLpkiFdrns8ZdhQuKktNqGkBm5WocAROeDHXpDFtl0xYrm2rpuQpMC5hVd9H3yZDJ8tELGPKX00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LtRxcDYX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713253084; x=1744789084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cEs4j/a+2lNo6eFq4+zuZp7tdhDRsdzWv4sVK+v1VvA=;
  b=LtRxcDYXw5rBddEfpTjwluXF3WUR0FJzmR/zL0BegKoBge0EVpQHcbFM
   pVtBUEIL+rvR08YRIUF2dFwhBoGS07aAh+JOplLUTvNn3JJi2wKe0z06V
   mj246rHctk/lDrmZ9aBd59rHZESqoswaYHmtsv+zs1qq6O0Y0BWx9+yPk
   VFR6ghMfCeGEj9xVrgSh2eYfnWJ8JwyZvdITirzQ/eiWa5fHDYTxkCGLZ
   +IN6NXQ8M/vyKIW/rm5k2blT+PLaqvRi77Ca1TnPBfGDfU0oQnix16ieM
   mIbFSqY0m0Drycv7LHF/fchSNWeYEwKKu4Ql6jE7jm47daTIMPkl7TovN
   g==;
X-CSE-ConnectionGUID: o8HCRfcYTOi4xVn7la2pcw==
X-CSE-MsgGUID: KKMkKunPT4yWtKEz3FzWKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8536574"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8536574"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 00:38:03 -0700
X-CSE-ConnectionGUID: c/Es0H4FQXWULtaptLGSZw==
X-CSE-MsgGUID: RKY19obWRV60vuqgXpS+4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="26753686"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 00:38:00 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1B55511FAB0;
	Tue, 16 Apr 2024 10:37:58 +0300 (EEST)
Date: Tue, 16 Apr 2024 07:37:58 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 30/38] media: Documentation: ccs: Document routing
Message-ID: <Zh4q1gnrnRTj2jkV@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-31-sakari.ailus@linux.intel.com>
 <20240321174306.GQ9582@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321174306.GQ9582@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Mar 21, 2024 at 07:43:06PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.

Thank you for the review!

> 
> On Wed, Mar 13, 2024 at 09:25:08AM +0200, Sakari Ailus wrote:
> > Document which routes are available for the CCS driver (source) sub-device
> > and what configuration are possible.
> > 
> > Also update copyright.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/drivers/ccs.rst       | 34 ++++++++++++++++++-
> >  .../media/v4l/subdev-formats.rst              |  2 ++
> >  2 files changed, 35 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/userspace-api/media/drivers/ccs.rst b/Documentation/userspace-api/media/drivers/ccs.rst
> > index 03015b33d5ab..bc2804ec663b 100644
> > --- a/Documentation/userspace-api/media/drivers/ccs.rst
> > +++ b/Documentation/userspace-api/media/drivers/ccs.rst
> > @@ -111,4 +111,36 @@ than in the centre.
> >  Shading correction needs to be enabled for luminance correction level to have an
> >  effect.
> >  
> > -**Copyright** |copy| 2020 Intel Corporation
> > +.. _media-ccs-routes:
> > +
> > +Routes
> > +------
> > +
> > +The CCS driver implements one or two :ref:`routes <subdev-routing>` in
> > +its source sub-device (scaler sub-device if exists for the device, otherwise
> > +binner) depending on whether the sensor supports embedded data. (All CCS
> > +compliant sensors do but the CCS driver supports preceding standards that did
> > +not require embedded data support, too.)
> 
> s/too.)/too).

Hmm. The entire sentence is in parentheses. Why should the period not be?

> 
> > +
> > +The first route of the CCS source sub-device is for pixel data (internal pad
> > +1/stream 0 -> pad 0/stream 0) and the second one is for embedded data (internal
> 
> I thought the source subdev had one external sink pad for image data,
> one internal sink pad for embedded data, and one source pad.

Hmm. I guess I was thinking of IMX219 when writing this. ;)

The text should have been:

The first route of the CCS source sub-device is for pixel data (sink pad
0/stream 0 -> source pad 1/stream 0) and the second one is for embedded data
(internal sink pad 2/stream 0 -> source pad 1/stream 1).


> 
> > +pad 2/stream 0 -> pad 0/stream 1).
> > +
> > +Embedded data
> > +~~~~~~~~~~~~~
> > +
> > +MIPI CCS supports generation of camera sensor embedded data. The media bus code
> > +used for this format is :ref:`MEDIA_BUS_FMT_CCS_EMBEDDDED
> > +<MEDIA-BUS-FMT-CCS-EMBEDDED>`.
> 
> Maybe state that this is the format on the internal ED sink pad.

Yes.

> 
> > +
> > +The bit depth of the CCS pixel data affects how the sensor will output the
> > +embedded data, adding padding to align with CSI-2 bus :ref:`Data units
> > +<media-glossary-data-unit>` for that particular bit depth. This is indicated by
> > +the generic metadata format on the sensor's source sub-device's source pad.
> > +
> > +Embedded data for bit depths greater than or equal to 16 may support more dense
> > +packing or legacy single metadata byte per data unit, or both of these,
> > +depending on the device. The supported embedded data formats can be enumerated
> > +and configured on stream 1 of the source pad (1) of the CCS source sub-device.
> > +
> > +**Copyright** |copy| 2020, 2023 Intel Corporation
> 
> 2024 ?

Indeed.

> 
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > index c8f982411e70..ca4da6a400ff 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > @@ -8592,3 +8592,5 @@ levels above.
> >  This mbus code are only used for "2-byte simplified tagged data format" (code
> >  0xa) but their use may be extended further in the future, to cover other CCS
> >  embedded data format codes.
> > +
> > +Also see :ref:`CCS driver documentation <media-ccs-routes>`.
> 

-- 
Kind regards,

Sakari Ailus

