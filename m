Return-Path: <linux-media+bounces-48682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6590DCB7A5E
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 03:13:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 860573020495
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 02:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E86299948;
	Fri, 12 Dec 2025 02:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J0YvlCHP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACB73C38;
	Fri, 12 Dec 2025 02:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765505604; cv=none; b=ctF+rt3ZttjCUlhGeQ8Be+pE/L3ePXkh+uIwt9SptR5O1aVZE3Yx0jO69rIHIa4rYnlyk4oTD7bqDSIdcEIdHh8mgGkm56hEcHbF1wfRQJQdLqp9PBgNqvDz9vpIQvmHbvAnv4zO1O0L6IBBiZUOMbCSTMsm+I78BRyvJSLdsbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765505604; c=relaxed/simple;
	bh=rxgPOEfcuh5Ieg6axTF/2GRA4++f8LLj1/xU6eOMuqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXHcRNyIN9iprNhC9NfnAZs8hpNwHKqs/RbooQ9U+3LjeCtfutgL8aVKfKdcthM1jcDy2gQ1BDRkFKIy/aJbzk0LdgoiHEnHVqMbLlQ2mFErG6l81tilKEk2KVj4tk2wKH0w1jOdbRMgF/nRLDM8rkXMwwS7pix4t+w0WS0pYEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J0YvlCHP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82B9C4CEF7;
	Fri, 12 Dec 2025 02:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765505603;
	bh=rxgPOEfcuh5Ieg6axTF/2GRA4++f8LLj1/xU6eOMuqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J0YvlCHPKWLg4mY4A0rpOUgjKIwq1Y5/upyKLmgDDQ0594Pnq814GhyjI5SG59Yaf
	 XXeoVCzwAoIAsPCxSMA72POgzVKkNCC3tHS8g/BTEHb0XvUue9QtkwjeB54eaymKGN
	 lEGrXmjJ5k7g8Ne3XokaG2I5ce+Eb3lfFEhj/txheNe6xrcaMzxLYBrZuoTP95o80E
	 mHN6/AtkRqI5jhjC6Ozts633YggcD6VTm3c6qiaOSLPN4945VhGlPOdE3RslGwPOeK
	 Li5y/kQzMrKIvJzGgLw3DHSnK0llm651/NIIhKZfOU7PanoIdh9mre6U9VN6mk+85W
	 2Hga0vrsCmZwQ==
Received: by venus (Postfix, from userid 1000)
	id EF0AE1802EB; Fri, 12 Dec 2025 11:13:21 +0900 (JST)
Date: Fri, 12 Dec 2025 11:13:21 +0900
From: Sebastian Reichel <sre@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bryan O'Donoghue <bod@kernel.org>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, linux-media@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 4/5] media: ipu-bridge: Add DMI quirk for Dell XPS
 laptops with upside down sensors
Message-ID: <gocvnom2lrvk7wd5dm65picx24qkuudq6nfj4mi53oscx65cet@n6rkdjvcp2tp>
References: <20251210112436.167212-1-johannes.goede@oss.qualcomm.com>
 <20251210112436.167212-5-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ebywwygo3ofqehqr"
Content-Disposition: inline
In-Reply-To: <20251210112436.167212-5-johannes.goede@oss.qualcomm.com>


--ebywwygo3ofqehqr
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/5] media: ipu-bridge: Add DMI quirk for Dell XPS
 laptops with upside down sensors
MIME-Version: 1.0

Hi,

On Wed, Dec 10, 2025 at 12:24:35PM +0100, Hans de Goede wrote:
> The Dell XPS 13 9350 and XPS 16 9640 both have an upside-down mounted
> OV02C10 sensor. This rotation of 180=B0 is reported in neither the SSDB n=
or
> the _PLD for the sensor (both report a rotation of 0=B0).
>=20
> Add a DMI quirk mechanism for upside-down sensors and add 2 initial entri=
es
> to the DMI quirk list for these 2 laptops.
>=20
> Note the OV02C10 driver was originally developed on a XPS 16 9640 which
> resulted in inverted vflip + hflip settings making it look like the sensor
> was upright on the XPS 16 9640 and upside down elsewhere this has been
> fixed in commit 69fe27173396 ("media: ov02c10: Fix default vertical flip"=
).
> This makes this commit a regression fix since now the video is upside down
> on these Dell XPS models where it was not before.
>=20
> Fixes: d5ebe3f7d13d ("media: ov02c10: Fix default vertical flip")
> Cc: stable@vger.kernel.org
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fix fixes tag to use the correct commit hash
> - Drop || COMPILE_TEST from Kconfig to fix compile errors when ACPI is di=
sabled
> ---

Reviewed-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

>  drivers/media/pci/intel/Kconfig      |  2 +-
>  drivers/media/pci/intel/ipu-bridge.c | 29 ++++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/pci/intel/Kconfig b/drivers/media/pci/intel/Kc=
onfig
> index d9fcddce028b..3f14ca110d06 100644
> --- a/drivers/media/pci/intel/Kconfig
> +++ b/drivers/media/pci/intel/Kconfig
> @@ -6,7 +6,7 @@ source "drivers/media/pci/intel/ivsc/Kconfig"
> =20
>  config IPU_BRIDGE
>  	tristate "Intel IPU Bridge"
> -	depends on ACPI || COMPILE_TEST
> +	depends on ACPI
>  	depends on I2C
>  	help
>  	  The IPU bridge is a helper library for Intel IPU drivers to
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/int=
el/ipu-bridge.c
> index 58ea01d40c0d..6463b2a47d78 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -5,6 +5,7 @@
>  #include <acpi/acpi_bus.h>
>  #include <linux/cleanup.h>
>  #include <linux/device.h>
> +#include <linux/dmi.h>
>  #include <linux/i2c.h>
>  #include <linux/mei_cl_bus.h>
>  #include <linux/platform_device.h>
> @@ -99,6 +100,28 @@ static const struct ipu_sensor_config ipu_supported_s=
ensors[] =3D {
>  	IPU_SENSOR_CONFIG("XMCC0003", 1, 321468000),
>  };
> =20
> +/*
> + * DMI matches for laptops which have their sensor mounted upside-down
> + * without reporting a rotation of 180=B0 in neither the SSDB nor the _P=
LD.
> + */
> +static const struct dmi_system_id upside_down_sensor_dmi_ids[] =3D {
> +	{
> +		.matches =3D {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 13 9350"),
> +		},
> +		.driver_data =3D "OVTI02C1",
> +	},
> +	{
> +		.matches =3D {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 16 9640"),
> +		},
> +		.driver_data =3D "OVTI02C1",
> +	},
> +	{} /* Terminating entry */
> +};
> +
>  static const struct ipu_property_names prop_names =3D {
>  	.clock_frequency =3D "clock-frequency",
>  	.rotation =3D "rotation",
> @@ -249,6 +272,12 @@ static int ipu_bridge_read_acpi_buffer(struct acpi_d=
evice *adev, char *id,
>  static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
>  				     struct ipu_sensor_ssdb *ssdb)
>  {
> +	const struct dmi_system_id *dmi_id;
> +
> +	dmi_id =3D dmi_first_match(upside_down_sensor_dmi_ids);
> +	if (dmi_id && acpi_dev_hid_match(adev, dmi_id->driver_data))
> +		return 180;
> +
>  	switch (ssdb->degree) {
>  	case IPU_SENSOR_ROTATION_NORMAL:
>  		return 0;
> --=20
> 2.52.0
>=20

--ebywwygo3ofqehqr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmk7ekEACgkQ2O7X88g7
+pqIeQ/9H38iE63S2jxsAWn6Qir6DbziFbdPyVmI2HtW8tKDx3IdLyPyyfyDvSUa
kiLhK++NgLjdx7aHhdmU4gLvDCTyUfwppYZte6rb1QmfODLq9FvYU66mA0j9X3b6
BhBdZ/v7NwADZtPjbq0ODnHXMUzZdEn7Nc2p+W9kkShOGTfTFNL0s2dwBUNTkUYf
OlP1aIQzDBZAyGsQM9ZXVF2FjGle7zXmY1qvaJGZml0V4k8I4ZIjxf75vVgvDd+n
dm2EzvY/gVA4JLZ9FZdU05gknvLqY9LVpf9c9AhWbUhOu3q3K1cz0YKPD9H9k91E
DDe0L+XopShIzx//BQBuf196zmEXsmg8kYdcdAtzPzQr8FkcIdYC6Vbhw5IcOKkm
Fy/e5lQ4J6QqSSGzIIUTWRdGtOBvoOomx8YHubvD7C4oj+KRu7VlzftLDASYD5xf
AMnL+uNYGGKzaozQCbQql9ynpzGrlInYG9odvMWf+ph+7zDnu/vSJyNlvrcp8DX7
DgX1MFtaCUmfRkGM0znedmFOHyHVhG2BVefCf0AsyZP9UeP3Khd8Rsvqp9DSWSk7
jnriKASSrnQ9TUG+Yrj2InUAcFp3o4O/gEcofP4P2qd/1M86yJj8favNd//8na+D
MXOBMPfvW7iVqu2NTpyuAd53gk/sqHwkVlaL7ZDFcVfO8CITQj0=
=zl8R
-----END PGP SIGNATURE-----

--ebywwygo3ofqehqr--

