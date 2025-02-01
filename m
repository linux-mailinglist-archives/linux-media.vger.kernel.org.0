Return-Path: <linux-media+bounces-25518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6539DA24938
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2025 14:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1138164022
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2025 13:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168191ADC89;
	Sat,  1 Feb 2025 13:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhH62CYF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DC52C9A;
	Sat,  1 Feb 2025 13:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738414917; cv=none; b=YlopLj4wiW1QaFONK4ZCpCYeHYGC+B/LHMGQ8RSjdojSSIuBGyN+zR3jNuuNHGhb1os87ha8cKe0lo0XSOiXt5eCI3ko2okIo0dq41DLoqt2VmYSUP16k30qeWG3MAtPr9KeJ3Ak5yyynwzpEzc8DQlYF8fFTFd3Zg2KXXuB8B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738414917; c=relaxed/simple;
	bh=a+/z8R1r76uA6EAhBK4lC2WDt7gZfGjbHIBM5xRSi9A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hDN/AvW9BNZMB6F3Y9jwcfbiLqtPVGazuWYUQLnmEa+nmhGQf6SWYxYz3wMXw3kjuj12tUzCD9aFj3UADZSoFGidVwxyKGjG5adASVz4Bb5EQhqn0lEwRS0Axo/4tseu5S1tfkqnLuCMetj/7UN0BQSRgbXKmHt5HE+pkcl1s4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XhH62CYF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8817C4CED3;
	Sat,  1 Feb 2025 13:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738414916;
	bh=a+/z8R1r76uA6EAhBK4lC2WDt7gZfGjbHIBM5xRSi9A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XhH62CYFrazNz9SLHHYb33tjFJiegsV4VhtikRGze10qGCksGeWOL1z/XFlBI5TjQ
	 inOeNcawpktLbi3gfaxpcHhDboFHfPrBBxfxYQqm71k+r3UVAuux4rNTftHAR5jzVw
	 rKSViP0lZmkjZa/zLUjfKbcLZ/EHFeDGDcShmjF+l/DmYdZmitpcYCwTYQHZehDNcf
	 Yr/PkQd4hvl/SRRFw+keU8KXQE0Ni6JVO4wV8b2FP0a1kft3Wqk8vlgm86jXAbPFI6
	 17JwgtrkKgqLNmav7oFmMYaoXZOawb25EN745+ubfw3uB8l/fiofW5/E24Wys/7zSi
	 62q5m+I7LFZjg==
Date: Sat, 1 Feb 2025 14:01:52 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: YongSu Yoo <yongsuyoo0215@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Markus Elfring
 <Markus.Elfring@web.de>, linux-media@vger.kernel.org, Hyunwoo Kim
 <v4bel@theori.io>, LKML <linux-kernel@vger.kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, yongsu.yoo@lge.com
Subject: Re: [PATCH] media: dvb_ca_en50221: Add a returing EBUSY logic into
 CA_RESET
Message-ID: <20250201140152.52109e19@foz.lan>
In-Reply-To: <20250201092427.6a09c39d@foz.lan>
References: <20240308121338.1983-1-yongsuyoo0215@gmail.com>
	<eda2a849-c23a-4624-85da-78a2fdef4fe9@web.de>
	<CANXPkT5ggr8VbYdRy+uSnfHxDRES5arJJ8p+ist1CBTm-1xaUQ@mail.gmail.com>
	<20240530203149.1fe881ed@coco.lan>
	<CANXPkT6wxEzX=Seyi-SctkpN17AgeTAWSPr-Yt2kRzD_isAa2g@mail.gmail.com>
	<20250201092427.6a09c39d@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Sat, 1 Feb 2025 09:24:27 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Sat, 1 Feb 2025 09:44:18 +0900
> YongSu Yoo <yongsuyoo0215@gmail.com> escreveu:
>=20
> > Dear Mauro Carvalho Chehab
> >=20
> > I know how to send an E-mail using "....git send-email --to .."
> > But,
> > I do not know how to reply to this E-mail loop using "....git send-email
> > --to .."
> > Can you kindly guide me ? =20
>=20
> Never used git send-email to reply, as it is mainly focused on sending
> e-mails, not being a true emailer: it just sends e-mail: it doesn't
> receive. In thesis, you could download the original e-mail using b4 or le=
i,=20
> then manually write a reply text on it and use git send-email. This is
> easier said than done, as you'll need to take care of SMTP headers yourse=
lf.
> This would require some knowledge about SMTP RFCs.
>=20
> If I were you, I would seek for some other alternatives.
>=20
> Most people use mutt for Kernel work, as it is CLI. There is also alpine
> I haven't used alpine for ages, but it is a decent CLI e-mail client, usi=
ng
> a very simple interface, although it has less features than mutt.
>=20
> I prefer instead to use claws-mail as it has a reasonable GUI, it is fast
> and it is not overbloated with features I won't use.
>=20
> Neither mutt, alpine or claws-mail mangle whitespaces and line breaks on
> e-mails, and they can be setup to not do top-postings.
>=20
> If you want something simpler, perhaps you could try notmuch[1]. I never
> tried myself, but I heard it can be used to reply to e-mails without even
> needing to subscribe to a ML.
>=20
> [1] https://notmuchmail.org/
>=20
> You may also find useful to have a SMTP relay server. Probably one of the
> simplest ones to setup is msmtp: https://marlam.de/msmtp/.
>=20
> I hope that helps.

Btw, there's a chapter at Kernel documentation related to e-mail
clients:

https://www.kernel.org/doc/html/latest/process/email-clients.html

>=20
> Regards,
> Mauro
>=20
>=20
> >=20
> > 2024=EB=85=84 5=EC=9B=94 31=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 3:3=
1, Mauro Carvalho Chehab <mchehab@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=
=EC=84=B1:
> >  =20
> > > Em Tue, 28 May 2024 21:14:37 +0900
> > > YongSu Yoo <yongsuyoo0215@gmail.com> escreveu:
> > >   =20
> > > > Dear Markus Elfring   =20
> > >
> > > Please don't top-post. Makes hard to follow the comments.   =20
> > > >
> > > >
> > > > 2024=EB=85=84 5=EC=9B=94 28=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84=
 2:38, Markus Elfring <Markus.Elfring@web.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=
=EC=84=B1:
> > > >   =20
> > > > >
> > > > > =E2=80=A6   =20
> > > > > > For preventing this problem from happening, we make CA_RESET io=
ctl do
> > > > > > nothing and only return EBUSY if the ioctl is called during the
> > > > > > "transiting" states.   =20
> > > > >
> > > > > Would you like to avoid any typos (in the summary phrase)?   =20
> > >   =20
> > > > Initially, I sent this E-mail using the below command
> > > > "....git send-email --to  mchehab@kernel.org,
> > > > linux-media@vger.kernel.org, xxxxxxxxxxx.patch. ..."   =20
> > >
> > > Git send-email is a good way to send patches. You may also use
> > > a decent e-mail client that won't mangle with whitespaces. I use
> > > myself claws-mail; other develpers use emacs. Feel free to pick your
> > > poison, but if the email doesn't handle whitespaces well and/or
> > > don't allow writing the answers below the original comments (instead
> > > of top-posting), it shouldn't be used.
> > >   =20
> > > > In response to what you suggested, is it OK if I use Gmail and atta=
ch
> > > > a new patch ?   =20
> > >
> > > No. Never attach a patch as the mailing list will reject, and if not,
> > > patchwork.linuxtv.org won't pick it.
> > >
> > > You may use gmail, if you setup your e-mail client to use it as a
> > > SMTP server. Using webmail solutions typically won't work open source
> > > discussions, as it does lots of wrong things, like top-posting, not
> > > honoring 80 columns on emails and/or mangling tabs and white spaces.
> > >
> > > Thanks,
> > > Mauro
> > >   =20
>=20
>=20
>=20
> Thanks,
> Mauro



Thanks,
Mauro

