Return-Path: <linux-media+bounces-64262-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4EOJD0CqJ2pn0QIAu9opvQ
	(envelope-from <linux-media+bounces-64262-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 07:53:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CF365C8C4
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 07:53:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=HNE472lB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64262-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64262-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 280E2304AF8B
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 05:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02023CB2E5;
	Tue,  9 Jun 2026 05:53:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3FC1A6823;
	Tue,  9 Jun 2026 05:52:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780984380; cv=none; b=SYfvGLojTWwcVpEo6sxctR/APEc5e/67+eI1YFcaac8CzIfqzCIetEppc3Uj03nqzZEU+8dfwK9tbnpNqzoykCaDsmf7wJKxCEfFw4qFgYjAGpdaYInrRg2NvtWnsFnhb6mlpP2yl0NEepxHnkPRqXzh+SHSahZ8R8iYIOWYJe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780984380; c=relaxed/simple;
	bh=DjlIuTfEORagDsKUajtmEWOnbv/QfGzgC4Ja7CZdgbs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eVTzL8YSeqTcciDM0/icOAwEkiVnP4ocWeTnaisrAPI1Gbjqry1UidHADe2TJw0ZHVSzUzc/r+bOe02eMJUM+Vj6zkEaUJquSmOsNYsvnQhYyIL9UYpN7BTpGB0Puw0gNY+djTuAdanvsjBQ/Ytp3+rw7Eft7TRTX+Pdr3YpF+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HNE472lB; arc=none smtp.client-ip=80.241.56.151
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gZJ3W4ZLdz9tnc;
	Tue,  9 Jun 2026 07:52:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780984375; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DjlIuTfEORagDsKUajtmEWOnbv/QfGzgC4Ja7CZdgbs=;
	b=HNE472lBTKtN2dIwwLQ9Q0blRsOroDNaQWYlsKdVN0s4LjMdNY5XaLMsYxZ4G2ylkz+3xY
	bMPQJk/nOlYPVMdR3pTP8p2JWi+J0go30eF40hu374bwJW0vWMa6iSpKZf5XPCh52fYUDr
	JE6q9pX+8Rj35q/HBMPezrqhs8Rw2KylyGinZ0U0fB8U752Dgg0TGt2nu7FuXg5DA+lhuj
	0ISoy4mAV1FHmEzYYRM8LcM7veEPFBAP54qeeCMcK0jG1hS1YRtoXK0pSci+QAMITtjULd
	/d58TUS6mpka3Phn1VFr/o2phwd/XHyR4o0YE5CR4XxzxEJHIZ67ymk5KkiYfg==
Message-ID: <74bd33a06b75c291c3e2eda19e0250fbd280c49b.camel@mailbox.org>
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@kernel.org>
Cc: phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>, Boris
 Brezillon	 <boris.brezillon@collabora.com>, Alice Ryhl
 <aliceryhl@google.com>, Daniel Almeida <dwlsalmeida@gmail.com>, Gary Guo
 <gary@garyguo.net>, Tvrtko Ursulin	 <tvrtko.ursulin@igalia.com>,
 linux-media@vger.kernel.org, 	dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Tue, 09 Jun 2026 07:52:51 +0200
In-Reply-To: <c8564ea0-8ff4-4049-996d-bd978c478372@amd.com>
References: <20260608142436.265820-2-phasta@kernel.org>
	 <95f4ae6b-9dec-4122-84e0-fbb0cdee9cb5@amd.com>
	 <fa9a335196525adbc03ec21b2e05bb526e4fc174.camel@mailbox.org>
	 <9d49c901-fcdf-487a-a733-0320d0bdf94c@amd.com>
	 <DJ3V3OCLIK2K.3CYKWYNHYU6JQ@kernel.org>
	 <ea4e0541-3702-4014-b8f6-0746a148df86@amd.com>
	 <DJ3VYD71HDQ2.3C8GG983Z2YCM@kernel.org>
	 <c8564ea0-8ff4-4049-996d-bd978c478372@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: wdwhmg7e6fiisukgso3uxm5ushx8y5jh
X-MBO-RS-ID: fb9d2f2df7e01976380
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:dakr@kernel.org,m:phasta@kernel.org,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64262-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,collabora.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A8CF365C8C4

On Mon, 2026-06-08 at 20:47 +0200, Christian K=C3=B6nig wrote:
> On 6/8/26 20:39, Danilo Krummrich wrote:
> > On Mon Jun 8, 2026 at 8:32 PM CEST, Christian K=C3=B6nig wrote:
> > > On 6/8/26 19:59, Danilo Krummrich wrote:
> > > > On Mon Jun 8, 2026 at 7:34 PM CEST, Christian K=C3=B6nig wrote:
> > > > > That's why we need the RCU grace period to make sure that nobody =
is
> > > > > referencing the driver stuff any more.
> > > >=20
> > > > Right, and that's what Philipp tries to address, the requirement to=
 wait for an
> > > > RCU grace period is perfectly fine if it is only about freeing memo=
ry, but it
> > > > can become painful if the fence private data contains data also nee=
ds to be
> > > > destructed in some way.
> > >=20
> > > Yeah that makes sense.
> > >=20
> > > > IOW, if a driver signals a fence, it is lifecycle-wise reasonable t=
o destruct
> > > > the private data that is no longer needed (remaining users only dea=
l with struct
> > > > dma_fence) and having to wait for a full grace period adds sublety =
and
> > > > complication that can be avoided with the proposed approach.
> > >=20
> > > Yeah, I've run into that when I tried to make the amdgpu fences indep=
endent as well.
> > > > That said, I'd like to ask the opposite question: What are the conc=
erns with the
> > > > proposed approach over (pure) RCU?
> > >=20
> > > Well a) locking inversions and b) performance.
> > >=20
> > > For example the reason why we have the dma_fence_is_signaled() and
> > > dma_fence_is_signaled_locked() variants is because there is a measura=
ble
> > > difference in some specific use cases for not grabbing the locks.
> >=20
> > I checked for this as well, but couldn't find a case where
> > dma_fence_is_signaled() is used in a way where it would be performance =
critical
> > to avoid the lock in any way.
> >=20
> > Note that the lock is only bypassed when the fence is signaled already =
(this
> > would be preserved) and if signaled() returns false, i.e. dma_fence_sig=
nal()
> > will take the lock anyways.
> >=20
> > > I personally find those micro-optimizations rather questionable, but =
the
> > > community agreement is that we should have them.
> >=20
> > I agree, it is rather questionable. So, I wouldn't make this the decidi=
ng factor
> > unless someone can present a valid case where it actually matters.
> >=20
> > > So my take would rather be that the dma_fence_is_signaled_locked() va=
riant
> > > goes away and we consistently call the ops pointers without holding t=
he
> > > dma_fence lock and the driver implementations can then optionally tak=
e it if
> > > necessary.
> >=20
> > How did you get to this conclusion considering that you run into what I
> > mentioned above as well and the fact that we seem to agree that the per=
formance
> > concern is rather questionable?
>=20
> Quite simple, it's the cleaner approach.

Depends on the definition of "clean". Considering the scheduler
disaster, I learned that there is nothing cleaner than locking. It
provides perfect synchronization. It would eliminate the race that we
see for the Rust abstractions, and likely also the one that you have
seen.

The more of the heavy lifting the API does, the less likely it becomes
that drivers even start to interfer with your API internals, like
taking your internal locks to work around race conditions in the API
(talking about drm_sched again).

>=20
> Calling callbacks with locks held is rather questionable even putting the=
 performance issue aside.

We already see that a few drivers have to take the lock anyways, which
informs that it's probably necessary to take it for the racy conditions
this patch desires to address.

>=20
> In detail calling the callbacks without holding locks allows all implemen=
tations who need it to explicitly take locks in the order they want.

Didn't you say a few mails above that the implementation should not use
the fence lock for its own purposes?


P.

>=20
> If you call it with the lock held you enforce the fence lock the be the o=
utermost lock.
>=20
> Regards,
> Christian.

