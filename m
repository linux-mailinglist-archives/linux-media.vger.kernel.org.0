Return-Path: <linux-media+bounces-43947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB570BC4391
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 11:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BE72188473F
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 09:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1ED12F39CB;
	Wed,  8 Oct 2025 09:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C2UcNZSz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A3D2ED14C
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 09:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759917356; cv=none; b=R1JsIWZEmdcYwlzcPfcOj3KbXY2E6a3DGySA8upfu/ae3AEOkuc1CLmS0LZvrfbI2RF/NykCUUzn0JED8BLVZYzv61xdkqA0eMdAI5MbOvIHMUPVM2EAVuX4+iegS24J08GCqK3s85miuOlfpVgVzrY08tpXV0Vq1bEcDTwclPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759917356; c=relaxed/simple;
	bh=SBhhP7SXQG5Q/AAGyt2uk8bwhpNPceu6ZTpziiTkWuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RmADVh/RNZfeuOS/+C9L8uC3SAnP4g1yQnmRKMuFla3hHw8ldOkCqmVhD06bBA9O0qDYckutu/+wpc1vonlDuwbvfFI8zXVA0eGZ4sKJ1E64XgW5LiPhvUah0B1bug8dlIez9gzzYpfNkb9QxZCeLKi9PHWaUJbdllu9xmOIdLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C2UcNZSz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e47cca387so75591025e9.3
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 02:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759917351; x=1760522151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yne+jRU6nBsNeGmX1XAlIZCbqK7n4+3fqzPsJe9q+qM=;
        b=C2UcNZSzJaawPYrxXYBriTwgZ74acSEKfTtAw2sYAxOFJQib9f0E7C9iAmjsghC4pH
         dbKkYVR2LC+FYvg/axWiaSMv+x/+QthkhRcXivnCE4/0c/mBoK4DI6NPjXYnoSu/ll6s
         C9JW5Qn8AhV6IM5HaE/R0lgthMh/OoA/S/GPgqDNLIreeT91DJ9sAWHRh8Q9lrxfYqB1
         2lP9EnGHRnJya68GFpY8krKJiGgh+nt8q44sBtPndm2LkoYWMYYbcUaL7fhU5yXtrxut
         H2QLvzNNk52uqq7UiAwJKCVsfIGcdIXkHA8F9T95n2jxWRklKmXJXvGUf8sbc/CShejw
         9tlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759917351; x=1760522151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yne+jRU6nBsNeGmX1XAlIZCbqK7n4+3fqzPsJe9q+qM=;
        b=Rav1558PLfd3wekA3jfhVHGeNYV645AW1+QMDdLkSuhQa3e5mFPLqQMIjZFqP1a1aV
         MEIUZBJOEskXOxZo/h2wLJBv4xjnCRTR/a1BPnX8pxjgvVECSTH6Z1tNDYgNTZewDzVl
         5wngXwZJB4aqkxILkbphqsna7d/AHkBasjEMZMJjIas9sMYnAauXluAer+EBU0+VN2wk
         WOrdNLLQZpWsOeBKF7LU1FB21mWmD7mFNocfPHrdzVc7nFxOBFb1TmrQAevvhYEcinpz
         GlgdpWfsqVuynATB3lk30qlrjxv/4+78voLqXXfiSA3y/O4EaDH3nwqLG04qvJ4xmXEP
         73fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDlQAkQ/LrGu0fHgJAEy3zcthwfsjhRr1LQsXFm5p38YgWoWr3VlIYIhmclHD/KV/Gdbt1Kbkp2C/t0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEUeLVFb+rGYBs+aX4H9l861BFEvQCl0Ca6CFx08lzVNzpoZDQ
	7M0sWpW3ExrjpsAjjzqS3PWxDU2YYAEsW3bVIHsC+3QcPubdtUH2KR4KsUImDZ3CqKk=
X-Gm-Gg: ASbGncsV/SxEOIiJnFPLjxqEcCt4zKBMdsR1NXMoDF/48QUdRJvS1zlNdLdjSEpa3cD
	2v6o4AS+ZjpbXvTnFk/XSrdl3A7yIMyCBW6Jn1hawY5uQDYtJWmhaRAD4nXv8ymK+6q6wOCj/r1
	aVfnJLQ1vC2xNGA4Vs03GWs9M0ksxi0LaoMfcLOG1WAAcyMvFMGRRBgyJwRngxeWEYr/IPvpzJK
	c1YC81BI6bCLTx7DxbiwXIZMu/bDe0tRTpnFRs+/CD2CjJ9wguKV7KJN2qn7HInKWSckH08OyUy
	+4SO62uZuZkIdyIWzSfBuBdit3QrzqLJgZFMWlEf5p+WSLFRyF904MKWwYlN3Z0qALnNd5vUxHh
	53GkLNC2xPExxG10rg3hmPdMbFB132eUnModNodw/YVJDCEbFYIHgotx2vgmz+GJ1n2A6qz6xLf
	o=
X-Google-Smtp-Source: AGHT+IFMDg6Fk6FafbPBgND9d5KpnZqpexJ0kT9TISgotESBmLJE6QfVccac2v6Zvr/lpHkf/iDYqQ==
X-Received: by 2002:a05:600c:8b11:b0:46e:48f9:a17c with SMTP id 5b1f17b1804b1-46fa9a98fd5mr20965895e9.9.1759917350933;
        Wed, 08 Oct 2025 02:55:50 -0700 (PDT)
Received: from [10.0.1.22] (109-81-1-107.rct.o2.cz. [109.81.1.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9d6fb41sm29907945e9.17.2025.10.08.02.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 02:55:50 -0700 (PDT)
Message-ID: <ff0941d4-8499-4703-bdc3-4fbe2c0be50b@suse.com>
Date: Wed, 8 Oct 2025 11:55:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] module: Add compile-time check for embedded NUL
 characters
To: Kees Cook <kees@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Rusty Russell <rusty@rustcorp.com.au>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, linux-modules@vger.kernel.org,
 Malcolm Priestley <tvboxspy@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20251008033844.work.801-kees@kernel.org>
 <20251008035938.838263-3-kees@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20251008035938.838263-3-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/25 5:59 AM, Kees Cook wrote:
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
> Add a compile-time check using _Static_assert that compares the full
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
> index 6907aedc4f74..160f1678fafa 100644
> --- a/include/linux/moduleparam.h
> +++ b/include/linux/moduleparam.h
> @@ -26,6 +26,9 @@
>  
>  /* Generic info of form tag = "info" */
>  #define MODULE_INFO(tag, info)					  \
> +	_Static_assert(						  \
> +		sizeof(info) - 1 == __builtin_strlen(info),	  \
> +		"MODULE_INFO(" #tag ", ...) contains embedded NUL byte"); \
>  	static const char __UNIQUE_ID(modinfo)[]			  \
>  		__used __section(".modinfo") __aligned(1)		  \
>  		= __MODULE_INFO_PREFIX __stringify(tag) "=" info

Nit: I think it is better to use static_assert() over _Static_assert()
for consistency. Note also that C23 [1, 2] introduces static_assert()
with the message being optional, which essentially matches the
static_assert() macro in include/linux/build_bug.h, and deprecates
_Static_assert().

[1] https://en.cppreference.com/w/c/language/_Static_assert.html
[2] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3220.pdf (C23 similar draft)

-- 
Thanks,
Petr

