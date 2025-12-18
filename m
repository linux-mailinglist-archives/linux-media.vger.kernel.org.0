Return-Path: <linux-media+bounces-49059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 388E0CCB1EA
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 10:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 637DA3023195
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 09:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74CA42E975E;
	Thu, 18 Dec 2025 09:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="N3nqnN5R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7BF30274D
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 09:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766049409; cv=none; b=MF4JKTd7r+gBlakZgqkWhV6q/5FCBKyMsLVRaioVLdOGBt4e7C7xTUL5GFj9mZp8Z7xPBNNbaMZPWrDwEy8tGLAb9au8ebrzn64S8kbNLehFUcpVAmKrgU0E9pZXdPwziyQ0TwOH7LfqJroRNsbf6ulgu80C9dWOquO9ih+5esc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766049409; c=relaxed/simple;
	bh=vYZbbFUvlVpSsiqPRvz46UCgB7m82P10unKkVl0giKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pqOLnSvEGP4GqScpaMSNjP8IHKe8DJEOeWa0oVX4ORbwxJap9MKkqzdIZfFkP1S3fctmkFbYfRJVQHr1o/2eUmdkAFsyKXqF03ybavsYEW5p0M7+Lf1sBVPNxd9D4VizfFQnyFsWT6sLLygrPvb4WuyxslotCqnh2T/paieyoNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=N3nqnN5R; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-477632d9326so2390435e9.1
        for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 01:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766049405; x=1766654205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vYZbbFUvlVpSsiqPRvz46UCgB7m82P10unKkVl0giKY=;
        b=N3nqnN5RjKD8/PUSdxsV0ZdMHMImCBLF9jA3801CyaBqZlSu3jVpWhgVKzh/gfNCzi
         S5idt8II2RUUAr0Ilz5Guw1kfjuNQgwCgS5lyoe5KdCMdNnY1bVJEnpzkjMfr090JDcR
         Oo88sJvQhv2nMzKqkZp5oSwUPurfP68BjZ+V7/vjRUR3CbkUQejBlx24r8urY9fOLHdP
         3Hcca4C//m1feN4RboylCIXq1ZHCCXITpXP2DxBcD6tyMT1bkFYHQ03Mli8eYcLIOac/
         SY7bmHRudtFoCF9nEUpx90RTkXEbEIV71hUrPW2wkqZaNzzPT9cCRqWB+RuJppNOAzda
         ov+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766049405; x=1766654205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYZbbFUvlVpSsiqPRvz46UCgB7m82P10unKkVl0giKY=;
        b=DSco86TP0hrgdE9Sg8ybWk+mJ6wEKTkGzZbP6R88mUJJs1Ma/QBD/GF7dAsEm7+7hW
         zpOnWldhLPnDKR4LHVus5RJVrTXqSrHIUNhVeEFMbMZW0dQJIv2GlH9TMBrC0xkusPzE
         PmeXiIS5ynscvB9l0ZmAFuCTXeYhE+VuYYngtt0Kh7KAUJNH1dUfh8wqidGXTWCf2Flx
         9p68/Mtkr4rFVpNRYqORyj8kw3paFQMyOC8j0eJB6zkz+3kRy/QjSCM2JT81IwgpbGv8
         PLZ/c0J0/6Pw9mgeTWnteW/4r2aFKxNu+wz2q/7LDpLWK3vnQRPXPGQy5UcbD2IzZ0yX
         qEzg==
X-Forwarded-Encrypted: i=1; AJvYcCV0LVBFQd57t1hyW0GYAgFwvsEOEx8WQ/WG6EPqmsINYz7qF7yjcbglyYVUfORqqq23u8TgHSKVHNRgWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjqRFlz8LFWj+cuzqQ9goFGOKU0zAdVtcD8daET+muXkH90ODE
	ERj0IFi0zXkh1GO8C/SYUkIvMw+U9iAQqGD4RsuuDeH129YlB8IrQ+uwxNnFQBLT3CidLTIOYpq
	bNiRs
X-Gm-Gg: AY/fxX4W+iye+Mj0BAbrsOiqZeX5QNueFL5wAeFL4Yli+bvckNnHL/RXLQ+VA04G62S
	/gzqDmusd+3Hd9Kq2UhRG1Y07VUUYxu0vfkXiS5tG2nc0AKF1fWveoM5+qz12dUtSiDg/IrY8Mm
	14H5EHEJ/qcJ7GlCE7q8dnGjf4HOzKbLEfTq33xSirK0efyAA9sO8ADVH58RbPHnsAHjFB0Js54
	m6LLJ+hDchZ23hZG8Ll/Fqm5SWAXaBqoaarzOh0zljR5Q2jtlf4qfV3P6J5ASxkW2+tleprDmb0
	IDcctXwolzBxEmaPmoq4oHIHiYvAeAdb4Cylg43Mx/dZw+3QpkseD1i67CjzJrN+f5Yta4OwuIG
	Y4CnHPbdjas+SIaNmwIvDQtp5Smp/l6al5fbvdvvxtY5rc+8Xo6eCKiU7bBauYYnLi6n3TyAcJo
	XNvEBtB4yzUBCXKmWhNajZDL1ow7jxhCEzu7qw7VkejpjkzBA8CD/p4nUwEW4eYKCeX4Wx2Crl8
	D8=
X-Google-Smtp-Source: AGHT+IE1ZtVtmsW0XDuTlbIlAELUShpo4wwDXMX7hL2TWZYOYCqLZrKE2HHcWtjhi0JlpymHYTw9QA==
X-Received: by 2002:a05:6000:4312:b0:431:c2:c632 with SMTP id ffacd0b85a97d-43100c2cad9mr13569637f8f.57.1766049405004;
        Thu, 18 Dec 2025 01:16:45 -0800 (PST)
Received: from localhost (p200300f65f006608d060da4a6607fcf5.dip0.t-ipconnect.de. [2003:f6:5f00:6608:d060:da4a:6607:fcf5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43244934b09sm3878800f8f.9.2025.12.18.01.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 01:16:44 -0800 (PST)
Date: Thu, 18 Dec 2025 10:16:43 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: 1121718@bugs.debian.org, Salvatore Bonaccorso <carnil@debian.org>, 
	Ralf Jung <post@ralfj.de>, linux-media@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: Bug#1121718: linux-image-6.17.8+deb14-amd64: Logitech C920 HD
 Pro Webcam shows flickering artifacts (sometimes)
Message-ID: <uboug5ectzm4s32yfgopjbcxq2uhsoc4kluaby7a4b7nzfjave@boco7oocnftr>
References: <176458169204.346596.13968096833088921213.reportbug@r-ethtop>
 <aS8YBLEPwF0-NtJO@eldamar.lan>
 <176458169204.346596.13968096833088921213.reportbug@r-ethtop>
 <ba9a132e-6296-451f-8351-4045c0b72d6c@ralfj.de>
 <4rnbopkefvp6h3dwttj4h7cexehqtbuzzz4gatnebdnjzdy2li@bupytpnlk2xh>
 <2ed13f74-8de3-4caf-8972-26dd5a31e9fc@ralfj.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jgpnwklzoocih2fo"
Content-Disposition: inline
In-Reply-To: <2ed13f74-8de3-4caf-8972-26dd5a31e9fc@ralfj.de>


--jgpnwklzoocih2fo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Bug#1121718: linux-image-6.17.8+deb14-amd64: Logitech C920 HD
 Pro Webcam shows flickering artifacts (sometimes)
MIME-Version: 1.0

Control: forwarded -1 https://lore.kernel.org/linux-media/uboug5ectzm4s32yf=
gopjbcxq2uhsoc4kluaby7a4b7nzfjave@boco7oocnftr

Hello Mauro,

On Wed, Dec 17, 2025 at 02:05:41PM +0100, Ralf Jung wrote:
> By trying out various snapshot kernels, I now got it nailed down to a sin=
gle
> major version bump:
>=20
> 6.13.11-1~exp1 is still good.
> 6.14.6-1~exp1 has the problem.

there is a Debian user (Ralf Jung, on Cc:) who experiences a regression
with his Logitech webcam. Sometimes when he participates in a video call
the image starts flickering when someone else enters the call. Ralf
captured USB traffic and provided it to the bug report (link below). The
problem doesn't reproduce reliably, so it's not completely bisected
(though Ralf might try over the christmas holidays).

Does this ring a bell?=20

For the full details see https://bugs.debian.org/1121718

Best regards
Uwe

#regzbot introduced: v6.13..v6.14.6

--jgpnwklzoocih2fo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlDxnkACgkQj4D7WH0S
/k6TLwgAtPBJqWCst7Q8F3qIsEKpTaaMWliqjrFDM76JOHst3e29MHw/xZHdUtuR
VF7nUiEXlSLZFYbsW5heQH/6XWN1tFQAB8U707Wc95wXMJVdfFqkcq0/Z9l1ZgPG
oZINvKt0DBQMWaMBWRNEmRKB5Y/JoyZYV1ByMyyQktU8fVhQR8d33jeJSD3w8aZI
xNMOJxbyH/Xk5jcuy6CNbPmDWOZdZQZZP3XybPJUDY22CAKaRt76QuuMt7YlFjmU
gnedyhj7ySlx8KWRDYmK5BuRDKl47V0gYPg2fp4/GsUSHLf8qm4aedZHIUcwoSCu
ryY3SjOEg8RyQkMnp1n4iUAi+2qLaw==
=HZGT
-----END PGP SIGNATURE-----

--jgpnwklzoocih2fo--

