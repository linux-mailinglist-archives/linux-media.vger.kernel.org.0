Return-Path: <linux-media+bounces-65370-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4Zf/K7o1OWpUogcAu9opvQ
	(envelope-from <linux-media+bounces-65370-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 15:16:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1642A6AFBAC
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 15:16:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xn--rombobjrn-67a.se header.s=a header.b="hLNYP6f/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65370-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65370-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB133303F07C
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 13:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24EE3B14CC;
	Mon, 22 Jun 2026 13:11:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.xn--rombobjrn-67a.se (nestor.xn--rombobjrn-67a.se [188.126.83.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327B03AF677;
	Mon, 22 Jun 2026 13:11:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133866; cv=none; b=H+W5Fb+uKuKAEeY9I/UoKjmBi92VAXndFcTGb6c2hsmLA4HiHT7gqVtnJUQp/BR05qkF4eUicq4+TmjRZrK9mrJN4Chc2Gf41IXJrtZMnAzJncvETPq36FZayzztbu6xHcGIRTUkjJ1ApfRZkXITqeSaGbMhbg1S5DUyXo5tiH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133866; c=relaxed/simple;
	bh=OZYjmLC/hftjnHynQTLe22egF+AFTqRceen9IKf01XM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ma5crxIAbN6wllB87oKpkqEb9Hm5NToPzODr+QetUy3hnhWXzweWMvFiPO4h9fp3Jra6inwgYofy9sVzq9eyyn7aSq67pbyXi0sBHUCS8IwvcgsnZ9V+JWrRZduSWf10JkLmTVLcvqCPXkN0cDltD2j3diSe3zPj/rIf6d4pCvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xn--rombobjrn-67a.se; spf=pass smtp.mailfrom=xn--rombobjrn-67a.se; dkim=pass (2048-bit key) header.d=xn--rombobjrn-67a.se header.i=@xn--rombobjrn-67a.se header.b=hLNYP6f/; arc=none smtp.client-ip=188.126.83.49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xn--rombobjrn-67a.se;
	s=a; t=1782133863; bh=OZYjmLC/hftjnHynQTLe22egF+AFTqRceen9IKf01XM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:From:Sender:Reply-To:Original-From:
	 Organization:To:CC:Subject:Original-Subject:Date:Message-ID:
	 In-Reply-To:References:Original-Message-ID:
	 Disposition-Notification-To:Disposition-Notification-Options:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 Content-Features:Content-Alternative:Content-Location:
	 TLS-Report-Domain:TLS-Report-Submitter:MT-Priority;
	b=hLNYP6f/OVHnjipY3RAW/xuJbGG+Y0e5CsxBFPWhd9BDQRgjiq7EMfMCbJ2KihTkn
	 7QYzuB86druosuctYblu5nTRn07fgBainSxvz7DQgdIwQxZdBzh9jriqrvKjcGgV9u
	 P9seOazdMtPaRvqEue/pypOx8zqiGSdV8SxwS1kFqn9zo9c5nhF3e2Sc/r/PErYlec
	 n5/tP1kNsB7/WfC5mU/FhYkZ0bbQ+7L0FZsKma2XUZ8STaSe66XRuDHEzrx0T8tnOY
	 HvXZAvdO/bEPYF0ak5bAfLzTU2VEdWtq/Q76RwO9T6KlI6XfG7lVCmXE8PU6wzzsvt
	 xlnv8TxKD68DA==
Received: from tag.xn--rombobjrn-67a.se (tag.xn--rombobjrn-67a.se [192.168.72.9])
	by smtp.xn--rombobjrn-67a.se (Postfix) with ESMTPSA id 8F4CC407E8E5;
	Mon, 22 Jun 2026 15:11:03 +0200 (CEST)
Date: Mon, 22 Jun 2026 15:10:49 +0200
From: =?UTF-8?B?QmrDtnJu?= Persson <Bjorn@xn--rombobjrn-67a.se>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: admin-guide: fix bracelets and
 translation issue
Message-ID: <20260622151049.7a749098@tag.xn--rombobjrn-67a.se>
In-Reply-To: <20260611075513.124994-2-manuelebner@mailbox.org>
References: <20260611075513.124994-2-manuelebner@mailbox.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ShThDKHK0eQdKC_QlNg84XG";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[xn--rombobjrn-67a.se:s=a];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65370-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[xn--rombobjrn-67a.se];
	FORGED_SENDER(0.00)[Bjorn@xn--rombobjrn-67a.se,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[xn--rombobjrn-67a.se:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bjorn@xn--rombobjrn-67a.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,xn--rombobjrn-67a.se:dkim,xn--rombobjrn-67a.se:from_mime,tag.xn--rombobjrn-67a.se:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1642A6AFBAC

--Sig_/ShThDKHK0eQdKC_QlNg84XG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Manuel Ebner wrote:
> -- Galaxis plug.in S [neuer Name: Galaxis DVB Card S CI
> +- Galaxis plug.in S [new Name: Galaxis DVB Card S CI]

If it's not German anymore, should it still have the capital N? It
doesn't look like "Name" is a name here.

Bj=C3=B6rn Persson

--Sig_/ShThDKHK0eQdKC_QlNg84XG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signatur

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE52SginNFTPmg+iBb4Tha3NZK5j8FAmo5NFkACgkQ4Tha3NZK
5j+6Ag/9FC3er3rjVSCkSD3EqmDpAK/3id0w/GuoRFqG7oabnD3YeVtMPZo1f0hF
k5ZLgeOpnL6xtkarxkyA/C86lEazesIqkJjJbgr37eeZPThyDKHF7qjOCXiwg1s0
NCe3Epux5bNEUVL8T97hVix+jwYMr6/jeGJrzhJF/qIE98vVX6A57JqnEplRPRtS
gXVn9ktwsfE+WJnGr0KLpCKmLSr/lXdGn2sZII4+B9PNX67f5buYJi4GSa4eqYKU
MQXRRqIVn/EysVtnYdVCceHF6aAsijZo/OcHtUNTFrqD7/Pqh+H73zKrC2ZeBikf
z6pz1NYcCh20ne2l1u2e9TvZcnjkkIBW3qI8eaEDdXQER3XLXUQYYvHwPS8gHQq3
VoAD8mxdF5zZCz1Ig7P5dW5qCJLH2R3hfkt9tChoIYsqamvoYhlEU08g+ds/SOr+
cr3huUGGPZfSUHD3B/u3bmVouMJ6gGbobAIJ71pdnaEYDaCEwnNhoAHCmAzBY6zM
n0s1uDn/IMFHWVH6NsI22XrfVeNDn1T8NubuqvbFHtPCpke8zDn8VEVY47G7YbRa
PzpWaJgaHA4vwbhnMTK5ndoPk1KcOqxRdEMKGdAQ1kTyOYzq0qrduYywxbtpcXuF
t1eqYmVp2wUWjBdVIUCaT9FyJdA5RHE35A+2cv1QA4ZbCw9P+zg=
=5lKA
-----END PGP SIGNATURE-----

--Sig_/ShThDKHK0eQdKC_QlNg84XG--

