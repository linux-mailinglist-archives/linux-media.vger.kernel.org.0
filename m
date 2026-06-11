Return-Path: <linux-media+bounces-64554-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Rsl4MKpzKmokpgMAu9opvQ
	(envelope-from <linux-media+bounces-64554-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 10:36:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C8366FEBD
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 10:36:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=uaMp22tC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64554-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64554-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23CBC30515B5
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 08:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A153603D8;
	Thu, 11 Jun 2026 08:35:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928A533ADB3;
	Thu, 11 Jun 2026 08:35:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166952; cv=none; b=V9loLh+l9zU7qcmtpQk9SpKQ2Ch5ht4atXLHcxJfjMVFerfqftjDIg2WQ5JvtHORDTmjwqM3L/p9ImWaoe4S9y3bfzPnmk/b/2vb919JG87pHcHmSO3d8jZzZf6W/gG3sJ3RIY9TNxgA/HT4bunjKrPd3NB3Rvj8jjM2qjPhgaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166952; c=relaxed/simple;
	bh=/oDzdtFsDxmXbmdX1f70jqkMBg6UYhrzGU6tNoNvqAY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q++w/0eK0VaqrnTu3aBg0k8MG4mg7q/Q+wuJhbSEWyUcd2QTsPlq25lzO7ZEvu5BuLiYXqmCILTcCWOb4oS8i1t0i2Ztp3j7p4DAQeRjgZnWX3xzAlTPf8pRB3Wm6r1QPl8Glpg+oriwMA8LV7flNbcmDXOSKaMX2sJTcuDxQJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=uaMp22tC; arc=none smtp.client-ip=80.241.56.171
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gbbZP2Y3Yz9v8K;
	Thu, 11 Jun 2026 10:35:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781166941; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t3zGqxrqDGTn6iNjRiRv1YBDzAzUtFiidSls+PWmRL4=;
	b=uaMp22tCm6+0Js+gX7SpB+kW1EAan4ZJsOnoENdm+OYB2yDFhbStu6dRSZjK2y4SwRThNg
	9merik+rgKdu7juweO6MpXexV2oqSgHsq6y+C7dIXG5S58Q46aFFPyRqVwWk/BjWA/Ned7
	FmnLIDFFSIWBgHf9eQNBgWpFHsz2GUznXDAOMcCs3agy5mAhVbrjS4HoKTVGAaWhCNjtQU
	BtAQdXFaYdVXAjhGQyuNNmNPZjLdYTTFjWlWPzxSFraHDSa4VrqirB0TrSnlcm2DXEg2a0
	nlnHfvE52l1mVMokPSURNsiS5T3oK75QhetOhbx2kptXIpRYoTXfI+ckRq8t6g==
Message-ID: <c6a3964b130ac371e203aeee5f5b52d146c22bea.camel@mailbox.org>
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
Date: Thu, 11 Jun 2026 10:35:23 +0200
In-Reply-To: <25494ee8-5108-4044-b4d9-cfcb37c397ea@amd.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: da64a336935e154262a
X-MBO-RS-META: 39d5xwskdbppfbj8cj4czq8puguggt9t
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64554-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38C8366FEBD

On Wed, 2026-06-10 at 17:15 +0200, Christian K=C3=B6nig wrote:
> On 6/10/26 16:25, Philipp Stanner wrote:
> >=20
> > Are you referring to this comment from the documentation?
> >=20
> > =C2=A0* Since many implementations can call dma_fence_signal() even whe=
n before
> > =C2=A0* @enable_signaling has been called there's a race window, where =
the
> > =C2=A0* dma_fence_signal() might result in the final fence reference be=
ing
> > =C2=A0* released and its memory freed. To avoid this, implementations o=
f this
> > =C2=A0* callback should grab their own reference using dma_fence_get(),=
 to be
> > =C2=A0* released when the fence is signalled (through e.g. the interrup=
t
> > =C2=A0* handler).
> > =C2=A0*
> > =C2=A0* This callback is optional. If this callback is not present, the=
n the
> > =C2=A0* driver must always have signaling enabled.
> > =C2=A0*/
> > =C2=A0bool (*enable_signaling)(struct dma_fence *fence);
>=20
> Yes, that was an extremely bad idea which I have tried multiple times to =
fix.

What's the reason why enable_signaling() is nowadays called with lock-
protection?

>=20
> >=20
> > > and delegates the signaling to the caller instead of doing it itself.
> >=20
> > Who delegates what to whom?
> >=20
> > enable_signaling() is called indirectly by someone who adds a callback.
> > If enable_signaling() is implemented, then the driver callback's only
> > job is to activate some sort of interrupt or worker that will signal
> > that fence at some point.
>=20
> No, enable_signal also returns if enabling was successfully if it wasn't =
successfully the dma_fence framework signals the fence.=C2=A0=20
>=20
> > > This in turn means that you can't do proper cleanup after the
> > > signaling is done by grabbing driver specific locks.
> >=20
> > Sure you can. If everything is properly synchronized.
> >=20
> > // driver
> > dma_fence_signal(f);
> > // all callbacks can't reach our driver anymore
>=20
> That's irrelevant. The question is not if a callback can reach the backen=
d after signaling.

Irrelevant for your lock-inversion maybe. It's very relevant for life
time and module unload. Proof: you and Tvrtko made dma_fence_signal()
the decoupling point, with RCU protection.

And as I keep saying, that synchronisation point would make the entire
framework simpler and more robust if we were making it consistent.

>=20
> The question is if the backend can clean up after dma_fence_signal() comp=
letes.
>=20
> > struct driver_fence =3D container_of(f);
> > lock(driver_fence->special_lock);
> > cleanup(f);
> > unlock(=E2=80=A6);
> >=20
> > Where is the deadlock?
> >=20
> > I continue to fail to see it. Show me an example of some code that
> > would deadlock, please. Either fictive or from the kernel.
>=20
>=20
> Interrupt driven signaling path:
>=20
> spin_lock_irqsave(driver->fence_list_lock, flags);
> list_for_each_entry_safe(...) {
> 	if (fence->seqno < signaled_seqno)
> 		break;
> 	dma_fence_signal(fence);
> 	list_entry_del(&fence->list);
> 	dma_fence_put(fence);
> }
> spin_unlock_irqsave(driver->list_lock, flags);
>=20
> Enable signaling path:
>=20
> myfence_enable_signaling()
> {
> 	if (fence->seqno <=3D signaled_seqno)
> 		return false;
>=20
> 	talk_to_the_hw();
> 	return true;
> }
>=20
> The problem here is that the enable_signaling path can't grab the
> driver->fence_list_lock because that would be lock inversion with the
> fence lock.
>=20
> Implementations came up with tons of workarounds for this which only
> work more or less correctly. The issues Nouveau had is just the tip
> of the iceberg here.

The fact that every implementor right now can live without driver locks
proofs that it can be done.

The few implementors of enable_signaling() who'd really run into an
inversion could address that with various techniques, like using an RCU
list, llist, rw_lock..

I would imagine the most common action for enable_signaling() is to
check whether an interrupt is already registered. If not, register it.
Is that where you got lock inversions?

>=20
> If we nuke the fact that enable_signaling() is called while holding
> the fence lock all that complexity goes away.

I'm afraid you cannot nuke that, Dr. Oppenheimer :p

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

> =C2=A0In other words it would then look like this:
>=20
> myfence_enable_signaling()
> {
> 	spin_lock_irqsave(driver->fence_list_lock, flags);=09
> 	if (fence->seqno > signaled_seqno) {
> 		talk_to_the_hw();

This doesn't need the list lock.

> 	} else {
> 		dma_fence_signal(fence);

Without the fence lock protection someone else could have signaled the
fence already btw and now be spinning to do the same list deletion.

> 		list_del(fence->list);
> 		dma_fence_put(fence);
> 	}
> 	spin_unlock_irqrestore(driver->fence_list_lock, flags);=09
> }


Plus I don't see why that callback would have to signal the fence. The
return of the boolean=C2=B9 seems very consistent with
dma_fence_is_signaled() to me, which asks "is this job done?" and if
the answer is "yes", the framework signals that fence.

Regarding ops->signaled(), that really just needs to read some
ioremaped u64 integer and then return true or false. That will never
need a lock for anything.

So again: the code is already such that implementors of
enable_signaling() and signaled() need to assume that the fence lock is
being held by someone else. All the practical evidence shows that the
lock protection is actually necessary.

All we have to do is make the existing rules official and the code a
bit more consistent.

P.


[=C2=B9] though we probably want an int error code as the return value of
enable_signaling(), to distinguish between error and "already
signaled".

>=20
> > Nouveau's enable_signaling() callback does not take locks. Its
> > signaled() does not take locks.
>=20
> Yeah because Nouveau reverted like most driver to use the same
> spinlock for the driver lock and the fence lock.
>=20
> But that approach is fundamentally broken, a) you can't cleanup from
> the is_signaled path because that can be called with both the lock
> held and not held and b) it doesn't allow the fences to be
> independent of the driver who issued them.
>=20
> When it would just be that we consistently call the is_signaled path
> with the lock held I would immediately agree, but that breaks fence
> independence and already caused so many issues that I clearly want to
> remove it.
>=20
> Regards,
> Christian.=20

