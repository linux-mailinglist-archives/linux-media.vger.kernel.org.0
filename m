Return-Path: <linux-media+bounces-48991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 835B8CC7DF8
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 14:39:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA8C7309F4BB
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 13:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FEE3659F1;
	Wed, 17 Dec 2025 13:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="d+1j1d9z"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECF333B6D5;
	Wed, 17 Dec 2025 13:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765978481; cv=none; b=o1jKyQwYaGobKapddtnx4Oc38yakZ5PknZMa5hxc4xRIBH0MWt4xjZobxgDkEM0mOVkiaVjiBKk4Elb3bhfyMq+nbbOKjTGDhxFMjBw8VavMISAIjLggAQEdiK8jYYvNwFU3javD9Ll2BQdkD4Lth1F9tWw1Zyuo7ZljQN+kT08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765978481; c=relaxed/simple;
	bh=tCIxJNLWcIU2TjDVqmnt1h0tCwLC0XUxy/MtT8w/Hpw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JQ+fmZmbpRx8+4hgQt1po4LaG4UjaNn5vP1jL1SWJjIeLbdw8/fsatNc+/JxNllTw/isi4rZgFQ3vzBfGZfwPIgg1IXRe/fVDZmXaepLzUxPKOefcRVcuXFkFSqxuFJnjyPzaG7nwOSSo4gMQfTjU2L8KdXCyLTiW/G3/GrsSmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=d+1j1d9z; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765978477;
	bh=tCIxJNLWcIU2TjDVqmnt1h0tCwLC0XUxy/MtT8w/Hpw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=d+1j1d9zjTT0M1ZAHDWdZcQBLAZ0jUo76R2g68OKWsVIny5JoICl0hvi7nc6fetLT
	 mUfee6SJPrC/t8mhJJLyEa1iW4Y/UszNDWXW6L1gb1/hU12dtIqWQho0L5qR8Q45dJ
	 ZrncfPTAYlt8i97fR4YHA2CMUYfbStzNgiG5dKyh3FPurzt0BX/9+fntuuZWAitptU
	 GH9ES5FMV9lpvzZD8wE4nciBTpLWJjDCvnaKJn1EjEI9MJg8YcXMIE4VxAfid9Uawu
	 /pUOZ/yhYn2AVxmaeDSwx83WnetnXaI6p4YZmcHbZntDd2r8mUKNnYsEdPxj75Kd8z
	 fFU+hsjldkFYA==
Received: from [IPv6:2606:6d00:17:7b4b::5ac] (unknown [IPv6:2606:6d00:17:7b4b::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 80A4917E127F;
	Wed, 17 Dec 2025 14:34:35 +0100 (CET)
Message-ID: <0482b76919217cf007d0abe1c683e862903a1a40.camel@collabora.com>
Subject: Re: [PATCH v5 01/15] media: uapi: HEVC: Add
 v4l2_ctrl_hevc_ext_sps_[ls]t_rps controls
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, Hans Verkuil
	 <hverkuil+cisco@kernel.org>, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner <heiko@sntech.de>, Ricardo
 Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil@kernel.org>, Hans de
 Goede <hansg@kernel.org>,  Yunke Cao <yunkec@google.com>, Jonathan Corbet
 <corbet@lwn.net>, Laurent Pinchart	 <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,  James Cowgill
 <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Date: Wed, 17 Dec 2025 08:34:33 -0500
In-Reply-To: <e88eb64e-ae47-4c70-87af-44c8f0371be9@collabora.com>
References: <20251023214247.459931-1-detlev.casanova@collabora.com>
	 <20251023214247.459931-2-detlev.casanova@collabora.com>
	 <d8ef0f88-e81d-4159-8945-52197cbc95ba@kernel.org>
	 <37da2fe3-41bd-470e-bb6c-93fe35ee1528@collabora.com>
	 <bcbf8247a778c0a179cef2e0338acb2266c18809.camel@collabora.com>
	 <e88eb64e-ae47-4c70-87af-44c8f0371be9@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-L53cNKzQuROd39WEVXeE"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-L53cNKzQuROd39WEVXeE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 16 d=C3=A9cembre 2025 =C3=A0 17:18 -0500, Detlev Casanova a =C3=A9=
crit=C2=A0:
> > Before going that route, how big are these two arrays ? Short term can =
be 64
> > ref, long term 32, how big in bytes that is ? Was is worth goign with
> > dynamic
> > array ? Its not like slices, where we can have 600 or more.
>=20
> The short term one can still be quite big, it's about 80 bytes per=20
> element, so 5120 bytes for the 64.
>=20
> I don't know how often we go that high, I've seen around 10 short term=
=20
> ref sets in test videos.

We've never defined a threshold, so its hard to just define which direction=
 to
go. I generally think using dynamic array was logical thing to do though.

Nicolas

--=-L53cNKzQuROd39WEVXeE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUKxaQAKCRDZQZRRKWBy
9DvsAP0Q2NNHxc8jrYFvxcg9jsWj09g2eOj92V1QsYgjR4pNVQEA2eK88BefxbvK
v1zF5F4ZJe7rb2RMaHpvkmxnnK28cww=
=3ld5
-----END PGP SIGNATURE-----

--=-L53cNKzQuROd39WEVXeE--

