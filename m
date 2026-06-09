Return-Path: <linux-media+bounces-64283-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id udrvKiHYJ2rx3AIAu9opvQ
	(envelope-from <linux-media+bounces-64283-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 11:08:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1484965E1D5
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 11:08:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=mbKBAflS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64283-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64283-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F15D30AB611
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 09:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1561379C32;
	Tue,  9 Jun 2026 09:01:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEE628690;
	Tue,  9 Jun 2026 09:00:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995661; cv=none; b=jwzizaBuCcbAKeys3Vlocoml44du0Y1RQx+7GS7CGPEAZDcn3ORQTa/xEz0jLg4iq2P1lqJK9AZiHqAsODShLWISq9LXk00d/JskSYG9MkFidMKwjrUWbEn576hzd209qvoqXG8SoBoBe7lSkRCVOYMWqlqjLmaqMPY7YgZGQZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995661; c=relaxed/simple;
	bh=2XewDnzdhkSGP7z6mkVUkCPOhELJsvC+ONlq1zZ3ECY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lsD9yLyjgucIEPzJpO140580qqQ+C/ThW7xE5il/RAx7RgxE01ya3hudYvRGPAp0WuoPqjEhDRWQ2E9ZnTOZSK2M+SIw2mxa0yRtlv9chGYlR9oPEKJQbHxOOjnacxzZBe6SAtFsLNUtVKwUpdzoSu8FQ2nV182Cqag8Remw+B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mbKBAflS; arc=none smtp.client-ip=80.241.56.171
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gZNDJ4jM9z9v6H;
	Tue,  9 Jun 2026 11:00:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780995648; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2XewDnzdhkSGP7z6mkVUkCPOhELJsvC+ONlq1zZ3ECY=;
	b=mbKBAflSUZtPuK/nXwLbpCorxo++jFSHfc1tVKsE1FSvSH3CDangFWORTdz4h/9h1Konzc
	lNcns2124vJhTNJWqs03j3QwW4e5MCrLktPa6Ycqs2lxls2qPt2L7ze6ODB4ijdujPnyro
	E+I3ZJnywOg+KE0hVub8gvgKySdidZaBWRR8gQHrV1VrO9EVeKhDNlOIAUoVD7K5Rl9l2a
	5QDlxcUr5F76D54yUw7Nxcc3xyQPKCKmTbhyccBeFNZb9bap9UIdC7SN/JpCiZ2HVj9iSY
	oY3DVCzd6rQp8Wepvq5S29WJyOLjW/ra0K39r4Kmp2Z+nRl4yKfRK6eiFOltmA==
Message-ID: <f28f1ec7fe3961aa4e616688ac46056421292564.camel@mailbox.org>
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
	phasta@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>,  Alice Ryhl <aliceryhl@google.com>, Daniel
 Almeida <dwlsalmeida@gmail.com>, Gary Guo <gary@garyguo.net>,  Tvrtko
 Ursulin <tvrtko.ursulin@igalia.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 	linux-kernel@vger.kernel.org
Date: Tue, 09 Jun 2026 11:00:43 +0200
In-Reply-To: <8c155cd9-3f79-4e0b-ba3e-1c7e8dad1fa0@amd.com>
References: <20260608142436.265820-2-phasta@kernel.org>
		 <20260608170112.24fd92df@fedora-2.home>
		 <6bdbdb6541392c6ea58e0035f0b20ac3c8f3e54e.camel@mailbox.org>
		 <DJ3RRRX6JY4M.LCRKJ074W9DQ@kernel.org>
		 <256dc5ae3529e2548c4151af34a540476ac928c1.camel@mailbox.org>
		 <20260608181630.20145d1c@fedora-2.home>
		 <739df49a9c0fc54e3d096f95f7d738081f6fcfc2.camel@mailbox.org>
		 <8c155cd9-3f79-4e0b-ba3e-1c7e8dad1fa0@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: agbh83dfcab4z3ghtieii8tkw53cd466
X-MBO-RS-ID: 366f5c3a3072fff08a9
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-64283-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:phasta@kernel.org,m:boris.brezillon@collabora.com,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1484965E1D5

On Tue, 2026-06-09 at 10:47 +0200, Christian K=C3=B6nig wrote:
> On 6/9/26 10:43, Philipp Stanner wrote:
> > On Mon, 2026-06-08 at 18:16 +0200, Boris Brezillon wrote:
> > > If I were to choose, I'd probably go for a dedicated rwlock_t to
> >=20
> > side note:
> > rw_locks are officially discouraged AFAIK. They utilize more of the
> > expensive instructions than a spinlock and are only worth it if the
> > read section is really long compared to the write section.
> >=20
> > > protect dma_fence_ops, so we can:
> > >=20
> > > - protect all dma_buf_ops::xx() consistently no matter the kind
> > > of op
> > > - protect returned data (get_xxx_name()) with this lock instead
> > > of the
> > > =C2=A0 RCU read lock
> >=20
> > That doesn't solve our Rust destructor problem though, does it?
> >=20
> > What we want to do is:
> >=20
> > =C2=A0=C2=A0 1. Signal the fence before it drops
> > =C2=A0=C2=A0 2. Wait for all accessors to be gone
> > =C2=A0=C2=A0 3. Run the destructor
> >=20
> > Step #2 by definition demands the signaled-state lock.
>=20
> If I'm not completely mistaken that approach won't work.
>=20
> See you can't have a destructor if the dma_fence is independent of
> the module it issued.
>=20
> That's why we have all the handling for inline lock and fence
> independents.

It does work if you have two fence types, one for the producer and one
for the consumers.

The producer type has a destructor, and with Rust you can ensure that
all producer-fences get signaled and deconstructed before module
unload.

That relies on the work done by you and Tvrtko in C, where the
signaled-state is the point of decoupling.

The only additional thing I'd need now would be to make this a hard
synchronization point that cannot race / does not need an RCU delay :)


P.

