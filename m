Return-Path: <linux-media+bounces-26419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E738CA3CBE8
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 22:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66F5A3B8B62
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 21:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19E02580F1;
	Wed, 19 Feb 2025 21:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lyA6sZO7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9191C2580D8
	for <linux-media@vger.kernel.org>; Wed, 19 Feb 2025 21:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740002319; cv=none; b=HdiijsluyQRto+GWnZNKxKFhG8/myDzaIYEX5HUvpN8cjm90IzLcfKatlQETi3gO6/AH7178hHFhss4so8mRgyLJuK14LSEcyIVPms8QvoVtGzUXGzgD/r1vnB/sKAzq10oOEFSUoI/dekH+uYZdryKlo4EBaFvPLRgcNsxdWS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740002319; c=relaxed/simple;
	bh=fyGcqi2Bp8N9HpC01czLpCy9nk4tDHQ2nSIJ2kDjebY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfRLIIBzk7Iq/XdnJjDrHGXKpfNFr6+sTgtIK3prwCaKtoq3zHK3oKtLY/K2utOpB9lM+DU29z1VnlC1tojkWxaQu5NcInHZ/1kT993l5LujgcuvFslj6QoXahTtfU3DVyEVxaj8iXzOpK+dcIjrWVF20uRn5FTnfT6Q8rUdnL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lyA6sZO7; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abb79af88afso62767666b.1
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2025 13:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740002315; x=1740607115; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fyGcqi2Bp8N9HpC01czLpCy9nk4tDHQ2nSIJ2kDjebY=;
        b=lyA6sZO7KUAz7aH9DVMSATq3M3aiAJo9ZKadFbHLD0j9N/izbZpNQZesId9VTx97mS
         5trfyaprvXGD3FsM2ASu0ZNoWlaRiibVbcNoddcOV2hGkU5IAVEVl94T6tDXkwEldfr5
         YeHKRNqM1F4ON5pNLJmvKaIdzksD/nZCWVYC5tnltI4zLWVlDTpufU8JSS9sZNTYXH04
         KJXYFh5UKKwFkV/JAT7xDITxyhLl2x2M/susghSDcT4dXPuiB7NPwue8luFOc7RiGniP
         ZBnAYNGMPjPEh52/M0wxPoCJ+6ZiuauYcPGCsFtdepoFiX3RSNQ0k1byr7RDG+L+2EUG
         e0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740002315; x=1740607115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyGcqi2Bp8N9HpC01czLpCy9nk4tDHQ2nSIJ2kDjebY=;
        b=kEinHpkC9OKLiKon62YZ3KMh8jHPU9w2IbsvIshdJ9cDqQMCB+hUiwnMTjB9+b8xJP
         cfcgYowvXFXermEaJiGlrH8qkIq33qS5nk92aFPPKI1/ltJeMefeku2+TFpd1/1/fVMI
         JUmItVMk2I/87c4nBRf+4eFa8668pruYqL0wUb2p2hdbfmO6Mu0Q0pifAEjmJseVsMH0
         r3/qO6K5/Gs42o7Mq9lwQFYfO2nUpV+A3V/XwGzcjt9/fFmuLNnoNd3SJGT1GVxzBPc0
         LjSLtQ7Pl0w4mJDn31USPEhC2tNW/Ag/TFoR+U+W42xZikeZKjCd89uXdtXrVIH2Uh9Z
         +2IA==
X-Forwarded-Encrypted: i=1; AJvYcCW8GIs2ItepkO8TTVv8G0Z2SbFtsLtzy8QWkgepFmFlDKSYM8IJa42uzNJe7RpgfLn+8D2qT0Ek9uHRzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvmnT7gojKG9m2+r7v8Gc2Rb+/aOjKlZ7MObX73zikDunWwr7F
	PsepcIyFbX8q8NS4YrsECc4m32rzt9FgzyJRGOkhEMOO4voeCR56wg7MufFj0J8=
X-Gm-Gg: ASbGncvWoQiX47iSQ4hEgD9b62Q00745R9/8OEGrEazmmCTY38y9FODY37U/y7vDsHR
	HueJmTfZPc8sabrhtZgQE5JKG2Syw3OBNOBXm8Q37dEcLVpOqGM2DzwxtsjTDXpjM0IIz+2OTWq
	lE4kdfQr0J+Z9Ck1Hq1r7dTX9/SNeMnwaGH4n1UyHexFPJiVt05wIrXO4t3nsZVLUZdmKZNeECp
	FnWzZygzHIs+jtZbXJWi2+3MRAQw2HgCL/rK1bHSYndJ79+l8bxkZtGC2wa8HBqZVTxP0G7y2kG
	kVqSSiBvseLuwikBnhN2
X-Google-Smtp-Source: AGHT+IHVsfOhfYM/r/iSRBSxnAeffOy4Y7p1b6ZeLawu7a1gQ8pubcoWFcCoStQbz4uZwHEcDDN4Og==
X-Received: by 2002:a17:906:2dd5:b0:abb:974a:8e3a with SMTP id a640c23a62f3a-abb974a9215mr1266554066b.44.1740002313853;
        Wed, 19 Feb 2025 13:58:33 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532322c4sm1339967166b.34.2025.02.19.13.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 13:58:33 -0800 (PST)
Date: Wed, 19 Feb 2025 22:58:30 +0100
From: Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>
To: Matthew Majewski <mattwmajewski@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: vim2m: print device name after registering device
Message-ID: <ym5q2cpn2lxk7sarylnf4o3ztvtnb47wroxdiibdsp6yz4gt2y@jfyfo2ekmdmj>
References: <20250219190501.295976-1-mattwmajewski@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mbm5axqs3s2lfqw5"
Content-Disposition: inline
In-Reply-To: <20250219190501.295976-1-mattwmajewski@gmail.com>


--mbm5axqs3s2lfqw5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] media: vim2m: print device name after registering device
MIME-Version: 1.0

On Wed, Feb 19, 2025 at 02:05:01PM -0500, Matthew Majewski wrote:
> Move the v4l2_info() call displaying the video device name after the
> device is actually registered.
>=20
> This fixes a bug where the driver was always displaying "/dev/video0"
> since it was reading from the vfd before it was registered.
>=20
> Signed-off-by: Matthew Majewski <mattwmajewski@gmail.com>

A Fixes: tag would be great.

Best regards
Uwe

--mbm5axqs3s2lfqw5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAme2VAQACgkQj4D7WH0S
/k4Jiwf+PQHBFpKMA/AopnzEoxCse7bg0D3eKxjisoiNSQWU/Mk8YM9EHbKoeuC/
3ww5X1vODENHnHNSHZIKAU+2irO6CjRCeYUWxAP+Rz07H0+420dKRCYiC0WbmE+P
FDLk5kItLW4N0pjDKIVNh/KvbU4raebzikawJ+H+Nu+5JOR91Jbd465F1KCyHJYi
B6P1zHcGtnIHLg0s24ORGC+Y04sPf+7icXFLNESIF0Lro6W/1mfUoYG15jPd4jYD
AvysmcfFoLt3UxMo1PDg7pM/NxPFrv+NUVaGCsa2Pdz3YWHpzOA5V+SuoPOVXA78
hWExFS/CFX5mKwtAfTFTAZHlNOKIcw==
=+EJx
-----END PGP SIGNATURE-----

--mbm5axqs3s2lfqw5--

