Return-Path: <linux-media+bounces-51936-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QArhJEi3f2kPwgIAu9opvQ
	(envelope-from <linux-media+bounces-51936-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 21:27:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ECCC72F1
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 21:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9FF1130010C5
	for <lists+linux-media@lfdr.de>; Sun,  1 Feb 2026 20:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A0F2C08D0;
	Sun,  1 Feb 2026 20:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b="Qbd53dhP"
X-Original-To: linux-media@vger.kernel.org
Received: from prime.voidband.net (prime.voidband.net [199.247.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCDD284B54;
	Sun,  1 Feb 2026 20:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.247.17.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769977666; cv=none; b=oThGbgJs7Ffw0bcyBdfuVumgLxXs0tWARBWsWFpHzBtwQHUQYDd0rVCFVTi4xWRyPfRU6PWWq3dm6OwIks8/swaJ85NR7z0pFuBqHDg3SW4KpxFGZ8RKBysgZDtp7PqAdiH4ipyvFFqnj4KxFcDKr1oAISKfsmX0mtMx4m6oWsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769977666; c=relaxed/simple;
	bh=ls5zZtS4tmt9qd7tVQHRbEF334zkUndtaId6tujayf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GhrVCEkil76i3hFngYFNY56EeRMhkVQ7+ADtkhM+iOvnIfGGAFzYIoq6a4ktvJ+KNM5jsX1oy4qNTLaIXb6aYKGaMHT+abYPA5nnz6dEEBVTrkZKpLnWsuiS85+Gkw684UzN7/zLtYngHvNH25I28Y8L0OIxKyPIMsWoiWaQijA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name; spf=pass smtp.mailfrom=natalenko.name; dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b=Qbd53dhP; arc=none smtp.client-ip=199.247.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=natalenko.name
Received: from spock.localnet (unknown [212.20.115.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by prime.voidband.net (Postfix) with ESMTPSA id 6EF84635B040;
	Sun, 01 Feb 2026 21:27:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
	s=dkim-20170712; t=1769977663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ls5zZtS4tmt9qd7tVQHRbEF334zkUndtaId6tujayf0=;
	b=Qbd53dhP0sIe0x3XOmcz0t+0fCh/I/T76DWU1Nwm/sGVIAnedGZRjzor4AsuaEBclb6P4l
	XQrihdq9uBU5Itf0pQ1y7C/5l/mnE2qB4NKUFMWvciXlt9ub45Iuw2gY922mUCNI03CIQZ
	O5MpBmAw8qra6dSBkAJBVDgl/KodKrw=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, linux-media@vger.kernel.org,
 jani.nikula@linux.intel.com, anisse@astier.eu,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] media: Virtual camera driver
Date: Sun, 01 Feb 2026 21:27:30 +0100
Message-ID: <5045000.GXAFRqVoOG@natalenko.name>
In-Reply-To: <20260201202200.GX3374091@killaraus>
References:
 <20260201133342.335680-1-jarkko@kernel.org>
 <12828248.O9o76ZdvQC@natalenko.name> <20260201202200.GX3374091@killaraus>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1945224.tdWV9SEqCh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
x-ms-reactions: disallow
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[natalenko.name,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[natalenko.name:s=dkim-20170712];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[natalenko.name:+];
	TAGGED_FROM(0.00)[bounces-51936-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksandr@natalenko.name,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[natalenko.name:mid,natalenko.name:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 38ECCC72F1
X-Rspamd-Action: no action

--nextPart1945224.tdWV9SEqCh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC PATCH] media: Virtual camera driver
Date: Sun, 01 Feb 2026 21:27:30 +0100
Message-ID: <5045000.GXAFRqVoOG@natalenko.name>
In-Reply-To: <20260201202200.GX3374091@killaraus>
MIME-Version: 1.0

On ned=C4=9Ble 1. =C3=BAnora 2026 21:22:00, st=C5=99edoevropsk=C3=BD standa=
rdn=C3=AD =C4=8Das Laurent Pinchart wrote:
> > My use-case for v4l2loopback is to stream a webcam from one machine to
> > another (with the help of ffmpeg). Is this covered by something other
> > than v4l2loopback now?
>=20
> On the transmitting side I assume you don't use v4l2loopback. On the
> receiving side, the recommened option is PipeWire.

Yes, v4l2loopback is on the receiving side. Would you please be able to sha=
re a manual for solving this with PipeWire only?

Thank you.

=2D-=20
Oleksandr Natalenko, MSE
--nextPart1945224.tdWV9SEqCh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAml/tzIACgkQil/iNcg8
M0um6BAA1GSlfGZTrVR9oaCtjL0b8TnWVjuKS+XL7owGxDLyBDl6lCaxaLmNf9zO
N2ww8jrQYSBRvCTLrcOteiXQu8v/sHscgUlsHTbbFgOrbg5bS0KgWBvbBJepaK6P
mROMgZA7rySl2tYvWNLCDG6d5yBHzte+zdWdmLD7ATbfgu7nb/2X0x6fpEBX2d5m
hZeMpSSLuwu6N0R4aKlWxJXajrQy4JiK/vJIXkXUpVdZlAPdSBpA417xTs7UUZFw
FWTR5XbDQ2OsmuKIMdDILimLXVfdLczhW3yxXelaOL76q8wCM9dYhWjSay4MBozj
k/h6hooJyuJ8+PSzXZlfE44xpXmdfFeGgOtIruXIBhcjRhTKejXsvBESc5KtLxkc
TNSpcCwBPZpKxvuqzTsEYcVt3QRkJ3xrMuad42lSUsriBc+1CxHKZJNGmHZHrYQL
xUn8VrfVY4gbgmxre/EmGXbj1X+GjCoz+PXhsoQ2/8b+yUZpzc0xJUzixt/dQZss
jS73BMrE8shXoiTazD076RDoWQmYd4+Z+hQ30YZngVS6bMLnsJs37sGlA9rKveKv
6P20zK4HxlOGPjZnvOYFfyG8Mwk0w1UF8Ld5GkrqJPUlq7WeU4Pytp7RFTaPgA9E
JrvHGZsS2MjT8dKE+SyW0a6oAjykawY1ik/xO+YWhaXOKWdOqKc=
=l6Df
-----END PGP SIGNATURE-----

--nextPart1945224.tdWV9SEqCh--




