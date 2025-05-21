Return-Path: <linux-media+bounces-32995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 790E7ABEFA4
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 11:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8328F8C1DDF
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 09:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9976823F431;
	Wed, 21 May 2025 09:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="F99ebRGE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBFD238D56
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 09:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819499; cv=none; b=DMCMQn1WRY1ZIXlBvzOWf/nsiO0+8z8Y43R4m9PiJhqbS6cZ4nvYQF0DZNHBJ+JkwKYi9OFQiRTiRrzTlfu8sqwp6BOOG24W0Xg0iqiM4JeXa1JyaynCBH7EBc+T9oPJLBJnWP/BlBnvZohTcPNCZpWbkQHzWKNQPBPB8He/kIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819499; c=relaxed/simple;
	bh=iakdG6KwvobkuhvDfUF9aRMKbAPkd6Vs3yyXNEpAwTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/o2ebxtRH8A8VJc4cJVVos7YqlJlLVUJj5LmNBn9ltYF08yVGB2qpB1yY1cn+rcStZ0HtDl/uO96yImkNJei/jYJBJdotXu2/coGP/P76y956L4o8D3yC6GOt5XNCvgwLiZwsU5IRVHLEDeTyn1mNeoxnH7DJ+XqN0jZwOqZJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=F99ebRGE; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=91Dh
	YZDxbU9FzEXqQj0AuCBK5CtwWDt8E4H7Iw+sYog=; b=F99ebRGEHYIkHGc+fATJ
	Svu6LRNqI5Z7/Mi/HKWRBynQlemRGVyn2bN2NrTGnrqR0FqsnEynV25o2+3di3/e
	ghFzqu5Pz3AsQgcbnFHLp/Otu4S5wujsEuSRlAVXOKa7yQwOHC9hJoMGZ1kL8Drz
	wSXCa1KamjNwTtf1cJnPW2mz3JRwQ8tM+jD4kT5NnEgCgYOykGzJ1Cr0bGZVmjJ8
	bSjXe3q2DXqeZkA+sYCqQ4MCacsElEEw1Lq8FwavVZ3r7XwFjU1g+HKGAWzjpY4Z
	J9BqEmJYpTmK8PhvM38+yO4rH+eh5L2nFsx/53H9NO/++Gl+vX9wTeznsrRHwC2U
	rw==
Received: (qmail 3203021 invoked from network); 21 May 2025 11:24:44 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 May 2025 11:24:44 +0200
X-UD-Smtp-Session: l3s3148p1@HwaB76E1rrVehhrc
Date: Wed, 21 May 2025 11:24:44 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+721071c10f3c7e4e5dcb@syzkaller.appspotmail.com,
	lvc-project@linuxtesting.org,
	Alan Stern <stern@rowland.harvard.edu>, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] media: dvb-usb-v2: disallow 0-length I2C reads
Message-ID: <aC2b3MWNOtLyzIIr@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+721071c10f3c7e4e5dcb@syzkaller.appspotmail.com,
	lvc-project@linuxtesting.org,
	Alan Stern <stern@rowland.harvard.edu>, gregkh@linuxfoundation.org
References: <20250520135216.2509505-1-n.zhandarovich@fintech.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n7dBzWG5Q4QWs8Xi"
Content-Disposition: inline
In-Reply-To: <20250520135216.2509505-1-n.zhandarovich@fintech.ru>


--n7dBzWG5Q4QWs8Xi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nikita,

thanks for your patch!

On Tue, May 20, 2025 at 04:52:15PM +0300, Nikita Zhandarovich wrote:
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

> driver, see [2]. Alan suggested a solution which hasn't been committed
> yet in [3]. Mine is essentialy a copy of his, only for dvb-usb-v2

Oh, it is not upstream yet? Pity!

> devices. As far as I know, no I2C core level protection against
> such issues has been implemented either.

Per the discussion with Alan, there can't be an I2C core protection,
sadly. Only drivers using ctrl msgs with no internal header added to the
msg need this quirk. The core can't know this.

> P.P.S. While this driver seems to be orphaned, I decided to
> send a patch anyway, perhaps someone will deem it worthy...

I agree. I once found 4 other drivers needing the same treatment. I
should fix them right now.

Thanks for fixing this one!


--n7dBzWG5Q4QWs8Xi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgtm9gACgkQFA3kzBSg
KbZeQxAAscTLbcLkDLle+24Mu+0d35ZkVymgQrMSUP4SqqYpy8+Ue0UPpGEhK0u0
thZdxftmPqgkws9CzTtzz9WUB9QoInkgcw4AmxxeJws/2v/Ho5gPghsm5Gq+3W1f
SNAejs43uxH0OAwBWqC6XyYLnhzkIxGE5j11ouHiw0QGALXmJYok0cD1Dkp407nR
EwUAMMC8KRvZwiS0cRKKht/gAc8Ox0pKKPpvWGYIYaifjLa9hOzbrRIi4jlYQ2+5
LZCt4I9oN8oksltYsR59Dmskc/3DIDjaSj3eRyzAZBVJtDS9R0MmwtH+5delaFTe
BDhFoid7P8fnEtz9qa90crh8vdcyurErdT7pUs3N+gmXyayQPoLLVn9vN5sjHDN/
lrmDpF7t0XME73RG/1iPAWRh5XOi3g3yh16rxBObyY3u9f3oabDKB0CR9H0hPjve
S90mSLj210JSRrLt/lhjD8Vc7d5XMegIHhGawySxpe3KhiCtUke4/4GjaAanPV4Z
MzYD1bET8Q7g+lhojefGCYcPipw7Px7RBdzyEMKa6yszolKn7gNEA+80mfmhuKOc
mmnh6lNxa8HAE3pgk4N/LX1Wrxw37tr8FFFCQmcbasQEvXjXrWd3ieDQ77JRBBbT
YxH0hxVeNOmp6vu+bOOndsOumuj5/IGsQtO5AihVhKG7mtcvN+U=
=Vszy
-----END PGP SIGNATURE-----

--n7dBzWG5Q4QWs8Xi--

