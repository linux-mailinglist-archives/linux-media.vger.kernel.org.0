Return-Path: <linux-media+bounces-9929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A463F8AE368
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 13:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30B50282D0B
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 11:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EB6762EB;
	Tue, 23 Apr 2024 11:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmT+g13w"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD686EB70
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 11:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713870419; cv=none; b=KVuQ8KpSoZHemZK+qRGkmjH/UGY7uhpim49A+UVgkfNq6wVwSiDlXL/jkJFW2mf6xvwHY9akQhfMRSJ5tlY8Z5RSsbedhpcmsvRT0f/jh0USiLU6ek85cnT8LvJzuTlM2dKOMBVp73E7SPQgElX48zNwjadJ+a3zCY/momKz3aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713870419; c=relaxed/simple;
	bh=QpB9Hyz908FmIJ/lIPXpu44XhNyiRYDSyL0CVWjIvuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yxv7Gn4oB1Sw6eYxSd1s6ZVq57QFl8IBget/ey6LOxpykVSzvHFeyK1Qt0c+lGRN7W+ft79U7IR87gvja4zJF2jF3gfh2+MbnaAlLa3FLV5otS0M1snSTpW2PPD4rx5UfwsutViWLT2ztM2ogC01V5rfbea6p48RjWqa0aYrUQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmT+g13w; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713870418; x=1745406418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QpB9Hyz908FmIJ/lIPXpu44XhNyiRYDSyL0CVWjIvuQ=;
  b=NmT+g13wqLmjYZUqSepRchIz7jxo0gcCgzTA/j2TBMNZ3Y9BAurspMoF
   d97GN3fSf+E7J5MKzQ6XOqpFK13ubJYlJ2KyynOvs9gQToOpM+QXmnbwG
   c2H5FnCZnvEmRxHG8THM89J+FLND16J9PIhKnciDwT8CK86KSelKdliU4
   h8lQImOdBlPa4r1+LtjT4m4ZXfdyXlNR8ok6OMOPRsW+/lT7Y2OQyWery
   LWo2R/8UFUX31cK/TrtVjl3kbOykROA4xmw5JymYs9NVVDtGRupK8AOG/
   m764waswzKJoiFBDo/mVnJASJ89Ai3GKejyksfySek5pXyH+hqVxsHDtR
   w==;
X-CSE-ConnectionGUID: m5so4CtpR5azVUE10/AUxw==
X-CSE-MsgGUID: DRBlqMN3R0uxwC3HRjckxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="13280218"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="13280218"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 04:06:46 -0700
X-CSE-ConnectionGUID: sPDnnQo3TSCwpNpVbJu4Og==
X-CSE-MsgGUID: u6U+hTjNT4+iRDk0ejLM/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24389926"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 04:06:43 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3028211FCCF;
	Tue, 23 Apr 2024 14:06:41 +0300 (EEST)
Date: Tue, 23 Apr 2024 11:06:41 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 29/46] media: Documentation: ccs: Document routing
Message-ID: <ZieWQc2u3a5eaU9u@kekkonen.localdomain>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-30-sakari.ailus@linux.intel.com>
 <20240420083147.GR6414@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240420083147.GR6414@pendragon.ideasonboard.com>

Hi Laurent,

On Sat, Apr 20, 2024 at 11:31:47AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Tue, Apr 16, 2024 at 10:33:02PM +0300, Sakari Ailus wrote:
> > Document which routes are available for the CCS driver (source) sub-device
> > and what configuration are possible.
> > 
> > Also update copyright.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/drivers/ccs.rst       | 38 ++++++++++++++++++-
> >  .../media/v4l/subdev-formats.rst              |  2 +
> >  2 files changed, 39 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/userspace-api/media/drivers/ccs.rst b/Documentation/userspace-api/media/drivers/ccs.rst
> > index 03015b33d5ab..53890ac54dab 100644
> > --- a/Documentation/userspace-api/media/drivers/ccs.rst
> > +++ b/Documentation/userspace-api/media/drivers/ccs.rst
> > @@ -111,4 +111,40 @@ than in the centre.
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
> 
> s/if exists/if it exists/

Sounds good.

> 
> > +binner) depending on whether the sensor supports embedded data. (All CCS
> > +compliant sensors do but the CCS driver supports preceding standards that did
> > +not require embedded data support, too.)
> > +
> > +The first route of the CCS source sub-device is for pixel data (sink pad
> > +0/stream 0 -> source pad 1/stream 0) and the second one is for embedded data
> > +(internal sink pad 2/stream 0 -> source pad 1/stream 1).
> > +
> > +Embedded data
> > +~~~~~~~~~~~~~
> > +
> > +MIPI CCS supports generation of camera sensor embedded data. The media bus code
> > +used for this format on the internal sink pad is
> > +:ref:`MEDIA_BUS_FMT_CCS_EMBEDDDED <MEDIA-BUS-FMT-CCS-EMBEDDED>`.
> > +
> > +The bit depth of the CCS pixel data affects how the sensor will output the
> > +embedded data, adding padding to align with CSI-2 bus :ref:`Data Units
> > +<media-glossary-data-unit>` for that particular bit depth. This is indicated by
> > +the generic metadata format on the sensor's source sub-device's source pad.
> 
> That's a bit hard to parse, maybe "on the source pad of the sensor's
> source sub-device" ?

Sounds good.

> 
> > +
> > +Devices supporting embedded data for bit depths greater than or equal to 16 may
> > +support more dense packing or legacy single metadata byte per data unit, or both
> > +of these. The supported embedded data formats can be enumerated and configured
> > +on stream 1 of the source pad (1) of the CCS source sub-device.
> > +
> > +The use of the denser packing results in embedded data lines being longer than
> > +the pixel data in data units since the data units are smaller. In bytes the
> > +embedded data lines are still not longer than the image data lines.
> > +
> > +**Copyright** |copy| 2020, 2023 Intel Corporation
> 
> 2024 ?

Yes.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

> 
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > index fa181ce8f48c..a04756092238 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > @@ -8594,3 +8594,5 @@ levels above.
> >  This mbus code are only used for "2-byte simplified tagged data format" (code
> >  0xa) but their use may be extended further in the future, to cover other CCS
> >  embedded data format codes.
> > +
> > +Also see :ref:`CCS driver documentation <media-ccs-routes>`.
> 

-- 
Regards,

Sakari Ailus

