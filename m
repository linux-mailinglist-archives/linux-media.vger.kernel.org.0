Return-Path: <linux-media+bounces-40162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 962F0B2AA52
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 16:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A246D1BC02E9
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 14:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D8C3570A2;
	Mon, 18 Aug 2025 14:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="FaiBwfuL"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E14633EAF4;
	Mon, 18 Aug 2025 14:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755526384; cv=none; b=Hosa68FS+yfEgNdEPB+JBgw7QoL7tqPDOxf5aJZPjkjn6ugXhwydcOUkgyoQEbydsza0IFT2Ry1Gg3MCgMnCcpEq8hREcMQ0BfxwXSi+1duUpZww+g5oe/+or7RbRKDA8IkD2fFbHD11xgJW8ReZBr8bt/toBXX0F2nup0KSqmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755526384; c=relaxed/simple;
	bh=T/CmkHuOLGFh1ps9RO37OptTPCwtI7brhG4vBsioHFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type:References; b=Li7aJj85xFQHvnWG1R1JwEjORkEfRET2LRfFoa8pu4Qu5vKe26GmIWvykJCAzpF0ryL9/7LRHTKpk+t000KehpyR9DAk26fg5wQ/82UZRiRK+czoH2GOZrNzQ8QAKZuJXT4HMOpAHLnlNae2R7mkEy4tk0yvW8zBrw2b3Cqjiak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=FaiBwfuL; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250818141259euoutp01c5a5c72a970c88cb8463fa9bb50e5008~c4fDm0j1Y2172321723euoutp01y;
	Mon, 18 Aug 2025 14:12:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250818141259euoutp01c5a5c72a970c88cb8463fa9bb50e5008~c4fDm0j1Y2172321723euoutp01y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755526379;
	bh=f6M/CURYsQXY3/uzXGcUkzo+e+ViGdgH1Lhlm1R/1iI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FaiBwfuLMFd8wcxb0jvuhKpukO35xdhs1to++ZaQ4Yqh+Gs6k/xhff2Sy966nKB1u
	 Y4My6ONmPeJTOTI7B6gYhSXTwZkt1FTO9BnQ28BliriKoYXUtLcxp9F6Knuc9EUcs8
	 MtUVtnwteswlZeCnCsdleiFKIXspagyS25wUueR4=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250818141258eucas1p21f750bd71f615e61da60af4f01b2bcdb~c4fDEmByv0907809078eucas1p2Q;
	Mon, 18 Aug 2025 14:12:58 +0000 (GMT)
Received: from localhost (unknown [106.120.51.111]) by eusmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250818141258eusmtip1a60c9e78cf67f43b879dc2891aeb8d16~c4fDAo2330814408144eusmtip1y;
	Mon, 18 Aug 2025 14:12:58 +0000 (GMT)
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
Subject: Re: [PATCH 27/65] media: Reset file->private_data to NULL in
 v4l2_fh_del()
Date: Mon, 18 Aug 2025 16:12:58 +0200
In-Reply-To: <20250802-media-private-data-v1-27-eb140ddd6a9d@ideasonboard.com>
	(Jacopo Mondi's message of "Sat, 02 Aug 2025 11:22:49 +0200")
Message-ID: <oypijd5xekra51.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
	protocol="application/pgp-signature"
X-CMS-MailID: 20250818141258eucas1p21f750bd71f615e61da60af4f01b2bcdb
X-Msg-Generator: CA
X-RootMTR: 20250802092807eucas1p14e332744b667a8b03ef32135045d26c5
X-EPHeader: CA
X-CMS-RootMailID: 20250802092807eucas1p14e332744b667a8b03ef32135045d26c5
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
	<CGME20250802092807eucas1p14e332744b667a8b03ef32135045d26c5@eucas1p1.samsung.com>
	<20250802-media-private-data-v1-27-eb140ddd6a9d@ideasonboard.com>

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2025-08-02 sob 11:22>, when Jacopo Mondi wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Multiple drivers that use v4l2_fh and call v4l2_fh_del() manually reset
> the file->private_data pointer to NULL in their video device .release()
> file operation handler. Move the code to the v4l2_fh_del() function to
> avoid direct access to file->private_data in drivers. This requires
> adding a file pointer argument to the function.

[...]

> diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media=
/platform/samsung/s5p-g2d/g2d.c
> index e34cae9c9cf65d3161822b68233d28472171f917..922262f61e7b53baf1b5840d3=
5149bf5b4b2e7ad 100644
> --- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
> +++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
> @@ -280,7 +280,7 @@ static int g2d_release(struct file *file)
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>  	mutex_unlock(&dev->mutex);
>  	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> -	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_del(&ctx->fh, file);
>  	v4l2_fh_exit(&ctx->fh);
>  	kfree(ctx);
>  	v4l2_info(&dev->v4l2_dev, "instance closed\n");
> diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/driver=
s/media/platform/samsung/s5p-jpeg/jpeg-core.c
> index c4ad0196ed8f1bf579365a0a21dd8c4a78bdaa10..2a57efd181540183e7d2b66d5=
1f9f2f274ddd100 100644
> --- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> +++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> @@ -1005,7 +1005,7 @@ static int s5p_jpeg_open(struct file *file)
>  	return 0;
>=20=20
>  error:
> -	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_del(&ctx->fh, file);
>  	v4l2_fh_exit(&ctx->fh);
>  	mutex_unlock(&jpeg->lock);
>  free:
> @@ -1021,7 +1021,7 @@ static int s5p_jpeg_release(struct file *file)
>  	mutex_lock(&jpeg->lock);
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>  	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> -	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_del(&ctx->fh, file);
>  	v4l2_fh_exit(&ctx->fh);
>  	kfree(ctx);
>  	mutex_unlock(&jpeg->lock);

Acked-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>



[...]


=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmijNOoACgkQsK4enJil
gBAXpggAhxgfNJt5JHfaNRWL4tntTEflz9jY6aL37c5XVvyFfbAOD9ZUAipWxJ3g
fm3satj2+sGjeHZtH4lAnwpLpNY8egrTC1c9muXvIy/ExVz7jwo1JW/IKM9a0tZl
D9N1GuZeTlQeLoFPsXl4LQhDbj48llm8roSKgfK4mU8ymTEw6BYOQ7bMZcxWKd9+
amU+zqtKIXE3OHNKDB3Hoo9pLBhOIBPXcqEV8rwNbC0dyidV8GvVUUv4ptQBlAyV
SNaaVoSHo+4P9caRnQOeX3kj7NXJa3ES03Cgpj8IhhZigvTtXJ+VL0fL283OuvOe
p2JcG+pKY00NgIMbtv0xGbMhZGox9A==
=VvC9
-----END PGP SIGNATURE-----
--=-=-=--

