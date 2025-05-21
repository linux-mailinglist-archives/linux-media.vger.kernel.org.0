Return-Path: <linux-media+bounces-32961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDACABE903
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 03:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E1CF1888A8E
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 01:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F4B199BC;
	Wed, 21 May 2025 01:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIzZADzx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388F615B0EC;
	Wed, 21 May 2025 01:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747790430; cv=none; b=qWojgOaw7614nLx9OlDHxTd9wUdmn1xXuniH077Tn4rFxSsGEJPiBf+R3gUBSid4aHpXPoobrQ5VzR/u3ncdDjDAXsnnmWDleG4iPsjuhjTDlKimZ1EblcgbNnWaeFOjJnXspl9lutWl+Lwy5b7H1ceF/7z9ecpGOm8DB570r9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747790430; c=relaxed/simple;
	bh=dr6iEE+te5CZeC9ffPCGDnlT7iJvdYe7b8HvhfCcXyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTHM4+x7MqOlLBiroOzn719L3tD9RtY27s2SKIQZwvvdy4cI1z9UDGWTt46rYcZe0sjjqCOK3xw37TPmPL+HhJCuTiyNtz6GL2kR++oZdXbI82Z2x7mR5Yj66DFPaiJqcRy0IHs49NMx8WaKdtOuxkeK2K56/kcXpVc0QHvxHDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIzZADzx; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7398d65476eso4900423b3a.1;
        Tue, 20 May 2025 18:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747790428; x=1748395228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jnKAj1wWT/aTEmBr0+5z/BZJBnA/nBahrmjpd0G356E=;
        b=SIzZADzx+stvgOKtVwvmUJHlRalx7iKsOtiTK1ICG9wO47EZB7gq2/KBch5s/lS1u4
         Zd3omiaIHiHxSKpLvooBLrFzWZibRAF8OK28/3QZ/O+i4gWSYBtnA4FNR3nGczVOqy1M
         g8EjQpeWFMo9Z9ewcmHMai9+eQiAAiX/Z792Nh1Pj7cusiMuX//5IZ1QPVKD0JqUTEVi
         C3mtKI4TGy/xr23RnB5//aP0r2Da1VfbuRlyEKpMFcv+2zRulXxqLPpHU3t53wCaieAx
         U0X4X+Z6p/JntWcLeMFYrExb/RxLU/gYwOwOoLr7OYiQynkaJhbs6KfRG46k1reljLTn
         aAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747790428; x=1748395228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnKAj1wWT/aTEmBr0+5z/BZJBnA/nBahrmjpd0G356E=;
        b=lGo9ths4IkhcUCWxtJ12x7fwOz7ehtjUyT2U/SXInfVI4V6nsF9hxlj8xQOF2/z366
         ZeQD5w5g1xaHoP9tM8HHDqGxjZ8IeuydRYNcRXvUw5zo2VpHO5EuifAChfGSLswwtZUo
         z7Qg/VpRvtFFKu+jpSv5UgFlgtwvGiSl/sUQPBrDHSZnO6xyUyZDe33o3KiGiwtXn1nw
         lHMZPZRl8ZtXEGU07srni6zjO1jpUACu4H8aR6bgAGGlZKzBs7kWP+gm8aVGXn26SAYS
         JyS8bPe1Q+KgKS2mrRAYoPaJSLq/Ijy7fJzMYcK6MAbO/VnCAOafBmvW+VPo+8uhZLP2
         yC4A==
X-Forwarded-Encrypted: i=1; AJvYcCVBna/gBcW2lIWDAvK4Z4R+ES5XJgBXPSuGnRJnudilkrntY0CnqO0mtBfxDnFKfmxVWbTpeX4xekrP6xw5@vger.kernel.org, AJvYcCWaHUadEjbLzR0eF/+QKJTptKn5xaY/nAtMoowYVxtX48kzAibq23rYDHL7B9oW/5sW/V7eDLnWX4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWe4gpdCe0nHJxVzxZax8wsW7JRZhi5GhDhdnbQ2NNoczeA6ho
	ILDuPwl8f537alDcWn0kuMA1K2BubM7J8vYCoPBCnQkJ1wkoo8Kv1d++
X-Gm-Gg: ASbGnctsx2qBASy+/ZGTKrO1pnJio6A4gXqY0Eno9/K/YU3AXsiIjYWfo9ZBbUJKEiC
	nLIy5Run9nzAFU0jel/siqdoB2xlpqTG4jnjRbN3wXQiTKLTHDnI3KQCrN5sHD2L33k2slBWldc
	H3LvvbsZAEW76m+3n8rPOKzcP2CD2MVMlwxdJpA+jA+eH8eOUCDtImFicamZvmVU5DodvV0BhH3
	kYJ8UbPqWrSk8htjlh8KS2j0T6OSZJod1vaUB7I1yBgPUa2ktx1EN06ZBHN5BPHEKbyJcN+i7zG
	mY/aZzTdKQO3J+wFeMgBCNXR7BpxU8/VLeeOXbwzp6NZv8a3F2k=
X-Google-Smtp-Source: AGHT+IGRcGw4PVFj0KvWzf8iJ8NGOPcjIwY8wENV5Bey81drCVnYSC8vD3YByIiTH8J/jVDLY5vGpw==
X-Received: by 2002:a05:6a21:7001:b0:215:e8b5:3df with SMTP id adf61e73a8af0-2165f6458a4mr25920161637.7.1747790428180;
        Tue, 20 May 2025 18:20:28 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a33c3sm8872598b3a.176.2025.05.20.18.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 18:20:26 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 390A344FBDF7; Wed, 21 May 2025 08:20:22 +0700 (WIB)
Date: Wed, 21 May 2025 08:20:21 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: dma-buf: heaps: Add naming guidelines
Message-ID: <aC0qVd1D_L-LtbxC@archie.me>
References: <20250520-dma-buf-heap-names-doc-v1-1-ab31f74809ee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NypwNQ7lUsvPyCso"
Content-Disposition: inline
In-Reply-To: <20250520-dma-buf-heap-names-doc-v1-1-ab31f74809ee@kernel.org>


--NypwNQ7lUsvPyCso
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 12:00:53PM +0200, Maxime Ripard wrote:
> +Naming Convention
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +A good heap name is a name that:
> +
> +- Is stable, and won't change from one version to the other;
> +
> +- Describes the memory region the heap will allocate from, and will
> +  uniquely identify it in a given platform;
> +
> +- Doesn't use implementation details, such as the allocator;
> +
> +- Can describe intended usage.
> +
> +For example, assuming a platform with a reserved memory region located
> +at the RAM address 0x42000000, intended to allocate video framebuffers,
> +and backed by the CMA kernel allocator. Good names would be
> +`memory@42000000` or `video@42000000`, but `cma-video` wouldn't.

Looks good, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--NypwNQ7lUsvPyCso
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaC0qUQAKCRD2uYlJVVFO
o0PWAPkB0WhcqMYxc22GRsTrNHTiOOPmCuqttpkhvh7zJak34wD/RfEvLDvJd4S0
gd404Ak39Db39XlwIwe0XTZMK8hm4AA=
=6/NP
-----END PGP SIGNATURE-----

--NypwNQ7lUsvPyCso--

