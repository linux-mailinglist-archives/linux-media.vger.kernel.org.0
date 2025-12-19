Return-Path: <linux-media+bounces-49162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2527CCCFD38
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 13:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E7E330699CE
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 12:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8A0326946;
	Fri, 19 Dec 2025 12:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JntpCx6W"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214E52D323F;
	Fri, 19 Dec 2025 12:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766147370; cv=none; b=XGjrmJHMj4go22dznSB3Nhx+R99VcZ4LMUCO7hxcCGdm3jSXePB4DBVnBG08PxP9KRpPPVrOyZEQNue3w7O5dbMWIW5+vYzsx75LIx/dwSyoP0ob5rPqi3xGjee46htM02zaxTKFBr1ZdoodWQMIcWFcVYl6T+Tn0AAh1Q+0jOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766147370; c=relaxed/simple;
	bh=5snV2hnts8wQy3pn7dDyRNapTGA2u4S2fB1CiR8N34w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HXvLUXYQOE2joMd/vxNArzeYXl1xixlOiIYaJiI9IHVJbyZ79ow4Qbmd6NdPfhavLYiX0zPZ4jHesmia7bxz7MyHen201z50GY6ZlPsjuPt1xjsZYNQ6Y8PVcqk8yt0S3qJKfINhivVUglpGM6SExMYdvFkhhHngQltwGwIYMOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JntpCx6W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC4CC4CEF1;
	Fri, 19 Dec 2025 12:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766147369;
	bh=5snV2hnts8wQy3pn7dDyRNapTGA2u4S2fB1CiR8N34w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JntpCx6WVFB6NbpwjKrIZJJyUGJgVcpjuBm6pPla+HRgV+d+CEgB8+L0L5ybZY+Ai
	 4AugsyuDKYQvyUh00X51CcPlv4bNDtG1HYk8v96zkOh3K7Eyawb7CgdzNIGb4QjIUC
	 gOS1b4QUEUzCzm9PKtsrMqB+Rp6yr72i6/Q/z+XRq43MSOdgvS7wfcggdOrBDOwmWl
	 t2iFsjXmuAbKGQq4kzw3hu5txugYmvP3Ayq2m/QvASTAOTzjFJB+oe9ifJVoXVIjLJ
	 rqMOXvFo1XiqW3zOPJ1Eh7O5nVRFiEk6t7y2jED6y/Qstaz6BhNhLPX+4raDkKvaTQ
	 VfUelcX/B4wLg==
Message-ID: <47a2f0c7-c25f-4734-840b-fdefc2f3c4a9@kernel.org>
Date: Fri, 19 Dec 2025 13:29:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] module: Add compile-time check for embedded NUL
 characters
Content-Language: en-GB, fr-BE
To: Kees Cook <kees@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linux-modules@vger.kernel.org, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Malcolm Priestley <tvboxspy@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-hardening@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Chris Li <sparse@chrisli.org>, linux-sparse@vger.kernel.org
References: <20251010030348.it.784-kees@kernel.org>
 <20251010030610.3032147-3-kees@kernel.org>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <20251010030610.3032147-3-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kees, Dan,

Sorry to react on an oldish patch, but I have a question about it, see
below.

On 10/10/2025 05:06, Kees Cook wrote:
> Long ago, the kernel module license checks were bypassed by embedding a
> NUL character in the MODULE_LICENSE() string[1]. By using a string like
> "GPL\0proprietary text", the kernel would only read "GPL" due to C string
> termination at the NUL byte, allowing proprietary modules to avoid kernel
> tainting and access GPL-only symbols.
> 
> The MODULE_INFO() macro stores these strings in the .modinfo ELF
> section, and get_next_modinfo() uses strcmp()-family functions
> which stop at the first NUL. This split the embedded string into two
> separate .modinfo entries, with only the first part being processed by
> license_is_gpl_compatible().
> 
> Add a compile-time check using static_assert that compares the full
> string length (sizeof - 1) against __builtin_strlen(), which stops at
> the first NUL. If they differ, compilation fails with a clear error
> message.
> 
> While this check can still be circumvented by modifying the ELF binary
> post-compilation, it prevents accidental embedded NULs and forces
> intentional abuse to require deliberate binary manipulation rather than
> simple source-level tricks.
> 
> Build tested with test modules containing both valid and invalid license
> strings. The check correctly rejects:
> 
>     MODULE_LICENSE("GPL\0proprietary")
> 
> while accepting normal declarations:
> 
>     MODULE_LICENSE("GPL")
> 
> Link: https://lwn.net/Articles/82305/ [1]
> Suggested-by: Rusty Russell <rusty@rustcorp.com.au>
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Petr Pavlu <petr.pavlu@suse.com>
> Cc: Daniel Gomez <da.gomez@kernel.org>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: <linux-modules@vger.kernel.org>
> ---
>  include/linux/moduleparam.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
> index 6907aedc4f74..915f32f7d888 100644
> --- a/include/linux/moduleparam.h
> +++ b/include/linux/moduleparam.h
> @@ -26,6 +26,9 @@
>  
>  /* Generic info of form tag = "info" */
>  #define MODULE_INFO(tag, info)					  \
> +	static_assert(						  \
> +		sizeof(info) - 1 == __builtin_strlen(info),	  \
> +		"MODULE_INFO(" #tag ", ...) contains embedded NUL byte"); \

When checking MPTCP code on top of Linus tree, I get this new warning
with all MPTCP KUnit tests (net/mptcp/*_test.c), e.g.

$ touch net/mptcp/crypto_test.c && make C=1 net/mptcp/crypto_test.o
  CC [M]  net/mptcp/crypto_test.o
  CHECK   net/mptcp/crypto_test.c
net/mptcp/crypto_test.c:72:1: error: bad integer constant expression
net/mptcp/crypto_test.c:72:1: error: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
net/mptcp/crypto_test.c:73:1: error: bad integer constant expression
net/mptcp/crypto_test.c:73:1: error: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"


I'm using Sparse last development version with Dan's commit:

$ sparse --version
v0.6.4-73-gfbdde312

=> fbdde312 ("builtin: implement __builtin_strlen() for constants")


And the two lines causing the warnings don't have "\0":

    72  MODULE_LICENSE("GPL");
    73  MODULE_DESCRIPTION("KUnit tests for MPTCP Crypto");


Am I missing something?

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.


