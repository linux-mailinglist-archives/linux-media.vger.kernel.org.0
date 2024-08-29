Return-Path: <linux-media+bounces-17148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F159649EC
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 17:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 622EA1F2347D
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 15:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0216C1B29AB;
	Thu, 29 Aug 2024 15:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tey8LXv9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004CD1A76D3;
	Thu, 29 Aug 2024 15:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724945118; cv=none; b=R4+UU3rGHJlqmkGh1TXqvOz/7Ql7OshlpHmAYpvJUowJEJ7YBhXmpxN3j0ErkEav13b/YkTP8dWWz/LZpfyNm/xWNUn0yOZkN87wgZ1Z1e/UtOoFRbNzL3SSQsoh7w/qiwYgsBYluSR81EwOrYZykcnfMtGBhds/kTx+V55lxz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724945118; c=relaxed/simple;
	bh=W5GQhkVjz2wwdC5lXitoDCDre3m21qvN2+9J1ktg/iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CCeBhvOO4/roSTwe6K6usqLu+IsRn5Rz1nqdMswJ0fy8DX6juH3/VkTk1m3LRMcyRenHds0C9SpqeEM7ER37HrwHrtenFwOIGq+ZNaX7MmWFNtdMgnAUXp5TjOgpQt0vNzSirAsQ28coWfCEUgwiBMdI0urME5LW2EXTe3nvXPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tey8LXv9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-428141be2ddso7092325e9.2;
        Thu, 29 Aug 2024 08:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724945115; x=1725549915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3CePclmUlJ9R5wUKygyM22ovfabY44x27bhlzsShvYo=;
        b=Tey8LXv9NHiqcu/Y32HoVzNjsf6xaqLtc7NcTR4LQ5K84vDoFR81iYrrBA7G5Y5orU
         pJTNjE0lYSx0fAfPM+eYZDFM2efME79dqpzFqKYbJ78yTF9p9mB0NHzMqcrEb2bJ9+JO
         t7Yo+ErJavMUEe0KUjDi8+dfDOWwGfjKIXaKT1IRcB5LSVMkrALiUeTyVaAOf7YI+ozb
         4PuFZFVOpD4SeJtzKi4IGjge5scaWP62M2VFjoo61ZCKam2gZJErtLHfBx8NI2MPFeVD
         3Y0VPVOpz1+RvcUrkW0ykk+Cuqp1OvAKfIYCIPFxHNklqOZtDuJE8xpKaQC90sDHto5r
         wiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724945115; x=1725549915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CePclmUlJ9R5wUKygyM22ovfabY44x27bhlzsShvYo=;
        b=aQFx0EBYh6N4EVwZk+bgVtzJv6SeI+82YWE73MzjImC/UnChABtc7+eVI5LVn2ZLAt
         b8eE5Pwbnc+V6IPUJJBEQxtANson44kT/UPv7rkEmjAzFyWie4ej8cQEPvABLcUdP3JF
         kzXcMdh/aPpXgG4HoiJR6nrYOvcXZ7owmqLGFX8w1wndbvn1MfmhffE+YkNez3fa4aTR
         ngSzPibD2N4rI3yKMvsgG3CTBom7gPzeKk76IanyQGc4dQekLxAoT5l1/ZeGkEq9AbY+
         Ey+BXgTmoH1l0v+SdhmXRelrZCruaYXihblvlJaQiz/7GVG0LSDK5sRt3olJfSZyT9GF
         vA9A==
X-Forwarded-Encrypted: i=1; AJvYcCUlCLEXFe3JUyRzen1ZUj4c+H3fFD6omSRM/hy/LoadHLrfVa2lesysfhvPpr7cnj8ScTHwaf0JjE+Iw2n1@vger.kernel.org, AJvYcCVSw59G5jQNi8YQkdPtbdI7g2OxnmLX6Rmmd5wdUKJD+j30am046r1ukVh8UnCAc6jZ2ORq+b3KVtyBXTk=@vger.kernel.org, AJvYcCXVu/631ww0GmA6GJpHJmzy80jBUONYcN0UQdtpo/Lfyk04bCeYi5FnKBADRLjm8DTIt0zolk0AHU+9S0k=@vger.kernel.org, AJvYcCXzWFQj8z7uH30wVb9Jb+PYh3MNZVun/KwyBOF74rHAftNp8EO0sdfAoQ+PeocCv7ARcdSHe7v7KmifbhCo@vger.kernel.org
X-Gm-Message-State: AOJu0YwXhkbpF2U0LC5u39auOyiTZ0Ebg3UHuazrvTlwrRyQKOJX+S8g
	gL4qmU9acOEF/DTbo/t1jgcR1a92QM3FlcJKYV08XNJiTRAIZbTx
X-Google-Smtp-Source: AGHT+IHB9DwVQH+LaPCki7l5s2XbNvXlqbr5f4VqUYxz7BdDtbuqto3Zl5PtmeS+7pmQVpMQVL7Cmg==
X-Received: by 2002:a05:600c:474c:b0:426:6e95:78d6 with SMTP id 5b1f17b1804b1-42bb01aa1fdmr26574845e9.4.1724945114644;
        Thu, 29 Aug 2024 08:25:14 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb37f7849sm25800085e9.7.2024.08.29.08.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 08:25:13 -0700 (PDT)
Date: Thu, 29 Aug 2024 17:25:12 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Kevin Tian <kevin.tian@intel.com>, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 1/2] media: nvidia: tegra: Use iommu_paging_domain_alloc()
Message-ID: <2o6gpxknio4kvf5fmqgai5jaov65semmw3wvtmt4gdauwzhbti@ii3ydtlmp2sb>
References: <20240812072105.9578-1-baolu.lu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cowfqq5j65e3ovof"
Content-Disposition: inline
In-Reply-To: <20240812072105.9578-1-baolu.lu@linux.intel.com>


--cowfqq5j65e3ovof
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 03:21:04PM GMT, Lu Baolu wrote:
> An iommu domain is allocated in tegra_vde_iommu_init() and is attached to
> vde->dev. Use iommu_paging_domain_alloc() to make it explicit.
>=20
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Link: https://lore.kernel.org/r/20240610085555.88197-9-baolu.lu@linux.int=
el.com
> ---
>  drivers/media/platform/nvidia/tegra-vde/iommu.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--cowfqq5j65e3ovof
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbQktQACgkQ3SOs138+
s6EUfRAAme7fMme4dA56e6MubG7cFGGWr8iHzpMLzb7Gxi4bRxcYB/Gtn/cepURr
Ybbn9lG86we9+zbd+FNlPWTKXxFFZG3kDfKnU4eILM2y56SQApilQzwwicdOgN5a
7aqDJu0/eEIwagudME6HYDlALal0MCib/UblMbReIP7XnAcrR+HhO1aRMy95l6P+
xYD6VzW7evnIR1BRkz5CHS9Dgo7o3ykNsGr0wDkYjK6oFjF5g9Y6LZCZIRO3sZxe
jqijysA0g9cAk+NsDNmWKbd0UEMM3DX1ROebrEzbBkXC9+PWe56LmP77zigyPHVr
aVXBy9edGGmkJfKvwvkJJLAs3wpjN2cHVO8zPjg2bntFR5VhAPgMo7RJKt4Tj/A9
rEcmcaPggDUVVgJEbogj1zZtpeTp89+56tGcFjJvMi1sVbudisnejl4aSfx/Hnzc
4QKrj/ajGfmJkPJbjjUEIzTSV+Z7L3M06jC9eLrgKzURdymvDUAPuVaZWkPcT/DK
hqiTAVU43r+yr40ZwRoxyuHIQLxGIxmUtnjk96uQhKa7bs3loD4KR00EIX590fGL
cRL3yZFx2G7ILQ1Cnru0vXA3iF9RxG1eikHZHtqTPsInPseAMx6QpE0Vn0I/gT0G
S/cBJhFE3NxmP45u2DKKrhq7+pRf6AEpKh1tnwZoB6NIx5cwGG0=
=3ZMs
-----END PGP SIGNATURE-----

--cowfqq5j65e3ovof--

