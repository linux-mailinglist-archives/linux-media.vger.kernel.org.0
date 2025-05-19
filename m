Return-Path: <linux-media+bounces-32723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD08ABB2D3
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 03:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 970C53B3B57
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 01:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD92119EEBF;
	Mon, 19 May 2025 01:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBAXuuhi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D1814AD20;
	Mon, 19 May 2025 01:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747617868; cv=none; b=dBx7b/HErCUhVi4c97i7dXse3bJCB2S7Pw5s9r7FX3eQItwk5CPL7IMcY2+va4ihg//GjnWFEax+lHUAsj1yYiXzb9fuUC8Sej0J1dfoXkIYeufAL2ANadHjZBnX2cy82TFCR093ZIYE8jC5D8JS8tHkeDyRRhyb91ThVERAUPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747617868; c=relaxed/simple;
	bh=0Mn907apcqk4ftoWhNEr8s8u2ajYUpJbiKUPrJnj5VU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhmsyGD9Am/glGb+Fi0NrS6c3nLkP5S0jIqH/SD9JCP6abssSIABUSqx9gd0cRm5rNjpyvido/S7lZxTDCN91c90f60rO9TCZGM+ZPIDkezYEAqp2CmWhFyEykbb/1inrXOTJiO/rp7o6BduBMdofXIWeBtz7ZmzcaUDHs9ww5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBAXuuhi; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74019695377so2955626b3a.3;
        Sun, 18 May 2025 18:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747617866; x=1748222666; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qb7uwEjaTjw03L+H0ygK9UsMO/p5h9HkBJdLou1UQ6A=;
        b=FBAXuuhiUYb1avVdPZoNjYKMpQ+65HuNebcOa8dsU1NrOekS4Nt/tHszPEyGQPCQ0p
         6glnJDh7ahCU4CoqyBkMfJcJDgivy3VFZzubEhReTGsOTH3lwuw+I13XYHX7naPGV3NJ
         NxAmgsGLo6yRSSWFb/WYjdst/ca4bt8VVEwBeL4eQUvA+oPhh/KZJO0qxrtzvxMnEPbJ
         81r35W79PfTuV2jvFx+qZhhUxKD4QpbkRsHS7MY8c2vq8/tm6uX5jniJQ2+WyofSJA78
         GSOeWYkTHYAChZwf434NHIIKBliy9bi+Id2vwrUQ9Lk6qvzizNkjOsqgWbglHJqVxtkC
         F8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747617866; x=1748222666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qb7uwEjaTjw03L+H0ygK9UsMO/p5h9HkBJdLou1UQ6A=;
        b=EjGnUaHXIkWfqjsHTUFW+PNdm0B/aAwQtgAO3gpGJIwTERiVUfccLTl81MX3j/OwgQ
         b/GCIhAV/CXeIH6RfM3PlhnMBGD+8UzrmfjVOJb/Xe0MxnPQtQ9/VH28i+TLa3bqyJnx
         rjUe9KwqgTfLHflyV1AHeNPOwz7PAphLQvrXjxX8im76MCWHgHwapT0Z9NT0vjAZ1W0T
         JfCZVzBlfw13W/M5l9HZW7ZnRb4Q8Zy3wyPMerL5qq99rCNdAIlEihDjrXsaVGDfAQCR
         K+si56m1dki0j93O3l/5r8MmxQSzzo9bx41rDN/vs2XqaZXspIma+13r1iMf6aJLte+3
         TwHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV104RzUCb3g6MAw9XUfJUfdNFHt8n6yAUFP/M5oYYO+ox5S9Si6nXolZx+mhI5lsrLY2IV4WVFZjCfbvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbSqUc7gPy3cNdwrdkS44SJHh6BbW5mSzNruWVhw65UwSnE+Zt
	fPMOZE6tkbi+vM/QRSemKpDRHgpLXspebdBFbOJcBMT4ZfGQD1x8oIRL
X-Gm-Gg: ASbGncvMyOHVcnEl+sFE/pRpr23Wj8aQrkEIqSmWZqNiv3LV/itB8VI9NT5wE5xTuz5
	c76zVEbktgozO5tUPXo4xQfpuRhsWMizQMy5hhC3I7WtUNbYiyNhHtN7f9FWBS/rGeoIaxAkHVw
	ZhUExXaKu1vk6RhWdNmFp26L1NGVGgILRI6AQJ+fUmuI7bEnJwYikKNofmee++jAN0U5THl69MO
	GulZ+vcw5qOgdvvpuM5/DD9op9udYkHiLnPFt/30cfeC4q4aMkd9vwm4GwhmiykhSbC4PpojSQQ
	e12BLoIKDVCtwuZnOVQZfKwFmANK3hBZWHuTeDoiob07XVagvi8=
X-Google-Smtp-Source: AGHT+IESt+JW3EmmZPX7JFCGdF4Y2iqQAYLZIpyJtPr2h5uP+J/IaSvOxp0AYEtOnIaJ31Fi/Xc4qA==
X-Received: by 2002:a05:6a21:3384:b0:1f5:769a:a4bf with SMTP id adf61e73a8af0-21621a23f5fmr18441528637.36.1747617865723;
        Sun, 18 May 2025 18:24:25 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a314esm5060446b3a.165.2025.05.18.18.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 18:24:24 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 756274208F51; Mon, 19 May 2025 08:24:21 +0700 (WIB)
Date: Mon, 19 May 2025 08:24:21 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Hanne-Lotta =?utf-8?B?TcOkZW5ww6TDpA==?= <hannelotta@gmail.com>,
	mchehab@kernel.org, ribalda@chromium.org, hverkuil@xs4all.nl,
	hljunggr@cisco.com, dave.jiang@intel.com, jgg@ziepe.ca,
	saeedm@nvidia.com, Jonathan.Cameron@huawei.com, corbet@lwn.net,
	ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
	W_Armin@gmx.de, mpearson-lenovo@squebb.ca
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 4/4] docs: Fix typos, improve grammar in Userspace API
Message-ID: <aCqIRTkUW6y7UiZH@archie.me>
References: <20250517132711.117618-1-hannelotta@gmail.com>
 <20250517132711.117618-4-hannelotta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C27Db6pMBwsXho4s"
Content-Disposition: inline
In-Reply-To: <20250517132711.117618-4-hannelotta@gmail.com>


--C27Db6pMBwsXho4s
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2025 at 04:27:11PM +0300, Hanne-Lotta M=C3=A4enp=C3=A4=C3=
=A4 wrote:
> diff --git a/Documentation/userspace-api/sysfs-platform_profile.rst b/Doc=
umentation/userspace-api/sysfs-platform_profile.rst
> index 7f013356118a..6613e188242a 100644
> --- a/Documentation/userspace-api/sysfs-platform_profile.rst
> +++ b/Documentation/userspace-api/sysfs-platform_profile.rst
> @@ -18,9 +18,9 @@ API for selecting the platform profile of these automat=
ic mechanisms.
>  Note that this API is only for selecting the platform profile, it is
>  NOT a goal of this API to allow monitoring the resulting performance
>  characteristics. Monitoring performance is best done with device/vendor
> -specific tools such as e.g. turbostat.
> +specific tools, e.g. turbostat.
> =20
> -Specifically when selecting a high performance profile the actual achiev=
ed
> +Specifically, when selecting a high performance profile the actual achie=
ved
>  performance may be limited by various factors such as: the heat generated
>  by other components, room temperature, free air flow at the bottom of a
>  laptop, etc. It is explicitly NOT a goal of this API to let userspace kn=
ow
> @@ -44,7 +44,7 @@ added. Drivers which wish to introduce new profile name=
s must:
>  "Custom" profile support
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  The platform_profile class also supports profiles advertising a "custom"
> -profile. This is intended to be set by drivers when the setttings in the
> +profile. This is intended to be set by drivers when the settings in the
>  driver have been modified in a way that a standard profile doesn't repre=
sent
>  the current state.
> =20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--C27Db6pMBwsXho4s
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaCqIRQAKCRD2uYlJVVFO
o6oRAQCch6ZyjQnZ+Ta0fpLCTrdGb9XDfOXLHyqm9LKjTOJqAAD/T0uDMjeMhCoN
+ThzRnw2EF3ot8Nzqi3EzdqC+4IQcQM=
=bDnk
-----END PGP SIGNATURE-----

--C27Db6pMBwsXho4s--

