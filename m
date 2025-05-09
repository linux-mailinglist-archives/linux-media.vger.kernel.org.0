Return-Path: <linux-media+bounces-32176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7C6AB1E6F
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 22:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FCBB4E1787
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 20:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D0B25F794;
	Fri,  9 May 2025 20:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="q72zoR7V"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E8D25E80C
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 20:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746822923; cv=pass; b=CCXCao6KbkeivzEtACGvi3osfq3P9EuzEngBmG0ulrF9uCbGHFHnLJW1XV0HiQXDeKTfDYq4KnEXBMmgx1AEzItwDcpFYNafbXKU7i1YZJ1cNYmot7+xPjyxzm8eTxZ/psAHkZfIKiHH2PACb6ElBKD2zkZAo0wVJqyBZrbhHA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746822923; c=relaxed/simple;
	bh=9oUl82NFQPr+D99Xew2dyOGaKKJLK94H1PwrCS5DecM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BncAQ2c1hdOzFzGRT5o7LKs7AiiI2a+bh6hOlp7W+wbfSW6I4lxMXt7B+434kvhofHePOurIEEY9yHzA2HjIP6JQ+6GPevu6gew7R+ByeLKYst57v77aJe+PT+Jz/0X1vFPDaoQMW+aydSnfrolatUV4alJD6KY1KIY/GOw168c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=q72zoR7V; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4ZvLNG6LF1z49PyG;
	Fri,  9 May 2025 23:35:10 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1746822911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z5WUvQXaLABU7CMtOOL078GN4hiEu127Agh38yhCvkk=;
	b=q72zoR7V93h2yU5rImu1twnGQrzZ0y/APFWVCv6TJ0lL75cCsfEyX5C+I6Vo8jRKODW2iK
	UQyXogNz5a4LXA0jrNaNont6PMPHUqCdZu9mHhmd6ViOlEeISV2f/DxRkaNmfXpHekqdlC
	XUK1QhEYlp+6ZNWRBQBvAq30kjI9mFhhTsEA2hwpduZwNG4Mv9dpNb8n2zQclqxFVNGQ9J
	OEspfXah7GS5JWafCegi5w555ds0hIvKve96jHFgZWkeHccz7agUwA+V79f1QRANPDM0QY
	ww2VdPJdIdAVHwYz7V5CGoi7GHcS95UeqS7yAGSHqwxeapZqgo4vqjvSKCwsmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1746822911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z5WUvQXaLABU7CMtOOL078GN4hiEu127Agh38yhCvkk=;
	b=k/ANObYLLu8PvwjX5omUvAcB4K6zfUDkBKJhNXNiSt7kSx26WqSpw2/7tflzxkid6MIxJU
	n66uAodzsMW4nrdT/Sqe9zjmlVB4c6VQ2onmw3Jav+hOQRnW9AC+KAMIr3gciP6iqzIaNS
	jpr8IDeS6TQhda+Jcdv4PqQKH+dRcAPsC0wpx38BODxe57FymjIg2epYMDnSX73kBGgIhy
	bB3sOcUM56494heGbUBWljgF0sJeeOEXgAMzHCmCPb849hKuzQvrsxp9aLRAs0OkIWwE5m
	smlIaMI5we7yDjYBXmkvvIh9MJtgXkMA/luEmlUTQaf9EFqlBrFdJfpDmSO9GQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1746822911; a=rsa-sha256;
	cv=none;
	b=AGEJ3pZ6ji6FwhQvfaB9XYqFPPcwcLpCq9Qcbe4njzbklwDjXxe3JkFz49olhhe4KsWQSV
	sQgfa9zPXBG4DcrGudefyawquD0s3geXsFkJaKuBTUi6oxcFiLTx8yQR+Htz5Biz/nbRm9
	e75G4fQ07iH5wohHbGKpev8m+0//JBQwPPzCIoa0qe8Lr5ypF1nFIy0fKXlVZulBCbTHem
	/7dH6YyOYFYj8mOMw2r8e3hc6GCkJjgxcd7Arob+gDcjCVezYmI211m3wO+SutUifJWRFR
	XQR49MHFV3lith0TNsJE0RcGeyxcz5pe5z2wUKN2s5QF9Wfs1Q2A41v+n9ZC/A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 69DAF634C93;
	Fri,  9 May 2025 23:35:10 +0300 (EEST)
Date: Fri, 9 May 2025 20:35:10 +0000
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
Message-ID: <aB5m_ofsMcX2Z3q0@valkosipuli.retiisi.eu>
References: <20250507081338.53614-1-sakari.ailus@linux.intel.com>
 <jfqlikciprpnope5do3ktoghnpbin3d3ggliivb7csmskdlddl@i4fds3d6qsfx>
 <aB5hvwhX7DEd_dBF@valkosipuli.retiisi.eu>
 <nvzj54g7zyfh2tl76t6zpnfrntthhduntk4cguw5o26453cjbv@pdzzmlbmefho>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nvzj54g7zyfh2tl76t6zpnfrntthhduntk4cguw5o26453cjbv@pdzzmlbmefho>

Hi Jacopo,

On Fri, May 09, 2025 at 10:24:09PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Fri, May 09, 2025 at 08:12:47PM +0000, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Thu, May 08, 2025 at 07:00:34PM +0200, Jacopo Mondi wrote:
> > > Hi Sakari,
> > >   thanks a lot for the proposal, it will be useful for next week discussion
> >
> > Thank you for the review!
> >
> > >
> > > On Wed, May 07, 2025 at 11:13:38AM +0300, Sakari Ailus wrote:
> > > > Add bindings for camera modules to allow telling especially the user space
> > > > which module is found in the system. Camera modules do not have a device
> > > > node so this is a property for the camera sensor device node. This allows
> > > > describing modules that contain a single camera sensor.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > > Hi all,
> > > >
> > > > Here's the patch to give some advance warning for the camera module
> > > > discussion. The good thing is that it's quite short.
> > > >
> > > > The intent indeed is to address the regular use case where we have a
> > > > single sensor in a camera module. For cases where we have more, we'll need
> > > > something else, not based on individual properties. I believe this is
> > > > still the way to go, to address current issues and for a couple of
> > > > additional reasons:
> > > >
> > > > - Cameras with more than one sensor tend to be collections of camera
> > > >   modules so this is still relevant in most cases.
> > > >
> > > > - It's much simpler to have a single property than begin having new nodes
> > > >   in DT. In practice such nodes would be a poor fit for DT generally as
> > > >   they have (few or) no functions.
> > > >
> > > > The biggest difficulty is still in module identification. These components
> > > > tend to be often ignored and the best we have for a module name in that
> > > > case is random-looking string if even that. Besides DT bindings, we need
> > > > an additional (git?) tree to describe the modules that have no proper
> > > > names but it could be also useful for those that do, for instance to
> > > > include information on lens, field of view, IR filter, photos of the
> > > > module etc. There is some overlap with what libcamera needs, too.
> > > >
> > > > - Sakari
> > > >
> > > >  .../bindings/media/camera-module.yaml         | 52 +++++++++++++++++++
> > > >  .../media/video-interface-devices.yaml        |  3 ++
> > > >  2 files changed, 55 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/camera-module.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/camera-module.yaml b/Documentation/devicetree/bindings/media/camera-module.yaml
> > > > new file mode 100644
> > > > index 000000000000..31b898c8c334
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/camera-module.yaml
> > > > @@ -0,0 +1,52 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +# Copyright (C) 2025 Intel Corporation
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/camera-module.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Camera modules
> > > > +
> > > > +maintainers:
> > > > +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > +
> > > > +description: |
> > > > +  Camera modules are devices that embed one or more active devices, including
> > > > +  Camera Sensors, Voice Coil Motor (VCM) and possibly a flash LED as well as
> > > > +  other passive devices such as lenses and Ultra-Violet (UV) filters. While the
> > > > +  camera modules themselves have no OF nodes and have generally no module
> > > > +  specific functions, it still does matter for the software stack as a whole
> > > > +  which module the devices are a part of.
> > > > +
> > > > +  Two properties are used for this, depending on what is known of the module:
> > >
> > > I might have missed a point here.
> > >
> > >
> > > > +
> > > > +  1. The model of the module is known. In this case the name of the module uses
> > > > +  the format "vendor,model[,version]" where "vendor" is the manufacturer of the
> > > > +  module and "model" the name of the model. The version part is optional. In
> > > > +  such cases the property "camera-module-canonical" will be used. If the vendor
> > > > +  is not known, the "gpio" vendor prefix is used.
> > >
> > > So if the module is "known" it will be described using the above
> > > specified triplet
> > >
> > > (also, why "gpio" ?)
> >
> > "gpio" is reserved. Another option would be to reserve a name for an
> > unknown vendor. I believe DT maintainers will have an opinion on this.
> >
> 
> I see
> 
> > >
> > > > +
> > > > +  2. The model of the module is unknown. In this case, the module has an
> > > > +  identifier only, and will be described in detail in the camera module
> > > > +  database. The property "camera-module-casual" is used to denote such modules.
> > >
> > > If the module is "unknown" it will be identified by a numerical id that
> > > points to the camera module database where it is "described in
> > > detail". But if an entry is present in the camera module database, then it's not
> > > really "unkown", right ?
> > >
> > > What is the actual difference between an "unknown" and a "known"
> > > module then ?
> >
> > We could use different terms certainly. I wanted to differentiate here
> 
> It's certainly not my intention to bikeshed on naming (yet :)
> 
> > modules the name of which, and hopefully also the manufacturer of which, is
> > known. Otherwise we can just describe it by various other means that are
> > all sub-par compared to having a model and the name of the vendor written
> > on the side of the module.
> >
> > >
> > >
> > > > +
> > > > +  Before including in this binding documentation, all modules shall also be
> > > > +  documented in add-URL-here.
> > >
> > > If an entry in the camera module database is a requirement can't we
> > > simply point to that entry using a numerical id like you proposed for
> > > the "camera-module-casual" property ?
> >
> > That exactly is the idea.
> 
> Ok, so the two properties are not mutually exclusive ?

Yes, they are. A module can not both have a known name and not have one at
the same time.

> 
> Because, and that's the thing I'm missing, if you have an entry in a
> database, that entry will almost certainly contain the vendor and the
> model name (which in my understanding means that if an entry exists
> the module is always "known").

This should actually probably be changed in such a way that the module
always needs to be added to the database. There will be more than how to
identify such a module there.

> >
> > >
> > > Thanks
> > >   j
> > >
> > > > +
> > > > +  All camera modules listed below shall have the name of the sensor as well as
> > > > +  other devices included in the module as DT compatible string mentioned in a
> > > > +  comment after the enumeration, separated by a whitespace (" ").
> > > > +
> > > > +  Always keep the enumeration alphabetically (1) or numerically (2) sorted.
> > > > +
> > > > +properties:
> > > > +  camera-module-canonical:
> > > > +    $ref: /schemas/types.yaml#/definitions/string
> > > > +    enum:
> > > > +      - "dell,0BF122N3" # onnn,ov01a10
> > > > +  camera-module-casual:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    enum:
> > > > +      - 1 # st,vs6555
> > > > +
> > > > +additionalProperties: true
> > > > diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> > > > index cf7712ad297c..27fa6711367e 100644
> > > > --- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> > > > @@ -10,6 +10,9 @@ maintainers:
> > > >    - Jacopo Mondi <jacopo@jmondi.org>
> > > >    - Sakari Ailus <sakari.ailus@linux.intel.com>
> > > >
> > > > +allOf:
> > > > +  - $ref: /schemas/media/camera-module.yaml#
> > > > +
> > > >  properties:
> > > >    flash-leds:
> > > >      $ref: /schemas/types.yaml#/definitions/phandle-array
> >

-- 
Regards,

Sakari Ailus

