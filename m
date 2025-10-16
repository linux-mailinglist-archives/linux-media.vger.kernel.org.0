Return-Path: <linux-media+bounces-44641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5E0BE1107
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 02:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E89219C1773
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 00:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8E613B5A9;
	Thu, 16 Oct 2025 00:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLWjhbES"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B771211F
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 00:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760572918; cv=none; b=A2YrF/QsLESwnR6YK6IS6R3tqn7GsS3Rjg1NdcCYQMzkEfJiPaHzn5QI8wja3nUAcymuntszbNlIfdzzhCj0UlVisfcDhr3Xg9idF3gYjjnFaL4VQ2SU3ZM+hLNc2cDMIx/8bSwiPXD/NOs7nQ4MPs5YLm06irsXH30em+G1mS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760572918; c=relaxed/simple;
	bh=Zrfi/VMjUvLRNlm3QRjfVIbaOCS5M7RG1lr8DfSwgF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WTPaQ0FuEVzxrIkJb7LrlrAOQmeFtSU1r3KRKybeS7dfpA+b/0ZxEHFItMFMZKM4QnJpjE5Y05RYPaeCzNhISD9DR31acXVIMeMl8EhamPd+ITJzj+hk3EY46NC7sgTRpRP/00EaD2G/rnuTs5vCzywPh0DTerfeRD0FEk1Kuw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLWjhbES; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b556284db11so86886a12.0
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 17:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760572916; x=1761177716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zrfi/VMjUvLRNlm3QRjfVIbaOCS5M7RG1lr8DfSwgF4=;
        b=BLWjhbESuViax4jmUHuU1/C5sfslurZOjjWZclg5tojd0F1jYht252vvFgwbY7U9ap
         YrCbOKrE6/TpNU+1+55xeKMyD8Bjeox/WQqAy4W6q88grrFf9j67GENnULSt9cpu/MfP
         JUf6RjKvjEF+bKrwT3dqm2wm2aoWCZ3WJg5V/SkHCaSxqlsqChXjztjlBpaiBBLXW+AX
         oTO5mFZy9U6HO4tjS5saeAfDo+qa4R+Nm39XRK0ujfrzHWU0oblvBBB4HQo1NKvCMOxT
         fMupSb0BMTzkzfjcjM8f0aEMFyduTvyZ25c4S8brvRKMe7BXt1Anpl/9LbjSue+6H+WU
         gEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760572916; x=1761177716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zrfi/VMjUvLRNlm3QRjfVIbaOCS5M7RG1lr8DfSwgF4=;
        b=AU5lCWKKQ6bk406JuQjpobC9b9EY2TZB99UVhKwx8S0x/ulKAM/FN3WsCiVo+NPrJI
         kB3g/2AqcMkyef89sg9HhowjVkyuFQQIl51auCwNFA8nw3H3rlKKinY3u94638rgn3Jk
         3e7SME6akA/cZrF1E76ciyWQMFd5potQPGKMQG+WFPV7C9VKz5w1Nwr1HlPUqwnAxaWG
         QibjwUxj2LJveza1PCua/3H/YC/v4X6dmK2ewx9/sp+PPndkgLz1DVICFxm81xVMCYvF
         AUlw0TLhF/AkI9urktQ6EsI8hrLEww9Wdiy7nFkdOuLn+1aiJPODQOLfTbmOWj3RvVzc
         vjhQ==
X-Gm-Message-State: AOJu0YzWOsUBkm0EDsswHpzVQdFZ8RB2LKsyVSJk8NRNHIcHV57TgmJ/
	9zOb5K9n6FQ42a31FUTDNziamR9m9u4wsOYyZmwzL/ruLOtJWEQT+9Y/
X-Gm-Gg: ASbGncs5hgZM5zaKz5Hl12rDLHEcNpFBsPIR2Q6E7xiGeVr88mDmBjboBH6Rj8diw7V
	JB5Nn/2vlp93Ag0Q9ImDb3pYBZT1Fglka+zE00RPkwvGZWk/KXo1ICCO8DH5a2itrYbitKg7uct
	G9nn9pfDK/8qMbXwZsMmZxyDjUs1Bhw12i7LhlKI0LclcHanKERHm6AtkihxtH5PKlzTScFikui
	epIf3bVDv+yZ/p5SWuIkt1737Ji07WoCnU539XU2PSMNG10uTJcUa2yACS9cKqkPSVghI9J/mMs
	JEqnf9NjwfPjxQMEc0gnBQoE1RkwfHg/7eVvhnM73ZhNkDT4dUPJOa0tzaw8quFLW0R0Oh03kXL
	vzMVwkM4rK1Xh9XDTaU0h6hHAKdz9K2Pnz++UqxAMz0pH91ezYcCsEz5oCfdCjpCnRERkLlvTgp
	Lo74kepwKSVZ7lnw==
X-Google-Smtp-Source: AGHT+IHWPFl3wQ4UvDVjKcFZV8JmCaZHewB/K/pGnpEkw5mCOGWpXdamSbh5/nnQLrluiU4qXrWD4A==
X-Received: by 2002:a05:6a20:3d1c:b0:2e8:1c23:5c2d with SMTP id adf61e73a8af0-32da845fde6mr38728255637.50.1760572916459;
        Wed, 15 Oct 2025 17:01:56 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb11ca0sm20159494b3a.32.2025.10.15.17.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 17:01:55 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id AC288420B701; Thu, 16 Oct 2025 07:01:53 +0700 (WIB)
Date: Thu, 16 Oct 2025 07:01:53 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Kriish Sharma <kriish.sharma2006@gmail.com>, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, corbet@lwn.net
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] htmldocs: userspace-api/dma-buf-heaps.rst: fix block
 quote warning
Message-ID: <aPA18fxQW398WHte@archie.me>
References: <20251015183402.1649988-1-kriish.sharma2006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sY9Nki+MnmfjR25j"
Content-Disposition: inline
In-Reply-To: <20251015183402.1649988-1-kriish.sharma2006@gmail.com>


--sY9Nki+MnmfjR25j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 06:34:02PM +0000, Kriish Sharma wrote:
> Fixes: 1fdbb3ff1233 ("Add linux-next specific files for 20251015")

The correct blamed fixes should've been:

Fixes: 507211e3c7a1 ("Documentation: dma-buf: heaps: Add naming guidelines")

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--sY9Nki+MnmfjR25j
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPA18QAKCRD2uYlJVVFO
o1mRAQD9zW96GC/QMBetvLQDoIrsCo0iDBbnK6vSUvPUFGiJBgEArGkrI0xtSD65
ufBe3Zc3jnfHJR/WnO5dziYq1UDYjQw=
=fHXv
-----END PGP SIGNATURE-----

--sY9Nki+MnmfjR25j--

