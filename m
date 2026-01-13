Return-Path: <linux-media+bounces-50608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 715E9D1B4A3
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 21:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF98730F084D
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 20:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267AC31DDA4;
	Tue, 13 Jan 2026 20:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="brnrAUF4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B17026738C
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 20:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768337283; cv=none; b=Bi1+VdA+Po72LyoOaH2QBUUgZulsRAPXosNz8bIicYXKajhmpc6nbvIKb777K4e91XxyUZmbzZgP32ocWbltKEqHCyTW1qkOZsmPhOED8eUBF205dg/pt6yGFpYdDQJxkmWPlVGIUlcU3llw6REtwCrRbOEGQR5NbMU/EzNze5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768337283; c=relaxed/simple;
	bh=WAxmUjDvjWEfY7was3tAAIm/wraV7jlC2jsmSNJtn64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MP1gX7mOU/6LXITHjf11itayXFxiqwy2NYapXU7df8PH5R/7EumOIMqu5e0vogldh9kOdH2xouY8tC/wNXT+dxdzYT/vRdJMOQITsRTJAzMMIof9avkGHOf9DSb2PElcqrrA/ZZmUd96uocxRSLkrEuY+SIfavSJMHaUudSXjG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=brnrAUF4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768337282; x=1799873282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WAxmUjDvjWEfY7was3tAAIm/wraV7jlC2jsmSNJtn64=;
  b=brnrAUF4SSwbGdvK6KPfTahhzszIRGL6ofqUrp9I3AHePRwrQN9nA1cA
   IjX0LvSDyIodYJJbARu2WnTKB0hayiaFOI/8wwNVxUzwW10nnXr9u+ZIY
   i4KW9pEWQv5lD4XzwvJKzWOWFySJQUZ0fX4sUPs4QBuwxFcy0L3YOguci
   wRn6vnBgWjjwi9ckO4Dgf/7llWYiWfD0CfS78ZdiVlcrtHgn95fr7WY+G
   RxmbA233TUA2zBGYlNa4fdP+/9TJ8v71EXccYjDwT1smU2poMd17w3uhP
   ZEBaZATSwcIZ+h4CB2FTvOTqFgKGYAt1l//zCEhA1pBaj/kkzoDTcrshQ
   g==;
X-CSE-ConnectionGUID: 8LC1IYOORGeR+s3cOYf8eA==
X-CSE-MsgGUID: GtkpkzrfTXij6AegxA7t0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="72216101"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="72216101"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 12:48:01 -0800
X-CSE-ConnectionGUID: 78frb+uPTriWjUziOk44Gw==
X-CSE-MsgGUID: Ts3WyfgETC6cpzWSIi2fZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204764193"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.58])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 12:47:56 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0CA0511FBC5;
	Tue, 13 Jan 2026 22:47:54 +0200 (EET)
Date: Tue, 13 Jan 2026 22:47:53 +0200
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
Subject: Re: [PATCH v10 23/64] media: Documentation: Document embedded data
 guidelines for camera sensors
Message-ID: <aWavedT0Uw-VUXfe@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-24-sakari.ailus@linux.intel.com>
 <43ae1005-f27e-4fe2-a5e7-8c69922483d2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43ae1005-f27e-4fe2-a5e7-8c69922483d2@nxp.com>

Hi Mirela,

On Wed, Jul 23, 2025 at 02:53:09PM +0300, Mirela Rabulea wrote:
> Hi Sakari,
> 
> On 6/19/25 14:57, Sakari Ailus wrote:
> > 
> > 
> > Document how embedded data support should be implemented for camera
> > sensors, and when and how CCS embedded data layout should be referenced.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Julien Massot <julien.massot@collabora.com>
> > ---
> >   .../media/drivers/camera-sensor.rst           | 21 +++++++++++++++++++
> >   1 file changed, 21 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > index 9f68d24dfe0b..450e5940c6e7 100644
> > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > @@ -115,3 +115,24 @@ register programming sequences shall initialize the :ref:`V4L2_CID_HFLIP
> >   values programmed by the register sequences. The default values of these
> >   controls shall be 0 (disabled). Especially these controls shall not be inverted,
> >   independently of the sensor's mounting rotation.
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
> 
> If MEDIA_PAD_FL_INTERNAL and MEDIA_PAD_FL_SINK are supposed to be links,
> they are not working in the generated documentations.

Thanks, those meant to have :ref: indeed. I'll fix these for v12.

-- 
Regards,

Sakari Ailus

