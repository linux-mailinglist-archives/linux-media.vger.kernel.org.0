Return-Path: <linux-media+bounces-48855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 840BBCC152B
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 08:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83D6C3040742
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 07:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498B831BCAF;
	Tue, 16 Dec 2025 07:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Oaqtwu85"
X-Original-To: linux-media@vger.kernel.org
Received: from mx-relay15-hz2.antispameurope.com (mx-relay15-hz2.antispameurope.com [83.246.65.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EEE2EC557
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 07:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.157
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765870510; cv=pass; b=Zs3U17kXz39lAYbg/MQ4BfrSMm9SNBc6qqZKYV0j5jnkUeoXg80ReGRfdX6wLSb7zl3C1HatlFVDdiZimWOovjzj+53r8x6P8aZ9BLXejs8UucNHMOHAyCnj1O0mAdNzwj5EUN4GjvkHdSkRiqyQcNyxL2PvWidqD/Iz9XUaJvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765870510; c=relaxed/simple;
	bh=PwBMFTRq5i7V5ZlojUAF1zeR8S0ddqiksW6YEBKcrdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kG1Vewxz1HE4Zk4tNwTKIHyh/CTbn10PgI/VYQuVE5cp8RKNqFWOAqWRuRBO8INjRHGTjpE4gYIuvJD6Qv8kb1q4cO20gMTd64UUGwvfNBfCEc/uZbGQ80dYqCym4bc7Gj5FycEG4fzsRoywqwkfOaiHlmdX07ysRyKMYNR9GQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Oaqtwu85; arc=pass smtp.client-ip=83.246.65.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate15-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=cXefL1483wNE2cHUN0ZgrldQvbgj+w+ETemoOKVrBJs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765870474;
 b=r6tyvPIQo0wdFmpro6vIsVseTaabQHezL5j6iJSK1+V7LeorBYSmCapw/+UtIj++PGj5XZez
 OW0GWzGu+dalDr8EAN409z9QfdPEHZ9YFhFQ9ChJkQIRbwbPWwjR7LKGkYkUbJ16bx+qwHHMS6N
 TnF7qVZnF1D0D7IyoEKGfC+pSPGP+Z7Gm9N55TvP31kQs5XOeCW96Ac0c4J2NDBvEUy+mpaPhGY
 VZHvFmrdOdhB8FTkze/+iPHSTakV0nFe4l0ZowGJGtzBOEyfry5b8hcVOZ5TqkmnXLdOS3c18oS
 m6/cB44sXO28ffwplPO6DwB4/Jddoqe4BGKfFLOsdrgCQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765870474;
 b=gz+l+4R6j5ma5ctvrjqwLVLF0ckYlCowQLCEXyn44BjJLlCCs4+GJNzPoDC7wupRT032aeS4
 VIHWMswsu6Vi7Nq7OV4IEtz1WUyTZhPSdqeTgyM5+N0VBqm4hQRgVRJ1Lx3J8W+CV3qCNxOntDm
 H/8dmj3UJUvI8H8hxgpOmSCIHP+/sFyZg6FLTSxh5p8NY3JQbWnpBmTwiQ0qPuSW1DbabEiOBsu
 2WX+3Rt+8LVJjlcre3MJGhZJLvwvPCqTLgahtC2drZrsWhIGSptzBeXmwSbmpjH95TAMMeSn26l
 Fpa+mv6E85rZ0wXohmXwg0gBquTolqlqRbtI3XrhY/KwQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay15-hz2.antispameurope.com;
 Tue, 16 Dec 2025 08:34:33 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 85EA2220CD2;
	Tue, 16 Dec 2025 08:34:18 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Kepplinger-Novakovic <martink@posteo.de>,
 Purism Kernel Team <kernel@puri.sm>, linux-arm-kernel@lists.infradead.org
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Frank Li <Frank.Li@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 2/5] media: nxp: use dev_err_probe() to simplify code
Date: Tue, 16 Dec 2025 08:34:18 +0100
Message-ID: <5462566.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251215-cam_cleanup-v3-2-a61995068f38@nxp.com>
References:
 <20251215-cam_cleanup-v3-0-a61995068f38@nxp.com>
 <20251215-cam_cleanup-v3-2-a61995068f38@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5099229.LvFx2qVVIh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-media@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay15-hz2.antispameurope.com with 4dVpbH2fBmz2FbCB
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:cb77c3a0d9b6a7fc0c8e18a2ac2881b9
X-cloud-security:scantime:1.811
DKIM-Signature: a=rsa-sha256;
 bh=cXefL1483wNE2cHUN0ZgrldQvbgj+w+ETemoOKVrBJs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765870473; v=1;
 b=Oaqtwu857n+nnLGngOFzyiCdEIorRJxPszNrd1EIdDBCG9STOkT9YWgV7okQmdBGkmda28y7
 pCAMeBvnROFCUEqbDDeJOhU0+Vrh+0n1WFe0oojkAYydvKxk5/QmRXwFrrY/OL2+qZkEQVkXAYC
 R2h3XOvcEvdy/4PeEdUSReyzG4l23bdSnEBFndu0BT39WEpCMLAYnm9kHDSZMH4v4yC618CPCef
 rWPBDaaGOWfdMIBVmWUK7PTi9i0TMOFpxDcgzY/m5Rn2F0w3VhnjPt2Ek42XUcfa0jHHE4ekxQY
 xNl8EpeafACYXrxbbX1D7mqKdiiPQBydtI6P632YXqaIw==

--nextPart5099229.LvFx2qVVIh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
Date: Tue, 16 Dec 2025 08:34:18 +0100
Message-ID: <5462566.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251215-cam_cleanup-v3-2-a61995068f38@nxp.com>
MIME-Version: 1.0

Hi,

Am Montag, 15. Dezember 2025, 23:49:53 CET schrieb Frank Li:
> Use dev_err_probe() to simplify the code. Drop the explicit error message
> after returning from imx8mq_mipi_csi_parse_dt(), as the error is already
> reported by this helper.
>=20
> No functional change.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2:
> - add  Laurent Pinchart review tags
> - wrap error message to new line
> - remove error code print in dev_err_probe();
> - drop error messaage at imx8mq_mipi_csi_parse_dt()
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c    |  6 ++---
>  drivers/media/platform/nxp/imx7-media-csi.c   | 14 ++++--------
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 33 ++++++++++++---------=
=2D-----
>  3 files changed, 21 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/p=
latform/nxp/imx-mipi-csis.c
> index 088b2945aee33731c565f049dd17721356300b84..ce93d868746f002c22e2f86b1=
e0aa84ec1a76061 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1547,10 +1547,8 @@ static int mipi_csis_probe(struct platform_device =
*pdev)
>  	/* Now that the hardware is initialized, request the interrupt. */
>  	ret =3D devm_request_irq(dev, irq, mipi_csis_irq_handler, 0,
>  			       dev_name(dev), csis);
> -	if (ret) {
> -		dev_err(dev, "Interrupt request failed\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Interrupt request failed\n");
> =20
>  	/* Initialize and register the subdev. */
>  	ret =3D mipi_csis_subdev_init(csis);
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/=
platform/nxp/imx7-media-csi.c
> index 933a5f39f9f4c9b43ca8d2a1819d0145981266e6..7ddc7ba06e3d4e007013821f6=
7d783898a15461f 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -2218,11 +2218,9 @@ static int imx7_csi_probe(struct platform_device *=
pdev)
> =20
>  	/* Acquire resources and install interrupt handler. */
>  	csi->mclk =3D devm_clk_get(&pdev->dev, "mclk");
> -	if (IS_ERR(csi->mclk)) {
> -		ret =3D PTR_ERR(csi->mclk);
> -		dev_err(dev, "Failed to get mclk: %d", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(csi->mclk))
> +		return dev_err_probe(dev, PTR_ERR(csi->mclk),
> +				     "Failed to get mclk\n");
> =20
>  	csi->irq =3D platform_get_irq(pdev, 0);
>  	if (csi->irq < 0)
> @@ -2236,10 +2234,8 @@ static int imx7_csi_probe(struct platform_device *=
pdev)
> =20
>  	ret =3D devm_request_irq(dev, csi->irq, imx7_csi_irq_handler, 0, "csi",
>  			       (void *)csi);
> -	if (ret < 0) {
> -		dev_err(dev, "Request CSI IRQ failed.\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Request CSI IRQ failed.\n");
> =20
>  	/* Initialize all the media device infrastructure. */
>  	ret =3D imx7_csi_media_init(csi);
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/medi=
a/platform/nxp/imx8mq-mipi-csi2.c
> index 0851f4a9ae52d3096f454da643cfdc5017e000b1..a007c582b4d91660a97910a6a=
0d53c9b6fcd73e9 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -951,10 +951,9 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state=
 *state)
>  	int ret =3D 0;
> =20
>  	state->rst =3D devm_reset_control_array_get_exclusive(dev);
> -	if (IS_ERR(state->rst)) {
> -		dev_err(dev, "Failed to get reset: %pe\n", state->rst);
> -		return PTR_ERR(state->rst);
> -	}
> +	if (IS_ERR(state->rst))
> +		return dev_err_probe(dev, PTR_ERR(state->rst),
> +				     "Failed to get reset\n");
> =20
>  	if (state->pdata->use_reg_csr) {
>  		const struct regmap_config regmap_config =3D {
> @@ -977,24 +976,22 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_stat=
e *state)
> =20
>  	ret =3D of_property_read_u32_array(np, "fsl,mipi-phy-gpr", out_val,
>  					 ARRAY_SIZE(out_val));
> -	if (ret) {
> -		dev_err(dev, "no fsl,mipi-phy-gpr property found: %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "no %s property found\n",
> +				    "fsl,mipi-phy-gpr");

Do you really need to pass the (fixed) property name as an argument? Why
not move into the const string directly? I would also rephrase it a bit:
"property fsl,mipi-phy-gpr not found"

With that fixed:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> =20
>  	ph =3D *out_val;
> =20
>  	node =3D of_find_node_by_phandle(ph);
> -	if (!node) {
> -		dev_err(dev, "Error finding node by phandle\n");
> -		return -ENODEV;
> -	}
> +	if (!node)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "Error finding node by phandle\n");
> +
>  	state->phy_gpr =3D syscon_node_to_regmap(node);
>  	of_node_put(node);
> -	if (IS_ERR(state->phy_gpr)) {
> -		dev_err(dev, "failed to get gpr regmap: %pe\n", state->phy_gpr);
> -		return PTR_ERR(state->phy_gpr);
> -	}
> +	if (IS_ERR(state->phy_gpr))
> +		return dev_err_probe(dev, PTR_ERR(state->phy_gpr),
> +				     "failed to get gpr regmap\n");
> =20
>  	state->phy_gpr_reg =3D out_val[1];
>  	dev_dbg(dev, "phy gpr register set to 0x%x\n", state->phy_gpr_reg);
> @@ -1017,10 +1014,8 @@ static int imx8mq_mipi_csi_probe(struct platform_d=
evice *pdev)
>  	state->pdata =3D of_device_get_match_data(dev);
> =20
>  	ret =3D imx8mq_mipi_csi_parse_dt(state);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to parse device tree: %d\n", ret);
> +	if (ret < 0)
>  		return ret;
> -	}
> =20
>  	/* Acquire resources. */
>  	state->regs =3D devm_platform_ioremap_resource(pdev, 0);
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart5099229.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmlBC3oACgkQaS+g2M0Z
/iXBPAgAuns0Z/5M2rvJGyTchlUPlwCRo6k9vA9+ZnlRFiJOs6b6lgs0XyCE+siX
wo9qiDnRgE0CkdZZrNXrxJKbr7ut2PZakYm4MZDTiL9VOUr8zAC63SHyHAIIpT6Z
SCY7qC6hkK75ednfn/W0VM3189TDkUtBNMPLxIx977BTqzGr5nbZLPmmj2vQE1v/
6DNNvRQEAXa31cNb08y9YW/bVgjVrXC0GCkjqEVL+Dc0H7510ATimhT+gaqBi8C5
48CX8FiEzYRziUz6/kesCcMcuvYYamQGymDrGiiY9nmSRlZ2fWXLKINIbDy2J9Gj
IKjmNRD8rkVPtmZMYConvQVie4Tf7A==
=Wdrp
-----END PGP SIGNATURE-----

--nextPart5099229.LvFx2qVVIh--




