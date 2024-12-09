Return-Path: <linux-media+bounces-22942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2489E9A15
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 16:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 898B628264A
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 15:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D721BEF71;
	Mon,  9 Dec 2024 15:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="QqJEAl3r";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="pB47Z69O"
X-Original-To: linux-media@vger.kernel.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9F4233133;
	Mon,  9 Dec 2024 15:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733757081; cv=fail; b=OFvfC86Evbya9EwckQot0Q70y8SMAw9lS1Eu7IZ3v8emuJpLEYcCiSGJQMI0fdfkr7RV24ylY6UahF65oEMLMXYpC7Xsw7P1qyupIBWIcgLAbXPA0xcxl+vA/aaI0ue8Yuq+Cuu7unRoj2KUJ/+u5i93i6gKIKgn9ctbFlKKZOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733757081; c=relaxed/simple;
	bh=9lUDseaQa+GMv75Q4XDP5lPqk5URrX9hhOlR18Rtbt0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DOFVXJDO6xK4/YBiPMskPrApkagWlwWyJ6qnu01KCM9XVdk8N0FZcWfeuWkapnYFvSvPm4ly2gG/3c0eecrFhQchSmm8N04R8fVfwfvZRmZls9IuwhIRppl7ItDqvwasKeNF8qZ7q8Ih6hfN3QZ3TCNqbvzf4Y9jpzBPprgY8P0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=QqJEAl3r; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=pB47Z69O; arc=fail smtp.client-ip=72.84.236.66
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
	by s1.sapience.com (Postfix) with ESMTPS id AD9F0480A33;
	Mon, 09 Dec 2024 10:11:18 -0500 (EST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1733757078;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=y+I0lrcFIAT6oDjUumIjTqveIGr+o6WjjTw4iAdh/Ws=;
 b=QqJEAl3rNwMZMBiJ14djxrmwDdrg5VmKHPgKWTUjR7fnHZEyNQO29XQgp9zXbbYQX2WfZ
 6MWbj8v491ugJz2CA==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1733757078;
	cv=none; b=uTX56S8oo1nytYxBfzl5OoyNxXsym/eGIepPvNe01w63zat7wRqoGHDYoeqDMI4zS3oGnJihMSWMMKn5mh9xklh7ujNGLpXvnbzW88R2sFNbBVNXwaAGwJCYTo1EgpR4m8u3pcpeajAde9ibc1Xkbq7Astavbq4irNsQksd/zytw+Hzx7aaPx1A9HCFjOwDMpX5CvI2hZeCAckAburWAW/DohOaaELlmtmlRC1rrsmJdE3ND3tHnXKZb/8pzfChGGgz+nUNdaNSiQoZOA7S8oAaFSRGGaTWyg54xwuDm1dGzWctSk537aNymIvH6k8ADzBaMeATweATmWJ3Farz2ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1733757078; c=relaxed/simple;
	bh=9lUDseaQa+GMv75Q4XDP5lPqk5URrX9hhOlR18Rtbt0=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=NP3zF/HqJbP3UWYzqd7DHsMNT64ZUaqIwi78MAJGNPg+4+HwwAlaKZvZhHFTkuvw8kvVM60RPRMQxE2eO3KSalsVirIpwdBwXokieRH71opcgL3HQHnbGkiBrZtT0QesXsZ5pYNo7735OqeONFM9m6o8dmTXpOEXfVt60XNa6sblh9RM6hbeTxpqZ+BFOW1sxls/C7HBM3KGVXypzpDslGwD5d8CCTemamWMxyXSatAdnEBBt5M1AM/LJWOaiB6NCAchON4csNLmMUqfb4tn5+SyLwne0WQbFXufD/3wk/riIm7NpJHFZtFbhHrBWH2VikNbmJ2GSVDB4ELCUpgmpw==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1733757078;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=y+I0lrcFIAT6oDjUumIjTqveIGr+o6WjjTw4iAdh/Ws=;
 b=pB47Z69OwJinSJb/v+R3limJ1iTBvT1in1aD+MVgInpwxOy7MVdJVZ0y8+zFUBOWIxbSZ
 UmEK4bXf7iT5wtMILiHtuRxo3CFkF1dNSQEllkb0byAXLjpXPodF6q911M9wtJ325/mQrnk
 e3T72Lco6vHxexKb1GWnDqxS/AQo7ns/4CKQiSVFwElOqJGJiElmOPnn5qz4P3s3bEPt6DP
 vPNQNQPkefOPJpkOgWTB1hCp/xJ6v+4j9tnOBC0YfT43bIkbFsP6egdyUmer7XD9Qz1y6gs
 j524xcIgtC5ejIJcZiedVLgm4g4e6nvevnp55wRj53E2OjkU81VC9Yy99Dmw==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by srv8.sapience.com (Postfix) with ESMTPS id 7754B280081;
	Mon, 09 Dec 2024 10:11:18 -0500 (EST)
Message-ID: <5321021d929cebf7268fc163ddb92cb740c09c82.camel@sapience.com>
Subject: Re: Linux 6.12.4 - crash dma_alloc_attrs+0x12b via ipu6
From: Genes Lists <lists@sapience.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	torvalds@linux-foundation.org, stable@vger.kernel.org
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, 
	bingbu.cao@intel.com
Date: Mon, 09 Dec 2024 10:11:17 -0500
In-Reply-To: <c0e94be466b367f1a3cfdc3cb7b1a4f47e5953ae.camel@sapience.com>
References: <2024120917-vision-outcast-85f2@gregkh>
	 <c0e94be466b367f1a3cfdc3cb7b1a4f47e5953ae.camel@sapience.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-6wRbfTIBrZlGr7AxFyD4"
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-6wRbfTIBrZlGr7AxFyD4
Content-Type: multipart/alternative; boundary="=-a/TPufZFI2QvsdAEVNhh"

--=-a/TPufZFI2QvsdAEVNhh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2024-12-09 at 09:52 -0500, Genes Lists wrote:
> ortly after booting in dma_alloc_attrs - maybe
> triggered in ipu6_probe.=C2=A0

>=20
Mainline v6.13-rc2 =C2=A0works fine on same hardware (i did need to add the
drm patches [1] without which there are no graphics).

gene

=C2=A0[1] drm fixes required with mainline:
=C2=A0=C2=A0https://patchwork.freedesktop.org/series/141911/


--=20
Gene


--=-a/TPufZFI2QvsdAEVNhh
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
</style></head><body><div>On Mon, 2024-12-09 at 09:52 -0500, Genes Lists wr=
ote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left=
:2px #729fcf solid;padding-left:1ex"><div>ortly after booting in dma_alloc_=
attrs - maybe</div><div>triggered in ipu6_probe.&nbsp;</div></blockquote><d=
iv><br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-l=
eft:2px #729fcf solid;padding-left:1ex"><div><br></div></blockquote><div>Ma=
inline v6.13-rc2 &nbsp;works fine on same hardware (i did need to add the d=
rm patches [1] without which there are no graphics).</div><div><br></div><d=
iv>gene</div><div><br></div><div>&nbsp;[1] drm fixes required with mainline=
: &nbsp;&nbsp;<a href=3D"https://patchwork.freedesktop.org/series/141911/" =
title=3D"Click to open https://patchwork.freedesktop.org/series/141911/">ht=
tps://patchwork.freedesktop.org/series/141911/</a></div><div><br></div><div=
><br></div><div><span><pre>-- <br></pre><div><span style=3D"background-colo=
r: inherit;">Gene</span></div><div><br></div></span></div></body></html>

--=-a/TPufZFI2QvsdAEVNhh--

--=-6wRbfTIBrZlGr7AxFyD4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ1cIlQAKCRA5BdB0L6Ze
29EKAP44VRkdLt28sNJil/UDLnnYh51xITettzWke4J4JkPwlQEA7Gx98mx3WpmI
nJ3Bm4SkZUMN13cYzPqkeiC39RFM3Qs=
=Bb2c
-----END PGP SIGNATURE-----

--=-6wRbfTIBrZlGr7AxFyD4--

