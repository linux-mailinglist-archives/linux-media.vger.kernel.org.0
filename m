Return-Path: <linux-media+bounces-51945-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFY3HRHhf2lWzQIAu9opvQ
	(envelope-from <linux-media+bounces-51945-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 00:26:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A80C786B
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 00:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A61C53007CB8
	for <lists+linux-media@lfdr.de>; Sun,  1 Feb 2026 23:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234BE2E6CCB;
	Sun,  1 Feb 2026 23:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b="AGXl5D9/"
X-Original-To: linux-media@vger.kernel.org
Received: from prime.voidband.net (prime.voidband.net [199.247.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D416E29408;
	Sun,  1 Feb 2026 23:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.247.17.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769988356; cv=none; b=DmhLQU4CUewWrtxboCeaB9rgJXDhXNxJyt/z3qZhexQERWjLbxaVCnlqdFYTPJEgo2BUzwqcDEDQsFKb9xYqPfrec1NZTVa0vuJT5GjeLUQxl6cLEu8I06i3I7LHSF9pZP82qnVCvyk+PkkK9ufBvcm9vIn3fCeuSdCczyveaHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769988356; c=relaxed/simple;
	bh=WBTtrRCe8nywmwFux8kucxqlmiftie329QzMOyibOwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J0KO7UJDHIuOgyHlgDiZisEjwX4nD2IPyD++ie0+qevuwDbMhPHVHvuOrVAMUNtyj3HnB35aWtxBFaaknyBYFToerX6mfWAjVToCkOQM68PrlyVC7c5VtJ1H7ovM0yGd7Tqc66+4P5Nk684Z9fgJj+6eXj5vblyU3Y8jzPsGORI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name; spf=pass smtp.mailfrom=natalenko.name; dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b=AGXl5D9/; arc=none smtp.client-ip=199.247.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=natalenko.name
Received: from spock.localnet (unknown [212.20.115.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by prime.voidband.net (Postfix) with ESMTPSA id 4E164635B040;
	Mon, 02 Feb 2026 00:25:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
	s=dkim-20170712; t=1769988352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WBTtrRCe8nywmwFux8kucxqlmiftie329QzMOyibOwM=;
	b=AGXl5D9/xRJt9bjJhGo2ZwTHnpvCvPGiYPlulRIpVlSzeyuZd0p8I5n9tkdDOnrvEEbIgP
	dEjNfQTKDg9JvmI5Yy6QDQMIXg9BJ5S8w+8kqMlI58c3KQcn2LhzQ5OFVDn3+ZBlH3K16J
	yRDsX7Kw5OJEox8T+GaaVt1Wk1k+s44=
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
Date: Mon, 02 Feb 2026 00:25:37 +0100
Message-ID: <13939245.uLZWGnKmhe@natalenko.name>
In-Reply-To: <20260202001704.2419778a@foz.lan>
References:
 <20260201133342.335680-1-jarkko@kernel.org>
 <5073898.31r3eYUQgx@natalenko.name> <20260202001704.2419778a@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3027950.e9J7NaK4W3";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
x-ms-reactions: disallow
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[natalenko.name,reject];
	R_DKIM_ALLOW(-0.20)[natalenko.name:s=dkim-20170712];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-51945-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F0A80C786B
X-Rspamd-Action: no action

--nextPart3027950.e9J7NaK4W3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [RFC PATCH] media: Virtual camera driver
Date: Mon, 02 Feb 2026 00:25:37 +0100
Message-ID: <13939245.uLZWGnKmhe@natalenko.name>
In-Reply-To: <20260202001704.2419778a@foz.lan>
MIME-Version: 1.0

On pond=C4=9Bl=C3=AD 2. =C3=BAnora 2026 0:17:20, st=C5=99edoevropsk=C3=BD s=
tandardn=C3=AD =C4=8Das Mauro Carvalho Chehab wrote:
> No. At the machine with the camera, obs can read from a V4L2 input,
> generate a mpeg TS stream, and listen to a UDP port (for instance).=20
>=20
> At the remote machine, you can just pass the URL to ffmpeg.

I can't, I have to feed the stream into Firefox somehow for it to see the s=
tream as a virtual webcam.

> No need to use OOT kernel drivers.=20
>=20
> Btw, there are other solutions that work the same way, like
> motioneye.

=2D-=20
Oleksandr Natalenko, MSE
--nextPart3027950.e9J7NaK4W3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAml/4PEACgkQil/iNcg8
M0vWvxAAvLieEQopRE4WUy94p1P70X4NL/JWIdh1KpGL46rNYuPEapluhuhvQ4LN
j1JY0cTbgHUxUrBge09poQbvkMl+uAVihuErHyGu5X8146w8eJWcMuAAxJha1KnW
fZ9WGn+ADaaeFcxj/gj4ToomQvcp+6FteUtG8CGH02I//Mmzpb4pp/9k3mj70gDE
u2uVHp28VPuF13nw95Pdm9o2t94UgzlgVjdxgUsRu7JMsainC3RjstfJLfzVR12w
NuV4EOO+thdv8AaWPPaYgKDbrdh0cO3lx5AMeVB2OSBFr0ihdmYOTArIaXJrojti
dKWpjGeGagLHFgymtlklyalz+6erjwGDNh+PTpH/pjOfZmKkCMafAsDeJuKVZG+m
zblqvdcRaQK7TBUAgxCLaCsq/k7R/WUB+s82vLLqjfuNUArECxMruxQEuRpebgYA
o2RGttqb4zxxYgft4PDZjDLIZsfRltoVk+yIpCwJyvuMX8ZvbhNXmVN1BDL+CDUH
lvJuEhlzR6xwmXYHUuLFOJ6YoHdlDt7mmrp/kw/xuW1/ipzulA8qiEJDKcLWlTUc
IEN8m5qKngvwbjbMJJ7e5WmqLEawXMJdUMuqR6NBFy6wTqmOvysyDnqP1cT6U9MU
K1KONtKJtYKuIbe3sjTYhRe+wf+3dwZbmORY4wThNzSWC+zAvjM=
=HRxa
-----END PGP SIGNATURE-----

--nextPart3027950.e9J7NaK4W3--




