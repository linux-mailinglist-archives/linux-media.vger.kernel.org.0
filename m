Return-Path: <linux-media+bounces-66731-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tc+RDqqKS2qaVAEAu9opvQ
	(envelope-from <linux-media+bounces-66731-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 12:59:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C3970F938
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 12:59:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=cIeUf+72;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66731-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66731-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DC5DD300147A
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 10:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639B23E1CFF;
	Mon,  6 Jul 2026 10:59:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FA73E832C;
	Mon,  6 Jul 2026 10:59:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783335589; cv=none; b=beTU+UdHd+7iaNNqZGQspZbGddN4NdtYJatU2qN2P11LCTUIvqz/mUC7bdwU28S916+kbIDd5KFBcPTbDQ905z8FEDhh3Y2BJ50J5hh1YgtKwhThttx2bC0RDs7JvA5eVggvZrO6DspE8mdnQIxEqEF6aOMLpV78+b2Sfzz6SSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783335589; c=relaxed/simple;
	bh=87L84Y0gZlc45cfCOE+qnUMr2IhiP7pPKLQeMmTxyXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j6c+p4vR27Q9ftfE7QKa4Qis2il81W12hBIQHnostK3SAoOdg5d+mnhWkHh3fU0s562ihJOoUx42SXj3th6QC2kYVzvyHt2xAuJ8j0cPUXstxaiIGtjg7nsTV1g40ReIl9TdvnT6NlXdETPZG1D6yGRPPPFkuz9LX0vanOz294A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=cIeUf+72; arc=none smtp.client-ip=213.97.179.56
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZJoxLXbBFInuBRIgEp6vSOmCAY0GKp91Nz1MsnjS+Ec=; b=cIeUf+72RjbqJ5oE5oxo0NGSFT
	C5BTemsq66N2D1T6UjUHwhE+g74dchGlAlDqaVZjg66Aqlp9l2KotbodIsJLfgF7Qt0zus8j8QAN2
	z0sQiSHirOnP1SpRTHavzS091EysJuQI+jgKZShfz+/+eWmIm//0eZLSpMAxC/T0btUxmvT4iFQhf
	qexggOzHn+/zvVJP19OxSK1RA3PTMYZjl5RYHAmH6sjs2dhAcLrZEmJv8mqV+Ukm4Syn/wui8Gn8W
	J2BGBl0UP6UE0lWEVnY6YmRpzm2IXurcNQImFN90aOhk42/r55jViLZqR4jrFsKOH2UxnZbIE0TCW
	ZosmOfOA==;
Received: from [90.240.106.137] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wgh2e-009hAL-3I; Mon, 06 Jul 2026 12:59:12 +0200
Message-ID: <441ad8f8-3618-4c53-995a-2b81f283ab16@igalia.com>
Date: Mon, 6 Jul 2026 11:59:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/sched: Protect entity->last_scheduled with
 spinlock
To: phasta@kernel.org, Tvrtko Ursulin <tursulin@ursulin.net>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Marco Pagani
 <marco.pagani@linux.dev>, Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260701085920.3253248-2-phasta@kernel.org>
 <20260701085920.3253248-3-phasta@kernel.org>
 <a4091099-1931-4ca2-a81a-9c3321b123a8@ursulin.net>
 <51fbde808bd059510d667d130afae179626303be.camel@mailbox.org>
 <ce33edbb-11dd-4722-bb87-d16155f35a75@igalia.com>
 <0af946b7bef6958f103598083919bbf933423676.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <0af946b7bef6958f103598083919bbf933423676.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66731-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:tursulin@ursulin.net,m:matthew.brost@intel.com,m:dakr@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:marco.pagani@linux.dev,m:boris.brezillon@collabora.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,ursulin.net,intel.com,gmail.com,linux.intel.com,suse.de,ffwll.ch,linaro.org,linux.dev,collabora.com];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3C3970F938


On 06/07/2026 10:42, Philipp Stanner wrote:
> On Mon, 2026-07-06 at 09:45 +0100, Tvrtko Ursulin wrote:
>> On 03/07/2026 15:47, Philipp Stanner wrote:
>>>
>>>
>>> I think it can detail which functions will now be locked; but
>>> mentioning the users would be overkill and is uncommon for API reworks.
>>
>> Here I disagree quite strongly. Given the patch is making strong claims
>> that the lockless access was added for no obvious reason, and that we
>> have now established the lockless helper is in fact used on the
>> submission paths, it is really required that those strong claims are
>> backed by a concrete analysis instead of just saying "not performance
>> critical in any way".
> 
> This is a strong case for the reversal of the burden of proof.

I did not want us to discourse into side philosophical arguments about 
how and why the code base got to where it is. The story at hand is much 
simpler and narrower so excuse me for skipping the majority of the below.

Put in a different wording, what I was trying to express is this: Lets 
not write a poor commit message because the original one was poor. Aka 
two wrongs do not make a right.

Also, I am not putting a burden of proof on you, in fact, I offered to 
test your series.

As to your closing question to what I suggest commit message needs to 
add, that is simple, and yes, the first bullet point you list is what I 
have already asked for in one of the previous replies. So say something 
along the lines of:

"""
drm_sched_entity_error(), which is significantly used from various 
stages of the amdgpu job submit path, either directly or via 
amdgpu_vm_generation(), is changed from lockless to taking the 
entity->lock. As performance was not listed as a reason the lockless 
approach was chosen in the above referenced commit, although it is 
suspected that might have been the motivation, it is now thought that 
the new lock cycles to those paths will not add any measurable overhead.

For other drivers no new lock cycles are added to the submit path, given 
drm_sched_entity_select_rq() via the job arm path already bails out 
early due all drivers apart from AMD only passing a single scheduler 
list to the entity.
"""

Bonus point if you can spend the time to count how many extra 
lock-unlock cycles it is adding between it's CS submit, prepare job and 
run job entry points.

For me, that is not the burden of proof but some minimum standard of a 
commit message which shows some due diligence was done.

Regards,

Tvrtko

> The entire code base of drm_sched has been designed on the computer
> science premise of locks being evil. That's why literally all
> synchronization primitives except for locks have been used where
> possible, including undefined behavior. The designers tried as hard as
> they could to avoid locks.
> 
> That is clearly proven by the fact that in all original data type
> definitions, the only components that were locked were always lists,
> since those are the structures where you really cannot avoid a lock in
> most cases.
> 
> The aversion to locking was so great that they designed spsc_queue,
> which uses at least as many as expensive instructions as a lock + list
> would have needed, and its correctness is not proven, nor are its
> behavior and rules neither documented or proven.
> 
> It's not up to the faction who wants to use correct locking and phase
> out UB to prove that the locklessness is bad, but to whomever added the
> locklessness to prove why it is good, i.e., necessary – which was not
> done here, neither in comments nor commit message. So the reasonable
> assumption is that it's simply a leftover from a flawed, broken design.
> 
> And the kernel-workflow is that things are always on-list for a while
> before being merged is that parties who do have concerns and who can
> point out problems have time to do so. Which is of course open to you:
> do you see a performance-regression problem with this patch, and if so,
> where?
> 
> Anyways:
>   * Correct me if I'm wrong, but it would seem the only driver-usage
>     which could see a *new* lock in its path is
>     drm_sched_entity_error(), for which you yourself agree that it's
>     irrelevant performance-wise. Should we still list the user's of that
>     function?
>   * The other relevant user path, drm_sched_job_arm() via
>     drm_sched_entity_select_rq(), must already be called under a common
>     driver lock for drm_sched_entity_push_job(), and _select_rq()
>     already takes the entity lock. So any significant regression here is
>     hyper unlikely.
>   * The only other contender is the job pull path, which runs serially,
>     by 1 work item at one point in time.
>   * drm_sched_entity_kill() / _fini() are used in user context teardown
>     path. Performance irrelevant.
> 
> I can offer to add the list above for the justification of why removing
> the half-undefined behavior is good.
> 
> Or what exactly would you want to see documented? "amdgpu uses
> drm_sched_job_arm() and now sees a lock-critical section longer by 3
> instructions. etnaviv uses drm_sched_job_arm() and now…"?
> 
> 
> 
> 
> P.


