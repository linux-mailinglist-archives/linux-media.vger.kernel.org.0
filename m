Return-Path: <linux-media+bounces-8936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 301B789DEE0
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 17:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9F6C299AB7
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 15:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEAC31350E3;
	Tue,  9 Apr 2024 15:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Jb1s6Fp7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CE54AED6
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 15:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712676129; cv=none; b=NW+kC3WwsNxn9eetqs8WUGeaB1KRAaFMRQMC1j69yuOJnHuxkaU9FnxOmqHRfoxcyJXFoUzUtiMfB5VbQJdvnibtIhsjRxI+01qsdijt2A85fHwKhp8gOCvsOHvNzX00PV44Ns70mFuUcOFikhdWxQoBsu4dSiARp56vC8BPwFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712676129; c=relaxed/simple;
	bh=qqgkOv4lZ+svRM0/6sxQP//l5j2vKtLWiCE+5yeeATU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAsQ/G5SpJE9opp2FW7FH8Cre1kOO9dtnc4xrFJsb29dHjOJpa2sx7qXOnReJrpZpZhn61yQMsUJrjJ49NIZk9lOBol84rQNKoXpbYm2BJdmjNH3NE4ptaJtMzXgBKYlZX3MF2wxvCg9s/HA9YENw2g0PFtSRZoEKxXLC2uvmWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Jb1s6Fp7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [62.91.21.5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80B9C8B9;
	Tue,  9 Apr 2024 17:21:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712676078;
	bh=qqgkOv4lZ+svRM0/6sxQP//l5j2vKtLWiCE+5yeeATU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jb1s6Fp7r3U9S5K1tMSDWjMCdmxl2azT6nrBmHAimtU30TL7SJYZoEZ0CEkVo1f3d
	 jnGbHhog3m8MHT4tbGzQzWxJepqKMxHx9F2kIw8P35wDtOKnj3IDoke8B5x+1bwva8
	 NIMLlOiW+tOARBAOD1hW2bZ8/oQYHsgc3IUv0HCY=
Date: Tue, 9 Apr 2024 18:21:50 +0300
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
Message-ID: <20240409152150.GD29553@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-37-sakari.ailus@linux.intel.com>
 <9265171e-b4a7-468e-83b4-51af5e8823dc@ideasonboard.com>
 <ZfFYJTkwld-WIh5Y@kekkonen.localdomain>
 <20240321170308.GK9582@pendragon.ideasonboard.com>
 <ZhVAzBX6udgWZQcs@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZhVAzBX6udgWZQcs@kekkonen.localdomain>

Hi Sakari,

On Tue, Apr 09, 2024 at 01:21:16PM +0000, Sakari Ailus wrote:
> On Thu, Mar 21, 2024 at 07:03:08PM +0200, Laurent Pinchart wrote:
> > On Wed, Mar 13, 2024 at 07:39:17AM +0000, Sakari Ailus wrote:
> > > On Wed, Mar 13, 2024 at 09:34:13AM +0200, Tomi Valkeinen wrote:
> > > > On 13/03/2024 09:25, Sakari Ailus wrote:
> > > > > Add a flag to denote immutable routes, V4L2_SUBDEV_ROUTE_FL_IMMUTABLE.
> > > > > Such routes cannot be changed and they're always active.
> > > > > 
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > ---
> > > > >   Documentation/userspace-api/media/v4l/dev-subdev.rst         | 3 ++-
> > > > >   .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst      | 5 +++++
> > > > >   include/uapi/linux/v4l2-subdev.h                             | 5 +++++
> > > > >   3 files changed, 12 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > > index 08495cc6f4a6..2f2423f676cf 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > > @@ -572,7 +572,8 @@ internal pad always has a single stream only (0).
> > > > >   Routes from an internal source pad to an external source pad are typically not
> > > > >   modifiable but they can be activated and deactivated using the
> > > > >   :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, depending
> > > > > -on driver capabilities.
> > > > > +on driver capabilities. This capatibility is indicated by the
> > > > > +:ref:`V4L2_SUBDEV_ROUTE_FL_IMMUTABLE <v4l2-subdev-routing-flags>` flag.
> > 
> > That's not very clear, it sounds like V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
> > indicates that the route can be enabled/disabled. I'd rewrite this.
> 
> I'll use instead:
> 
> The :ref:`V4L2_SUBDEV_ROUTE_FL_IMMUTABLE <v4l2-subdev-routing-flags>` flag
> indicates that the ``V4L2_SUBDEV_ROUTE_FLAG_ACTIVE`` of the route may not
> be unset.

Sounds good to me.

> > > > >   Interaction between routes, streams, formats and selections
> > > > >   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > > > > index 08b8d17cef3f..cd7735f9104e 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > > > > @@ -139,6 +139,11 @@ Also ``VIDIOC_SUBDEV_S_ROUTING`` may return more route than the user provided in
> > > > >       * - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > > > >         - 0x0001
> > > > >         - The route is enabled. Set by applications.
> > > > > +    * - V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
> > > > > +      - 0x0002
> > > > > +      - The route is immutable. Set by the driver. The
> > > > > +	``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag of an immutable route may not be
> > > > > +	changed.
> > 
> > May not be changed and will always be set ?
> 
> How about "may not be unset"?

Even better :-)

> > > > >   Return Value
> > > > >   ============
> > > > > diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> > > > > index ca543982460c..7e501cb45e4e 100644
> > > > > --- a/include/uapi/linux/v4l2-subdev.h
> > > > > +++ b/include/uapi/linux/v4l2-subdev.h
> > > > > @@ -200,6 +200,11 @@ struct v4l2_subdev_capability {
> > > > >    * on a video node.
> > > > >    */
> > > > >   #define V4L2_SUBDEV_ROUTE_FL_ACTIVE		(1U << 0)
> > > > > +/*
> > > > > + * Is the route immutable. The ACTIVE flag of an immutable route may not be
> > > > > + * changed.
> > > > > + */
> > > > > +#define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		(1U << 1)
> > > > >   /**
> > > > >    * struct v4l2_subdev_route - A route inside a subdev
> > > > 
> > > > Is the route fully immutable? The sink/source stream ID cannot be changed
> > > > (or any new fields we might come up with in the future)?
> > > 
> > > I think the new fields should be considered separately when they're added.
> > > This also applies to the stream IDs, I'll add this to the documentation.
> > > 
> > > The naming of the flag is aligned with MC link flag with a similar purpose.
> > > 
> > > > Hmm, or would a route with different stream IDs be a, well, different
> > > > route...
> > > > 
> > > > The docs here only talk about the ACTIVE flag. Would
> > > > V4L2_SUBDEV_ROUTE_FL_ALWAYS_ACTIVE be a better name, to be more explicit on
> > > > the meaning?
> > > 
> > > I prefer immutable. I wonder what Laurent and Hans think.
> > 
> > I'm fine with either. IMMUTABLE is shorter, if that makes a difference.

-- 
Regards,

Laurent Pinchart

