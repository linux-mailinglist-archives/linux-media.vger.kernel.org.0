Return-Path: <linux-media+bounces-41668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9DDB41E4B
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 14:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD5787B7CAB
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 12:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB9427FD43;
	Wed,  3 Sep 2025 12:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OyT8J1j7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F841DE2B4
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 12:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901028; cv=none; b=tB7rnKY0LakNVIyDJe1NAy8o2k+DjqEyWwUEUk6nS3uHlEl6/oP/lZjLemHaldpn9DmGIOt6x1XsABfFXbjW/YqsI8JLwpXxQb9v2sH8D0Kf+/uawkVKluga9SON9ydIxZVukei71kOZ4d7D6rwk7oxleT7umSloAlpphEAqLGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901028; c=relaxed/simple;
	bh=KMl0IAfAHQVZfSk1g8+I7yK2hkQl9GA0NHWjvpKNyBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWCCgMSKwA6xl6PjY22CBGFOQfMudBsYIg79yuW5QOpvU1MNx7oLRe9QO3QbgnxmuqqqunAosV0Rkq/UxnywRU4wkHSAmTo1htM1j2wypj96A486kUsomZfOd6f27VyMC5ufde1GHB6XBJaMVM+Wg02jNlFWbS4xqBMbiGdqF6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OyT8J1j7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-50-160.net.vodafone.it [5.90.50.160])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3093965;
	Wed,  3 Sep 2025 14:02:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756900954;
	bh=KMl0IAfAHQVZfSk1g8+I7yK2hkQl9GA0NHWjvpKNyBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OyT8J1j7w7m30oR4NXGSTYUWKTJLyJIsd/vPDdrGfgHWqFRe6vTc3CF1UiadM77UZ
	 9nfQq5fcoEaNQZgLfYxhEkPWgEcVohD/rZp4PWFJ3PkYm15jCdtbwOhP5e/OM1Sy1A
	 xEVGX1v99OEvsm7Ox4Cd+gle52mp3R/dN/Vg6tIM=
Date: Wed, 3 Sep 2025 14:03:39 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, 
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	"Wang, Hongju" <hongju.wang@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 20/66] media: Documentation: Reference COLOR_PATTERN
 control in raw format docs
Message-ID: <fheacfv3k6ksctj2tvwji6wlmocl4f7gcocqdw4zb5xos2ybz5@gvh7c2wjj2br>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-21-sakari.ailus@linux.intel.com>
 <ndc5gt6jyla5hoelwwk4wyy3rqb3ntbppjzsh7hpgevcd36ewo@d5n6nr2jxgck>
 <aLgSVXZ5XzidPa_x@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLgSVXZ5XzidPa_x@kekkonen.localdomain>

Hi Sakari

On Wed, Sep 03, 2025 at 01:03:01PM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Mon, Sep 01, 2025 at 04:21:53PM +0200, Jacopo Mondi wrote:
> > On Mon, Aug 25, 2025 at 12:50:21PM +0300, Sakari Ailus wrote:
> > > Add a reference to the V4L2_CID_COLOR_PATTERN control in the generic raw
> > > pixelformat documentation.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../userspace-api/media/v4l/ext-ctrls-image-source.rst         | 2 ++
> > >  Documentation/userspace-api/media/v4l/subdev-formats.rst       | 3 +++
> > >  2 files changed, 5 insertions(+)
> > >
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > index b19aaaffbce0..0fcd60d8c621 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > @@ -93,6 +93,8 @@ Image Source Control IDs
> > >      is reported as being (say) 128, then a value of 192 would represent
> > >      a gain of exactly 1.5.
> > >
> > > +.. _image-source-control-color-pattern:
> > > +
> > >  ``V4L2_CID_COLOR_PATTERN (integer)``
> > >      This control determines the color components and native pixel order in the
> > >      sensor's CFA (Color Filter Array) when used in conjunction with
> > > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > index e77b4ad19737..77571adeb21e 100644
> > > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > @@ -3444,6 +3444,9 @@ camera sensors using Bayer and other Colour Filter Arrays (CFAs) on serial
> > >  interfaces. The packing of the data on the bus is determined by the hardware,
> > >  however the bit depth is still specific to the format.
> > >
> > > +The colour components and the native pixel order are determined by the
> >
> > Isn't
> >   +The native colour components ordering are determined by ...
> >
> > As I don't see how "colour components and the native pixel order"
> > information can be conveyed separately.
>
> How about:
>
> The native Colour Filter Array (CFA) pattern is determined by the

Works for me, thanks!

>
> >
> > Up to you
> >
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> Thanks!
>
> >
> > Thanks
> >    j
> >
> > > +:ref:`V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>` control.
> > > +
> > >  .. tabularcolumns:: |p{2.0cm}|p{4.0cm}|p{11.3cm}|
> > >
> > >  .. cssclass:: longtable
>
> --
> Kind regrads,
>
> Sakari Ailus

