Return-Path: <linux-media+bounces-2198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CD480E54A
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 08:55:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C0C61F21A73
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 07:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D36179A1;
	Tue, 12 Dec 2023 07:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VZxnjQff"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60511173B
	for <linux-media@vger.kernel.org>; Mon, 11 Dec 2023 23:55:28 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BC7tJ0w110940;
	Tue, 12 Dec 2023 01:55:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1702367719;
	bh=DGzL4mpvA0uHmyvY5EiW7EVT+J6ow1TeUVoIWNsip0A=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=VZxnjQffD2yyAKQ4oQ4qQ1T7EE2bWlPG41vd/bMNb26hw/9WUfUO7KQf4Q/VKGofr
	 IkK4jBvRmXXL6+NqVN4rcYRCEuIC/yF4ivkeY9OhRbpg7wyadhUIkvqWw1ULvYp7Wo
	 EB8AVQV/G85pDyWEXXcx4egM5iiOKcyoMnWz5jRc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BC7tJP9014045
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Dec 2023 01:55:19 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 12
 Dec 2023 01:55:19 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 12 Dec 2023 01:55:19 -0600
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BC7tIRS085376;
	Tue, 12 Dec 2023 01:55:18 -0600
Date: Tue, 12 Dec 2023 13:25:11 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Julien Massot <julien.massot@collabora.com>
CC: <linux-media@vger.kernel.org>, <kernel@collabora.com>
Subject: Re: [PATCH 2/3] media: cadence: csi2rx: add Y8_1X8 format
Message-ID: <yfz2quxck5c5rxcsgpoggdqot3wexs33vbe5bgvpisu7ystpke@7wxahvictfak>
References: <20231208152255.472467-1-julien.massot@collabora.com>
 <20231208152255.472467-3-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bke3753olknyacfh"
Content-Disposition: inline
In-Reply-To: <20231208152255.472467-3-julien.massot@collabora.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--bke3753olknyacfh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 08, 2023 at 16:22:54 +0100, Julien Massot wrote:
> Add support for MEDIA_BUS_FMT_Y8_1X8 format.
>=20
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media=
/platform/cadence/cdns-csi2rx.c
> index b9356cc7a192..d24880e27607 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -114,6 +114,7 @@ static const struct csi2rx_fmt formats[] =3D {
>  	{ .code	=3D MEDIA_BUS_FMT_SGBRG8_1X8, .bpp =3D 8, },
>  	{ .code	=3D MEDIA_BUS_FMT_SGRBG8_1X8, .bpp =3D 8, },
>  	{ .code	=3D MEDIA_BUS_FMT_SRGGB8_1X8, .bpp =3D 8, },
> +	{ .code	=3D MEDIA_BUS_FMT_Y8_1X8,     .bpp =3D 8, },
>  	{ .code	=3D MEDIA_BUS_FMT_SBGGR10_1X10, .bpp =3D 10, },
>  	{ .code	=3D MEDIA_BUS_FMT_SGBRG10_1X10, .bpp =3D 10, },
>  	{ .code	=3D MEDIA_BUS_FMT_SGRBG10_1X10, .bpp =3D 10, },
> --=20
> 2.43.0
>=20

Acked-by: Jai Luthra <j-luthra@ti.com>

--=20
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

--bke3753olknyacfh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmV4Ed4ACgkQQ96R+SSa
cUU80hAArNp6JCv41aBEJjHKhQuVi9dlXYeUF6v/71KA/LRIMZPdGm2bbhhJFf+/
kIvu62rc2Uu68xDE8Y6SH1HNgildy8oexaCBEQnptqb2Mv6j92aPA8QAaJZXgBP2
oUnoPnxo4LY9OOYmybEDckOlfbutW6vjtJKyUCuATOc/rsOmbdXCDPoRALkjnxoz
qrSlMNOW5LSU/p3xixdhG3/cgjOiMtHYCzThDy/VRdwo8sPAxtJ/lFSnCI9JS0Ck
xskhk67dueSC58fp8LN5UmW4f4WlywS8Mm3LvhiInwq+LpiH9RDTHlCjVVX/BJHn
8Y3l4DfH2GtCOUEwqKH0Ydp8kQV9kvEdi9FLaR1aG+n7bIyt0oZZBrG98FHV4O4n
VH3ltHeGA2f/zb0foxV0fnSlcqfzoP+M25YpIAriq5sD9DRQYOdb5txbSnaQQ/MU
0TQDrkKUFFUCbkEo6mQ+9pBZaQX5jtk3f3r6ir7KRSm4LtXMkIq01xicVx+ENqjt
NLSLk+2j8AHpcaFc6W3q7NCq7M6/zJkvGn/LW/kGsR+ylhKG2U8EI5U45zQlD0A+
Ie2cKd/xTF3lBN7mh9opF4gSJUGs2Kxbuh/7XnxL+xR9/7hxalvRJ0hwxCFSJJYA
5AuCihyxabDhwQkry0d4V9BqpotQinPqsSIDouqGWX/Eucp4SxA=
=3Si1
-----END PGP SIGNATURE-----

--bke3753olknyacfh--

