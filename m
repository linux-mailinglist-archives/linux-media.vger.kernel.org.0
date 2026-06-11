Return-Path: <linux-media+bounces-64569-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q4jJK1KFKmqqrgMAu9opvQ
	(envelope-from <linux-media+bounces-64569-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:52:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ADB670962
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:52:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=SfbHZSdf;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64569-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64569-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6712A3084B91
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 09:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E793C73D7;
	Thu, 11 Jun 2026 09:50:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882343C5859;
	Thu, 11 Jun 2026 09:50:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171453; cv=none; b=iuLQoBZBlTQfYrxIzRT8+Zni3ZbgILReVkOFpmZYVNbsgEkIhzwNiHHyS2YtL/S25HNvgpPX3UARxqyswJTraUMqIE1zvi7x/3QFalXqUp3ZYd23olphJlUFP/6jLNO3ON53LeSHWyIhDIz5DgxDsZq2LUcimaSuyWWbv3Svxd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171453; c=relaxed/simple;
	bh=aPX3n+C5V8MsRi2dOp4y3r4rdX6Hj6hn4btHGIuhhGg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O+KSI71143NE3x4Fnt5cFjD6QE731NLjV91Z25Dn8nlAhU1ZQMxLlYTSd11S7neb9NrTLB3D0bcJyBONyEf4fFKN0zt05dHjS3jyh7bhm+wmuDvN30GlmSBNorjOf8PC87fL7XhLaaMrPzUdibpyh84acA+nbLrrSCcTBiUevLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SfbHZSdf; arc=none smtp.client-ip=80.241.56.171
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gbdF20qKmz9txq;
	Thu, 11 Jun 2026 11:50:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781171446; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8APNNjMUqlJKRCWIhdXA+v06KtrUcTvadK3ymXZ0K00=;
	b=SfbHZSdfOWpHH4Gu+n0dJwYZi7PskhcxXQ66iCSadWUCaegazL/hohsCOotozPaE/w/iUj
	pFoAModvZajLQMaPEs2nmls4yOvEnUiJxKXo7LDWMzRsRuHfdz/tWbyywezInt/XguaNXY
	U0YRPX4J7lcKjNx2ua91UyyUgJJQNAxnDaoFVVjfAB1FXL/4ShhClpR+jb1N8Hn6Kuuvxs
	ZjdA3g8hp9XneqBL+E8o3qxJ/vbAlkrf3FMYMcU06IPoap0uJ+No7JM+WEmIXr2srMNi4v
	nnHSo9eLyBUR/gYMzAnIA3gpvduGmQjn8qpRUHKw4lQI2dpt1uJDIAA7Yee1Ng==
Message-ID: <7dc7920604169a8d7ff97c70bb3867286f3b3ea3.camel@mailbox.org>
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
	phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>, airlied@gmail.com
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Boris Brezillon	
 <boris.brezillon@collabora.com>, Alice Ryhl <aliceryhl@google.com>, Daniel
 Almeida <dwlsalmeida@gmail.com>, Gary Guo <gary@garyguo.net>, Tvrtko
 Ursulin	 <tvrtko.ursulin@igalia.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Thu, 11 Jun 2026 11:50:38 +0200
In-Reply-To: <c3e8a9b8-e344-491f-8b8c-f6a682f15121@amd.com>
References: <20260608142436.265820-2-phasta@kernel.org>
	 <95f4ae6b-9dec-4122-84e0-fbb0cdee9cb5@amd.com>
	 <fa9a335196525adbc03ec21b2e05bb526e4fc174.camel@mailbox.org>
	 <9d49c901-fcdf-487a-a733-0320d0bdf94c@amd.com>
	 <DJ3V3OCLIK2K.3CYKWYNHYU6JQ@kernel.org>
	 <ea4e0541-3702-4014-b8f6-0746a148df86@amd.com>
	 <DJ3VYD71HDQ2.3C8GG983Z2YCM@kernel.org>
	 <c8564ea0-8ff4-4049-996d-bd978c478372@amd.com>
	 <aebe759117cd65004510946e39bd02e4c903e1e3.camel@mailbox.org>
	 <84519e72-e057-45f9-8ace-baf12f095e55@amd.com>
	 <29754897c2b6d0a9560a05fcd1c0a0946577518d.camel@mailbox.org>
	 <25494ee8-5108-4044-b4d9-cfcb37c397ea@amd.com>
	 <c6a3964b130ac371e203aeee5f5b52d146c22bea.camel@mailbox.org>
	 <c3e8a9b8-e344-491f-8b8c-f6a682f15121@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 1b548ff8d1a05a45a6e
X-MBO-RS-META: uxk6mykxh1hgxhodj13rkj7kifefowsr
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64569-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:phasta@kernel.org,m:dakr@kernel.org,m:airlied@gmail.com,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,collabora.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[spinics.net:url,mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24ADB670962

On Thu, 2026-06-11 at 11:14 +0200, Christian K=C3=B6nig wrote:
> On 6/11/26 10:35, Philipp Stanner wrote:
> > On Wed, 2026-06-10 at 17:15 +0200, Christian K=C3=B6nig wrote:
> > > On 6/10/26 16:25, Philipp Stanner wrote:
> > > >=20
> > > > Are you referring to this comment from the documentation?
> > > >=20
> > > > =C2=A0* Since many implementations can call dma_fence_signal() even
> > > > when before
> > > > =C2=A0* @enable_signaling has been called there's a race window,
> > > > where the
> > > > =C2=A0* dma_fence_signal() might result in the final fence referenc=
e
> > > > being
> > > > =C2=A0* released and its memory freed. To avoid this,
> > > > implementations of this
> > > > =C2=A0* callback should grab their own reference using
> > > > dma_fence_get(), to be
> > > > =C2=A0* released when the fence is signalled (through e.g. the
> > > > interrupt
> > > > =C2=A0* handler).
> > > > =C2=A0*
> > > > =C2=A0* This callback is optional. If this callback is not present,
> > > > then the
> > > > =C2=A0* driver must always have signaling enabled.
> > > > =C2=A0*/
> > > > =C2=A0bool (*enable_signaling)(struct dma_fence *fence);
> > >=20
> > > Yes, that was an extremely bad idea which I have tried multiple
> > > times to fix.
> >=20
> > What's the reason why enable_signaling() is nowadays called with
> > lock-
> > protection?
>=20
> That was some decision originally made a long long time ago because
> the initial thought was that fence need to signal in order, but that
> concept was also abandoned a long long time ago.

You also need it to avoid a race with the driver's requested signalling
in ops->enable_signalling(), through dma_fence_add_callback().

I pointed that out in my answer. You cut it out and did not react to
that statement.

>=20
> Fixing this is on my TODO list ever since we figured out that this
> was a bad idea, see the latest patch set here as well:
> https://www.spinics.net/lists/dri-devel/msg461253.html
>=20
> > > > Sure you can. If everything is properly synchronized.
> > > >=20
> > > > // driver
> > > > dma_fence_signal(f);
> > > > // all callbacks can't reach our driver anymore
> > >=20
> > > That's irrelevant. The question is not if a callback can reach
> > > the backend after signaling.
> >=20
> > Irrelevant for your lock-inversion maybe. It's very relevant for
> > life
> > time and module unload. Proof: you and Tvrtko made
> > dma_fence_signal()
> > the decoupling point, with RCU protection.
> >=20
> > And as I keep saying, that synchronisation point would make the
> > entire
> > framework simpler and more robust if we were making it consistent.
>=20
> Exactly that's what I strongly disagree on.

Yeah, and you don't provide any rationale AFAICS. The argument
basically is "this is how it is, and it is how it is because it is like
that". It's "this is done with RCU instead of locks, because you can
use RCU for that".

No offense intended, but I just can't see any substantial argument
except for non-existing deadlocks that COULD ALREADY OCCUR and have to
be mitigated by the drivers already.

>=20
> The fence lock and the synchronization point which allows the driver
> to know when nobody else is in a callback any more are two very
> different things we should not be mixed up together.

Why? It's literally what locks exist for. For synchronization.

RCU has been literally developed for deadlock avoidance, which its
usage in dma_fence provably doesn't achieve. You still have the
deadlock problem, and on top of that you have redundant, unnecessary
RCU calls.

>=20
> The fence lock protects the signaled state of the fence, so that the
> fence functions can add callbacks, test signaling etc... while the
> fence can't signal. It is protecting internal state of the fence and
> so should be internal to the fence, external code should not touch it
> if possible.

You allow people to take the lock manually with the API function
dma_fence_lock_irqsave().

But you know what, I absolutely agree!

I think if we take the locks for the callbacks and remove
dma_fence_set_error(), then the need to ever touch the lock manually
disappears.

Then the driver knows what I pointed out at least three times now:

dma_fence_signal(f);
cleanup(f); // perfectly safe, bc after signal() all accesors are done

No RCU, no nothing. Just plain proper synchronization.

But when I point that out, you say "No no, you can't do that, that's
not the purpose of the lock, you have to do:

dma_fence_signal(f);
call_rcu(cleanup(f));
"

???

>=20
> The synchronization point for the driver is a service the dma_fence
> implementation offers to let drivers know when there is no more
> caller of their function. And usually this is implemented using
> RCU/SRCU.

"this is how it is because it is how it is".

The one and only reason why you need RCU is that you don't lock
consistently.

Using RCU everywhere is nothing but symptom treatment.

>=20
> Tvrko and I now choose RCU instead of SRCU because there didn't seem
> to be a need to sleep in the fence callbacks.

You can't sleep in the callbacks, because the callbacks are invoked
with the fence spinlock being held.

>=20
> But both RCU and SRCU offer not only synchronize_rcu()/_srcu() but
> also call_rcu()/_srcu() which allows drivers to delegate the cleanup
> to a point where it is save to do so.

"We use RCU instead of locks because we can use RCU instead of locks".
This is not an argument against locks, Christian.

If you lock consistently, cleaning up after dma_fence_signal() is
guaranteed to be safe to do, immediately.

>=20
> So while I see the problem I actually don't understand why you insist
> of solving it with the fence lock?

Well, that's then a philosophical moment, because I on the contrary
don't understand why you insist on solving it with RCU :D

The tl;dr is: using the locks makes the entire implementation more
robust and consistent and allows for removing the RCU delays.

I showed you a bug that would have been prevented with locks. It was
caused by the improper synchronization, where dma_fence_is_signaled()
can return true when the callbacks have not yet been run.

The solution is to use

dma_fence_lock_irqsave(f);
if (dma_fence_is_signaled_locked(f))
  cleanup(f);
dma_fence_unlock_irqrestore(f);

IOW=E2=80=A6 the solution is to call the ops->signaled() callback with the =
lock
held=E2=80=A6=E2=80=A6=E2=80=A6 notice something? ;)

I provided more rationale on the rest of my mail, but you cut that out.
Here, let me repost it:


"
You need the lock for synchronization. To add the callback.

Basically, you came quite naturally to the same conclusion and solution
as I did: you need / want race-free synchronization.

It's the exact same use-case, really. You want to prevent someone from
interfering with the fence while the ops->callback is running. You need
the lock for that, by definition.

The other two relevant callbacks, signaled() and set_deadline(),
already have the same lock protection guarantee. The former through
dma_fence_is_signaled_locked(), the latter through  the fact that
everyone takes the lock immediately after callback begin anyways.
"

and

"
All we have to do is make the existing rules official and the code a
bit more consistent.
"


The deadlock argument doesn't hold up because the lock is already being
taken for enable_signalling() and signaled().

I showed you one Nouveau bug which the locks would have prevented.

Furthermore, I argue that it's impossible for you to remove the lock
protection from ops->enable_signalling().

I further argue that consistent lock protection would allow for
removing the need for dma_fence_is_signaled_locked() and
dma_fence_lock_irqsave() as public APIs.


>  That just brings us back to the bad design we had before where
> internal fence state is abused to protect something else.

If we apply my design, we could deprecate dma_fence_lock_irqsave() and
thereby declare it illegal to do that.

Relying on dma_fence_signal() being a point of synchronization is
completely different from using its internal lock to protect your own
list or tree or whatever.


P.

>=20
> Regards,
> Christian.

