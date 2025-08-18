Return-Path: <linux-media+bounces-40185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 59955B2AF8E
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 19:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0EAA34E3C4A
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 17:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843961F9F47;
	Mon, 18 Aug 2025 17:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQFek8Zu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0A42773D5;
	Mon, 18 Aug 2025 17:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755538615; cv=none; b=QRHn3cjiJG52LG8f1AiJcy7mAFS5+5p4nThw0gR+SZXyb30ZvH/x4LtMSkR8II6paBjcKCGpsFv9Tvjl2aCUgBAPV/bv2IZwC/WgZWVPIfzMYVlkXQPUV1raP2hgqYYVHgj+OLUEvHZBpLIGogaqYMRkgJlfOos9mdVS79DLfos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755538615; c=relaxed/simple;
	bh=zy8qZ/0raRN5pU9PRc/zcz5zd56bOTgcONsamXbv1vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KLmDk2Mxv/TVjRHEablhKviR33977s9UnYvhtSuSTtX39z+DtXilEFRnVbypPC3dMW39vtaYQHwZ+rgoxJ0anZeyIvErStS0nF6SurZDv7uvWLZ+nb4U6p+aQSeUyLi3cRwt6t9BrO/yjco/yBq1YtfjBcY7hFrniJiGEk/ZUOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQFek8Zu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F88C4CEEB;
	Mon, 18 Aug 2025 17:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755538614;
	bh=zy8qZ/0raRN5pU9PRc/zcz5zd56bOTgcONsamXbv1vw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hQFek8ZuT7qJuRvTluaqQbDxeQaWh+QGNcVvJqyQR5vgqCd22x1IiSqTyVDnH7ggL
	 N26K7ML9rroO15Xrp8zD4k3yEEdhz8Sv24mbJdH4T9X/iDMd/G3ZUzyjvp28C0L7tC
	 NAJX3L6CFaQPudjQtgocnVGSRpc4tqFOm1pwFG98PH9LHEyrqp76ukZCXThV+QmtSh
	 jU/bi3WEAiFGiLet+UPTI4P3KbFV3oeK4AZPHgIyGyF4zA4E5uCvFO+2b7YWowNXcJ
	 Wxit9XM5Y2yDXmZ8C+sXt60j0DRr/F4yXCNs/qFz2ysxVENQuO1ZI72sVYUYv2V0im
	 vreVRP0IGQELg==
Date: Mon, 18 Aug 2025 18:36:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Aliaksandr Smirnou <support@pinefeat.co.uk>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: Pinefeat cef168 lens control board
Message-ID: <20250818-stark-unsocial-96d32a311cab@spud>
References: <20250817130549.7766-1-support@pinefeat.co.uk>
 <20250817130549.7766-2-support@pinefeat.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WAPcxQZYUAf3vNvK"
Content-Disposition: inline
In-Reply-To: <20250817130549.7766-2-support@pinefeat.co.uk>


--WAPcxQZYUAf3vNvK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 17, 2025 at 02:05:48PM +0100, Aliaksandr Smirnou wrote:
> Add the Device Tree schema and examples for the Pinefeat cef168 lens
> control board. This board interfaces Canon EF & EF-S lenses with
> non-Canon camera bodies, enabling electronic control of focus and
> aperture via V4L2.
>=20

> Power supply is derived from fixed supplies via connector or GPIO
> header. Therefore, the driver does not manage any regulator, so
> representing any supply in the binding is redundant.

Wut? This doesn't make sense, you have supplies so they should be
documented. The fact that they're shared with a bunch of other things on
the SBC you're aiming the product at doesn't matter. What if someone
doesn't use this sensor with an RPi and there is a dedicated regulator?

> Signed-off-by: Aliaksandr Smirnou <support@pinefeat.co.uk>

Is that actually your email address?

> ---
>  .../bindings/media/i2c/pinefeat,cef168.yaml   | 48 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  MAINTAINERS                                   |  6 +++
>  3 files changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/pinefeat,=
cef168.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.=
yaml b/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
> new file mode 100644
> index 000000000000..80cdff40d175
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2025 Pinefeat LLP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/pinefeat,cef168.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Pinefeat cef168 lens driver
> +
> +maintainers:
> +  - Aliaksandr Smirnou <support@pinefeat.co.uk>
> +
> +description: |
> +  Pinefeat produces an adapter designed to interface between
> +  Canon EF & EF-S lenses and non-Canon camera bodies, incorporating
> +  features for electronic focus and aperture adjustment. The cef168
> +  circuit board, included with the adapter, provides a software
> +  programming interface that allows control of lens focus and
> +  aperture positions.

> This driver enables controlling the lens
> +  focus and aperture via the V4L2 (Video4Linux2) API.

Don't mention drivers in bindings, how linux handles things is not
relevant to a hardware description.

--WAPcxQZYUAf3vNvK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKNksgAKCRB4tDGHoIJi
0oiVAQDIhmvM/qeC3+QbyUGPcerZa1G+oGxpulI1GfWDgH7f1QD/RnBXc0VzmUxo
7KqXUEFi9WAVZG36xCWPJncrhWGu2g8=
=L0ff
-----END PGP SIGNATURE-----

--WAPcxQZYUAf3vNvK--

