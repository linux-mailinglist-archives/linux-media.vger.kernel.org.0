Return-Path: <linux-media+bounces-64279-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oDVFOUTWJ2qF3AIAu9opvQ
	(envelope-from <linux-media+bounces-64279-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 11:00:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E1465E0BF
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 11:00:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=c8vAWrP5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64279-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64279-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 80C5B305A342
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 08:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876353EF0A4;
	Tue,  9 Jun 2026 08:54:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9434A37F730;
	Tue,  9 Jun 2026 08:54:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995255; cv=none; b=R0gh464A6SJVyHP1pN/DC0j4vtjYGC2mHgu7rKJBmaARX2pt4tpewQtaIjxGLvvu4E2qJdJIUoSFVb0Z+odvamrqKWSBWe3WVoIgNGLJK8voVged9uBQ7AR0OevtcRLhrQrNHGQVAdn3XUmHv+sB4qMOX86fBd/+UywafMXy30E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995255; c=relaxed/simple;
	bh=Gnzyn1FtEPpW02KE6pMOpwrpdyoImhLB9p+D4NNEkXI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KM+Rk41KhoLLt1WLF6ham4aIF0PBQWssTFRNyJhmkHMB8JE29dleaNE23wU5NGQ85vCSIUUce2XYBTdUe8xc7ow1MCQ8NhroH7xLr3hD0PGwFECvkE9ov5Y1cyHYEA4uYxh4NwUYtKVv/8G0ZnF7Ehr4ebZGl0ihZoOtsNqbc6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=c8vAWrP5; arc=none smtp.client-ip=80.241.56.172
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gZN4f0Fx7z9tQk;
	Tue,  9 Jun 2026 10:54:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780995250; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gnzyn1FtEPpW02KE6pMOpwrpdyoImhLB9p+D4NNEkXI=;
	b=c8vAWrP5sn+etNsyihfOpmaxCiaSeqoK9GKXLKFKEq89C9fuFdxku7NXMP7/lwCbBMXHab
	a6IwF72CtYuidcytHCssAjxTZIf6MBW9n6W1nhBSQi4G7ZN/ilMzp3oEVoulQJwhJb+IzM
	S4gjODUMHW+ECFLPQJhJYtGyYONNuvfDuPd1h3jcCJFKVZ95FdJBxGiQ816zyPwd2dnK/K
	oYa8drj3HxBdL5RGHcS1MF0g1VJo+nccumjWVDwVGMR+rQac2w50CJ8CEZwDVtJbel+0XM
	2an34AFwa+1gDLXJ8lI9GfBL4Bgr4T8bX6e7OLqmN1IgygCE8eE21Op4GlNojg==
Message-ID: <fa2e15f41ef361dd25170ab89509952d3ec8bce5.camel@mailbox.org>
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Boris
 Brezillon <boris.brezillon@collabora.com>
Cc: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>, Sumit Semwal	
 <sumit.semwal@linaro.org>, Alice Ryhl <aliceryhl@google.com>, Daniel
 Almeida	 <dwlsalmeida@gmail.com>, Gary Guo <gary@garyguo.net>, Tvrtko
 Ursulin	 <tvrtko.ursulin@igalia.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 09 Jun 2026 10:54:05 +0200
In-Reply-To: <850fd675-714e-4e3c-895a-d1dafaeb8219@amd.com>
References: <20260608142436.265820-2-phasta@kernel.org>
	 <20260608170112.24fd92df@fedora-2.home>
	 <6bdbdb6541392c6ea58e0035f0b20ac3c8f3e54e.camel@mailbox.org>
	 <DJ3RRRX6JY4M.LCRKJ074W9DQ@kernel.org>
	 <256dc5ae3529e2548c4151af34a540476ac928c1.camel@mailbox.org>
	 <20260608181630.20145d1c@fedora-2.home>
	 <850fd675-714e-4e3c-895a-d1dafaeb8219@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: uw5m3caeppkq64k5ydrhg1ao9dhasi9g
X-MBO-RS-ID: 4b965308c8edfb90f2a
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-64279-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RSPAMD_EMAILBL_FAIL(0.00)[phasta@mailbox.org:query timed out];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0E1465E0BF

On Tue, 2026-06-09 at 10:02 +0200, Christian K=C3=B6nig wrote:
> On 6/8/26 18:16, Boris Brezillon wrote:
> > - calling with the lock held in the new places is not causing a
> > =C2=A0 deadlock
>=20
> Yeah, exactly that.
>=20
> For example the set_deadline() is intentionally not called with the
> fence lock held because that won't work for some use cases.
>=20
> The problem when you call ops with a lock held is always that this
> lock then becomes the outermost look held. In other words when you
> for example want to grab a power management lock to implement the
> deadline feature the framework enforces an order between the two
> locks which isn't desired.

A deadlock can only happen if that power management routine also
attempts to take the fence lock. Or maybe the fence ctx lock.

Why would it want to do that? What does it want to signal? I suppose in
case of a close enough deadline you will do a firmware call to shovel
some more coals into the kettle.

The only GPU driver implementing it seems MSM anyways?


P.

