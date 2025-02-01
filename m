Return-Path: <linux-media+bounces-25514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82231A247C0
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2025 09:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D87C27A35DC
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2025 08:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71789145B1B;
	Sat,  1 Feb 2025 08:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PNhKmjsL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A8A35959;
	Sat,  1 Feb 2025 08:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738398273; cv=none; b=Dihwwl30kJ1dMgcYVzV/eGgFgOun7CqJh/G6azJo6k38R0vhsix/uYuEBlW2cl8oD/ZUcwR0qo+5bKzOKdXz7ghdFI4TbeSTPv1HbMINX4JXxTkFEw9v5tZx62zUxUvbpm/nv6Ccp+Pk495TatHTWjsNLID5adCf4KmGBSaTeJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738398273; c=relaxed/simple;
	bh=q91n5zrs7SSH8bSeo1HtbKy5vLmAZYPTrfTPVzC2oLs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KzQnUuYJc5k74FnGG663cVyWRVGE7f62o0tlshcQ8iA4/AQSGazKafVYnslfLuZUOzFEMVUwyzgVC93e+lmsvMqrCxpWZNa/11sZ1Z/Ds+BuD9YucRd8onFA7BRY3yRyrUwpLFbH4EtOnPvDYE/yxSpg0DJ6JOIRBJ1J4gBItz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PNhKmjsL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55368C4CED3;
	Sat,  1 Feb 2025 08:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738398273;
	bh=q91n5zrs7SSH8bSeo1HtbKy5vLmAZYPTrfTPVzC2oLs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PNhKmjsLh7Ru22QbQ9fcfPF6v3ya/hIkPe1/wxGCMc0liPus2OXcXC5a/adiliNVW
	 UxvJTpSJhUTdWi3HS/PyhMDv+g71SGuB9SsClaJzhcoZqjHN447i0eWNPEdTDXkfDu
	 +4T3G95tou04LkfvOizRBE1Fv9Oi1kqquRpAKT4TctSYwrmZ+ljaEsh7uuBszN20vc
	 CHx667LgaI/4IHYrDuKnf6VSAWWj65mhQ5gpqXe94iHji5z7Zvk8sNL20I/JsPgRO2
	 XoDwEJv/3vEde2QS2q6UYaOAzjz8etDfylKARhVNtK4LKsv18bl77E6CxrMXp0qzwz
	 ip5UaSR0spEyA==
Date: Sat, 1 Feb 2025 09:24:27 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: YongSu Yoo <yongsuyoo0215@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Markus Elfring
 <Markus.Elfring@web.de>, linux-media@vger.kernel.org, Hyunwoo Kim
 <v4bel@theori.io>, LKML <linux-kernel@vger.kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, yongsu.yoo@lge.com
Subject: Re: [PATCH] media: dvb_ca_en50221: Add a returing EBUSY logic into
 CA_RESET
Message-ID: <20250201092427.6a09c39d@foz.lan>
In-Reply-To: <CANXPkT6wxEzX=Seyi-SctkpN17AgeTAWSPr-Yt2kRzD_isAa2g@mail.gmail.com>
References: <20240308121338.1983-1-yongsuyoo0215@gmail.com>
	<eda2a849-c23a-4624-85da-78a2fdef4fe9@web.de>
	<CANXPkT5ggr8VbYdRy+uSnfHxDRES5arJJ8p+ist1CBTm-1xaUQ@mail.gmail.com>
	<20240530203149.1fe881ed@coco.lan>
	<CANXPkT6wxEzX=Seyi-SctkpN17AgeTAWSPr-Yt2kRzD_isAa2g@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Sat, 1 Feb 2025 09:44:18 +0900
YongSu Yoo <yongsuyoo0215@gmail.com> escreveu:

> Dear Mauro Carvalho Chehab
>=20
> I know how to send an E-mail using "....git send-email --to .."
> But,
> I do not know how to reply to this E-mail loop using "....git send-email
> --to .."
> Can you kindly guide me ?

Never used git send-email to reply, as it is mainly focused on sending
e-mails, not being a true emailer: it just sends e-mail: it doesn't
receive. In thesis, you could download the original e-mail using b4 or lei,=
=20
then manually write a reply text on it and use git send-email. This is
easier said than done, as you'll need to take care of SMTP headers yourself.
This would require some knowledge about SMTP RFCs.

If I were you, I would seek for some other alternatives.

Most people use mutt for Kernel work, as it is CLI. There is also alpine
I haven't used alpine for ages, but it is a decent CLI e-mail client, using
a very simple interface, although it has less features than mutt.

I prefer instead to use claws-mail as it has a reasonable GUI, it is fast
and it is not overbloated with features I won't use.

Neither mutt, alpine or claws-mail mangle whitespaces and line breaks on
e-mails, and they can be setup to not do top-postings.

If you want something simpler, perhaps you could try notmuch[1]. I never
tried myself, but I heard it can be used to reply to e-mails without even
needing to subscribe to a ML.

[1] https://notmuchmail.org/

You may also find useful to have a SMTP relay server. Probably one of the
simplest ones to setup is msmtp: https://marlam.de/msmtp/.

I hope that helps.

Regards,
Mauro


>=20
> 2024=EB=85=84 5=EC=9B=94 31=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 3:31,=
 Mauro Carvalho Chehab <mchehab@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>=20
> > Em Tue, 28 May 2024 21:14:37 +0900
> > YongSu Yoo <yongsuyoo0215@gmail.com> escreveu:
> > =20
> > > Dear Markus Elfring =20
> >
> > Please don't top-post. Makes hard to follow the comments. =20
> > >
> > >
> > > 2024=EB=85=84 5=EC=9B=94 28=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 2=
:38, Markus Elfring <Markus.Elfring@web.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
> > > =20
> > > >
> > > > =E2=80=A6 =20
> > > > > For preventing this problem from happening, we make CA_RESET ioct=
l do
> > > > > nothing and only return EBUSY if the ioctl is called during the
> > > > > "transiting" states. =20
> > > >
> > > > Would you like to avoid any typos (in the summary phrase)? =20
> > =20
> > > Initially, I sent this E-mail using the below command
> > > "....git send-email --to  mchehab@kernel.org,
> > > linux-media@vger.kernel.org, xxxxxxxxxxx.patch. ..." =20
> >
> > Git send-email is a good way to send patches. You may also use
> > a decent e-mail client that won't mangle with whitespaces. I use
> > myself claws-mail; other develpers use emacs. Feel free to pick your
> > poison, but if the email doesn't handle whitespaces well and/or
> > don't allow writing the answers below the original comments (instead
> > of top-posting), it shouldn't be used.
> > =20
> > > In response to what you suggested, is it OK if I use Gmail and attach
> > > a new patch ? =20
> >
> > No. Never attach a patch as the mailing list will reject, and if not,
> > patchwork.linuxtv.org won't pick it.
> >
> > You may use gmail, if you setup your e-mail client to use it as a
> > SMTP server. Using webmail solutions typically won't work open source
> > discussions, as it does lots of wrong things, like top-posting, not
> > honoring 80 columns on emails and/or mangling tabs and white spaces.
> >
> > Thanks,
> > Mauro
> > =20



Thanks,
Mauro

