Return-Path: <linux-media+bounces-61783-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDv6LREOCGpVWwMAu9opvQ
	(envelope-from <linux-media+bounces-61783-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 08:26:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F96455A7B1
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 08:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EEB1F300F158
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 06:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B72E2D2488;
	Sat, 16 May 2026 06:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="GzIIK9ku"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BD717B506
	for <linux-media@vger.kernel.org>; Sat, 16 May 2026 06:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778912782; cv=none; b=pelx1mp9RSnfJHqmBrWl454rWLlYLckkDHBiswiTkbKEaWx1tH7DJW9FCTLIUASRp58bd1unQqwd7lbvYjJ+fbrqtfW9JA6t5KlLMYJt+AE1mpYlg26NU73FbirOUKxnTmpzPqu9DfAXlIhwoqJf95d29iZ4F7Z/cgEjaKeIDEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778912782; c=relaxed/simple;
	bh=1ge+gjru13RruXYWtQ5wFSwlDdEYBliahjyiMVplGS4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hYqOd0/f4+3NKWA0LsO445fzDf/0DzB8hJrty4jvcL4nxcJ5Ke71qrvGWLL1foMifrYtYIjFJsCTThAdVgzMIwyRsRsmGUFaVS/Tj2dOAEQiixtGsZWmdepVdtolmkWpH1S6bRjZplDPpVoCxPSvnxYkYQg7z4Psyd3KvtAFmxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=GzIIK9ku; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-453903ee4adso372877f8f.3
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 23:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778912779; x=1779517579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XFfFEO5sWuavgdP7HUs7sjyYVRG0+1MI7HOzI8qLFzY=;
        b=GzIIK9kufmjomXWqZDCsaYJbTvknMH3ntWpry3MTXHqs8KGtsLxa+nH4BtoZIOXufu
         KhweWLXvwnQ6eXmZdHhToOW8ohGu034Ty3w1E2Z8BrqCsGM3xmRZGMKZuuB7ZJ9agMd9
         20AcSAdUJH5P0A/BP5iGw6VOaXegunMVKmXLVN0TmWX8mfVs9PFqzHuYn9Jp1BBbDZ+a
         EuOJXZbPXpqjLwNNPS2IsODYzigrJMwTieyxClqaegVw+20BisOaeRv7PUgZ1Wytggy3
         yl9wTvQmX/HCknJu4/IV+hEbWVth+dFVnnPLlMxBcS7dBZzN8+IgpfYZa+rBmKtqVoIQ
         UPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778912779; x=1779517579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XFfFEO5sWuavgdP7HUs7sjyYVRG0+1MI7HOzI8qLFzY=;
        b=LZAvhbkACUGESwAdqz95hPi7ff0FfL1Y/WQ36E6+eM20/02UDC+DribGI9887omLpN
         DkBF6sOmYf1BvIde6YslvqOgsmnT7utd6feSEfU21vwXW14kTOQHmLp09NwoswMP3dxx
         ZMClbJGneki4X0DnIfrg1YWWC0Q+bdXKahos1D/Mkbra9nJoumqXa9A92QSYH2u79mMx
         f8WaeAqCsUP6aEnrnLBncLQIXgOq105DwaLG5ld8l0CVyaCVgTUKarAqIHjxsJhwzjBg
         2UMP4pWT2qSZfQO047/z2/aAc37sNi2Vlyku+eLJLqWHLQFGL7syw//3t52VzTTauNOF
         Iu9g==
X-Gm-Message-State: AOJu0Yy4mL9qR3tgjdz8eQqC/i0G+iuJJn+TCL9y7RIvfEuwF6Ggd2bx
	sQRKCXSv6Y5/2SP3AekudXwwwidppTGxdjuLetghQxVOJfTH0tleA3Xdv9sYMpI9qa5IX7xK2g0
	rT9/nykwW3Q==
X-Gm-Gg: Acq92OE3rF1/P3YjeO4YLNQlUil5iee9g3h3i5iMQuHKaUhV0cdWPsHgZ/DmCxR7Q50
	3cl8z8IP1KCnxWIu0QZfuvlN4LTCYzG2wQJsZ4FS4B88lyev13j+5aklJdEPMFQUsHnAsZGPsDf
	kaekFoTeYfO2SH1BzvNADY0UeF4LNbY7wLLzTIaMwEgzXfPGXDfbCROn3SM/aCn+clOE32rgTNl
	vFFCu72sq00WKH+JxA5C1D6Tx0x7LAbX82j7Cwu4hv9hp+VRJgA32OfZIFnax5FX7LT/0EMtBfE
	LnKTfhx2uuEM1zIBJCUtFO+Uxwf20A4oTWVlQ/KqJYeLSrnVUkkrNYJa1s8NBBQGRW1PDWrtvig
	qtJacn6Cjnehb6tKtpqdsU2JiybIt8e0BY6iikPwsvHJv+ipbqRnN1o8LJ2AQqFoL8ercHXWecM
	EhCqwlHbICinjeOS+y4ajg+hdO8/OnvAiqzXQtJzc=
X-Received: by 2002:a05:6000:2c10:b0:44a:525b:2851 with SMTP id ffacd0b85a97d-45e5c367149mr9397155f8f.10.1778912778743;
        Fri, 15 May 2026 23:26:18 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45da15a666fsm18442852f8f.36.2026.05.15.23.26.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 23:26:18 -0700 (PDT)
Date: Sat, 16 May 2026 08:26:17 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: linux-media@vger.kernel.org
Subject: Re: [v1] media: Use named initializers for arrays of i2c_device_data
Message-ID: <aggG2S-KG9aOTjsX@monoceros>
References: <20260515161528.465621-2-u.kleine-koenig@baylibre.com>
 <6a0764e6.ec7b09a3.350c1e.ff87@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gzw3nbt365y23ha7"
Content-Disposition: inline
In-Reply-To: <6a0764e6.ec7b09a3.350c1e.ff87@mx.google.com>
X-Rspamd-Queue-Id: 1F96455A7B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-61783-lists,linux-media=lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	DMARC_NA(0.00)[baylibre.com];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,baylibre-com.20251104.gappssmtp.com:dkim]
X-Rspamd-Action: no action


--gzw3nbt365y23ha7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [v1] media: Use named initializers for arrays of i2c_device_data
MIME-Version: 1.0

Hello,

On Fri, May 15, 2026 at 11:24:38AM -0700, Patchwork Integration wrote:
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:

I wonder about the Media CI robot testing iio and hwmon patches. What is
their source? (Hmm, I guess that's because I forgot to remove the
prerequisite-patch-id lines from the patch.)

> # Test checkpatch:./0001-scsi-mvsas-Don-t-emit-__LINE__-in-debug-messages=
=2Epatch checkpatch
> WARNING: Prefer [subsystem eg: netdev]_dbg([subsystem]dev, ... then dev_d=
bg(dev, ... then pr_debug(...  to printk(KERN_DEBUG ...
> #36: FILE: drivers/scsi/mvsas/mv_sas.h:38:
> +printk(KERN_DEBUG "%s: " fmt, __func__, ## arg)

This issue was present already before, but yes, that could be addressed
in a separate patch set.

> total: 0 errors, 1 warnings, 0 checks, 13 lines checked
>=20
> # Test checkpatch:./0007-iio-Initialize-i2c_device_id-arrays-using-member=
-nam.patch checkpatch
> WARNING: line length of 102 exceeds 100 columns
> #573: FILE: drivers/iio/chemical/atlas-ezo-sensor.c:189:
> +{ .name =3D "atlas-co2-ezo", .driver_data =3D (kernel_ulong_t)&atlas_ezo=
_devices[ATLAS_CO2_EZO] },
>=20
> WARNING: line length of 102 exceeds 100 columns
> #575: FILE: drivers/iio/chemical/atlas-ezo-sensor.c:191:
> +{ .name =3D "atlas-hum-ezo", .driver_data =3D (kernel_ulong_t)&atlas_ezo=
_devices[ATLAS_HUM_EZO] },

Yeah, these are unfortunate, but I don't want to add line breaks to the
array. Once i2c_device_id got the union that I want to add to it, I will
do

-	{ .name =3D "atlas-hum-ezo", .driver_data =3D (kernel_ulong_t)&atlas_ezo_=
devices[ATLAS_HUM_EZO] },
+	{ .name =3D "atlas-hum-ezo", .driver_data_ptr =3D &atlas_ezo_devices[ATLA=
S_HUM_EZO] },

shorten the line again below the 100 char limit.

> total: 0 errors, 2 warnings, 0 checks, 1372 lines checked
>=20
> # Test checkpatch:./0009-hwmon-pmbus-mp2869-Drop-unjustified-__maybe_unus=
ed.patch checkpatch
> ERROR: missing sentinel in ID array
> #27: FILE: drivers/hwmon/pmbus/mp2869.c:643:
> +static const struct of_device_id mp2869_of_match[] =3D {
>  { .compatible =3D "XXXXXXXXXX" },
>  { .compatible =3D "XXXXXXXXXXX" },
>  { .compatible =3D "XXXXXXXXXXX" },

This is a false positive, the sentinel is missing in the context of the
patch, but it's there in the source file.

> total: 1 errors, 0 warnings, 0 checks, 8 lines checked
>=20
> # Test checkpatch:./0012-ASoC-Use-named-initializers-for-arrays-of-i2c_de=
vice.patch checkpatch
> WARNING: please, no spaces at the start of a line
> #1251: FILE: sound/soc/codecs/max98088.c:1725:
> +       { .name =3D "max98088", .driver_data =3D MAX98088 },$
>=20
> WARNING: please, no spaces at the start of a line
> #1252: FILE: sound/soc/codecs/max98088.c:1726:
> +       { .name =3D "max98089", .driver_data =3D MAX98089 },$

Huh, indeed, that needs fixing (though my patch didn't introduce the
issue). I already forwarded that info to the thread where this patch is
discussed.

> total: 0 errors, 2 warnings, 0 checks, 1982 lines checked
>=20
> # Test checkpatch:./0013-mfd-Use-named-initializers-for-arrays-of-i2c_dev=
ice_.patch checkpatch
> WARNING: please, no spaces at the start of a line
> #1005: FILE: drivers/mfd/tps65910.c:521:
> +       { .name =3D "tps65910", .driver_data =3D TPS65910 },$
>=20
> WARNING: please, no spaces at the start of a line
> #1006: FILE: drivers/mfd/tps65910.c:522:
> +       { .name =3D "tps65911", .driver_data =3D TPS65911 },$
>=20
> WARNING: line length of 101 exceeds 100 columns
> #1046: FILE: drivers/mfd/twl-core.c:933:
> +{ .name =3D "tps65930", .driver_data =3D TPS_SUBSET },/* fewer LDOs and =
DACs; no charger */
>=20
> WARNING: line length of 101 exceeds 100 columns
> #1047: FILE: drivers/mfd/twl-core.c:934:
> +{ .name =3D "tps65920", .driver_data =3D TPS_SUBSET },/* fewer LDOs; no =
codec or charger */

ditto

> WARNING: Block comments use * on subsequent lines
> #1049: FILE: drivers/mfd/twl-core.c:936:
> +{ .name =3D "tps65921", .driver_data =3D TPS_SUBSET },/* fewer LDOs; no =
codec, no LED
> +   and vibrator. Charger in USB module*/
>=20
> WARNING: Block comments use a trailing */ on a separate line
> #1049: FILE: drivers/mfd/twl-core.c:936:
> +   and vibrator. Charger in USB module*/

I don't know how to fix that (it wasn't introduced in my patch), would
require a complete reformatting I guess, not sure I want to make that
part of my quest.
=20
> [...]

the remaining issues are similar and addressed in the same way.

Thanks
Uwe

--gzw3nbt365y23ha7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoIDgYACgkQj4D7WH0S
/k5A4QgAnCUKqrVgodT4Xq0Hml5UBeZi0kmsFHUIL7A4c7/PdnGBQ77eOJsOygx/
ayEFngSTJNOZU84A+WOIPMgJLknHIhUb0TH0CxFi7RDErCfYvIAPtjBASVdHsHp+
q0i1leEk+YuAZE9eMciB0KiOqmtObCKfWpys2wbW4eqdTbY9QGr9+xGkkb8Wg1XF
5NRCb7tn6YP8UTOW/1DU2QVvRm/187Fl0SX+JhNZzs1LUhCvN4WNUk/nF5zezOGb
+vC8MYMJWcBtJlUSLCBCJu+cj33bUuVyL8EQRjZQA7WFGCDa0RaXCQl0Pk7uoh5e
Rr4FIqtqJyddiQHH3Oq0nIvGI4nczQ==
=4V+P
-----END PGP SIGNATURE-----

--gzw3nbt365y23ha7--

