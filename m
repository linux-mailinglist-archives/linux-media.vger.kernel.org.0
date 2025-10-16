Return-Path: <linux-media+bounces-44712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DB0BE2DC5
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 12:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2C4084FF964
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 10:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257E32D0C7D;
	Thu, 16 Oct 2025 10:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTTCzsA+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B572DF15B
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760611270; cv=none; b=bYsfsYSeNlbK2s6WgpPtarBrum/lR6WDDGPw9jt3cQaLjpwWNeQDHJAnuhPFt8arkL0dNX9VyxATFRtCCh/yUJT5T/MTa5qadEhqCjvDiQ9Ii/Pw+MFc3fj9v4e5m6BjaGExQhA8GfIXK8ohcxjdBbyBdvCtd9vJvw4AJzdV0ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760611270; c=relaxed/simple;
	bh=jnT7eA0MwQzti6UldYfk9G+OiPEhUoWsNhvVPZmZfYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAaWvzwWlATWgcLcwyuOokNhdfnUK1c54uK7oDjqA0doYOueBz95KpGHdF3P1wSrkKINs3nyCqS7xg4G4tR7pgletnG/Rs9aICe34BYSsP1PVE+CrJiXt77cwqqav8MBqTTd0O34f2WcTwrZQXjfpLKwUQk+6xcmb/avWhDHRCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTTCzsA+; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-33ba2f134f1so608825a91.2
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760611265; x=1761216065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LVSu3v5hQ+mkImsLsDrLueW7tnWFr04YL/mKk3BRmmc=;
        b=RTTCzsA+54gYQ/CBNkEZDIsr2RZxIy+QRMua7OKLRo4utBmX8lVmaq0KQpPPYJyBxM
         X2BAAMrzv5QxaKsU6CICIkwcS25qTWGP7k1VbIEhqk2bU4D7n19ZJF6kw2hXs1SXFjmo
         jBgADgKCftajWdT1hxU8aIV3XY2GHfaUoIdEfXJ/2smuBLIe0ionWm6IviTzNmzQ4Z/5
         dgbyvI8LMupeP244ALuLcRcmUOpQMElQQof/3y7JKzlqhl9X8GVhX/e2wb3hNHnKi+Ma
         iUKWTUUcX2RNUyeQWZ7nFE9TBJbDAaUWX+cD9tgQFt729qMtCk8CzdYasW5Bfed25tYj
         r1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760611265; x=1761216065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVSu3v5hQ+mkImsLsDrLueW7tnWFr04YL/mKk3BRmmc=;
        b=aehqmAvVNoswbjZYMsRZtsiXldkHi5pBqKeC/D7m7wUiu478XwQFhi09yHM44XawTx
         edAv4GSU3uAk3vImb3z+JWrTnm2nD8dZDlgbMZ01x/9RJclYUowZrBJuXAYNNTkHAR8q
         H9Mc/2Cdm9ATQB7YKPTYeJi27vlrqY7T4E/kWs7nY6K1RiIE3y7PoEe4xU+R5Nx0em9V
         vQVN1i10ksuvIQwaDqUNlHopAb5AeNqHGzBhN2kotQUqLlsSJGLNIUl5JeNT3W7mUrXn
         NygmWVnx04oX7vW4UBON8hRi+c/VyGBKHKOSlvL2jMiTT8KameuleGZmN8+fgxCjQiED
         6IDw==
X-Gm-Message-State: AOJu0Yx5a4NHcfusqtPUjDM+I5LSouPcXr6ljyU4hr7hvBsFi3BgX5Z5
	D5yBbdxNOgABnB7CUQ+gx90kPkGmy8AjwLw8+vSUzI2jrDvi8t9MFJr4
X-Gm-Gg: ASbGncuDDyNJa+T1pYPGJxnf1VBgzyQU5Jq8mN/DwD1f/ioKKCWrLVlCpibApwpsmRj
	CLmuFaEeVCSy2APCxxN+Rr5LOkaUL6g/FGzypt94mAi+cdfCHBg3+UmWrUII/Mkco12tgyaTScl
	tF3ylqe27L0jtzEb6PMqrK1xqqwBpwfSWnbAyCQfaNEAwtR+ZY5TLQrB/7safn7UFdxX4YIyroB
	b2wOnJ8/5kTAm2TLKam18n4xH5dVwa3PxTFWFmhWFHLJmty1tiXbaXVJRB8QiyWBxZNQ77jVaht
	TQ1TIUZZos2EfyT5xGqI3lnY+0819j4rXTDh+fx/MpSNdGrTr4HxCgoD80hta09GqIrKudkfK96
	6K0J7T+ijVnTs9EKWR5srUsFUFANUTM9qapyfRU75zl4sP8gOhfymmu8y6CIamiJAMtQwDc416C
	VwRkSrSF68W1K19Q==
X-Google-Smtp-Source: AGHT+IE1H0Qo6arbd/0sw3nK8Wog5439Kuk67M2dNIEm8atK9BLJ3NAIUD/arp5nW0PclXPHJb8yBA==
X-Received: by 2002:a17:902:ecce:b0:271:b6b3:71ef with SMTP id d9443c01a7336-290273737a0mr409664895ad.43.1760611265161;
        Thu, 16 Oct 2025 03:41:05 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099385d9esm25928775ad.45.2025.10.16.03.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 03:41:03 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 02548400365D; Thu, 16 Oct 2025 17:41:01 +0700 (WIB)
Date: Thu, 16 Oct 2025 17:41:01 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Kriish Sharma <kriish.sharma2006@gmail.com>, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, corbet@lwn.net
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] htmldocs: userspace-api/dma-buf-heaps.rst: fix block
 quote warning
Message-ID: <aPDLvQaZX7M5D1tv@archie.me>
References: <20251016020912.1653230-1-kriish.sharma2006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ldeZ5wTTs5GzBIeN"
Content-Disposition: inline
In-Reply-To: <20251016020912.1653230-1-kriish.sharma2006@gmail.com>


--ldeZ5wTTs5GzBIeN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 02:09:12AM +0000, Kriish Sharma wrote:
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentatio=
n/userspace-api/dma-buf-heaps.rst
> index a0979440d2a4..c0035dc257e0 100644
> --- a/Documentation/userspace-api/dma-buf-heaps.rst
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -26,6 +26,7 @@ following heaps:
>     ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
>     created following legacy naming conventions; the legacy name might be
>     ``reserved``, ``linux,cma``, or ``default-pool``.
> +
>  Naming Convention
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--ldeZ5wTTs5GzBIeN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPDLvQAKCRD2uYlJVVFO
o9hmAQDFQdWAy7dyIyVP0SLEEl2pGTkPA49V3t68gWb/RcemuAD9EEE+wGcnfP5g
y0D3QS10Sw9x4aNHuLSknmnEamh0YAg=
=ADLh
-----END PGP SIGNATURE-----

--ldeZ5wTTs5GzBIeN--

