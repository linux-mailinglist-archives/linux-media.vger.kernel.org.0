Return-Path: <linux-media+bounces-35891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 002C0AE8974
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 18:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67AE4683545
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 16:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D62B2D5C6C;
	Wed, 25 Jun 2025 16:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="afqgb50X"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E4E2BDC10;
	Wed, 25 Jun 2025 16:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750868009; cv=none; b=rObygPMJCJ11LJGm5Q9JxSxoSTYxIjTXGpgT5R6hTVWRf/aTsaHxV6B6U08q6iRRBj/cyOMcaPNZXYXiAOfpGa9KiJMHNBkRA2an/8x2JVis7ZuWZScdnT4Iwl1J96d87KOa9JGz3ZzRfPVr1pxs2dEE+wDUkjW5XYKP3V7T/iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750868009; c=relaxed/simple;
	bh=IIQljKBsNRMZzyX/Rtn6xxA6HrVZM41HmNzZGjrS+bc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=opnDqhT1A6ZXMIih7ZjIOanMrecagirnSRu4tEkppNs7yggkfF6Y/1OqopCQp7JyzCKVNeHCRPCTnRw9A7RCbXT3WnUlRp8A63sKvQIRggH3iMSZ9w4Rmf4vQ8frecGqd5giIKRptw8cfSLqm6XvCtfpyo+E8fmGNeipcMEMceE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=afqgb50X; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750868004;
	bh=IIQljKBsNRMZzyX/Rtn6xxA6HrVZM41HmNzZGjrS+bc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=afqgb50Xmd4fpACfmLcinWsRLQN09kVBJtwqMJ2v7rl+t/yH8DTDpSLQISRJz70zA
	 eSZiVO3RJlgLJP6qPscVt912gxR7zny4IGv0kkqowCLJ7eiMHL5tyYYFVzFY2D24WL
	 GgeY64UmAlz8Njb1MRa70lKlVBeGIs4yCy/u0Jw+o/tda3C4+zBzo0vJkU227jwyXR
	 XrgpbpbUhc9BTRgcWUDADkFDDsq49zTA9J33rfwqvancfDIIYMcFbwzFJg9xzE6CaM
	 NLgiwAdPO172FCMjCL3DXA25DQKYhqTJ2y/3W4el37bIqkKpWolv3i6aQdWmEn3Zp6
	 G63fs6uKBWK1w==
Received: from [IPv6:2606:6d00:17:b699::bad] (unknown [IPv6:2606:6d00:17:b699::bad])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1286C17E0202;
	Wed, 25 Jun 2025 18:13:22 +0200 (CEST)
Message-ID: <6ac8b8db02190da7d2edc9ce4abe5e7a7cab70d6.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: Fix a NULL vs IS_ERR() bug in probe()
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Ezequiel Garcia
	 <ezequiel@vanguardiasur.com.ar>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil@xs4all.nl>, Detlev
 Casanova <detlev.casanova@collabora.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Date: Wed, 25 Jun 2025 12:13:20 -0400
In-Reply-To: <696219e9-a1c7-4c87-b15c-1ffd42c95d58@sabinyo.mountain>
References: <696219e9-a1c7-4c87-b15c-1ffd42c95d58@sabinyo.mountain>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-Yg+9RAryTT3i1Yp4yaC4"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-Yg+9RAryTT3i1Yp4yaC4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 25 juin 2025 =C3=A0 10:23 -0500, Dan Carpenter a =C3=A9crit=C2=
=A0:
> The iommu_paging_domain_alloc() function doesn't return NULL on error it
> returns error pointers.=C2=A0 Update the check and then set ->empty_domai=
n to
> NULL because the rest of the driver assumes it can be NULL.
>
> Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")

Oh, sorry about that, I'll will test your patch this week, but otherwise
looks good to me, fixing yet one more error path. I'll take the time
to test dropping the iommu node from the DT while at it, as I simply
don't remember if that was re-tested after that change.

regards,
Nicolas

> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> =C2=A0drivers/staging/media/rkvdec/rkvdec.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/medi=
a/rkvdec/rkvdec.c
> index d707088ec0dc..1b7f27e4d961 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -1162,8 +1162,10 @@ static int rkvdec_probe(struct platform_device *pd=
ev)
> =C2=A0	if (iommu_get_domain_for_dev(&pdev->dev)) {
> =C2=A0		rkvdec->empty_domain =3D iommu_paging_domain_alloc(rkvdec->dev);
> =C2=A0
> -		if (!rkvdec->empty_domain)
> +		if (IS_ERR(rkvdec->empty_domain)) {
> +			rkvdec->empty_domain =3D NULL;
> =C2=A0			dev_warn(rkvdec->dev, "cannot alloc new empty domain\n");
> +		}
> =C2=A0	}
> =C2=A0
> =C2=A0	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));

--=-Yg+9RAryTT3i1Yp4yaC4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaFwgIAAKCRBxUwItrAao
HJNoAKCHiY+S3IyVE4XjQknVwTjwtJf1vACgqDbhVHBrZ4XhiuSSP0h7rE8sanI=
=F7Kw
-----END PGP SIGNATURE-----

--=-Yg+9RAryTT3i1Yp4yaC4--

