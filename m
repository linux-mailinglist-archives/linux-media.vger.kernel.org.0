Return-Path: <linux-media+bounces-44144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CF2BCBA10
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 06:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A17C19E1981
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 04:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04D31FDE31;
	Fri, 10 Oct 2025 04:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KNnBjr0q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ED11C84CB
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 04:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760069960; cv=none; b=LutlV4NXleehAIaRPk0Ged0PXyPN08DAo9XaEHrS1Q9Yh5VE1l03MZsr5BLJj3VSqwiHS9rtoLYmPAdU7HbE2gpWBnbt46qo5iuY0hAaoY3Gele1/gwfHLe8jYCsDvR8DYLrlh28lPzG2lt0rsLK2cZEXhQnR6cJAe8G0sAW9dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760069960; c=relaxed/simple;
	bh=xwBn4qXrK+XNYpR0WLdPTYV+y8T+IAIrJ3YSUkkzQC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JPXS3mKADITkLuaPmH3QKfW+9YEl5D6VWlJ1m1NPvDas5Flwt3hS21ts7BNFIockk43wqfrmQrpPr/ksbT/wDH6GZtAkJFCW+kd5EZCxkq/72VCFyZGua5MlLZdHWyzRunM0NtiKiXBQrMrcWBXEwx6Pd/Axs6kXjj75UQbs0ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KNnBjr0q; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e37d6c21eso9532345e9.0
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 21:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760069956; x=1760674756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WwOa80v1gASmUxbIlKVNpJ7pC74JVx0S1JpZYmF7fT4=;
        b=KNnBjr0q5HdJcHl5KW1xWguYCm47g8hx1IkMR1zE4/dtFOxJneZHF+e/vQhNMA/v46
         0O/yBa5nz3V8GKiXGcCvZ8BYDNjtexNaajr+6UOLWEL1QFQFy8JJYVp6CoXJ13goGpv8
         xWxommaivpJU2vOGQSxjRMkySIIkQzb1gSiDJ/0ExzOIZSfn7bvaJ8mzsj+HXJCcw04E
         AQZgRYU786KIw6YRGsAalBf9+5ED4JRfj+EA4myMJMu/DNoiUC5ExCYd02Ix9eA5CN3m
         zvUb4hMHwWpnRRB5GMkEofL0mUVA+iT81dRClswUTeRPQPCOrS44AB7x+gsGvMVDmofT
         9TUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760069956; x=1760674756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WwOa80v1gASmUxbIlKVNpJ7pC74JVx0S1JpZYmF7fT4=;
        b=RC6/HTAxqV5hJ1nCwTq61toGmq4B/tDmhHPPTAA4+SB14c+udIe/P8KxYy7aRMPJtc
         Yumv9PbNxUvS2DvondpJj8ijWeLmqcA/DlfYX16WGmSp1jnWHfXkGf6LhTKgwfWTOYo5
         CbdjPRdml1A4axHbILVD4U7aPBTGdBPNYX2vOAMMlwbTtpUD3nLaSyZksKatpB6TxR2o
         J+Lh+RDZOspojxdLdLf51pe4qoAkua89pxLzgWjzYTrvAy2ifE2QhbaiQaCxPuwpXGTy
         M+jqjovqDKlZ0I9Q9QpFWRFRDbvlFV6D1+k1mOZLSJbsaPXox29CTRUIc5Xfootzrcrw
         89ug==
X-Forwarded-Encrypted: i=1; AJvYcCVr8wKwdZcIOhMT5vgtBFp3gZFndOq28sGYP4M6f3aStDUs1v60fvgvn54vaS84symYu0FsRyXQ2D4oRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGWwtAPW3ZXrwEJ6/lqzD4uHObz/H3mJeCCjV9DKYJM8OxANcJ
	Lzor9jBqT2AtPRFXUlQFpO5jqs/g7aQg24LW1lV64ge0mPkjPFQ+9d3khL9mGNZLdI0=
X-Gm-Gg: ASbGnct+CQMcvIhTG6Y9bFxS2K+7X1TaLg9/f8dZ3hUXLkhL2mEzutAXkBhO8PlGGNK
	hFiiJzssTb88zCmUb6bfWsJT0L2cVbdW8cXYYVpm8/I1u08BuqGDdo4ID79YuRWTdAn1cGwFcBN
	nRQYwnXAxffH92GZQpfF4pFUbm80Bi00LTY68fuIWJUDesIpqVAhDhsJkXc0yNmVbo0EZrEwbZq
	iitKoQiX+zZXT2o5vrJl0q4gifZ4VxAFaA3vN/PRZ13dsRdwIZ3SUitVgSAwN3MUIIE5B192jx0
	gQvAO3n3t21bRA7OXSOF/9ouesyFv2Abb8o2iUTIaclVaNO+6iiElAaJbvYThDRRDbNfKictT26
	4lDv8TOF7WirJv7uYKn4PtvummqXvKaBhRR0WeAzMtlyqaZ3Qys6wN55BSvVbrQ==
X-Google-Smtp-Source: AGHT+IGJgO2IvwgPLgeBx8x9ysG+IFbcbA482p2h3xQBgGrT2la38bcOWIrduOHO8n5qJqWFiyffew==
X-Received: by 2002:a05:600c:a43:b0:46f:b32e:5094 with SMTP id 5b1f17b1804b1-46fb32e50fcmr30537085e9.32.1760069955819;
        Thu, 09 Oct 2025 21:19:15 -0700 (PDT)
Received: from [10.100.51.209] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb4982b30sm24491365e9.6.2025.10.09.21.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 21:19:15 -0700 (PDT)
Message-ID: <565d9afb-cdd0-44c0-a070-9c603689f123@suse.com>
Date: Fri, 10 Oct 2025 06:19:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] module: Add compile-time check for embedded NUL
 characters
To: Kees Cook <kees@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Rusty Russell <rusty@rustcorp.com.au>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, linux-modules@vger.kernel.org,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Malcolm Priestley <tvboxspy@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20251010030348.it.784-kees@kernel.org>
 <20251010030610.3032147-3-kees@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20251010030610.3032147-3-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/25 5:06 AM, Kees Cook wrote:
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

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

