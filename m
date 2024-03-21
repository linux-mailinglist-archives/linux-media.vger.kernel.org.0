Return-Path: <linux-media+bounces-7532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5B2885FE8
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 18:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2DD1B232DA
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 17:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D6A131E21;
	Thu, 21 Mar 2024 17:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UvN/0jCs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD2D28E7
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 17:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711042696; cv=none; b=HsvyNURO6w3e0r7KpjkyRVIj8jkNTYWFZk8G7pViGw1m6ZyBSjBvgOf315Adxm2r7UZtDG8/5z+pojnTyTCZo4Kqdant3SkVFpcyB3KMoKVGWIpPmUN4lQ8gEMPCTCJrxumNnCubUo1uxmk0JlqqRjG72Vf7oRnQXCgGYz3S/rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711042696; c=relaxed/simple;
	bh=G2uAhBrEpq8scx8bjBKt9PR83feLHiC7IUOZ2B/jeXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XdtZ7Gy4Xc3/2RqvGnJAj8R5DngO9KR27SvaMM/+zWkL8alalKH0DS16VcIypasp2AL/8IRMqKVOiQINjILFF98esOQAqRSq1naKA0LWIxW1z0eesYU6gLD6dCzyyLbT5MMGzbuqW/PYm+P+oRS6bDfD+jLXzzqwDmpFR8kEa/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UvN/0jCs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 695192B3;
	Thu, 21 Mar 2024 18:37:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711042664;
	bh=G2uAhBrEpq8scx8bjBKt9PR83feLHiC7IUOZ2B/jeXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UvN/0jCsXnaS2hrsVq06v9ibjIRsfWybEovfSUv3PwSrY0zm3EnUeIYS5PuA7UyKj
	 y6lClymDDCPTPz7YTbd9aWVAEIWUnhzVymr+aIfbRh8jp/rKjV9NkZ2ORqbpKMl4S6
	 X7GwgVLydTkgu16YM7jRLBZjl5dirArll5wbiER4=
Date: Thu, 21 Mar 2024 19:38:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 03/38] media: uapi: Add generic serial metadata mbus
 formats
Message-ID: <20240321173809.GO9582@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-4-sakari.ailus@linux.intel.com>
 <20240319225948.GG8501@pendragon.ideasonboard.com>
 <ZfsNZU5Ewpp-0WZ2@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZfsNZU5Ewpp-0WZ2@kekkonen.localdomain>

Hi Sakari,

On Wed, Mar 20, 2024 at 04:23:01PM +0000, Sakari Ailus wrote:
> On Wed, Mar 20, 2024 at 12:59:48AM +0200, Laurent Pinchart wrote:
> > On Wed, Mar 13, 2024 at 09:24:41AM +0200, Sakari Ailus wrote:
> > > Add generic serial metadata mbus formats. These formats describe data
> > > width and packing but not the content itself. The reason for specifying
> > > such formats is that the formats as such are fairly device specific but
> > > they are still handled by CSI-2 receiver drivers that should not be aware
> > > of device specific formats. What makes generic metadata formats possible
> > > is that these formats are parsed by software only, after capturing the
> > > data to system memory.
> > > 
> > > Also add a definition for "Data unit" to cover what is essentially a pixel
> > > but is not image data.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../userspace-api/media/glossary.rst          |   9 +
> > >  .../media/v4l/subdev-formats.rst              | 258 ++++++++++++++++++
> > >  include/uapi/linux/media-bus-format.h         |   9 +
> > >  3 files changed, 276 insertions(+)
> > > 
> > > diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
> > > index ef0ab601b5bf..7078141894c5 100644
> > > --- a/Documentation/userspace-api/media/glossary.rst
> > > +++ b/Documentation/userspace-api/media/glossary.rst
> > > @@ -25,6 +25,15 @@ Glossary
> > >  
> > >  	See :ref:`cec`.
> > >  
> > > +.. _media-glossary-data-unit:
> > > +
> > > +    Data unit
> > > +
> > > +	Unit of data transported by a bus. On parallel buses, the data unit
> > > +	consists of one or more related samples while on serial buses the data
> > > +	unit is logical. If the data unit is image data, it may also be called a
> > > +	pixel.
> > 
> > I'm pretty sure nobody will be able to understand what this means, but I
> > don't have a better proposal at the moment.
> > 
> > > +
> > >      Device Driver
> > >  	Part of the Linux Kernel that implements support for a hardware
> > >  	component.
> > > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > index eb3cd20b0cf2..cbd475f7cae9 100644
> > > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > @@ -8306,3 +8306,261 @@ The following table lists the existing metadata formats.
> > >  	both sides of the link and the bus format is a fixed
> > >  	metadata format that is not configurable from userspace.
> > >  	Width and height will be set to 0 for this format.
> > > +
> > > +Generic Serial Metadata Formats
> > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > +
> > > +Generic serial metadata formats are used on serial buses where the actual data
> > > +content is more or less device specific but the data is transmitted and received
> > > +by multiple devices that do not process the data in any way, simply writing
> > > +it to system memory for processing in software at the end of the pipeline.
> > > +
> > > +The more specific variant describing the actual data is used on the internal
> > > +source pad of the originating sub-device.
> > 
> > Maybe this paragraph would be best added in the patch that adds the
> > specific metadata formats, you could then mention one of them as an
> > example:
> > 
> > The exact format of the data generated by the device is reported on the
> > internal source pad of the originating sub-device, using one of the more
> > specific metadata formats such as MEDIA_BUS_FMT_CCS_EMBEDDED.
> 
> I'd really like to get rid of the "internal source" pads as the naming is
> really confusing (it's present still in this version but not in many
> locations). They're sink pads after all, so I'd call them such. In a few
> locations there's text that explains they do represent sources of data
> within the sub-device itself.

I thought we had agreed to use the term "internal sink pad", but I saw a
patch in this series that consistently makes use of "internal source
pad". Both are confusing for different reasons, but regardless of which
one we pick (that discussion belongs to the other patch that documents
the internal source pads), please make sure to use the same terms
consistently through the series in v9.

> > > +
> > > +"b" in an array cell signifies a byte of data, followed by the number of the bit
> > 
> > s/bit$/byte/
> 
> Uh, yes.
> 
> > > +and finally the bit number in subscript. "X" indicates a padding bit.
> > 
> > We use a lower-case x in pixfmt-rgb.rst, I would do the same here. We
> > also use single quotes there, turning "b" and "x" into 'b' and 'x'.
> 
> This is documentation, not C source code where we'd want to denote a single
> character. Double quotes should thus be used instead.

We seem to use single quotes in format documentations, I'd continue
doing so for consistency.

> I'll switch to lower case X.
> 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thank you!

-- 
Regards,

Laurent Pinchart

