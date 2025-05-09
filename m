Return-Path: <linux-media+bounces-32175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCACAB1E5B
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 22:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 134AD188ABB8
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 20:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B96D262FF2;
	Fri,  9 May 2025 20:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fc6Xh/vU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B206262FC2
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 20:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746822261; cv=none; b=CL7zYdshfzCnAPc/0yjyue9lw2N8amXsW31ALwg5wAx6M+rZrP2olUwSuIpDMGTJREe0dqyFG8z861jrhuOyheR//iun+shp9X40pN/twEmSwZOud47zC1DsKOhhpFERkOnh5aXzoyXjkJGGZ+J+6JzxSaQLrpAT6vxwmFYImA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746822261; c=relaxed/simple;
	bh=pLoZ2+6A+3dK9RzQ+hd4NiQ9Wu56dMkAQCAQWe8DSsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xyp5ma4MRZKRF7NVSRijDv5uDeauNA4Di7urj2KfVGp2YjrPBuf8NmpJcHvecgWY5rAhVzkN6Rgufxi6OcwUvrbdrPPC5qvlUSbhDkF9H6fWBMtuxRZNEi72BgJzIJ0toqmVmSZc/KJBrIb8/pnMYUblvSt4S+54lAfwdGgrEGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fc6Xh/vU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:861:3a80:3300:7c3b:c7bf:b733:fa1b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 016DE9CE;
	Fri,  9 May 2025 22:23:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746822239;
	bh=pLoZ2+6A+3dK9RzQ+hd4NiQ9Wu56dMkAQCAQWe8DSsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fc6Xh/vUgrcNIpWshYTzbhKPHnA5pkGV0B58ieSHc/p57JAprZntofadmkqf0iYRO
	 pTw2u1rs1a37QYxqG/LGOCu+NaNX6aUZFpFANbNUEpWruwxxQ9/UMW+MrLqI7tOYs1
	 OUHxYR4syOVjTynT8bEaMsCk0Gm3IFJ7lxK9sOKk=
Date: Fri, 9 May 2025 22:24:09 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sean Young <sean@mess.org>, Ricardo Ribalda <ribalda@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Michael Tretter <m.tretter@pengutronix.de>, Tomasz Figa <tfiga@chromium.org>, 
	"Hu,               Jerry W" <jerry.w.hu@intel.com>, Steve Cho <stevecho@chromium.org>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Kevin Hilman <khilman@baylibre.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Arthur Vinchon <arthur.vinchon@allegrodvt.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Jackson Lee <jackson.lee@chipsnmedia.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, Hans de Goede <hdegoede@redhat.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Maxime Ripard <mripard@kernel.org>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [PATCH 1/1] media: dt-bindings: Add bindings for camera modules
Message-ID: <nvzj54g7zyfh2tl76t6zpnfrntthhduntk4cguw5o26453cjbv@pdzzmlbmefho>
References: <20250507081338.53614-1-sakari.ailus@linux.intel.com>
 <jfqlikciprpnope5do3ktoghnpbin3d3ggliivb7csmskdlddl@i4fds3d6qsfx>
 <aB5hvwhX7DEd_dBF@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aB5hvwhX7DEd_dBF@valkosipuli.retiisi.eu>

Hi Sakari

On Fri, May 09, 2025 at 08:12:47PM +0000, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Thu, May 08, 2025 at 07:00:34PM +0200, Jacopo Mondi wrote:
> > Hi Sakari,
> >   thanks a lot for the proposal, it will be useful for next week discussion
>
> Thank you for the review!
>
> >
> > On Wed, May 07, 2025 at 11:13:38AM +0300, Sakari Ailus wrote:
> > > Add bindings for camera modules to allow telling especially the user space
> > > which module is found in the system. Camera modules do not have a device
> > > node so this is a property for the camera sensor device node. This allows
> > > describing modules that contain a single camera sensor.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > > Hi all,
> > >
> > > Here's the patch to give some advance warning for the camera module
> > > discussion. The good thing is that it's quite short.
> > >
> > > The intent indeed is to address the regular use case where we have a
> > > single sensor in a camera module. For cases where we have more, we'll need
> > > something else, not based on individual properties. I believe this is
> > > still the way to go, to address current issues and for a couple of
> > > additional reasons:
> > >
> > > - Cameras with more than one sensor tend to be collections of camera
> > >   modules so this is still relevant in most cases.
> > >
> > > - It's much simpler to have a single property than begin having new nodes
> > >   in DT. In practice such nodes would be a poor fit for DT generally as
> > >   they have (few or) no functions.
> > >
> > > The biggest difficulty is still in module identification. These components
> > > tend to be often ignored and the best we have for a module name in that
> > > case is random-looking string if even that. Besides DT bindings, we need
> > > an additional (git?) tree to describe the modules that have no proper
> > > names but it could be also useful for those that do, for instance to
> > > include information on lens, field of view, IR filter, photos of the
> > > module etc. There is some overlap with what libcamera needs, too.
> > >
> > > - Sakari
> > >
> > >  .../bindings/media/camera-module.yaml         | 52 +++++++++++++++++++
> > >  .../media/video-interface-devices.yaml        |  3 ++
> > >  2 files changed, 55 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/camera-module.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/camera-module.yaml b/Documentation/devicetree/bindings/media/camera-module.yaml
> > > new file mode 100644
> > > index 000000000000..31b898c8c334
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/camera-module.yaml
> > > @@ -0,0 +1,52 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +# Copyright (C) 2025 Intel Corporation
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/camera-module.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Camera modules
> > > +
> > > +maintainers:
> > > +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> > > +
> > > +description: |
> > > +  Camera modules are devices that embed one or more active devices, including
> > > +  Camera Sensors, Voice Coil Motor (VCM) and possibly a flash LED as well as
> > > +  other passive devices such as lenses and Ultra-Violet (UV) filters. While the
> > > +  camera modules themselves have no OF nodes and have generally no module
> > > +  specific functions, it still does matter for the software stack as a whole
> > > +  which module the devices are a part of.
> > > +
> > > +  Two properties are used for this, depending on what is known of the module:
> >
> > I might have missed a point here.
> >
> >
> > > +
> > > +  1. The model of the module is known. In this case the name of the module uses
> > > +  the format "vendor,model[,version]" where "vendor" is the manufacturer of the
> > > +  module and "model" the name of the model. The version part is optional. In
> > > +  such cases the property "camera-module-canonical" will be used. If the vendor
> > > +  is not known, the "gpio" vendor prefix is used.
> >
> > So if the module is "known" it will be described using the above
> > specified triplet
> >
> > (also, why "gpio" ?)
>
> "gpio" is reserved. Another option would be to reserve a name for an
> unknown vendor. I believe DT maintainers will have an opinion on this.
>

I see

> >
> > > +
> > > +  2. The model of the module is unknown. In this case, the module has an
> > > +  identifier only, and will be described in detail in the camera module
> > > +  database. The property "camera-module-casual" is used to denote such modules.
> >
> > If the module is "unknown" it will be identified by a numerical id that
> > points to the camera module database where it is "described in
> > detail". But if an entry is present in the camera module database, then it's not
> > really "unkown", right ?
> >
> > What is the actual difference between an "unknown" and a "known"
> > module then ?
>
> We could use different terms certainly. I wanted to differentiate here

It's certainly not my intention to bikeshed on naming (yet :)

> modules the name of which, and hopefully also the manufacturer of which, is
> known. Otherwise we can just describe it by various other means that are
> all sub-par compared to having a model and the name of the vendor written
> on the side of the module.
>
> >
> >
> > > +
> > > +  Before including in this binding documentation, all modules shall also be
> > > +  documented in add-URL-here.
> >
> > If an entry in the camera module database is a requirement can't we
> > simply point to that entry using a numerical id like you proposed for
> > the "camera-module-casual" property ?
>
> That exactly is the idea.

Ok, so the two properties are not mutually exclusive ?

Because, and that's the thing I'm missing, if you have an entry in a
database, that entry will almost certainly contain the vendor and the
model name (which in my understanding means that if an entry exists
the module is always "known").
>
> >
> > Thanks
> >   j
> >
> > > +
> > > +  All camera modules listed below shall have the name of the sensor as well as
> > > +  other devices included in the module as DT compatible string mentioned in a
> > > +  comment after the enumeration, separated by a whitespace (" ").
> > > +
> > > +  Always keep the enumeration alphabetically (1) or numerically (2) sorted.
> > > +
> > > +properties:
> > > +  camera-module-canonical:
> > > +    $ref: /schemas/types.yaml#/definitions/string
> > > +    enum:
> > > +      - "dell,0BF122N3" # onnn,ov01a10
> > > +  camera-module-casual:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum:
> > > +      - 1 # st,vs6555
> > > +
> > > +additionalProperties: true
> > > diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> > > index cf7712ad297c..27fa6711367e 100644
> > > --- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> > > +++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> > > @@ -10,6 +10,9 @@ maintainers:
> > >    - Jacopo Mondi <jacopo@jmondi.org>
> > >    - Sakari Ailus <sakari.ailus@linux.intel.com>
> > >
> > > +allOf:
> > > +  - $ref: /schemas/media/camera-module.yaml#
> > > +
> > >  properties:
> > >    flash-leds:
> > >      $ref: /schemas/types.yaml#/definitions/phandle-array
>
> --
> Regards,
>
> Sakari Ailus
>

