Return-Path: <linux-media+bounces-27985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48515A5A96B
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 23:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BED907A7841
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 22:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009001F4C88;
	Mon, 10 Mar 2025 22:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="K/TA5oJF"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1084A02;
	Mon, 10 Mar 2025 22:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741647109; cv=none; b=tT5uT24pLx+Y1bOnfkaxNWaUYPY+6i41A57luy2fHe9iJ2YRYJg4rt9aavxYjkkIgDRIHnzPPUxf/rtmH2lvgSK1GTcjNycp0P/7MGQCB4vvRAaKUI32nVcZ+jQ1gEOEAXLNZxArKAy0OA70EOGeWAC1YOkvPYCorsVqiNRuoYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741647109; c=relaxed/simple;
	bh=hMUTidMfkkDJMzZA6MYxS0DzBePJgGcet1BbONPR2OI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o9l59nq9/conXFGLtnUFuZetcQ3GQIRUpBVvOuCkTmvHPCOZ+fxiCd/J/U2/Glde9v0qEEkEYVSFx+Zi3SbV30WqT4AxN+OLcZFmvjZ/xWte2Lk7t7/rkLGTqoNM+6JI3Iot86RKBDH1i33aHXRYuiPCEYOqCzw+VOFRZGk0eus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=K/TA5oJF; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=hMUTidMfkkDJMzZA6MYxS0DzBePJgGcet1BbONPR2OI=; b=K/TA5oJFfr0Brllu+E5D+RUXMB
	UmpxColfXAhqdCRfAPUxJrJnwitibsp7O+bFD13xMcq5h4U03jzzDmy0wDFmNRrTOyS2GLisucKYS
	paolxe9J95AneFtXo08p1nXR4xAn4ujhzhn3dnvpuoTrp2Mj4HoxaW9jkIK1HTlnGhfUEtY9lQeME
	1oyDAbnW94LTYOoXyxicBbEfZtHA8X+oxMjg6wLNr6TiKemXdMACgkWHREKvhWOfcr/KnqkGK/dbZ
	W4dNjuwmYDwzrz1qilTFcyFX9LnT3LWBkXi1Szh3CDIwxeFSqQ0uMAbtYtJsYGg8fq+oKjumhnu5e
	VwN9ufTQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1trliP-0001C6-0J;
	Mon, 10 Mar 2025 23:35:17 +0100
Received: from [77.64.147.108] (helo=framework.lan)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1trliO-0007ck-2N;
	Mon, 10 Mar 2025 23:35:16 +0100
Message-ID: <4c62bb9d5575e9075b39500917e09687d37cf7ca.camel@apitzsch.eu>
Subject: Re: [PATCH RESEND 0/4] media: i2c: imx214: Add support for 23.88MHz
 clock
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 10 Mar 2025 23:35:15 +0100
In-Reply-To: <Z87I2xh0HY-YD_tZ@kekkonen.localdomain>
References: <20250308-imx214_clk_freq-v1-0-467a4c083c35@apitzsch.eu>
	 <Z87I2xh0HY-YD_tZ@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Authenticated-Sender: andre@apitzsch.eu
X-Virus-Scanned: Clear (ClamAV 1.0.7/27573/Mon Mar 10 09:38:09 2025)

Hi Sakari,

Am Montag, dem 10.03.2025 um 11:11 +0000 schrieb Sakari Ailus:
> Hi Andr=C3=A9,
>=20
> On Sat, Mar 08, 2025 at 10:47:54PM +0100, Andr=C3=A9 Apitzsch via B4 Rela=
y
> wrote:
> > The imx214 driver currently supports only a 24MHz external clock.
> > But
> > there are devices, like Qualcomm-MSM8916-based phones, which cannot
> > provide this frequency. To make the sensor usable by those devices,
> > add
> > support for 23.88MHz clock.
> >=20
> > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > ---
> > Andr=C3=A9 Apitzsch (4):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: imx214: Calculate link bit r=
ate from clock
> > frequency
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: imx214: Prepare for variable=
 clock frequency
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: imx214: Read clock frequency=
 from device tree
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: imx214: Add support for 23.8=
8MHz clock
> >=20
> > =C2=A0drivers/media/i2c/imx214.c | 188
> > +++++++++++++++++++++++++++++++++++----------
> > =C2=A01 file changed, 146 insertions(+), 42 deletions(-)
>=20
> Thanks for the patches.
>=20
> Do you think the driver could use the CCS PLL calculator? The PLL
> appears to be compliant. The AR0234 driver will do the same. (The
> sensor might just work with the CCS driver, too, but that's another
> discussion.)
>=20
Using the CCS PLL calculator seems quite complicated compared to
switching to the CCS driver. That's why I looked at the later first.
But for it to work, quirks already need to be applied in
ccs_power_on(), to disable writing to COMPRESSION_MODE, and in
ccs_identify_module(), to change the MODULE_MANUFACTURER_ID register.

I'll check if CCS PLL calculator could be used.

Best regards,
Andr=C3=A9

