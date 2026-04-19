Return-Path: <linux-media+bounces-59100-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAY4Hba95GnMYwEAu9opvQ
	(envelope-from <linux-media+bounces-59100-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 13:34:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6A0423CEB
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 13:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEB49300D843
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 11:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDBC3264FD;
	Sun, 19 Apr 2026 11:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="uqbJgX2l"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B1B1E8320;
	Sun, 19 Apr 2026 11:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776598437; cv=none; b=BXbMC4QBPauCEqCQ+kd2eYRYPAZndjC8EmCaZNumkOLhgvIHQDIWLRkPa39WzhMpelr6EEb5TyFlyIpeYU0YoTa+daUW2blORtunW5t+FfeLRJjKME+c562Ga25kCybMdt0JFNOcbdQFSb917ga0KcLCb9VtwCZsitr2J7d7H3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776598437; c=relaxed/simple;
	bh=xM9ohwe+AgsnejiWiMGGpSHKTz/jZIwXDKy3kqRPqYc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WP16SqHpFYzQjnc4xVczykBWWUSXBr6jN7Cz3nNgq5OeZdRCbvCXZxcfkpvEhuUO1gYl0QVhu2z2FBSR/ojn8ZnfvF8lG5wafzrXGU788lyMLGeAOpyfhezVa52aXbat1GrUcYMhVSARggZyzyY6YKbhzHPvvIVGsXHMK4BVDe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=uqbJgX2l; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fz62J4XKwz9tJN;
	Sun, 19 Apr 2026 13:33:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776598424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xM9ohwe+AgsnejiWiMGGpSHKTz/jZIwXDKy3kqRPqYc=;
	b=uqbJgX2ll+E8Yumo0eZu0DgkD4Dnn1pPPbG4ypYVfW2SnmSaVCrxSuC8Z5gX+IAfgXB2fG
	q2ZCMCOKgH8X5ddtnO6NUmU84fMBbFBTgRRXvlAOAZOlg/I8L72FRbZVC6n9wkuCYw1TAG
	4cu6egFOKvljfvZr9D8FU8MqYxf29sQ0H9hdHZSMFwfl2OOjywxsOtUHNgng7C6IsCSO8i
	OU1cq0SOL2quD2m/kSUk8cnGc3FFfuhf0P2pV3pr45d1px+EBYWcG3FNyl8CLLIRXP5h47
	596+BNPLQqEzlJKxVqo+08KXc41MZuh7iDf4jsrEeqhZJpVS13rliJPxcXzwNA==
Message-ID: <295490d9bd8b9d519dda5c4551e7dbaf36492a8a.camel@mailbox.org>
Subject: Re: [PATCH] Documentation: adopt new coding style of type-aware
 kmalloc-family
From: Manuel Ebner <manuelebner@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, 	linux-doc@vger.kernel.org
Cc: lrcu@vger.kernel.org, linux-kernel@vger.kernel.org, 
	workflows@vger.kernel.org, linux-sound@vger.kernel.org,
 rcu@vger.kernel.org, 	linux-media@vger.kernel.org, Kees Cook
 <kees@kernel.org>
Date: Sun, 19 Apr 2026 13:33:39 +0200
In-Reply-To: <87se8rw8df.fsf@trenco.lwn.net>
References: <20260419065824.165921-4-manuelebner@mailbox.org>
	 <87se8rw8df.fsf@trenco.lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 6a05aa517499d7df5df
X-MBO-RS-META: zyx7q81brcdyo8qt7s4pbdr11dh6toyf
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59100-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Queue-Id: CD6A0423CEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 2026-04-19 at 04:29 -0600, Jonathan Corbet wrote:
> Manuel Ebner <manuelebner@mailbox.org> writes:
>=20
> > Update the documentation to reflect new type-aware kmalloc-family as
> > suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj() and
> > family")
> >=20
> > ptr =3D kmalloc(sizeof(*ptr), gfp);
> > =C2=A0-> ptr =3D kmalloc_obj(*ptr, gfp);
> > ptr =3D kmalloc(sizeof(struct some_obj_name), gfp);
> > =C2=A0-> ptr =3D kmalloc_obj(*ptr, gfp);
> > ptr =3D kzalloc(sizeof(*ptr), gfp);
> > =C2=A0-> ptr =3D kzalloc_obj(*ptr, gfp);
> > ptr =3D kmalloc_array(count, sizeof(*ptr), gfp);
> > =C2=A0-> ptr =3D kmalloc_objs(*ptr, count, gfp);
> > ptr =3D kcalloc(count, sizeof(*ptr), gfp);
> > =C2=A0-> ptr =3D kzalloc_objs(*ptr, count, gfp);
> >=20
> > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
>=20
> Just to be sure, did you write this patch yourself, or did you use some
> sort of coding assistant?

I wrote the patch myself.

> Adding Kees, who did this work and might have something to add here.

Thanks.


> > ---
> > =C2=A0.../RCU/Design/Requirements/Requirements.rst=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++---
> > =C2=A0Documentation/RCU/listRCU.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0Documentation/RCU/whatisRCU.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
>=20
> This patch will surely need to be split up; the RCU folks, for example,
> will want to evaluate the change separately.

will do that in [v2]

>=20
> > =C2=A0Documentation/core-api/kref.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> > =C2=A0Documentation/core-api/list.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> > =C2=A0Documentation/core-api/memory-allocation.rst=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> > =C2=A0Documentation/driver-api/mailbox.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 4 ++--
> > =C2=A0Documentation/driver-api/media/v4l2-fh.rst=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0Documentation/kernel-hacking/locking.rst=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> > =C2=A0Documentation/locking/locktypes.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 4 ++--
> > =C2=A0Documentation/process/coding-style.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++++---=
-
> > =C2=A0.../sound/kernel-api/writing-an-alsa-driver.rst=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 12 ++++++------
> > =C2=A0Documentation/spi/spi-summary.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 4 ++--
> > =C2=A0.../translations/it_IT/kernel-hacking/locking.rst=C2=A0=C2=A0=C2=
=A0 |=C2=A0 4 ++--
> > =C2=A0.../translations/it_IT/locking/locktypes.rst=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> > =C2=A0.../translations/it_IT/process/coding-style.rst=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0.../translations/sp_SP/process/coding-style.rst=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0Documentation/translations/zh_CN/core-api/kref.rst=C2=A0=C2=A0 |=
=C2=A0 4 ++--
> > =C2=A0.../translations/zh_CN/process/coding-style.rst=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0.../zh_CN/video4linux/v4l2-framework.txt=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0.../translations/zh_TW/process/coding-style.rst=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A021 files changed, 42 insertions(+), 42 deletions(-)
> >=20
> > diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst
> > b/Documentation/RCU/Design/Requirements/Requirements.rst
> > index b5cdbba3ec2e..faca5a9c8c12 100644
> > --- a/Documentation/RCU/Design/Requirements/Requirements.rst
> > +++ b/Documentation/RCU/Design/Requirements/Requirements.rst
> > @@ -206,7 +206,7 @@ non-\ ``NULL``, locklessly accessing the ``->a`` an=
d ``-
> > >b`` fields.
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 bool add_gp_buggy(int a, i=
nt b)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3=C2=A0=C2=A0 p =3D kmalloc(sizeo=
f(*p), GFP_KERNEL);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3=C2=A0=C2=A0 p =3D kmalloc_obj(*=
p, GFP_KERNEL);
>=20
> So you have not gone with the "implicit GFP_KERNEL" approach that Linus
> added.=C2=A0 Given that, I assume, he wanted that to be the normal style,=
 we
> should probably go with it.

I scanned those 8 replies by Linus, but i can't figure out what you mean wi=
th
implicit GFP_Kernel approach, can you give me a hint?

https://lore.kernel.org/all/?q=3Dslab%3A+Introduce+kmalloc_obj%28%29+and+fa=
mily+f%3Atorvalds

> Thanks,
>=20
> jon

Thanks,

manuel

