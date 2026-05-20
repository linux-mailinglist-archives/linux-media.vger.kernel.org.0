Return-Path: <linux-media+bounces-62321-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACUHJDPWDWrW3wUAu9opvQ
	(envelope-from <linux-media+bounces-62321-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 17:41:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF91591184
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 17:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 180D93159E68
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142763EFFD6;
	Wed, 20 May 2026 15:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="quuL0OnN"
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948563E9C19;
	Wed, 20 May 2026 15:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779290812; cv=none; b=s/TadcRIjx77qebsebzyAqL7c4hsEFyJbyz72EMrQBCE6U0fvtjKAATI3KYF94H3L3iUgrzQDKlTkRDi+4G7w3tcN05two8P0XpoT5EHxrj9he3LMIB+rI+dEjcHJwz6Lq44HH0pVTHCA1ef/Igy1ir8hydMg+8gSlfjuLG0M6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779290812; c=relaxed/simple;
	bh=7n6+w/JNJIy9JBoZEpq6DMA9zKTx48lQeLJC8YLMxp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=smTG4T7Rf0/T+VA28PA7udVI3fBA2UUoQzubbduhnazBHjNIBtDsoHxCHEJsqYgitcMh0hXRuaz58pbwZ3+FdgOkK9sgPJUL8r9abCQbFQWe0tiz+cAHfbvtejqLPVw+n+pYDsMDVBPq9F6h4h8vTAGS+Sxfw1xZIB1NJBCN/4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=quuL0OnN; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B668416A3;
	Wed, 20 May 2026 08:26:44 -0700 (PDT)
Received: from [10.57.33.178] (unknown [10.57.33.178])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B9BF3F632;
	Wed, 20 May 2026 08:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779290809; bh=7n6+w/JNJIy9JBoZEpq6DMA9zKTx48lQeLJC8YLMxp4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=quuL0OnNg2zLJ2BDZ1cDhvpe34hP8cBpi4dNiIS7uWI9QJj/QpjNuoupzxo27MkGx
	 7LeMTtSADUfabpkVQChWMdtc+4mKpoJRgcnVPE6zou0KA1WiuebrMJEOWWZYcDDf6+
	 kwMaqTeo6QGyfMGTBU6A0OGpW+xw8UfHYagH5+v8=
Message-ID: <6923c228-b81e-4d02-b59c-a21b2212318e@arm.com>
Date: Wed, 20 May 2026 16:26:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/panthor: Driver-wide xxx_[un]lock ->
 [scoped_]guard replacement
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
 <20260513-panthor-guard-refactor-v1-1-f2d8c15a97ce@collabora.com>
 <5ab2d07c-74a4-4a2c-b145-6ed7b0060944@arm.com>
 <CAPaKu7S9WMbJERrWa=bj5qyQg72no9MPex6S1MY6t8nXoMbB-Q@mail.gmail.com>
 <20260518104356.71827224@fedora>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260518104356.71827224@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arm.com,linaro.org,amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	TAGGED_FROM(0.00)[bounces-62321-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[steven.price@arm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:mid,arm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: EAF91591184
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18/05/2026 09:43, Boris Brezillon wrote:
> On Thu, 14 May 2026 10:09:10 -0700
> Chia-I Wu <olvaffe@gmail.com> wrote:
> 
>> On Thu, May 14, 2026 at 6:24 AM Steven Price <steven.price@arm.com> wrote:
>>>
>>> On 13/05/2026 17:58, Boris Brezillon wrote:  
>>>> Right now panthor is mixed bag of manual locks and guards. Let's
>>>> make that more consitent and thus encourage new submissions to go
>>>> for guards.  
>>>
>>> I'm fine with encouraging guards for future code - but I'm a little wary
>>> of a big change like this - it's hard to review it and check that
>>> everything works the same. And it's a little dubious that the mechanical
>>> refactoring produces more readable code in some cases.  
>> I agree with Steven in general, although I am in favor of landing now
>> that you've gone through the trouble.
> 
> Honestly, I agree with you. The only reason I went for it is
> because the mix we have right now is pretty confusing. This has to do
> with the fact the scopes are often loosely defined unless you used
> scoped_guard(), so it's pretty easy to mess up the lock/unlock
> ordering. For instance,
> 
> 	mutex_lock(locka);
> 	guard(lockb);
> 	mutex_unlock(locka);
> 
> 	...
> 
> once expanded, turns into inconsistent locked sections, where the inner
> lock (lockb) is released after the outer one (locka).

I think that's a good argument for getting all the guard forms available
before tackling the conversion. Mostly I feel like it would be benefit
from being split up into multiple patches (maybe one per file?) so that
there are smaller units to review.

>>
>> I also have mixed feelings about some of the non-scoped guards. Their
>> scopes are extended slightly than before, supposedly to avoid adding
>> another level of indentation. But other than slightly slower,
> 
> I tried to used scoped_guard()s every where the extra non-guarded
> section could be CPU heavy (the only bits left are some very simple
> bit/arithmetic ops, and a couple queue_work() IIRC).
> 
>> it also
>> becomes less clear what exactly do the guards protect.
> 
> I know, and I have pretty much the same feeling, but we've crossed that
> bridge when we started accepting non-scoped guard()s, unfortunately.

The problem with scoped guards is the extra level of indentation.
Personally I find a mixture of all three is appropriate depending on the
case.

E.g.

int small_simple_function() {
	if (simple_condition)
		return early;

	guard(lock);

	if (condition_that_needs_lock)
		return early;
	/* more work */
	return late;
}

Here it's easy to reason because the lock is just held for the duration
of the function after the initial early-out condition is checked.

int short_lock() {
	/* bunch of work */

	scoped_guard(lock) {
		tmp = read_value();
		if (tmp == 42)
			return -ESOLONGANDTHANKSFORALLTHEFISH;
		tmp++;
		write_value(tmp);
	}

	/* more work */
}

Here there's a small section of code which is working on the lock, so it
makes sense to indent it to show the boundaries of it. The other nice
thing is that the error return handles the locks for us.

int old_fashioned() {
	if (lock_required)
		mutex_lock(lock);

	/* some work */

	if (lock_required)
		mutex_unlock(lock);
}

Generally a pattern to be avoided if possible, but IMHO this is much
better than the equivalent of:

int dodgy_function() {
	/* some work */
}

int outer_function() {
	if (lock_required) {
		scoped_guard(lock)
			dodgy_function();
	} else {
		dodgy_function();
	}
}

which requires breaking out the work into an extra function and
duplicating the call (or worse duplicating the function body).

One thing I do agree is that mixing and matching within the same
function is a recipe for confusion and mistakes.

Thanks,
Steve

