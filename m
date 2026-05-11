Return-Path: <linux-media+bounces-61154-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMrxKjwDAmrknAEAu9opvQ
	(envelope-from <linux-media+bounces-61154-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 18:26:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D0851217F
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 18:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA34A300F74F
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 16:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46F7427A15;
	Mon, 11 May 2026 16:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxaFLQ59"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0938F42B72B;
	Mon, 11 May 2026 16:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516776; cv=none; b=RkKjOkVR5+5iwRHGTeOKuYyZiUHRF32WFC8p7KdlhT7aFzyN0Bx0qIrwaULvuVDHMUGToYQdCRQIOz4szURtrxPGds14A53GT0/sA0gKOZ0m4n92oVacQajNjSdhYVAr1iQyiziUuJr4eRuC5o25DiycL9J/uLFJwfTQv3TQc/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516776; c=relaxed/simple;
	bh=nicCqXdfsNewuBYQmPZ5MAe+oudQ/+7joKgKY4kU0H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4920VQWGye5Fq7KbjE4XIkmS4/bXfTSBP9UiMO33k5P28lsvZoCqYutz7D/Ga0mCHq8a81xuUSp9KBZyEnjxr+EonEZiHBw+DaD7LKDOEYFaDg7+ewHdsgsZ7yfMDWloretcdiheVeyCQQW+SPlIsQvLt3Q/HiGOkqJ6JGsgzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxaFLQ59; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00020C2BCB0;
	Mon, 11 May 2026 16:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778516775;
	bh=nicCqXdfsNewuBYQmPZ5MAe+oudQ/+7joKgKY4kU0H8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NxaFLQ593ZbG8Atpcjl6CQt1yxY5DtowC7BDXgOlZRZMuJa60mG+ewXwIRTz6OGSB
	 +fVEJtix9tqJ4+KyAhJa6yF2/ei6B2gzqfkrqr+oKrg2MZKEUrv0RzY0CpIEm2be1+
	 PN7hvt31xQqm0WYUFcRsoLYs/5RgZcuokPDW0kwqdf1hf2bQ7NWPBzv4+CqmQ12dlr
	 NPFLcsQbVouN9TLXUhSigy9ZaJujFKOdfMGVmHn2TVHTSKx2C75IjPUHo5MDG8ulsr
	 VZbwc6BmdCS9TUvznWQ6Av6K7QSePhkhbX8WUZd2E2kZUFbVfb6GYXPIfGXW56KvU9
	 0ATRVo5q0VKOQ==
Date: Mon, 11 May 2026 17:26:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, michael.riesch@collabora.com,
	anthony.mcgivern@arm.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, ai.luthra@ideasonboard.com,
	paul.elder@ideasonboard.com, geert@linux-m68k.org
Subject: Re: [PATCH v2 1/8] dt-bindings: media: Add nxp neoisp support
Message-ID: <20260511-aneurism-ultimate-9bc90e654274@spud>
References: <20260511132629.1300868-1-antoine.bouyer@nxp.com>
 <20260511132629.1300868-2-antoine.bouyer@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CjzSqaKKj3fzWanh"
Content-Disposition: inline
In-Reply-To: <20260511132629.1300868-2-antoine.bouyer@nxp.com>
X-Rspamd-Queue-Id: 86D0851217F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61154-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4ae00000:email,devicetree.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--CjzSqaKKj3fzWanh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 03:26:21PM +0200, Antoine Bouyer wrote:
> Add the yaml binding for NXP's Neo Image Signal Processor (ISP).
>=20
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> ---
>  .../bindings/media/nxp,imx95-neoisp.yaml      | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-neo=
isp.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yam=
l b/Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml
> new file mode 100644
> index 000000000000..458c4e4d640d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/nxp,imx95-neoisp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP NEOISP Image Signal Processing Pipeline
> +
> +maintainers:
> +  - Antoine Bouyer <antoine.bouyer@nxp.com>
> +
> +description:
> +  The NXP NEOISP performs a set of image processing tasks on the RAW cam=
era
> +  stream and provides RGB or YUV enhanced image.

Can someone explain to me please why there are no ports properties to
represent the attached camera/other elements of the pipeline?

This is not a review comment per se, this is me not understanding what
the delimitation is.


Cheers,
Conor.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,imx95-neoisp
> +
> +  reg:
> +    items:
> +      - description: The configuration registers
> +      - description: ISP local memories
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: camcm0
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    isp@4ae00000 {
> +        compatible =3D "nxp,imx95-neoisp";
> +        reg =3D <0x4ae00000 0x8000>,
> +              <0x4afe0000 0x10000>;
> +        interrupts =3D <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-parent =3D <&gic>;
> +        clocks =3D <&scmi_clk 64>; /* IMX95_CLK_CAMCM0 */
> +        clock-names =3D "camcm0";
> +        power-domains =3D <&scmi_devpd 3>; /* IMX95_PD_CAMERA */
> +    };
> --=20
> 2.51.0
>=20

--CjzSqaKKj3fzWanh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagIDIQAKCRB4tDGHoIJi
0hf3AP0YoUoaFHDcqufm3AXvDg0DBlXqv6T1NQk3jZblplkO3wEA+E9lybZt4PQ1
C2KUfKx64Sh7jfAMxtsypGfb40v0TgA=
=p7we
-----END PGP SIGNATURE-----

--CjzSqaKKj3fzWanh--

