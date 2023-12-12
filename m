Return-Path: <linux-media+bounces-2199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B74080E54B
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 08:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5D1D1F216F6
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 07:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEC2179A6;
	Tue, 12 Dec 2023 07:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="igsJD+AR"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 008201992
	for <linux-media@vger.kernel.org>; Mon, 11 Dec 2023 23:55:47 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BC7tePq128028;
	Tue, 12 Dec 2023 01:55:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1702367740;
	bh=u3RacPgymR+2teyToOLN1Bfh9VTe8pQNBzgtrwuWFGk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=igsJD+ARFwNsjP3z4zc0CFt2p7Fsx67XfPNsbe/zVSKlYcf1LLKv3ymlnAVdnQHwq
	 5/qaE1o473dFMe/BILmB33ueFbRG5Nba4AHjb117w4k0HWv25TONi+gR7PzC3kk5oo
	 UL/86cbXjcJ4hVeCkVwVYmC+w8brH3AxA8pzIg1E=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BC7tdSN119770
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Dec 2023 01:55:39 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 12
 Dec 2023 01:55:39 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 12 Dec 2023 01:55:39 -0600
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BC7tdns085705;
	Tue, 12 Dec 2023 01:55:39 -0600
Date: Tue, 12 Dec 2023 13:25:32 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Julien Massot <julien.massot@collabora.com>
CC: <linux-media@vger.kernel.org>, <kernel@collabora.com>
Subject: Re: [PATCH 3/3] media: ti: j721e-csi2rx: add GREY format
Message-ID: <4dwi75mauw2p73cbaylqwkqg42e44y7fjxwr7gykkh6wwbcueh@yilkvc6k3lyz>
References: <20231208152255.472467-1-julien.massot@collabora.com>
 <20231208152255.472467-4-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="odbvkums7ztq4t6a"
Content-Disposition: inline
In-Reply-To: <20231208152255.472467-4-julien.massot@collabora.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--odbvkums7ztq4t6a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 08, 2023 at 16:22:55 +0100, Julien Massot wrote:
> Add Grey format to properly select RAW8 data type.
>=20
> Tested with a ST VG5661 sensor.
>=20
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index ada61391c8d2..46d37401512b 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -158,6 +158,12 @@ static const struct ti_csi2rx_fmt ti_csi2rx_formats[=
] =3D {
>  		.csi_dt			=3D MIPI_CSI2_DT_RAW8,
>  		.bpp			=3D 8,
>  		.size			=3D SHIM_DMACNTX_SIZE_8,
> +	}, {
> +		.fourcc			=3D V4L2_PIX_FMT_GREY,
> +		.code			=3D MEDIA_BUS_FMT_Y8_1X8,
> +		.csi_dt			=3D MIPI_CSI2_DT_RAW8,
> +		.bpp			=3D 8,
> +		.size			=3D SHIM_DMACNTX_SIZE_8,
>  	}, {
>  		.fourcc			=3D V4L2_PIX_FMT_SBGGR10,
>  		.code			=3D MEDIA_BUS_FMT_SBGGR10_1X10,
> --=20
> 2.43.0
>=20

Acked-by: Jai Luthra <j-luthra@ti.com>

--=20
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

--odbvkums7ztq4t6a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmV4EfMACgkQQ96R+SSa
cUXGUw/+OcpM9OLXasYoIZ43fy30I81371QbZ1pAydrkHDAQuCNdimbW7Tl7sUza
etNztVvwUUL/D/ZA8ax5IVV0lLJCbQoy7qmzWgC9Gh0S/T3y737PPRgHB8UCKIY+
2TeuxzWyftoDFHWTxm86ZFlpOIy/vE+p1iufKnPZnC3iyMltTgtXvfufnhnWtuNt
CIukmAWQNWGqvxcMo/5hC/YwD7H3pHVLx8y43san+rYjZAmznD7F5d7Zi/4FoZmI
VzL9zJhPXWF723v9VTTYjFj5FyNKMvCMc9vACuFsqk2QI2M/MPejhwAK2fs2qh0f
bsUwh4+OHD0ywsLxRWgvoFgQsLOzbzN6pEtmLzRTpNJ+wDodAX23B8tV0itiwNRc
Y/5+ltx9iTTsyWqkHB8vuE8gXGdPrLKDqG7Yjmfy9KnWM9ud2/1r5xanvSS5GMgx
zr4naNr5fzS3j4cxOqVzW1+SHJQobXsQZZ56JBT4ToMQ2+YOK1psa6x6PhIL0hfE
bnoHqu1hw4SYq2l8DSG1D15imW9rmxeYxMW7Y3uWs2gYAqdl/dDw7GDdYPSt+tle
t+sduQjxmb6+9AsyhHaOBEj+MiyuHpLp7OjQhNxCzssx6w9mtVxwMCi8tBvalcpl
hz53F6FwXVFXCEiZ3pelzfVIyhK3w/4QzJYVS4UvEuonJmXmVqI=
=YvP4
-----END PGP SIGNATURE-----

--odbvkums7ztq4t6a--

