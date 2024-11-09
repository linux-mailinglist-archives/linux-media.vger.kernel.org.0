Return-Path: <linux-media+bounces-21203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A34019C289E
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2024 01:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68F9F2850AF
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2024 00:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E4E23A9;
	Sat,  9 Nov 2024 00:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="meYCkeWt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49561139D;
	Sat,  9 Nov 2024 00:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731111039; cv=none; b=XV2htNZJVvXMBxb5BhJGUpSzedcJc51cwgs3udySbcOQUuDmEO1XMTlsgD/8YVNogqxrSCEN74IirhTnj8/m1+NVwfErX33Q7SWemGe0begLM083yVz0HhrZWG9kdPuG/dlYtiHFuhkCrKySN7FWhWJvuH2p7x4dD9SLKvZqaQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731111039; c=relaxed/simple;
	bh=JULSdsR/eExb5+Ljty6yh0u5RmUvCizSzfqWvRjO6vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8MbvkO1cXcv/Yl121CFPdVwcCRArN8Xx6VxjEn1TxtgDvuBFHvAhIgpugdAZVGZKGlq5bnAGA3a00LjuaRoi49WUEEcx/O75bBB5k0tRei1teRP/wEKmxHnlrtQY93BPrvKJfo638KgqMDNA3A3Amn2ipMvNxxG2xB8bZC6bK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=meYCkeWt; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-720d14c8dbfso2627894b3a.0;
        Fri, 08 Nov 2024 16:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731111037; x=1731715837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JULSdsR/eExb5+Ljty6yh0u5RmUvCizSzfqWvRjO6vk=;
        b=meYCkeWtfm0NdE/8eppC1KttmR6i26Ejuep4wKDPX1WpWsxQMwujg0CrAr8DKtFmmA
         O46xvFvSgCaXcJ4EkuY2vilqtk1PoEipvwyJxxPJ/N2YqNnvGKG56udwqH6x+H79xYhm
         efWu/A8L4D/bca8q+ydcjUteamn7pemIU4rhgxXeR6cmOMUY02mrvDm34HfWyGs+K+VJ
         yhEC6+7f8dtJ/3og6yd/U5HtLZoBul/7+cuNoRMtG0+/ecyvp2Kcz/I28815+6ISiTH5
         4PrF9kIGt38v3vUAbGN5U+JLW1VKGszuJJ/Ba99rSaGPCtyotVvVAPRZU4sXu6KY5G+A
         BocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731111037; x=1731715837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JULSdsR/eExb5+Ljty6yh0u5RmUvCizSzfqWvRjO6vk=;
        b=WW3uDa6g47FP2kVFYPUjZUz3efgifqlvBo8jt3QURW5aS4YsibY7YkADkpbPi7YQcx
         mHfJOjeYA73/kZZgUG+D0DjsT0GvTWXfGpANeRotYBNCTNPmn2X6msk02F7l7biOuXIs
         JWtcJgGYjsLPwNilSnrHNkQg95IZF9uZgsvmvrIpmj3+mSRiCGKpSb2uR3HYIblMJLsK
         6AtasvhtdBaigoZ81kE5NnY1a6mMi4e69OBe/gxooCqTLSFGrerveI04hEBQdrOYITj4
         daZIbVw1WPL+PYSgEcvgDwx+ST8/LOzR70m7kVjabThv+JFfuUBoc5w42rIwT29xFp1e
         tmog==
X-Forwarded-Encrypted: i=1; AJvYcCVONpBXJqqybLKX2GlnDEw/wwvwoMqZAl9bWNtSHsS/MqZqHnlzHE6D7aoJs/zHIDeu7TTKD2yiiGGdLmk=@vger.kernel.org, AJvYcCXdkUWt4JF9l3HKcQv6iNVut5YCm4jDwYu+h5gjjGIg27yCSqvssPZh0nlWQuaAtoVBj7zuHifyMD2AK7U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/IziQcYKoKKEmryRxVWHf1E+FH4CJqA1ere7etINTJ6KZRnSb
	N2Efs+LnAfjlMZ2xdFhmBQrS0AkX+7Bj8TMeCCo8VpLyDvbgbIgo
X-Google-Smtp-Source: AGHT+IEJIIInLiGNdnceGFFeCeHLb1fgVuxF6QJo+rCkuSai4TK2+9wwKp6Io0qRxqXDtA/YSSlHAA==
X-Received: by 2002:a05:6a00:2e9c:b0:71e:8049:4730 with SMTP id d2e1a72fcca58-72413261790mr5258432b3a.3.1731111037326;
        Fri, 08 Nov 2024 16:10:37 -0800 (PST)
Received: from archie.me ([103.124.138.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078a89f4sm4533420b3a.61.2024.11.08.16.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 16:10:36 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 15EE841F52FF; Sat, 09 Nov 2024 07:10:33 +0700 (WIB)
Date: Sat, 9 Nov 2024 07:10:32 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	hverkuil-cisco@xs4all.nl, mauro.chehab@linux.intel.com,
	kernel@collabora.com, bob.beckett@collabora.com,
	nicolas.dufresne@collabora.com
Subject: Re: [PATCH 1/2] docs: Add guides section for debugging
Message-ID: <Zy6oeBaxy1ZJBWtf@archie.me>
References: <20241028-media_docs_improve_v3-v1-0-2b1b486c223e@collabora.com>
 <20241028-media_docs_improve_v3-v1-1-2b1b486c223e@collabora.com>
 <87ldxu235z.fsf@trenco.lwn.net>
 <20241108081315.ln5ltvw3ssldonui@basti-XPS-13-9310>
 <87o72py8z4.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AWomu3BICPMnoDL4"
Content-Disposition: inline
In-Reply-To: <87o72py8z4.fsf@trenco.lwn.net>


--AWomu3BICPMnoDL4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 08, 2024 at 09:40:47AM -0700, Jonathan Corbet wrote:
> Bagas is fond of giving bad but authoritative-sounding advice to
> documentation contributors despite repeated requests to stop.
> Unfortunately, I don't have the time to chase him around all the time
> and set things straight.

That's why I'm kinda hesitate to review.

Huh...

--=20
An old man doll... just what I always wanted! - Clara

--AWomu3BICPMnoDL4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZy6oeAAKCRD2uYlJVVFO
o2G0AQCB6ArKoLhZ8rrpeuDNL/ShHLbE5re7JTVnkV+X+bMBsQD/ckQnROTqPMYr
nATbH0HFBgxpgHlUQ+KwmKsudD0/nAI=
=RRy+
-----END PGP SIGNATURE-----

--AWomu3BICPMnoDL4--

