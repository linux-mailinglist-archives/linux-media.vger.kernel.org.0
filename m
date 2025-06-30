Return-Path: <linux-media+bounces-36280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17478AEDD3C
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 14:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EF92189C8DB
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 12:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B0328B41D;
	Mon, 30 Jun 2025 12:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="OJlTGLHc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fNsN4DaM"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DD7285CA4
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 12:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287180; cv=none; b=vERdfQTFEgGTwKipIiIf0+iAzyC9MgZDnkrJQ56Mv6jdR4nCixz7ypCOUI/JCnkE8Z+rCEYTobRpQKvw2Qd4aTT9oEEcCt+Dd4XYCrcpWZbRsG+tMt/gw6bZV4zv2wrs1VV9gNN+KmqwtgoGFt4OEtd+jeDIyVcKNW7m4ZaowVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287180; c=relaxed/simple;
	bh=M44bk2bwCVBrAvn7O2ExAoP2lKoHoBEuE1OK+X3uIAg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gqcfeVXmhBAovvx4odk2XtCLHfvIxQrceIR8bCvZ2UcgTwOXXtTEMmTZBnrlW6eTXHHXtTiibOo2KUkUrN869rOSZDjNP51fpMGhchusPwVMIn6FbcnNyRbJM0V5F3kKdGDrihTl7CFlPb4RWOIcbVm6eopRCnzbkU7BXLxHU7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=OJlTGLHc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fNsN4DaM; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 9E6ECEC0469;
	Mon, 30 Jun 2025 08:39:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Mon, 30 Jun 2025 08:39:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1751287177; x=1751373577; bh=nk
	dRNfd3lE0yat064NDmAlRKJ4WAtSfHUvnZtT3K0T8=; b=OJlTGLHcBrUthoE6+P
	iSUpLc0NF3jjYAwoxqzCS0jJpEmgMxLWSLjxYWPL7wlJc2OMVTdSPbVlt4XTQCHl
	STtBdMKp3imU0ORJxfzIyR7RyoKTV6CYvGd92lUd0TNmfU/2qMdo7MSl0qRvUNNO
	VqRKxfFayXBaidLvl17DR8ZVSbqm5WRi9v94Bh8WKTmdvfFrng9Mterqblgd3Kr0
	L5z/xbRv1XUJWAsdWpjNP/1w3nBBmFPgFITDNuDeVTf+8Ezp+o9k+OlfgdVdQGi8
	a9Cu1YqggYeVvKqo0hq6G2h0bwhvmYH21Nh9TwWy98rhnzWg+HnAo5DAUEP9eTvi
	DRBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751287177; x=
	1751373577; bh=nkdRNfd3lE0yat064NDmAlRKJ4WAtSfHUvnZtT3K0T8=; b=f
	NsN4DaMFOgbRdUpfb3+1/Ao1JKUSJVrPZIe1QEkODg167jhttr5rzShtwZ+O6dgH
	cv2LyHuXLBjgM4RViihs1CWXG/iFD0Nhm6VUNP1kqJDxDNj4v/ZChjaWVgZdg0IE
	nQ362CFMIxWw7PhfMQ2DBuOxULyH1EoyF0KfbA0mkpmwrXvRId+CL9hMMzwXGgp4
	lO5nb+lQx3TjAz+E9mzqA1Idnc3BqtD0nna3Kv88N8ecF3Qxjk2LMKWYji/3wTiC
	FB3E4p3KRZHvBAw7KEsAj+x7Ct5YGGBTzNrYso6Y0v2Kpe2bByQKg7SbFeeihYXD
	5iikCb2MV7q9TQXCYFbkA==
X-ME-Sender: <xms:iYViaA9B_3XctE1-E_DTyvFUvu9g5XIG-Nkahz1HMXmD3zfUxVOqHA>
    <xme:iYViaItJ7NU8lslXXSRaUt4_42LerwFrLn5ESFVJ6XBJgxVue1cB6obbujlRdAdcy
    2zh9OBinDvogQ>
X-ME-Received: <xmr:iYViaGCKMq21yD88KnHueVE3G4ux3NCh4pVXyWkVbx9TytpSqOCVfqPiGxNuKRaJlzwqs5jVQa8eQxw9LE7AYmuoC7nGsP7axAM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudejvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfggtggusehgtderredttdejnecuhfhrohhmpeforghrvghkucforghr
    tgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeehveetveetvedv
    udffteeugfeiveejkeevgfetvdevheefgefghfduhffhuefgteenucffohhmrghinheptg
    holhhlrggsohhrrgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehsvggsrghsthhirghnrdhrvghitghhvghlsegtohhllhgrsghorhgrrdgtohhmpd
    hrtghpthhtohepughmihhtrhihrdhoshhiphgvnhhkohestgholhhlrggsohhrrgdrtgho
    mhdprhgtphhtthhopehshhhrvggvhigrrdhprghtvghlsegtohhllhgrsghorhgrrdgtoh
    hmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehkvghrnhgvlhestgholhhlrggsohhrrgdrtghomh
X-ME-Proxy: <xmx:iYViaAeXOjyzoodZU0aIXjq1wIf60mzo6NHWCKHISO43JFWLJk4scA>
    <xmx:iYViaFNcWtEowFT2spk7wDPXAf4BfmPTFTxL4wBiCfDXUW8Wuxw-Rg>
    <xmx:iYViaKl91ukP7ucAp_9d8pcPWh_HS-Ip2mkmIzst8xCHXkLlBDVy0g>
    <xmx:iYViaHvooh0_SDhfg_koJ9hpazNSVqwq-epzXwQW1orqSgTS0D1UAg>
    <xmx:iYViaFLS7QwD0g-6Wav_yNNXTm56BjLt1_WbaUAOEEwRe4QOpKNxpSHg>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Jun 2025 08:39:36 -0400 (EDT)
Date: Mon, 30 Jun 2025 14:39:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Shreeya Patel <shreeya.patel@collabora.com>
Cc: linux-media@vger.kernel.org, kernel@collabora.com
Subject: "signal is not locked" with HDMI RX driver on RK3588
Message-ID: <aGKFhDmBwYp5KV3k@mail-itl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cE09OWMmQ2hMQDGg"
Content-Disposition: inline


--cE09OWMmQ2hMQDGg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 30 Jun 2025 14:39:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Shreeya Patel <shreeya.patel@collabora.com>
Cc: linux-media@vger.kernel.org, kernel@collabora.com
Subject: "signal is not locked" with HDMI RX driver on RK3588

Hi,

First of all, thanks for all the work regarding upstreaming the driver!

I try to use it on two boards:
- Orange Pi 5B
- Rock 5B+

In both cases, when I use the upstream driver in 6.16-rc, I hit similar
issue:
1. `v4l2-ctl -d /dev/video2 --set-edid type=3Dhdmi-4k-300mhz` - this works
2. EDID is properly presented to the device on the other side of the
HDMI cable, I can select to use that "display"
3. But then, the hdmirx complains:

    v4l2-ctl -d /dev/video2 --query-dv-timings
    VIDIOC_QUERY_DV_TIMINGS: failed: No locks available

And kernel shows:
[ 4033.823023] snps_hdmirx fdee0000.hdmi_receiver: hdmirx_phy_register_writ=
e wait cr write done failed
[ 4033.847027] snps_hdmirx fdee0000.hdmi_receiver: hdmirx_phy_register_writ=
e wait cr write done failed
[ 4033.870976] snps_hdmirx fdee0000.hdmi_receiver: hdmirx_phy_register_writ=
e wait cr write done failed
[ 4033.894998] snps_hdmirx fdee0000.hdmi_receiver: hdmirx_phy_register_writ=
e wait cr write done failed
=2E..
[ 4061.975400] fdee0000.hdmi_receiver: hdmirx_query_dv_timings: signal is n=
ot locked

In this state actually capturing video stream doesn't work either.

I tried also rockchip-release branch from
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux (at
33755850faeb0e53e634390d147cc261a60d2898) with the same result.

If I try the same with the 6.12.13-current-rockchip64 kernel from Armbian,
it works fine. I tried to compare the drivers, but there are quite a few
differences so it's hard to spot any obvious issue (it could be also an
issue somewhere else...).

Any ideas? I can try to add some debugging info or test patches, if you
point me what would be helpful.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--cE09OWMmQ2hMQDGg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhihYQACgkQ24/THMrX
1yyWPwf/TmMbSuUqb3wb5uGkM53ZeimXPuVcv/MVJPSuu37YDAYFRJJeps0bAacq
+8zumrK2uOLI30ykLOaAtaSToYRIdrGLQ62fcXDBYHrGlMqDWOuFjHjKGgDQCsj4
Y8W3LP4teYF34BbWMi1J5Mf5DLkyHknr3x7u9Ygz08v1kULChFsjuJljA2oHMet+
G2s4s6pK5sJlvWkowGKZJUk6KaO5vnFahM+uzNU27Qgy8HNr42KEc+7k/ejm97nC
cCRNELYJ6YCbyYYIOZgGKTKcAlIwlvoqle/a37xV85snC/lT5L6eOra9LrFufMte
G2qOQKBpU0niHcNlWTfT2bY8aQ7LtQ==
=Wltx
-----END PGP SIGNATURE-----

--cE09OWMmQ2hMQDGg--

