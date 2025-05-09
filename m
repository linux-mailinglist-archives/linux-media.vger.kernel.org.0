Return-Path: <linux-media+bounces-32174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F86AB1DBF
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 22:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B8B6A044E0
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 20:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E9525EF90;
	Fri,  9 May 2025 20:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="ExOo3fEJ"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5C325DB18
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 20:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746821581; cv=pass; b=mXuvYOvOLk8XQKYuwLEogzkdT3XjV639LsLmewAcbSeKTttppGIJ1ptWAqLdrbrC6qo34lcfJjf2ap7SneGh/pKb2MbXzCxFDA5XbDn9ciHJ+oZJ7hW24fCESBBliff3UBYO79TIzG1JrTZVTcCW67WG1VxUnTAvxNR5Ua/k+TE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746821581; c=relaxed/simple;
	bh=arM617lLm+UAkReLX2UgnjrKBRqix9m3XdO5BRTrSGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ihFJ9dgyU9dBvVwB0+eXdJilHOH5YXcMK52/GS7W7jCFNuyV46zm5W0hOz0eHOepl0oK5AXlE23Z0IlEJvp0/cC3uwEoACjAR0gKtm+1F1hfW1Dx4W5GQFUWuKiLPf/gdOxVOVqszYEyp+H3jxDJYH7VBRg1BGKN+EIax1QcnO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=ExOo3fEJ; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4ZvKtS5G2mz49PvQ;
	Fri,  9 May 2025 23:12:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1746821571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CzKFp18JgFrpIGB+Y8hJmJBFbTdz6VlMqyWwnfXKl5M=;
	b=ExOo3fEJZ7qTZoeGvf+1dIAgtxibum5VJo7yrMNsirkz0FNbNjUXTrYW0iY1BLl/mStKz5
	b1XS5A/lNTvALB0UxypHa1+97gAh2LsVHRUmj3GoqpCfn5vzsVkogHUdmjwzFlSdUzpyR0
	oG1kH+mpr/5+y+uqV7nF6TZRvnUUG4+0D0h11hwSupUXS4Kka2YMxF6qOE7EtFl5ZUVhW2
	XLpwmfgXdC6LXjprr8cU6fp7DPWnoWox1VIaVsPb8RKVGZeO3LncdrmTP3DQeopvWnezR7
	tEwyjFAUBAFZmqQxasnVllGDVMPXU7vTCde3GbogW5Ql4t9od0NQ0/BN5wxCDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1746821571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CzKFp18JgFrpIGB+Y8hJmJBFbTdz6VlMqyWwnfXKl5M=;
	b=MsakMQJBzhGMHud4Si2LCQZX3uD1rXiz1FWPoRfROzZ+rHaYHNpNw9jmhsGdM+mXDgoHDI
	wkEzJnyan4mMCMA2NIc5OmA+PJhn2QcbMO+I2BoGndWdgCWG6d49vtjzJFGGpmu0R1Fbcj
	rgjhQgDz+Q1dWCNkQdghK57OjuOohryL2t9wnmKBXAufjvSnX9vUZs3a8D1lCa8FmVpYiC
	HR6cp+YHLKuW8YtZd+rqOrXMNieiBrjm83prDi0A7l6zv1QBNsOzoEbfc+NxdAydPSIceD
	VfqveWvcw0cRuoxEJrEk74VNVOqEoAeTWzc9omA7C+lFK9BKfog9ib8LMOccig==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1746821571; a=rsa-sha256;
	cv=none;
	b=o7SHySB7vOq0Eopfy5LKxk0gK4JRrOTL9iVbnRSHI5KQ1BYDT7EzqKUhdh2zLyhkK8ULMK
	t8GXfZ8wiMGW/yVoI+8Am3yswF0NYqsnDgUK7aWoX620djh8e7EP2LygaUpasz7OBLenon
	ATAujC+nAsYfFVSvhFqXlJSqi5h3zZzuUg1GFjl0im4ZXUc59tQv4xbeRYSkCmiwLTfSs8
	YZI9aYlFMCF58GuKyod38hwoOkeTE4vNeG/co9PeRxZtPR5HofmdCeGq4PoBusPfksFH4d
	QHe28Xs0SYUqKQxRvCVXmGfYXM+th0EC9GfsD9ATIbaaUbhSgq7QGpNf7A2uOw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 0D7F9634C93;
	Fri,  9 May 2025 23:12:48 +0300 (EEST)
Date: Fri, 9 May 2025 20:12:47 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>, Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Tomasz Figa <tfiga@chromium.org>,
	"Hu,               Jerry W" <jerry.w.hu@intel.com>,
	Steve Cho <stevecho@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Arthur Vinchon <arthur.vinchon@allegrodvt.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Maxime Ripard <mripard@kernel.org>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [PATCH 1/1] media: dt-bindings: Add bindings for camera modules
Message-ID: <aB5hvwhX7DEd_dBF@valkosipuli.retiisi.eu>
References: <20250507081338.53614-1-sakari.ailus@linux.intel.com>
 <jfqlikciprpnope5do3ktoghnpbin3d3ggliivb7csmskdlddl@i4fds3d6qsfx>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jfqlikciprpnope5do3ktoghnpbin3d3ggliivb7csmskdlddl@i4fds3d6qsfx>

Hi Jacopo,

On Thu, May 08, 2025 at 07:00:34PM +0200, Jacopo Mondi wrote:
> Hi Sakari,
>   thanks a lot for the proposal, it will be useful for next week discussion

Thank you for the review!

> 
> On Wed, May 07, 2025 at 11:13:38AM +0300, Sakari Ailus wrote:
> > Add bindings for camera modules to allow telling especially the user space
> > which module is found in the system. Camera modules do not have a device
> > node so this is a property for the camera sensor device node. This allows
> > describing modules that contain a single camera sensor.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > Hi all,
> >
> > Here's the patch to give some advance warning for the camera module
> > discussion. The good thing is that it's quite short.
> >
> > The intent indeed is to address the regular use case where we have a
> > single sensor in a camera module. For cases where we have more, we'll need
> > something else, not based on individual properties. I believe this is
> > still the way to go, to address current issues and for a couple of
> > additional reasons:
> >
> > - Cameras with more than one sensor tend to be collections of camera
> >   modules so this is still relevant in most cases.
> >
> > - It's much simpler to have a single property than begin having new nodes
> >   in DT. In practice such nodes would be a poor fit for DT generally as
> >   they have (few or) no functions.
> >
> > The biggest difficulty is still in module identification. These components
> > tend to be often ignored and the best we have for a module name in that
> > case is random-looking string if even that. Besides DT bindings, we need
> > an additional (git?) tree to describe the modules that have no proper
> > names but it could be also useful for those that do, for instance to
> > include information on lens, field of view, IR filter, photos of the
> > module etc. There is some overlap with what libcamera needs, too.
> >
> > - Sakari
> >
> >  .../bindings/media/camera-module.yaml         | 52 +++++++++++++++++++
> >  .../media/video-interface-devices.yaml        |  3 ++
> >  2 files changed, 55 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/camera-module.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/camera-module.yaml b/Documentation/devicetree/bindings/media/camera-module.yaml
> > new file mode 100644
> > index 000000000000..31b898c8c334
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/camera-module.yaml
> > @@ -0,0 +1,52 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (C) 2025 Intel Corporation
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/camera-module.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Camera modules
> > +
> > +maintainers:
> > +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> > +
> > +description: |
> > +  Camera modules are devices that embed one or more active devices, including
> > +  Camera Sensors, Voice Coil Motor (VCM) and possibly a flash LED as well as
> > +  other passive devices such as lenses and Ultra-Violet (UV) filters. While the
> > +  camera modules themselves have no OF nodes and have generally no module
> > +  specific functions, it still does matter for the software stack as a whole
> > +  which module the devices are a part of.
> > +
> > +  Two properties are used for this, depending on what is known of the module:
> 
> I might have missed a point here.
> 
> 
> > +
> > +  1. The model of the module is known. In this case the name of the module uses
> > +  the format "vendor,model[,version]" where "vendor" is the manufacturer of the
> > +  module and "model" the name of the model. The version part is optional. In
> > +  such cases the property "camera-module-canonical" will be used. If the vendor
> > +  is not known, the "gpio" vendor prefix is used.
> 
> So if the module is "known" it will be described using the above
> specified triplet
> 
> (also, why "gpio" ?)

"gpio" is reserved. Another option would be to reserve a name for an
unknown vendor. I believe DT maintainers will have an opinion on this.

> 
> > +
> > +  2. The model of the module is unknown. In this case, the module has an
> > +  identifier only, and will be described in detail in the camera module
> > +  database. The property "camera-module-casual" is used to denote such modules.
> 
> If the module is "unknown" it will be identified by a numerical id that
> points to the camera module database where it is "described in
> detail". But if an entry is present in the camera module database, then it's not
> really "unkown", right ?
> 
> What is the actual difference between an "unknown" and a "known"
> module then ?

We could use different terms certainly. I wanted to differentiate here
modules the name of which, and hopefully also the manufacturer of which, is
known. Otherwise we can just describe it by various other means that are
all sub-par compared to having a model and the name of the vendor written
on the side of the module.

> 
> 
> > +
> > +  Before including in this binding documentation, all modules shall also be
> > +  documented in add-URL-here.
> 
> If an entry in the camera module database is a requirement can't we
> simply point to that entry using a numerical id like you proposed for
> the "camera-module-casual" property ?

That exactly is the idea.

> 
> Thanks
>   j
> 
> > +
> > +  All camera modules listed below shall have the name of the sensor as well as
> > +  other devices included in the module as DT compatible string mentioned in a
> > +  comment after the enumeration, separated by a whitespace (" ").
> > +
> > +  Always keep the enumeration alphabetically (1) or numerically (2) sorted.
> > +
> > +properties:
> > +  camera-module-canonical:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    enum:
> > +      - "dell,0BF122N3" # onnn,ov01a10
> > +  camera-module-casual:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum:
> > +      - 1 # st,vs6555
> > +
> > +additionalProperties: true
> > diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> > index cf7712ad297c..27fa6711367e 100644
> > --- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> > +++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> > @@ -10,6 +10,9 @@ maintainers:
> >    - Jacopo Mondi <jacopo@jmondi.org>
> >    - Sakari Ailus <sakari.ailus@linux.intel.com>
> >
> > +allOf:
> > +  - $ref: /schemas/media/camera-module.yaml#
> > +
> >  properties:
> >    flash-leds:
> >      $ref: /schemas/types.yaml#/definitions/phandle-array

-- 
Regards,

Sakari Ailus

