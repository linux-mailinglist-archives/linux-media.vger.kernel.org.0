Return-Path: <linux-media+bounces-52517-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH3kCCEpi2n1QQAAu9opvQ
	(envelope-from <linux-media+bounces-52517-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 13:48:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E27A11AFE2
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 13:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A9595300C366
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 12:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F5531B13B;
	Tue, 10 Feb 2026 12:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Omxd9ntP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518722EA754;
	Tue, 10 Feb 2026 12:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770727704; cv=none; b=HUi0gQz7cQjXfAqaGMkw9iYel9cQyFJLqMqnSkZxTEOioaAqNrMAYUIqXvyJ9vLYNnMZuQHHgFTtZw5U05hBOd8KUrxmHHLsGlB8IJkaIYNJiVnmC7btLT7ckuHdEIGYlB8RxdxvwsopZz00NziWOiJaOJZkD/RlCi68Eb4hKvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770727704; c=relaxed/simple;
	bh=f9Hioy1nBNAN6Nj6FmxHzvPM8qjWxbtxXn6ma/BOEN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLjlAd8pZq0BjUhkI8oEbd0KDsT5gdjpx0hfLkyp4ng1SxVvksP6nykT//pkH7Y5+xkBaAAx8DlvWHwsT97mTOtXPFGN26DMbeMbdkOW50sAYKrO4Qds0uyrW2KHUzkndrII4nC3wNwGW4rtZBd3PF0pGicSM8PdR91QWraVouE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Omxd9ntP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AAD6C116C6;
	Tue, 10 Feb 2026 12:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770727704;
	bh=f9Hioy1nBNAN6Nj6FmxHzvPM8qjWxbtxXn6ma/BOEN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Omxd9ntPib7buprI2avF9vcC5Snk52LrNPhoNyFSO+Pp/RnFY9OpJi8PDjJVaxHmb
	 JXUYYvf8mDOqJL00C/SA5U6DUzy7M/eEd+7C4i1SVv3A4qZh92mM5Rm14mro68cR2t
	 6h0t8AeSTNBPNmliXeDF6glQjfeed1kx5MhPTPGFC1WpXrv0JLEgHiJbUaah2n5b5Z
	 gAdRG3klf2YYAP5MWPc6bLxDm6TKYyUEZQvEGN2z5fMUW9rlSD2hezSOCJvY1XcU/+
	 BRxCvbm1bcNecNnEBO0TGKpRpqR28vrU2kjBTA1jfqTtyRVkkCx0KnIFJBp3Nan0jG
	 VoQHRcdYSklIg==
Date: Tue, 10 Feb 2026 14:48:19 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jiri Pirko <jiri@resnulli.us>
Cc: John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, jgg@ziepe.ca,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH 4/5] dma-buf: heaps: allow heap to specify valid heap
 flags
Message-ID: <20260210124819.GC12887@unreal>
References: <20260209153809.250835-1-jiri@resnulli.us>
 <20260209153809.250835-5-jiri@resnulli.us>
 <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
 <hwdezwktndbm6hoko3rz5lffgfljodegcygzf6rbdf2ferokj6@ftk2uk3rqfdq>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hwdezwktndbm6hoko3rz5lffgfljodegcygzf6rbdf2ferokj6@ftk2uk3rqfdq>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52517-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3E27A11AFE2
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 10:05:14AM +0100, Jiri Pirko wrote:
> Mon, Feb 09, 2026 at 09:08:03PM +0100, jstultz@google.com wrote:
> >On Mon, Feb 9, 2026 at 7:38 AM Jiri Pirko <jiri@resnulli.us> wrote:
> >>
> >> From: Jiri Pirko <jiri@nvidia.com>
> >>
> >> Currently the flags, which are unused, are validated for all heaps.
> >> Since the follow-up patch introduces a flag valid for only one of the
> >> heaps, allow to specify the valid flags per-heap.
> >
> >I'm not really in this space anymore, so take my feedback with a grain of salt.
> >
> >While the heap allocate flags argument is unused, it was intended to
> >be used for generic allocation flags that would apply to all or at
> >least a wide majority of heaps.
> >
> >It was definitely not added to allow for per-heap or heap specific
> >flags (as this patch tries to utilize it). That was the mess we had
> >with ION driver that we were trying to avoid.
> >
> >The intent of dma-buf heaps is to try to abstract all the different
> >device memory constraints so there only needs to be a [usage] ->
> >[heap] mapping, and otherwise userland can be generalized so that it
> >doesn't need to be re-written to work with different devices/memory
> >types.  Adding heap-specific allocation flags prevents that
> >generalization.
> >
> >So instead of adding heap specific flags, the general advice has been
> >to add a separate heap name for the flag property.
> 
> Right, my original idea was to add a separate heap. Then I spotted the
> flags and seemed like a great fit. Was not aware or the history or
> original intention. Would be probably good to document it for
> future generations.
> 
> So instead of flag, I will add heap named something
> like "system_cc_decrypted" to implement this.

It is problematic to expose a user‑visible API that depends on a name.
Such a design limits our ability to extend the functionality in the
future, should new use cases arise.

Thanks

> 
> Thanks!

