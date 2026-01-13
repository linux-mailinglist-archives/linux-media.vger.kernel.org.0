Return-Path: <linux-media+bounces-50620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AD0D1B7E8
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 22:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71F6C3041CF6
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 21:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6DB350A0E;
	Tue, 13 Jan 2026 21:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UTFlrhyy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6672DC34E
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 21:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768341435; cv=none; b=jkRcb7NqoV8iyqAZxfrVhAgl1oAT7JjbfKsF9hoelccBGrL3rCyh3fufzM9hT5VtDXQZL0E9/nsimHI620oQZ9lsX5KB3/51c+L/0bM95eki0RtETRhnkAyzSRHleYJUEaO8MW5d21b6jyDBz22FaTfBFZXzzJWbAAzsw53nRKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768341435; c=relaxed/simple;
	bh=l3qyb7rEhUd4f1roaN2Si01KeB/jUiHxdQh6NY2HSsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBxxsbzAqpCLgoskq+KAs33wg9/2S0ciOsunEaap7N7S9Tjc/WkcqHIMLbgojaJR70NyIyj2fexk+ga7TGHZX3S917tv8iMCImg3jg6aCGIoXgZf4wtmk9rEf5RbvcpMm4Bhx6E9QLtK4CAnx4MhjVQPVb/faI1DWmExh4LPO34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTFlrhyy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768341435; x=1799877435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l3qyb7rEhUd4f1roaN2Si01KeB/jUiHxdQh6NY2HSsU=;
  b=UTFlrhyyV13xJAuF8fx0E45Hnc/9i2xwjNa146VrRuRNz8bRTbT8mGpE
   VID8VS7f9qaB5lCN2LceIppPqNnyhur6j38UhtV32KTevLfD/X3EM9Mbg
   fYkdI60h68kscqDgXf4yWvOle8VARWv+C/X2Z3//eT6yroNtMUz8jLLCO
   KP79Nfxi6S2+MlEQnClHvWhfY/WAuLxcvtfoGg7v6HSrFWA7CRaw2rgdS
   jjxbEkVf302wZyllZiyzaXB8LDv6Fax4KfzLoGFOMixP8+sLR6p3hf0sW
   CO6s7GL961TPHMJUjxwnVg6Qkcd7VlDnvoL5spvwRte1ESL3D4NTZcJ2w
   w==;
X-CSE-ConnectionGUID: HxVbMXpwQhCttVktgTMpzQ==
X-CSE-MsgGUID: U3dd7TTgRi+RnCro5LSXcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73478511"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="73478511"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 13:57:14 -0800
X-CSE-ConnectionGUID: QMT3aUflQr2RqKWeKryyaw==
X-CSE-MsgGUID: FNtUzKyxROW+/zTUpCW1kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="209547944"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.58])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 13:57:08 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6BCA911FBC5;
	Tue, 13 Jan 2026 23:57:05 +0200 (EET)
Date: Tue, 13 Jan 2026 23:57:05 +0200
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
Subject: Re: [PATCH v10 25/64] media: Documentation: Document non-CCS use of
 CCS embedded data layout
Message-ID: <aWa_seoBcKyyHLLl@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-26-sakari.ailus@linux.intel.com>
 <0268741f-379f-4b30-8a71-122d6bd33471@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0268741f-379f-4b30-8a71-122d6bd33471@nxp.com>

Hi Mirela,

On Wed, Jul 23, 2025 at 02:54:56PM +0300, Mirela Rabulea wrote:
> Hi Sakari,
> 
> On 6/19/25 14:57, Sakari Ailus wrote:
> > 
> > 
> > The CCS embedded data layout has multiple aspects (packing, encoding and
> > the rest, including register addresses and semantics). Explicitly allow
> > non-compliant embedded data to use the two former to reduce redundant
> > documentation.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >   .../userspace-api/media/drivers/camera-sensor.rst    | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > index 450e5940c6e7..d9589ad80204 100644
> > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > @@ -136,3 +136,15 @@ In general, changing the embedded data layout from the driver-configured values
> >   is not supported. The height of the metadata is device-specific and the width
> >   is that (or less of that) of the image width, as configured on the pixel data
> >   stream.
> > +
> > +CCS and non-CCS embedded data layout
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Embedded data which is fully compliant with CCS definitions uses ``CCS embedded
> > +data layout <media-metadata-layout-ccs>`` (level 3) for :ref:`the metadata
> 
> It this was menat to be a link, it is not working in the generated
> documentation.
> 
> Also, there probably should not be any mention anymore to the "CCS embedded
> data mbus code" below, since I see you switched to generic code + layout.

To be fixed for v12.

-- 
Sakari Ailus

