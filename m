Return-Path: <linux-media+bounces-32051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9C7AB00CE
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 19:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 770B2172476
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 17:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3B822422D;
	Thu,  8 May 2025 17:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WWiTaIDb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B26B17A2E2
	for <linux-media@vger.kernel.org>; Thu,  8 May 2025 17:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746723643; cv=none; b=huw1LaLr0hNh1dZ1DzhWeKLAUbLuQiyierzL46UMw9GGqN9uE8EsIbkIjgMXi81IFmzhTYb/qLf1WZzrJfdz5/FVW1qfPrmrNlxHF51rMzqOZo/TuSyShLJxB9MeY3ABX4di1NRvQ9ZR1R+RPHLEE6eXUowHi1E+ZAiUuhuMb7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746723643; c=relaxed/simple;
	bh=qPo7IYaO4+1qtaFcri4VNUmvzmOO8Gh33e5EAVi2ax8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qz7+BtkdUCIRGefTPEMlzltRnIj28FBv8GBPaNaCmtCEbI4klVv2vKI50AB9lo4At/pgg7784XXMfrRUERC6DKq7bSRDL7n4RnpQ2m9dtupHpVwCZL+E0JZCtpucLy25G3+PhXt6GdViMFTCXjwUP38LwvxC9D91FUyq2YcfbcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WWiTaIDb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:861:3a80:3300:7c3b:c7bf:b733:fa1b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09AB622A;
	Thu,  8 May 2025 19:00:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746723625;
	bh=qPo7IYaO4+1qtaFcri4VNUmvzmOO8Gh33e5EAVi2ax8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WWiTaIDb/3DRy6U7HZECy63V9Gkjl7xKfjF6EJb3b4lwDFnnIT0hvVed6swIkKlHg
	 bhrgDoRWINOF/4A7XMHJAgvqsgcfJnJ7UtOvmslh21YI1cf9Sskl40Xgp0E0jsWLJ6
	 hD0zyP+OOGQPR9vqG/VrGwvebdY1NOBp0HjISntM=
Date: Thu, 8 May 2025 19:00:34 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sean Young <sean@mess.org>, Ricardo Ribalda <ribalda@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
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
Message-ID: <jfqlikciprpnope5do3ktoghnpbin3d3ggliivb7csmskdlddl@i4fds3d6qsfx>
References: <20250507081338.53614-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250507081338.53614-1-sakari.ailus@linux.intel.com>

Hi Sakari,
  thanks a lot for the proposal, it will be useful for next week discussion

On Wed, May 07, 2025 at 11:13:38AM +0300, Sakari Ailus wrote:
> Add bindings for camera modules to allow telling especially the user space
> which module is found in the system. Camera modules do not have a device
> node so this is a property for the camera sensor device node. This allows
> describing modules that contain a single camera sensor.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Hi all,
>
> Here's the patch to give some advance warning for the camera module
> discussion. The good thing is that it's quite short.
>
> The intent indeed is to address the regular use case where we have a
> single sensor in a camera module. For cases where we have more, we'll need
> something else, not based on individual properties. I believe this is
> still the way to go, to address current issues and for a couple of
> additional reasons:
>
> - Cameras with more than one sensor tend to be collections of camera
>   modules so this is still relevant in most cases.
>
> - It's much simpler to have a single property than begin having new nodes
>   in DT. In practice such nodes would be a poor fit for DT generally as
>   they have (few or) no functions.
>
> The biggest difficulty is still in module identification. These components
> tend to be often ignored and the best we have for a module name in that
> case is random-looking string if even that. Besides DT bindings, we need
> an additional (git?) tree to describe the modules that have no proper
> names but it could be also useful for those that do, for instance to
> include information on lens, field of view, IR filter, photos of the
> module etc. There is some overlap with what libcamera needs, too.
>
> - Sakari
>
>  .../bindings/media/camera-module.yaml         | 52 +++++++++++++++++++
>  .../media/video-interface-devices.yaml        |  3 ++
>  2 files changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/camera-module.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/camera-module.yaml b/Documentation/devicetree/bindings/media/camera-module.yaml
> new file mode 100644
> index 000000000000..31b898c8c334
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/camera-module.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2025 Intel Corporation
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/camera-module.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Camera modules
> +
> +maintainers:
> +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> +
> +description: |
> +  Camera modules are devices that embed one or more active devices, including
> +  Camera Sensors, Voice Coil Motor (VCM) and possibly a flash LED as well as
> +  other passive devices such as lenses and Ultra-Violet (UV) filters. While the
> +  camera modules themselves have no OF nodes and have generally no module
> +  specific functions, it still does matter for the software stack as a whole
> +  which module the devices are a part of.
> +
> +  Two properties are used for this, depending on what is known of the module:

I might have missed a point here.


> +
> +  1. The model of the module is known. In this case the name of the module uses
> +  the format "vendor,model[,version]" where "vendor" is the manufacturer of the
> +  module and "model" the name of the model. The version part is optional. In
> +  such cases the property "camera-module-canonical" will be used. If the vendor
> +  is not known, the "gpio" vendor prefix is used.

So if the module is "known" it will be described using the above
specified triplet

(also, why "gpio" ?)

> +
> +  2. The model of the module is unknown. In this case, the module has an
> +  identifier only, and will be described in detail in the camera module
> +  database. The property "camera-module-casual" is used to denote such modules.

If the module is "unknown" it will be identified by a numerical id that
points to the camera module database where it is "described in
detail". But if an entry is present in the camera module database, then it's not
really "unkown", right ?

What is the actual difference between an "unknown" and a "known"
module then ?


> +
> +  Before including in this binding documentation, all modules shall also be
> +  documented in add-URL-here.

If an entry in the camera module database is a requirement can't we
simply point to that entry using a numerical id like you proposed for
the "camera-module-casual" property ?

Thanks
  j

> +
> +  All camera modules listed below shall have the name of the sensor as well as
> +  other devices included in the module as DT compatible string mentioned in a
> +  comment after the enumeration, separated by a whitespace (" ").
> +
> +  Always keep the enumeration alphabetically (1) or numerically (2) sorted.
> +
> +properties:
> +  camera-module-canonical:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - "dell,0BF122N3" # onnn,ov01a10
> +  camera-module-casual:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 1 # st,vs6555
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> index cf7712ad297c..27fa6711367e 100644
> --- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> @@ -10,6 +10,9 @@ maintainers:
>    - Jacopo Mondi <jacopo@jmondi.org>
>    - Sakari Ailus <sakari.ailus@linux.intel.com>
>
> +allOf:
> +  - $ref: /schemas/media/camera-module.yaml#
> +
>  properties:
>    flash-leds:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> --
> 2.39.5
>

