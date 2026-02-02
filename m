Return-Path: <linux-media+bounces-51962-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDrpEwVQgGkx6QIAu9opvQ
	(envelope-from <linux-media+bounces-51962-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 08:19:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D6AC920D
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 08:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF1B9300BDAC
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 07:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13BF28AB0B;
	Mon,  2 Feb 2026 07:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b="BJMajLfD"
X-Original-To: linux-media@vger.kernel.org
Received: from prime.voidband.net (prime.voidband.net [199.247.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE1D125A9;
	Mon,  2 Feb 2026 07:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.247.17.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770016615; cv=none; b=nT8FtbSM5CDlD8u+NSho7rshpyuV4iSclKGtSnKQeHo3r94AE+AMcr30KzJV1ONqheHFaWlVRzNYsMmP7AbYWcQxSlrmzII1W12Dg6pbz2EXRUsKHjYlbJLV9ClOCZSnRv23vp3VT1j0fR8E2ubD6QrW/ViFK3SgjDk2fv2loaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770016615; c=relaxed/simple;
	bh=Bus9BDVI0sdVXE2UB29ieI60w67Wud12t1cCjQcyXHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h3jJtpKvbV51DGnibCxZA/0Dh1G1lgF0jshEaynXjMyeGEAfgWhU15mTlcpy9QHLPns4kQuGNhuwHhxZVSHpfTe1ejGfeQVKBYoPpqazIEhvE/3yTMj5VHWgtefTAoYHMo5r14tZE4dcJV5jfPR53ZI1DWpkq2a4aCZNAAHvtbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name; spf=pass smtp.mailfrom=natalenko.name; dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b=BJMajLfD; arc=none smtp.client-ip=199.247.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=natalenko.name
Received: from spock.localnet (unknown [212.20.115.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by prime.voidband.net (Postfix) with ESMTPSA id ABB2A635B040;
	Mon, 02 Feb 2026 08:16:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
	s=dkim-20170712; t=1770016610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bus9BDVI0sdVXE2UB29ieI60w67Wud12t1cCjQcyXHU=;
	b=BJMajLfDA71YXV0P9ItOTH8+q4SlTjOM7v7UQeJL4bKWlpOITWVsg5/YLRXSrgZ6zMzTQu
	39JDWSlfOkJIV8NJNal0AAHbhpPQROdC5bPvcLUy1QbYUrDZkV9aAp0Kww8efaKA9jWw52
	lU7bVUi/sCUoAXE/DVybXxB3I647BJk=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-media@vger.kernel.org,
 jani.nikula@linux.intel.com, anisse@astier.eu,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] media: Virtual camera driver
Date: Mon, 02 Feb 2026 08:16:36 +0100
Message-ID: <3399673.44csPzL39Z@natalenko.name>
In-Reply-To: <20260202020214.2243acec@foz.lan>
References:
 <20260201133342.335680-1-jarkko@kernel.org>
 <13939245.uLZWGnKmhe@natalenko.name> <20260202020214.2243acec@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart8636556.T7Z3S40VBb";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
x-ms-reactions: disallow
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[natalenko.name,reject];
	R_DKIM_ALLOW(-0.20)[natalenko.name:s=dkim-20170712];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-51962-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[natalenko.name:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksandr@natalenko.name,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,natalenko.name:mid,natalenko.name:dkim]
X-Rspamd-Queue-Id: 94D6AC920D
X-Rspamd-Action: no action

--nextPart8636556.T7Z3S40VBb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [RFC PATCH] media: Virtual camera driver
Date: Mon, 02 Feb 2026 08:16:36 +0100
Message-ID: <3399673.44csPzL39Z@natalenko.name>
In-Reply-To: <20260202020214.2243acec@foz.lan>
MIME-Version: 1.0

On pond=C4=9Bl=C3=AD 2. =C3=BAnora 2026 2:02:14, st=C5=99edoevropsk=C3=BD s=
tandardn=C3=AD =C4=8Das Mauro Carvalho Chehab wrote:
> > On pond=C4=9Bl=C3=AD 2. =C3=BAnora 2026 0:17:20, st=C5=99edoevropsk=C3=
=BD standardn=C3=AD =C4=8Das Mauro Carvalho Chehab wrote:
> > > No. At the machine with the camera, obs can read from a V4L2 input,
> > > generate a mpeg TS stream, and listen to a UDP port (for instance).=20
> > >=20
> > > At the remote machine, you can just pass the URL to ffmpeg. =20
> >=20
> > I can't, I have to feed the stream into Firefox somehow for it to see t=
he stream as a virtual webcam.
>=20
> Motioneye could be used on such scenario. It has a proper web
> interface, allows multiple users to watch, has login control accepts
> multiple cameras.

I still don't get it how this will help with using a webcam from one machin=
e in google meet on another machine, sorry.

=2D-=20
Oleksandr Natalenko, MSE
--nextPart8636556.T7Z3S40VBb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAmmAT1QACgkQil/iNcg8
M0smsg/9GlQnQFswesJoV9RkyS07Ls3Hv7fdMj+v1vNu0o+7D5FMe0WT0EGSf8R2
UGtfsYrfRlVbQ8YB3RcotzOdlWAMezh67ozctcdjafiRr86ZxhTPqCPQtbqT4qhU
ltYXL7+4agBHYOYLFW4Z1lHMcSNOq/gpq281iFXZC+kZr5ntVJBBvCdrNDodHwQG
2FX6NwQZZ91tujHlHHF31zb8Ot+ze7UWNOYGe8Zu+zSw8yjgkhgdMQMuP30qqb0J
SQPHhVTNrMO7kQb+ovkVbz6gg+j9sk/aBikpPieZ0rfI7x/QR3ylUqq3kXNnMeyk
7DZ3kBQrm95Meeh+NC94yxv4M7mIatTk0EKKF33o34DEfqTtWHFcyltcJFkwkvN8
1MQCjcgpiGQXfos9DITno4s/XQGCuAcujmfR/VlC/74tHsoO8qRRLCiahAoU/cbR
yuAt4PEKdcecfKXkkam7RTMgYvHuERoiKMB7tWsRVOd+cJuo8RrX0A4JWMsfZDmN
1QhWUL3qng8MDVVD+icCZsWdEhZsHQqLrSA2FMIRQu0lLwZ9i8uUU0jOCcpRUUM6
odVbQ+zS+50NNnPXGF5uGDqow2rBUxcpz9QEcUm121LSh5AdEA5hfMsZ6cLhuIJK
Rv1kRxG+JGD67tUDvoT/aoOr2mpVzgSaSEs+6CEIj0JA8UV2k2k=
=M4ht
-----END PGP SIGNATURE-----

--nextPart8636556.T7Z3S40VBb--




