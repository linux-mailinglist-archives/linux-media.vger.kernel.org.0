Return-Path: <linux-media+bounces-22954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 474559E9DD2
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 19:05:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64DA0283110
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 18:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9EEC175D34;
	Mon,  9 Dec 2024 18:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="ERaGxLe5";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="GNy91ASE"
X-Original-To: linux-media@vger.kernel.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFFF1422D8;
	Mon,  9 Dec 2024 18:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733767496; cv=fail; b=FEYsHptPbYZYDFUfSK5unNbKOU7BDsdiVLp+5nVJpOLXXhuAg/dQV6oimSeSpqY+7lfhjkTjdS8bNo0g+h0svQAyMp2r/sfCSPuxBAIL4Ty/IFrbkFB+XuQ5/5li09lbsMYBq2EMgwPVWd6opGsFqsVl8ftS2+PFdw4zvUMlTNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733767496; c=relaxed/simple;
	bh=zhzTCDMaso/G1fbT4QKmx4/rci5cD1jbrl9CYozjCYc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pYlZBm54ch1XzH2fG5Vbri0Akz15BnQG/0xzmwtKWlMgrrY+6RrcjqZxNnicT5kluiqFZPyI7CklyfR43X59v0NhQTe1mFegTHddwEpUSCIllcRuE0H8vWj1VxQL7S81rVrPETCjbI6MdfJWdN2OFNu1yf8hvjfsr9rcpR1+eLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=ERaGxLe5; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=GNy91ASE; arc=fail smtp.client-ip=72.84.236.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sapience.com
Authentication-Results: dkim-srvy7; dkim=pass (Good ed25519-sha256 
   signature) header.d=sapience.com header.i=@sapience.com 
   header.a=ed25519-sha256; dkim=pass (Good 2048 bit rsa-sha256 signature) 
   header.d=sapience.com header.i=@sapience.com header.a=rsa-sha256
Received: from srv8.sapience.com (srv8.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by s1.sapience.com (Postfix) with ESMTPS id 6A843480525;
	Mon, 09 Dec 2024 13:04:53 -0500 (EST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1733767493;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=zhzTCDMaso/G1fbT4QKmx4/rci5cD1jbrl9CYozjCYc=;
 b=ERaGxLe5qmpPRCirZ1WtXSDSs1P368Cm8ilvTM21L97tUuNtEMjE5CIGSKdHSrzzIDeTI
 YD021WKTtSJ0y+0BA==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1733767493;
	cv=none; b=twdxjHKsJe/gMPCmAY1oQneTz0XqjWzm/Ml3f6Y7zXxp5YCD9xFXQn83B5i7fMAi7LGYIhTIkdvJG6gpAp5kWnfgYhcSjE6iopoIjvdRITHwY+3vr7VGsuoVvcveU3LkGGl+vEwez9q8kGG6NInqzB4Hp5KBx7Qbe2NfxTgtVAkGKhw34W+gnvQSWyRv/7NStda73AIFO+CmqNJUEd0cHdeVaymlZQFAk7yEKHuTZYeGarU6L+yCDuC7oCm9Tu0OAj7p6UAd1vQqZch/ymggLmyicxty9l2CsHF0lPOPVda6Q7vxdUJEwnpsy9UzeDzt1WWRaT0gFhonROIcwcUlFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1733767493; c=relaxed/simple;
	bh=zhzTCDMaso/G1fbT4QKmx4/rci5cD1jbrl9CYozjCYc=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=hijyb9iGM5sfvRXQ8F7jf5CSNBJoBIQ01QWnx9QtJr3tiiC6Ca9Oblpqvz3ys2Aws+NBxY/h1ryeAdTDVOBI0p8G4nUkClcSbHxknsqyrudE0TMbHBfQTK59CUvZGfdF4Z1jaYstYBY8IPdiGTz9Y32PxqvTWWsnu0qzWIO1aCeEa3PDy3u9zmhBMcuqvOhNwMVtuQmwCqfH7oUFKeCBSfsjgVehchBlSHrbV0kvixU0tdez+9IdMifpTB+tooOWnjRYNzWDVlXnwM+mIAOHkkYnPTQBIrfNUTrC8On+OIp34IaylNTCRzOWeMkw+9MPjdG/xSnC8HXGh8W2EEEJnw==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1733767493;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=zhzTCDMaso/G1fbT4QKmx4/rci5cD1jbrl9CYozjCYc=;
 b=GNy91ASEqVC4gu76XgMpz3PrgpIhZQtW1wljAfjP6pEj+C862pfk95muFSTAQS4yjoSj5
 PTZX3wYmMrWIPzJcsvLbjXRJ201oRUYE2K/1B/uXEOYYtmn55CWykUKOEfbJRM8Z07asXbF
 Wdphgfenjmy+pC12qkfcEuzI3S1nDtYTqk6EdTyrifs7wJzqFKhYnqNDZ81PguWUiz/el7d
 D1Dsz33OlSdnlJcryWQhMi1I1HKSHh8IVeQUisQUqUT9o8hV6+dYabFFLZMi9C5QHaRq1dR
 uT+ddSVx9BR6UHR1t07+CcvZj5YbdkEwIfGH3qWofaMTNZ3qaqEedLl5rQMw==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by srv8.sapience.com (Postfix) with ESMTPS id 2F648280081;
	Mon, 09 Dec 2024 13:04:53 -0500 (EST)
Message-ID: <39bedc74af0b310713c930a66dfc0ca367513c1d.camel@sapience.com>
Subject: Re: Linux 6.12.4 - crash dma_alloc_attrs+0x12b via ipu6
From: Genes Lists <lists@sapience.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	torvalds@linux-foundation.org, stable@vger.kernel.org, 
	linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 bingbu.cao@intel.com
Date: Mon, 09 Dec 2024 13:04:52 -0500
In-Reply-To: <Z1creSb6XVWtpyUl@linux.intel.com>
References: <2024120917-vision-outcast-85f2@gregkh>
	 <c0e94be466b367f1a3cfdc3cb7b1a4f47e5953ae.camel@sapience.com>
	 <5321021d929cebf7268fc163ddb92cb740c09c82.camel@sapience.com>
	 <Z1creSb6XVWtpyUl@linux.intel.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-F0Y2Ox7LjwGuS076kOhC"
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-F0Y2Ox7LjwGuS076kOhC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2024-12-09 at 18:40 +0100, Stanislaw Gruszka wrote:
>=20
> This upstream commit is missing.
>=20
> commit 1d4a000289979cc7f2887c8407b1bfe2a0918354
> Author: Bingbu Cao <bingbu.cao@intel.com>
> Date:=C2=A0=C2=A0 Wed Oct 16 15:53:02 2024 +0800
>=20
> =C2=A0=C2=A0=C2=A0 media: ipu6: use the IPU6 DMA mapping APIs to do mappi=
ng
>=20
> It does not apply cleanly on 6.12.4, I'll post backport shortly.
>=20
> Regards
> Stanislaw

Wonderful, =C2=A0thank you. I'll stop bisecting and test the patch once its
available.

thank you.

gene

>=20

--=20
Gene


--=-F0Y2Ox7LjwGuS076kOhC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ1cxRAAKCRA5BdB0L6Ze
23zNAQDQzqbkMztnIPurUsq81ecD0Kc7YPhxyR5noefXaqlGAwD9FCThiwv4kT3i
FukEPkckgFi5U4Ag6mgFX/BOkBw07Qc=
=GDZA
-----END PGP SIGNATURE-----

--=-F0Y2Ox7LjwGuS076kOhC--

