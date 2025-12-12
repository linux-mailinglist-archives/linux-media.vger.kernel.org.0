Return-Path: <linux-media+bounces-48685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE94DCB7A83
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 03:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2BED302B102
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 02:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3AC21FBEA6;
	Fri, 12 Dec 2025 02:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1CdCIFy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DB53597B;
	Fri, 12 Dec 2025 02:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765505942; cv=none; b=qyivKKVVuGgJNpUW5gH+FqylFV3wPL09CqxYM/ZHGK1ttzgGzpbTcc4NBr+wGVPsPAj4vwDutCDilW6cZJVA8XvlLRr09CGyYbONVV4y3oRMOBgvUwH21SrKo30XlO/5vts4JHP1BtI5gxUH/whmhZX6khfj32lqHcm5LZxAi+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765505942; c=relaxed/simple;
	bh=BgiaZ7V7m0ozSVnXi4W5objETFPBD27OWXPjCZQsXiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IA4STL8e2DBxf5EqDL26k0IOt2NEEZLcBCqfVvn+79RZjUMTTtUo7TYsJmNeLLBhiJr7lwMrmPKRgYjlf+06eWV6HsFuN2vBINQP23MfNcD2vTSG1fgJtSJH3PPXijVw1g4mA3MgVil20jJd0udQH7+RBP376pH23OrFekY7olk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1CdCIFy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB8FC4CEF7;
	Fri, 12 Dec 2025 02:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765505941;
	bh=BgiaZ7V7m0ozSVnXi4W5objETFPBD27OWXPjCZQsXiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W1CdCIFy1DIdaM12ODSJg9551ugg/J3MTmBm6s+LtkGOknQmEz27CG9AALgfgrgan
	 vP5ay3qtdd3cNbI5hOOEfZ2Wq15n6dtshAh66W6PrektoBGLJZnITSE9QwrPKY6TaJ
	 etvshAGhoCUzYDgqJl+KPvLXgpFfYXLRsyUPkF6iha/7AM+LmMi5d8QL8fU1eIhLiS
	 ztLtfcHFXz0G/iGHIlw1M+RtbZoKChoif7UXJB5536FyrXqWzdWBvnKiYNsMLsDsSa
	 IkvaDembqQuBYaa6FLpR6QBYKr5ceN3/H7KAU/M8NnyvGlF3CuP0Te7wjSujU18ngH
	 7nwAFREQsmvRw==
Received: from johan by theta with local (Exim 4.99)
	(envelope-from <johan@kernel.org>)
	id 1vTsmr-000000007n6-1c7X;
	Fri, 12 Dec 2025 11:21:41 +0900
Date: Fri, 12 Dec 2025 11:21:41 +0900
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
Message-ID: <aTt8NSV4SP2ojKvi@hovoldconsulting.com>
References: <20251028100454.4086-1-johan@kernel.org>
 <20251028100454.4086-3-johan@kernel.org>
 <836bcbc3e35c267abd93a4d2174a3e570ca9e181.camel@ndufresne.ca>
 <aTjnH_i0q0xyLysD@hovoldconsulting.com>
 <78aeb9303f3d57a28b2edc3b6b2b2f45498ee3fd.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WxNnx0V4vXI1/jrz"
Content-Disposition: inline
In-Reply-To: <78aeb9303f3d57a28b2edc3b6b2b2f45498ee3fd.camel@ndufresne.ca>


--WxNnx0V4vXI1/jrz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2025 at 10:58:41AM -0500, Nicolas Dufresne wrote:
> Le mercredi 10 d=C3=A9cembre 2025 =C3=A0 12:21 +0900, Johan Hovold a =C3=
=A9crit=C2=A0:
> > On Tue, Dec 09, 2025 at 03:43:30PM -0500, Nicolas Dufresne wrote:
> > > Le mardi 28 octobre 2025 =C3=A0 11:04 +0100, Johan Hovold a =C3=A9cri=
t=C2=A0:

> > > > Add a comment to the vpu_get_plat_device() documentation to make it
> > > > clear that the VPU platform device is returned with an incremented
> > > > reference count (which needs to be dropped after use).

> > > > @@ -120,7 +120,7 @@ int vpu_ipi_send(struct platform_device *pdev,
> > > > =C2=A0 *		device for using VPU API.
> > > > =C2=A0 *
> > > > =C2=A0 * Return: Return NULL if it is failed.
> > > > - * otherwise it is VPU's platform device
> > > > + * otherwise it is VPU's platform device with incremented referenc=
e count
> > >=20
> > > I picked this patch but rewrote with what felt like better and dense.
> > >=20
> > > - * Return: Return NULL if it is failed.
> > > - * otherwise it is VPU's platform device
> > > + * Return: a reference to the VPU's platform device, or NULL on fail=
ure.
> > >=20
> > > hope its ok with you,
> >=20
> > Sure, my only concern is that just saying "reference" is too subtle,
> > that's why I explicitly mentioned the refcount.
>=20
> For me everyone should read "a reference" as a kref based reference count=
ed
> structure.  A quick grep across out documentation, this is the vast major=
ity of
> the wording. Though, I spent limited time looking.

It should be sufficient but given how many people miss this it may still
be worth being more explicit.

> > Btw, why is patch 2/2 marked obsolete? That leak is still there both on
> > probe errors (which I saw someone else posted a fix for) and on driver
> > unbind.
>=20
> I had two patches fixing the same thing, it just happen that I ended up p=
icking
> the other one first

Ah, I had missed that and the fix is not in linux-next yet either so
without a reply it wasn't obvious.

> and liked you documentation fix, except it was replicating
> obvious weird english such as "if it is failed", and documenting the error
> before the expected outcome (opposite of my preference, not sure there is=
 any
> rules or guidelines).

Yeah, I considered rewriting the whole comment too but given that the
surrounding comments used similar language I just amended what was
there.

But I'm totally fine with the update you did.

> https://lore.kernel.org/all/20251008090156.14224-1-haoxiang_li2024@163.co=
m/

Johan

--WxNnx0V4vXI1/jrz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCaTt8LgAKCRALxc3C7H1l
CI4zAQCm11arIiGlJXVGdACTl/5o23m/siC6R/rPSNyApJb1yAD/Xq07G/sc3JHg
wl+RZmvhiWbaR/6a85YoWu7Px2Qhfg8=
=4Gsc
-----END PGP SIGNATURE-----

--WxNnx0V4vXI1/jrz--

