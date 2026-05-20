Return-Path: <linux-media+bounces-62337-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0N/EAyLgDWrb4QUAu9opvQ
	(envelope-from <linux-media+bounces-62337-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:24:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6DC591D4C
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AF593545D21
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEFE346FA1;
	Wed, 20 May 2026 15:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iKl8cYfM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765143403F0;
	Wed, 20 May 2026 15:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779292595; cv=none; b=BIMBSUBuG/kUiSEu/OJxtAX/5ACdN46eNlwEKYeqT0gBZzXv6DHWD36r6AsM26aUDV2dyy1mlJIXxRswrxZCgxvpuYhhACW4CShh/HgFJ91Vi/YS00ua2BM0Yp/ZkKrg85UHDcxGJ96iwEkMyzL2q6106vkX3P56uJXrmYMQxy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779292595; c=relaxed/simple;
	bh=K1OLdncdSg1THSvTn+xrQefeXYQWeEzS6c2njTthU3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tqs4ssQKLvmlRZdO5J53oCkHXuBRCP+Tdprc/1/5xwWkDrNtECaxkb1iRameDpvhEDTw2T//tV6ZSsA+niI4Zx4foc7IB3rQMOhf+qzup8q+gKjgXnz6zsjPzDPOrPyDYq0Nc2Fkg2m7py4V3GAJu53DrXZ/z0gC7IOWkGHIC88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iKl8cYfM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703A91F000E9;
	Wed, 20 May 2026 15:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779292594;
	bh=LyLGZ6SHlqwWj37h3IZFU92VVyYHsz9rH7coDDyQ2zY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iKl8cYfMCqKRDSI2WFrQaAw5nxF2ddWAQNzHzoTcY9xVFrFahbNMkSXVYCfeQyTl5
	 vwib8cF4WWzCbPH8PhzALVZK7uFbinGhYc6SuAHA2UNSVbWqrlrv9kGgqnuLFzAUZE
	 gvGtIrzglz9e9gNnZEdME7fq6vEdrgHPY7BaQdMXRzGQaTlOXM43wb0zVXVbJ8Rw9A
	 Hs4P5c+IVqWc25A0wNdZbrjcaiRF5bsKGJ5LAOdQWNu8hGYP5UdMBVs6TWS5hLIi59
	 tjw66V7kXROU4hT8T6Pg09HZOgwy2Yeq22DT3tZv0PS/e2+Xit9hoB/eU7iC1ZMWB1
	 D/Eojp6WbcHBQ==
Date: Wed, 20 May 2026 16:56:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Lachlan Michael <Lachlan.Michael@sony.com>,
	Ryuichi Tadano <Ryuichi.Tadano@sony.com>,
	Kengo Hayasaka <Kengo.Hayasaka@sony.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add Sony IMX678
Message-ID: <20260520-crusher-species-cf707a9a8b46@spud>
References: <20260520-imx678-v3-0-8b5f9676486e@ideasonboard.com>
 <20260520-imx678-v3-1-8b5f9676486e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lCbMfOv3j2Ws0v29"
Content-Disposition: inline
In-Reply-To: <20260520-imx678-v3-1-8b5f9676486e@ideasonboard.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62337-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5F6DC591D4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--lCbMfOv3j2Ws0v29
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 05:17:25PM +0200, Jai Luthra wrote:
> Sony IMX678 is an 8.4 Megapixel (3856x2180) CMOS sensor, that can output
> pixels over MIPI CSI-2 bus. Add bindings for it.
>=20
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
> Changes in v3:
> - Use `reset-gpios`, mentioning the sensor XCLR acts like RESETN, instead=
 of `xclr-gpios`
> Changes in v2:
> - Add per-variant compatibles for mono and colour, alongside the
>   generic fallback, so the variant can be declared without powering
>   the sensor at probe.
> - Rename reset GPIO to xclr as that's what it's called in the
>   datasheet, and how it behaves
> - Reference the generic video interface devices schema and switch to
>   unevaluatedProperties.
> - Drop "link-frequencies: true"
> - Drop the T: entry for media.git from MAINTAINERS.
> ---
>  .../devicetree/bindings/media/i2c/sony,imx678.yaml | 129 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   6 +
>  2 files changed, 135 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml=
 b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> new file mode 100644
> index 000000000000..d85745ddbefd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> @@ -0,0 +1,129 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2026 Ideas on Board Oy
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX678 Sensor
> +
> +maintainers:
> +  - Jai Luthra <jai.luthra@ideasonboard.com>
> +
> +description:
> +  Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid=
-state
> +  image sensor with a square pixel array and 8.40M (3856x2180) effective=
 pixels.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sony,imx678
> +      - sony,imx678-aamr
> +      - sony,imx678-aaqr
> +    description:
> +      The IMX678 sensor exists in a colour variant (IMX678-AAQR) and a m=
ono
> +      variant (IMX678-AAMR). An internal register can also help detect t=
his at
> +      runtime.

I don't understand the compatibles here. If aaqr is tge colour variant,
and aamr is mono, what does the suffix-less compatible represent?

Your commit message says:
> - Add per-variant compatibles for mono and colour, alongside the
>   generic fallback, so the variant can be declared without powering
>   the sensor at probe.
But that's not what you have permitted in the binding, you've described
3 different variants and using the one with no suffix as a fallback will
produce validation errors.

I think this probably is
pw-bot: changes-requested

Thanks,
Conor.

--lCbMfOv3j2Ws0v29
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag3ZrQAKCRB4tDGHoIJi
0lCtAQCSqyEOEO5cyauW06oSd71ClHJyyt5xT9vEYRX/J2P+5gEA/oht/dLQVbcM
iRu536TcVnV42p5GdkSSXyC0hcir2As=
=kH6c
-----END PGP SIGNATURE-----

--lCbMfOv3j2Ws0v29--

