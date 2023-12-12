Return-Path: <linux-media+bounces-2197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA37D80E547
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 08:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73BAF1F21D68
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 07:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90BFE1799C;
	Tue, 12 Dec 2023 07:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XyRFeFnV"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D704510F
	for <linux-media@vger.kernel.org>; Mon, 11 Dec 2023 23:54:53 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BC7smkW110319;
	Tue, 12 Dec 2023 01:54:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1702367688;
	bh=PEQrhu47pLPx7bifzx0N3aZaZZrpuzDYJsIGtxwqY5E=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=XyRFeFnVSt6eiBj9ZjnMwIHJZy0Z7aU1MkoYKbpXfeOvD8U1VOYsatZqhqLOrPLTB
	 +W0jsKxRYejDtE97xXWQZeiPuTPmusP8vQoNeIvK5Bj7lGS605mChwlzP0jjiCCk3y
	 huuXoKbCsdCZYDSp3QHSHbpBHc43JFVIVDJBqvVo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BC7smb4005253
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Dec 2023 01:54:48 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 12
 Dec 2023 01:54:48 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 12 Dec 2023 01:54:48 -0600
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BC7slJK129199;
	Tue, 12 Dec 2023 01:54:48 -0600
Date: Tue, 12 Dec 2023 13:24:40 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Julien Massot <julien.massot@collabora.com>
CC: <linux-media@vger.kernel.org>, <kernel@collabora.com>
Subject: Re: [PATCH 1/3] media: cadence: csi2rx: use match fwnode for media
 link
Message-ID: <ku5uvdnc3oufpx46cerxzsohjfqub7zf63kdnvsogsmbsbdnai@6ohax2rdh5h2>
References: <20231208152255.472467-1-julien.massot@collabora.com>
 <20231208152255.472467-2-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5ykvfgvfmty2qtpc"
Content-Disposition: inline
In-Reply-To: <20231208152255.472467-2-julien.massot@collabora.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--5ykvfgvfmty2qtpc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Thanks for the patch.

Please make sure to add the media maintainers in To/Cc, you can use=20
get_maintainers.pl script for the full list.

On Dec 08, 2023 at 16:22:53 +0100, Julien Massot wrote:
> On some subdev the fwnode is the device node and not the endpoint node.
> Using the subdev fwnode doesn't allow to fetch the subdev
> pad we are connected to when the remote subdev has multiple
> output pads.
>=20
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media=
/platform/cadence/cdns-csi2rx.c
> index b751227fc8a0..b9356cc7a192 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -464,7 +464,7 @@ static int csi2rx_async_bound(struct v4l2_async_notif=
ier *notifier,
>  	struct csi2rx_priv *csi2rx =3D v4l2_subdev_to_csi2rx(subdev);
> =20
>  	csi2rx->source_pad =3D media_entity_get_fwnode_pad(&s_subdev->entity,
> -							 s_subdev->fwnode,
> +							 asd->match.fwnode,
>  							 MEDIA_PAD_FL_SOURCE);

LGTM, this also fixes a similar issue I was seeing with getting fwnode=20
pad ds90ub960 source which has multiple output pads.

Reviewed-by: Jai Luthra <j-luthra@ti.com>

>  	if (csi2rx->source_pad < 0) {
>  		dev_err(csi2rx->dev, "Couldn't find output pad for subdev %s\n",
> --=20
> 2.43.0
>=20

--=20
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

--5ykvfgvfmty2qtpc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmV4Eb8ACgkQQ96R+SSa
cUVYMhAAtQIhn6SGrmj4i6rvFXpl3ZPUA24gwkzKAsO/26qnyp7xKRMN4KvowhG7
32pWS4YSv/0h/BS2TRBujT9FbrEpcrDF1BUF/ezQsrRwpv72qsKGD6n19ceQiNm1
Il97bco+jgjHoiEM4tZkOSQYrBiv4e/UJ5C4IM/iNIqNQ6NLele3M+cCMvJ7PrH+
KuNRy8wJXGR+Iu+pFfH5QYzDDUY8dJUs5tBXrREhEfEMWJU0l6sO3iTJzYM0xX7B
paoQSgH/GO2qjR3FaT0IWu3cbLUDd4KtWm2rx608ma8e6DK8mq6t08gSzU3TSAkQ
MJ0byoAwmm5L/VnXds28ukvot6Y+tmtfehSaiyeRBIFwqm2x4Cp5NWP5w6NG9JAw
QtIsj2vEfU+7kzhgL0lE0j2Aqz5Qq488cC/1AHcC9CTbq/SjaXodfxiVqwymJZIv
FO34+Bo62IPpRs21qjMrjZQ4JdlMmeKgCzbxb/bjyUaGNxN6ElPhWAgUuihiQyBu
cpiHy6dNEQI7Zm0Vg8dK/5N5FIYXJpaxa0XeHztJTdETIbvYtJcTPK0nV21LH7D8
qszpJQYeScz8MRzh0KNcCKSoyH3b3GxEGJZbh5nwrXnmK2z/pEtMQKPP1EA+BXy6
iRYqVQ7A3dse9U5bCg/Hy4OmZ5O7WxOI8dr5WZE2aACCOMcwEU8=
=Mn0z
-----END PGP SIGNATURE-----

--5ykvfgvfmty2qtpc--

