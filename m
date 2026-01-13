Return-Path: <linux-media+bounces-50607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 669B1D1B47F
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 21:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EFAA3083C7B
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 20:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4D43126A1;
	Tue, 13 Jan 2026 20:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E84V2GeO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B218530FF06
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 20:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768337044; cv=none; b=A2408XFrLWxSI3BW+nt1qiJl6ABtUMuzPkE+CVFJXvTOYJV7VXoMMQnweEgeuM0hLarPaBMiFsIwxDPjYnfLxsjl8M7yKaREsj1lAU6fhvY6DiSvhTm7qKfQzeeLDyxqMdJ5nV1coqfJ4xD3kspYWvLVrfpxXE5rjjO7xxTIWTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768337044; c=relaxed/simple;
	bh=hquJ0Cp3Esl9D13nTOrc0BfHqCkYc6ETPDoBd4NpkIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rgv+0MbVDjZ3C6D4ujuTAU6U8Ke6QC6SBnjXdb0dQgrSKCXMLBGkBvtL+hWdbh5KaNjKIcTPwzjTYkQZcEDurVIZRhqoM/lcwVqsp0Jui6cdhH1kgcI21ZbC4j0NB/T6x0Gxrxx6tx5f2fInwsEkAZgFT2nM40THSagm4rt/NBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E84V2GeO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768337043; x=1799873043;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hquJ0Cp3Esl9D13nTOrc0BfHqCkYc6ETPDoBd4NpkIM=;
  b=E84V2GeOqEadUe4KAnLM0Rd8TToz6ZQffMeTofjMyQgXmbJhUM6av6QE
   FiYvQiR5KdDfMMRntcPq6FooGkMvFwzQI/mw1zTJFuRgnTkC4aVRHqPC3
   g3fmitmMK6tYeZsdL0a6bvEpxlGs4y++56ynViwtivahxHfyGwRRTklKn
   QFbPnYBC+1F7Tkpcv0NAStRCZUSB5Orc2qwJ08aLVQ/Rtuy66/wHWWKzB
   8+JYPpRT4dchnX7NXYe36SOADjpDblaqGvR+Ma7owMBizN4Bzbcc9I8WW
   0L5OAe3Tmn3KpSiVp+bYnOmrqhyfN/b7cLqDDXK7AZZDwqBA2hMZ5TgO5
   g==;
X-CSE-ConnectionGUID: byHG1NgBQDytqUeHo+9ibg==
X-CSE-MsgGUID: KmY2P6HHRLO+Ol4F/PLQRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80353290"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80353290"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 12:44:01 -0800
X-CSE-ConnectionGUID: W2QFv1BkQLWXt8FeKSMNVA==
X-CSE-MsgGUID: 4bmhXkAhQLaGtANCPoypyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208646246"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.58])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 12:43:54 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 75E0F11FBC5;
	Tue, 13 Jan 2026 22:43:52 +0200 (EET)
Date: Tue, 13 Jan 2026 22:43:52 +0200
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
Subject: Re: [PATCH v10 23/64] media: Documentation: Document embedded data
 guidelines for camera sensors
Message-ID: <aWauiK_G-XtaSQ8N@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-24-sakari.ailus@linux.intel.com>
 <aetocz3q4afsfye7drpuaiyeyehxs7h4cwithmmhbhv26aaerp@ogdgfcigozz3>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aetocz3q4afsfye7drpuaiyeyehxs7h4cwithmmhbhv26aaerp@ogdgfcigozz3>

Hi Jacopo,

On Fri, Jun 20, 2025 at 03:19:26PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Thu, Jun 19, 2025 at 02:57:55PM +0300, Sakari Ailus wrote:
> > Document how embedded data support should be implemented for camera
> > sensors, and when and how CCS embedded data layout should be referenced.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Julien Massot <julien.massot@collabora.com>
> > ---
> >  .../media/drivers/camera-sensor.rst           | 21 +++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > index 9f68d24dfe0b..450e5940c6e7 100644
> > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > @@ -115,3 +115,24 @@ register programming sequences shall initialize the :ref:`V4L2_CID_HFLIP
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
> > +Such sensors expose two internal sink pads (pads that have both the
> > +``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and ``MEDIA_PAD_FL_INTERNAL
> > +<MEDIA-PAD-FL-INTERNAL>`` flags set) to model the source of the image and
> > +embedded data streams. Both of these pads produces a single stream, and the
> > +sub-device routes those streams to the external (source) pad. If the sub-device
> > +driver supports disabling embedded data, this can be done by disabling the
> > +embedded data route via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
> > +
> > +In general, changing the embedded data layout from the driver-configured values
> > +is not supported. The height of the metadata is device-specific and the width
> > +is that (or less of that) of the image width, as configured on the pixel data
> 
> Maybe "the width is equal to (or less than) the one of the image data, as
> configured on the pixel data stream"

Or:

The width of the metadata is device-specific and equal to or less than the
width of the image data, as configured on the pixel data stream.

?

> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thank you!

-- 
Sakari Ailus

