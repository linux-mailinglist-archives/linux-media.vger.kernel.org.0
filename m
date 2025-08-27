Return-Path: <linux-media+bounces-41196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22711B386E0
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 17:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCA207C2EC1
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 15:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19E72C08A1;
	Wed, 27 Aug 2025 15:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rsCyzL81"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22BD1E519
	for <linux-media@vger.kernel.org>; Wed, 27 Aug 2025 15:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756309523; cv=none; b=WLIHOP+ls4yRiGpPsdPgciOmKNCw7WQNhql2ShTGXmpC0zTS8OcfUa5aMfekYDsFkPhRShMMzpuMpMZbF1fcRgKKjP/AeHH4AD/vwnjo3X7U5T+5PX/0CQeD0xQJfX9uGuEYm5vjJLDit0AbQBqaoHnnsWp4hMsCc3VcxzEElS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756309523; c=relaxed/simple;
	bh=ze4D0jzJD+Jedzg65qJgJGJkofhVSjmElXrkZxmtqlU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=DX/n5/UVQ/sz/dAMXDOKuV2KppYeflHTrP0W3n8/bYQ/o7395KWARUjEf576e8WxkmF+jP0KzSHuCC6Jui13EsyVKyYP4gJXUbg7DGOBbi+/+59BSrWW+DoBNnQJxUtIg1rwiAthlu+sJtqcRk+KkkB7RbpvW8JlZpTG50jQWwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rsCyzL81 reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F35EC1809;
	Wed, 27 Aug 2025 17:44:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756309454;
	bh=ze4D0jzJD+Jedzg65qJgJGJkofhVSjmElXrkZxmtqlU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rsCyzL81/WZy8lqHRF3gwP0R4/jPPEuWqD+81df/q5I1S+h/+XlC7obTGQUAfMhAY
	 XH87feWcD7UmlqESdzs6yFTL/dqyDJah39GMKW7ycdw0lRVBNzTORbu4KU0lC96Gwb
	 NxhCHEPzF2VGEZ1VhLnRsD3NZpBoblzKfO4qz2Io=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aCsceUYURNc8_C7E@kekkonen.localdomain>
References: <20250507081338.53614-1-sakari.ailus@linux.intel.com> <174682345593.819131.7462679299915630940@ping.linuxembedded.co.uk> <aCsceUYURNc8_C7E@kekkonen.localdomain>
Subject: Re: [PATCH 1/1] media: dt-bindings: Add bindings for camera modules
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, Ricardo Ribalda <ribalda@chromium.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Alain Volmat <alain.volmat@foss.st.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Daniel Almeida <daniel.almeida@collabora.com>, Michael Tretter <m.tretter@pengutronix.de>, Tomasz Figa <tfiga@chromium.org>, "Hu,               Jerry W" <jerry.w.hu@intel.com>, Steve Cho <stevecho@chromium.org>, Kevin Hilman <khilman@baylibre.com>, Paul Kocialkowski <paulk@sys-base.io>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Hans Verkuil <hverkuil@xs4all.nl>, Arthur Vinchon <arthur.vinchon@allegrodvt.com>, Marco Felsch <m.felsch@pengu
 tronix.de>, Jackson Lee <jackson.lee@chipsnmedia.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, Hans de Goede <hdegoede@redhat.com>, Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, Maxime Ripard <mripard@kernel.org>, Stefan Klug <stefan.klug@ideasonboard.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Naushir Patuck <naush@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 27 Aug 2025 16:45:14 +0100
Message-ID: <175630951460.336274.7975232635118445740@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Hi Sakari,

Following up here because I think we already need to distinguish between
modules - presumably at the DT/overlay level.

Quoting Sakari Ailus (2025-05-19 12:56:41)
> Hi Kieran,
>=20
> On Fri, May 09, 2025 at 09:44:15PM +0100, Kieran Bingham wrote:
> > Hi Sakari,
> >=20
> > Quoting Sakari Ailus (2025-05-07 09:13:38)
> > > Add bindings for camera modules to allow telling especially the user =
space
> > > which module is found in the system. Camera modules do not have a dev=
ice
> > > node so this is a property for the camera sensor device node. This al=
lows
> > > describing modules that contain a single camera sensor.
> > >=20
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > > Hi all,
> > >=20
> > > Here's the patch to give some advance warning for the camera module
> > > discussion. The good thing is that it's quite short.
> > >=20
> >=20
> > Thanks for starting this! Definitely something I would like to see a
> > solution for indeed.
> >=20
> > > The intent indeed is to address the regular use case where we have a
> > > single sensor in a camera module. For cases where we have more, we'll=
 need
> > > something else, not based on individual properties. I believe this is
> > > still the way to go, to address current issues and for a couple of
> > > additional reasons:
> > >=20
> > > - Cameras with more than one sensor tend to be collections of camera
> > >   modules so this is still relevant in most cases.
> > >=20
> > > - It's much simpler to have a single property than begin having new n=
odes
> > >   in DT. In practice such nodes would be a poor fit for DT generally =
as
> > >   they have (few or) no functions.
> > >=20
> > > The biggest difficulty is still in module identification. These compo=
nents
> > > tend to be often ignored and the best we have for a module name in th=
at
> > > case is random-looking string if even that. Besides DT bindings, we n=
eed
> > > an additional (git?) tree to describe the modules that have no proper
> > > names but it could be also useful for those that do, for instance to
> > > include information on lens, field of view, IR filter, photos of the
> > > module etc. There is some overlap with what libcamera needs, too.
> > >=20
> >=20
> > One aspect that jumps to my mind here - is how do we handle variations
> > of modules?
> >=20
> > For instance I have two IMX335 modules from Arducam - which are
> > otherwise identical except for different lenses with different
> > field-of-view.
> >=20
> > Do we need more properties (later?) to express the different
> > configuration options of the module?
>=20
> I think I'd document these as two different modules. Arducam SKU
> identifiers are probably best to be used as models here and I presume SKU
> is different between your modules?
>=20
> >=20
> >=20
> > At some point I would love to be able to describe a 'module' as the
> > whole component including a VCM for instance - in a way that can be
> > abstracted as something that could be connected to a 'port' (see [0],
> > [1]) where it would be helpful to be able to group/abstract a movable
> > component and identify the full camera module in a way that doesn't have
> > to be duplicated in every platform configuration that it could be
> > connected.
>=20
> This would likely require having a node for the module, too. It's a
> heavy-weight solution compared to just a property (or a few).
>=20
> How commonly do you swap lenses outside R&D in practice?

Hard to determine that - but there are already multiple instances of
different vendor modules with the same sensor - but a different lens
configuration. I'd like to compare these to see if the common parts
could be de-duplciated.

In [2] I've posted two more tuning files for libcamera for the IMX335
and IMX415. Does specifying the vendor and SKU there match what you
would expect with this? Or should we make it a direct match on the
strings you propose below?


[2] https://lists.libcamera.org/pipermail/libcamera-devel/2025-August/05240=
9.html

> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - "dell,0BF122N3" # onnn,ov01a10

So I guess for the Arducam modules I've posted this would be
	"arducam,B0568"

(Do we expect these to be case sensitive? Or insensitive?)

> +  camera-module-casual:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 1 # st,vs6555



> >=20
> > [0] https://www.konsulko.com/wp-content/uploads/2016/09/portable-device=
-tree-connector.pdf
> > [1] https://lore.kernel.org/all/1464986273-12039-2-git-send-email-pante=
lis.antoniou@konsulko.com/
>=20
> --=20
> Kind regards,
>=20
> Sakari Ailus

