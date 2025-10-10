Return-Path: <linux-media+bounces-44170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6022BCCA91
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 13:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67CDB3C25A1
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 11:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC38A2857DE;
	Fri, 10 Oct 2025 11:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ekbdCyXO"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BB226E6F4
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 11:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760094015; cv=none; b=sgVguVLOuXrb95eHWDj2nGqIVwhj12xvR4FiI8zXZTlr1fukv6hTehWB/7T3i5M5uL2i/iYE4DeDWw8+CNJHsvNBOrEWScAOKBGbDjY3huATCUpgi2YqwcKE0JeC/Q0Sue0gAGVnpkUwrEqenUUWoLqlorMRWheiSsK7hiO9vyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760094015; c=relaxed/simple;
	bh=dcPMJ7d3B3BLR+/RpRHQlWG5yTzuzmcCGqptVYwZ0P4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type:References; b=UK1LdxTFAk1AHrN4/TTcBC+VWE00spkRhi7vQSRVonTWtQbKC37twzaKTr+D8KAiNt+KyJQ+pymz25TgBzW9Oltz1UYJpYcXo31f5Sl8MbFZNpzhDhAw27/Kvjb2ERZUr5BWIPV7NqTuxs7LURvhxY8ytAwPy8bn6ccHDeRYLPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ekbdCyXO; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251010110007euoutp0198334a56c1e281aced139f1d9abc40ab~tHCy5C9b_1521215212euoutp01Q;
	Fri, 10 Oct 2025 11:00:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251010110007euoutp0198334a56c1e281aced139f1d9abc40ab~tHCy5C9b_1521215212euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760094007;
	bh=ir3x0swwBGd6XitlxOubmabNH2rY0f45K2OexaHZmP4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ekbdCyXOMZGugMSo0+tQQkBAc4fpEMjXKT1yNIc0F5+IB8agcCFy04xR3j4PlkbDR
	 s1KWGiNrQkm392seMJ+rvt46MMf2su6qOst3b7Q/eSQXO2Fo5cfr8dJvPCoRiQ+w9k
	 TJ5SqyCJY5iFJFdZ32P1G+IqCfuQR9lKYvHa0Sag=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251010110007eucas1p1e2052e63b1b36046298c3c2c4ad303b0~tHCyiyju42872228722eucas1p1Y;
	Fri, 10 Oct 2025 11:00:07 +0000 (GMT)
Received: from localhost (unknown [106.120.51.111]) by eusmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251010110007eusmtip14117cd889c992a54b4345025b25e4516~tHCyfZrY43244032440eusmtip1g;
	Fri, 10 Oct 2025 11:00:07 +0000 (GMT)
From: Lukasz Stelmach <l.stelmach@samsung.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Marek Szyprowski
	<m.szyprowski@samsung.com> 
Subject: Re: [PATCH 20/25] media: samsung: s5p-g2d: Drop unneeded
 v4l2_m2m_get_vq() NULL check
Date: Fri, 10 Oct 2025 13:00:01 +0200
In-Reply-To: <20251008175052.19925-21-laurent.pinchart@ideasonboard.com>
	(Laurent Pinchart's message of "Wed, 8 Oct 2025 20:50:47 +0300")
Message-ID: <oypijd4is7m37y.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
	protocol="application/pgp-signature"
X-CMS-MailID: 20251010110007eucas1p1e2052e63b1b36046298c3c2c4ad303b0
X-Msg-Generator: CA
X-RootMTR: 20251008175139eucas1p225b8b48b4152566f6a6eca0207961c1b
X-EPHeader: CA
X-CMS-RootMailID: 20251008175139eucas1p225b8b48b4152566f6a6eca0207961c1b
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
	<CGME20251008175139eucas1p225b8b48b4152566f6a6eca0207961c1b@eucas1p2.samsung.com>
	<20251008175052.19925-21-laurent.pinchart@ideasonboard.com>

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2025-10-08 =C5=9Bro 20:50>, when Laurent Pinchart wrote:
> The v4l2_m2m_get_vq() function never returns NULL. The check was
> probably intended to catch invalid format types, but that's not needed
> as the V4L2 core picks the appropriate VIDIOC_G_FMT ioctl handler based
> on the format type, so the type can't be incorrect. Drop the unneeded
> return value check and, as the return value is not used for other
> purposes and the function has no side effect, the function call as well.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/samsung/s5p-g2d/g2d.c | 4 ----
>  1 file changed, 4 deletions(-)
>

Reviewed-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>

> diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media=
/platform/samsung/s5p-g2d/g2d.c
> index ffed16a34493..7b0481c7f953 100644
> --- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
> +++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
> @@ -306,12 +306,8 @@ static int vidioc_enum_fmt(struct file *file, void *=
prv, struct v4l2_fmtdesc *f)
>  static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format=
 *f)
>  {
>  	struct g2d_ctx *ctx =3D prv;
> -	struct vb2_queue *vq;
>  	struct g2d_frame *frm;
>=20=20
> -	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> -	if (!vq)
> -		return -EINVAL;
>  	frm =3D get_frame(ctx, f->type);
>  	if (IS_ERR(frm))
>  		return PTR_ERR(frm);

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmjo5zEACgkQsK4enJil
gBCLEQf6AmaPcjoiunRnBc4iXTZhWRTMZQAaCNCSv1NeNza95+/aF18AwBnYq9q7
AzLWKhAVaj5w1W7bCQFkcEmoPRKR4hB/QwnnCQZJ322bqzRgqhb8bMMw5myRFsiY
3NQKCiZf4teMiE7FIG26t7JSDMX3UjGb/1Fn7gxy10LfSlS435Dixzq4w0G4SXI7
TFJ+XfkDB9RvFHrK9ih7OpSkdZRlgGVnOD4qWVa0KH9i9u1c0q0ZSzFMkKPbJlmy
kC8Z56LpjZpZzJk76yV/BdJ/qFBrPuWMGnDD14UWIAd/gKLTNv7MGtmUMkrOHzcr
3u507zuMqpgOm039YYzWu5ZbMC47Sw==
=rSgm
-----END PGP SIGNATURE-----
--=-=-=--

