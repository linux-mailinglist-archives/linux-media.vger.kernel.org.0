Return-Path: <linux-media+bounces-31603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1618AA755E
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 16:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CAC9175AF5
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 14:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E417B2571D9;
	Fri,  2 May 2025 14:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="ZchOEboc"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00A12561B9;
	Fri,  2 May 2025 14:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197629; cv=none; b=MKMiJ4dStGxmwXaOcbiMsUi0fpLadU8elFKMXxqu3TomDmCspT+OsaQwbkwDz4dOR0TcynPBI2eGyA862ZoaqrSEmpq+Uu91Vv5e7zdqseu2+L4YS02WMSBVJxUBZrew1eE3/53Ks5agYGpEDEAXEDLvoCH2gFjEmZCnwAa8Ehg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197629; c=relaxed/simple;
	bh=j7pcQFJL7OUxmz0B8y6Bt9940twOZpQzdCtFeh/VAoo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n9jhJViY0u/Yg5mVyqOCRKQPjnMjFsTXYzrXX/2dFedPv63C6K25TYKIwSX3d0VkM++sktYcd+KkjqCrZ9USuyXlCyT/M03fYLP9PsqjUDtPRuL6tH4R/cR3zBWI+s9mdNuIYN++VHDC7aGLY4WLVmzSRYr8H++uErTaX9Qds78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=ZchOEboc; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=j7pcQFJL7OUxmz0B8y6Bt9940twOZpQzdCtFeh/VAoo=; b=ZchOEbocSQvTr75lkoncKvSA5N
	5bVOp6uB3zaqsgYicgUyZn3sGgxz7SzV+4Luye0Y8DuazoXGX/N27NzseBsCV19FIdwk6GXIacOQ5
	lrN4CnvxrKymbAUXUfzFLaYzR8wNATe+Phs53PYkAelSgh2TiKo/Vr1p78B8/WRhBkT2UtCCZj+Iz
	lsl7qWfsZf1PzGLrtmkOkx39VLhXzIfESMVpZrcln1+eV8AeB4sVh/vWmOu1rhSme1bXbN5aV/Gdm
	nXollf85kadF1H2E8QWhYvPmiW1MTbqzpceVv7YVvp6wATUeB+iSniluNSJUkcywqjUcwnur9huwV
	+gZe2L+w==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1uArLG-000LDQ-0l;
	Fri, 02 May 2025 16:26:18 +0200
Received: from [92.206.190.59] (helo=[192.168.1.141])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1uArLG-000Mtf-04;
	Fri, 02 May 2025 16:26:18 +0200
Message-ID: <cb3f684beec0dfd3c06e68fe57ffee9e7efc81dd.camel@apitzsch.eu>
Subject: Re: [PATCH 0/4] media: i2c: imx214: Add support for more clock
 frequencies
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ricardo Ribalda Delgado <ribalda@kernel.org>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 02 May 2025 16:26:16 +0200
In-Reply-To: <CAPybu_0VwOTNOgLg3967fzBArg6tPTdWvHFMo6xBjjdnmx_+dQ@mail.gmail.com>
References: <20250415-imx214_ccs_pll-v1-0-d3d7748e5fbd@apitzsch.eu>
	 <CAPybu_0VwOTNOgLg3967fzBArg6tPTdWvHFMo6xBjjdnmx_+dQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Authenticated-Sender: andre@apitzsch.eu
X-Virus-Scanned: Clear (ClamAV 1.0.7/27626/Fri May  2 10:32:14 2025)

Hi Sakari,

Am Donnerstag, dem 24.04.2025 um 08:28 +0800 schrieb Ricardo Ribalda
Delgado:
> On Wed, Apr 16, 2025 at 5:22=E2=80=AFAM Andr=C3=A9 Apitzsch via B4 Relay
> <devnull+git.apitzsch.eu@kernel.org> wrote:
> >=20
> > The imx214 driver currently supports only a 24 MHz external clock.
> > But
> > there are devices, like Qualcomm-MSM8916-based phones, which cannot
> > provide this frequency. To make the sensor usable by those devices,
> > add
> > support for additional clock frequencies.
> >=20
> > This series supersedes
> > https://lore.kernel.org/linux-media/20250308-imx214_clk_freq-v1-0-467a4=
c083c35@apitzsch.eu/
> >=20
> > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Andr=C3=A9 Apitzsch (4):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: imx214: Reorder imx214_parse=
_fwnode call
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: imx214: Prepare for variable=
 clock frequency
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: imx214: Make use of CCS PLL =
calculator
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: imx214: Read clock frequency=
 from device tree
> >=20
> > =C2=A0drivers/media/i2c/Kconfig=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/media/i2c/imx214.c | 262
> > +++++++++++++++++++++++++++++++++++----------
> > =C2=A02 files changed, 205 insertions(+), 58 deletions(-)
> > ---
> > base-commit: 5b37f7bfff3b1582c34be8fb23968b226db71ebd
> > change-id: 20250406-imx214_ccs_pll-e4aed0e9e532
> >=20
> > Best regards,
> > --
> > Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> >=20
> >=20

Any chance, this can be applied for the next merge window?

Best regards,
Andr=C3=A9

