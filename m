Return-Path: <linux-media+bounces-51933-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLUMOO21f2m9wQIAu9opvQ
	(envelope-from <linux-media+bounces-51933-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 21:22:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74651C72AB
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 21:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D2E330010D8
	for <lists+linux-media@lfdr.de>; Sun,  1 Feb 2026 20:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6526F2BEC2C;
	Sun,  1 Feb 2026 20:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b="L0/mNo5r"
X-Original-To: linux-media@vger.kernel.org
Received: from prime.voidband.net (prime.voidband.net [199.247.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE481A5B84;
	Sun,  1 Feb 2026 20:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.247.17.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769977319; cv=none; b=sBrFdOXCz+q6CrnxXRwWTrX1e54NK5DzDyDmr/uAfx470djI9CZoSoNscx3KlhCxNUtstxn2tT8UufHneuqiYOxQ/nymxVWWqOgnck4uEA5Edfu3AaW+IX9pm2on12QEEiQnS3fhv/vETb9zZur5dxos071abWQYrVZQKG7Ujp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769977319; c=relaxed/simple;
	bh=Lv/rBtArQ1oCid2HbiQEpqPuaLRWc7hDfY5VUiLigug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g03VOR9djxQyJ3CakQ+BT7Fg3riEF07RsFe4M8XDprpc8/bnetrbLi3xj4b/IxZljQPPVHwh0DvjsR+cqCv1z2bAGfYl3J7nbrZfcdFzmmNGf05BRR19VMbb8u/KqEtCt66LwcysxwY2BJg9uWTrLWULl3ZjdYyzl+wIVzQuSd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name; spf=pass smtp.mailfrom=natalenko.name; dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b=L0/mNo5r; arc=none smtp.client-ip=199.247.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=natalenko.name
Received: from spock.localnet (unknown [212.20.115.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by prime.voidband.net (Postfix) with ESMTPSA id 24BFB635B040;
	Sun, 01 Feb 2026 21:15:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
	s=dkim-20170712; t=1769976909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lv/rBtArQ1oCid2HbiQEpqPuaLRWc7hDfY5VUiLigug=;
	b=L0/mNo5raN4RNxaFSYBX9GOAbHpEjqORECT1ksIIkepglWv8Ln9xmRcdm30aBrfkPMgjsJ
	vW8h51q7hn/uZ+2siDfbkGovtUkzK4RLj6eT6oaOMNGDmeJaUxri5EkbS2RHWvNEgKyLfF
	mtNO+I3azahkJ8yFz2n8lF1XUYsmv58=
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
Date: Sun, 01 Feb 2026 21:14:54 +0100
Message-ID: <12828248.O9o76ZdvQC@natalenko.name>
In-Reply-To: <20260201200649.GW3374091@killaraus>
References:
 <20260201133342.335680-1-jarkko@kernel.org> <aX-joEDl_BJai8wY@kernel.org>
 <20260201200649.GW3374091@killaraus>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5961847.DvuYhMxLoT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
x-ms-reactions: disallow
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[natalenko.name,reject];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[natalenko.name:s=dkim-20170712];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[natalenko.name:+];
	TAGGED_FROM(0.00)[bounces-51933-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksandr@natalenko.name,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 74651C72AB
X-Rspamd-Action: no action

--nextPart5961847.DvuYhMxLoT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC PATCH] media: Virtual camera driver
Date: Sun, 01 Feb 2026 21:14:54 +0100
Message-ID: <12828248.O9o76ZdvQC@natalenko.name>
In-Reply-To: <20260201200649.GW3374091@killaraus>
MIME-Version: 1.0

Hello.

On ned=C4=9Ble 1. =C3=BAnora 2026 21:06:49, st=C5=99edoevropsk=C3=BD standa=
rdn=C3=AD =C4=8Das Laurent Pinchart wrote:
> > There is a notable user base for v4l2-loopback. It is the defacto choice
> > for streaming phone cams.
>=20
> This will then likely face the same hurdles as v4l2-loopback, the main
> one being that camera support should be upstreamed with proper drivers
> instead of a closed-source userspace daemon.
>=20
> For phone cameras, the way forward upstream is libcamera. Until kernel
> drivers for ISPs are available, the soft ISP is a stop-gap solution. It
> recently gained GPU acceleration support (with work to improve image
> quality with additional algorithms ongoing).

My use-case for v4l2loopback is to stream a webcam from one machine to anot=
her (with the help of ffmpeg). Is this covered by something other than v4l2=
loopback now?

Thank you.

=2D-=20
Oleksandr Natalenko, MSE
--nextPart5961847.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAml/tD4ACgkQil/iNcg8
M0urGw//dqeee9X9rd/3gXV4ZDzI/dXXteEgZexIYR92iLn6VzGiKl6YBw0PvXPM
ISo28DwKUmMVINSToItLfjUC1Lbt/M9PzhRfEqZUnxiZ3Do9lbwW+O4JRYshznhO
9DI/u9fXDPjPhJpryUHZ+h0CF6XuTffuQlx3fh8l+w79xbFdk3ga7CbIGvTLvkoc
tIhQ2NC/El6lgQVoIPyKSdCts1f/HwzTWWu6W3kVU0YHreQJqTMm6CnDMV8DC0C5
6mEFuO2r+pJ848TQNVuh3TXmkPAJ+eRSGH8LA5Wwe2l086dxxEsLtQ/2VGO/gyaf
WgseqqSUpDI2o3RD9mZRDUk0lo0foWtmKFIMXmLVKSMgA9+P2dWopFft6d/lr6Bl
uyfrDkVaxRt+H1ZsudyWJBic16tCo+oPj35fa3t1fW+NYpQEN87PMEBYQfIL69DE
Y9zaSqXl+EfEl1cywoFDMtvDq4sys69N4lf5aI/WZUte/AEY/3sakOnot+hUr60B
kGJfqf/uypv6LRtQU27DpGwQpI1lLU3UNtgXQEgQm9DLtIKKrE+LVN/zmB9J9ai6
q0VAsKQLzrFGnaV1RV2cEhZgxxr/++ZGeroQDn2hI3eKT9V3FM9+N65xrnUMjfOh
XTrT0/DfnYEVgVr+a7TsqhCO7k7TluCOK3Mktgv+QXzGJpe4Xek=
=YH+B
-----END PGP SIGNATURE-----

--nextPart5961847.DvuYhMxLoT--




