Return-Path: <linux-media+bounces-22951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F69F9E9B4F
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 17:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C218E281210
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 16:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2794B13B280;
	Mon,  9 Dec 2024 16:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="PRz/0k1r";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="D8qgOeal"
X-Original-To: linux-media@vger.kernel.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF95A233139;
	Mon,  9 Dec 2024 16:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733760748; cv=fail; b=lYTPp4EriP9pbdRYeDMlNFuPtU5eg0MWLerl1q1ZgmB3ojBwqkgTsNVkKT06kP0SxkwMZwMJR05JwY6WJn30gD/Ipk8PxTz3fr7/gXCd5dJaUY8wNVoE/YXbgSEX4JabErvODET1V+8zTcIIlDm9RCYeBRZB9p9/M7lvSCWw1U8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733760748; c=relaxed/simple;
	bh=s4KoCz75uO+3e9W7SAZg0svC3ypzFsG03CMxh9+nBI8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YYAkWChWmoJxHpO2m6lIQQOskAgkYw1kGKXXLLnogNQqOptTJpgaJdR/fY+8YFfEUoVJI8u16YHDWdOA3pesreeT7+iVHHS/RJhHXdrRUmcyOH3IpauRNCoLuXl5WmyAcFEr3iuhhlw0c+mLSWcG+TQMpWlTAQKZDhyf3+V9+lE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=PRz/0k1r; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=D8qgOeal; arc=fail smtp.client-ip=72.84.236.66
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
	by s1.sapience.com (Postfix) with ESMTPS id 75FC0480525;
	Mon, 09 Dec 2024 11:12:25 -0500 (EST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1733760745;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=yCff0reIMkVdZUNSUwuUxWtpDSfpdPI8D8HTB3BQ67s=;
 b=PRz/0k1r8Ou4MxCbHn1mpP6NjnScRlfnrZDoHq4qDTnUdJZSXrPCKXx8vNkp5DBblARD1
 jLvOzLdneWQMdNRDw==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1733760745;
	cv=none; b=LB+H4gXl2zckP53HBPx2DytCxw0XWF1ox8ZSLgWbWeJfff1eDIIJCWn1h5p9EI/cfn1Vpz8wIXJh0NG6OjaOB8ue1WNwpilALTD0UIlBBO0k2a9oS1SaEiAV4UKSD4+c2mvKKFr4jrnAUxZF38pwCPg0NraQc4U1943NKGYY6rSFymElwn+fcf909Su+aJ57PPneHYlkNyaPsLCQyCsZ/cDc+ldc+jzb+S1SVepEg2HLMRqAwCq32l+mDMr2UyqOa1vqP0BwsLrknJczv9OHhUGlZIeZYZmTyLh2b74Y1Z+oltud+Wjn3V1UCCY36eE9BzIakvYc02H3YpXfK1MV7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1733760745; c=relaxed/simple;
	bh=s4KoCz75uO+3e9W7SAZg0svC3ypzFsG03CMxh9+nBI8=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=nquiQmzc9gPkGJkr2xKxoGF/BsutWBYRsE1C6EIRhjQ/EDB5pz6lr8M/5Xu+ms8Az3v9nr+2icYMSGDuvSu6BgEI/ADirsGPLXya9Hz2eldR5J8Pe2Y1SAdjcOfTdkceuoufSJiEzm9NZxVloF//wIZadFjnj0vbYNjzNmXll3uTc7gwXlrmiYhE66GA3s7rHgsOcE8go2PrlVC1aaqSZWy4FFUd7MWEA2GYy4g0c7bqQ+gw7YesFxHy8tDOkIyZ8D03cWdDI6tfC0EheCA8CkutkERNlh1pMbeWRZ81guAqQRDCvCx0MGzMvM8f3SACyELKBkEu9dLKjeZkdSN5yQ==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1733760745;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=yCff0reIMkVdZUNSUwuUxWtpDSfpdPI8D8HTB3BQ67s=;
 b=D8qgOealkrIHi51HpuzIqMmYQweAIe2zMIqupR/2dcJeEWCFXYQKrhlUnQyMEc+O80mcV
 haNEWanUEttPL1af/LMzuTRU2p82jYgJJFkLDHNOL1ISscDNYzsKalWwCfH5mMiyeW/ld5j
 3cK1Ff4hUq4b+Fumf9wwXcudU0eqpGz0A3OilgdtfY3hSVfyvUMzHOcNQpdDn45Ywv3hu8F
 YvKqbxAbwIUbd0YC/MiCjVUZAAIcasqW0PHByZPdbPqpMWBGfly2jCUCcaGN+pZA+bxDXic
 EFTQfK7Y98Cs4qrArZYhK2oXKVq4Gs1UEbnLdjg9L2xu/kkWjTpHk7HpUSAg==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by srv8.sapience.com (Postfix) with ESMTPS id 3DFB0280081;
	Mon, 09 Dec 2024 11:12:25 -0500 (EST)
Message-ID: <d2a5d51bd98f167fac6286607f5a56591432114f.camel@sapience.com>
Subject: Re: Linux 6.12.4 - crash dma_alloc_attrs+0x12b via ipu6
From: Genes Lists <lists@sapience.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	torvalds@linux-foundation.org, stable@vger.kernel.org, 
	linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 bingbu.cao@intel.com
Date: Mon, 09 Dec 2024 11:12:24 -0500
In-Reply-To: <2024120934-wreckage-hazily-166f@gregkh>
References: <2024120917-vision-outcast-85f2@gregkh>
	 <c0e94be466b367f1a3cfdc3cb7b1a4f47e5953ae.camel@sapience.com>
	 <2024120934-wreckage-hazily-166f@gregkh>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-+7eX/8a5SmQeZ2CGtJlV"
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-+7eX/8a5SmQeZ2CGtJlV
Content-Type: multipart/alternative; boundary="=-Hb4Hp5H/VaGi78DROUsH"

--=-Hb4Hp5H/VaGi78DROUsH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2024-12-09 at 16:18 +0100, Greg Kroah-Hartman wrote:
>=20
> Did older kernels work?=C2=A0 Did 6.12.1?=C2=A0 If so, can you do 'git bi=
sect'
> to
> find the offending change?
>=20

Yep, I am doing bisect now - will report back when it's completed.

gene

--=20
Gene


--=-Hb4Hp5H/VaGi78DROUsH
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
</style></head><body><div>On Mon, 2024-12-09 at 16:18 +0100, Greg Kroah-Har=
tman wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bord=
er-left:2px #729fcf solid;padding-left:1ex"><div><br></div><div>Did older k=
ernels work?&nbsp; Did 6.12.1?&nbsp; If so, can you do 'git bisect' to<br><=
/div><div>find the offending change?<br></div><div><br></div></blockquote><=
div><br></div><div>Yep, I am doing bisect now - will report back when it's =
completed.</div><div><br></div><div>gene</div><div><br></div><div><span><pr=
e>-- <br></pre><div><span style=3D"background-color: inherit;">Gene</span><=
/div><div><br></div></span></div></body></html>

--=-Hb4Hp5H/VaGi78DROUsH--

--=-+7eX/8a5SmQeZ2CGtJlV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ1cW6AAKCRA5BdB0L6Ze
21fKAPwPbFQhccaZAU2fEhqcRSYTrRRE9ztmMIt0zskMMcwzuAEA+OtQRO81hVpH
NsCFWxldlE0G/rwnPCYERVYkceD7fAo=
=LyRZ
-----END PGP SIGNATURE-----

--=-+7eX/8a5SmQeZ2CGtJlV--

