Return-Path: <linux-media+bounces-41716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7D8B42492
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 17:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 646991BA7173
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4EB1EDA3C;
	Wed,  3 Sep 2025 15:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CbN6E38K"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE003126CE
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 15:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912281; cv=none; b=Nj0UE2JzXiEJncMvP2pC0dDOdJr9Ag3vNqrOXSXVJP+Yi/VunjCspzITwXUqSIlx1dyljrC8he5z6abOKrleytkPtFsbI4r20Ig7xPOmKtoDO0f2Mjp2OulstIHXYdbiXwj7hyXXp8DwZGXEk/gQ85brDFTWWozQrsY+tIPlsow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912281; c=relaxed/simple;
	bh=QTeBnku6UmWV5CxCVL+cwIMTrrWzOH4MbjoQn1vQnws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLoSV5LhEnKkRo8ZrqRS9Zv5ySndGThAcytFZvFbjDjhyVSLdPoTPL4gKxjMND7a0ChdO4t6ubGrhZEE2dj/3dARz0qmbFgAK6TJI0kaicmYF1/rec9Icb8B3/CeXNogaJe/EEqrkoE7Z+g4cY9O8XlxG+mftZiF2NmfDs3OjR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CbN6E38K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A0068664;
	Wed,  3 Sep 2025 17:10:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756912209;
	bh=QTeBnku6UmWV5CxCVL+cwIMTrrWzOH4MbjoQn1vQnws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CbN6E38KT7H35jdeCpfSq352O4ZbOoRSxPbV/65ONqNHFoPvs7+EPwezCM2wa7w2v
	 qWuphAGm9g+OxVXZAZjOrki0QuRrpcAcA/O8sg52+98XnjNfIHY6+iZM1G7+jnPk66
	 /V2fQOVfxfxPOMJSAEt6zcKJRv2YSA/jSdSwP4P0=
Date: Wed, 3 Sep 2025 17:10:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
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
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 20/66] media: Documentation: Reference COLOR_PATTERN
 control in raw format docs
Message-ID: <20250903151058.GQ3648@pendragon.ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-21-sakari.ailus@linux.intel.com>
 <ndc5gt6jyla5hoelwwk4wyy3rqb3ntbppjzsh7hpgevcd36ewo@d5n6nr2jxgck>
 <aLgSVXZ5XzidPa_x@kekkonen.localdomain>
 <fheacfv3k6ksctj2tvwji6wlmocl4f7gcocqdw4zb5xos2ybz5@gvh7c2wjj2br>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fheacfv3k6ksctj2tvwji6wlmocl4f7gcocqdw4zb5xos2ybz5@gvh7c2wjj2br>

On Wed, Sep 03, 2025 at 02:03:39PM +0200, Jacopo Mondi wrote:
> On Wed, Sep 03, 2025 at 01:03:01PM +0300, Sakari Ailus wrote:
> > On Mon, Sep 01, 2025 at 04:21:53PM +0200, Jacopo Mondi wrote:
> > > On Mon, Aug 25, 2025 at 12:50:21PM +0300, Sakari Ailus wrote:
> > > > Add a reference to the V4L2_CID_COLOR_PATTERN control in the generic raw
> > > > pixelformat documentation.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  .../userspace-api/media/v4l/ext-ctrls-image-source.rst         | 2 ++
> > > >  Documentation/userspace-api/media/v4l/subdev-formats.rst       | 3 +++
> > > >  2 files changed, 5 insertions(+)
> > > >
> > > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > index b19aaaffbce0..0fcd60d8c621 100644
> > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > > @@ -93,6 +93,8 @@ Image Source Control IDs
> > > >      is reported as being (say) 128, then a value of 192 would represent
> > > >      a gain of exactly 1.5.
> > > >
> > > > +.. _image-source-control-color-pattern:
> > > > +

I'd move this to the previous patch.

> > > >  ``V4L2_CID_COLOR_PATTERN (integer)``
> > > >      This control determines the color components and native pixel order in the
> > > >      sensor's CFA (Color Filter Array) when used in conjunction with
> > > > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > index e77b4ad19737..77571adeb21e 100644
> > > > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > @@ -3444,6 +3444,9 @@ camera sensors using Bayer and other Colour Filter Arrays (CFAs) on serial
> > > >  interfaces. The packing of the data on the bus is determined by the hardware,
> > > >  however the bit depth is still specific to the format.
> > > >
> > > > +The colour components and the native pixel order are determined by the
> > >
> > > Isn't
> > >   +The native colour components ordering are determined by ...
> > >
> > > As I don't see how "colour components and the native pixel order"
> > > information can be conveyed separately.
> >
> > How about:
> >
> > The native Colour Filter Array (CFA) pattern is determined by the

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Works for me, thanks!
> 
> > > Up to you
> > >
> > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > >
> > > > +:ref:`V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>` control.
> > > > +
> > > >  .. tabularcolumns:: |p{2.0cm}|p{4.0cm}|p{11.3cm}|
> > > >
> > > >  .. cssclass:: longtable

-- 
Regards,

Laurent Pinchart

