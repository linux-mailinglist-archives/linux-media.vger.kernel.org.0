Return-Path: <linux-media+bounces-15043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE129322EC
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 11:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9F1A2833F0
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 09:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC56E196D98;
	Tue, 16 Jul 2024 09:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Tz7i74hy"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792E96FB8;
	Tue, 16 Jul 2024 09:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721122447; cv=none; b=qMV+AXmT9d57u3dN9t0ZhqEnU45fvUBUp31fsttf5/C29N1yJehCq+5XYv4Z1g5hdHOvIj1Pe9ycssfe1ZFL72PkJa20gx2cFSVBw3JMQGMyDCUr0r1AZky/2m60VEDFPdKntKA47IRiYYF5qAICTFHPKX2nnHzT7Iq6pc+5Qh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721122447; c=relaxed/simple;
	bh=0zFMOwIA2f4AuUndCmpt44QxcQqTsUyHctZgFIv6nLw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mei0mWumq5tiMww6hktbqwrV6yEicxTxtqgA06y6383qVwmWtr+F4+yqGZ49WCQMtmcJt8JJy7A7wRKkpk92RBzdB94kxBAXeGWoqgxNodKi1ydM4Dbwl2GbVZHr0zE66D8MGKeJhp7EOoRjzAPwK/vNUfTREEFHSKYf/HnBI5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Tz7i74hy; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46G9XrJk051436;
	Tue, 16 Jul 2024 04:33:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721122433;
	bh=x07eb5Tqa2PIJcjXuvbyGLRcbZciJwjy2fLyxac5FvY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Tz7i74hyLQueCPzPdDEPf3WLHvAuk0Cz17E76ezfhgUe3p1aSpAcWPvqFblco372c
	 qAITsxDsmbAcHsSuHFLE5x0hCaIH4QMxPrgTaGaiUcQL67ZSY6wqYHo02HEkm43+Es
	 3fJtwFd6+WlCD01Ubv9QEEe09P7A1C7K2GJiEtuc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46G9Xr6X046857
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Jul 2024 04:33:53 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jul 2024 04:33:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jul 2024 04:33:53 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46G9Xqss080530;
	Tue, 16 Jul 2024 04:33:52 -0500
Date: Tue, 16 Jul 2024 15:03:51 +0530
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
Subject: Re: Re: [PATCH v2 09/13] media: ti: j721e-csi2rx: add support for
 processing virtual channels
Message-ID: <24zvyrlyon75gl5tgps2wdmwukv3uxlkjz5h6hkjdye2tqyyrr@nr4o2dzl7dw5>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-9-6ae96c54c1c3@ti.com>
 <gn4p7imootxlidam6uddits5i7zwo5azzzb3h3wcobxquqpczs@2msb66c5hs4y>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yertvnuukzkrc6t3"
Content-Disposition: inline
In-Reply-To: <gn4p7imootxlidam6uddits5i7zwo5azzzb3h3wcobxquqpczs@2msb66c5hs4y>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--yertvnuukzkrc6t3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jacopo,

On Jul 12, 2024 at 17:01:04 +0200, Jacopo Mondi wrote:
> Hi Jai
>=20
> On Thu, Jun 27, 2024 at 06:40:04PM GMT, Jai Luthra wrote:
> > Use get_frame_desc() to get the frame desc from the connected source,
> > and use the provided virtual channel instead of hardcoded one.
> >
> > get_frame_desc() works per stream, but as we don't support multiple
> > streams yet, we will just always use stream 0. If the source doesn't
> > support get_frame_desc(), fall back to the previous method of always
> > capturing virtual channel 0.
> >
> > Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > ---
> >  .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 39 ++++++++++++++=
++++++++
> >  1 file changed, 39 insertions(+)
> >
> > diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/dr=
ivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> > index b4b4bb69c88a..c0916ca1a6f8 100644
> > --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> > +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> > @@ -29,6 +29,7 @@
> >  #define SHIM_DMACNTX_EN			BIT(31)
> >  #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
> >  #define SHIM_DMACNTX_SIZE		GENMASK(21, 20)
> > +#define SHIM_DMACNTX_VC			GENMASK(9, 6)
> >  #define SHIM_DMACNTX_FMT		GENMASK(5, 0)
> >  #define SHIM_DMACNTX_YUV422_MODE_11	3
> >  #define SHIM_DMACNTX_SIZE_8		0
> > @@ -105,6 +106,8 @@ struct ti_csi2rx_ctx {
> >  	struct media_pad		pad;
> >  	u32				sequence;
> >  	u32				idx;
> > +	u32				vc;
> > +	u32				stream;
> >  };
> >
> >  struct ti_csi2rx_dev {
> > @@ -571,6 +574,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_c=
tx *ctx)
> >  	}
> >
> >  	reg |=3D FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
> > +	reg |=3D FIELD_PREP(SHIM_DMACNTX_VC, ctx->vc);
> >
> >  	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
> >
> > @@ -844,6 +848,33 @@ static void ti_csi2rx_buffer_queue(struct vb2_buff=
er *vb)
> >  	}
> >  }
> >
> > +static int ti_csi2rx_get_vc(struct ti_csi2rx_ctx *ctx)
> > +{
> > +	struct ti_csi2rx_dev *csi =3D ctx->csi;
> > +	struct v4l2_mbus_frame_desc fd;
> > +	struct media_pad *pad;
> > +	int ret, i;
> > +
> > +	pad =3D media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD=
_FL_SOURCE);
> > +	if (!pad)
> > +		return -ENODEV;
> > +
> > +	ret =3D v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index,
> > +			       &fd);
> > +	if (ret)
> > +		return ret;
>=20
> Would it be better to fail at bound() time if the remote subdev
> doesn't support get_frame_desc ? you can use
>=20
>         if (!v4l2_subdev_has_op(subdev, pad, get_frame_desc)) {
>=20
> > +
> > +	if (fd.type !=3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> > +		return -EINVAL;
> > +
> > +	for (i =3D 0; i < fd.num_entries; i++) {
>=20
>         for (unsigned int i
>=20
> should num_entries be validated ?
>=20
> > +		if (ctx->stream =3D=3D fd.entry[i].stream)
> > +			return fd.entry[i].bus.csi2.vc;
> > +	}
> > +
> > +	return -ENODEV;
> > +}
> > +
> >  static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned in=
t count)
> >  {
> >  	struct ti_csi2rx_ctx *ctx =3D vb2_get_drv_priv(vq);
> > @@ -864,6 +895,14 @@ static int ti_csi2rx_start_streaming(struct vb2_qu=
eue *vq, unsigned int count)
> >  	if (ret)
> >  		goto err;
> >
> > +	ret =3D ti_csi2rx_get_vc(ctx);
> > +	if (ret =3D=3D -ENOIOCTLCMD)
> > +		ctx->vc =3D 0;
>=20
> Ah, so you fallback to 0 in case the subdev doesn't support
> get_frame_desc. I'm not sure what would be better here maybe wait for
> other's opinions as well.
>=20
> Personally I would fail earlier to make sure subdev drivers are forced
> to impement get_frame_desc
>=20

Before we break support for all non-streams-aware subdevs, I think maybe=20
we need a default v4l2_subdev_get_frame_desc() helper that returns a=20
single entry with stream =3D 0 and csi2.vc =3D 0, as that is usually what=
=20
most sensors do.

> > +	else if (ret < 0)
> > +		goto err;
> > +	else
> > +		ctx->vc =3D ret;
> > +
> >  	ti_csi2rx_setup_shim(ctx);
> >
> >  	ctx->sequence =3D 0;
> >
> > --
> > 2.43.0
> >
> >

--=20
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

--yertvnuukzkrc6t3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmaWPn4ACgkQQ96R+SSa
cUUbUA//edVUVbH7L6+SVkdrQwL8NmFvhRjgm3e1t9bB8+R3dj/0Lk/64P4bOijG
ny57kPLFnNf+2IFqa8XStlLAAyWjsybbQxeo2ibpMUYY7vW9sjp4rHd/6SG1dGJD
3N9Q+RmC78v1efZYseS9cOhnDSLwtSBRf1a+1lu2+JuPYrMS+Gu/i1s5obK/KMcd
VSHD/aylhAO9vrtNwWELjma6qe8ZfXZrYWF8OPct09wJ35G6hCyB9wJ8sLmMOfqy
5tgykITsBNHUT9fKjhSKfXIJBbhpgpKxvARoaw+6Ira5lLBlLPBi4RbnpM8pN4MK
MnvfkVkaqE/CoQ4ZE07wegDWTXABMwMZfqi4pIOn4M+7ZQW/It0OF1wiysORH6AT
SzOX69Do84tU+dSl57uOAmYR+p3s3x6UaO2KiOyuUeltRG/omScm6q7UpSQvWiDJ
81jmLN01ZSWD/Ox1oU+JO/QJT5SNJTL9zvccNPUC0WSPx/w4qLEqT969ZfImHngv
DLlWRPfhCRIIy4luG5+KFlDjO9UdxaOVe2Dg5GobWHzCIPRmLRwbCOSnNdn+FVcN
bHOBBCB+qRBDuDMWVHcJTXdop4X+ZU1ok9aZC0BP0Mg/qJz3rQm5d45AT9ELdB0u
m8qMKKtBws8kJejqhivUv+uplm20nhZ2JuffUgb+IcwZVJ2UkC0=
=Norr
-----END PGP SIGNATURE-----

--yertvnuukzkrc6t3--

