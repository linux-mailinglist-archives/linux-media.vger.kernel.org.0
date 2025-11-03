Return-Path: <linux-media+bounces-46184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BACC2AA8C
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 09:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EC3E3AD068
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 08:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A792E6CAE;
	Mon,  3 Nov 2025 08:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ua3C8sne"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB242C0261;
	Mon,  3 Nov 2025 08:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762160303; cv=none; b=s28wTCaLxa/iPVoh8BdFEhcDW8Q+xViXRucwDfSNuOGZzrT9SbZ0h6jv1+Tdxqgq2oAZunQZqNMJqT9eJuFczxh8Bx00WWilBWdqQt8pBNLWLPlAnETcoUVefH5VbVtU4UuPrnEjnsj3KCQHVBuzNepbV/rmvklmRQtKSdp+yNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762160303; c=relaxed/simple;
	bh=CRi6704MPvvIAXAC4rSvi6zCRtfM0lNB9IjeqMN27tA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O0LcOut+9hBGJGOAHAgBSMl44xgaCAXzZBOjIBbUa7Kn4lEMrTlhBX7LYTR8VQVDnQcf3ercbMHwffIiXsF8ZaOCL6SZh1UfCKmKgylO5bq46q7gFs8IT1X2QXSDY60EcJm07/hs0sAxRl2Spj2DeAH3iOirKdNKz7GK8bTihDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ua3C8sne; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198A1C4CEE7;
	Mon,  3 Nov 2025 08:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762160302;
	bh=CRi6704MPvvIAXAC4rSvi6zCRtfM0lNB9IjeqMN27tA=;
	h=Date:Reply-To:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ua3C8sne8P4O2Z41/qFLqnFxrLlq5J0VITwu3QaJdvXT+JYV3oC3AvS3DSwt8DUxE
	 5EWbBUaRJTYuSs4Vjk1fWVRx8Xj/1AXHgTqKRVvSZJAaIJ9wpOSCI+nUV6UX6RduVG
	 8VQ9TC2isNwbFc/VgCFAnng05lzfmBY1xV0psNhRmA0Bw9ASB05X0U7SUN3bp13K/B
	 JvEsQ951/9ggy7dKfbmCBjf2wprCYtxXnGgBCGWsfyr2pO8Zkqo0GwhdR2Yp3vA9+V
	 P4ut4zcQHdfvAvZXgEoRV6MsQzrBmPbt+S+xsg3nsGWCYBBRP75Su5T/wZs8/aF91Z
	 J1uwq5visn9ig==
Message-ID: <1c3e9bc8-0d25-46b2-98a3-643157f78b21@kernel.org>
Date: Mon, 3 Nov 2025 09:58:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Daniel Gomez <da.gomez@kernel.org>
Subject: Re: [PATCH v2 3/3] module: Add compile-time check for embedded NUL
 characters
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Kees Cook <kees@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, linux-modules@vger.kernel.org,
 Malcolm Priestley <tvboxspy@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20251010030348.it.784-kees@kernel.org>
 <20251010030610.3032147-3-kees@kernel.org>
 <91866583-037f-4607-b148-4ddf38ffaf51@kernel.org>
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
Organization: kernel.org
In-Reply-To: <91866583-037f-4607-b148-4ddf38ffaf51@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/11/2025 09.54, Hans Verkuil wrote:
> On 10/10/2025 05:06, Kees Cook wrote:
>> Long ago, the kernel module license checks were bypassed by embedding a
>> NUL character in the MODULE_LICENSE() string[1]. By using a string like
>> "GPL\0proprietary text", the kernel would only read "GPL" due to C string
>> termination at the NUL byte, allowing proprietary modules to avoid kernel
>> tainting and access GPL-only symbols.
>>
>> The MODULE_INFO() macro stores these strings in the .modinfo ELF
>> section, and get_next_modinfo() uses strcmp()-family functions
>> which stop at the first NUL. This split the embedded string into two
>> separate .modinfo entries, with only the first part being processed by
>> license_is_gpl_compatible().
>>
>> Add a compile-time check using static_assert that compares the full
>> string length (sizeof - 1) against __builtin_strlen(), which stops at
>> the first NUL. If they differ, compilation fails with a clear error
>> message.
>>
>> While this check can still be circumvented by modifying the ELF binary
>> post-compilation, it prevents accidental embedded NULs and forces
>> intentional abuse to require deliberate binary manipulation rather than
>> simple source-level tricks.
>>
>> Build tested with test modules containing both valid and invalid license
>> strings. The check correctly rejects:
>>
>>     MODULE_LICENSE("GPL\0proprietary")
>>
>> while accepting normal declarations:
>>
>>     MODULE_LICENSE("GPL")
> 
> Who will take this series? I can take the first two media patches and
> someone else can take this last patch, or I can take all, or someone
> else can take all patches. The media patches already have my 'Reviewed-by'.
> 
> Any preferences?

I will take patch 3 in modules' tree.


> 
> Regards,
> 
> 	Hans
> 
>>
>> Link: https://lwn.net/Articles/82305/ [1]
>> Suggested-by: Rusty Russell <rusty@rustcorp.com.au>
>> Signed-off-by: Kees Cook <kees@kernel.org>

Reviewed-by: Daniel Gomez <da.gomez@samsung.com>

