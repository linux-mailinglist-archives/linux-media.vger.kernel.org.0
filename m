Return-Path: <linux-media+bounces-32722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6CAABB2D1
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 03:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A87741893CE9
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 01:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FCD19DFA2;
	Mon, 19 May 2025 01:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6mZkm1p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A869776026;
	Mon, 19 May 2025 01:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747617801; cv=none; b=RAz5J0Ldyg4IwCUyVx+aAxR1eSq3Bk7NVzajrsvMvgkwsC17RhLia4PqekT7rQnTKBWox5a1fHtPqaZGGSmAANIcgiKBFgiemWlY5CE81yXJn3x2HJUk/CbVTbuqwuvN5bQLmJDJ+E20Uh2KF6sbpPB0bVJ26fdoS8PEl2wWIzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747617801; c=relaxed/simple;
	bh=szWYp7O1akrqBtwUu5NvIsHLJaVg2FHDjHhZJoI8YT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rjqdq7fn2S26ujZ50xlWLcuuRrgxNTUXgu4NSetePBIkcv8YfcAcXcjh2vuKXnFLkA1L260s+fSBaMlF8yV53UKOJy0nJZ4Kre8pJtYHKjzqjNF98LSrE/YvQOuHPs3dGkZALCv/DDwvx7NiaQCRuL9Afv6H3yjUIpJ8vu1t9fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6mZkm1p; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so2800269a12.2;
        Sun, 18 May 2025 18:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747617799; x=1748222599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1bGtewRmtax5G8PsycrpOk9GXsurx+/jHhRp4qP6ZQc=;
        b=K6mZkm1poKTkvdU/yWCU54NqNoEjX6jtBEaW+3EidfKDRJJI36VutBfmG1O59IdOzp
         J1+flNhpXeah482MmJGevepIdiNg/ofI1lT3Jm6jkYqsMN4TbOAhKBTLAl5VXHAEgVKP
         Myi4/dSTuSp+zdO50szz7AOhopnYj7MvvxaEc+tDXYZOrMDU23rlw8ZdyRFX4Wqh2Z6A
         HX33UXZK1rKgSjf0IFL/VrHfTY9IXc53+AhEBZkjgcC6MWzGKUg2TFw3ThM6fpVoljr+
         1jGXi1yOavB4fzivzmBEBUBoaR302vf47V/mk9rHijpJBaXrDeBHwpi6sojh1QNnxvVK
         PMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747617799; x=1748222599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bGtewRmtax5G8PsycrpOk9GXsurx+/jHhRp4qP6ZQc=;
        b=rg4C/evWlrn+9oew8yNc6+0TGZV9mj2gSDYKwZtzM7V8Yh+Wd/wYplXoIixL0HM37/
         YtXlMn4foKsQgt+cnazeGQAyDh6Gri1Q60IPygkBRc5B8+xdiuAo/W+A8Sq3gcZXA8be
         aQ7nFxC7peTwRnsYNtJsoz0HlcQIqLUTEivbFipuKFRVBoiroceZB5SqWU8zapKtqoGH
         L+ciNK7EzjJCCG9OvtzYV7VLG09Z6ftw7GFIE6r8Rg/thePNEJ7IvN4QDjXU/7KabIbF
         zsMpnYtMX2dcaivmJ4G5BhWmD/IoHoBx6gjkKueiTggZskfKApCrExzzr1oSBQxbW6Zw
         vIZA==
X-Forwarded-Encrypted: i=1; AJvYcCWqyn5A87MMv3oovuk4xIVMNc7gC+cH3bbFVXNIDpVUvO2gU189E5OEqlcT6WwN9+y5RBq1YvE4PjJTToY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCV5d11KzvVeRitG2IeBpdlHWA2jNEb2MGhlGYLUJciKwuY+z3
	+n5CfCyo/pH1SDOm4YoC1OysmFb49XvQb/iFY5osV9A85eMGzDNbFAca
X-Gm-Gg: ASbGnctFHX46E5fT/z/5NLELSmcJbQtfK8wwq52AFBAV30wEo/8k50L7/L0hlmDJbIQ
	f+mXNOSkvfghB6EPfaqj9kKMy2e+dplNAI2VOOYADfoNEiEkfV61LgLmA7rfhBrYoEvA3UTI/D8
	36nJ+fnJLsuXEkQWHVinIa2/RkB0HipJE/KHppGdeSKro2qv7CW+O0SbOW4h/Lw1mvtJH82gEAn
	Fcb07a8vhvCGbejDawVOQWWqFxK9ql3U6/EOjh0vXxTAkq4AtDmq7m1n4f477t8Is/RpJrXV2MM
	7BChEUaQhp3CDZl3kKGATMluPv8U0GDomJjUX8q3Z8BNi2aPH8c=
X-Google-Smtp-Source: AGHT+IGhp0HWQnVXgH14PYeJQ2R9fzT3qMmupNX50fb1NBX+cVX4ZTlETPO/cA9Q5e1EncDrB5Fikw==
X-Received: by 2002:a17:90b:58e4:b0:30c:4b1d:330 with SMTP id 98e67ed59e1d1-30e7d5acb3bmr17124738a91.27.1747617798662;
        Sun, 18 May 2025 18:23:18 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e9ad67011sm3905474a91.33.2025.05.18.18.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 18:23:17 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 79F874208F51; Mon, 19 May 2025 08:23:14 +0700 (WIB)
Date: Mon, 19 May 2025 08:23:14 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Hanne-Lotta =?utf-8?B?TcOkZW5ww6TDpA==?= <hannelotta@gmail.com>,
	mchehab@kernel.org, ribalda@chromium.org, hverkuil@xs4all.nl,
	hljunggr@cisco.com, dave.jiang@intel.com, jgg@ziepe.ca,
	saeedm@nvidia.com, Jonathan.Cameron@huawei.com,
	ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
	W_Armin@gmx.de, mpearson-lenovo@squebb.ca
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 2/4] docs: Improve grammar, formatting in Video4Linux
Message-ID: <aCqIAkoVr2yvDJbN@archie.me>
References: <20250517132711.117618-1-hannelotta@gmail.com>
 <20250517132711.117618-2-hannelotta@gmail.com>
 <871psml4t7.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/utPzO/+BR3FoDfM"
Content-Disposition: inline
In-Reply-To: <871psml4t7.fsf@trenco.lwn.net>


--/utPzO/+BR3FoDfM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 18, 2025 at 02:08:04AM -0600, Jonathan Corbet wrote:
> >      description of the correct character encoding for Programme Service
> >      name strings. Also from RDS specification, PS is usually a single
> >      eight character text. However, it is also possible to find receive=
rs
> > -    which can scroll strings sized as 8 x N characters. So, this contr=
ol
> > +    which can scroll strings sized as 8 x N characters. Therefore this=
 control
>=20
> This kind of change just seems like churn that isn't really improving
> the content?

I prefer the original as both so and therefore have the same meaning.

> >  ``V4L2_CID_RDS_TX_ALT_FREQS (__u32 array)``
> >      The alternate frequencies in kHz units. The RDS standard allows for
> > -    up to 25 frequencies to be defined. Drivers may support fewer
> > -    frequencies so check the array size.
> > +    up to 25 frequencies to be defined. Because drivers may support fe=
wer
> > +    frequencies, check the array size.
>=20
> Here too, I'm not sure I see the value in this kind of change.

Again I'm agree.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--/utPzO/+BR3FoDfM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaCqH/gAKCRD2uYlJVVFO
o6lDAQCh/VCPdKz68FdKnXg5XJbiBgln/GYY8iRzwFpsCPadfAD9HpM6f4+7YuDY
jIyhgK1015KkczdjAzWsPn94D9NZGw4=
=r/+a
-----END PGP SIGNATURE-----

--/utPzO/+BR3FoDfM--

