Return-Path: <linux-media+bounces-58101-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHKKNq7a02nVnQcAu9opvQ
	(envelope-from <linux-media+bounces-58101-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 18:09:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 712F03A51A9
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 18:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E726300909D
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 16:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58643876AE;
	Mon,  6 Apr 2026 16:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TWKlIHeQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9263126DA;
	Mon,  6 Apr 2026 16:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775491752; cv=none; b=sx6i9Kgc/TWINbaVEOdxc+jyK3RRBr4lhmnzr7/Y8+faD3c4sogbjUg3ovG/o6mljjpIPz6m2iJIEK4wH1g00tNoAi9LVnWEPsokcs2svH20iXJXAcYmmzCSfFyJkc10yFh0rhVN93ukdlNyboIPd/5ayhxnLYBdmbQLrjDGWUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775491752; c=relaxed/simple;
	bh=ed7II0ObwxWjBKbVe/fCrXnK0q9Aq6GdXdPXUMMh3R8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dWBXGg0GlfNdqtG/AmPw4ETaNxACrD6frc8haOeZKE6mrLn4XRYLP2JX512IhtQckIaekIVYkNx73bPH6/ew9t4NUvoRiW0aApfxaw85TxOw1+2348TChypjXUUnms4Gbz25n2SOZcbavekTFiAX8mXuw7S7GL8ncQitcgKLsEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TWKlIHeQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9AFC4CEF7;
	Mon,  6 Apr 2026 16:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775491752;
	bh=ed7II0ObwxWjBKbVe/fCrXnK0q9Aq6GdXdPXUMMh3R8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TWKlIHeQtZzDQNcGz1g34T5V/iTr4mMr8+ZebfM1TlhULst44Qf+BaGzc3ugj5gXi
	 1hGyeteza7wdjCV9us8urgP6BEcqukHlG2XtOUFFMXwBiLdNpGayCc4iJf1EfsvlM6
	 FZAMmkXWDkH3jMf9SUe6ko4kTsKoxDJAtoAcNPqAiNIC4kgMhoV5bjsCsbRfbV9SkJ
	 eI+ssatG7Hz1gF65Kd90C2YS5TQuwTElRA3E+5tzivqnd47dXjeyiqliTxI1Ni0rEJ
	 dSP5roBLruOST2cVfQ+rn08AivzG15UlPuJvC2xSnG2mDiYHM/oYjWtlmaVfypuP3l
	 jyziOFpFPDfdw==
Message-ID: <8bd6abed-a317-416f-9301-f218ea766b1d@kernel.org>
Date: Mon, 6 Apr 2026 18:09:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: i2c: gc0310: fix probe error handling and
 unwind resources properly
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>,
 sakari.ailus@linux.intel.com, mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260401181657.654055-1-sanjayembedded@gmail.com>
 <20260401181657.654055-2-sanjayembedded@gmail.com>
 <38dc77ed-2427-44df-847d-4d41183e0df2@kernel.org>
 <DB5F4EC4-0754-483E-B59A-595A565E628A@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <DB5F4EC4-0754-483E-B59A-595A565E628A@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58101-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 712F03A51A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sanjay,

On 5-Apr-26 12:16, Sanjay Chitroda wrote:
> 
> 
> On 2 April 2026 12:36:33 am IST, Hans de Goede <hansg@kernel.org> wrote:
>> Hi,
>>
>> On 1-Apr-26 20:16, Sanjay Chitroda wrote:
>>> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
>>>
>>> The GC0310 probe path currently performs error cleanup by jumping to a
>>> common label that mirrors the driver's remove() callback. This is unsafe,
>>> as remove() assumes that the subdevice has been fully registered with
>>> the V4L2 framework, media and control resources have been initialized.
>>
>> That is simply not true, all functions called in remove() internally
>> check if their init counter-part has succeeded and if not are a no-op.
>>
>> If you're aware of any specific calls in remove() where this is not
>> the case, please explicitly describe these cases and describe an
>> example exit-error path from probe() where things actually go wrong.
>>
> 
> Hi Hans,
> 
> Thanks for the clarification - agreed, the remove helpers are defensively implemented and the existing code is not incorrect for a functional point. I should not have stated gc0310_remov() from a probe failure is unsafe.
> 
>>> Calling remove() from probe can result in unregistering or cleaning up
>>> subdevice, leading to resource leaks and subtle lifecycle bugs.
>>>
>>> Rewrite the probe() error handling to unwind resources explicitly, using
>>> fine‑grained goto labels along with appropriate error logs. Each failure
>>> path now frees only successfully acquired resource, without remove().
>>>
>>> This aligns the driver with standard V4L2 sensor lifecycle expectations
>>> and avoids incorrect teardown during probe failures.
>>
>> The rest of this reads very much like this was AI generated.
>>
>> Did you use AI to generate these patches ? If so please:
>>
>> Make sure you actually understand what the patch is doing and
>> very yourself that it actually is correct, which in this case
>> I believe it is not.
>>
>> Regards,
>>
>> Hans
>>
> 
> Yes, I did use AI assistance to help draft the commit message, but the patch logic itself was written and reviewed by me. However, your feedback makes it clear that i did not sufficiently validate internals of existing remove() based cleanup.
> 
> 
> I would like to propose commit message that align with change and existing kernel internals:
> 
> -------
> media: i2c: gc0310: make probe error unwinding explicit
> 
> The gc0310 probe path unwinds failures by jumping to a single label remove-style cleanup.
> 
> Refactor the probe error handling so that resources are unwound explicitly and in reverse order of initialization using fine-grained goto labels.
> 
> This improves clarity and maintains symmetry with the probe initialization path.
> 
> No functional change intended.
> -------
> 
> Kindly share your input on the same, according I will plan to resend v2 with an updated commit message as above.

The problem is that your patch makes the code more complicated.

Since we know that gc0310_remove() is always safe to call
the simplest and cleanest code is to simply keep calling
gc0310_remove().

If you plan to do a v2 of this series please drop this patch.

Note I see no need for a v2. Patch 3/3 is good to have and
v1 of that can be merged. The other 2 patches should be dropped.

Regards,

Hans




> 
>>


