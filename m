Return-Path: <linux-media+bounces-48643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5310CB6BB0
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 18:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D5BFF30021F8
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 17:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2DE32ED52;
	Thu, 11 Dec 2025 17:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4l+j8Dp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C16C2F851;
	Thu, 11 Dec 2025 17:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765474252; cv=none; b=dCWmmuEptMPd0GptGoc6+Q04EMqyIi/v+yInHQd4C5xsaAxp6JcAnSNyVvAz4Zx71T9mLNv5yY63e1Ndf8VSlcuZRPSKwwMbzhrCFZqpl0J4oUhCzhOTJ5FE4F0e3WZIreSPhtMUWkGmHq5JWtB5pkLReVDPUvr1OgXbNqXNLzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765474252; c=relaxed/simple;
	bh=un+KTB47ninaos70J/zrYlp6/sd26Ow+zmRszwaMpRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJMjuS+KkTxPjiQvqErVypgK6gar49u48u3GCQRIyW6nxAXELEOM4tJwvsSVozlydaT6wNix0Pah6iccg1e/nhsIcn68DQUPwP5Hn/EFoaXXWpr8p3mgUZXV03Co9wsWGaSC8E1BwJQHM7irbsMhX+YC+fw5j48OABLN9XknvNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4l+j8Dp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B850C4CEF7;
	Thu, 11 Dec 2025 17:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765474252;
	bh=un+KTB47ninaos70J/zrYlp6/sd26Ow+zmRszwaMpRU=;
	h=Date:Reply-To:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a4l+j8Dpc7ojyzWGks1V8brExCUWqBh7ZS9LKo+0kx4BpPmn2+qqUt02KKrnDSwk7
	 L/z5gn5Sqm212YtPvNvk6pZ6IGvmejgbpdqbSxe1Hc5QHGtvPHaC6GJU1jI3qbWvZH
	 uNvskf9cl8WplUMU8ia5sKiNgj9fGV1ncFqIQ2w93wv6V/xpcHI8Uu/KuEzrfXWitc
	 fBAZp9OPsa3KIAhDo7093wPEuV9dAcIQ7vuGS59hbaKEyeM442JbCK9Fc/BsvYlL1h
	 H7rUirGk9lFjvv/p9h0yzYFREO5V4Qvj04/ACbOOxcl7NuRlBOpsaIlwWg2+ywglL4
	 LDeOMD/e6r9bw==
Message-ID: <083ebd92-4b3f-47f8-bf0f-395a604b5f05@kernel.org>
Date: Fri, 12 Dec 2025 02:30:48 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Daniel Gomez <da.gomez@kernel.org>
Subject: Re: [PATCH 3/3] module: Add compile-time check for embedded NUL
 characters
To: Sami Tolvanen <samitolvanen@google.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Luck, Tony" <tony.luck@intel.com>, Chris Li <sparse@chrisli.org>,
 Eric Biggers <ebiggers@kernel.org>, Kees Cook <kees@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>,
 Petr Pavlu <petr.pavlu@suse.com>,
 "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
 Malcolm Priestley <tvboxspy@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
References: <20251008033844.work.801-kees@kernel.org>
 <20251008035938.838263-3-kees@kernel.org> <aTc9s210am0YqMV4@agluck-desk3>
 <20251209001139.GA7982@quark>
 <d3dd8fc8-ab46-4cf1-87a9-0324685ba2e0@kernel.org>
 <SJ1PR11MB6083C6D97484ED4E4710268EFCA3A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <aThSGiKwJRYOB6kx@agluck-desk3> <aThqcq0iGge1pQCr@agluck-desk3>
 <20251210010020.GA2522829@google.com> <aTn0WdVv-S_EpQmS@agluck-desk3>
 <aTqAxfiVCR2ch4I5@stanley.mountain>
 <CABCJKufWw4VQA_k6Deuf5Bn6401cbYv_St8VV_0-LAau6F0nTw@mail.gmail.com>
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
Organization: kernel.org
In-Reply-To: <CABCJKufWw4VQA_k6Deuf5Bn6401cbYv_St8VV_0-LAau6F0nTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/12/2025 02.03, Sami Tolvanen wrote:
> On Thu, Dec 11, 2025 at 12:28 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
>>
>> On Wed, Dec 10, 2025 at 02:29:45PM -0800, Luck, Tony wrote:
>>>> diff --git a/expand.c b/expand.c
>>>> index f14e7181..71221d35 100644
>>>> --- a/expand.c
>>>> +++ b/expand.c
>>>> @@ -535,6 +535,8 @@ static int expand_compare(struct expression *expr)
>>>>                     expr->taint = 0;
>>>>                     return 0;
>>>>             }
>>>> +           if (left->flags & CEF_ICE && right->flags & CEF_ICE)
>>>> +                   expr->flags |= CEF_SET_ICE;
>>>>             if (simplify_cmp_binop(expr, left->ctype))
>>>>                     return 0;
>>>>             if (simplify_float_cmp(expr, left->ctype))
>>
>> I'm not an expert in the C standard, but this feels correct to me.
> 
> It only fixes comparisons though, the problem still exists for other
> expressions. For example, while `_Static_assert(__builtin_strlen("")
> == 0);` works with this change,
> `_Static_assert(!__builtin_strlen(""));` still fails. Perhaps there's
> a better way to fix this than changing each expression expansion
> function to handle this flag?

Maybe the flag fix just needs to be applied to the evaluation? Other op
structs do the same. But Dan's patch did not implement evaluate. E.g.:

static struct symbol_op constant_p_op = {
	.evaluate = evaluate_to_int_const_expr,
	.expand = expand_constant_p
};


> 
> Sami

