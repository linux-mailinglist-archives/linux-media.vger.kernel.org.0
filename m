Return-Path: <linux-media+bounces-28300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9819A62F9E
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 16:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F06016AB87
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 15:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B78204583;
	Sat, 15 Mar 2025 15:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="BkSEMX9O"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7EB18C93C;
	Sat, 15 Mar 2025 15:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742053815; cv=pass; b=V3wXnTmpSRYF4m5QU7iei4apdse4O8VwQkncLGulCiSzCGIjuafjOg8ZWUjc4sc+205yqayPy2M166YP4f6FRkC7wS7stciP70DS/WA1uHHLJr9pRaa+0kAUTahr9GNFfC8wN2XNggoXCex3u4N8vHZPBVIup2KQ6MlXgzhsSco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742053815; c=relaxed/simple;
	bh=pB3o5+BRGDWm6IPHzZPOcWXOzJO2cZb6dTWn7LYbZAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjl6xqvsexiCGGplv1MyBHirDC91HgWn1Wh/34T8bm29FX3y6zxFezjL6Tg1YUzHVAuaQSB6o4V3DxmachtS2zln1ME7XEUCl7hMvk1X0ndjRM82MI783zyJtfFhAGlxPHssbuT4XEfYrCWEJz74kPsgmnTvolCJNnVvRevbI4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=BkSEMX9O; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1742053801; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=i+ro1dcF0uLPsvgZAigD9GaSe9Ek08AWP3dw4wN5ka69aQTv8z50hluFYNXK/GKVO6Uhq0xAv3jU8bVkY+JPzRCuYoOkGObjLQHsCtGKUrWvrdZW9bYlsojxjbhKfNFy7S8htJiWRez3Rmhjia0CSsKW2fBZvZ2eZcYyoubUBzA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742053801; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=N8+vIxETG6iM1XQNH9Vk8x/eH2pOCLTXfTh1U91auIQ=; 
	b=kq6H0OiMnlN8IW9idpBf5ao6gVAYMcpSWHoTqjoWjPBr36YRI4Vfp7AKb9qJrvTOn+zAt/zrj4Nt3IqqVybd2/PtKCLH8nc9ZsPUgQACTRIw3sWkGsqizetfRRs02fzlPXOBcs2/xr4VFMCM8jQsGwzCcLbAJpxDTloCiDl1FVQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742053801;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=N8+vIxETG6iM1XQNH9Vk8x/eH2pOCLTXfTh1U91auIQ=;
	b=BkSEMX9OzriOy5Sl/SdoFjnQsJW4Gpj62CrPgCJqRml1VrdO4Jz5lIjOoKmokpVw
	4r+eLKMMEtlkwJhU9ztSXXLxY6krX9I0tzGzjGCtVL/HZDfNY+s93uNTzJ/wxvGdSHp
	Gu5cbd6mZPC5VgIVryyblgJwueUr6HbED3pLrYHU=
Received: by mx.zohomail.com with SMTPS id 1742053799582395.2728081327041;
	Sat, 15 Mar 2025 08:49:59 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 7EBD818068B; Sat, 15 Mar 2025 16:49:55 +0100 (CET)
Date: Sat, 15 Mar 2025 16:49:55 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: David Heidelberg <david@ixit.cz>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: dt-bindings: Convert Analog Devices ad5820 to
 DT schema
Message-ID: <ih3ykzxrnpbwg4bvkmpoo2tashcxidir4r4zofhlvrs7udkp7o@6qtqh6wtmkwd>
References: <20250314-b4-ad5820-dt-yaml-v2-1-287958c3c07c@ixit.cz>
 <Z9SYOCVxt70u_bad@kekkonen.localdomain>
 <ec820dbf-5a37-4477-a99d-f3fbe338c198@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="azdwkisa6isnhljf"
Content-Disposition: inline
In-Reply-To: <ec820dbf-5a37-4477-a99d-f3fbe338c198@ixit.cz>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/242.14.74
X-ZohoMailClient: External


--azdwkisa6isnhljf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] media: dt-bindings: Convert Analog Devices ad5820 to
 DT schema
MIME-Version: 1.0

Hello,

On Sat, Mar 15, 2025 at 02:18:40PM +0100, David Heidelberg wrote:
> On 14/03/2025 21:57, Sakari Ailus wrote:
> > Thanks for converting this to YAML.
> >=20
> > On Fri, Mar 14, 2025 at 08:58:27PM +0100, David Heidelberg via B4 Relay=
 wrote:
> > > From: David Heidelberg <david@ixit.cz>
> > >=20
> > > Convert the Analog Devices ad5820 to DT schema format.
> > >=20
> > > Add the previously undocumented io-channel-cells property,
> > > which can be omitted. If present, it must be set to 0,
> > > as the device provides only one channel.
> >=20
> > What's the purpose of this property? The driver doesn't use it nor I th=
ink
> > it provides any information on the hardware either. The above descripti=
on
> > also appears to be saying it's redundant.
>=20
> Hello Sakari,
>=20
> from my understanding, you're right.
>=20
> I would prefer to drop it, see [1].
>=20
> Anyway from reading of documentation I understood it may be right to have
> the property empty, but also may be omitted. I saw both approaches in the
> code.
>=20
> If you choose not liking this redudancy, I push [1] and drop the property
> here.
>=20
> David
>=20
> [1] https://patchwork.kernel.org/project/linux-omap/patch/20250213203208.=
93316-1-david@ixit.cz/

Like all DT properties starting with #, this is not about hardware,
but about parsing the device tree itself and used by core DT code:

$ git grep io-channels drivers/of/property.c
drivers/of/property.c:DEFINE_SIMPLE_PROP(io_channels, "io-channels", "#io-c=
hannel-cells")

Have a look at the following example DT:

iio_device1: iio-provider1 {
    #io-channel-cells =3D <2>;
};

iio_device2: iio-provider2 {
    #io-channel-cells =3D <1>;
};

iio_device3: iio-provider3 {
    #io-channel-cells =3D <0>;
};

example-iio-user {
    my-iio-reference =3D <&iio_device1 AREA0 CHANNEL2>, <&iio_device3>, <&i=
io_device2 CHAN0>;
};

While you can easily understand that without the io-channel-cells,
please have a look what it looks like after sending it through the
DT compiler. You will get something like this:

iio-provider1 {
    #io-channel-cells =3D <2>;
    phandle =3D <23>;
};

iio-provider2 {
    #io-channel-cells =3D <1>;
    phandle =3D <10>;
};

iio-provider3 {
    #io-channel-cells =3D <0>;
    phandle =3D <37>;
};

example-iio-user {
    my-iio-reference =3D <23 42 13 37 10 0>;
};

But you can safely drop it, when there are no references to the IIO
device. So it's obviously not required in all cases.

I hope I could explain the purpose well enough :)

Greetings,

-- Sebastian

--azdwkisa6isnhljf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmfVoZ8ACgkQ2O7X88g7
+ppUzg//c4MMMBd4vDUcG7jPiLliZpOWmWdxf5SUUjEagfIdnvaIZjOOtULE1G+C
6V35AepHyxfbLXOKE2FPneH2XOnuMAkxE/wQHryuuV/+RmgGfENYwbrClcGOOdO1
ndR+oF/DDxlLb7C6PeqjDEllu72V6wbZWyo0No0sgsz9i5+X0q3yRFJ33tBlIYJ4
7xiPAdSp8d9axi4YCRQZFb8bbbPEiiHjpGkipW06q03p8hiivV9z+ER2PjU2z7J1
JCBYkJ7EsT/HCUSj8stvqParqZUaepuVRdWlAezi9nZIeJhs7P3jumrnYSMS+S67
MyreJ8b5BrPYC8or09s4sxwI0pPrpPP+GDC5pn6QqqW/EvmXZcT7wXSyZpnDHyM0
WOc7uldGNNAZO2vu+RJRaIhRNWLxh7owawpoqp0hmlqjPOaFaUWX4a60trVw8Xm9
kJA9s7Vhidz82udfVy5/r3grekUFax4+YteXANecJEmsFk6Idr9yWsZtWnuUStAr
5pGbFwVVQP969oK0ChJ8siEvEPM9leZdLGP3k7+ZzmkOvgQhNhKFuesFjgWykZrX
ligM7AJKE1GGByJOdUL8K2xsExmUs+C8KMzzMsiY2Ea+gohB/cpjPk/Be4KJChd2
/C3ImMYTwLUZ6tJoo43bQVKNE9qS1uYSGOsTYX59fh8cPtXz0aE=
=6lxK
-----END PGP SIGNATURE-----

--azdwkisa6isnhljf--

