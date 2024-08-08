Return-Path: <linux-media+bounces-16001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C01DA94C194
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 17:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C36BB23DAB
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 15:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD99E18FC93;
	Thu,  8 Aug 2024 15:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jGo+Rw06"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1676018F2EE;
	Thu,  8 Aug 2024 15:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723131450; cv=none; b=YLHJMbpsEiVuIA2rFrtAjQ0ya2/RmKk8y6hf1Z7anbTVRUIUa0rpcBm4br+//Un6qX/kyOf8CTS4NNYqFnIDBUso9xsVM74ts/2atG1yvSMGG/yHAz5M6N+Qtyh4jXdjRWq4MSgar/0rARcPi0MIZ6izfC2QohUtNNIzX65C4Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723131450; c=relaxed/simple;
	bh=RAPzk173wWVs48Ql9p6p42T/JVNyFolrQT4dn3Ymff4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=io+iMIeoHgtl+mfcQNstbuBN7X1cn3v/2aUdpsSOg9SZpcUFIcJYDYkE9Jd4+BwUwpEoKsJlms1O+hIGSXm/+OgiQBvnOVhtfv8yTSTJ5TTLELlX+HwewBZe56eNpbgx9i7K+md2OoMmNrd8N91VTtBGJbN9omZj+I8Ul3XRx5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jGo+Rw06; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671B1C32782;
	Thu,  8 Aug 2024 15:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723131449;
	bh=RAPzk173wWVs48Ql9p6p42T/JVNyFolrQT4dn3Ymff4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jGo+Rw06sFiWbEULMJDOWj9ztjASTJReIRZOGl9h53/LdFIb76dsKJfXkC8j2RJUr
	 XmHJ3wdrlcUN2pW/AUqNGHapO+O1cPH65sw8Ohw9osEyFnhYMPdZIVTIywLUWGzhNN
	 bxV5DRyuCvBJpNsNMbF9zo6D92z7dHkX2flJUpeRMD+asq11EvuRXqmHTHw2NBxVRz
	 IhHCZKnh2QyciKa4UsRpQG2qMWVF+1uOVbhsvvzjNsJySVap2h7hacEHJXsi/PTDvE
	 y6yLcRFsZ1khQphEBWkogNI5rHDZ0RUYxKsniP3qL5RQJ7XDPEEPyM82AAbp9SAdtG
	 oHw4mhwv/TTSQ==
Date: Thu, 8 Aug 2024 16:37:25 +0100
From: Conor Dooley <conor@kernel.org>
To: keguang.zhang@gmail.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
Message-ID: <20240808-backyard-unglue-3cf429ad8da5@spud>
References: <20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com>
 <20240808-loongson1-nand-v8-1-c96dea418b41@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IivgV01SW2D8tib3"
Content-Disposition: inline
In-Reply-To: <20240808-loongson1-nand-v8-1-c96dea418b41@gmail.com>


--IivgV01SW2D8tib3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2024 at 07:22:19PM +0800, Keguang Zhang via B4 Relay wrote:
> From: Keguang Zhang <keguang.zhang@gmail.com>
>=20
> Add devicetree binding document for Loongson-1 NAND Controller.
>=20
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
> Changes in v8:
> - Add a description part.
> - Adjust the compatible because the match data for ls1c-nfc differs from =
ls1b-nfc.
> - Mark 'nand-use-soft-ecc-engine' and 'nand-ecc-algo' as mandatory.
> - Delete the superfluous blank lines.
>=20
> Changes in v7:
> - rename the file to loongson,ls1b-nfc.yaml
>=20
> Changes in v6:
> - A newly added patch
> ---
>  .../devicetree/bindings/mtd/loongson,ls1b-nfc.yaml | 75 ++++++++++++++++=
++++++
>  1 file changed, 75 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml=
 b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml
> new file mode 100644
> index 000000000000..7ce335324a29
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml

When I first read "nfc" here I thought it was a copy-paste mistake, as
"nfc" is a technology of it's own. I think it would make sense to rename
to "loongson,ls1b-nand-controller" etc to remove that sort of confusion.
These devices might not implement NFC, but what's to say that a future
device will not?

Cheers,
Conor.

> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/loongson,ls1b-nfc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson-1 NAND Controller
> +
> +maintainers:
> +  - Keguang Zhang <keguang.zhang@gmail.com>
> +
> +description: |

This | is not needed.

> +  The Loongson-1 NAND controller abstracts all supported operations,
> +  meaning it does not support low-level access to raw NAND flash chips.
> +  Moreover, the controller is paired with the DMA engine to perform
> +  READ and PROGRAM functions.
> +
> +allOf:
> +  - $ref: nand-controller.yaml
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - loongson,ls1b-nfc
> +          - loongson,ls1c-nfc
> +      - items:
> +          - enum:
> +              - loongson,ls1a-nfc
> +          - const: loongson,ls1b-nfc
> +
> +  reg:
> +    maxItems: 1
> +
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    const: rxtx
> +
> +patternProperties:
> +  "^nand@[0-3]$":
> +    type: object
> +    $ref: raw-nand-chip.yaml
> +
> +    required:
> +      - nand-use-soft-ecc-engine
> +      - nand-ecc-algo
> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - dmas
> +  - dma-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    nand-controller@1fe78000 {
> +        compatible =3D "loongson,ls1b-nfc";
> +        reg =3D <0x1fe78000 0x40>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        dmas =3D <&dma 0>;
> +        dma-names =3D "rxtx";
> +
> +        nand@0 {
> +            reg =3D <0>;
> +            nand-use-soft-ecc-engine;
> +            nand-ecc-algo =3D "hamming";
> +        };
> +    };
>=20
> --=20
> 2.43.0
>=20
>=20

--IivgV01SW2D8tib3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrTmNQAKCRB4tDGHoIJi
0gQGAQD4FzC6xGG9TJwnPfpKvGfe1EEUqx9N24HY676DWUAOWAEA4rp26Na9xv5L
k+pYjSdEwe8GytO0yKotr98oBr8C3gc=
=O27f
-----END PGP SIGNATURE-----

--IivgV01SW2D8tib3--

