Return-Path: <linux-media+bounces-63950-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q7a/B876ImorgAEAu9opvQ
	(envelope-from <linux-media+bounces-63950-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 18:35:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7717C649D27
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 18:35:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kG6cau87;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63950-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63950-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB63C31A274D
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 16:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A5040682D;
	Fri,  5 Jun 2026 16:19:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA1C3D0C03;
	Fri,  5 Jun 2026 16:19:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780676370; cv=none; b=kFh+hCAu0qaioNn2L4UP2wnBmmFcnMhw5ixGtjDaDbCdb/ZseVAnw0Ck7x4itFu3YwkJXYUgyoOCGiyGIpLvLbGuMBIp5mpKw/xI7FjvSQNuC/opj3xAa7ltCjEK4xHfLreV1oO+VsnwWO6YaBHxir7s0/xBF7hYrMSBniRjN88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780676370; c=relaxed/simple;
	bh=quUvbrbQS6eQO0S4eiPyUkmNpOyPkr78jFdRIWWJaYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksaTJRlPjTlT9wNQxX3ZwQeT0EfRG/blT7Yt3bdsk99cOoofooZbcX9v686Lqj93y8ODoJOl0DFJX0bm/rlGokPEDGHRTme1Y+6MX7Vix2h4P4/7jK2V0kex5lw7zIopEaMgwhSb5zpu+J2a9fBjhQ/seucvPYXeG+rrV27Tomo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kG6cau87; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F741F00893;
	Fri,  5 Jun 2026 16:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780676369;
	bh=6XPdyKlrYLRF2LuR4cgLG7ew10Pc1XXxtdKbYANh+8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kG6cau87cGrPuJrY9MBw4/CBgkK3+TLK7blYTt3Oje9b3woxotsMTDYKcg0UkYaik
	 PlQ9tcoJzpMBXjLWF7fZTVcBRY19+f21wiC61mGkTCS/ODxTzxmkILyeC6ma+LH/YE
	 khMDFDLB2WD34WkNNNkOsuQCAVhVFIpQnUvnZ2pz+lALGDLaqKhHfH6ENzK+KujjJe
	 Tt75tSRIy9T50EoSFebyaEkS2GyyybKJL9CTJW9CYLfdRj6UgecpRTzo0S7VE/8MKu
	 3uIwhDnt2G8oBt5JUJ5SUlGA/u5cIBRUBW1ZYLY+Aon1oso+vrlNR/0nnXdP9kYNEg
	 /ivi+adxrkZwQ==
Date: Fri, 5 Jun 2026 17:19:25 +0100
From: Conor Dooley <conor@kernel.org>
To: github.com@herrie.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: add aptina,mt9m113
Message-ID: <20260605-idly-geek-23c0459b2445@spud>
References: <20260605-submit-media-mt9m113-v2-0-de1cc807f4cf@herrie.org>
 <20260605-submit-media-mt9m113-v2-1-de1cc807f4cf@herrie.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ja9qjb5S9bUXbDpX"
Content-Disposition: inline
In-Reply-To: <20260605-submit-media-mt9m113-v2-1-de1cc807f4cf@herrie.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63950-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:laurent.pinchart@ideasonboard.com,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,spud:mid,herrie.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7717C649D27


--Ja9qjb5S9bUXbDpX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2026 at 05:38:55AM +0200, Herman van Hazendonk via B4 Relay=
 wrote:
> From: Herman van Hazendonk <github.com@herrie.org>
>=20
> Add the binding for the Aptina (now ON Semiconductor) MT9M113 1.3
> megapixel SoC image sensor with on-die ISP. The chip is used as the
> front (user-facing) camera on the HP TouchPad tablet and connects
> to the host SoC over MIPI CSI-2.
>=20
> The binding describes the chip's i2c address, optional reset and
> standby GPIOs, the per-supply regulators (VDD, VDD_IO, VDDA), the
> external clock input, and the CSI-2 endpoint pads exposed via the
> "port" subnode.
>=20
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  .../bindings/media/i2c/aptina,mt9m113.yaml         | 127 +++++++++++++++=
++++++
>  1 file changed, 127 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.y=
aml b/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml
> new file mode 100644
> index 000000000000..7fa7cb2fedf9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/aptina,mt9m113.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aptina MT9M113 1.3 Megapixel CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Herman van Hazendonk <github.com@herrie.org>
> +
> +description: |-
> +  The Aptina MT9M113 is a 1.3 Megapixel CMOS digital image sensor with
> +  1280x1024 active pixels. It supports dual context operation:
> +  Context A (640x480 preview mode with binning) and Context B (1280x1024
> +  capture mode). It is programmable through an I2C interface and outputs
> +  image data over a 1-lane MIPI CSI-2 connection.
> +
> +properties:
> +  compatible:
> +    const: aptina,mt9m113
> +
> +  reg:
> +    description: I2C device address
> +    enum:
> +      - 0x3c
> +      - 0x48
> +      - 0x5d
> +
> +  clocks:
> +    description: EXTCLK clock signal (24 MHz typical)
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description:
> +      Core digital voltage supply, 1.8V
> +
> +  vddio-supply:
> +    description:
> +      I/O digital voltage supply, 1.8V or 2.8V
> +
> +  vaa-supply:
> +    description:
> +      Analog voltage supply, 2.8V
> +
> +  reset-gpios:
> +    description: |-

Neither this or powerdown should need the |-, there's no formatting here
that needs preservation.

> +      Reference to the GPIO connected to the RESET_BAR pin, if any (acti=
ve
> +      low).
> +
> +  powerdown-gpios:
> +    description: |-
> +      Reference to the GPIO connected to the STANDBY/PWDN pin, if any (a=
ctive
> +      high). When asserted, the sensor enters low-power standby mode.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          bus-type:
> +            const: 4
> +            description: MIPI CSI-2 D-PHY
> +
> +          link-frequencies: true
> +          remote-endpoint: true
> +          data-lanes:
> +            minItems: 1

This minItems shouldn't be needed, the maxItems should suffice.

> +            maxItems: 1
> +
> +        required:
> +          - bus-type
> +          - link-frequencies
> +          - data-lanes
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - vdd-supply
> +  - vddio-supply
> +  - vaa-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +
> +    i2c0 {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        camera@3c {
> +            compatible =3D "aptina,mt9m113";
> +            reg =3D <0x3c>;
> +
> +            clocks =3D <&mmcc 48>;
> +
> +            reset-gpios =3D <&pm8058_gpio 29 GPIO_ACTIVE_LOW>;
> +            powerdown-gpios =3D <&pm8058_gpio 30 GPIO_ACTIVE_HIGH>;
> +
> +            vddio-supply =3D <&pm8058_l15>;
> +            vdd-supply =3D <&pm8058_l15>;
> +            vaa-supply =3D <&pm8058_l14>;
> +
> +            port {
> +                mt9m113_ep: endpoint {

This label here should be dropped, cos it has nothing referencing it.

Otherwise, this looks good to me.
pw-bot: changes-requested

Cheers,
Conor.

> +                    bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +                    link-frequencies =3D /bits/ 64 <384000000>;
> +                    data-lanes =3D <1>;
> +                    remote-endpoint =3D <&csiphy1_ep>;
> +                };
> +            };
> +        };
> +    };
> +...
>=20
> --=20
> 2.43.0
>=20
>=20

--Ja9qjb5S9bUXbDpX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiL3DAAKCRB4tDGHoIJi
0vWsAP440L+Na/zMGpzrygNLT5yUo7eG6BQJaXb1Oyjv8J6NqgD/bR9dJZy3kbXt
Otf1cVDeum6Hxyqc+OVM4/B7mJ0oxQI=
=vpwu
-----END PGP SIGNATURE-----

--Ja9qjb5S9bUXbDpX--

