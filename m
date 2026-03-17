Return-Path: <linux-media+bounces-56096-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJthBptyuWm8EgIAu9opvQ
	(envelope-from <linux-media+bounces-56096-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 16:26:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8146B2ACFD9
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 16:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7763E302DE49
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 15:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007333EB813;
	Tue, 17 Mar 2026 15:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qxEe2DnE"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A02220F38
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 15:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773760916; cv=none; b=eMZMBVUtsy16e+tpSWqZenwquO1ev/t06myXniqcfvPuBTev5X1FyBU2mO3YLN7fNLNOzlu2AUb+xtT2f0Dg9fGFItu70ApdtS37BB33xxJYAf1w1Zr0mq/H39erQsletzskUTxxi3OZW7pFy4Eajiv8Tam0mKOV0c4n6OYZksw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773760916; c=relaxed/simple;
	bh=HVmafZgBoeoiVvY3lnwIWzn8T+6u5QCQd/KhDZqlFc0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U3s8msx1idHQY/VuxUDOv52XUxWDHpMen040Hgidsrf8FlnjGdk/FSsMri0IwDegMj80a1VCwHoDs5Gpg+cFHgqlPqoScQ1v0i2OGpY+GEWiZRK0C+wN4hvO4N4Udr4FEipk+BGm8L1xeCZO7dM5/wYpWBelhgJJScLgV38DD1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qxEe2DnE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773760913;
	bh=HVmafZgBoeoiVvY3lnwIWzn8T+6u5QCQd/KhDZqlFc0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qxEe2DnEgxCi3CBkQtZYeU2pGCZxRFfj3zQJJoZzQIgQDmQlCG8SHKTcv/38oRNFy
	 5S4ymAJQPCLoOMkeOZbXboBx3248t9c7m0Kq1wnAaPUh6OxNx5Zb9OPyfxCDS36P+Y
	 RfWS2DyaWtYs6wHOW8fIEG327QV/5vC1khxF7F11SapbsrAvhILXxMRvaLd6WYakXR
	 u8/nhlEzTMY4EBQBghsHJvg9g19ibjj2W8KzJKdWUtiVjwWmL91KMzeBCcBQOJF71v
	 5M3eutiaGixEeGsmW1O0Z6dSSgRLdO6RG4pKETcBbX9bJcwAHTlZe11kWxBJbAryO5
	 lEMUgXbRBl1TQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D4FF717E12AA;
	Tue, 17 Mar 2026 16:21:52 +0100 (CET)
Date: Tue, 17 Mar 2026 16:21:47 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Christian =?UTF-8?B?S8O2bmln?=" <ckoenig.leichtzumerken@gmail.com>
Cc: phasta@mailbox.org, aliceryhl@google.com, gary@garyguo.net,
 lossin@kernel.org, daniel.almeida@collabora.com, joelagnelf@nvidia.com,
 sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] dma-buf/dma_fence: be more defensive in
 dma_fence_release
Message-ID: <20260317162147.4a7f03ff@fedora>
In-Reply-To: <20260317144825.2318-1-christian.koenig@amd.com>
References: <20260317144825.2318-1-christian.koenig@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56096-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: 8146B2ACFD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 17 Mar 2026 15:48:25 +0100
"Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.com> wrote:

> In case of a refcounting bug dma_fence_release() can be called before the
> fence was even signaled.
>=20
> Previously the dma_fence framework then force signaled the fence to make
> sure to unblock waiters, but that can potentially lead to random memory
> corruption when the DMA operation continues. So be more defensive here and
> pick the lesser evil.
>=20
> Instead of force signaling the fence set an error code on the fence,
> re-initialize the refcount to something large and taint the kernel.
>=20
> This will leak memory and eventually can cause a deadlock when the fence
> is never signaled, but at least we won't run into an use after free or
> random memory corruption.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 1826ba73094c..8bf07685a053 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -593,14 +593,24 @@ void dma_fence_release(struct kref *kref)
>  		/*
>  		 * Failed to signal before release, likely a refcounting issue.
>  		 *
> -		 * This should never happen, but if it does make sure that we
> -		 * don't leave chains dangling. We set the error flag first
> -		 * so that the callbacks know this signal is due to an error.
> +		 * This should never happen, but if try to be defensive and take
> +		 * the lesser evil. Initialize the refcount to something large,
> +		 * but not so large that it can overflow.
> +		 *
> +		 * That will leak memory and could deadlock if the fence never
> +		 * signals, but at least it doesn't cause an use after free or
> +		 * random memory corruption.
> +		 *
> +		 * Also taint the kernel to note that it is rather unreliable to
> +		 * continue.
>  		 */
>  		dma_fence_lock_irqsave(fence, flags);
>  		fence->error =3D -EDEADLK;
> -		dma_fence_signal_locked(fence);
> +		refcount_set(&fence->refcount.refcount, INT_MAX);

I'm not convinced this is useful. If we leak the object, no one should
have a ref to release anyway. This does raise a question though. The
case we're trying to protect against is fence_callback being registered
to this fence and waiting for an event to signal another proxy fence.
How can the refcnt drop to zero in that case? Isn't the proxy supposed
to own a ref on the fence. Before we go further, I'd like to understand
what we're trying to do.

The original discussion that led you to write this patch was about
detecting when a fence emitter/producer would leave unsignalled fences
behind, and the problem we have is when such unsignalled fences have
observers waiting for a "signalled" event. If the refcnt drops to zero
and the fence is released, we're already passed that point,
unfortunately. It can be that:

- the fence was never exposed -> this is fine
- the fence was exposed but never observed -> this is broken, because if
  it had been observed it would have led to a deadlock
- the fence was exposed, observed for some time, but the observer got
  bored, stopped waiting and:
  * decided to go and execute its stuff anyway -> use-before-ready
    situation
  * gave up -> kinda okay, but we should still consider the fence
    emitter broken
- the fence observer registered a callback but didn't take a ref on the
  object -> this is potential UAF on the dma_fence, which can also lead
  to a VRAM/system-mem UAF if the emitter drops the dma_fence without
  signalling, because of the auto-signal you're getting rid of in this
  patch.  But the latter is just a side effect of the dma_fence UAF,
  which I'm not convinced we should try to protect against.

>  		dma_fence_unlock_irqrestore(fence, flags);
> +		rcu_read_unlock();
> +		add_taint(TAINT_SOFTLOCKUP, LOCKDEP_STILL_OK);
> +		return;
>  	}
> =20
>  	ops =3D rcu_dereference(fence->ops);


