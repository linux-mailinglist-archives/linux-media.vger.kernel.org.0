Return-Path: <linux-media+bounces-41689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D36EB421E8
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C70F93AF63A
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 13:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAF43090EE;
	Wed,  3 Sep 2025 13:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UXNjDwhA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D5B304967
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 13:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906643; cv=none; b=iHD1Hqc1IKQgdO4l8qB8HfBagV3rRDfQmRkfCZbTnQV6T20gwRI8WGM9iZknNuSdPO+iG5e9BdH7RI4c+dSR6806mEHqW8iKh8VTU2AMy4G63zx37apbZaP8v8yHxvlgE7cEdk+2dARNSZw1QB7NQWidt50gyFhCuCbb2DtkbZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906643; c=relaxed/simple;
	bh=T7FAN4SHbYqtgL0WjoYQ/wEypjs8GeCEfrJ25RL08vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ME6EhtegjlbjENhzqpqU/cqldMKMrbCnDTmD7NLkkHGE7ouvS7KcA8rar05BfGJdUCYtaHHjLqvzhMvo+5QyHJB4Gmnodh0wVSvUBYXObLdHv+mZT9pOeHh+/zKdA68dSSz7fPi2sdia7431PeekHh0sxQTXG+/cjecNDToBHhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UXNjDwhA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756906642; x=1788442642;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T7FAN4SHbYqtgL0WjoYQ/wEypjs8GeCEfrJ25RL08vw=;
  b=UXNjDwhAoO9ObJjmmmLqkeT83MY1LZzz7GnbhNT6Q/ybepYMssmlPQlH
   p4au6PenYTOn+abJBfKCpXCnB587aIHTV3llziNM9TzEKDG21MULLLWE9
   SCSKZXgS2Y4FX5i+H/L4S8ITRtxfdq4Ur75bDHnV7w8wToV8ybh8FDWzR
   YyHafeZG1H2kWk9BGuAJ7r7cV4Ck1MKaYjsOy/KrS8AAk0R5V3gnnjF8b
   gbgQLaokhL6+GxH9LXweZ7HYZP1xCnT+n1d6P76CC4cLH5mODfRzW0yqV
   l3w5ksg+nxnp8A2uFfeWpVJufV7wZ3vxF1JZ5Z8yGz2SfTS5Kg9P8BquW
   Q==;
X-CSE-ConnectionGUID: 1xGccne4T7KaZwubUa1B4A==
X-CSE-MsgGUID: 9IJJ8CtrTsKO6ABriDvXLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="70318780"
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="70318780"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 06:37:21 -0700
X-CSE-ConnectionGUID: Pwf+DWhAR/qlhG2f89e0Gw==
X-CSE-MsgGUID: O9AGnATSQ8amdGuV1HfCsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="171153492"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.204])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 06:37:15 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 93CAB11F99F;
	Wed, 03 Sep 2025 16:37:12 +0300 (EEST)
Date: Wed, 3 Sep 2025 16:37:12 +0300
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
Subject: Re: [PATCH v11 26/66] media: Documentation: Document embedded data
 guidelines for camera sensors
Message-ID: <aLhEiMQSp23ZCffK@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-27-sakari.ailus@linux.intel.com>
 <wsa4s2ele6nejp5jcca5ny44oerwxdnyjn2ggxu6e2x5yqlm4g@vihn6rrtdnkg>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wsa4s2ele6nejp5jcca5ny44oerwxdnyjn2ggxu6e2x5yqlm4g@vihn6rrtdnkg>

Hi Jacopo,

On Mon, Sep 01, 2025 at 06:42:33PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Aug 25, 2025 at 12:50:27PM +0300, Sakari Ailus wrote:
> > Document how embedded data support should be implemented for camera
> > sensors, and when and how CCS embedded data layout should be referenced.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Julien Massot <julien.massot@collabora.com>
> > ---
> >  .../media/drivers/camera-sensor.rst           | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > index a8e0e4accbc9..a719c6f88f11 100644
> > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > @@ -117,3 +117,23 @@ register programming sequences shall initialize the :ref:`V4L2_CID_HFLIP
> >  values programmed by the register sequences. The default values of these
> >  controls shall be 0 (disabled). Especially these controls shall not be inverted,
> >  independently of the sensor's mounting rotation.
> > +
> > +Embedded data
> > +-------------
> > +
> > +Many sensors, mostly raw sensors, support embedded data which is used to convey
> > +the sensor configuration for the captured frame back to the host. While CSI-2 is
> > +the most common data interface used by such sensors, embedded data can be
> > +available on other interfaces as well.
> > +
> > +Embedded data support is indicated by the presence of an internal sink pad (pad
> > +that has both the ``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and
> > +``MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`` flags set) with a metadata
> 
> These are rendered as verbatim text, not links

Will fix for v12.

> 
> > +format to model the embedded data stream. If the sub-device driver supports
> > +disabling embedded data, this can be done by disabling the embedded data route
> > +via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
> > +
> > +In general, changing the embedded data layout from the driver-configured values
> > +is not supported. The height of the metadata is device-specific and the width
> > +is that (or less of that) of the image width, as configured on the pixel data
> 
> s/is that (or less of that) of/is the same (or smaller) than/
> 
> reads better in my possibily broke English

How about:

The height of the metadata is device-specific and equal to or less than the
image width, as configured on the pixel data stream.

> With the links fixed
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thank you.

-- 
Sakari Ailus

