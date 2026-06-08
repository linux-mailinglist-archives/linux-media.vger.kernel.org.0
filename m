Return-Path: <linux-media+bounces-64206-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xeBHFszbJmrPlwIAu9opvQ
	(envelope-from <linux-media+bounces-64206-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 17:12:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EB8657E19
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 17:12:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="mX/JpbM3";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64206-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64206-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 280E93371E3E
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 14:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FF73DA5C7;
	Mon,  8 Jun 2026 14:43:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926423F074A
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 14:43:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929805; cv=none; b=Az3S7XV+LJR4e54/OVhavaFWE564WIfROqRkwTaqSzR5EK3S1bL0ySvyWgrJ5Jzt78VDrxvX4aV2dusX1yjWQSN+8HgHGPAgpMg1PdBVYkgxwVfEJ26+cH++uhoRbh0HiVGmABmOhtvoIW23H8i1tUk6bQs8k1HxaPJI45t7GJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929805; c=relaxed/simple;
	bh=0M/wop0v95SHUASaDEv81290Buwc1hbSTX3e6J5XV6I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CKXl0yzm3BwaYubp0NSZ262mx2d2u+mje4jruJIAA8spWSA5qZK9qo2RKGczsactgIc+W1YxXDOXYPMI0Ijd7FZdrfVw6KIMYZIUeYOz5Z9iIQgEqI21uzLdto4UfVAyB/nv2hnPnAO23I+ZkjSytK3hATLn14H0pPPvTwtT26c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mX/JpbM3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94611F00A05;
	Mon,  8 Jun 2026 14:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929798;
	bh=SiOz+EaWQLpTNnWUBed/5uaugQ1N9TW/odXdDg4bV4M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mX/JpbM3gF+YZWlzAZb/nNlVGDn3xt6Bc3QW++Hb/LOntTh+SH0RpDUGWKuLaV41N
	 lmiHjBSiq9daZtI7WOtZ0V4pamMjzuz4bCj9ud7D8RwiYCEAI5nOIpr/Qzz/G+aloZ
	 g2gWhOA2Fhjp8r25Ok4Jhe8c+K3wpiaymfkVDPOo9ZH3CAhej8mGfjlDPuocSTz3V0
	 iCfYivr9Yy0Q76a2JnsG4dkKowkKPSYYfdZ+oyakmHJIdZ5OTNwC/7tK8lclvDzpGc
	 Wzi0bQJKVM4YTw8LdcJQJ/fw+Da144+ZhimC6jrW3ta954aEkkofFEuBYInDtojt7o
	 1cyv6u9MH1d7w==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
Reply-To: sashiko-reviews@lists.linux.dev
To: "Philipp Stanner" <phasta@kernel.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260608142436.265820-2-phasta@kernel.org>
References: <20260608142436.265820-2-phasta@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 14:43:17 +0000
Message-Id: <20260608144317.E94611F00A05@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64206-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7EB8657E19

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Double acquisition of the fence spinlock in `__dma_fence_enable_si=
gnaling` causes an unconditional self-deadlock.
- [High] Acquiring the fence spinlock in `dma_fence_set_deadline` causes de=
adlocks with backend drivers.
--

commit a0ed8f208472e7d15328c05be3bdfe3b20342e3b
Author: Philipp Stanner <phasta@kernel.org>

dma-fence: Fix races of fence callbacks versus destructors by locking

This patch modifies dma-fence backend operations to take the fence lock
before executing callbacks. This aims to prevent races between a driver
signaling a fence and freeing its resources while a callback is accessing
driver-specific data.

> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
[ ... ]
> @@ -629,7 +629,8 @@ EXPORT_SYMBOL(dma_fence_free);
>  static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>  {
[ ... ]
>  	if (!was_set && ops && ops->enable_signaling) {
>  		trace_dma_fence_enable_signal(fence);
> =20
> -		if (!ops->enable_signaling(fence)) {
> +		dma_fence_lock_irqsave(fence, flags);
> +		success =3D ops->enable_signaling(fence);
> +		dma_fence_unlock_irqrestore(fence, flags);
> +		if (!success) {

[Severity: High]
Will this cause an unconditional deadlock?

Looking at the beginning of __dma_fence_enable_signaling(), there is a
dma_fence_assert_held(fence) check, meaning the fence spinlock is already
held when entering this function.

Since standard Linux spinlocks are not recursive, won't attempting to
acquire the same lock a second time here immediately deadlock the CPU?

[ ... ]
> @@ -1020,11 +1024,20 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>  void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>  {
[ ... ]
> +	dma_fence_lock_irqsave(fence, flags);
> +	if (!dma_fence_is_signaled_locked(fence))
>  		ops->set_deadline(fence, deadline);
> +
> +	dma_fence_unlock_irqrestore(fence, flags);
>  	rcu_read_unlock();
>  }

[Severity: High]
Could taking the lock around this callback cause deadlocks with backend
drivers?

Historically this callback was invoked unlocked, and multiple backend
implementations (such as drm_sched_fence_set_deadline_finished or
msm_fence_set_deadline) explicitly acquire the fence spinlock internally.

If the core now calls them with the lock already held, it appears they will
deadlock trying to acquire the non-recursive lock again.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608142436.2658=
20-2-phasta@kernel.org?part=3D1

