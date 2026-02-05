Return-Path: <linux-media+bounces-52254-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BmHDliihGmI3wMAu9opvQ
	(envelope-from <linux-media+bounces-52254-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 14:59:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0907F3A77
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 14:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE0163029C25
	for <lists+linux-media@lfdr.de>; Thu,  5 Feb 2026 13:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37973E95BB;
	Thu,  5 Feb 2026 13:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="te38wGmg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6535F3E9F8C;
	Thu,  5 Feb 2026 13:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770299902; cv=none; b=CwqHm2+z44VaEk21ht5meRKKNhuOwAkibIx4kJOi6M2eXdA2zs+Yff+v4snlhVJS318uNYvZVUOnNuwq8VWAdR7vQZrTuhnYAo+2ZFpEudNQ6khrMLrS4fl5sqa5kWyvfVlzIZtdAkobPq/DKLS90idcF0RZflmULpq4EuIVu5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770299902; c=relaxed/simple;
	bh=LlM5fE7wgKTbTlNPE8NwBKVZyy9DMr6a9by9/NKkm2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AZbGrOuqV1qtdmCFbEV6LwpwvMxkYrTWK9jKG+cXoEsFSNt/CTbu+RI50TDlHr6+J0GAfB+vqe4OfBDqJ7bzjfl9iBpyaBLDfmlgt653k9EJYdpQsgA3SO3Pu8oShywCwrbzgVH27YSAtp6zkEyFOFm79gzsDuT1MkO0zFLkMDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=te38wGmg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ECF6C16AAE;
	Thu,  5 Feb 2026 13:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770299902;
	bh=LlM5fE7wgKTbTlNPE8NwBKVZyy9DMr6a9by9/NKkm2g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=te38wGmgAEn6CSFrwBRBJtqq4PvzZFIdMZKmwwaqnOxM+DwAkHfgyq6XiJA5L4Nt3
	 F90MXpn4beg3LQP92PTodTTWNuUimaN/P8f2Yuurj+B71Ok4wAKyiabG2ebLPuGecx
	 fydN4zBe6idhDKtafLL3ltYu/BIQplKiecZtTF58pAxVn/eLFCLbEo7QbQZ0g009Pk
	 mKdIm98Xa0FRarlz+lHm6klE+ral1CcI99Zy1gNjbulUuwdiDQLwn2+T1fa7GkwDpO
	 hIXHVNJt0pWANafQqcGn6d5iSXpBwvAyyBFsQN43XYFCqsTRv5Lgrg3AYtJzdKaSVQ
	 Pm/+Fk/89D9Hg==
Message-ID: <b4fc5099-81c9-4873-b5f0-0c8a5d77571e@kernel.org>
Date: Thu, 5 Feb 2026 14:58:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] docs: media: media-committer: do some editorial
 changes
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Sean Young <sean@mess.org>
References: <dc12b2f42304866ccc04053f2a3c97e84c7558a1.1770215865.git.mchehab+huawei@kernel.org>
 <ada3056177e5e4e65119fb1b617777a680534e64.1770215865.git.mchehab+huawei@kernel.org>
 <26a44a31-3ab3-40f0-9ef2-e4bb6484a254@kernel.org> <aYSbEB0d2cvSi3nZ@foz.lan>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
In-Reply-To: <aYSbEB0d2cvSi3nZ@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52254-lists,linux-media=lfdr.de,cisco];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,linuxtv.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A0907F3A77
X-Rspamd-Action: no action

On 2/5/26 14:51, Mauro Carvalho Chehab wrote:
> On Thu, Feb 05, 2026 at 12:52:35PM +0100, Hans Verkuil wrote:
>> Hi Mauro,
>>
>> For the most part I agree, but I have some suggestions regarding the point 4
>> you added, since I think it just restates what is already mentioned in
>> maintainer-entry-profile.rst.
>>
>> Let me know what you think of my suggestions.
>>
>> On 2/4/26 15:37, Mauro Carvalho Chehab wrote:
>>> Do some editorial changes to make it look clearer:
>>>
>>>   - media-committers tree references corrected from singular to plural;
>>>   - updated commit rights wording and responsibilities;
>>>   - fixed various typographical errors;
>>>   - corrected “mailing list” and “Kernel” references;
>>>   - improved core committer description;
>>>   - updated documentation paths and URLs;
>>>   - added missing “for” and improved sentence flow.
>>>
>>> Perhaps the most relevant change is that i removed a word
>>> that was requiring granting Patchwork rights some time before
>>> adding commit rights (we may grant them altogether if makes
>>> sense for us), and I added a 4th note to committer notes
>>> list to let it clear that about what it is expected from a
>>> committer with regards to updating Patchwork.
>>>
>>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>> ---
>>>  .../driver-api/media/media-committer.rst      | 97 ++++++++++---------
>>>  1 file changed, 51 insertions(+), 46 deletions(-)
>>>
>>> diff --git a/Documentation/driver-api/media/media-committer.rst b/Documentation/driver-api/media/media-committer.rst
>>> index 18cce6e06a2b..c83e94750e57 100644
>>> --- a/Documentation/driver-api/media/media-committer.rst
>>> +++ b/Documentation/driver-api/media/media-committer.rst
>>> @@ -20,8 +20,8 @@ and the Linux Media community.
>>>  
>>>  .. Note::
>>
>> Re-reading this I don't really think this should be a note at all. This just
>> lists the additional responsibilities of a media committer, no need to
>> present this as a 'note'.
> 
> Agreed.
> 
>>>  
>>> -   1. Patches you authored must have a Signed-off-by, Reviewed-by or Acked-by
>>> -      of another Media Maintainer;
>>> +   1. Patches you authored must have a ``Signed-off-by``, ``Reviewed-by``
>>> +      or ``Acked-by`` from another Media Maintainer;
>>>     2. If a patch introduces a regression, then it is the Media Committer's
>>>        responsibility to correct that as soon as possible. Typically the
>>>        patch is either reverted, or an additional patch is committed to
>>> @@ -29,14 +29,18 @@ and the Linux Media community.
>>>     3. If patches are fixing bugs against already released Kernels, including
>>>        the reverts above mentioned, the Media Committer shall add the needed
>>>        tags. Please see :ref:`Media development workflow` for more details.
>>> +   4. All Media Committers are responsible for maintaining
>>> +      `Patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_,
>>> +      updating the state of the patches they review or merge.
>>> +
>>
>> I don't really agree with this. Not that it hurts, but maintaining patchwork
>> is a job of media maintainers.
> 
> Not really: "normal" media driver maintainers don't need to do that, and, even
> if we write they should, I doubt most would.

This applies to maintainers with patchwork rights. If you have patchwork access,
then I expect them to keep it up to date for those areas that they maintain.

> 
> In practice, I expect only core maintainers, subsystem maitnainers and a couple
> of driver maintainers to actually update it.

I.e., those with patchwork access.

> 
> I'd like to keep a mention here, as we expect media committers to actually
> read this file and understand what it is expected from them. As such,
> it doesn't hurt letting something explicit here.
> 
> The point is: if a committer forgets to update it, we may end having the
> same patch being reviewed by two people at different moments, wasting
> precious review time. Worse than that, if a rejected patch was kept
> as new on patchwork, another committer may end wrongly merging it.
> 
>> The only addition for committers is that they
>> have to update patches in patchwork to 'Accepted' when they have committed
>> them. That is certainly worth mentioning (including updating the maintainers
>> profile to clearly state that only committers can set it to Accepted.
> 
> With the "committers hat", yes: most of the time it will be just "Accepted",
> but, even so, if they pick a series with duplicated patches, other status
> needs to be updated, like "duplicated" and "superseeded". 
> 
>> So in maintainer-entry-profile.rst in 1.3 I would change the description for
>> the Accepted state to:
>>
>> "Accepted: Once a patch is merged in the media-committers tree. Only Media
>> Maintainers with commit rights can set this state."
> 
> Sounds good.
> 
>> And change point 4 to this:
>>
>> 4. After committing a patch, the Media Committer must also update the
>>    patch status to ``Accepted`` in
>>    `Patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_.
> 
> I would avoid restricting it - or if you want to verbose what status
> type, those are the ones we currently have on patchwork(*):

I'll just keep your point 4. In the end it doesn't hurt.

Regards,

	Hans

> 
> 	Under Review
> 	Accepted
> 	Rejected
> 	RFC
> 	Not Applicable
> 	Changes Requested
> 	Awaiting Upstream
> 	Superseded
> 	Deferred
> 	Obsoleted	
> 	TODO
> 	driver maintainer
> 	Duplicated
> 
> (*) Heh, there are some that we only used for a very short period of time,
>     or maybe even never used, but we can't delete status there without
>     causing potential issues to the database.
> 
>>
>>>  
>>>  Becoming a Media Committer
>>>  --------------------------
>>>  
>>>  Existing Media Committers can nominate a Media Maintainer to be granted
>>> -commit rights. The Media Maintainer must already have patchwork access and
>>> -have been in that role for some time, and has demonstrated a good
>>> -understanding of the maintainer's duties and processes.
>>> +commit rights. The Media Maintainer must have patchwork access,
>>> +have been reviewing patches from third parties for some time, and has
>>> +demonstrated a good understanding of the maintainer's duties and processes.
>>>  
>>>  The ultimate responsibility for accepting a nominated committer is up to
>>>  the Media Subsystem Maintainers. The nominated committer must have earned a
>>> @@ -61,8 +65,8 @@ Media Committer's agreement
>>>  Once a nominated committer is accepted by all Media Subsystem Maintainers,
>>>  they will ask if the developer is interested in the nomination and discuss
>>>  what area(s) of the media subsystem the committer will be responsible for.
>>> -Those areas will typically be the same as the areas that are already
>>> -maintained by the nominated committer.
>>> +Those areas will typically be the same as the areas that the nominated
>>> +committer is already maintaining.
>>>  
>>>  When the developer accepts being a committer, the new committer shall
>>>  explicitly accept the Kernel development policies described under its
>>> @@ -77,7 +81,7 @@ following the model below::
>>>  
>>>     ...
>>>  
>>> -   For the purpose of committing patches to the media-committer's tree,
>>> +   For the purpose of committing patches to the media-committers tree,
>>>     I'll be using my user https://gitlab.freedesktop.org/users/<username>.
>>>  
>>>  Followed by a formal declaration of agreement with the Kernel development
>>> @@ -85,7 +89,7 @@ rules::
>>>  
>>>     I agree to follow the Kernel development rules described at:
>>>  
>>> -   https://www.kernel.org/doc/html/latest/driver-api/media/media-committer.rst
>>> +   https://www.kernel.org/doc/html/latest/driver-api/media/media-committers.rst
>>
>> BTW, I agree that this file should be renamed to media-committers.rst. That matches
>> the name of our git tree as well.
> 
> Good. Please check at the maintainers profile if we don't have a reference with
> the singular when submitting v8, as I guess we have.
> 
> Regards,
> Mauro


