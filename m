Return-Path: <linux-media+bounces-12664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEE88FF0E1
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 17:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F5DD1F22894
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 15:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112B4197A64;
	Thu,  6 Jun 2024 15:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="jcOHJJiJ";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="asht6AzM"
X-Original-To: linux-media@vger.kernel.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5A919753A;
	Thu,  6 Jun 2024 15:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717688379; cv=fail; b=M/VYLRuIw+TdqGxeDZH0UKkrsJn3YW0Y1WI0FgXuS5N4lH/WZEvPNQk7iTFsFznsYOUnCGpEXJywXFYFfE95kigiWie3UP14dMQ6lTWF2y+A8HCwxHJFl2PkjN7zMErKbaW/+ALh26+cNsk49WLxHkkRR/KBOnwsDWi9ZsALui4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717688379; c=relaxed/simple;
	bh=q90MOgC3ZwUfcgGCNnOYc7vZxPdGJZVWSHcbXB8BBYk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=km9X1+yhk4TqhnixReqeeKsl+9g+Q2yrDum8EaC6AREIEd70QgIPFlM+ADuCwC03LN0b15V8Zk7Z/F8D4TU8a4siBH7dBGW3k5SOucCXY4zBr5AbDChseq3q7cj/HdwjHwh83A4L+MtmG0Blf9j3GtzseDmQwvsaWnYibPg7xKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=jcOHJJiJ; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=asht6AzM; arc=fail smtp.client-ip=72.84.236.66
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
	by s1.sapience.com (Postfix) with ESMTPS id 004C94809FC;
	Thu, 06 Jun 2024 11:39:36 -0400 (EDT)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1717688376;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=en9XJh0Afrw9YgdF3uo0asjudsUJS3VfsQdgW0yEr5g=;
 b=jcOHJJiJHSoDzigiLuvDg0jLsukaKzBDxHcv/wnSzaJUhK6VpyP05GpEa087dYhfIwNog
 iCUtYb6mtckdVSqBw==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1717688376;
	cv=none; b=RPG6+ah8dfRp2u9xVD1qJ+9bhFYQ1O2ImAuuxVuIDM79t1YG5TiiolnZUXNHF1y/YV0V02yd9M1eLZum6PfCKKDqL/Pzi3kAAeXaaVg6vyMJGoWMVvP8+2ST7+DR7Dcp3OJoTf0yGfCbvWp0IQHWuYWGYMjZKPux4uwHb+1nQHIKyxaCqEJqW/OzB/zg/j2zwAlp0v0OOgSKqlREmO0HPQ4A7C+iHBnPN92X1GCIvi0t1UEemfHidEdA+69DCR2IU1IENKzIi5E4I9dSH+Y298VAXSOxRJIjNvQcsrvg22rilFGcgZVcmqRePnQLEQ/bHUa4mq+k6RcRYjYtW+0tCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1717688376; c=relaxed/simple;
	bh=q90MOgC3ZwUfcgGCNnOYc7vZxPdGJZVWSHcbXB8BBYk=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=KeWc6p1t3zldTlmWMchDyw2QIg9YU5Q6Sh6sHeb9j/K5uMT5j6cN+7K0rQVgNA2Z5xV6VPL2kmICWLsdbHJFDavo935yHYjvRCtP1lQSN+M33072jx056o/QPV097nyQRGiIWD41rg2N7bV0xVCrka9HrgiHnKgZ2ef8Xh1r9RwJSVVTk2G2mVJsKINdQrIbSyDUdf36KkvUC6466LpGPfF+QMDgrh9oExMOyUjBM84XgFokcnAAFWnxGhugzyz09BWInNXUoCQPhbB5vc75NyETzSWXBMPIqN3F9wHfMovXpdKuXwQYVKh9RHhrY9XPCb0Iwl4jFiuIw+rUPA3cfg==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1717688376;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=en9XJh0Afrw9YgdF3uo0asjudsUJS3VfsQdgW0yEr5g=;
 b=asht6AzMWxjrSOs5BwZ243DyOItVGv+T4CS18ewN/4N/JQ67OzLs4LznyFO/ze5FuQUfI
 yYfjrlX792oZO4IqNfsfh4wXfEkvdDoh17UxqgY2qyZkoa2CrAOzXOhj0jvSZuNwrIjWHYA
 j5KSL9aBBkwIeAIqLymginxmmG82r3H5MaLVYOxKRS2abs3wVZ6g3QiEfuhwTZoYwyRW4na
 CB3H4Zi/xuPLGICAsB8/3ztW5bVg7Pp0pWEoZ+UpCcFK0rBbf3KiYS7qXjHRr0HEONpr3xS
 Xo83iA3DxRPrp04RtcqF0gdjsbZUds8LkcO0yY3LJnJUOcfYJmFEPwh9+Lxw==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by srv8.sapience.com (Postfix) with ESMTPS id C9530280074;
	Thu, 06 Jun 2024 11:39:36 -0400 (EDT)
Message-ID: <eb10620deecc8feeae1e308c22de199be7c48ca6.camel@sapience.com>
Subject: Re: 6.10-rc1 : crash in mei_csi_probe
From: Genes Lists <lists@sapience.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl,  laurent.pinchart@ideasonboard.com,
 wentong.wu@intel.com,  linux-media@vger.kernel.org, Linux regressions
 mailing list <regressions@lists.linux.dev>
Date: Thu, 06 Jun 2024 11:39:35 -0400
In-Reply-To: <988e48090982c89ce0c906954832fdfb09a1ce34.camel@sapience.com>
References: <8afe9391b96ff3e1c60e624c1b8a3b2bd5039560.camel@sapience.com>
	 <ZlTllJeZBiGapHwZ@kekkonen.localdomain>
	 <988e48090982c89ce0c906954832fdfb09a1ce34.camel@sapience.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-3iaXZ9E4DkMvi3CQXNrj"
User-Agent: Evolution 3.52.2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-3iaXZ9E4DkMvi3CQXNrj
Content-Type: multipart/alternative; boundary="=-PrDfqDW0NuzkgkEY0JLQ"

--=-PrDfqDW0NuzkgkEY0JLQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2024-05-27 at 16:58 -0400, Genes Lists wrote:
> On Mon, 2024-05-27 at 19:57 +0000, Sakari Ailus wrote:
> > Hi,
> >=20
> > Thanks for reporting this.
> >=20
> > On Mon, May 27, 2024 at 12:34:41PM -0400, Genes Lists wrote:
> > >=20
> > > First happened in 6.10-rc1 (6.9.2 stable is fine) =C2=A0
> >=20
> > Do you happen to have .config available? A full dmesg would also be
> > helpful.
> >=20
> > Does the system crash after the warning or not?
> >=20
>=20
> System stays up and remains quite usable.
>=20
> config and dmesg attached.
>=20
>=20

Hi Sakari - just to let you know this is still happening in 6.10-rc2.

Best


--=20
Gene


--=-PrDfqDW0NuzkgkEY0JLQ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>On Mon, 2024-05-27 at 16:58 -0400, Genes Lists wr=
ote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left=
:2px #729fcf solid;padding-left:1ex"><div>On Mon, 2024-05-27 at 19:57 +0000=
, Sakari Ailus wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 =
.8ex; border-left:2px #729fcf solid;padding-left:1ex"><div>Hi,<br></div><di=
v><br></div><div>Thanks for reporting this.<br></div><div><br></div><div>On=
 Mon, May 27, 2024 at 12:34:41PM -0400, Genes Lists wrote:<br></div><blockq=
uote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf soli=
d;padding-left:1ex"><div><br></div><div>First happened in 6.10-rc1 (6.9.2 s=
table is fine) &nbsp;<br></div></blockquote><div><br></div><div>Do you happ=
en to have .config available? A full dmesg would also be<br></div><div>help=
ful.<br></div><div><br></div><div>Does the system crash after the warning o=
r not?<br></div><div><br></div></blockquote><div><br></div><div>System stay=
s up and remains quite usable.</div><div><br></div><div>config and dmesg at=
tached.</div><div><br></div><div><br></div><div><span><pre></pre></span></d=
iv></blockquote><div><br></div><div>Hi Sakari - just to let you know this i=
s still happening in 6.10-rc2.</div><div><br></div><div>Best</div><div><br>=
</div><div><br></div><div><span><pre>-- <br></pre><div><span style=3D"backg=
round-color: inherit;">Gene</span></div><div><br></div></span></div></body>=
</html>

--=-PrDfqDW0NuzkgkEY0JLQ--

--=-3iaXZ9E4DkMvi3CQXNrj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZmHYOAAKCRA5BdB0L6Ze
24j2AQChBIEva8vdHfa2desP8x1GwNDMKU29rImqdLQh8uYWHAD9Fs1jDRlcv1ii
F/oIod3IoSkHEG7Kuo1XmJ/N0Hip9Ao=
=eGuq
-----END PGP SIGNATURE-----

--=-3iaXZ9E4DkMvi3CQXNrj--

