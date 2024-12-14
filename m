Return-Path: <linux-media+bounces-23423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB1E9F2150
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 23:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B356A165F9C
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 22:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3641B4F24;
	Sat, 14 Dec 2024 22:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="O9jqzL6w"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08626374FF;
	Sat, 14 Dec 2024 22:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734216332; cv=none; b=HOoizLCz246x7MSgfIHGiqF0Cm45htM6adGusT8Wc2CUdejhnbOUyH0QvtystFYXKSNezYJ07JVpDdUs/Jhg/TW9fKfMYf2dK/+4qHHvjUCsjYN+sGz8b0viJVg6RoNfB8wRzv25FczrKLeByk6KhD7Ud5aHq52rtTQJ7JnDbG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734216332; c=relaxed/simple;
	bh=vExFBKYFpDLJb8wWLmXcMEyc2Ufj5kH4bbgxDRfqNbw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oKwbiifg1r82W0rJl6JJYC6FZ+CajeP2Wq5XvzjAFUMjz/hJVmxK9nHvQBjSSsODc+1j+1S5EsEsW3mpLmi5JzUnZa/NVK934Q+OufVGiR4nbwL7Dwt4VTcKq5l2ynMM3pvjCrysEruJxR6GA4svzaSusVtBcSYPzzNjUh2KU2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=O9jqzL6w; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=d/PjcV+jDCKYzSJwV8DzSKIy1c3zEyLabtw0gF3Jwq0=; b=O9jqzL6wF2cCf2IKPhSXMfi9Dw
	nKkxbRMs1vDBGCK9TXP6BA1ioqngrjSUMXJV6HmdZJJafnI35wq8dB0tw11l+PvlEY++dT6jrGZbc
	Ji21jmciksTgAcOHUAsEqiV9knQxChDjgHUy+J8je2lMD1PRv+lY3HdclBBO3lgVw57gK/gGd+L5/
	huqrwdtCKGEO/hUYQ1H8f2coHgSmPg5jUPvuffOpmsMu8Qsy6iMJese5yRFp8MS9jEZWCIlyFhwou
	FxBZB1lJVMmRhw85Er2qlGHd9wFaxhS1bsxL4ofAVLsPcPq1qotio/YzlJMjDKqnm51g2YKxa8r3U
	CfKJgOkw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1tMasv-0000k5-2A;
	Sat, 14 Dec 2024 23:45:18 +0100
Received: from [77.64.252.106] (helo=framework.lan)
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1tMasv-000Hdn-1K;
	Sat, 14 Dec 2024 23:45:18 +0100
Message-ID: <8255eb1a877a339a457979c8b4fc831f6fc5cc01.camel@apitzsch.eu>
Subject: Re: [PATCH v3 07/12] media: i2c: imx214: Add vblank and hblank
 controls
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda Delgado
	 <ribalda@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Stevenson	
 <dave.stevenson@raspberrypi.com>, Vincent Knecht <vincent.knecht@mailoo.org>
Date: Sat, 14 Dec 2024 23:45:16 +0100
In-Reply-To: <Z1g1afPM1RRwD_EH@kekkonen.localdomain>
References: <20241207-imx214-v3-0-ab60af7ee915@apitzsch.eu>
	 <20241207-imx214-v3-7-ab60af7ee915@apitzsch.eu>
	 <CAPybu_0Bdc03UrJNO42S1fBTvpuHUUExvkR1ont7VKdw2XBuKg@mail.gmail.com>
	 <CAPybu_0Nk+p1rikH_t_zpEHx=KGnXfG+npr-XEnwtA4EnfJjuQ@mail.gmail.com>
	 <Z1g1afPM1RRwD_EH@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Authenticated-Sender: andre@apitzsch.eu
X-Virus-Scanned: Clear (ClamAV 1.0.7/27487/Sat Dec 14 10:38:46 2024)

Hi,

Am Dienstag, dem 10.12.2024 um 12:34 +0000 schrieb Sakari Ailus:
> On Sun, Dec 08, 2024 at 10:19:51PM +0100, Ricardo Ribalda Delgado
> wrote:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 state =3D
> > > > v4l2_subdev_get_locked_active_state(&imx214->sd);
> > >=20
> > > Sakari, I see that other drivers assume that the active is locked
> > > in
> > > set_ctrl. Is this correct?
> >=20
> > imx214->sd.state_lock =3D imx214->ctrls.lock;
> >=20
> > So I guess it is fine :)
>=20
> Yes, it is.
>=20
> Please also run this on the set:
>=20
> $ ./scripts/checkpatch.pl --strict --max-line-length=3D80
>=20

there are a few lines that exceed 80 columns:

WARNING: line length of 85 exceeds 80 columns
#163: FILE: drivers/media/i2c/imx214.c:576:
+	imx214_update_pad_format(imx214, mode, &format->format, format->format.co=
de);
--
WARNING: line length of 81 exceeds 80 columns
#88: FILE: drivers/media/i2c/imx214.c:983:
+		return dev_err_probe(dev, ret, "failed to set xclk frequency\n");
--
WARNING: line length of 82 exceeds 80 columns
#138: FILE: drivers/media/i2c/imx214.c:1039:
+		dev_err_probe(dev, ret, "failed to register sensor sub-device\n");
--
WARNING: line length of 86 exceeds 80 columns
#491: FILE: drivers/media/i2c/imx214.c:359:
+	{ IMX214_REG_EXCK_FREQ, IMX214_EXCK_FREQ(IMX214_DEFAULT_CLK_FREQ / 100000=
0) },
--
WARNING: line length of 83 exceeds 80 columns
#177: FILE: drivers/media/i2c/imx214.c:730:
+		exposure_max =3D format->height + ctrl->val - IMX214_EXPOSURE_OFFSET;
--
WARNING: line length of 85 exceeds 80 columns
#85: FILE: drivers/media/i2c/imx214.c:1231:
+		if (bus_cfg.link_frequencies[i] =3D=3D IMX214_DEFAULT_LINK_FREQ_LEGACY) =
{


Is the strict 80 columns limit really necessary, as it would decrease
readability?

Best regards,
Andr=C3=A9

