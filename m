Return-Path: <linux-media+bounces-26556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 378E2A3F215
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 11:30:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 104F716FE9F
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 10:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF78205E32;
	Fri, 21 Feb 2025 10:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="bAzDBYIr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A712054E9
	for <linux-media@vger.kernel.org>; Fri, 21 Feb 2025 10:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740133785; cv=none; b=bLaKamZ73VHAPPhHE2McY7o9T+XMLHefxZvWesAywyDD45DUdQy1yTjfMwfMfhkSOGzkXbAPymeu71hzRe9n/r2bggpL1z2lt6r8xeefIZu9/8L9QChMbbwD1nk+qebxr1SojLFDDmpSudI0Nay5gnD+Qc7vvEkFbnfotGvS/CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740133785; c=relaxed/simple;
	bh=h3ApYvzKTccF1XnzB7gk+k2ClnVcJjmA56TFYSxYExU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NznXzaYESMip2CkixzYHo2zTTXIGiG2zX/rTC2hW4GL49l/cPfDwf20APUQjtc20xr4+Eo9QN6m67alhVGDVRyLU+m550OY1HZVYpUyLYHWA5J5shAZbgtBHHItY2Kkndec00goZZtd/OsnN0OKqRh1FEdWvNv+yGf7u1PCNVz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=bAzDBYIr; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3098088c630so17449761fa.1
        for <linux-media@vger.kernel.org>; Fri, 21 Feb 2025 02:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1740133781; x=1740738581; darn=vger.kernel.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XBgTd9yS8bHj2inA4KCI/wGm8uZFJ13xmrkCLQobpyg=;
        b=bAzDBYIrwE92+mtrgAOBk90lUvMK5y7/VoRAed5bOuogGf3/t25VpidxhE+llYOKqa
         mPOEZCovZuOAfqJrw+gvAdcwtVB7nwQ+6nODua6uxyErvnm1rzYefznV1RUgG9vUJcc3
         ZcPHMRL5FGgsuyxGX6LBw3yXODh2wdn5n4WmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740133781; x=1740738581;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBgTd9yS8bHj2inA4KCI/wGm8uZFJ13xmrkCLQobpyg=;
        b=fcMALA/C+ypwJFbRCoiq6zJV5LY7qmAbSksVKa12WGeqzqujugZBSV9wpGPygZl0l3
         NQejyheYNDeRxj+PkQ63bAIYccmzU2U7YCvB07gRp7sCuY/Chyaa1CVQR9nnOtYcDwn6
         gKnaI5l0MZa1sD4FnIhBw0j+Xk8ZuBfwVcHB3uxTmfAee19aFnFDV4D9JZZ0WmBHLYK+
         0su1P7LG5gjc63jScEixKxRS1oEXebQt/i5rCFeJikNAo54rjaBv//bJ6h7sXSGE9Hfo
         NSwvmzH6FdrBE7RJM6ARSiIbb+pcmsMS9Yrqmk1zIRdgLRmcUSX5U+8FtjRad475/xc9
         mJ7A==
X-Forwarded-Encrypted: i=1; AJvYcCX8fhDkTGEw6ftgEY9yW7xMndE12sbuww/Ug2eh0inD51i8faD+d2FL0FP2imlnCRfD8/KoLJLjoLLzpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdIsobo+hhOPLJUBTB5TvH3ngFu6bKAMyTUtlQvfWZC3XiHco6
	jTxvBYjoxUWgj5NPX1pd4UKOzbreZw3kiv+O+NUdiHMz9pzUTeck6hgn8IZcHM0=
X-Gm-Gg: ASbGncvSv/YIgC8Wmnc1pcJmaSWC22GEXZ4yazp6kPc2n1u3ov7ETMwE8yHmOOJu08e
	rjVIBGPGnzgF4oeUTDALDQYzesnBqY7Kz8tVhvM4Xl136V2j2uwhHpuF9txRBldXelij5EqVsvX
	MLm08pFzNzZ3bOFeWoshwL4xkE8eJ8I6+u6kgh17NyTfL2BiZJ3JRTC5c17wGr5s1Lwx7XYxHrH
	lVKOD3/xiITrB2lvqoSFzRggbTMRvcRhtu+j5T+c93b7zF+3QGS3aN4+KAgmWr3bR5mumPnYhH2
	1xqHKIwYaKiJ4VUrcvRxzwtpImE=
X-Google-Smtp-Source: AGHT+IEUOdqdqFnuqPXA4cgWINcdgxUl8JQ3ygr09PQ43kzULiZT56Khi3z1J3sj7fkaU8oDV/YSHQ==
X-Received: by 2002:a05:651c:2120:b0:309:1f98:2848 with SMTP id 38308e7fff4ca-30a598e2984mr10302661fa.19.1740133781115;
        Fri, 21 Feb 2025 02:29:41 -0800 (PST)
Received: from localhost ([81.216.59.226])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-30a449aa148sm8429891fa.109.2025.02.21.02.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 02:29:40 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk> 
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>,  "rostedt@goodmis.org"
 <rostedt@goodmis.org>,  "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>,  "senozhatsky@chromium.org"
 <senozhatsky@chromium.org>,  "corbet@lwn.net" <corbet@lwn.net>,
  "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
  "mripard@kernel.org" <mripard@kernel.org>,  "tzimmermann@suse.de"
 <tzimmermann@suse.de>,  "airlied@gmail.com" <airlied@gmail.com>,
  "simona@ffwll.ch" <simona@ffwll.ch>,  "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>,  "apw@canonical.com" <apw@canonical.com>,
  "joe@perches.com" <joe@perches.com>,  "dwaipayanray1@gmail.com"
 <dwaipayanray1@gmail.com>,  "lukas.bulwahn@gmail.com"
 <lukas.bulwahn@gmail.com>,  "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>,  "christian.koenig@amd.com"
 <christian.koenig@amd.com>,  "kekrby@gmail.com" <kekrby@gmail.com>,
  "admin@kodeit.net" <admin@kodeit.net>,  Orlando Chamberlain
 <orlandoch.dev@gmail.com>,  "evepolonium@gmail.com"
 <evepolonium@gmail.com>,  "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>,  "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,  "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,  "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>,  "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>,  Hector Martin <marcan@marcan.st>,
  "linux@armlinux.org.uk" <linux@armlinux.org.uk>,  "asahi@lists.linux.dev"
 <asahi@lists.linux.dev>,  Sven Peter <sven@svenpeter.dev>,  Janne Grunau
 <j@jannau.net>
Subject: Re: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
In-Reply-To: <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com> (Aditya Garg's
	message of "Thu, 20 Feb 2025 16:39:23 +0000")
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
	<C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
Date: Fri, 21 Feb 2025 11:29:40 +0100
Message-ID: <871pvrpp4b.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Feb 20 2025, Aditya Garg <gargaditya08@live.com> wrote:

> v2 -> Add this patch
>  Documentation/core-api/printk-formats.rst | 32 +++++++++++++++++++
>  lib/test_printf.c                         | 39 +++++++++++++++++++----
>  lib/vsprintf.c                            | 38 ++++++++++++++++++----

Yay! Thanks for remembering to include test cases.

>  
> diff --git a/lib/test_printf.c b/lib/test_printf.c
> index 59dbe4f9a..ee860327e 100644
> --- a/lib/test_printf.c
> +++ b/lib/test_printf.c
> @@ -776,21 +776,46 @@ static void __init fwnode_pointer(void)
>  	software_node_unregister_node_group(group);
>  }
>  
> +struct fourcc_struct {
> +	u32 code;
> +	const char *str;
> +};
> +
> +static void __init fourcc_pointer_test(const struct fourcc_struct *fc, size_t n,
> +				       const char *fmt)
> +{
> +	size_t i;
> +
> +	for (i = 0; i < n; i++)
> +		test(fc[i].str, fmt, &fc[i].code);
> +}
> +
>  static void __init fourcc_pointer(void)
>  {
> -	struct {
> -		u32 code;
> -		char *str;
> -	} const try[] = {
> +	struct fourcc_struct const try_cc[] = {

I know it matches the code it replaces, but kernel style seems to be
"const struct foo" rather than "struct foo const" (at around 130:1) -
just as you use in the new helper function.

Also, please consider changing the array, and the newly added instances,
to be static instead of automatic (our le32_to_cpu should be usable also
for static initializers).

This will conflict with the conversion-to-kunit which is in flight, but
the conflict should be trivial to resolve.

Rasmus

