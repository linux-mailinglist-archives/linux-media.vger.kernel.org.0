Return-Path: <linux-media+bounces-33031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C4BABF63A
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 15:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 263C24E7F15
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 13:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03EEE2777E4;
	Wed, 21 May 2025 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jB7m7lEq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D685238C04
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 13:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834581; cv=none; b=k+4aS6TuJqkRLWvUByGUfXIAKN1d7icziDinbIGBwGS9SfFfO3qfTmocUdrwMvluj+vJGJEZXAEoU8oQJOztpacQ5a4Kog0Jz732nYCs6xMmJAvRiQBvcEbONuAiwgguUxcenxe2QSa8N60LF85T7CbV5T27KDF6QEwqAIdUrsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834581; c=relaxed/simple;
	bh=FVc1lT+6MUgP+aqATKpAccsnoaZ/PgmLo8/TCMrPuuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hi9Ls0oM+KS3H2p/iO0Dja7RjZHBL6u+MewjMQ/NIaidLMdnHsNXkReDa3PHCj1udJqVLNhYvssOctfZwKKsQ0vNUu746pfRi0J83kzAc1MPuQNPxTxPihHFaXhOE5y9LeojJCBgqxH1fgCIyBhuLDQsf1yyjqaloRnqVTEgfdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jB7m7lEq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=sREZ
	jNvnTamxNsDE//SKr3Dk4siUClTKDShNmscMEaw=; b=jB7m7lEqubWg8y2Ug7Tu
	7TqbVefY6Dsmmuv3yRdeBOgG8X+vGTVUS/4AaycBthRjjJ67kzlhB3LHOHXgQaDO
	9XtZhZux5WxkPmZRF3q/OvXaW1X4GSHByBUkncm/DBqe1v5blNKFcLND1NHUlwn3
	sic26f0rgGOoAdV1fYKlTY5XbTPeD9ttYPs57hJFXJwUIJlsuVeWufWl+NFQWXUf
	RTM5rsEJaIrfJ9cdJ+22aQzeJVUMCVv/JTP2P6JJ5DGIDIYIb/yRq/vOadeo1tOv
	7Gk2LFgzuWIKJ3bXMIZr3XFXJ7TmFraa7CufbEFyuiDlfkz0gwNUIYHA4C41PDvU
	jA==
Received: (qmail 3285083 invoked from network); 21 May 2025 15:36:14 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 May 2025 15:36:14 +0200
X-UD-Smtp-Session: l3s3148p1@K3TtcqU1bslehhrc
Date: Wed, 21 May 2025 15:36:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+721071c10f3c7e4e5dcb@syzkaller.appspotmail.com,
	lvc-project@linuxtesting.org,
	Alan Stern <stern@rowland.harvard.edu>, gregkh@linuxfoundation.org
Subject: Re: [PATCH v3] media: dvb-usb-v2: disallow 0-length I2C reads
Message-ID: <aC3WzokLRhxJ1t9M@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+721071c10f3c7e4e5dcb@syzkaller.appspotmail.com,
	lvc-project@linuxtesting.org,
	Alan Stern <stern@rowland.harvard.edu>, gregkh@linuxfoundation.org
References: <20250521131752.2566007-1-n.zhandarovich@fintech.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gQiwaaZdNNFghSHu"
Content-Disposition: inline
In-Reply-To: <20250521131752.2566007-1-n.zhandarovich@fintech.ru>


--gQiwaaZdNNFghSHu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 04:17:49PM +0300, Nikita Zhandarovich wrote:
> Syzkaller reported via syzbot a warning (see [1]) that occurs
> when the fuzzer manages to craft a I2C transfer with a 0-length read
> request. This in turn leads to an attempt at execution of a
> USB 0-length read (which is forbidden by USB protocol) leading to
> it being interpreted as a write.
>=20
> Enable I2C_AQ_NO_ZERO_LEN_READ adapter quirk for all devices
> managed by dvb-usb-v2 thus forbidding 0-length read messages
> altogether.
>=20
> [1] Syzbot report
> usb 2-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0
> WARNING: CPU: 0 PID: 5845 at drivers/usb/core/urb.c:413 usb_submit_urb+0x=
11dd/0x18c0 drivers/usb/core/urb.c:411
> ...
> Call Trace:
>  <TASK>
>  usb_start_wait_urb+0x11a/0x530 drivers/usb/core/message.c:59
>  usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
>  usb_control_msg+0x2b3/0x4c0 drivers/usb/core/message.c:154
>  gl861_ctrl_msg+0x332/0x6f0 drivers/media/usb/dvb-usb-v2/gl861.c:58
>  gl861_i2c_master_xfer+0x3b4/0x650 drivers/media/usb/dvb-usb-v2/gl861.c:1=
44
>  __i2c_transfer+0x859/0x2250 drivers/i2c/i2c-core-base.c:-1
>  i2c_transfer+0x2c2/0x430 drivers/i2c/i2c-core-base.c:2315
>  i2cdev_ioctl_rdwr+0x488/0x780 drivers/i2c/i2c-dev.c:306
>  i2cdev_ioctl+0x78a/0xa20 drivers/i2c/i2c-dev.c:467
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:906 [inline]
>  __se_sys_ioctl+0xf1/0x160 fs/ioctl.c:892
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xf3/0x210 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> ...
>=20
> Reported-by: syzbot+721071c10f3c7e4e5dcb@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D721071c10f3c7e4e5dcb
> Tested-by: syzbot+721071c10f3c7e4e5dcb@syzkaller.appspotmail.com
> Fixes: 776338e121b9 ("[PATCH] dvb: Add generalized dvb-usb driver")
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--gQiwaaZdNNFghSHu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgt1soACgkQFA3kzBSg
Kbb6CBAAl2NC3Z2B0lqNl3MImsZfKKawyrNKVPf6PhYBaU3KQdhfsdH/7MZhimHH
hexO3spyem6FGFhWyawF3RxcBTRJTkVDjLB0wQe/GwhyHxWxUKfBtV8JpWIzirkj
46VSfi8FAKQjSsX83qLg9a06SHYU2TTbXVe8l3F0KZENGsTpEGTULJ/QxSSqz5V6
OfiF22H/vsrSlQ0xc0pHmQw4VlD/CUmvLvyoN6BlDSM6bligeIfbuYRbX2fI6afT
ZqEGQfFbVXfJvPw5Ts78i3ri8nT4NIDPbDPwy5xqp3t4Liq3cHjR4/qZMEfkHRYr
QYoou7jzIRusl22tdWosX+qFXFJuUeGsuuXXpDFn5WXkZCMapW8XeUlzPEYylZzy
0Ah+r44QG+g60t5gQgZposIfYIoNCw2wChR/do266IrvMFJGjpPRkeoLvKv1FGR7
vudD8129T3V5+lvYXT+sri8QlaiSHzH9Emxp5zVVWGn/nZtuT9H0ldkzRQubZOrZ
rngkt8bUS44ELsFXTmxaVRK10kWdyrX+WNTs9G1JWgyQLZSHISymOd2xqWGlB+Xy
FROg0Kl+gAxYzgTbs3gLg0h8PzbUsLI+Eyqo0PlpdIZkzCqAhr8tZJlN+AutiHT6
ulMvqQNDMnYYaPkq3yxmGf862O43muBqiJODeGgaTSy7DvgN+Ss=
=3aKd
-----END PGP SIGNATURE-----

--gQiwaaZdNNFghSHu--

