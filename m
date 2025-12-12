Return-Path: <linux-media+bounces-48680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F66CB7A49
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 03:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFB6A3031369
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 02:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99D2296BDA;
	Fri, 12 Dec 2025 02:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHNUY0wn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3072728B3E2;
	Fri, 12 Dec 2025 02:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765505437; cv=none; b=VWDRYXNLVo+fIli6JQRQsDyMqw0K59EnzlYCJuD5Sc1GDKZ6J9Mo1/I3lyqedrR+9Tq30lYNUPZWehJOlzOZVhkM/iW854QhZRBy+TlkP5/O3V06lMwtKGgZb2Q5AODbSBYWSL7DMEF+DE9S4R9KC44mV+YwBcbU+jnVwLshox8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765505437; c=relaxed/simple;
	bh=lNlq/Gu4DYaUueJtMsogHDxEJ50BRGn+gkM9qqKE03k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3rEE97bjF8fWt5KomRkYYRrKZMe9B+3wPGZ7hPqQ9vMY3mkG0/XIqKkWIfNfMpZ4XlasKS+ACYvWFl1X0k4P71g0UqYGH1kpfuA211nlIptKh1Eg5oHomi74pifQn5Rg51LueOSg2RTqu0mXqtLDFJvYDQGVGp9S4QNdkiGglg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHNUY0wn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EAAFC4CEF7;
	Fri, 12 Dec 2025 02:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765505436;
	bh=lNlq/Gu4DYaUueJtMsogHDxEJ50BRGn+gkM9qqKE03k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QHNUY0wnt4c5rB0gsyuF5A0k7aZntxAt4mnDo/vokrp45M6otQAXyLplwhR7N9xc0
	 EzPOI8Hf8gd2xTx9hn7iw+SvYCb2zWLQfLv3WzyoglNhV5CRQ2lefO5HiPEdjDzcPY
	 tLpszreqfaIZlUZdAnrNy5g1NJuTLPEegphpMiURpcQjHOitdiuwEmwfw+NszYcBSn
	 oOlRt5IohVlM8dndND3MfcUg+NcXPvDstci0E9S88KJh9b5z+XlE3IEI4/7wI3mUfJ
	 Yoe3tYIRqXR35cody4nxD+XXmUYg+UZm3hgZNO3ZQgc9J/0klmDWjY2k8C3l6H/9Li
	 gYPZIHIOdv7uQ==
Received: by venus (Postfix, from userid 1000)
	id 1C4841802EB; Fri, 12 Dec 2025 11:10:35 +0900 (JST)
Date: Fri, 12 Dec 2025 11:10:35 +0900
From: Sebastian Reichel <sre@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bryan O'Donoghue <bod@kernel.org>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, linux-media@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 3/5] media: ov02c10: Fix the horizontal flip control
Message-ID: <25wwufa4e3dbchloh7ygp7rimdl5fx2cnl4pbjvqjeyf3rq3p4@xwc2lkjm4cxh>
References: <20251210112436.167212-1-johannes.goede@oss.qualcomm.com>
 <20251210112436.167212-4-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j3mjui3673tqdadx"
Content-Disposition: inline
In-Reply-To: <20251210112436.167212-4-johannes.goede@oss.qualcomm.com>


--j3mjui3673tqdadx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/5] media: ov02c10: Fix the horizontal flip control
MIME-Version: 1.0

Hi,

On Wed, Dec 10, 2025 at 12:24:34PM +0100, Hans de Goede wrote:
> During sensor calibration I noticed that with the hflip control set to
> false/disabled the image was mirrored.
>=20
> The horizontal flip control is inverted and needs to be set to 1 to not
> flip. This is something which seems to be common with various recent
> Omnivision sensors, the ov01a10 and ov08x40 also have an inverted
> mirror control.
>=20
> Invert the hflip control to fix the sensor mirroring by default.
>=20
> Fixes: b7cd2ba3f692 ("media: ov02c10: Support hflip and vflip")
> Cc: stable@vger.kernel.org
> Cc: Sebastian Reichel <sre@kernel.org>
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---

Reviewed-by: Sebastian Reichel <sre@kernel.org>
Tested-by: Sebastian Reichel <sre@kernel.org> # T14s Gen6 Snapdragon

Greetings,

-- Sebastian

>  drivers/media/i2c/ov02c10.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index 384c2f0b1608..f912ae142040 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -170,7 +170,7 @@ static const struct reg_sequence sensor_1928x1092_30f=
ps_setting[] =3D {
>  	{0x3816, 0x01},
>  	{0x3817, 0x01},
> =20
> -	{0x3820, 0xa0},
> +	{0x3820, 0xa8},
>  	{0x3821, 0x00},
>  	{0x3822, 0x80},
>  	{0x3823, 0x08},
> @@ -462,9 +462,9 @@ static int ov02c10_set_ctrl(struct v4l2_ctrl *ctrl)
> =20
>  	case V4L2_CID_HFLIP:
>  		cci_write(ov02c10->regmap, OV02C10_ISP_X_WIN_CONTROL,
> -			  ctrl->val ? 1 : 2, &ret);
> +			  ctrl->val ? 2 : 1, &ret);
>  		cci_update_bits(ov02c10->regmap, OV02C10_ROTATE_CONTROL,
> -				BIT(3), ov02c10->hflip->val << 3, &ret);
> +				BIT(3), ctrl->val ? 0 : BIT(3), &ret);
>  		break;
> =20
>  	case V4L2_CID_VFLIP:
> --=20
> 2.52.0
>=20

--j3mjui3673tqdadx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmk7eZoACgkQ2O7X88g7
+poDjhAAqhkUkyxIwviuFPzRGsy0m5wC0dlzwIWZ+/6zYmAhCPKOiRihzy+OZW5E
/gyvcAbH7jf1k7/SsGFddh86lvPqIr78H4yKYyO+qCELQuRa6ZpLpJ+8ntoCtjXd
3JoZrPIgpq8OQa5ApMB4AQERbv4ND6XCBWpsr8A6IVSC9/+GiGyXiH7aCKTVx5lr
mYhJTYu+xUQuo5roXPCEw7mQyuKnw7KpFPi+hoJNCmtIo+lqFaawZSPxHdbIpePH
eZCEBwUdNK8izjxKdZ6+9lg8qik95EQSrX5ed22fRLbYCEBcTVB2lejjVFnqAnBX
26/kLRXeD70jkqm6/HEEFi6ZaScDFzFRdsmN9fM2f9nYnRNyCpSucacmPj7y89rp
P/w5mz/vHyBiCKfdKW3ltUy/K5Ax6np952OF0kS6cOIJ98CArw0zbfhJmLWku2+B
iSzaIlApv49phCDpKfvHXv7wqRpIJaWemm79NUbCvQ+EVMQUrN37KtxS3Uniefo1
zEIY5UpJSTbGbJzCXWfveg+wUSzc+ATXfSVZ5qqB6l5hIZfIjqGjfv3rKBB4aDWd
OCndqjmuPj4etukOkE9WJ4R7bCwV8HzLLiZTg4R9fbsKO5zM2rxuic+aJJcfpBqj
RoUH3JtDTDu5ZnnNWScBmAdQrNbIEgqMKbArJYpdnS6zmm3hbc8=
=iycr
-----END PGP SIGNATURE-----

--j3mjui3673tqdadx--

