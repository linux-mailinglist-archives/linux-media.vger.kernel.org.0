Return-Path: <linux-media+bounces-61912-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PetG1nVCmpK8gQAu9opvQ
	(envelope-from <linux-media+bounces-61912-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:01:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B82569416
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD8AC302452B
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 08:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B318F3E3D9E;
	Mon, 18 May 2026 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pwwmVtLh"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9652E3E2AB0;
	Mon, 18 May 2026 08:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779094650; cv=none; b=UKDugSL0TXlZQsCtirn2kBTZzrIeUedf6Dd79FmkH0Qc8O1e57jaDOdf1QdB0S6zvQmJKAQEmlKk8jU8OBdmhgBuTjxPODOagf2Yjb0qIomG17464DpvOVdU+Xs7iJ+5eyUzLyYx7wN476HTgceWIhkxksqNcOvJMsKuXQ3Vrbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779094650; c=relaxed/simple;
	bh=2qTLaW/COV+GfxNT+S1Mi+IrpTKOlvQB9ZJrbZDjHvI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ton3PVidIrD2LL8vUDvQ7qW7m0qgUZLSgFcuW3dW0Hyc0rA5YbUiwd+bgx2CokDpgPwPEVa4Vd/slgNL2hQWD+Sq/20aoPciiU0SitUJnfxhf7JnZSRAryDkV0CgsZswF877XArydKbxrkhyFh5xmvjfGlUCTEjs89PDjJktkdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pwwmVtLh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779094646;
	bh=2qTLaW/COV+GfxNT+S1Mi+IrpTKOlvQB9ZJrbZDjHvI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pwwmVtLhoMYQTahDd2zJsjpmIP5OzRDUKAElxBRbyqPqhFEwXyQkDtRrG0LxRQgI5
	 wF9B8xvYuSvSdD6HcplGKMY+AxD+Dd3nUeGfwtc/0ETVDauGIuE2fkRB30chfo/GrR
	 qUMrZDKkO04TeIYAle5Cgbvvkc7KiAsC/S2d53WSQoF6wbOUSAt/2b09UG1lY4fyQf
	 J74eyWJIz9tMYQU6K1fLG8IAgD9A10Q7P+RG4q7DS26UxuWdgnvvXRLIn4CCACWuGO
	 8MpaFvFYZPa6tbPLkRlP2CzjqnY+UymXtRmFzPkGG7e3hLDN35U7H/pH093EPXUJ09
	 O657R13F7DLaw==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 419D217E0443;
	Mon, 18 May 2026 10:57:26 +0200 (CEST)
Date: Mon, 18 May 2026 10:57:21 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] drm/panthor: Driver-wide xxx_[un]lock ->
 [scoped_]guard replacement
Message-ID: <20260518105721.42ffa64c@fedora>
In-Reply-To: <5ab2d07c-74a4-4a2c-b145-6ed7b0060944@arm.com>
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
	<20260513-panthor-guard-refactor-v1-1-f2d8c15a97ce@collabora.com>
	<5ab2d07c-74a4-4a2c-b145-6ed7b0060944@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A7B82569416
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61912-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,linaro.org,amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, 14 May 2026 14:16:37 +0100
Steven Price <steven.price@arm.com> wrote:

> On 13/05/2026 17:58, Boris Brezillon wrote:
> > Right now panthor is mixed bag of manual locks and guards. Let's
> > make that more consitent and thus encourage new submissions to go
> > for guards.  
> 
> I'm fine with encouraging guards for future code - but I'm a little wary
> of a big change like this - it's hard to review it and check that
> everything works the same.

I can try to split that up, but even after the split, it will still be
a pain to review.

> And it's a little dubious that the mechanical
> refactoring produces more readable code in some cases.

I agree, though the mix of guard()s and manual locks makes things even
harder to reason about, especially when they appear in the same
function/block. The very reason I ended up sending this series is
because, as part of the IRQ refactor, I decided to be a good citizen
and use guards when I could, and I realized how bad the partial
transition was in term of ergonomics: not only you have to think about
whether the function/block scope is what you want (that's basically
what guard provides, unless you used explicit scoped_guard()), but you
also have to think about the interactions with your other manual locks.

TLDR; I'd rather switch over to guards entirely, or go back to manual
locks, but the mix we have right now is far from ideal.

> 
> That said I asked my friendly AI bot...
> 
> [...]
> 
> > @@ -3142,48 +3126,44 @@ panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
> >  	LIST_HEAD(remaining_vms);
> >  	LIST_HEAD(vms);
> >  
> > -	mutex_lock(&ptdev->reclaim.lock);
> > -	list_splice_init(&ptdev->reclaim.vms, &vms);
> > +	scoped_guard(mutex, &ptdev->reclaim.lock)
> > +		list_splice_init(&ptdev->reclaim.vms, &vms);
> >  
> >  	while (freed < nr_to_scan) {
> >  		struct panthor_vm *vm;
> >  
> > -		vm = list_first_entry_or_null(&vms, typeof(*vm),
> > -					      reclaim.lru_node);
> > -		if (!vm)
> > -			break;
> > -
> > -		if (!kref_get_unless_zero(&vm->base.kref)) {
> > -			list_del_init(&vm->reclaim.lru_node);
> > -			continue;
> > +		scoped_guard(mutex, &ptdev->reclaim.lock) {
> > +			vm = list_first_entry_or_null(&vms, typeof(*vm),
> > +						      reclaim.lru_node);
> > +			if (vm && !kref_get_unless_zero(&vm->base.kref)) {
> > +				list_del_init(&vm->reclaim.lru_node);
> > +				vm = NULL;
> > +			}
> >  		}
> >  
> > -		mutex_unlock(&ptdev->reclaim.lock);
> > +		if (!vm)
> > +			break;  
> 
> ... and it said the above has changed behaviour.
> 
> In the !kref_get_unless_zero() case you now assign vm = NULL which then
> leads to the 'break' case above. Previously we 'continue'd.

Oops, that one wasn't intended, indeed.

