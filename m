Return-Path: <linux-media+bounces-51935-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPMxJxG3f2kPwgIAu9opvQ
	(envelope-from <linux-media+bounces-51935-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 21:26:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 016DBC72E9
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 21:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E29233007F6B
	for <lists+linux-media@lfdr.de>; Sun,  1 Feb 2026 20:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59AB298CD7;
	Sun,  1 Feb 2026 20:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b="L8QneXuv"
X-Original-To: linux-media@vger.kernel.org
Received: from prime.voidband.net (prime.voidband.net [199.247.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044AB29BDAD;
	Sun,  1 Feb 2026 20:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.247.17.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769977604; cv=none; b=H6YvRe0L1j69PRMNzI7zMpYMY6c/tZ2e2jrJ5wEPx/8KvZeUgqIrjzLF9sz9F0gadfFjtcLW2X0XUss6rb0T3i2LUfuM98UKKsn5j2449LWnrSp5dH03aKbCms9ps7BTxbWl7Or4fyaq/72N8Ws+p2KSgImgKe8m4exZ6IZ9b6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769977604; c=relaxed/simple;
	bh=eTdFN1sZp8GPTyD++cmIhCvu7iub8NIyPO5dZ+ZvlQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vugg9h4kERrpk3/QpilALvuDhUoNWOG7aPMcBUf1PBIeYCDQGxDqTxJJo75D/OKGyrFKbgHUdXN9H+32QTZPjxXckGp+ebZy/bQUUAbmEUatjH+rUthdMuq3KMoLvH8aEM/l+zsQ0CqKv4OygHNd3DtZNCgPHD5AlW3kHVczb1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name; spf=pass smtp.mailfrom=natalenko.name; dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b=L8QneXuv; arc=none smtp.client-ip=199.247.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=natalenko.name
Received: from spock.localnet (unknown [212.20.115.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by prime.voidband.net (Postfix) with ESMTPSA id 9B4D8635B040;
	Sun, 01 Feb 2026 21:26:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
	s=dkim-20170712; t=1769977599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GYdHa+RPQNAH3ET9O4HNM2AYdoTotHMTKn8sSup15jg=;
	b=L8QneXuvzRn+63o/SADgXmZ6Sy2nrKLM9zg1dLtxCK0OsyHyF9rbhCMUWn8aCjKEnQS0Fn
	urjDK2XKcv8mH1AQzqTXTjqAJBvSklIeqe+BSrUkX+UnGf+aQ0RHAD7TDXwUrSsvQebfOV
	7ao2RfbsG0kLd6yeIieaEEQqCSdUPMU=
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
Date: Sun, 01 Feb 2026 21:26:24 +0100
Message-ID: <5073898.31r3eYUQgx@natalenko.name>
In-Reply-To: <20260201212133.1849a49e@foz.lan>
References:
 <20260201133342.335680-1-jarkko@kernel.org>
 <12828248.O9o76ZdvQC@natalenko.name> <20260201212133.1849a49e@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4709716.LvFx2qVVIh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
x-ms-reactions: disallow
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[natalenko.name,reject];
	R_DKIM_ALLOW(-0.20)[natalenko.name:s=dkim-20170712];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-51935-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[natalenko.name:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksandr@natalenko.name,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[obsproject.com:url,natalenko.name:mid,natalenko.name:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 016DBC72E9
X-Rspamd-Action: no action

--nextPart4709716.LvFx2qVVIh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [RFC PATCH] media: Virtual camera driver
Date: Sun, 01 Feb 2026 21:26:24 +0100
Message-ID: <5073898.31r3eYUQgx@natalenko.name>
In-Reply-To: <20260201212133.1849a49e@foz.lan>
MIME-Version: 1.0

On ned=C4=9Ble 1. =C3=BAnora 2026 21:21:33, st=C5=99edoevropsk=C3=BD standa=
rdn=C3=AD =C4=8Das Mauro Carvalho Chehab wrote:
> > My use-case for v4l2loopback is to stream a webcam from one machine to =
another (with the help of ffmpeg). Is this covered by something other than =
v4l2loopback now?
>=20
> Using a kernel driver for something like that is a bad idea and may end
> causing dead lock problems. You may also have performance issues and
> high network traffic. The best solution for it is to use a proper
> userspace tool, like obs:
>=20
> 	https://obsproject.com/kb/linux-installation

Ignoring the fact I've never had any performance issues, and I don't care m=
uch about how big the traffic is in my isolated VLAN dedicated to this spec=
ific task, the OBS solution still uses v4l2loopback under the hood. Could y=
ou please tell me what do I miss in this regard?

Thank you.

=2D-=20
Oleksandr Natalenko, MSE
--nextPart4709716.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAml/tvAACgkQil/iNcg8
M0umoA//a+OOPK59wd7FfDUhEw/jl+aBDYFPNjPRR2SI1K5r2KnwOMh1w+RkaaAG
yY8HDFNMXZNIW38oI/2DQKDP3KWudX/jOve4D9UVzWM2kTHk7y4qaUvY6jCcZ9nn
dtfmNpCYPt/5ac8TSWVwea5rQy3Y3Lfd8680YN45H6FB2oeeb0fbu5zatRmStbVD
xOUq1S0jcCGi0MMhLWkXXTyPSsxjhisgVZDvvajR+7nr3MYkeWj2OZlt7E7wZp29
3tAYwPmSuw5zGi2+AH+Fbcff/rr/8H3KJAxFsu0lauxIioShQnhl6m//FS/ZtE0j
CBzuFP7R6pw6Tw2hbwf2CcAxXxdwLoYqfTG/4XV8rfkBLMtXnpsvD1sXsXT/z4tW
pvHLN5bseSKo8NKv5oOlzFrW8wKbvBHPNO2pgaE4gm87fxM345kZyQF6U9wDUluo
/Wkvv++QbK1mdNBx+dxIRhK597JeQkJAA8o3Aq1hyyFP6/4KEWzloci7NLUoAlzO
U0AdRRxjA85ppl6jrXZ6nlowklfNtGQ19X+sY98D16DBKS80aiU8BISKaiYBwMFL
CiKNnVEydf9r9ornTTDtXKvrHJXzMesEJfRb7iww6UIlS8qwc4qkC8FZHvM646lA
HePlX5X3yQ9enQvA/fZjj0UitlMGKbWxpSVMkQ4N4JpvOSobVIA=
=xPpc
-----END PGP SIGNATURE-----

--nextPart4709716.LvFx2qVVIh--




