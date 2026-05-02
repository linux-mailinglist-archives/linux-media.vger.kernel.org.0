Return-Path: <linux-media+bounces-60178-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD/LF63n9WlwQQIAu9opvQ
	(envelope-from <linux-media+bounces-60178-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 14:01:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD7A4B1DE3
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 14:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47B613013268
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2026 12:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDAF033CEB5;
	Sat,  2 May 2026 12:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xn--rombobjrn-67a.se header.i=@xn--rombobjrn-67a.se header.b="GkRzP7i9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.xn--rombobjrn-67a.se (nestor.xn--rombobjrn-67a.se [188.126.83.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5FD3358C6;
	Sat,  2 May 2026 12:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.126.83.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777723291; cv=none; b=fJvOitWUuglGXUJd9CfuD8cPSNFuaszh9jUG4xk93GE89tOhEZaUDWvJBaMLnodTn+CnBdDCVtukMlocR1jjCiynsu7DW5wk5MiAfxa+KSlqCtIw/bmWtSGj/efMYLxp4u2nRqeoGTTbcQ1a1tZFp/X0lX1QQyFFkgWI/QENy7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777723291; c=relaxed/simple;
	bh=Ep+PyIxZUxo7I++u34Bl31OMHEHI2GsPl+DkXpzZqCo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WnGHBtWdye9+Siyg/eiAyD3FDtPHzaJnqUo1rmVvO1QBZ+10ZwY6qPZIbdOklz99OxndcBkkus++VwItZydpKBHwyyF2l4jRx4KifFoih+JlStlWOwrbwxX4xjNjWE3bdsTFWIukEvS7HrLlvV7KFaX8zPTZAOhfXsrgJImFg+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xn--rombobjrn-67a.se; spf=pass smtp.mailfrom=xn--rombobjrn-67a.se; dkim=pass (2048-bit key) header.d=xn--rombobjrn-67a.se header.i=@xn--rombobjrn-67a.se header.b=GkRzP7i9; arc=none smtp.client-ip=188.126.83.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xn--rombobjrn-67a.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xn--rombobjrn-67a.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xn--rombobjrn-67a.se;
	s=a; t=1777723287; bh=Ep+PyIxZUxo7I++u34Bl31OMHEHI2GsPl+DkXpzZqCo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:From:Sender:Reply-To:Original-From:
	 Organization:To:CC:Subject:Original-Subject:Date:Message-ID:
	 In-Reply-To:References:Original-Message-ID:
	 Disposition-Notification-To:Disposition-Notification-Options:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 Content-Features:Content-Alternative:Content-Location:
	 TLS-Report-Domain:TLS-Report-Submitter:MT-Priority;
	b=GkRzP7i9RTR0072h+WMkZvMRoCNMwNwC40JfXyxrLS/q1vm3ToFJdUlBmuXUryZif
	 eE5uPAXZpohsnrcGeOv5M/Bys3/quIk76pWdJQYAWB1J15DO5STdJyg8wKp3Bu7GTG
	 LI05A/fqlctPOn4nY48JOgAChIbNlERqIeirinTzgWvOoEuDPUpkFSbfiK4yls+ais
	 sM3HRM42D0IMRV3NIwjesUQmIGkHbkkg2UpFFi7MDGA4cqehu5/SFuy7cBwMe1ZhNk
	 4TpdQ7MxpIlIerzd5ridfX1OJ9cYT9FAgCJACOh/r7YK6iueeHvgXfe4l/OnXfU5PM
	 rsTrnJjSjj9tA==
Received: from tag.xn--rombobjrn-67a.se (tag.xn--rombobjrn-67a.se [192.168.72.9])
	by smtp.xn--rombobjrn-67a.se (Postfix) with ESMTPSA id D7652407BE00;
	Sat,  2 May 2026 14:01:27 +0200 (CEST)
Date: Sat, 2 May 2026 14:01:08 +0200
From: =?UTF-8?B?QmrDtnJu?= Persson <Bjorn@xn--rombobjrn-67a.se>
To: Wang Zihan <3772548978@qq.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, mchehab@kernel.org, richard@nod.at,
 anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 linux-um@lists.infradead.org
Subject: Re: [PATCH] Documentation: Fix duplicated words
Message-ID: <20260502140108.6643955c@tag.xn--rombobjrn-67a.se>
In-Reply-To: <tencent_B1D6CBBF95486E31D04C2E1B92F5E605A307@qq.com>
References: <tencent_B1D6CBBF95486E31D04C2E1B92F5E605A307@qq.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s+pt7UBjTtHpjBNxXVWB9kl";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Rspamd-Queue-Id: BFD7A4B1DE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.20 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.56)[subject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[xn--rombobjrn-67a.se:s=a];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[xn--rombobjrn-67a.se];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60178-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[qq.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[xn--rombobjrn-67a.se:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bjorn@xn--rombobjrn-67a.se,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tag.xn--rombobjrn-67a.se:mid,xn--rombobjrn-67a.se:dkim]

--Sig_/s+pt7UBjTtHpjBNxXVWB9kl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Wang Zihan wrote:
>  you can always run UML under gdb and there will be a whole section
> -later on on how to do that. That, however, is not the only way to
> +later on how to do that. That, however, is not the only way to

"Later on" is an established English expression. A plain "later" also
works. This isn't a correction of an error; it's a stylistic change.

Bj=C3=B6rn Persson

--Sig_/s+pt7UBjTtHpjBNxXVWB9kl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signatur

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE52SginNFTPmg+iBb4Tha3NZK5j8FAmn154QACgkQ4Tha3NZK
5j/jXA//VZxalhvXELFLazBqWaE4KMf7cjtx1MrlRygc7caUVnuiH6P2AXJtgQIy
chY2K2gn1yVnHnJsSpSflBQQ8L4lshmP9ZHMKVcU5f7fygL6Ueg6Aa4bBWgbU71B
Y0KPOXE9eHOZfwZ8myMe7OJiRgZkJ4YbrmjFR2DoVx+NZ1eKfFAVUEGfOG3HkZBH
6OKIbHcMbvzjtenrUkdaPOVAmH13GbtSUT17Z2Dm9ifui1wfTA/JAxfAw/MH+Pjd
DyO9RVvhTJRIyr1LdTac1s9PRo2bVt6PV8cktZM9f1Njj1rnYpQhf1w4QH5+2kUV
v9cA5bMaYKOQ2oL1VaHnW9CTm1DhqUN6eIs6IFMk++7Ad/QN2I7uLdp6Xh/rRtY2
oKqOSVN+gWlVQ4MWrdrfRJ0QJ5ZKekmx5YcR7gfL4xYl52dHyA6GpsJozvD0xwTy
6wUJX7skyjtxsVKwgUPyr4EwH7er49NcLjzZK6T70FbJu8c1eCUK92Fad3wzSe1D
qNM3pnWHgaWHn6MrzPfsx1WLDVkDNfgD1leidoXabLJoCxzO6NRBWFtL8qcAI/Kb
0PXcw3gg9f2fQQbRgSYkN9CKA+8WjFpHbqwVbakscxQGdW9KSKS59Kz21yDphswV
IPHeHiN/KKKOf4XS+3qEXWFGIqc90/Pw4Xgpcpgvs9l9lAuiFTo=
=j/I4
-----END PGP SIGNATURE-----

--Sig_/s+pt7UBjTtHpjBNxXVWB9kl--

