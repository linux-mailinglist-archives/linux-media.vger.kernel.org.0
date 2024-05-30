Return-Path: <linux-media+bounces-12270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2BA8D51CF
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 20:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A7A8284569
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 18:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DD44D5BD;
	Thu, 30 May 2024 18:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p4+EVvH5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48FC4D5B0;
	Thu, 30 May 2024 18:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717093914; cv=none; b=kh5R6YvTdwWwGY2lh2JQ4uvpb9XW4OzikzpOTpD4858IsPpopby5npB7t92IqP/W7yXRcuYIurVnhoTPkZWCApDHi/bEcdTFYsj137gysuyyNJI0dc2UKRheEU5jQm9YepDD34fNuCN0THSvMd3RimFxZ3RksNZpAPszSWIWxP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717093914; c=relaxed/simple;
	bh=oV2ANB+ulV/DSp8xJCrxkLf1wBmQtbX6KxkYIPVxXc0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n2HrSn6bpvV/oSX4NyYM/TEpLrbhdkWA5EUXpbB5h+1Ji+VvYs2OX1Qznmu8WsQ6CGVsvkPjPFwG7kwDMIYBVt8TEKFuCzPWQIT3AwSHydiNQQkh2wn4SGPeRwDximQmwNVcJH5YwL8W7baAURJwrlQylRFuwPeXhPkE80fzNy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p4+EVvH5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF3CC2BBFC;
	Thu, 30 May 2024 18:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717093914;
	bh=oV2ANB+ulV/DSp8xJCrxkLf1wBmQtbX6KxkYIPVxXc0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=p4+EVvH5KamzgwLTElqCojVkEP8mGN9Cj1Rl/avHfcaqPc6Uo4Y2ZmnNdwrdnRux+
	 sJgt2YhmeCs61sLwVQ+TLhvbfo6eTI2v9LxSt8tCAe4n5VsHDt8LhoQf9SKwhsoV06
	 NLrPHhuIIX/5W+m3ZPCqgG3INM1BGBXzD1BPS+zyk11I0Um8vtU/KFqOlZckT/8NB4
	 0JNUXVO9WFlDKfZZp0WXZJmeO1X4K3ndlr9hbEwR5eBJgFnPSoptxsv4LMlASqPu4I
	 5id25ffRMLsXKdE1K9Rw1s1YxXOd44IL1ESGNoeS7blLpSMcTygcIX0lCkK7Ws51U0
	 7Rc1eXjTx8qUg==
Date: Thu, 30 May 2024 20:31:49 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: YongSu Yoo <yongsuyoo0215@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-media@vger.kernel.org,
 Hyunwoo Kim <v4bel@theori.io>, LKML <linux-kernel@vger.kernel.org>, Dan
 Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] media: dvb_ca_en50221: Add a returing EBUSY logic into
 CA_RESET
Message-ID: <20240530203149.1fe881ed@coco.lan>
In-Reply-To: <CANXPkT5ggr8VbYdRy+uSnfHxDRES5arJJ8p+ist1CBTm-1xaUQ@mail.gmail.com>
References: <20240308121338.1983-1-yongsuyoo0215@gmail.com>
	<eda2a849-c23a-4624-85da-78a2fdef4fe9@web.de>
	<CANXPkT5ggr8VbYdRy+uSnfHxDRES5arJJ8p+ist1CBTm-1xaUQ@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Tue, 28 May 2024 21:14:37 +0900
YongSu Yoo <yongsuyoo0215@gmail.com> escreveu:

> Dear Markus Elfring

Please don't top-post. Makes hard to follow the comments.
>=20
>=20
> 2024=EB=85=84 5=EC=9B=94 28=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 2:38,=
 Markus Elfring <Markus.Elfring@web.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
>=20
> >
> > =E2=80=A6 =20
> > > For preventing this problem from happening, we make CA_RESET ioctl do
> > > nothing and only return EBUSY if the ioctl is called during the
> > > "transiting" states. =20
> >
> > Would you like to avoid any typos (in the summary phrase)?

> Initially, I sent this E-mail using the below command
> "....git send-email --to  mchehab@kernel.org,
> linux-media@vger.kernel.org, xxxxxxxxxxx.patch. ..."

Git send-email is a good way to send patches. You may also use
a decent e-mail client that won't mangle with whitespaces. I use
myself claws-mail; other develpers use emacs. Feel free to pick your
poison, but if the email doesn't handle whitespaces well and/or
don't allow writing the answers below the original comments (instead
of top-posting), it shouldn't be used.

> In response to what you suggested, is it OK if I use Gmail and attach
> a new patch ?

No. Never attach a patch as the mailing list will reject, and if not,
patchwork.linuxtv.org won't pick it.

You may use gmail, if you setup your e-mail client to use it as a
SMTP server. Using webmail solutions typically won't work open source
discussions, as it does lots of wrong things, like top-posting, not
honoring 80 columns on emails and/or mangling tabs and white spaces.

Thanks,
Mauro

