Return-Path: <linux-media+bounces-12670-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B12538FF252
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 18:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B45641C25ECD
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 16:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E15199258;
	Thu,  6 Jun 2024 16:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="/C4ELpKq";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="OfscBZh3"
X-Original-To: linux-media@vger.kernel.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1C61990A1;
	Thu,  6 Jun 2024 16:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717690638; cv=fail; b=Uv4UUxkQScvG9ko9nSApzWS0bmsGR3+WBeTiDt5B9Sbqe820iCvVKj4eg1wc/Gc4S7plYWp8X3lE15i9RqpQe+nMc4qSY+9AVjG5aTDmLCIMMU6xyeSlSY7fTQFalgob+b26i3i7NIBByJbgpbC2hmlT+HZi7mpnuCnj37szz3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717690638; c=relaxed/simple;
	bh=T+h1Ne4Z+Nus3xIRHnouZB6uatVfxpMENDpkUC19kdY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SVenfGGFhtdxmJBXk45pnXg6FXsQxnnxPBoc7fEcyL0TEK6KM1RWoAKCMdjQKCnrbICyEmi+QJj0jN7yt9Pffl/4N1c1YCNwbIIZqYx0kCu0qqbNCyn6hIUMh7AdbRMaTKVraZ69MHcmXhDNXRbcdxryG/dGz2evvUqC+xGUvJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=/C4ELpKq; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=OfscBZh3; arc=fail smtp.client-ip=72.84.236.66
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
	by s1.sapience.com (Postfix) with ESMTPS id E3B634809ED;
	Thu, 06 Jun 2024 12:17:15 -0400 (EDT)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1717690635;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=5xqiDvD8y4z/a7m1hJYP7K3YCF/4hF8rsxrnE5ysmcM=;
 b=/C4ELpKq28JnfAjBJD485HOYv1DgVMA5zjqHvv/SLjLzrl6ZYWRbsnnL/b/b3bzfvMgct
 vT+TIsjFJ1xEsaNDg==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1717690635;
	cv=none; b=KE2yikQ+LZZqVo7YxDSNE1ww0qqDcE1KmUdTtTxOGi1z2qYMd/5hZ/lS4MaI/04HcTpmLvdrZ7aQR8UCWhNvlhPijdfUAm0nAtBWNJJJbYzvbZUtpJySmFrXJqsQsK12qRcOWCRKnB+r3SAmy2E19Sf8eFlYYt9a0VbtQHpeTy2lQGJRt2fTIPFefaGYWH1wFBmjarQGtC4T9ypHctB+7GVYdtsGbb8U3bkuGmi2WwL/nM84B242N+gh57bBAYlM9dY0IVdMZx2tO0QlpR3V+rmPX7aobZjTFRb/Z3Cs5hqO7zrh4at5YkZP2i7bzJR2QgakrvhHmylQb3Bf7T4ROA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1717690635; c=relaxed/simple;
	bh=T+h1Ne4Z+Nus3xIRHnouZB6uatVfxpMENDpkUC19kdY=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=CVBpGFk1vpB7f4ZcPpVv96BaTtjtJjAS/8aCmRLqDJef1Ow0uaA8s+/gcSAs5M9CC4QgSC49KaPYREEumYjq1AkCsqBAwn61jKmxxlvgdM5mj7ayOTEiH+yN76j5yMXUiOzjj0+FbngJCbAhn+q7SeCegsTtQaoSk6ldBZzmtJyxdy06BkAbwYfC0+lStNGRD10eki3qwJSjtAL8E1YcpO6XfmcRpS2c0PcmxpPk8bEDJ4xDMzbAeUPMWka6/nJhvnCJjObOUySW7LYsRX+k2TvUUN8ANUnVVppMxblNILL3cWoNu/lS10WTfnM+IREfkIZkK1KK9Y4lFE4TyvHdIg==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1717690635;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=5xqiDvD8y4z/a7m1hJYP7K3YCF/4hF8rsxrnE5ysmcM=;
 b=OfscBZh31McAx9uDkwWIjfiAVKJKObsXTos8aUBzK4nDNHOPIgyN01RhnOx8LS6MuLO2z
 RIesYDiLvLJPAmCmUfTMpDziDkaXtR3vMKx5F3cApdYKt8LvQaVacWnQPZ74wbeMcs2Uy7r
 LlDL/vTlu+5iWhZLiJLWLUXS29MIQG7zToQuu7jsHPdhbp6QSwj5b0nxcJ4cgFfp1aZ4FUk
 Q4kCegacPjUJ6bzHooIc8q7e7j7PrczXFkcibnEtljdNg3B5BdN8zqmD78w+0PbqYO4allM
 L3D70y1j9OxiqaW/+gDglIjnQHi9wmvPNRhZLl7CU/wBHOXbniBSkGYaQ0dQ==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by srv8.sapience.com (Postfix) with ESMTPS id BDCCB280074;
	Thu, 06 Jun 2024 12:17:15 -0400 (EDT)
Message-ID: <7892aaab41a9332718ecafe997127244feb9a9c4.camel@sapience.com>
Subject: Re: 6.10-rc1 : crash in mei_csi_probe
From: Genes Lists <lists@sapience.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl,  laurent.pinchart@ideasonboard.com,
 wentong.wu@intel.com,  linux-media@vger.kernel.org, Linux regressions
 mailing list <regressions@lists.linux.dev>
Date: Thu, 06 Jun 2024 12:17:15 -0400
In-Reply-To: <ZmHasj3hfwwKimZF@kekkonen.localdomain>
References: <8afe9391b96ff3e1c60e624c1b8a3b2bd5039560.camel@sapience.com>
	 <ZlTllJeZBiGapHwZ@kekkonen.localdomain>
	 <988e48090982c89ce0c906954832fdfb09a1ce34.camel@sapience.com>
	 <eb10620deecc8feeae1e308c22de199be7c48ca6.camel@sapience.com>
	 <ZmHasj3hfwwKimZF@kekkonen.localdomain>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-3WOw2xXKzNBIwItK7RL4"
User-Agent: Evolution 3.52.2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-3WOw2xXKzNBIwItK7RL4
Content-Type: multipart/alternative; boundary="=-xOWo/GJJnUGNRnVrtydb"

--=-xOWo/GJJnUGNRnVrtydb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2024-06-06 at 15:50 +0000, Sakari Ailus wrote:
> Hi,
>=20
> It'll disappear once this patch is in:
> <URL:
> https://lore.kernel.org/linux-acpi/MW5PR11MB5787C81ABF0C9FFF5A17E4888DF32=
@MW5PR11MB5787.namprd11.prod.outlook.com/T/#t
> >.
>=20

Terrific - thank you!


--=20
Gene


--=-xOWo/GJJnUGNRnVrtydb
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
</style></head><body><div>On Thu, 2024-06-06 at 15:50 +0000, Sakari Ailus w=
rote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-lef=
t:2px #729fcf solid;padding-left:1ex"><div>Hi,<br></div><div><br></div><div=
>It'll disappear once this patch is in:<br></div><div>&lt;URL:<a href=3D"ht=
tps://lore.kernel.org/linux-acpi/MW5PR11MB5787C81ABF0C9FFF5A17E4888DF32@MW5=
PR11MB5787.namprd11.prod.outlook.com/T/#t">https://lore.kernel.org/linux-ac=
pi/MW5PR11MB5787C81ABF0C9FFF5A17E4888DF32@MW5PR11MB5787.namprd11.prod.outlo=
ok.com/T/#t</a>&gt;.<br></div><div><br></div></blockquote><div><br></div><d=
iv>Terrific - thank you!</div><div><br></div><div><br></div><div><span><pre=
>-- <br></pre><div><span style=3D"background-color: inherit;">Gene</span></=
div><div><br></div></span></div></body></html>

--=-xOWo/GJJnUGNRnVrtydb--

--=-3WOw2xXKzNBIwItK7RL4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZmHhCwAKCRA5BdB0L6Ze
202uAQC3Ar3+V5TBBDOxG0kL2t/ZaEbg2Jgo8+UvffVvnMaB1QD+J1CIIAMWPchk
P6mw0Qtb7ZCa9kEmKzAEGAKrKavzmgE=
=6+Me
-----END PGP SIGNATURE-----

--=-3WOw2xXKzNBIwItK7RL4--

