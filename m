Return-Path: <linux-media+bounces-7527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A53885F39
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 18:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F24E01F26001
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 17:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9106B136984;
	Thu, 21 Mar 2024 17:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lK1k9/6b"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BA713667E
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 17:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711040595; cv=none; b=judR3ZW8JXMoY0VwDc1XXlHWql7qzTAEBZsnOedUkN4YOP4glLkxExmC/x1UY4Mzj2pqfvZMXGyjRPt4jN4PQPluc5LRjqpmXRkMJKBG4XLpOhppe4NserY6GMBjdPhqrjRslpXrWjnmLZpAjgNTDJbteX7+Ssc285qyltfYrUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711040595; c=relaxed/simple;
	bh=7PUDw2n1VYpwlNIsb7aJrV12N+/fwq1+56gbkUqskR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssA5zmMrkqtyCxizTil6n/G2mcOgJx6p0D9mLn2DBL24x9gm3KIXdEhJgAEi9aRG8BGhiOK+xNfeMbfOlgWH4IWR1/0eUaQNpjXy43F+StuNocZ1Pc7ksTE7HAIEMS5MLfIv88wQeEEFvf7rFfXOBQMlwGrEpHOBQOp6jeDGHJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lK1k9/6b; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DC39B1;
	Thu, 21 Mar 2024 18:02:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711040563;
	bh=7PUDw2n1VYpwlNIsb7aJrV12N+/fwq1+56gbkUqskR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lK1k9/6bXy1fVaOuaRdQGibX2Aiksebz/45dl+CyckuECmsGWOTAIQ2PNiX8YeAo8
	 UXAFtyfmpiEOyMARadHC/2Op06qFwqM02zpCw7Nrt4pRxgv6JrQgwj4SoxhY/vXrUc
	 jp0rffUuDGXPqogxD7PVSROW3MfmuncDV/8yWAH0=
Date: Thu, 21 Mar 2024 19:03:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, bingbu.cao@intel.com,
	hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 36/38] media: v4l: Add V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
 sub-device routing flag
Message-ID: <20240321170308.GK9582@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-37-sakari.ailus@linux.intel.com>
 <9265171e-b4a7-468e-83b4-51af5e8823dc@ideasonboard.com>
 <ZfFYJTkwld-WIh5Y@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZfFYJTkwld-WIh5Y@kekkonen.localdomain>

Hello,

On Wed, Mar 13, 2024 at 07:39:17AM +0000, Sakari Ailus wrote:
> On Wed, Mar 13, 2024 at 09:34:13AM +0200, Tomi Valkeinen wrote:
> > On 13/03/2024 09:25, Sakari Ailus wrote:
> > > Add a flag to denote immutable routes, V4L2_SUBDEV_ROUTE_FL_IMMUTABLE.
> > > Such routes cannot be changed and they're always active.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >   Documentation/userspace-api/media/v4l/dev-subdev.rst         | 3 ++-
> > >   .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst      | 5 +++++
> > >   include/uapi/linux/v4l2-subdev.h                             | 5 +++++
> > >   3 files changed, 12 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > index 08495cc6f4a6..2f2423f676cf 100644
> > > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > @@ -572,7 +572,8 @@ internal pad always has a single stream only (0).
> > >   Routes from an internal source pad to an external source pad are typically not
> > >   modifiable but they can be activated and deactivated using the
> > >   :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, depending
> > > -on driver capabilities.
> > > +on driver capabilities. This capatibility is indicated by the
> > > +:ref:`V4L2_SUBDEV_ROUTE_FL_IMMUTABLE <v4l2-subdev-routing-flags>` flag.

That's not very clear, it sounds like V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
indicates that the route can be enabled/disabled. I'd rewrite this.

> > >   Interaction between routes, streams, formats and selections
> > >   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > > index 08b8d17cef3f..cd7735f9104e 100644
> > > --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > > @@ -139,6 +139,11 @@ Also ``VIDIOC_SUBDEV_S_ROUTING`` may return more route than the user provided in
> > >       * - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > >         - 0x0001
> > >         - The route is enabled. Set by applications.
> > > +    * - V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
> > > +      - 0x0002
> > > +      - The route is immutable. Set by the driver. The
> > > +	``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag of an immutable route may not be
> > > +	changed.

May not be changed and will always be set ?

> > >   Return Value
> > >   ============
> > > diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> > > index ca543982460c..7e501cb45e4e 100644
> > > --- a/include/uapi/linux/v4l2-subdev.h
> > > +++ b/include/uapi/linux/v4l2-subdev.h
> > > @@ -200,6 +200,11 @@ struct v4l2_subdev_capability {
> > >    * on a video node.
> > >    */
> > >   #define V4L2_SUBDEV_ROUTE_FL_ACTIVE		(1U << 0)
> > > +/*
> > > + * Is the route immutable. The ACTIVE flag of an immutable route may not be
> > > + * changed.
> > > + */
> > > +#define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		(1U << 1)
> > >   /**
> > >    * struct v4l2_subdev_route - A route inside a subdev
> > 
> > Is the route fully immutable? The sink/source stream ID cannot be changed
> > (or any new fields we might come up with in the future)?
> 
> I think the new fields should be considered separately when they're added.
> This also applies to the stream IDs, I'll add this to the documentation.
> 
> The naming of the flag is aligned with MC link flag with a similar purpose.
> 
> > Hmm, or would a route with different stream IDs be a, well, different
> > route...
> > 
> > The docs here only talk about the ACTIVE flag. Would
> > V4L2_SUBDEV_ROUTE_FL_ALWAYS_ACTIVE be a better name, to be more explicit on
> > the meaning?
> 
> I prefer immutable. I wonder what Laurent and Hans think.

I'm fine with either. IMMUTABLE is shorter, if that makes a difference.

-- 
Regards,

Laurent Pinchart

