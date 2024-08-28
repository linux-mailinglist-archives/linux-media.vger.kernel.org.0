Return-Path: <linux-media+bounces-17049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF39C962C53
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 17:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D35601C2410E
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 15:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818271A7052;
	Wed, 28 Aug 2024 15:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dw4l49IQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502CB1A4F2B;
	Wed, 28 Aug 2024 15:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724858850; cv=none; b=FJX7VXlxkA4KhLnC4qowMcsdifR+0eehz3RiAs+RQmecUm6K20RHJFj5GmxwQyvRWV2mom42W9wmSlX2iVoMWhMNi2xTL4CIzmZjwySrtF4Po+wKyOiBOD/4osFuhyZDdXYHZu/fC0puPOTUUEfrSQWPHIl7by8jvdXwbxyxs6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724858850; c=relaxed/simple;
	bh=BtVyzWMVALC/1EFZ2S7XKeV0QsA+D5/40hYHNVrXqJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onjQtlCcrqo9FhWI6lrdAwLKLUMi3qBjqFZiUcLzrN3U7Tq6o08hnr1lRjlmYdS4+CI+9d7YTvptuD7NMtrT55qbyKovBs87nKOjUVQIFQ94MXQxEn5ZIfqDyaQ+DV1qjkHOHpdWcDvxi+GxqFkX1IrFFpgN6+Pz0Bzwl0AVOxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dw4l49IQ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3718ca50fd7so4357905f8f.1;
        Wed, 28 Aug 2024 08:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724858848; x=1725463648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7d72c/mj/2Z6FiVdpOBNTFT01VdBmf1RNvsZEcgNCnA=;
        b=Dw4l49IQ8w0CAecrgE1av6DbIwWQOWlUSSijhDQpMtUTueGTMekruHM9SXR9QKHFxS
         i2jXNjQrxSRdY8OfkcIeQ7HeYR4D/c9zPd441YQcYXCg3MdxAF4eQUhhZvEgjMxiJjfj
         lOfyeA8XMI2K/bg1gf0CHcdDqtro8x9BjJ+9tfEUkQaywA/UoVr6tJ3OxcJkmRn4ZHEt
         gc06pgApp1DWO5jk4/mdzgRzkffhg1Gy0XhGuXJB1zAdOkRAHVSjr26A5MGkn44kLXUO
         lSO1TvwfKrZPX+ZsbPZD7f0XumbZYv4N/EacuVwQEG4+PGxLv69uHlwqeox9tWFumqTC
         DDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724858848; x=1725463648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7d72c/mj/2Z6FiVdpOBNTFT01VdBmf1RNvsZEcgNCnA=;
        b=N5fwZ+8Uqu2JqAE0dCNDXeSJrsEtER9qj4wIKB39E+IFzT0k42jKVOGMMGhXTDQe0g
         s0eVMP1yPW1fuu3XLyumAPscuYzGpjYvlE1I8Vmqs9RxwVrvhLTC5NnW7LLU78pm6srA
         ZUL0fm9n8MNdJIJAy1TXjfuyxtGyrKcWbmVAy+laVf0nVrAgAtQhx3UBmfr1YbWxHJzW
         WNbHW+SjxxPXqZp30FuryEEd0Dyc+L/2XtHkv42+z+CQkHwIrwDfll6XyXnRgYx7ts2g
         N3TruUI+Lw8r8MStxNqVe4QTdqkHOJBYDVpIUsCtPZBKA8WnCMT3HFgZFqeQC81JIOO/
         4EPA==
X-Forwarded-Encrypted: i=1; AJvYcCUT8uURs/vjkiY6uzAJ26i7szF0yxveldazfUDnP8cFqqj5zWijAc0EdrS04qIWV7N2wMMEQUKkS46iSUg=@vger.kernel.org, AJvYcCUVO7zj2rWCuPqI4BJgStyctRsCDzANO1WICfMcIXTwAVbNM6FAm9tSieUtmOh6c62R6b6klCDESOjKR4c=@vger.kernel.org, AJvYcCWnbNfHv5TQX2WWUWd/J9WdOtGml/RslWkQbXJxzF271rRusEeeWAioaCOeNmSnNQj4In0ojZxTczJusPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFc+ypEg6PAs/UGVO/t8WZkNKZ3so2s5d5WpiWY7ExIV2YlYSn
	euJLHKpZOoBW20f+ghUmen78WrWR2yDjqgTdvcmmmhEpM9UUo506
X-Google-Smtp-Source: AGHT+IFy+N6MNpikAMD3IJYGiP5Mfu8DbpT3WuOqB9zdjdgMg/vD1umE1XlYBlEzFehtYhZBgfMtDQ==
X-Received: by 2002:adf:a3dd:0:b0:371:7e73:de6e with SMTP id ffacd0b85a97d-3749685b56fmr1596718f8f.52.1724858847009;
        Wed, 28 Aug 2024 08:27:27 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749b238cf7sm81389f8f.33.2024.08.28.08.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 08:27:26 -0700 (PDT)
Date: Wed, 28 Aug 2024 17:27:24 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sandy Huang <hjc@rock-chips.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Kevin Tian <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/tegra: Remove call to iommu_domain_alloc()
Message-ID: <qyvyd2ftebjlgmzyayfvxsqa64c4wgx7keix3a6eexdspbvawy@a5ffnm5h5tgp>
References: <20240812071034.9443-1-baolu.lu@linux.intel.com>
 <20240812071034.9443-3-baolu.lu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fslg44mz7bzr7agv"
Content-Disposition: inline
In-Reply-To: <20240812071034.9443-3-baolu.lu@linux.intel.com>


--fslg44mz7bzr7agv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 03:10:34PM GMT, Lu Baolu wrote:
> Commit <17de3f5fdd35> ("iommu: Retire bus ops") removes iommu ops from
> the bus structure. The iommu subsystem no longer relies on bus for
> operations. So iommu_domain_alloc() interface is no longer relevant.
>=20
> Normally, iommu_paging_domain_alloc() could be a replacement for
> iommu_domain_alloc() if the caller has the right device for IOMMU API
> use. Unfortunately, this is not the case for this driver.
>=20
> Iterate the devices on the platform bus and find a suitable device
> whose device DMA is translated by an IOMMU. Then use this device to
> allocate an iommu domain. The iommu subsystem prevents domains
> allocated by one iommu driver from being attached to devices managed
> by any different iommu driver.
>=20
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> Link: https://lore.kernel.org/r/20240610085555.88197-20-baolu.lu@linux.in=
tel.com
> ---
>  drivers/gpu/drm/tegra/drm.c | 34 +++++++++++++++++++++++++---------
>  1 file changed, 25 insertions(+), 9 deletions(-)

Actually I think we can just do something like this:

--- >8 ---
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index d9f0728c3afd..d35e411d536b 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1150,7 +1150,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
 	}
=20
 	if (host1x_drm_wants_iommu(dev) && iommu_present(&platform_bus_type)) {
-		tegra->domain =3D iommu_domain_alloc(&platform_bus_type);
+		tegra->domain =3D iommu_paging_domain_alloc(dev->dev.parent);
 		if (!tegra->domain) {
 			err =3D -ENOMEM;
 			goto free;
--- >8 ---

That refers to the physical device that the host1x_device virtual device
was instantiated from and is a common parent to all physical devices
that are part of the virtual device.

Thierry

--fslg44mz7bzr7agv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbPQdkACgkQ3SOs138+
s6Faag/+PLNW+D2IJ1ANTAMAHn0fybn2aGa6fRFPkVgUQSXQP4OlfAdV1W2+DKPi
CSLmOHisUapqMwyMZECKEkXHkM7+i7Snhz+D6gHCMx7YWFQiLGi0j9KZfT3kfX5V
tOIVJXrEAcJZN9htxoPZ842Z5QrrzTNgVkvhmC2lhqA6sjy3BbyK8TgncUVpceMC
wPCVwjnNyJZUxK/MZgyj5OywXC9emVXY5Y0WgjJ14D1KNPScAsSCLKbIvAS5Pku8
8K0m4Dzv4+WtNRhr42OVrtji9VJwnrjVgJZXuGgJC7aQVDFbghM9rQ2NnaHAztOK
EL+9DKRDLXo+MwQmvqSWTkY1OEd0Y2cJsagqS9363Q5Xau7Iwrxa2vAXgXUwkWyP
/Z4cZYzatMr+CF+165NbtQYlJlRqBpW8kDslxGR1DT1NhNLbpE6y0FKaBp9YWXhA
U8AkaTSeeuO96M7c9jr2sLyHIxIYzMPvsC5vvw44NQRty78DyLp9wE90r0Z954C+
6DJMnKQIsoa+rCnof94BhK9ThweuwyWWMc/7755EWJoUo2g8VVyDei6m2GBMj5zT
kkkzVeWz8F1cV3zDn8aa0hYje3tzVdvChHSMXHU44wRHSD6xaoI9KgxehV6TYlCI
G3/NyFMo6sIP/I5hnEpQmI3pF5641WaJSYeocgjLIRESADr7+Dk=
=Ka+K
-----END PGP SIGNATURE-----

--fslg44mz7bzr7agv--

