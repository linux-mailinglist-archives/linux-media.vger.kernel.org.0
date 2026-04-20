Return-Path: <linux-media+bounces-59166-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4L9CLPRn5mnBvwEAu9opvQ
	(envelope-from <linux-media+bounces-59166-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 19:52:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A306432379
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 19:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 503E7330DE19
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC16534C121;
	Mon, 20 Apr 2026 16:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8IJMzY4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F13D34B194;
	Mon, 20 Apr 2026 16:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702033; cv=none; b=VYShwmpdQD9B/i2Pe8Ts1281cP+vsUsMGcdF0SVh7Modza6gPWolv9Re3Ht/9Fdj0FU5k4/memRn02qZNwbuyoIaGTkYXEQybmjR0y9uxYde5B1SULaI+A7Ly5KZz2IaSri1Mieqb5A9tthVJGocbtWBwTgGqAcUg56XoASpVgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702033; c=relaxed/simple;
	bh=yaeFUyTaIJ4lGxWeYfj5hPkiGnv9xe79xqk0yZ+2orU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SkHwG5vJlZWlo7IVFuJe2clbG8ym+QwbxcLxXk9LrWjXKgjoJyyeeE3IVQ+J7Y3R9+CmW6VRwKBVrw819eiXjs2/7diLwbh43zR5Jr1Uf+N/sxsckCnaVhZUVBrpSsXS82ldQd/zgX/Nj8yoNMUkxcAISOoAYHha7IyUjA9q0uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8IJMzY4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B91C19425;
	Mon, 20 Apr 2026 16:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776702032;
	bh=yaeFUyTaIJ4lGxWeYfj5hPkiGnv9xe79xqk0yZ+2orU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g8IJMzY42uvZ/EbymiqFTBlh037CdGGWNvAKTerhbc7iwDpjeOJ5fRMDuW//4FXY/
	 PiRy/Jr3FbYhBatJucQ7E8GBF7Iw7Wmt7i6DmG1AIzztJde24UXGsWUblSS+2egk6l
	 xKPD61qMGQvfa9nHnIZCBnhqWm13BGSxZRjr8b0KLbg2/7WFZ1MKXkKNM6E0hJwH2M
	 JPMfwHuczW3q/eozKrW9+3491hPXOdBkmbhjNs0udRmsYCc3AKqgzDr83A8etw1vZd
	 GvuYDbVFXKbVXW38gbEGdtyJ2aBuxNLMPN/6nTIVkTgSYaUoAkJjMY+DMrKvH0XUjP
	 q8j5nJrNVqn5A==
Date: Mon, 20 Apr 2026 17:20:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: leds: Document TI LM3560 Synchronous
 Boost Flash Driver
Message-ID: <20260420-affection-ferocious-e28cd29f360a@spud>
References: <20260419093412.40796-1-clamor95@gmail.com>
 <20260419093412.40796-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o3ULyILVhK1A+1eP"
Content-Disposition: inline
In-Reply-To: <20260419093412.40796-2-clamor95@gmail.com>
X-Spamd-Result: default: False [3.24 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59166-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	NEURAL_SPAM(0.00)[0.551];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.53:email];
	TAGGED_RCPT(0.00)[linux-media,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,0.0.0.0:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 0A306432379
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--o3ULyILVhK1A+1eP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 12:34:08PM +0300, Svyatoslav Ryhel wrote:
> Document TI LM3560 Synchronous Boost Flash Driver used for camera flash
> LEDs.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/leds/ti,lm3560.yaml   | 131 ++++++++++++++++++
>  1 file changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/leds/ti,lm3560.yaml b/Docu=
mentation/devicetree/bindings/leds/ti,lm3560.yaml
> new file mode 100644
> index 000000000000..c6c553ad23f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/ti,lm3560.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI LM3560 Synchronous Boost Flash Driver
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +description:
> +  The LM3560 is a 2-MHz fixed frequency synchronous boost converter with=
 two
> +  1000-mA constant current drivers for high-current white LEDs. The dual=
 high-
> +  side current sources allow for grounded cathode LED operation and can =
be
> +  tied together for providing flash currents at up to 2 A through a sing=
le LED.
> +  An adaptive regulation method ensures the current for each LED remains=
 in
> +  regulation and maximizes efficiency.
> +
> +allOf:
> +  - $ref: /schemas/leds/common.yaml
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,lm3559
> +      - ti,lm3560

What differentiates these devices to the point that fallback compatibles
are not suitable?

Cheers,
Conor.

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  enable-gpios:
> +    description: GPIO connected to the HWEN pin.
> +    maxItems: 1
> +
> +  vin-supply:
> +    description: Supply connected to the IN line.
> +
> +  flash-max-timeout-us:
> +    minimum: 32000
> +    maximum: 1024000
> +    default: 32000
> +
> +  ti,peak-current-microamp:
> +    description:
> +      The LM3560 features 4 selectable current limits 1.6A, 2.3A, 3A, an=
d 3.6A.
> +      When the current limit is reached, the LM3560 stops switching for =
the
> +      remainder of the switching cycle.
> +    enum: [16000000, 23000000, 30000000, 36000000]
> +    default: 16000000
> +
> +patternProperties:
> +  '^led@[01]$':
> +    description: LED control bank nodes.
> +    $ref: /schemas/leds/common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        description: Control bank selection (0 =3D bank A, 1 =3D bank B).
> +        maximum: 1
> +
> +      flash-max-microamp:
> +        minimum: 62500
> +        maximum: 1000000
> +
> +      led-max-microamp:
> +        minimum: 31250
> +        maximum: 250000
> +
> +    required:
> +      - reg
> +      - flash-max-microamp
> +      - led-max-microamp
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        led-controller@53 {
> +            compatible =3D "ti,lm3560";
> +            reg =3D <0x53>;
> +
> +            enable-gpios =3D <&gpio 28 GPIO_ACTIVE_HIGH>;
> +            vin-supply =3D <&vdd_3v3_sys>;
> +
> +            flash-max-timeout-us =3D <1024000>;
> +            ti,peak-current-microamp =3D <16000000>;
> +
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            led@0 {
> +                reg =3D <0>;
> +
> +                label =3D "white::flash";
> +                linux,default-trigger =3D "flash";
> +
> +                flash-max-microamp =3D <562500>;
> +                led-max-microamp =3D <156250>;
> +            };
> +
> +            led@1 {
> +                reg =3D <1>;
> +
> +                label =3D "yellow::flash";
> +                linux,default-trigger =3D "flash";
> +
> +                flash-max-microamp =3D <562500>;
> +                led-max-microamp =3D <156250>;
> +            };
> +        };
> +    };
> --=20
> 2.51.0
>=20

--o3ULyILVhK1A+1eP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZSTAAKCRB4tDGHoIJi
0jCeAP4ncU6FO0TPrY2+FBTkOwE/aJ3G3mFldSmpIB+kliL4qgEAupeLwO678p7X
hKMnWnq949Wv73JCkKOCJjwQACcoNwU=
=bKOC
-----END PGP SIGNATURE-----

--o3ULyILVhK1A+1eP--

