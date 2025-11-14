Return-Path: <linux-media+bounces-47124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A99A6C5DF55
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 16:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8F634505A57
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 15:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5CD4331A40;
	Fri, 14 Nov 2025 14:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6sYjKLk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0DE33123A
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 14:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763132281; cv=none; b=NIW3Nze300Eb+CBb0+B8n6FUc1H2iVEwQviM4dp1/BB8IQ1VmZwn7zpmEbURVgyGlQ77XoGXp0i4WeH9UDhvTvazSf2xjfo+sNyKIpeQ86eEXrhBBh4i7b6+uJfOnVx2Of+de+StfUfpfVhevEmyZLSdvM3sTa0WhSxvq4vz7kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763132281; c=relaxed/simple;
	bh=F1ZCzX89awJADOgTe+k1vSNI5Zu2MhOm6VSE4oz9v3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FvKKyadHC8vRwI6nt3PZzLf5wlr9mHQSzhx0Qaz50dy7FA3pYktFZsynK6znR+Us4VudCrdqOVbQ07cqu+mvFpu3qdosiON3BUpaBbzsavWfEEOEC6KO0mUMjZTthnaOcD/FGnWFk9r7XJLG30etAbZOgIUCHa1IGGRWDudsi00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6sYjKLk; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4777a9aeedaso18932415e9.3
        for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 06:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763132278; x=1763737078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JGnRuedlsHd0fcZwXKJjRRdg6CbePYJalR5bL55auvo=;
        b=P6sYjKLk8/0kTE8lO+CzOp9BGFg8Q8tPJr+bCGTdHDZKE+MuFpap3hCh9kxjhmRm8c
         DuBjPD5NZJlrBauJgvudHJfDhTFYnUEwPUFkerun/pu41rb3ivvBU6YwcVtkOWPGw0hO
         QOwsRsQz4UBTPeSKOpwFHcvd62DjRCcOMx8lQdKVdZI0x6Hq8tpyYerCRNhjXj90/aci
         LYyfxvfggc2KATudGot4O98WBjZoeOFX0LZpu5SiV6WRECYdE/ihuKSdP18u3Tj6YpMU
         82Z7BDy2Am7a0XuJHskjQoaq/Yphc/+B8ZYI0KcVAxVqUYevx5hGx334o+U7PvVrYoy8
         9xUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763132278; x=1763737078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGnRuedlsHd0fcZwXKJjRRdg6CbePYJalR5bL55auvo=;
        b=AhY8d6f1g2uNVPayCuyCme+rRS58kbSJp+y8zMdPLyvqURADTrTBGWYnVJ1xgfxUZF
         Ib5QJRLsog27z9ubsSL6ucMUeb+UPMHRet/I0PV8/YxLnRmq5IISkTmH2BcE1pc0CPIv
         TdD3rGIuQKTCynIOyDH+QZ/COQoAynsghFleYemD4tRkYWMkCEaFe8P9WtLBea1wo5HV
         kCS6ljtRDOPKG7lXtCRs0nTljtQaEtcXzD9c0E0To41UA8Qibef5yevSQH/WcWGzLExe
         VOfH+uACaheQOFzlRwyZGWAFPFJodCip1V0mioV3isadeGV6QSme7FfoEZs/+DqA6mBF
         ORMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKPmY40RVVuAsfSNlORQ8Va5p7i1LkJSkoZfiyZP8eB7b2SpfdFXukZYyb9AcjJPrWF4kGazmQs3njog==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFFgOmdgZ59kBYzTPFKr4kCLmLux75SS2NUoh84f7afNVLXCjn
	62VXIXrJCpuApwzNUxtuunizvt1jEsRB0sgAIxlT509GAaKBrzj7r0LM
X-Gm-Gg: ASbGncuxma8IBW0xrj2V7RQZBvWhrh2/GaBnviyK043AW9DUqycQPCrgCqmU5GQt1xr
	oSFtPYMc9O7pGPNRW3X3mbFQWZCPxN4RiA1pUiyR5e2BGMbiIfCF+sqMTHUtW2i6DGbiGRmEw/y
	va4R18Ld1Tii/oF7KcCVGP6nqyN3aWQwS0woUYfbdpzv+FIQNkabc/txycjwmBBzPYz5l+a8N/Q
	dWqDgk24AY3Xuy8j/vJS3DNZkMKdd8cbQDvo86UPc0NlDABLjlUdO6kxIeOvVKBI1EAanWhzIOk
	NownMoQ/MHngNE4Sv5UJ5liIx2bkyDtb9fbn2feYizkvC+7UbTP3xOX4RRTj3v6fny6erPS2abu
	q3cpGojSTwtyd0GI/Ang4QMa9XvG+ZVWdg/UZM2CFtKrnd0zsWwKI9gjAxO7AGtiM+XAmCBnLOx
	sKiu2i6Sx0NBTvt5k4PCMNYlXhJGQDO2yItE1tRk3gV2DJav/naCQ28EvgaLy6/czD7Plpo8vQ4
	Q==
X-Google-Smtp-Source: AGHT+IGR+CaGRepCgY9abJOUDZMtJSLpLAxIBXYfl3hSOsk7LXj9GzOPlhHY0Won/RR6QmkpGOV9IA==
X-Received: by 2002:a05:6000:615:b0:42b:41a6:a670 with SMTP id ffacd0b85a97d-42b59394029mr3665245f8f.54.1763132277621;
        Fri, 14 Nov 2025 06:57:57 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f174afsm10192785f8f.33.2025.11.14.06.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:57:56 -0800 (PST)
Date: Fri, 14 Nov 2025 15:57:54 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonas =?utf-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 22/23] ARM: tegra: add CSI nodes for Tegra20 and
 Tegra30
Message-ID: <6ec4sw2c5rs2s4akd55vacveloiyc7ehbhouz2mqs2gy2w7v5d@rqxzhxcgm2ns>
References: <20251022144930.73272-1-clamor95@gmail.com>
 <20251022144930.73272-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xekcx7ux3cabz2pl"
Content-Disposition: inline
In-Reply-To: <20251022144930.73272-2-clamor95@gmail.com>


--xekcx7ux3cabz2pl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 22/23] ARM: tegra: add CSI nodes for Tegra20 and
 Tegra30
MIME-Version: 1.0

On Wed, Oct 22, 2025 at 05:49:29PM +0300, Svyatoslav Ryhel wrote:
> Add CSI node to Tegra20 and Tegra30 device trees.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra20.dtsi | 19 ++++++++++++++++++-
>  arch/arm/boot/dts/nvidia/tegra30.dtsi | 24 ++++++++++++++++++++++--
>  2 files changed, 40 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--xekcx7ux3cabz2pl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXQ3EACgkQ3SOs138+
s6H5FQ/7BNrS2X7EchthFaqJs0Itrm1KN9MujAl7hYVvTbvyozWCOEjKbFN4QX/R
1+8mcxFJxc5TtgvW16xQ+mePTyN2N7jxL1TxRT7XCZL5Tp14zhdK9zDoQK/1408r
0dw0xy7PAzn9uj8EYX/dfrKT9rsGy0Nc97UyGoBE0/oTU/XHYAoPev2JyFSCqaHn
sD4JvD6tliCPcRZkdum6WkajMFarxmgx72sJ5jLhOzzsT7/vcJyb12gVN94OtK6b
6kASWMvl+1YQPbxWk/iSSBYUwlvoG794KpTPyhEzezvigRJkLO3jSSCzCplJ+K9i
IVfmJlnaaOONvQZVULWL4Bn4OplAnDBaqi8AUwGa5QjlgEEc81FczmuU4KAj+5Zx
mIhy2Bd5hMjqvSyKFXiDd+4QlRzNHsC3dacBktMu4EH+KC3DVKMTQ3/+7yyXqcc3
ne4wp7IJVQ9oEsPxr1e0GKPkDEd4iz10UaDCHZKFvDzEwrOkkN7vzUF4tndq1/Av
+fz4pjf3DCJ7NMc1fs/kBabrbTmHbTqAkIot26EKaLfrogrGlGm/smu32t7CrzWq
dY17/9eNoHdrPC7o/kncXM3oxYGrh2Bw1OFtF9RL5mLCxSTLOKAkqZZv5zHTLEAg
MYnh3JVBfN/JUn8Y5x9LTYlIvap2zYy3Rss6uFmNUcMWhjBqhsw=
=/CC6
-----END PGP SIGNATURE-----

--xekcx7ux3cabz2pl--

