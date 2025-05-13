Return-Path: <linux-media+bounces-32406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8374DAB57B4
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 16:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09C6019E5421
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 14:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4A51D2F42;
	Tue, 13 May 2025 14:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1zlyvKX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA711C701A;
	Tue, 13 May 2025 14:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148127; cv=none; b=gAoHXd8lwTlpyycAMXYPpDRCZTKa+Nkqw9GW7TQlgux0mZOARxmmLUuyMBSRg4ruloK/qtF+2jpBEjNVKWiAYXCRSma2z8TEd9KkuzM2RU0TPGto8szQMm3m/3VryZs918q+z0c9tz7deQ0l0SJ49z44WcFbLVH7//AQCVpxoAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148127; c=relaxed/simple;
	bh=Pyya90VltnrLC0B716Je0xNS94BZ+Qszup8DumxnMIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCWmDZ4Y3633emJSldlVdM3IfZ514n8XrGCgWlf7JtI2WrbsYrHt/2w2at4yJ7KUAueF/si4D3PR8aaMw5I14f4jZPmr38YXD0OAT05Yyb5PIjEx+oPA3vy2yz8HHGwoWpe86sPdFWfXAFAcmcEXUs6e4jQUrdlxndX1gIsvXNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1zlyvKX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42CFFC4CEE4;
	Tue, 13 May 2025 14:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747148127;
	bh=Pyya90VltnrLC0B716Je0xNS94BZ+Qszup8DumxnMIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W1zlyvKXRzhR/IYM6vzjs+fbY48Hz5qdZLLSGgn1TqDTYUSFAHLY4V2aRDfsvHNMG
	 1ijUBTgtLiLnN7rL5KOU35SPi7cQuWH4h0dACKBFvjFMEZTmWasw8xyRuXEqU4c8l8
	 Zm6Hwz8MJCbnAp8eaZOikKOee9bJvCjrfDhLXAYRlzQE0vHNw10LVeWqr+l2kac7tO
	 AvX7AUuctKzSx09inTCdGRADssuXh9xlbNLM1y6kSMmGjqZ8flLDsONOjfEDxIHQyN
	 9iLdR+oSooj7u+aYc2iJHrMmeALQXLIbjTQ4cK/VLyPajrf51dUT8LxpkAdrb5U0EL
	 bLow5fI/yl3GA==
Date: Tue, 13 May 2025 15:55:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
Cc: Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RESEND PATCH 3/5] dt-bindings: media: allegrodvt: add decoder
 dt-bindings for Gen3 IP
Message-ID: <20250513-earache-cesspool-6d08e2cfb73a@spud>
References: <20250513083609.328422-1-yassine.ouaissa@allegrodvt.com>
 <20250513083609.328422-4-yassine.ouaissa@allegrodvt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2i/8aIx86r3PFwP0"
Content-Disposition: inline
In-Reply-To: <20250513083609.328422-4-yassine.ouaissa@allegrodvt.com>


--2i/8aIx86r3PFwP0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 10:35:48AM +0200, Yassine Ouaissa wrote:
> Add compatible for video decoder on allegrodvt Gen 3 IP.
>=20
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> ---
>  .../bindings/media/allegrodvt,al300-vdec.yaml | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allegrodvt,al=
300-vdec.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/allegrodvt,al300-vde=
c.yaml b/Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
> new file mode 100644
> index 000000000000..4218892d6950
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/allegrodvt,al300-vdec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allegro DVT Video IP Decoder Gen 3
> +
> +maintainers:
> +  - Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
> +
> +description:
> +  The al300-vdec represents the latest generation of Allegro DVT IP deco=
ding
> +  technology, offering significant advancements over its predecessors.
> +  This new decoder features enhanced processing capabilities with improv=
ed
> +  throughput and reduced latency.
> +
> +  Communication between the host driver software and the MCU is implemen=
ted
> +  through a specialized mailbox interface mechanism. This mailbox system
> +  provides a structured channel for exchanging commands, parameters, and
> +  status information between the host CPU and the MCU controlling the co=
dec
> +  engines.
> +
> +properties:
> +  compatible:
> +    const: allegrodvt,al300-vdec

Other than the vendor prefix, this looks mostly okay - from the
perspective of someone unaware of this type of this device.
Just some minor comments from me.

> +
> +  reg:
> +    items:
> +      - description: The registers

The registers for what exactly?

> +      - description: the MCU APB register

0x80000 is rather a large space for a single register!

> +
> +  reg-names:
> +    items:
> +      - const: regs
> +      - const: apb
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: MCU clock
> +
> +  clock-names:
> +    items:
> +      - const: mcu_clk

s/_clk//, since that part is obvious.

> +
> +  memory-region:
> +    maxItems: 1
> +
> +  firmware-name:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: False
> +
> +examples:
> +  - |
> +    axi {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        ald300@a0120000 {

The standard node name here I believe is "video-decoder".

> +            compatible =3D "allegrodvt,al300-vdec";
> +            reg =3D <0 0xa0120000 0 0x10000>,
> +                  <1 0x80000000 0 0x80000>;

Please keep things consistently in hex here please.

> +            reg-names =3D "regs", "apb";
> +            interrupts =3D <0 96 4>;

If this is 3 different interrupts, format as "<0>, <96>, <4>".
Otherwise, consider importing whatever header provides definitions for
these things.

> +            clocks =3D <&mcu_clock_dec>;
> +            clock-names =3D "mcu_clk";
> +            firmware-name =3D "al300_vdec.fw";
> +        };
> +    };
> +
> +...
> --=20
> 2.30.2
>=20

--2i/8aIx86r3PFwP0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCNdWAAKCRB4tDGHoIJi
0pMqAQCxvmLsenCJpwac0iKVtQVMEpWT6ORRwFiX8dorea9EdwEAma4QR2QByMgU
6q2ezL9VUKNRkqw2Ug7xP+MFydgZUAM=
=55nJ
-----END PGP SIGNATURE-----

--2i/8aIx86r3PFwP0--

