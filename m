Return-Path: <linux-media+bounces-17999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E257F971B9C
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 15:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D8281C233AF
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 13:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534761B6549;
	Mon,  9 Sep 2024 13:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYqURXPL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323CC1B3F23;
	Mon,  9 Sep 2024 13:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725889833; cv=none; b=G1ocftZJrXy/PMUHwJhr2OenwNw44/fXDKJbKBn27aSJW9/xOlqjPxGIMrZvAI6yMu9oyWjvI+BtbuhTj+3EVK6dLTraYYd1+XM3+ubwz7BuFN1xCPjH4L6InGJrgVFM4IgFmjQ1f78WM/+HwvTjGieV1+oel5d2I+N0udc8CAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725889833; c=relaxed/simple;
	bh=itxo6/62dv5QH54RJ3ls+SJy/YuQMZMxrdupV5XIk/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGyeQN6Ufk9+72IeryCbaOCQtHlyw3MNnX8U02sbrcyh5D3DWeZ49/itlcBN62ZPkVsaM3/F5Rj6WjTTOEIcE54tl56hes37KmkTmhsjsjK5Ei/QtRuPW2vnrNSA/x4qxTtppN/bzctXUn0TgRNWYLlSAKmDXOCbROTVNNi1aDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYqURXPL; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cae6bb895so20049285e9.1;
        Mon, 09 Sep 2024 06:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725889830; x=1726494630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uTmI7FKnXchw996SUeECY59GrYXxeJtGeoLPHxq544M=;
        b=KYqURXPLDYrQRNnmPX3TGNlZmuC3OKG2keN+WETWGWTddXEbsG2RQUStbAx3sDMCl4
         72V66QTXR3GFMUt2SeSWEWV6MiKdgb+A4GgWLb4x+EMYDuu2098y5Rrq9jED3SDSmhDX
         QiQCA6ZCjaOIYgZOiKJU8sy3Hd/MMOt2KekcTlPawcULOK/rYL3f+RzF2gbX/sx9lq3N
         aP+lCma20q+SZRzzwD7EHVpZ1l9MPzngxU8isKPiQ5hXrclV8RpsMV+qFvs6UIjd78J1
         CheYn2ZpUhjKguSHpybPRJS2K3oQYi7XrWhnoq8UlgH2PyOsVeGI1E5ByQI+Zvrp/saE
         DPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889830; x=1726494630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTmI7FKnXchw996SUeECY59GrYXxeJtGeoLPHxq544M=;
        b=Vcfn4NtiBaPwqj/LUIunjayao98WdR2WIRdnD6ofp4UO8ey9QP8gOny64o+kieH0cm
         eYcYMwYo9+uYQOUQvKqwz4D1o1xG0/sWMyPfuFLJlzGZ3noFnug7InNDrF6PxgWgqbqP
         9nGhdTxnt/Q9EM0qAod9twhM5fwbvt8RGXH4cMUCUyrP5smgGku7arxQEoRcZsZtY8tt
         W0C0P0mSxWV5vH2bfOqZv+IoOwb4A9bBJtym93DMTMMMP0QGUcWeQO8L6T20NI8YLMek
         GvBt8u2HiyIUgVuNs1cB2myqUdR14ODChhhX5LtlMOcN5QD8ic63mW6qsWPAUZWKe+Tp
         0DKg==
X-Forwarded-Encrypted: i=1; AJvYcCUgBD7+KYaxNBkYH07s/dsBnbFAk4RVY7Xlr2lyb0aCTG5icm77CA5St33b9WY7190xJENOjEoFawWQwoI=@vger.kernel.org, AJvYcCUihogjjQjTJSiaKIMC9aqi2dGOUBfPT+A2SWPVlvwka88ovBDHfVS9oXGYtckmoDhk0Tlz5A94nHxLwIg=@vger.kernel.org, AJvYcCV0VO0ouwavM7agx3fouuTCiZpaaJk8KOHXSxwAinaQyrrlG89EkR0kNRgTdAnotzAzQHJVeRTYdBEh2DQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaH8jU5B9PZvJDjj16HXZO/DVHJU01nlAj+BK+ifDFms38DhVr
	guuzqkm5A0+5heXCwO9aPJFq9fW2TuG+G4gpOF71iyYybuz86Kmz
X-Google-Smtp-Source: AGHT+IFWznISjjxuV7eQKDlaN9b6a4OoZXrdhN32jKOPKPIhtjTxNr0Q41kQYaOLItLh2+izQfDzHw==
X-Received: by 2002:a05:600c:19ce:b0:42c:aeff:9766 with SMTP id 5b1f17b1804b1-42caeff99aamr49332695e9.20.1725889829441;
        Mon, 09 Sep 2024 06:50:29 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb81ac0sm78365275e9.34.2024.09.09.06.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:50:28 -0700 (PDT)
Date: Mon, 9 Sep 2024 15:50:26 +0200
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
Subject: Re: [PATCH v2 3/3] drm/tegra: Use iommu_paging_domain_alloc()
Message-ID: <7unmvrhiydje2fqcrmj6flbvdbpexujibatpgoqcqevmuhkcgs@pa62yzobzajj>
References: <20240902014700.66095-1-baolu.lu@linux.intel.com>
 <20240902014700.66095-4-baolu.lu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sekau6utgzc3r2ki"
Content-Disposition: inline
In-Reply-To: <20240902014700.66095-4-baolu.lu@linux.intel.com>


--sekau6utgzc3r2ki
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2024 at 09:47:00AM GMT, Lu Baolu wrote:
> Commit <17de3f5fdd35> ("iommu: Retire bus ops") removes iommu ops from
> the bus structure. The iommu subsystem no longer relies on bus for
> operations. So iommu_domain_alloc() interface is no longer relevant.
>=20
> Replace iommu_domain_alloc() with iommu_paging_domain_alloc() which takes
> the physical device from which the host1x_device virtual device was
> instantiated. This physical device is a common parent to all physical
> devices that are part of the virtual device.
>=20
> Suggested-by: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--sekau6utgzc3r2ki
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbe/SIACgkQ3SOs138+
s6GivQ/+JSKDqhg5e7WkMv/tttd5OTC46SSL0+cobiyQfyKnv+49GXf27ORgQw1S
aVk1ecp/nPSd0KksxiAd/ZDwulfWcOZSEVKSNhhm8Ju3WrCAZcDoI7wjiOjhNK4U
o1kbLg2ly3JhXkEhPuyvfW+1pk6rNt/xcqY5NrpW8Fh6/G1K5AJiC6oCEAsS65Ak
QejXU8T/A6s4jfBOd3O23td1serVya4AAc+wJzKgGcmVsG6ELwWbJSD0rGX+Ai5a
vO2IGIt5qzeibQIP/ZSOLX0lacV028ZEc0zCK/0tgoLkk/TiMfraIO6Ay3Ok5wdo
WiLZ/VYBfsxlQO/IqlgI/WbmhwcTReCK+T46GoyFAW6fvS2TP4YQ0JGJsubrxUby
zk8Bt9oUwJcAq9LotbPSaXgHgrkbUq1Zg4AX53UoZi6n2ClKsMusqx60Z7kbKBTU
MefEmbsZaQCoY6PdDZPYHehE08YC3d0RlojHdxwrzJM2UHfn9fCtdD5HQJGnpGxi
tgNrxCPCUNa7EzE0lqRIkDM3QoBaoxAQVf6Q2uI3BG3HPBowuwXXcTayfrKPJEoP
IVZHM9lH1aEo6B2iT1zE4oXbNS8PFeJPLkzS4XEZk+Ct0ytaBLLoGykSvvk8xE5h
oSnbslewV6UY1RVPQyOSGA/kxxwOhbB9hd65dQ87qSyKaXwc1u4=
=K/dz
-----END PGP SIGNATURE-----

--sekau6utgzc3r2ki--

