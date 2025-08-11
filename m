Return-Path: <linux-media+bounces-39438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D883FB20BE8
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 16:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D19EA3ADA77
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 14:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D3F24C060;
	Mon, 11 Aug 2025 14:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="E6I0/nQs"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF35F2441B4;
	Mon, 11 Aug 2025 14:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754922438; cv=none; b=Ut9yyBpSi/X1nBhs7C4vEOx7Azh+myfrxoLEUdfOTJ7fnVh89nvFsxKZOycd3WyjGA/kJhsHxIqZGFKvmr7rUhY5ccPdpVu8cUxtpMmr2Lt7ztdjCKIo5hPsT27iU+gchNzV6PT8tSCPtGHefT5jxotCPcD1Cor1QuJFWkMk0io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754922438; c=relaxed/simple;
	bh=ToD+V4Y6QuUockNI5WYMvlxRPFX6OLPNwxY8Q3Oq6ag=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eIq42dBFaQZO+GDeppTqpp1IHigZGIGsMDspiGcMhVPDH8eBWsiME5DMoK6p2zlG2/04QtHKyX3e4flJtKt5aiJ5DX+mCc4JMRPaFzKzAyvTai78w1xQ9I4pASL/umbIVQCWfnJsffhUabjT91EEtBeHHmtzLAwE1kTsepw+B5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=E6I0/nQs; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754922433;
	bh=ToD+V4Y6QuUockNI5WYMvlxRPFX6OLPNwxY8Q3Oq6ag=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=E6I0/nQsoSr5TDpWWEwo2yfzPByADNf07S4gkE5bY5v4XkVytrh8kcIBVoadWw3FP
	 tSVwdqKz/ssqR0WPGPKOP+W3414PqwcIiVyxe/ot1b9iMEbkF/zXtPFP8IAdQ60dml
	 PZMSAg6dz/LPAABoN2lvcODhsX2z7jao1JkazIxhbBc61X8ZNG9KwkDjCR4Boh0UkJ
	 AsyIZbV1ChEYiuZj3pMP+JPNDdiDhsEPmF+ki03M81o/scNoLEPD8MWFE95Ibu9wVr
	 xgQFXrY023mStztbAI9twO0eB5N7nMqDPR6zZmr6TfR5c3c3uSLSlhsSucaKjl7EnY
	 wghU7U3FMrpIw==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E5B8817E00AC;
	Mon, 11 Aug 2025 16:27:11 +0200 (CEST)
Message-ID: <f904836c0bd78f71e0a85d8d924c7862415a3728.camel@collabora.com>
Subject: Re: [PATCH v2] media: rkvdec: Fix an error handling path in
 rkvdec_probe()
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Heiko Stuebner	 <heiko@sntech.de>, Hans Verkuil
 <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Date: Mon, 11 Aug 2025 10:27:10 -0400
In-Reply-To: <00b13063525c2aee6a60a7f6810f69c12bf2a866.1753899866.git.christophe.jaillet@wanadoo.fr>
References: 
	<00b13063525c2aee6a60a7f6810f69c12bf2a866.1753899866.git.christophe.jaillet@wanadoo.fr>
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
	boundary="=-19AGW8VvHYkhYtzMHXQj"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-19AGW8VvHYkhYtzMHXQj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 30 juillet 2025 =C3=A0 20:24 +0200, Christophe JAILLET a =C3=A9=
crit=C2=A0:
> If an error occurs after a successful iommu_paging_domain_alloc() call, i=
t
> should be undone by a corresponding iommu_domain_free() call, as already
> done in the remove function.
>=20
> In order to fix the issue, move the corresponding call at the end of the
> function, because it is safe to allocate 'empty_domain' later.
>=20
> Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
> Compile tested only.
>=20
> Changes in v2:
> =C2=A0 - Move code instead of handling errors=C2=A0=C2=A0 [Nicolas Dufres=
ne]
> =C2=A0 - Add R-b tag
>=20
> v1:
> https://lore.kernel.org/all/b69c20783a7b6f7964ab636679d3da80fc48372e.1753=
610517.git.christophe.jaillet@wanadoo.fr/
> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c | 14 +++++++-------
> =C2=A01 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index d707088ec0dc..6eae10e16c73 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1159,13 +1159,6 @@ static int rkvdec_probe(struct platform_device *pd=
ev)
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> -	if (iommu_get_domain_for_dev(&pdev->dev)) {
> -		rkvdec->empty_domain =3D iommu_paging_domain_alloc(rkvdec-
> >dev);
> -
> -		if (!rkvdec->empty_domain)
> -			dev_warn(rkvdec->dev, "cannot alloc new empty
> domain\n");
> -	}

I've re-applied including Dan's fixes, iommu_paging_domain_alloc() does not
return NULL on error. No action required.

Nicolas

> -
> =C2=A0	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> =C2=A0
> =C2=A0	irq =3D platform_get_irq(pdev, 0);
> @@ -1188,6 +1181,13 @@ static int rkvdec_probe(struct platform_device *pd=
ev)
> =C2=A0	if (ret)
> =C2=A0		goto err_disable_runtime_pm;
> =C2=A0
> +	if (iommu_get_domain_for_dev(&pdev->dev)) {
> +		rkvdec->empty_domain =3D iommu_paging_domain_alloc(rkvdec-
> >dev);
> +
> +		if (!rkvdec->empty_domain)
> +			dev_warn(rkvdec->dev, "cannot alloc new empty
> domain\n");
> +	}
> +
> =C2=A0	return 0;
> =C2=A0
> =C2=A0err_disable_runtime_pm:

--=-19AGW8VvHYkhYtzMHXQj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaJn9vgAKCRBxUwItrAao
HP14AKDeWTa5P0d9CA6ywPOUflta+mlh4ACfe9DEE0Ie16V482KxslENbG3kPoE=
=t0j7
-----END PGP SIGNATURE-----

--=-19AGW8VvHYkhYtzMHXQj--

