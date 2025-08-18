Return-Path: <linux-media+bounces-40161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E561B2A985
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 16:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 851F7B618AF
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 14:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCA33375AE;
	Mon, 18 Aug 2025 14:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="nweMstTk"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9263533471F;
	Mon, 18 Aug 2025 14:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755526247; cv=none; b=nh8YR0NuG+j2WsE2bBCoYe+qG1jH1RxAig2GXk3lx8WxW8IZSPvK8VPyiGY/YCetp5/FuBzmaRcKxecZ4c7JIFoZF997zG4tCjK7SZBm/mwtXpkp3Lv1DsTho4W8fJui9kgy7sfvyjFTCuP+ZDlhVOmtY7OTnHOdjEC2SO/G+zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755526247; c=relaxed/simple;
	bh=j0lyo02IFV4zcgXPYgENMtO59Au22hO0nmUipu26tPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type:References; b=elExSWWS/R2HB5U8rlvPjkIkvwPR2ABgz5XH5yexSjf6egfZ0DloPYyh55+xTEu00CBO0qcwCp8W5LZNe6jhxqygAvcXV+QuMwMqDyS8cyfJAlVCc1N85TXJhujWAvwA7WYa1cMt+GTzOY9ohz8ffNXVOPqTLQMle+6m8S17yGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=nweMstTk; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250818141041euoutp01198781292bd5d26e9ea7136d3d3d73e8~c4dDIkjfs2135921359euoutp01S;
	Mon, 18 Aug 2025 14:10:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250818141041euoutp01198781292bd5d26e9ea7136d3d3d73e8~c4dDIkjfs2135921359euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755526241;
	bh=ts3A4MvB+pLF9b1fYr1OaRKHsIG9rXzjaSyR872fx0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nweMstTkqZUfTDcgSuzWRYVoV9JvbPK+l2fq2+I3gRx0SKOetrGBglidgci/XLRHG
	 yKiRGPTghNY65ZYuW+rQetbaj0UlX84N/HJy2tuH4Qs0xmThMbES7YZyWuK/y2EQwa
	 pANBPLppgOKGZUguwTqkajXJsHrX4XbKh4XzMW6k=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250818141040eucas1p12598f376bdd8cfcb984a8a799373111d~c4dCdErup2133021330eucas1p1j;
	Mon, 18 Aug 2025 14:10:40 +0000 (GMT)
Received: from localhost (unknown [106.120.51.111]) by eusmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250818141040eusmtip168497366a830534395c067398c2a3939~c4dCY3Ph_0814408144eusmtip1d;
	Mon, 18 Aug 2025 14:10:40 +0000 (GMT)
From: Lukasz Stelmach <l.stelmach@samsung.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,  linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,  linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH 11/65] media: Replace file->private_data access with
 custom functions
Date: Mon, 18 Aug 2025 16:10:40 +0200
In-Reply-To: <20250802-media-private-data-v1-11-eb140ddd6a9d@ideasonboard.com>
	(Jacopo Mondi's message of "Sat, 02 Aug 2025 11:22:33 +0200")
Message-ID: <oypijda53wra8v.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
	protocol="application/pgp-signature"
X-CMS-MailID: 20250818141040eucas1p12598f376bdd8cfcb984a8a799373111d
X-Msg-Generator: CA
X-RootMTR: 20250802092520eucas1p2d0edfe269d3c423e6157bd7a0ec0b43c
X-EPHeader: CA
X-CMS-RootMailID: 20250802092520eucas1p2d0edfe269d3c423e6157bd7a0ec0b43c
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
	<CGME20250802092520eucas1p2d0edfe269d3c423e6157bd7a0ec0b43c@eucas1p2.samsung.com>
	<20250802-media-private-data-v1-11-eb140ddd6a9d@ideasonboard.com>

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2025-08-02 sob 11:22>, when Jacopo Mondi wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Accessing file->private_data manually to retrieve the v4l2_fh pointer is
> error-prone, as the field is a void * and will happily cast implicitly
> to any pointer type.
>
> Replace all remaining locations that read the v4l2_fh pointer directly
> from file->private_data and cast it to driver-specific file handle
> structures with driver-specific functions that use file_to_v4l2_fh() and
> perform the same cast.
>
> No functional change is intended, this only paves the way to remove
> direct accesses to file->private_data and make V4L2 drivers safer.
> Other accesses to the field will be addressed separately.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---

[...]

> diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media=
/platform/samsung/s5p-g2d/g2d.c
> index ffed16a34493be2edbdaee13619467417487c1e7..44fcedbbc90a9863827aacbcd=
5f56d850cb552ea 100644
> --- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
> +++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
> @@ -25,7 +25,10 @@
>  #include "g2d.h"
>  #include "g2d-regs.h"
>=20=20
> -#define fh2ctx(__fh) container_of(__fh, struct g2d_ctx, fh)
> +static inline struct g2d_ctx *file2ctx(struct file *filp)
> +{
> +	return container_of(file_to_v4l2_fh(filp), struct g2d_ctx, fh);
> +}
>=20=20
>  static struct g2d_fmt formats[] =3D {
>  	{
> @@ -272,7 +275,7 @@ static int g2d_open(struct file *file)
>  static int g2d_release(struct file *file)
>  {
>  	struct g2d_dev *dev =3D video_drvdata(file);
> -	struct g2d_ctx *ctx =3D fh2ctx(file->private_data);
> +	struct g2d_ctx *ctx =3D file2ctx(file);
>=20=20
>  	mutex_lock(&dev->mutex);
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);


Acked-by: Lukasz Stelmach <l.stelmach@samsung.com>


[...]


=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmijNGAACgkQsK4enJil
gBDoIQgAm0zhFQfQO2pDJE9DC0t6P4lrJ//jtdrQJtVSYpcaXDYP9Oq1iygQ3s54
2wjf/n/+kXlE2cUM5pvbFc0c1qeuZipb+lexBpwBdogDE3njAsinDf4ohsWPGhJC
TMOuWPadHmM0CXjuSWpeF+MoKtOJYJjdyVizq8ZoFwgGHssYApRxGVuXx6DRlsZK
aqNXp4P9HNaVsxLl5JOCaeEaJLBkU++5rhIooxbmm/jPuM6WuOWil+jQKADaODeJ
UfkLjfRCLFc4WdsXOBZuwqUiyU4imB8qJOlrjosCChiqKqr7up+cyr3YZ7PJEXPv
jN4MErP/mPjxbYUi+bON3CbY2FlWfw==
=alRq
-----END PGP SIGNATURE-----
--=-=-=--

