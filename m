Return-Path: <linux-media+bounces-48531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAFBCB1C84
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 04:18:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9DB93009106
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 03:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CB22DAFB5;
	Wed, 10 Dec 2025 03:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPGin8o8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E0B2D24B6;
	Wed, 10 Dec 2025 03:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765336717; cv=none; b=c1n1ZbK5d7JDK5R32Any4+ak04Pr5whtKLlWo9C338bs2jdxlj9kjulbuKq7utLu1YwfQgPoHR5NPBFSRm2uQtY5iATBbjtZ7hwL5tlINGHV33kO9inT+GS38MIqj4kZeCOLIjLPmULYa0mruV2wYs7x1D9V+F5jle9n5vgZyzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765336717; c=relaxed/simple;
	bh=HTnrHTpkg4dlBAzb/c3lsvZ7TW/iYXn/GA/ChEpNu18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I29E7yBPzf94fC33gSPChBHYgwPyBoOAOUTSp0sUVjlemrchHxKQmCHbv385a9cuSPLnyDHkO5H214/qFZzuk6XC56AbSQOqBFuaB1I1tOt6T2ILE0e1MgYwS+lK68a6wZVa7kXVwZ5Adbq8FX7Xus4w4LK7vyspZu0TICLELSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPGin8o8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70FEC4CEF5;
	Wed, 10 Dec 2025 03:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765336715;
	bh=HTnrHTpkg4dlBAzb/c3lsvZ7TW/iYXn/GA/ChEpNu18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CPGin8o8C5hUdY6uDZFP4486rE2KwWH7P6oN2hgY8B0hJZ6GxD+Cg+iIk+75M4Wy3
	 8Syls95IL73FoT6SAJQVltrejOsILLI7euSmQOU7kssetxMJMjwmlpYDx8G4RrpKqV
	 RgxK8mHsXMxeg+bYioSe20XpAWDHTisUiK77e2bcPBpXGFAyAuiG173GVmRn3g0Bd9
	 SbKd1FW+jAuC18+re7pPZBp+IdN5oMM3EkAmO2QDQ50yiWRFu+HKkMnjzaPuguTsEp
	 HQ8xSglhMTPdrFMi2wBx1M+n5LZoKypGNWIBvA3KWBu1wfTFuVnzIiHJpDfQGmqkgG
	 drEsk3R3SCpvA==
Received: from johan by theta with local (Exim 4.99)
	(envelope-from <johan@kernel.org>)
	id 1vTAlD-000000008Gf-1FEi;
	Wed, 10 Dec 2025 12:21:03 +0900
Date: Wed, 10 Dec 2025 12:21:03 +0900
From: Johan Hovold <johan@kernel.org>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>, linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: mediatek: amend vpu_get_plat_device()
 documentation
Message-ID: <aTjnH_i0q0xyLysD@hovoldconsulting.com>
References: <20251028100454.4086-1-johan@kernel.org>
 <20251028100454.4086-3-johan@kernel.org>
 <836bcbc3e35c267abd93a4d2174a3e570ca9e181.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p2LLKI/CbsHhUYRj"
Content-Disposition: inline
In-Reply-To: <836bcbc3e35c267abd93a4d2174a3e570ca9e181.camel@ndufresne.ca>


--p2LLKI/CbsHhUYRj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 09, 2025 at 03:43:30PM -0500, Nicolas Dufresne wrote:
> Hi,
>=20
> Le mardi 28 octobre 2025 =C3=A0 11:04 +0100, Johan Hovold a =C3=A9crit=C2=
=A0:
> > Add a comment to the vpu_get_plat_device() documentation to make it
> > clear that the VPU platform device is returned with an incremented
> > reference count (which needs to be dropped after use).
> >=20
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> > =C2=A0drivers/media/platform/mediatek/vpu/mtk_vpu.h | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/me=
dia/platform/mediatek/vpu/mtk_vpu.h
> > index da05f3e74081..5808311d2b15 100644
> > --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> > +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> > @@ -120,7 +120,7 @@ int vpu_ipi_send(struct platform_device *pdev,
> > =C2=A0 *		device for using VPU API.
> > =C2=A0 *
> > =C2=A0 * Return: Return NULL if it is failed.
> > - * otherwise it is VPU's platform device
> > + * otherwise it is VPU's platform device with incremented reference co=
unt
>=20
> I picked this patch but rewrote with what felt like better and dense.
>=20
> - * Return: Return NULL if it is failed.
> - * otherwise it is VPU's platform device
> + * Return: a reference to the VPU's platform device, or NULL on failure.
>=20
> hope its ok with you,

Sure, my only concern is that just saying "reference" is too subtle,
that's why I explicitly mentioned the refcount.

Btw, why is patch 2/2 marked obsolete? That leak is still there both on
probe errors (which I saw someone else posted a fix for) and on driver
unbind.

Johan

--p2LLKI/CbsHhUYRj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCaTjnFAAKCRALxc3C7H1l
CD7xAQDkhBeScQ152BZaSbV4ibLwRlxYvwnVCHDXVy5IcQn7PgEAljZlQZKju7EM
w/ogKHitR+nWXaEDkkt3ylcnfUcGyA4=
=+thX
-----END PGP SIGNATURE-----

--p2LLKI/CbsHhUYRj--

