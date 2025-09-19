Return-Path: <linux-media+bounces-42763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62953B88C36
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 12:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2689C5A003F
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 10:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639B32BEC2A;
	Fri, 19 Sep 2025 10:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XjrGGTat"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B58D225D6
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 10:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758276612; cv=none; b=eABREQ4sDxXQpjES76LAVDAa3k1muEYNFGmmJreIWDE7VDF2ysdIjl/8Tj0/szGGzgofZUzAHjGPoYt3VhUNTz48h5g71a8DhHS4hoN8zTPfkzzUGXcTJbJoOZMj2J89PfEwilwiwbn/MVkexdwgUPwmBrzPAbDVe2gn6S5Rjes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758276612; c=relaxed/simple;
	bh=Muyv4ULOFgy73dHQttSIYv5vKSi4SrqsfZMJpx9bGNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQsZ3K/8kv7n8x/6Ws4d9AeX0pmxPOwW5A3D2xdjPNUKNo/uBzwYdOPHUx57h+bqcqSUR1UCAh2zBCE2ZFWPvYghbGlfLm6G1TTSDTT3pmzRGImy+9JWiCKK/sjdNnvj3nOMg3/c+Mwt7MaXnXdcmLjiIDH5ZoQ7vu3HeU5SxX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XjrGGTat; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758276610; x=1789812610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Muyv4ULOFgy73dHQttSIYv5vKSi4SrqsfZMJpx9bGNU=;
  b=XjrGGTatefnla88pyyp3xAptCL7aJcLx8CpvzIxEC/kJtHEtBl/9jhi2
   COa7F9eMqpAzwooXSh7151AsCLt2Epto5TmE4yJh8t9dzXbwXsvPes1fF
   8P3iJDLOT55Vo8Z7eqv3UBQEgmL5WImlLF4VkPJlxZHyRwD3i4hjCQJXL
   H63f96XYEWAAmcNTP54WfRP2AJX4vKk6cS9SRgGTE/IQwDTLt76PKJZFP
   JIoRI/U3v9LWKGzbJznmp5oIM11gLD8wY3B73XdP6+0gWtVC2FdpkUDXM
   pkcrUjeuTIYeOW8utsWlbOL6zvhSchbC5/2kW3aVqjmrdTQ4QlPodAGzA
   A==;
X-CSE-ConnectionGUID: QKG4DhadQSGGaZ0xJZhpCg==
X-CSE-MsgGUID: Z4kKnB0rTomQCpXH931zjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="71249962"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="71249962"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 03:10:10 -0700
X-CSE-ConnectionGUID: UhMcGVCRQmyOmNxyyhuepQ==
X-CSE-MsgGUID: 5ETPIuzvTnC7oXWKHA2krA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="212951048"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 03:10:03 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 025AF11F982;
	Fri, 19 Sep 2025 13:09:59 +0300 (EEST)
Date: Fri, 19 Sep 2025 13:09:59 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
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
Subject: Re: [PATCH v11 20/66] media: Documentation: Reference COLOR_PATTERN
 control in raw format docs
Message-ID: <aM0r93ExkFHtqXjn@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-21-sakari.ailus@linux.intel.com>
 <ndc5gt6jyla5hoelwwk4wyy3rqb3ntbppjzsh7hpgevcd36ewo@d5n6nr2jxgck>
 <aLgSVXZ5XzidPa_x@kekkonen.localdomain>
 <fheacfv3k6ksctj2tvwji6wlmocl4f7gcocqdw4zb5xos2ybz5@gvh7c2wjj2br>
 <20250903151058.GQ3648@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903151058.GQ3648@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Sep 03, 2025 at 05:10:58PM +0200, Laurent Pinchart wrote:
> On Wed, Sep 03, 2025 at 02:03:39PM +0200, Jacopo Mondi wrote:
> > On Wed, Sep 03, 2025 at 01:03:01PM +0300, Sakari Ailus wrote:
> > > On Mon, Sep 01, 2025 at 04:21:53PM +0200, Jacopo Mondi wrote:
> > > > On Mon, Aug 25, 2025 at 12:50:21PM +0300, Sakari Ailus wrote:
> > > > > Add a reference to the V4L2_CID_COLOR_PATTERN control in the generic raw
> > > > > pixelformat documentation.
> > > > >
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > ---
> > > > >  .../userspace-api/media/v4l/ext-ctrls-image-source.rst         | 2 ++
> > > > >  Documentation/userspace-api/media/v4l/subdev-formats.rst       | 3 +++
> > > > >  2 files changed, 5 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > > index b19aaaffbce0..0fcd60d8c621 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > > @@ -93,6 +93,8 @@ Image Source Control IDs
> > > > >      is reported as being (say) 128, then a value of 192 would represent
> > > > >      a gain of exactly 1.5.
> > > > >
> > > > > +.. _image-source-control-color-pattern:
> > > > > +
> 
> I'd move this to the previous patch.

I prefer to keep it here. :-)

> 
> > > > >  ``V4L2_CID_COLOR_PATTERN (integer)``
> > > > >      This control determines the color components and native pixel order in the
> > > > >      sensor's CFA (Color Filter Array) when used in conjunction with
> > > > > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > > index e77b4ad19737..77571adeb21e 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > > @@ -3444,6 +3444,9 @@ camera sensors using Bayer and other Colour Filter Arrays (CFAs) on serial
> > > > >  interfaces. The packing of the data on the bus is determined by the hardware,
> > > > >  however the bit depth is still specific to the format.
> > > > >
> > > > > +The colour components and the native pixel order are determined by the
> > > >
> > > > Isn't
> > > >   +The native colour components ordering are determined by ...
> > > >
> > > > As I don't see how "colour components and the native pixel order"
> > > > information can be conveyed separately.
> > >
> > > How about:
> > >
> > > The native Colour Filter Array (CFA) pattern is determined by the
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you.

-- 
Kind regards,

Sakari Ailus

