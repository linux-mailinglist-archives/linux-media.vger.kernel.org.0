Return-Path: <linux-media+bounces-38645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1365B15456
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 22:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAAEA544CC3
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 20:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D1726772C;
	Tue, 29 Jul 2025 20:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oEBbTxd3"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AFF1DDD1;
	Tue, 29 Jul 2025 20:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753820937; cv=none; b=YpvuDJx9nwkLnduQAkN1yw/p+CtfYxtttmPZkE3jf6fSuCQvw77FO8F2QlzHLYldh1LSHn9saILvHyM4mJ9wdZoQXX2WMy1cQmuH3EselSXyNZfPeImKd1F3R2vXDli69Xins93D5HVrEm8M9DeaebWNF0JclNy7P9lI0kw0a88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753820937; c=relaxed/simple;
	bh=jZMrI5UUMbuZDiGnt8FkFQimvckPilm2MrcZRDKWVHc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TLLVyRcXToKfjbi8r2YnsuJvUKbU4787m+lQOFcpZf6ByJXIiBY9k7zgf1e3jTmCFLSaUU3BQTeWLoBBj/933wJ9CX8QqttjzsIzuBcvaPFX5t3aNaIo7jnhakhwBbgMy7CgN8sJ4s6y94AiYppAZZLm2aMHg1MlFv8Xgh7vUrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oEBbTxd3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753820933;
	bh=jZMrI5UUMbuZDiGnt8FkFQimvckPilm2MrcZRDKWVHc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=oEBbTxd3KVDL4gP8qEqUcbEzbglIvu61cPRJma43SBVByqj19YVbfMq4GaSrlxzgl
	 YVyAE/VV4kpMmv2P04eg/mDRALf2fX0X8o1szBF3Vf1XBhGvrs5IN07jymf/LCdNFK
	 ifcTkLbhUAsMQVVHOgofnWErTrcXkDEwgeJkJuYExyu1vAZx1mATpR/Pzwmg11yjDP
	 vXGQyXr796C/bsujGRrIwVUwih33Zsa9X9CtKfG4WcBEDXVjXhZ3EYZUzSEJfeQPj/
	 zbrIlnJlWRRBfIbEu6ngEknbi3FCdm+vxeSj+HmAf1m8P8r5xI9bShZxy2BHGX/BOO
	 REa+3g5DDqvbQ==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0451317E1293;
	Tue, 29 Jul 2025 22:28:51 +0200 (CEST)
Message-ID: <75434480affd424f3be4885acc3f18e57423b72e.camel@collabora.com>
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
Date: Tue, 29 Jul 2025 16:28:49 -0400
In-Reply-To: <884293c1-f6f4-48b3-a5d9-9b41fa8614a5@wanadoo.fr>
References: 
	<b69c20783a7b6f7964ab636679d3da80fc48372e.1753610517.git.christophe.jaillet@wanadoo.fr>
	 <0a8391cb368653b91ea73a51e2c0dee35cceb128.camel@collabora.com>
	 <884293c1-f6f4-48b3-a5d9-9b41fa8614a5@wanadoo.fr>
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
	boundary="=-05BjQuggd1guXcSOOvaz"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-05BjQuggd1guXcSOOvaz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 29 juillet 2025 =C3=A0 21:33 +0200, Christophe JAILLET a =C3=A9cri=
t=C2=A0:
> Le 29/07/2025 =C3=A0 00:50, Nicolas Dufresne a =C3=A9crit=C2=A0:
> > Hi,
> >=20
> > Le dimanche 27 juillet 2025 =C3=A0 12:02 +0200, Christophe JAILLET a =
=C3=A9crit=C2=A0:
> > > If an error occurs after a successful iommu_paging_domain_alloc() cal=
l, it
> > > should be undone by a corresponding iommu_domain_free() call, as alre=
ady
> > > done in the remove function.
> > >=20
> > > Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on error=
s")
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > ---
> > > Compile tested only
> > > ---
> > > =C2=A0=C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c | 11 ++++=
++++---
> > > =C2=A0=C2=A01 file changed, 8 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > > b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > > index d707088ec0dc..eb0d41f85d89 100644
> > > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > > @@ -1169,15 +1169,17 @@ static int rkvdec_probe(struct platform_devic=
e *pdev)
> > > =C2=A0=C2=A0	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK=
(32));
> > > =C2=A0=20
> > > =C2=A0=C2=A0	irq =3D platform_get_irq(pdev, 0);
> > > -	if (irq <=3D 0)
> > > -		return -ENXIO;
> > > +	if (irq <=3D 0) {
> > > +		ret =3D -ENXIO;
> > > +		goto err_free_domain;
> > > +	}
> > > =C2=A0=20
> > > =C2=A0=C2=A0	ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
> > > =C2=A0=C2=A0					rkvdec_irq_handler, IRQF_ONESHOT,
> > > =C2=A0=C2=A0					dev_name(&pdev->dev), rkvdec);
> > > =C2=A0=C2=A0	if (ret) {
> > > =C2=A0=C2=A0		dev_err(&pdev->dev, "Could not request vdec IRQ\n");
> > > -		return ret;
> > > +		goto err_free_domain;
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > =C2=A0=C2=A0	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
> >=20
> > Have you considered moving the allocation of the domain right above the=
 above
> > line instead ? The empty domain can't possibly be used unless the probe=
 have
> > fully completed.
>=20
> That would not change things much. We still need to handle=20
> rkvdec_v4l2_init() failure a few lines below.
>=20
> If it is correct to move it at the very end of the function, after=20
> rkvdec_v4l2_init(), then the patch would be simpler.
>=20
>=20
> Honestly, I'm not very confident with it. request_threaded_irq()=20
> documentation states that "From the point this call is made your handler=
=20
> function may be invoked."
> And rkvdec_irq_handler() may call rkvdec_iommu_restore() which uses=20
> empty_domain.


This is a supposition in the doc. If you get familiar with codec, they eith=
er
have a firmware that needs to be booted, or it is trigger based, meaning if=
 we
don't trigger any work, there will not be any interrupt. This is not true f=
or
all kind of hardware though.

>=20
> Not sure if I'm right and if this can happen, but the existing order=20
> looks safer to me.
>=20
> That said, if it is fine for you, I can send a v2.
>=20
>=20
> This would be:
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c=20
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index d707088ec0dc..6eae10e16c73 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1159,13 +1159,6 @@ static int rkvdec_probe(struct platform_device *pd=
ev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (iommu_get_domain_for_dev(&pdev-=
>dev)) {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 rkvdec->empty_domain =3D=20
> iommu_paging_domain_alloc(rkvdec->dev);
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (!rkvdec->empty_domain)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_warn(rkvde=
c->dev, "cannot alloc new empty=20
> domain\n");
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> -
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vb2_dma_contig_set_max_s=
eg_size(&pdev->dev, DMA_BIT_MASK(32));
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq =3D platform_get_irq=
(pdev, 0);
> @@ -1188,6 +1181,13 @@ static int rkvdec_probe(struct platform_device *pd=
ev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 goto err_disable_runtime_pm;
>=20
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (iommu_get_domain_for_dev(&pdev-=
>dev)) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 rkvdec->empty_domain =3D=20
> iommu_paging_domain_alloc(rkvdec->dev);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (!rkvdec->empty_domain)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_warn(rkvde=
c->dev, "cannot alloc new empty=20
> domain\n");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;

For me this looks cleaner, but as you stated its a matter of taste more the=
n
anything. A better answer lives in cleanup.h, but I'm not going to ask to p=
ort
drivers just yet.

So let me know, it can go like this too.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Nicolas

>=20
> =C2=A0 err_disable_runtime_pm:
>=20
>=20
> CJ
>=20
> >=20
> > Nicolas
> >=20
> > > @@ -1193,6 +1195,9 @@ static int rkvdec_probe(struct platform_device =
*pdev)
> > > =C2=A0=C2=A0err_disable_runtime_pm:
> > > =C2=A0=C2=A0	pm_runtime_dont_use_autosuspend(&pdev->dev);
> > > =C2=A0=C2=A0	pm_runtime_disable(&pdev->dev);
> > > +err_free_domain:
> > > +	if (rkvdec->empty_domain)
> > > +		iommu_domain_free(rkvdec->empty_domain);
> > > =C2=A0=C2=A0	return ret;
> > > =C2=A0=C2=A0}
> > > =C2=A0=20

--=-05BjQuggd1guXcSOOvaz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaIkvAQAKCRBxUwItrAao
HCNoAJ9ZUC8asKL6KZjVLXujVOUOEc8kLACaA03KI5fVnkU2EAe3rnQSnpDFQnk=
=yQn/
-----END PGP SIGNATURE-----

--=-05BjQuggd1guXcSOOvaz--

