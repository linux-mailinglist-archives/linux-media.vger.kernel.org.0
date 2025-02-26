Return-Path: <linux-media+bounces-27012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 578B6A45A93
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 10:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D70321894EED
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 09:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A4E238158;
	Wed, 26 Feb 2025 09:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8EruRab"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E441F176FB0
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 09:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740563406; cv=none; b=PSgx+nJV5Osgyw6G2ZFJDW6qN+nM9UcS2GpOiBJ1nNARgBWImuZ0UXqCfJZwFP+7y+otCwwCedxRpuZGLIx1BLa1kJU1JJXw15hpD/0uUhhSWH+Tw2irE+JuIr2oCJ0wMom4KSU2ETywhI4dsE1I4NsJGYIg6CHIq0mwjWuPyC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740563406; c=relaxed/simple;
	bh=L2mjstJ6O1BzaJmpDPJ5k17JgCPrCrnBDG+95/8lnCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPKLQlemtNj2LQ6Kn5ldQJFn6qCF/DeClu/lJgyQurgDZ8leVBWv7Zvia+C6NA36jI6Lgxbc3KnQZG0IixNtcnfXCEHOYSfP/Uz6LLHdScdulJxncgOPEw7ByfTVDpR4XdUNlnZ+7vKzECWCZX7EnV/z/HQy5wzRqDuJbNMGuhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8EruRab; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740563405; x=1772099405;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=L2mjstJ6O1BzaJmpDPJ5k17JgCPrCrnBDG+95/8lnCo=;
  b=I8EruRabgQfjN0d0CrQSPnQAUMdxdIgM0eSfpt8XSLJ2Cnm1RElRmwPe
   CaAutH5xaz0X5DjiBNuZlV1R/oSbU3q85kuw+me3VnMAeeMmMq2AH5C7H
   FG0E4mPuWBOXtMrQZy/zuHy3FeeXhAXZo3niix5I6x0I4wI1ZjIWqSXqy
   tPyp3GfwNJUIDqtH6gyZixW/n7X/rtitBt0J9moPJJB/Kkv1nw9uuBlE4
   mgHfs08KTS7n/+of8mg5u1VMkrPajm5FgXbj0ZULcAT0s9tEyICzy6BK5
   nzEkR89Ep94J4nrwl5PTegRNJKADsgQ9mnCfMHlkACVTJRkKuXWxcPvtV
   A==;
X-CSE-ConnectionGUID: rzYA1G86SFS0VNse2nY4VA==
X-CSE-MsgGUID: pE2Tgyk/S82Lin80n/LTlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52818473"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="52818473"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 01:50:04 -0800
X-CSE-ConnectionGUID: 78iydxhqST+7V0YA87fIIA==
X-CSE-MsgGUID: tjebb93mQcmlCqVnrjBrxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117144197"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 01:50:00 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F309211F944;
	Wed, 26 Feb 2025 11:49:57 +0200 (EET)
Date: Wed, 26 Feb 2025 09:49:57 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Vuillaumier <julien.vuillaumier@nxp.com>,
	tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
	hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 10/46] media: Documentation: v4l: Document internal
 sink pads
Message-ID: <Z77jxSkZSyi4rD1S@kekkonen.localdomain>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-11-sakari.ailus@linux.intel.com>
 <5934b1f7-b880-40f9-b457-e6729ae4f8e4@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5934b1f7-b880-40f9-b457-e6729ae4f8e4@nxp.com>

Hi Mirela,

On Wed, Feb 26, 2025 at 11:16:36AM +0200, Mirela Rabulea wrote:
> Hi Sakari and Laurent,
> 
> On 16.04.2024 22:32, Sakari Ailus wrote:
> > Document internal sink pads, pads that have both SINK and INTERNAL flags
> > set. Use the IMX219 camera sensor as an example.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by Julien Massot <julien.massot@collabora.com>
> > ---
> >   .../userspace-api/media/v4l/dev-subdev.rst    | 145 ++++++++++++++++++
> >   1 file changed, 145 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index b76e02e54512..d30dcb9e2537 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -553,6 +553,27 @@ A stream at a specific point in the media pipeline is identified by the
> >   sub-device and a (pad, stream) pair. For sub-devices that do not support
> >   multiplexed streams the 'stream' field is always 0.
> > +.. _v4l2-subdev-internal-source-pads:
> > +
> > +Internal sink pads and routing
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +Cases where a single sub-device source pad is traversed by multiple streams, one
> > +or more of which originate from within the sub-device itself, are special as
> > +there is no external sink pad for such routes. In those cases, the sources of
> > +the internally generated streams are represented by internal sink pads, which
> > +are sink pads that have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`
> > +pad flag set.
> > +
> > +Internal pads have all the properties of an external pad, including formats and
> > +selections. The format in this case is the source format of the stream. An
> > +internal pad always has a single stream only (0).
> 
> For me, it is not clear what is allowed/expected regarding the formats on
> the internal sink pads.
> 
> What "The format in this case is the source format of the stream" means?
> 
> I suppose the format on the internal pads will never be set by the user, but
> be static or propagated?

It depends on the device, in fact. On sensors I'd use the highest supported
bit depth on the internal pad whereas on the external pad this could be
configurable. I'll add this to the common raw sensor model.

> 
> A glimpse into the future shows that libcamera makes some assumptions in
> src/libcamera/sensor/camera_sensor_raw.cpp:
> 
> https://lists.libcamera.org/pipermail/libcamera-devel/2024-March/041006.html 
> 
>  /*
>    * Get the native sensor CFA pattern. It is simpler to retrieve it from
>    * the internal image sink pad as it is guaranteed to expose a single
>    * format, and is not affected by flips.
>    */
> 
> I think it would be good to have a more clear documentation in the kernel,
> for both the driver developers and user applications to know what behavior
> to expect. If a "native" format is always expected on the internal sink
> pads, let it be documented, or if the internal sink pads format should be
> propagated from the source pad format (presumably set by the user, and
> contrary to the general recommendation to propagate the format from sink to
> source).

The intention originally was to use existing raw formats on internal sink
pads to express the native format of the sensor. I later on switched to
generic (greyscale) formats and the colour pattern control after discussing
the matter with Laurent.

> 
> Also, if there is a guarantee to have a single format exposed, as stated in
> libcamera, it would be good to have that also documented in the kernel.
> 
> I assume some things will change in libcamera after the common raw sensor
> model addition in the kernel, I don't fully envision how.
> 
> I am working on adding internal pads and streams for os08a20 hdr sensor, and
> also looked at the changes made to imx219, to give some context to my
> questions.

Regarding the GRBIR sensor -- I'm suggesting to use greyscale mbus codes
and then the colour pattern control. We could merge those patches before
the common raw sensor model.

-- 
Kind regards,

Sakari Ailus

