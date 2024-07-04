Return-Path: <linux-media+bounces-14660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12955927B24
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 18:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93C361F23DB9
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 16:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED401B3749;
	Thu,  4 Jul 2024 16:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O2QYsVEE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EBE1B3720;
	Thu,  4 Jul 2024 16:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720110604; cv=none; b=pzoam1nsNcc4gHe4gTG9Ca3jop/o96fyUHjXu/TcBtiub2dDzplzQr0MtR4dHWVK8t1u016DQ49Fyahw6KsOwjrfB9kl8Vp1HREFKqoDBVvIPeLZPKUpkVGuNsDRD9WkvhmttGWEZ4xS3PFkCZ0JEzvSJYXLwoKkmNbqX5vP7Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720110604; c=relaxed/simple;
	bh=vbQNmbizscGnFEzZbv2lkWkZcCMQUGNDhhXdfLLW1wM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gjLLigmceR/JZU/uPL4N8Zr3Cw5uRZRcRWGHDcUSnbTkpQHW9iyXQedpnI+ldU4zBbfNCMQjnr3YKryhLOoNS44VWqGtkadCp5GQ0Sc2TLSGbmnf5RGTDBDk5OtLmvQ09n6UqzJRuPGhbCvz632Lh8mEdC9n8UcGN0DXhlFmNiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2QYsVEE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414B7C3277B;
	Thu,  4 Jul 2024 16:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720110604;
	bh=vbQNmbizscGnFEzZbv2lkWkZcCMQUGNDhhXdfLLW1wM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O2QYsVEEBIqNboJZ8cWxuQHeSufZDoE3qgUj4mYJAzaY5JP+8b1pONc4L3aEfy7yv
	 HfQT5GbbwpVUHr5is+spBhiZSgna8YZ4Nqq1U2XQasfF/rrbiRowUPMdDBULFMi+B8
	 FlLkf7kLNouxuO03et7WlG3sv1Uds77GO0zgPPEJD1+HrjjwbXbYf6dV2wL9/U0m2E
	 Ee2oLEqXzyL//wTfUGgFdj600z1hvZ7Lnkz9LspDVR7+3mRS6oLqspR5cKgzPC17ff
	 73R+8Ai3M7Gk1KIo/FQgA4lR8b16tHVekkMq77b0jY1sZLP6yFbvHFIWQQ8eWxpmYE
	 lkkrzocFezoBw==
Date: Thu, 4 Jul 2024 17:29:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Phi-bang Nguyen <pnguyen@baylibre.com>
Subject: Re: [PATCH v5 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
Message-ID: <20240704-unpopular-afraid-95f2cc570f14@spud>
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
 <20240704-add-mtk-isp-3-0-support-v5-2-bfccccc5ec21@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JzWemIVJnvTZ8xJy"
Content-Disposition: inline
In-Reply-To: <20240704-add-mtk-isp-3-0-support-v5-2-bfccccc5ec21@baylibre.com>


--JzWemIVJnvTZ8xJy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2024 at 03:36:41PM +0200, Julien Stephan wrote:
> From: Phi-bang Nguyen <pnguyen@baylibre.com>
>=20
> This adds the bindings, for the ISP3.0 camsv module embedded in
> some Mediatek SoC, such as the mt8365
>=20
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> Link: https://lore.kernel.org/r/20230807094940.329165-4-jstephan@baylibre=
=2Ecom

Another confusing link tag, why is it here?

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
> +    #include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
> +    #include <dt-bindings/power/mediatek,mt8365-power.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        camsv1: camsv@15050000 {

Didn't Krzysztof already comment about the node name here?
Additionally, the "camsv1" label doest appear to be used, so should be
dropped.

Cheers,
Conor.

> +            compatible =3D "mediatek,mt8365-camsv";
> +            reg =3D <0 0x15050000 0 0x0040>,
> +                  <0 0x15050208 0 0x0020>,
> +                  <0 0x15050400 0 0x0100>;
> +            interrupts =3D <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
> +            clocks =3D <&camsys CLK_CAM>,
> +                     <&camsys CLK_CAMTG>,
> +                     <&camsys CLK_CAMSV0>;
> +            clock-names =3D "cam", "camtg", "camsv";
> +            iommus =3D <&iommu M4U_PORT_CAM_IMGO>;
> +            power-domains =3D <&spm MT8365_POWER_DOMAIN_CAM>;
> +
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +                port@0 {
> +                    reg =3D <0>;
> +                    camsv1_endpoint: endpoint {
> +                        remote-endpoint =3D <&seninf_camsv1_endpoint>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6bd7df1c3e08..9ac8c08ba692 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14163,6 +14163,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboar=
d.com>
>  M:	Julien Stephan <jstephan@baylibre.com>
>  M:	Andy Hsieh <andy.hsieh@mediatek.com>
>  S:	Supported
> +F:	Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
>  F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
> =20
>  MEDIATEK SMI DRIVER
>=20
> --=20
> 2.45.1
>=20

--JzWemIVJnvTZ8xJy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZobOBwAKCRB4tDGHoIJi
0t2ZAQDx9N9SbuBuVIR/jnCjIUwikw5c+HB1mTM3uYazkN8FUQD7BF74NxljtkNc
Q/egdw+G8jqdjnbIs0wvdu2uswqp0Q0=
=8KLb
-----END PGP SIGNATURE-----

--JzWemIVJnvTZ8xJy--

