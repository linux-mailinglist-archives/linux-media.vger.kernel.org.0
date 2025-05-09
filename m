Return-Path: <linux-media+bounces-32177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F392AB1E77
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 22:44:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D64DFA22B8D
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 20:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1301D25F78E;
	Fri,  9 May 2025 20:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Jt84HZLE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31C9242D8E
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 20:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746823463; cv=none; b=bqddWPV1RgUVgAOpkMFtLdQcH/yX/kOWdaBVdliD9o87i+QDkfh8jnYXbo8gwJ8x9Uy7Y00VTdjsuYTN+tbFU0BRP4LHaCO0Tw6k5T0fMkUwfRSHHahTYtlUpSIPrlAs7Zk29ePxk+5s3a2joy6kS+QxuQCMU/gdJkqk/k9P+X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746823463; c=relaxed/simple;
	bh=Oa36RdNdBMakpxbPAp0Rx5XSjj13gkjMRI3y6IzAWx4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=R66VJV2vLdziDVLHpyKgPqZThVX/0XQqiSUMNOMFxf+vl3TyN25mJs1SpcWdnYZ9Zvyi6+GkZ3BshiUCB5zF53yys4EwVzMUQIOMxdw9mRJzlrt8T37NA2dU9DGk24ijq3qaSzvpPN6QMAoPKzvxvJRmdwipxaIZULKTUXMxOHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Jt84HZLE reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BBBD69CE;
	Fri,  9 May 2025 22:44:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746823445;
	bh=Oa36RdNdBMakpxbPAp0Rx5XSjj13gkjMRI3y6IzAWx4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Jt84HZLEjrDjRdD70elWkwfp6prgfMk+KEfl2EeMibSCDx8o/oQdKY2USKQ+4LIDg
	 +Apc32HzQOiNByGS83lYWASGogOu1Ip9xLVl52bW4FNNS4SjrWjexqJr242Fd+jvVN
	 /oAKI8BYlRC215YcJTyeLmgyD8l7/mrQQRWa2E3M=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250507081338.53614-1-sakari.ailus@linux.intel.com>
References: <20250507081338.53614-1-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/1] media: dt-bindings: Add bindings for camera modules
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>, Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Tomasz Figa <tfiga@chromium.org>,
	"Hu,               Jerry W" <jerry.w.hu@intel.com>,
	Steve Cho <stevecho@chromium.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Arthur Vinchon <arthur.vinchon@allegrodvt.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Jackson Lee <"jack son.lee"@chipsnmedia.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Maxime Ripard <mripard@kernel.org>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Naushir Patuck <naush@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Fri, 09 May 2025 21:44:15 +0100
Message-ID: <174682345593.819131.7462679299915630940@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Hi Sakari,

Quoting Sakari Ailus (2025-05-07 09:13:38)
> Add bindings for camera modules to allow telling especially the user space
> which module is found in the system. Camera modules do not have a device
> node so this is a property for the camera sensor device node. This allows
> describing modules that contain a single camera sensor.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Hi all,
>=20
> Here's the patch to give some advance warning for the camera module
> discussion. The good thing is that it's quite short.
>=20

Thanks for starting this! Definitely something I would like to see a
solution for indeed.

> The intent indeed is to address the regular use case where we have a
> single sensor in a camera module. For cases where we have more, we'll need
> something else, not based on individual properties. I believe this is
> still the way to go, to address current issues and for a couple of
> additional reasons:
>=20
> - Cameras with more than one sensor tend to be collections of camera
>   modules so this is still relevant in most cases.
>=20
> - It's much simpler to have a single property than begin having new nodes
>   in DT. In practice such nodes would be a poor fit for DT generally as
>   they have (few or) no functions.
>=20
> The biggest difficulty is still in module identification. These components
> tend to be often ignored and the best we have for a module name in that
> case is random-looking string if even that. Besides DT bindings, we need
> an additional (git?) tree to describe the modules that have no proper
> names but it could be also useful for those that do, for instance to
> include information on lens, field of view, IR filter, photos of the
> module etc. There is some overlap with what libcamera needs, too.
>=20

One aspect that jumps to my mind here - is how do we handle variations
of modules?

For instance I have two IMX335 modules from Arducam - which are
otherwise identical except for different lenses with different
field-of-view.

Do we need more properties (later?) to express the different
configuration options of the module?


At some point I would love to be able to describe a 'module' as the
whole component including a VCM for instance - in a way that can be
abstracted as something that could be connected to a 'port' (see [0],
[1]) where it would be helpful to be able to group/abstract a movable
component and identify the full camera module in a way that doesn't have
to be duplicated in every platform configuration that it could be
connected.

[0] https://www.konsulko.com/wp-content/uploads/2016/09/portable-device-tre=
e-connector.pdf
[1] https://lore.kernel.org/all/1464986273-12039-2-git-send-email-pantelis.=
antoniou@konsulko.com/

--
Kieran


> - Sakari
>=20
>  .../bindings/media/camera-module.yaml         | 52 +++++++++++++++++++
>  .../media/video-interface-devices.yaml        |  3 ++
>  2 files changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/camera-module=
.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/camera-module.yaml b=
/Documentation/devicetree/bindings/media/camera-module.yaml
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
> +  Camera modules are devices that embed one or more active devices, incl=
uding
> +  Camera Sensors, Voice Coil Motor (VCM) and possibly a flash LED as wel=
l as
> +  other passive devices such as lenses and Ultra-Violet (UV) filters. Wh=
ile the
> +  camera modules themselves have no OF nodes and have generally no module
> +  specific functions, it still does matter for the software stack as a w=
hole
> +  which module the devices are a part of.
> +
> +  Two properties are used for this, depending on what is known of the mo=
dule:
> +
> +  1. The model of the module is known. In this case the name of the modu=
le uses
> +  the format "vendor,model[,version]" where "vendor" is the manufacturer=
 of the
> +  module and "model" the name of the model. The version part is optional=
. In
> +  such cases the property "camera-module-canonical" will be used. If the=
 vendor
> +  is not known, the "gpio" vendor prefix is used.
> +
> +  2. The model of the module is unknown. In this case, the module has an
> +  identifier only, and will be described in detail in the camera module
> +  database. The property "camera-module-casual" is used to denote such m=
odules.
> +
> +  Before including in this binding documentation, all modules shall also=
 be
> +  documented in add-URL-here.
> +
> +  All camera modules listed below shall have the name of the sensor as w=
ell as
> +  other devices included in the module as DT compatible string mentioned=
 in a
> +  comment after the enumeration, separated by a whitespace (" ").
> +
> +  Always keep the enumeration alphabetically (1) or numerically (2) sort=
ed.
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
> diff --git a/Documentation/devicetree/bindings/media/video-interface-devi=
ces.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.=
yaml
> index cf7712ad297c..27fa6711367e 100644
> --- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> @@ -10,6 +10,9 @@ maintainers:
>    - Jacopo Mondi <jacopo@jmondi.org>
>    - Sakari Ailus <sakari.ailus@linux.intel.com>
> =20
> +allOf:
> +  - $ref: /schemas/media/camera-module.yaml#
> +
>  properties:
>    flash-leds:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> --=20
> 2.39.5
>

