Return-Path: <linux-media+bounces-15041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ABA9322E7
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 11:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4824A1F2159E
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 09:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4591196C7C;
	Tue, 16 Jul 2024 09:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rZgtRZjK"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652046FB8;
	Tue, 16 Jul 2024 09:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721122408; cv=none; b=kuNMk5szBMkKNsstiPDN6zRQpfGZ6iMiHx35CAaDY9AxSAKTMJBABxMUZuG6P1zWJsJ3Ayyh3vEemfxtRY3daNTc68AkRslLUqti/yS3diB29kNKMJikSLSsXoWuWCYbTheGCfnyLzELQ1sDrtOFmL44DQ+aHpU/OhpRJK89mE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721122408; c=relaxed/simple;
	bh=Sedv3uLNq8jQwmShXyQzdhNlGwLwIOlwCb9rrjh4HZc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QR8AdHY9duloR86HxQcP5vzu4b8y5ID/NgzuKDfzmQLfGCPHozSJi2tqK66gjfuXFCmVZxXGl1DYebnPnnZu2XzrNacVNCDX5Nz896WJif8RjZukUJW53Lz3shrfnTeHZ+gaWdOfbK2BsoLO/p5Xyf7tplcb+rbOW2gKE7HUo48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rZgtRZjK; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46G9XArP065135;
	Tue, 16 Jul 2024 04:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721122390;
	bh=bR770W1L6Ln3hKjytZ9tTM5b07o61JSKaRFimsUH3Bw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=rZgtRZjK7TL2lU87699xe9sSWxjFYIe5Z4WWSWSTUSM6AOdq43XWDCWw1hI2N3Zes
	 Z5vOpvOWKFCUph3tS88r9ExCETc5pMuOxBK+b/YUZqdyJpjh7qSrtrKP9BC02DXKjJ
	 qAgEIzXOqkai2vKFuL1Cr3HSNP7oLi4SggKFKdrA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46G9XACW019407
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Jul 2024 04:33:10 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jul 2024 04:33:10 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jul 2024 04:33:10 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46G9X9G7064565;
	Tue, 16 Jul 2024 04:33:09 -0500
Date: Tue, 16 Jul 2024 15:03:08 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Aradhya
 Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
        Changhuang
 Liang <changhuang.liang@starfivetech.com>,
        Jack Zhu
	<jack.zhu@starfivetech.com>,
        Julien Massot <julien.massot@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Re: [PATCH v2 07/13] media: ti: j721e-csi2rx: get number of
 contexts from device tree
Message-ID: <t4yv7upgkixbsemgwj5omqy77rwzfkoo6jmygbzuezugdfukjq@mxt2utaii7cv>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-7-6ae96c54c1c3@ti.com>
 <5tvwcygupy2hheyggg7m7ancrrwrnin4lej2554pg6smu2oaze@je6hmqobnz6r>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6okn62yhryjhw3xd"
Content-Disposition: inline
In-Reply-To: <5tvwcygupy2hheyggg7m7ancrrwrnin4lej2554pg6smu2oaze@je6hmqobnz6r>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--6okn62yhryjhw3xd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jacopo,

Thanks for the review.

On Jul 12, 2024 at 16:43:38 +0200, Jacopo Mondi wrote:
> On Thu, Jun 27, 2024 at 06:40:02PM GMT, Jai Luthra wrote:
> > From: Pratyush Yadav <p.yadav@ti.com>
> >
> > Different platforms that use this driver might have different number of
> > DMA channels allocated for CSI. So only as many DMA contexts can be used
> > as the number of DMA channels available. Get the number of channels
> > provided via device tree and only configure that many contexts, and
> > hence only that many pads.
> >
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > Co-developed-by: Jai Luthra <j-luthra@ti.com>
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > ---
> >  .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 44 ++++++++++++++=
++------
> >  1 file changed, 32 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/dr=
ivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> > index 13d7426ab4ba..b4b4bb69c88a 100644
> > --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> > +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> > @@ -40,7 +40,7 @@
> >  #define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 16)
> >
> >  #define PSIL_WORD_SIZE_BYTES		16
> > -#define TI_CSI2RX_NUM_CTX		1
> > +#define TI_CSI2RX_MAX_CTX		32
> >
> >  /*
> >   * There are no hard limits on the width or height. The DMA engine can=
 handle
> > @@ -53,8 +53,8 @@
> >
> >  #define TI_CSI2RX_PAD_SINK		0
> >  #define TI_CSI2RX_PAD_FIRST_SOURCE	1
> > -#define TI_CSI2RX_NUM_SOURCE_PADS	1
> > -#define TI_CSI2RX_NUM_PADS		(1 + TI_CSI2RX_NUM_SOURCE_PADS)
> > +#define TI_CSI2RX_MAX_SOURCE_PADS	TI_CSI2RX_MAX_CTX
> > +#define TI_CSI2RX_MAX_PADS		(1 + TI_CSI2RX_MAX_SOURCE_PADS)
> >
> >  #define DRAIN_TIMEOUT_MS		50
> >  #define DRAIN_BUFFER_SIZE		SZ_32K
> > @@ -112,14 +112,15 @@ struct ti_csi2rx_dev {
> >  	void __iomem			*shim;
> >  	struct mutex			mutex; /* To serialize ioctls. */
> >  	unsigned int			enable_count;
> > +	unsigned int			num_ctx;
> >  	struct v4l2_device		v4l2_dev;
> >  	struct media_device		mdev;
> >  	struct media_pipeline		pipe;
> > -	struct media_pad		pads[TI_CSI2RX_NUM_PADS];
> > +	struct media_pad		pads[TI_CSI2RX_MAX_PADS];
> >  	struct v4l2_async_notifier	notifier;
> >  	struct v4l2_subdev		*source;
> >  	struct v4l2_subdev		subdev;
> > -	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_NUM_CTX];
> > +	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_MAX_CTX];
> >  	/* Buffer to drain stale data from PSI-L endpoint */
> >  	struct {
> >  		void			*vaddr;
> > @@ -449,7 +450,7 @@ static int csi_async_notifier_complete(struct v4l2_=
async_notifier *notifier)
> >  		return ret;
> >
> >  	/* Create and link video nodes for all DMA contexts */
> > -	for (i =3D 0; i < TI_CSI2RX_NUM_CTX; i++) {
> > +	for (i =3D 0; i < csi->num_ctx; i++) {
> >  		struct ti_csi2rx_ctx *ctx =3D &csi->ctx[i];
> >  		struct video_device *vdev =3D &ctx->vdev;
> >
> > @@ -1231,10 +1232,12 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx=
_dev *csi)
> >
> >  	csi->pads[TI_CSI2RX_PAD_SINK].flags =3D MEDIA_PAD_FL_SINK;
> >
> > -	for (i =3D TI_CSI2RX_PAD_FIRST_SOURCE; i < TI_CSI2RX_NUM_PADS; i++)
> > +	for (i =3D TI_CSI2RX_PAD_FIRST_SOURCE;
> > +	     i < TI_CSI2RX_PAD_FIRST_SOURCE + csi->num_ctx; i++)
> >  		csi->pads[i].flags =3D MEDIA_PAD_FL_SOURCE;
> >
> > -	ret =3D media_entity_pads_init(&sd->entity, ARRAY_SIZE(csi->pads),
> > +	ret =3D media_entity_pads_init(&sd->entity,
> > +				     TI_CSI2RX_PAD_FIRST_SOURCE + csi->num_ctx,
> >  				     csi->pads);
> >  	if (ret)
> >  		goto unregister_media;
> > @@ -1320,8 +1323,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ct=
x *ctx)
> >
> >  static int ti_csi2rx_probe(struct platform_device *pdev)
> >  {
> > +	struct device_node *np =3D pdev->dev.of_node;
> >  	struct ti_csi2rx_dev *csi;
> > -	int ret, i;
> > +	int ret, i, count;
> >
> >  	csi =3D devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
> >  	if (!csi)
> > @@ -1343,13 +1347,29 @@ static int ti_csi2rx_probe(struct platform_devi=
ce *pdev)
> >  	if (!csi->drain.vaddr)
> >  		return -ENOMEM;
> >
> > +	/* Only use as many contexts as the number of DMA channels allocated.=
 */
> > +	count =3D of_property_count_strings(np, "dma-names");
>=20
> Is the property marked as required in the DTS bindings ?
>=20
> If that's the case, I thought the assumption was that dts are
> 'correct'.
>=20

I see. Yes it is a required property, so correct dts should have at=20
least one channel. In that case I don't see a problem dropping these=20
checks.

> > +	if (count < 0) {
> > +		dev_err(csi->dev, "Failed to get DMA channel count: %d\n",
> > +			count);
> > +		return count;
> > +	}
> > +
> > +	csi->num_ctx =3D count;
> > +	if (csi->num_ctx > TI_CSI2RX_MAX_CTX) {
> > +		dev_warn(csi->dev,
> > +			 "%u DMA channels passed. Maximum is %u. Ignoring the rest.\n",
> > +			 csi->num_ctx, TI_CSI2RX_MAX_CTX);
> > +		csi->num_ctx =3D TI_CSI2RX_MAX_CTX;
> > +	}
> > +
> >  	mutex_init(&csi->mutex);
> >
> >  	ret =3D ti_csi2rx_v4l2_init(csi);
> >  	if (ret)
> >  		goto err_v4l2;
> >
> > -	for (i =3D 0; i < TI_CSI2RX_NUM_CTX; i++) {
> > +	for (i =3D 0; i < csi->num_ctx; i++) {
> >  		csi->ctx[i].idx =3D i;
> >  		csi->ctx[i].csi =3D csi;
> >  		ret =3D ti_csi2rx_init_ctx(&csi->ctx[i]);
> > @@ -1388,14 +1408,14 @@ static void ti_csi2rx_remove(struct platform_de=
vice *pdev)
> >  	struct ti_csi2rx_dev *csi =3D platform_get_drvdata(pdev);
> >  	int i;
> >
> > -	for (i =3D 0; i < TI_CSI2RX_NUM_CTX; i++) {
> > +	for (i =3D 0; i < csi->num_ctx; i++) {
> >  		if (vb2_is_busy(&csi->ctx[i].vidq))
> >  			dev_err(csi->dev,
> >  				"Failed to remove as queue busy for ctx %u\n",
> >  				i);
> >  	}
> >
> > -	for (i =3D 0; i < TI_CSI2RX_NUM_CTX; i++)
> > +	for (i =3D 0; i < csi->num_ctx; i++)
> >  		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
> >
> >  	ti_csi2rx_cleanup_notifier(csi);
> >
> > --
> > 2.43.0
> >
> >

--=20
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

--6okn62yhryjhw3xd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmaWPlQACgkQQ96R+SSa
cUUvnRAA1ItmQh2ng2ggLz/LPUlrbknfNJ+mbZFD0mS+TzbHCCIYPdolYgrkZ5r0
LiIlSRMC4rJcgU0QwzdXpStBnE21jN5Qhjd96DHAgpA25Q+loGGHFQDmENT/F1Cv
axCdJYNsoS4vJBklP0bvLhJSZ11EVKNuKD6nBpWxZC8w79mZAlhX/D7HtnAsIvPG
QjEP9/nHGj1u50KkF/Kjg0qvtpvcRjZJAiEfAzUSkloD8+Ld9+kRGNhEyBcW8FJh
GnBaRWeRvG4lNnjvyU0QDrFtke7Q90InrqrWbU5bdVxDJnTOhdinH6XNA8U/YE2+
hzbPLYCUpiOxpdpk/PTvGa0r4Me0aK8Hzt5pwGFUlAZlwtUSS+LUATYAuS7OnnsV
Zi0hv65yrLEcp9OLh9ExH8XeGS/DnqM9CcooUMePH8uLHDE8XmodnfAID6sOprgD
gdpCg+WvmOJWASxMErnRTR09VHqrtVhFAUWdDHRnBdAEXW0DzXfDgRrjBDdfDLVa
ObBCEwIdvrdOEGKUDLvb5rzT8vyvb7VnjMgLb3Q7SEohv9wi+/Lcg4ajGsnWWasw
4n61j0CKQJ8HCn1irOghu4RfBpnjYyJ3x31mLGiR7DlEDpvDppJyC98ZIsEyFyGU
tapbQI7DGA9FlqjMBO/O7WzH1F+Yd2sRsjeZ6vtYddJLy2dkJAw=
=UBtn
-----END PGP SIGNATURE-----

--6okn62yhryjhw3xd--

