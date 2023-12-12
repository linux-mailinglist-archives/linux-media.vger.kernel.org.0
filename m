Return-Path: <linux-media+bounces-2200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1543D80E54E
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 08:57:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 377191C208CC
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 07:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30017179AC;
	Tue, 12 Dec 2023 07:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="m80EaJvF"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08F4A0
	for <linux-media@vger.kernel.org>; Mon, 11 Dec 2023 23:57:30 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BC7vSjt111480;
	Tue, 12 Dec 2023 01:57:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1702367848;
	bh=79fpc5IlBGZX5Drzm7f48tn1Gds3cUF+/WVwFRduAPE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=m80EaJvFLI3kB1rJ9IbyvGyWcxIk/iN+Hgj8KYg4X6b/6tw2m2x7onYnGW7mlHxSZ
	 ALrTpt+QG0e0lvQ9hQiw8btiX2cnLneHfHdq9iIrmi2gaDL/+dK1ct6bCz+nwOTDtt
	 3Tjr+JOE/LlJheazmT2zP6b73i7WetttWQwPQOWU=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BC7vS1J120774
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Dec 2023 01:57:28 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 12
 Dec 2023 01:57:28 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 12 Dec 2023 01:57:28 -0600
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BC7vRgE087578;
	Tue, 12 Dec 2023 01:57:27 -0600
Date: Tue, 12 Dec 2023 13:27:20 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Julien Massot <julien.massot@collabora.com>
CC: <linux-media@vger.kernel.org>, <kernel@collabora.com>
Subject: Re: [PATCH 1/3] media: cadence: csi2rx: use match fwnode for media
 link
Message-ID: <hqupxqsnjhko2sjoyj4idzmwqc3dcbavin6cvuqhnfdqkg5mlh@fc3leml2har5>
References: <20231208152255.472467-1-julien.massot@collabora.com>
 <20231208152255.472467-2-julien.massot@collabora.com>
 <ku5uvdnc3oufpx46cerxzsohjfqub7zf63kdnvsogsmbsbdnai@6ohax2rdh5h2>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jaouqyg5q3vkbduv"
Content-Disposition: inline
In-Reply-To: <ku5uvdnc3oufpx46cerxzsohjfqub7zf63kdnvsogsmbsbdnai@6ohax2rdh5h2>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--jaouqyg5q3vkbduv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 12, 2023 at 13:24:42 +0530, Jai Luthra wrote:
> Hi Julien,
>=20
> Thanks for the patch.
>=20
> Please make sure to add the media maintainers in To/Cc, you can use=20
> get_maintainers.pl script for the full list.
>=20
> On Dec 08, 2023 at 16:22:53 +0100, Julien Massot wrote:
> > On some subdev the fwnode is the device node and not the endpoint node.
> > Using the subdev fwnode doesn't allow to fetch the subdev
> > pad we are connected to when the remote subdev has multiple
> > output pads.
> >=20
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> > ---
> >  drivers/media/platform/cadence/cdns-csi2rx.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/med=
ia/platform/cadence/cdns-csi2rx.c
> > index b751227fc8a0..b9356cc7a192 100644
> > --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> > +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> > @@ -464,7 +464,7 @@ static int csi2rx_async_bound(struct v4l2_async_not=
ifier *notifier,
> >  	struct csi2rx_priv *csi2rx =3D v4l2_subdev_to_csi2rx(subdev);
> > =20
> >  	csi2rx->source_pad =3D media_entity_get_fwnode_pad(&s_subdev->entity,
> > -							 s_subdev->fwnode,
> > +							 asd->match.fwnode,
> >  							 MEDIA_PAD_FL_SOURCE);
>=20
> LGTM, this also fixes a similar issue I was seeing with getting fwnode=20
> pad ds90ub960 source which has multiple output pads.
>=20
> Reviewed-by: Jai Luthra <j-luthra@ti.com>

This should probably carry a fixes tag as well:

Fixes: 1fc3b37f34f69 ("media: v4l: cadence: Add Cadence MIPI-CSI2 RX driver=
")

>=20
> >  	if (csi2rx->source_pad < 0) {
> >  		dev_err(csi2rx->dev, "Couldn't find output pad for subdev %s\n",
> > --=20
> > 2.43.0
> >=20
>=20
> --=20
> Thanks,
> Jai
>=20
> GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145



--=20
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

--jaouqyg5q3vkbduv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmV4El8ACgkQQ96R+SSa
cUU03w//fNCggb3csb7DTI8pV0Li+T5L+NYsefmXnVbxMhF1Q/I5wLFkdkkQUYDP
qhCpW0tDUqWG+zGupyd6CPHr2HVzyaGk86twVjIEv2qc80UgVauzXwpNs3Ft8L3z
OKtq8ypLRHuKdCFkOCmW2V04vKah/ZZr+bJSo9dtE6AEAqe+vbiq26cuFy4dWC43
x7Brj46tRgxhuPEcmOqLySeZB+vn0P1YOtKtii2Wzp0C8+31hdLCxTlNFUTG1Siu
A/ky2BVd8sQuMBeKacG1Q6CySgIvF3Nhhf9QfxRzanfSyat2mOxGnpywqb+FkQuE
+ai6jwAFCvByzh0KDfR4b4d+S2mSQkkVLSD4o5slUK+ER6iuuFwDo824VUfUEmgM
ZZbPtXFlzKb36BUOgvOhtZlYYmT1IB/FiEaeX7VtHm5QJaMx6DIylAIajOqlqgPj
24Oft7WJMsvkC+6btBrDbb4lSiHxwt1VVfM/tD8g7qQ5WFgJqonDbLnQNDihDcfI
95TZ5+lISJ78LZOxKGQ876F5WK9WHxLNwACci1Dm7oc6G0aZ4+s6ysIDcsaMCEHy
lsyNVdq/tFQzxAeNQUR5Myx3PFMf7GYq1+p0CR6SNCDCDR0kpf2u06xV29MO3Jlr
/08JJWhVpraqXDlbw4JFqdjrcjGE9/01IfVGqYP58S9YX255Rj8=
=q4XH
-----END PGP SIGNATURE-----

--jaouqyg5q3vkbduv--

