Return-Path: <linux-media+bounces-32404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3130AB578D
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 16:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EB7819E378E
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 14:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD49E1B21AD;
	Tue, 13 May 2025 14:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3IONiK2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C5742A87;
	Tue, 13 May 2025 14:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747147743; cv=none; b=V96VoQzXOIYh4OZBedbjjRgmBX5x3b2pz1T3YnSsA9wC1Rxh+qSQSx1cc37zb3ujyPqWXm0MWhYMtPfxn2TK2cxSaN+ROg7r+u2/aYVKsv+qGHFJ5J/65MWbNcXritTDGX85c0AzWRjYY/G+Xn14YVsNxpE+RGCoLKf9u81GxiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747147743; c=relaxed/simple;
	bh=w+ahJVkjUKW/h+BAOwRzX8f1TQZOhdX5+YcMtNX18mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aaie1Ca7Ubd7SUeFjNYLECGfnHc18BYC5tTtRZ60A3mbD5bSMxmGUnRrMXC0NRdZNpiTtnlRjqH98FEuc6hkC52ODioaRmSmMVKE+ZcALHtNnugNBq7Lwq1cFv9Blg4dSNBJ/oxReMEZoApGZHhfhZM5SQkXw2i0Ws+lFw7fmYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3IONiK2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B420BC4CEF3;
	Tue, 13 May 2025 14:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747147742;
	bh=w+ahJVkjUKW/h+BAOwRzX8f1TQZOhdX5+YcMtNX18mQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O3IONiK2TK3iLZEsLyQ2+CDmN382HnX1jomxJyoY95S58jwRBIF4hbda/Ot92A/yk
	 noxyCwfHLfKs26B8SGZ0BHOkNijdF70zQoWy31LW3ZJd8Zhkw6uFbu0Xaqd8v3jcBE
	 gIxENSsqGX+fSXbzi8SBspcyVEP+vOC5lcswz5mzzCVoYODxZqw0w7KGJs5mQ+R/E1
	 UcccsTQGlXeuAX5FUXhFowcNf4E9In0dhNVslufHdil0Ltzg9Qa8VVH9WDBVvljATX
	 gDuhN6iGFH7bU/tAozVDUx1xC683bkXZGMkFQTCSjAcOcpZtzkSCUQrKw2cp2k/FrA
	 NIu9VwqPdZnnQ==
Date: Tue, 13 May 2025 15:48:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH] dt-bindings: phy: Add Qualcomm MIPI C-/D-PHY schema
 for CSIPHY IPs
Message-ID: <20250513-sanction-barricade-4ff7948de1ac@spud>
References: <20250513143918.2572689-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6XaM8wrPMaFluXjf"
Content-Disposition: inline
In-Reply-To: <20250513143918.2572689-1-vladimir.zapolskiy@linaro.org>


--6XaM8wrPMaFluXjf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 05:39:18PM +0300, Vladimir Zapolskiy wrote:
> Add dt-binding schema for the CAMSS CSIPHY IPs, which provides
> MIPI C-/D-PHY interfaces on Qualcomm SoCs.
>=20
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

RFC but nothing here about what in particular is RFC about this patch.
What specifically are you looking for comments about?

> ---
>  .../devicetree/bindings/phy/qcom,csiphy.yaml  | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,csiphy.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/phy/qcom,csiphy.yaml b/Doc=
umentation/devicetree/bindings/phy/qcom,csiphy.yaml
> new file mode 100644
> index 000000000000..ef712c5442ec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,csiphy.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,csiphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm CSI PHY
> +
> +maintainers:
> +  - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> +
> +description: |
> +  Qualcomm SoCs equipped with a number of MIPI CSI PHY IPs, which
> +  supports D-PHY or C-PHY interfaces to camera sensors.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm8250-csiphy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  vdda-csi-0p9-supply:
> +    description: Voltage supply, 0.9V
> +
> +  vdda-csi-1p2-supply:
> +    description: Voltage supply, 1.2V
> +
> +  '#phy-cells':
> +    const: 0
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    description: CAMSS CSIPHY input port
> +
> +    patternProperties:
> +      "^endpoint@[0-1]$":
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            minItems: 1
> +            maxItems: 4
> +
> +          bus-type:
> +            enum:
> +              - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +              - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +        required:
> +          - data-lanes
> +
> +    oneOf:
> +      - required:
> +          - endpoint
> +      - required:
> +          - endpoint@0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - '#phy-cells'
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm8250-csiphy
> +    then:
> +      required:
> +        - vdda-csi-0p9-supply
> +        - vdda-csi-1p2-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    phy@ac6e000 {
> +      compatible =3D "qcom,sm8250-csiphy";
> +      reg =3D <0x0ac6e000 0x1000>;
> +      clocks =3D <&camcc CAM_CC_CSIPHY2_CLK>,
> +               <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
> +      interrupts =3D <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
> +      vdda-csi-0p9-supply =3D <&vreg_l5a_0p88>;
> +      vdda-csi-1p2-supply =3D <&vreg_l9a_1p2>;
> +      #phy-cells =3D <0>;
> +
> +      port {
> +        csiphy_in: endpoint {
> +          data-lanes =3D <1 2 3 4>;
> +          remote-endpoint =3D <&sensor_out>;
> +        };
> +      };
> +    };
> --=20
> 2.45.2
>=20

--6XaM8wrPMaFluXjf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCNb2QAKCRB4tDGHoIJi
0jhLAP9vDGf7owYflBhPRDVDKNexSIrkUinpNY7Qt5rZK+lqtgD+PJwG9W07LqrS
C0otwZta35jhKyvtHqu00svyGqhsMQI=
=gnkz
-----END PGP SIGNATURE-----

--6XaM8wrPMaFluXjf--

