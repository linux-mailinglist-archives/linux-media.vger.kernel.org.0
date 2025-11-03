Return-Path: <linux-media+bounces-46183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D2BC2AA5A
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 09:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 722024EBCFF
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 08:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11F72E62AF;
	Mon,  3 Nov 2025 08:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GeqOhBI2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BE814F9D6;
	Mon,  3 Nov 2025 08:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762160061; cv=none; b=gstzZvaVEtMICyys4xymIPRssa9FaMF/9xdVsJvNL5rnjUi20EieFpFC8UeshFGNCPtPtf15p0HW7fSCc+gwOWFrdZsjRhAimvLkK5mUO3rKF/IrRmytJfWTZQ72KVeryXE5P6R0+XnrC3Ac9iY/UInea6kDOLEwrES72Jm25tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762160061; c=relaxed/simple;
	bh=MyN+IHwtioI7db3QsIR97eQv++fkt8VeyXlRzzsLLug=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BGyZznWrQT0ns2rcEi4RYXTcHC6dgdkvTz/nahqz3hAb9CUKfD7s7BASQZysbNkQ2wvlDWBS739R7AOy+JQUDyNiyqPFbpnC6sBB97jVmJT11gb5JzuZg8BBVIz0Hwr2oNNjT59uIzAo9Ju1T7av6yQeFg+crKSz5PaHXioUKBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GeqOhBI2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA1FC4CEE7;
	Mon,  3 Nov 2025 08:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762160060;
	bh=MyN+IHwtioI7db3QsIR97eQv++fkt8VeyXlRzzsLLug=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=GeqOhBI2skXf0ejk7basxc5ei9eKk/vY5t9m0RJsCYI2VS/x7SqzTSCxUefOKykH2
	 Qct60KAeyUroDdFHWr1JNsuxe4me8b+MxVJs5p9z4B5WMg8pFHij1UaX/UOYVoS6rh
	 8rRmLzaEspcZEa8FCBFEqo8EAAfwhv4wcu7WL21Sjg+L9H+VbzrTZS/wb7ji2XMTMw
	 tJEOe7XAx67aH3VW6ixHjccndPChysoqBq7ihzW9VcQVM78vOcMvd2kcAgRO8N8WuT
	 +uwHOImDIMQL+0DGz1HHLb6fera5iiMjgoD4VHRtxfPU/tJ86ilJM95lAddp0007IN
	 3GZMpx5VPZvQQ==
Message-ID: <91866583-037f-4607-b148-4ddf38ffaf51@kernel.org>
Date: Mon, 3 Nov 2025 09:54:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 3/3] module: Add compile-time check for embedded NUL
 characters
To: Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linux-modules@vger.kernel.org, Malcolm Priestley <tvboxspy@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20251010030348.it.784-kees@kernel.org>
 <20251010030610.3032147-3-kees@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251010030610.3032147-3-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

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

Who will take this series? I can take the first two media patches and
someone else can take this last patch, or I can take all, or someone
else can take all patches. The media patches already have my 'Reviewed-by'.

Any preferences?

Regards,

	Hans

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
>  	static const char __UNIQUE_ID(modinfo)[]			  \
>  		__used __section(".modinfo") __aligned(1)		  \
>  		= __MODULE_INFO_PREFIX __stringify(tag) "=" info


