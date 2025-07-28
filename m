Return-Path: <linux-media+bounces-38597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBC0B1447A
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 00:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 411275400CE
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 22:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A755D235BEE;
	Mon, 28 Jul 2025 22:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jz3AhKYX"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6E82E3708;
	Mon, 28 Jul 2025 22:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753743044; cv=none; b=PYKYkR7tjJ18WMANyEUiR6rNCSgdl1rQowsMZZz6kue33tYT9sLI+8DlHRWaVyeYQPXXB23ER6N7m//mNgvDpEQWshrqx0Ui7uKdVEGGAlGHNBqdcM5VV7sAFoi0rEitB2CvIVESdQYsXVBOAHLLXep3WKP+6y0pXi5lK7ndC88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753743044; c=relaxed/simple;
	bh=aUFYEhrBDCMb4rwh/p3Q8a9jltXCwz63SKfYeyEBQ9c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V374/Bd8lQWuTVZ6WVJhnR0+eRY1wtHYjBndG4Q0RCQ1GuojjI1HyEeIaqP9CczVTqfRiZgbfGQ0yHavIRkQphxorzafXLH+177R63GW/189RjPUkuz9U/g7BHi0fWtGI8Fhy2vGh/HLqjCBAQxs212IUxPgO5iZFvB9tzJAj9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jz3AhKYX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753743040;
	bh=aUFYEhrBDCMb4rwh/p3Q8a9jltXCwz63SKfYeyEBQ9c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jz3AhKYXHiMcXAa5/TA6plvdh9o27whoXtIwBXldnVh6kY0wZbIFp7Bd0PdmUBkhV
	 JrSb5Qui32vWAwBDerTapR7pJhoeT4wXj4fJJeWefITauKHpqg2AL5Yh1h1qhWqiA/
	 wM7TRDt5Yt7gVJdy1ohMmrHfFyjdZgWcBbjnGzzVGZwIG/+Ov+oZSBVsGyGCGyH3bu
	 LVjpw2IRptw6sFa87JZKElLRc5vpiGkiMDbSo/1tftTGTjrO/+3QLoLvRSDC63Va6a
	 gr5bYx9CTVwRQujAPVn1n4NYndKo7cQ6lZHX3c40SKA2+yKYme+4aZV2jJWgWjJd18
	 7NAzEwERFL0iQ==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E982017E0FA8;
	Tue, 29 Jul 2025 00:50:38 +0200 (CEST)
Message-ID: <0a8391cb368653b91ea73a51e2c0dee35cceb128.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: Fix an error handling path in
 rkvdec_probe()
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Heiko Stuebner	 <heiko@sntech.de>, Hans Verkuil
 <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Date: Mon, 28 Jul 2025 18:50:36 -0400
In-Reply-To: <b69c20783a7b6f7964ab636679d3da80fc48372e.1753610517.git.christophe.jaillet@wanadoo.fr>
References: 
	<b69c20783a7b6f7964ab636679d3da80fc48372e.1753610517.git.christophe.jaillet@wanadoo.fr>
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
	boundary="=-HBQA1dSSAY++JW3+CEB6"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-HBQA1dSSAY++JW3+CEB6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le dimanche 27 juillet 2025 =C3=A0 12:02 +0200, Christophe JAILLET a =C3=A9=
crit=C2=A0:
> If an error occurs after a successful iommu_paging_domain_alloc() call, i=
t
> should be undone by a corresponding iommu_domain_free() call, as already
> done in the remove function.
>=20
> Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only
> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c | 11 ++++++++---
> =C2=A01 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index d707088ec0dc..eb0d41f85d89 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1169,15 +1169,17 @@ static int rkvdec_probe(struct platform_device *p=
dev)
> =C2=A0	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> =C2=A0
> =C2=A0	irq =3D platform_get_irq(pdev, 0);
> -	if (irq <=3D 0)
> -		return -ENXIO;
> +	if (irq <=3D 0) {
> +		ret =3D -ENXIO;
> +		goto err_free_domain;
> +	}
> =C2=A0
> =C2=A0	ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
> =C2=A0					rkvdec_irq_handler, IRQF_ONESHOT,
> =C2=A0					dev_name(&pdev->dev), rkvdec);
> =C2=A0	if (ret) {
> =C2=A0		dev_err(&pdev->dev, "Could not request vdec IRQ\n");
> -		return ret;
> +		goto err_free_domain;
> =C2=A0	}
> =C2=A0
> =C2=A0	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);

Have you considered moving the allocation of the domain right above the abo=
ve
line instead ? The empty domain can't possibly be used unless the probe hav=
e
fully completed.

Nicolas

> @@ -1193,6 +1195,9 @@ static int rkvdec_probe(struct platform_device *pde=
v)
> =C2=A0err_disable_runtime_pm:
> =C2=A0	pm_runtime_dont_use_autosuspend(&pdev->dev);
> =C2=A0	pm_runtime_disable(&pdev->dev);
> +err_free_domain:
> +	if (rkvdec->empty_domain)
> +		iommu_domain_free(rkvdec->empty_domain);
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0

--=-HBQA1dSSAY++JW3+CEB6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaIf+vAAKCRBxUwItrAao
HIh7AJ9siqERzUwFpo03WB/ccY47zYm2BwCcDeERz+YrhGQaSfBNmTmJ7h2Kxgw=
=gy7Q
-----END PGP SIGNATURE-----

--=-HBQA1dSSAY++JW3+CEB6--

