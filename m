Return-Path: <linux-media+bounces-48918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D96CC4116
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:53:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D23E3022B45
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB4F322B9B;
	Tue, 16 Dec 2025 15:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="pLzAtjs3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx-relay102-hz1.antispameurope.com (mx-relay102-hz1.antispameurope.com [94.100.133.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535242F1FFA
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 15:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765900386; cv=pass; b=SK2FVlbw9mM0MJNxrl6Jb04r6grzDQWLgnT61N68QuW1t+v/ciENIbKzFGNjxjVD+bF1CBuyB48Bd0YXNpkdWEGqrziDEPX7rWr1YgwtqnuYcphbSj1c8jgu3EL1qT//RFlaOxjxP/LJgklXzhf3wjExCGG6iTaoVwrEhMmxQ9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765900386; c=relaxed/simple;
	bh=1Dwtsg1GX+VSN5XlbWJ+VzGdP0H2MY7B3cEVblQtOfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J1mqswxe5mfv9yEj0dS40uHmxJOd6ZwW+dngoC2FvIDcfgF6JFztyZUm3Hpziga3jeuFXI7bHFMlbROVKUdZ7EY+2TYAL0UBhQV/wS4CLE6Y0pHevQh4UsVU2wUPY5gIN5Aj9bpDx4fER5im/vfhZB61Psw2yPbTw8bp1pEQIl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=pLzAtjs3; arc=pass smtp.client-ip=94.100.133.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate102-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=6bpYrpdLa1BV6o5WcuoYN/S5eTO5xCy/135Fpy8l8VQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765900314;
 b=I96X8EULkdr5IKxgEgbvCMZgd3vv/p4o2PY9w/un4sLniJDg9qIZKpkpDHU0Q/MS/USWejpl
 sl5Mrg9iaJeP7B9pPzdtBGC8D+AxwqOOfipt+DMgWZXtEKByGtJv4ajlK925WvSbT9T+jl3R2Pr
 7HQuRlazw/zhDhZpDK8D6mmB/GdzzNFoATWfhjc3kdgkZaBouPSIXvk7u0SzkjBKO1vno8S4qPO
 FwSDIcNxD7Fex7VB5Of2CFvEKvLOPU/PWcEoy147YUC4crhNE6B5w9J1wMtz17rlm4CbAipDSrI
 KOpqzJJD6rSDhvukkNPTCDcKjx7SheJsp+78rQJ3aLrng==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765900314;
 b=QMuWQM6Eb7f0pYu5F4wQ4g+NYy87ENgdBIZTG+GrLrvmeTaWHLFMdng9SDFhIXBhYzi727l7
 66GAQaX3QP+bo9xDBFAiI/bK9tixPZPNhKGyc6tAbCR1syXuP3cekbejxGAYL6NVrE94RDhlTYo
 ZYiKG1dtBzt/i+YEmv/65gmyHwr4zFuUPMC7V9sqKQrnqg7h9HQxWM0bCs9i2RNM3ZcHmPLROBp
 DDHzlbYbLn2Cotv8QivY53WCWeSrfV5Jaz+RsOY4oG9PbqHruKE6tsBWEPcjkQs6kwSopZM+Vs4
 wsH3R/2JXqrfeghx7N51jShix6fdJk2Knuz6jZf1BTJqA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay102-hz1.antispameurope.com;
 Tue, 16 Dec 2025 16:51:54 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id AFB67A4071D;
	Tue, 16 Dec 2025 16:51:38 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Kepplinger-Novakovic <martink@posteo.de>,
 Purism Kernel Team <kernel@puri.sm>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] media: nxp: use dev_err_probe() to simplify code
Date: Tue, 16 Dec 2025 16:51:38 +0100
Message-ID: <5692334.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aUF9wPzPaGD1nmM2@lizhi-Precision-Tower-5810>
References:
 <20251215-cam_cleanup-v3-0-a61995068f38@nxp.com>
 <13428800.O9o76ZdvQC@steina-w> <aUF9wPzPaGD1nmM2@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5328991.LvFx2qVVIh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-media@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay102-hz1.antispameurope.com with 4dW1d73G2Vz16W4
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:ceddf39c8a353a802996f9c91063b891
X-cloud-security:scantime:1.849
DKIM-Signature: a=rsa-sha256;
 bh=6bpYrpdLa1BV6o5WcuoYN/S5eTO5xCy/135Fpy8l8VQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765900313; v=1;
 b=pLzAtjs3+hi4XSaBUbbihUwtMg9oifIZYNarHQSxKGV6+5tfRO7rrNpXtzIR1zCw5SaSA57M
 WzhRzW3R1B6PMDjEmXf1xYYOZCBdzKQj8WqA6DgR+J9R+OGWckBeZT2+ELvagXFp19otGoovYIm
 jC1YB3xWd4TOw75N9G+3wCGJKpnH3W6nnoRGVVKsbjRj+nHlMbo+wkktr3bL6xNII8FRJcZXJoc
 XMQiUVnQD4OQ600bvMAcZfVK8jyhjpMpdRI5tPz1JieQ05J2AfBEaISxTwV/VHaUFWRQPP7YGpu
 dfEMAcTPFXfCytikDJDWhWLuEFV1qslJoM3Ct4UDWJFFA==

--nextPart5328991.LvFx2qVVIh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Date: Tue, 16 Dec 2025 16:51:38 +0100
Message-ID: <5692334.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aUF9wPzPaGD1nmM2@lizhi-Precision-Tower-5810>
MIME-Version: 1.0

Am Dienstag, 16. Dezember 2025, 16:41:52 CET schrieb Frank Li:
> On Tue, Dec 16, 2025 at 03:50:17PM +0100, Alexander Stein wrote:
> > Hi Frank,
> >
> > Am Dienstag, 16. Dezember 2025, 15:46:00 CET schrieb Frank Li:
> > > On Tue, Dec 16, 2025 at 08:34:18AM +0100, Alexander Stein wrote:
> > > > Hi,
> > > >
> > > > Am Montag, 15. Dezember 2025, 23:49:53 CET schrieb Frank Li:
> > > > > Use dev_err_probe() to simplify the code. Drop the explicit error=
 message
> > > > > after returning from imx8mq_mipi_csi_parse_dt(), as the error is =
already
> > > > > reported by this helper.
> > > > >
> > > > > No functional change.
> > > > >
> > > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > ---
> > > > > change in v2:
> > > > > - add  Laurent Pinchart review tags
> > > > > - wrap error message to new line
> > > > > - remove error code print in dev_err_probe();
> > > > > - drop error messaage at imx8mq_mipi_csi_parse_dt()
> > > > > ---
> > > > >  drivers/media/platform/nxp/imx-mipi-csis.c    |  6 ++---
> > > > >  drivers/media/platform/nxp/imx7-media-csi.c   | 14 ++++--------
> > > > >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 33 ++++++++++++-=
=2D-------------
> > > > >  3 files changed, 21 insertions(+), 32 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers=
/media/platform/nxp/imx-mipi-csis.c
> > > > > index 088b2945aee33731c565f049dd17721356300b84..ce93d868746f002c2=
2e2f86b1e0aa84ec1a76061 100644
> > > > > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > > > > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > > > @@ -1547,10 +1547,8 @@ static int mipi_csis_probe(struct platform=
_device *pdev)
> > > > >  	/* Now that the hardware is initialized, request the interrupt.=
 */
> > > > >  	ret =3D devm_request_irq(dev, irq, mipi_csis_irq_handler, 0,
> > > > >  			       dev_name(dev), csis);
> > > > > -	if (ret) {
> > > > > -		dev_err(dev, "Interrupt request failed\n");
> > > > > -		return ret;
> > > > > -	}
> > > > > +	if (ret)
> > > > > +		return dev_err_probe(dev, ret, "Interrupt request failed\n");
> > > > >
> > > > >  	/* Initialize and register the subdev. */
> > > > >  	ret =3D mipi_csis_subdev_init(csis);
> > > > > diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/driver=
s/media/platform/nxp/imx7-media-csi.c
> > > > > index 933a5f39f9f4c9b43ca8d2a1819d0145981266e6..7ddc7ba06e3d4e007=
013821f67d783898a15461f 100644
> > > > > --- a/drivers/media/platform/nxp/imx7-media-csi.c
> > > > > +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> > > > > @@ -2218,11 +2218,9 @@ static int imx7_csi_probe(struct platform_=
device *pdev)
> > > > >
> > > > >  	/* Acquire resources and install interrupt handler. */
> > > > >  	csi->mclk =3D devm_clk_get(&pdev->dev, "mclk");
> > > > > -	if (IS_ERR(csi->mclk)) {
> > > > > -		ret =3D PTR_ERR(csi->mclk);
> > > > > -		dev_err(dev, "Failed to get mclk: %d", ret);
> > > > > -		return ret;
> > > > > -	}
> > > > > +	if (IS_ERR(csi->mclk))
> > > > > +		return dev_err_probe(dev, PTR_ERR(csi->mclk),
> > > > > +				     "Failed to get mclk\n");
> > > > >
> > > > >  	csi->irq =3D platform_get_irq(pdev, 0);
> > > > >  	if (csi->irq < 0)
> > > > > @@ -2236,10 +2234,8 @@ static int imx7_csi_probe(struct platform_=
device *pdev)
> > > > >
> > > > >  	ret =3D devm_request_irq(dev, csi->irq, imx7_csi_irq_handler, 0=
, "csi",
> > > > >  			       (void *)csi);
> > > > > -	if (ret < 0) {
> > > > > -		dev_err(dev, "Request CSI IRQ failed.\n");
> > > > > -		return ret;
> > > > > -	}
> > > > > +	if (ret < 0)
> > > > > +		return dev_err_probe(dev, ret, "Request CSI IRQ failed.\n");
> > > > >
> > > > >  	/* Initialize all the media device infrastructure. */
> > > > >  	ret =3D imx7_csi_media_init(csi);
> > > > > diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/driv=
ers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > > > index 0851f4a9ae52d3096f454da643cfdc5017e000b1..a007c582b4d91660a=
97910a6a0d53c9b6fcd73e9 100644
> > > > > --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > > > +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > > > @@ -951,10 +951,9 @@ static int imx8mq_mipi_csi_parse_dt(struct c=
si_state *state)
> > > > >  	int ret =3D 0;
> > > > >
> > > > >  	state->rst =3D devm_reset_control_array_get_exclusive(dev);
> > > > > -	if (IS_ERR(state->rst)) {
> > > > > -		dev_err(dev, "Failed to get reset: %pe\n", state->rst);
> > > > > -		return PTR_ERR(state->rst);
> > > > > -	}
> > > > > +	if (IS_ERR(state->rst))
> > > > > +		return dev_err_probe(dev, PTR_ERR(state->rst),
> > > > > +				     "Failed to get reset\n");
> > > > >
> > > > >  	if (state->pdata->use_reg_csr) {
> > > > >  		const struct regmap_config regmap_config =3D {
> > > > > @@ -977,24 +976,22 @@ static int imx8mq_mipi_csi_parse_dt(struct =
csi_state *state)
> > > > >
> > > > >  	ret =3D of_property_read_u32_array(np, "fsl,mipi-phy-gpr", out_=
val,
> > > > >  					 ARRAY_SIZE(out_val));
> > > > > -	if (ret) {
> > > > > -		dev_err(dev, "no fsl,mipi-phy-gpr property found: %d\n", ret);
> > > > > -		return ret;
> > > > > -	}
> > > > > +	if (ret)
> > > > > +		return dev_err_probe(dev, ret, "no %s property found\n",
> > > > > +				    "fsl,mipi-phy-gpr");
> > > >
> > > > Do you really need to pass the (fixed) property name as an argument=
? Why
> > > > not move into the const string directly? I would also rephrase it a=
 bit:
> > > > "property fsl,mipi-phy-gpr not found"
> > >
> > > Laurent Pinchart provide comments at previous version. The same
> > > "fsl,mipi-phy-gpr" share one entry at RO region. slice save RO region
> > > space.
> > >
> > > https://lore.kernel.org/imx/20251119043307.GH17526@pendragon.ideasonb=
oard.com/
> >
> > "assuming it's worth it". Do you have any numbers? I doubt there is a
> > significant benefit, but I don't have strong opinion here.
>=20
> Yes, only few byte. But no worth to argue this. Laurent Pinchart, who pick
> patches.

Agreed.

>=20
> > But the grammar should still be improved.
>=20
> Okay, will update it.

Thanks

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart5328991.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmlBgAoACgkQaS+g2M0Z
/iX//gf+LtS33Qw18u2HwxSsJ7cUH4+Wm7d0R4DwbhMp7PG2AOID6bU0gq5fnDCT
zKRKE+ex3uY7AmJa4GUj8wl+zLqGoedz5hT59N7FC36dKCElvkxehSQpEy/Ci9xv
5HJ8OSNnXyXSjrDLrkdfGv0vq01whLw1c4IXLf7wzas6vyLR9DN0dQejxvCaJE1/
UzaCjnZFl/VXFB82rqVFlcl2h9bDMJfl2bJxeCKds4L/UJrWr8eVdej47n1O05hJ
x/uXTLbnb+TJUuR3M1VkdfEphzSSdIgO5KK9Wgiy39YZwrlLMhjIYL6GsrGkt/r5
w1t4tDhtQ/nHni5X/XLYFr4dBXlo8A==
=G4dM
-----END PGP SIGNATURE-----

--nextPart5328991.LvFx2qVVIh--




