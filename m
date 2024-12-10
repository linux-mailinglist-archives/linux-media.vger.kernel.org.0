Return-Path: <linux-media+bounces-23069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E720D9EB58E
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 17:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 949BB162EA1
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 16:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D5E1BD9F9;
	Tue, 10 Dec 2024 16:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="Fl0/100+";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="lPIecjtT"
X-Original-To: linux-media@vger.kernel.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C2322FE0F;
	Tue, 10 Dec 2024 16:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733846410; cv=fail; b=i0llBM+mm7P0xkofDkDwzrDaGgWPXJ1FoAhPBOhad8knC64O7CBwhwVvzsxjMWoqvzCPRxCaXrpZ3EDAfI0Xj61yBrqEfHHsknP+gia8RhGOYvm7eIf5ENLNIDtJCbOUwbDszekGEGsqa5b5FZcMqHtvSVGYDSaewAkpwSkiuXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733846410; c=relaxed/simple;
	bh=VC0zDJV/vYeIP47luRbKu1fuLd+MzJmheU3zkCIZfGE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=beqtYGCptg6Bsy8zln6PgbFqaGnzqOU4yh7lXYujL54pqe7ChWZIvnKfbY/0J39IADWl9Y4tN8z5E6h/i/LJE6moH4KLoMzYsSHhBXnDm5bzAP5eCdWcFmltZAk5FDfkbW9X0gmNS++kJ7RXSszeYXuJrbvF53kK85XbLxHX4DM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=Fl0/100+; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=lPIecjtT; arc=fail smtp.client-ip=72.84.236.66
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
	by s1.sapience.com (Postfix) with ESMTPS id DF832480A33;
	Tue, 10 Dec 2024 11:00:07 -0500 (EST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1733846407;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=VC0zDJV/vYeIP47luRbKu1fuLd+MzJmheU3zkCIZfGE=;
 b=Fl0/100+kzcM3maJThYfKm+VEP1GkfUatTSTBnOsxIGDLoHvinR5Uys4a0grzPHVj6ySL
 7pbm1CoNlea5MxzDQ==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1733846407;
	cv=none; b=upZ4kR+RTnfbkL6ggpnBIDmkepDL0aZbgQ3uWYlF6I1MLwn1gyr0lmHu7xUmRv1k9k25jvROJIgkcivQ1N7cP0KaPZ4pfyYMEgqt4MIXIVVA8s6gtiJtK8d6tD3jNT04jj6CuydBxNIhBFUq3Nw1xAObwUGjth5xRS9KGKzkc9V8gbVZDFDQUGjOuwcxwwuEvGaMPH9NthV3J/TMnjloBno0YI2R9aG/6CR6hBrxgRiiUGShaNJdnsrDtoi64+7hgmQIYAYNvaMUZc/nSdQSFgUej7apulzYrta6oYnySFO9mWlS3iKk6u4fa0SX1XZ2uPuJmQBDaZbh7X1K2HA+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1733846407; c=relaxed/simple;
	bh=VC0zDJV/vYeIP47luRbKu1fuLd+MzJmheU3zkCIZfGE=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=VT0I+SEHbkxirBEBmIlGoyWyP5NpoBiWmr8I1YM1oIONNl9J4h0/N/Z+sUIfHVVpCpbYtlcdz+DHUqQF8qhKfR0wKete2aiebOd7GdNceqVU2ChV033pkMi+yN0t40EYH99sg9V/KmhTckumq/m4qpkHdGUCuaXu0liR1zLgKurVxekgOjd9H/hQxxbvhgkT02Nz6WHDKV1mFNdbzRPNZ/PdgHCenHKp8A/e8DfhAv/EsVU6av/SYTQEQmjilBiA9xMQzVmO1p2liyvk4IxvCl1xmiO/O30Gv76LO0qY5/jSSQnnNTWGi7oZVGPpejOonkc0ngAjNnlNIotBom66nw==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1733846407;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=VC0zDJV/vYeIP47luRbKu1fuLd+MzJmheU3zkCIZfGE=;
 b=lPIecjtTyeiOLl1qc3E8Vz88FpGOYCFlyB98DDNuLzuaRPGIo7fgEE389/mSaEf+0OqkK
 gv/7Dme9sTTkl9APDdnLy7DO/tbHoPEFP8sLxcYbK049eOCe7+4peJ8GShXF3R8i7OOpQkD
 S+v2kfiOndwhD45TDq+nCVgna8Dv7zDxWU8Xoo17BEetU4vJdCPtNC1Bsp45jHgUuBJUFOY
 +s8+Vl7HJLS4BRmMZaQ9UufX1S19emhyiaJzk3CCdzGrW0igkHkSHfvRXo26izQK38100yy
 X/9j89So8bL+quggFXsjJKqF4/dvQRIgV08SWq8sZRECsAmeiJDdcsFuRnAA==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by srv8.sapience.com (Postfix) with ESMTPS id AFF3E280015;
	Tue, 10 Dec 2024 11:00:07 -0500 (EST)
Message-ID: <5cf0ddae7351c4e6637ef19c17b98d7505381fd0.camel@sapience.com>
Subject: Re: Linux 6.12.4 - crash dma_alloc_attrs+0x12b via ipu6
From: Genes Lists <lists@sapience.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Greg
 Kroah-Hartman	 <gregkh@linuxfoundation.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, torvalds@linux-foundation.org,
 stable@vger.kernel.org, 	linux-media@vger.kernel.org, bingbu.cao@intel.com,
 Rodrigo Vivi	 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Date: Tue, 10 Dec 2024 11:00:06 -0500
In-Reply-To: <Z1hbyNXUubokloda@linux.intel.com>
References: <2024120917-vision-outcast-85f2@gregkh>
	 <c0e94be466b367f1a3cfdc3cb7b1a4f47e5953ae.camel@sapience.com>
	 <Z1fqitbWlmELb5pj@kekkonen.localdomain> <87seqvzzg6.fsf@intel.com>
	 <c1805642a6c5da6fef3927c70358c8cb851d2784.camel@sapience.com>
	 <87bjxjzpwn.fsf@intel.com> <2024121001-senator-raffle-a371@gregkh>
	 <Z1hbyNXUubokloda@linux.intel.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-KexgZLu3kFUuTiVHjkds"
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-KexgZLu3kFUuTiVHjkds
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2024-12-10 at 16:18 +0100, Stanislaw Gruszka wrote:
>=20
> I've reproduced the issue. It's caused by 6.12.y commit:
>=20
> commit 6ac269abab9ca5ae910deb2d3ca54351c3467e99
> Author: Bingbu Cao <bingbu.cao@intel.com>
> Date:=C2=A0=C2=A0 Wed Oct 16 15:53:01 2024 +0800
>=20
> =C2=A0=C2=A0=C2=A0 media: ipu6: not override the dma_ops of device in dri=
ver

Terrific - I missed your comment as I was heads down doing git bisect
which lands on same commit as you - so confirmed.

> The problem will disappear after applying:
> https://lore.kernel.org/stable/20241209175416.59433-1-
> stanislaw.gruszka@linux.intel.com/
> since the allocation will not longer fail.
>=20
> But we also need to handle fail case correctly by adding
> cpu_latency_qos_remove_request() on error path. This requires
> mainline fix, I'll post it.=20
>=20

Thank you !


Gene


--=-KexgZLu3kFUuTiVHjkds
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ1hlhwAKCRA5BdB0L6Ze
2w+DAQCDWvL9tK4fnEqz7gYCMfTN4ufZvQ3nBA76uJSS1IsMEAEAh3m6kC4o++L9
46h0GWeorYm2u+oLNYk9f82mxfq7Vg4=
=i4nK
-----END PGP SIGNATURE-----

--=-KexgZLu3kFUuTiVHjkds--

