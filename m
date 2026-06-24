Return-Path: <linux-media+bounces-65511-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X4RIGQmJO2qCZQgAu9opvQ
	(envelope-from <linux-media+bounces-65511-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:36:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B72026BC356
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:36:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=j738PO5c;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65511-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65511-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C21843059332
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 07:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC552DB7BD;
	Wed, 24 Jun 2026 07:34:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0BF18A6D4;
	Wed, 24 Jun 2026 07:34:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782286447; cv=none; b=PmpLzs/YIXOGcUZPnkumLi80gr6Dl11V7QvDdoHKjzNTCIXgm1kLtr+oIsKHHTmNSC0g1USXLaX0AIOx+5Ru7lbQizMhOsL+irdMzKsUJmFeaSUmslh3e+jybOjFhowRWygWPLgE5xfamC9HFiJpOKIa5sU5YWQ7KHSyFzctxH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782286447; c=relaxed/simple;
	bh=6xhqANqXbBDjD09Kcx3ptU85p1q/zZqKt88Vv4SvkH0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oWzh4YQMk8/1OohVGhhMKtynbHT1I1PhnGiyhFtXDezXrCTugmayDeZ7+rQA2AirswHltNTfVUgk+Q6vl03uR8xZP4HQxpxb9njaEh6mS0CqlQDzTxDFq26cFQVmlMBWI7axeu6wYSdqLaI9Se2S6SD0b29OZrhRU0dDeCKn3RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=j738PO5c; arc=none smtp.client-ip=80.241.56.161
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4glYb62rNLz9tw3;
	Wed, 24 Jun 2026 09:33:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782286434; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6xhqANqXbBDjD09Kcx3ptU85p1q/zZqKt88Vv4SvkH0=;
	b=j738PO5ccKMhV73EZ88zzWFCVeZeXn94C+R0K2QIyN3ab/CDS1w1b+YnnbsQRXZknXAGVR
	Dj0w+C+qK3faK+GrBaalyRck1ih+GMsBjr8gmjAPxiX7uEXQVu4uIXn1DaODjuUor+8gqM
	f4x9HhJ68SUn3XOgkqfWp+DmegWH5UB2DhvcUxEE5vejdAcSQskOu4HwR6iHxf3EVpmIGE
	CkySYvI3aSzZ+u1xkopwykwY3tihD1H91Zcov7TFjEIgAIVHMJwToi2Gzg3fVdq2bfojK/
	dHScushEe/9FKBTnS7vNYRg8up0+z2oBvY2QCwVI+or9wL98EGB6c1uUgopNww==
Message-ID: <2f2c50a8ff6d3fdd42d0d10535a129dd5a948801.camel@mailbox.org>
Subject: Re: [PATCH] drm/drm_crtc: fix race with dma_fence_signal() in
 ::get_driver_name()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>, 
	phasta@kernel.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,  Simona Vetter
 <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>,  Boris Brezillon
 <boris.brezillon@collabora.com>, Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Peter Griffin
	 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, kernel-team@android.com
Date: Wed, 24 Jun 2026 09:33:48 +0200
In-Reply-To: <1467578694a17b2b4978a6193cf21db324daff98.camel@linaro.org>
References: <20260618-linux-drm_crtc_fix2-v1-1-c03e77b36f34@linaro.org>
				 <1cfd56b7f1a166e25d6588d66a621524f3d983de.camel@mailbox.org>
			 <6483098adae29787862473e39b1f9cf3c3f16625.camel@linaro.org>
		 <f59d6080cf31f424ebcf0e6086b4a93623813a6e.camel@mailbox.org>
	 <1467578694a17b2b4978a6193cf21db324daff98.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 9d260a57382f0a7e894
X-MBO-RS-META: ua5w6qn7zzqcxerqb93cb4bo1d85bkrk
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andre.draszik@linaro.org,m:phasta@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tvrtko.ursulin@igalia.com,m:boris.brezillon@collabora.com,m:dakr@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:peter.griffin@linaro.org,m:tudor.ambarus@linaro.org,m:jyescas@google.com,m:kernel-team@android.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,collabora.com];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-65511-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B72026BC356

On Tue, 2026-06-23 at 15:33 +0100, Andr=C3=A9 Draszik wrote:
> > However, if my issue were to be solved with barriers, the
> > test_and_set_bit() in dma_fence_signal_timestamp_locked() would have to
> > be replaced with the more weakly ordered test_bit() and set_bit(),
> > maybe creating other pitfalls.
>=20
> For the avoidance of doubts, I'm not saying that all the issues you raise=
d
> can be solved by barriers instead of appropriate locks (I don't know enou=
gh
> about the code and issues in general here).

I'm not saying that you're saying that. I'm just cautioning you that
this change could be tricky.

>=20
> I do think however that appropriate locks will fix the ordering issue
> highlighted by sashiko (i.e. +1 for your argument). Barriers would fix th=
is
> specific issue, too, but that is not a statement about any wider issues.=
=20
>=20
> > The ordering issue in the get_*_name() functions plays into that.
> > Setting the bit would then be done after setting the ops-pointer to
> > NULL. So one would have to try to move the NULL set, too.
> >=20
> > Long story short, this is painful and subtle.
> >=20
> > But I think what we are realizing over and over again is that dma_fence
> > has many subtleties to its API contract, and the implementation's
> > sparring use of spinlocks leads to workarounds where people take locks
> > manually or have to do an RCU dance.
> >=20
> > Note that Christian is strongly opposed to guarding everything with
> > locks, in part for supposedly occuring deadlocks in the fence callbacks
> > when the driver needs to take its own locks.
>=20
> ww_mutex could help against deadlocks, but might affect performance, in c=
ase
> these are all critical code paths (IDK),

You can't use sleepable locks in fences. They fire in interrupt context
left and right ;)

Despite, that wouldn't even solve the reported problem.

The tl;dr is:

there is fence_ops->enable_signaling(), which is currently being called
with the fence lock held. So the driver, in that callback, cannot take
a driver-specific lock IF there is another driver party (like an IRQ)
taking first the driver lock and then the fence lock.

Which is why Christian K=C3=B6nig wants to remove the fence lock being held
in enable_signaling().

One reason why that, supposedly, is currently not a problem is that
without fence->inline_lock, you can protect the fctx with the same lock
and do fctx list manipulations in enable_signaling() with lock
protection.


If you have a big bowl of popcorn available, you could checkout this
thread:

https://lore.kernel.org/dri-devel/20260608142436.265820-2-phasta@kernel.org=
/

;p

My own thinking is:
If everyone used inline_lock, and if we could rely on everyone being
able to do the necessary work in enable_signaling() without said lock-
inversion, then we could perfectly synchronize all actions related to
dma_fence, including driver and, thus, fence_ops unload.

The only thing blocking really might be enable_signaling (the other
callbacks already take the lock). The more difficult question would be
how to implement that in a backwards compatible manner, i.e., for those
who don't have inline_lock.

Another idea for the distant future might be to question the existence
of those callbacks. Userspace often is sort of decoupled from the
hardware fences through intermediate fences already.

>=20
> > The community discussion regarding that problem is currently in some
> > sort of dead end, where none of us seems to know what the correct path
> > forward is.
>=20
> Please ignore if the following doesn't make sense, I'm just a bystander :=
-)
> How about at least adding the required barriers and related changes, and
> taking it from there? This would solve some immediate and easy to hit
> issues on Arm64? If they turn out to be insufficient, code can still
> be changed.
>=20

I am in support of that, which is why I posted that RFC for feedback
about the appropriate memory barriers.

>=20
> BTW, thanks Philipp for all these details, much appreciated.

You're welcome. If you'd find a clever solution, probably everyone
would be happy.


P.

>=20
> Cheers,
> A.

