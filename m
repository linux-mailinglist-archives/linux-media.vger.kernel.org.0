Return-Path: <linux-media+bounces-56538-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDKAHn5ovWnL9gIAu9opvQ
	(envelope-from <linux-media+bounces-56538-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 16:32:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7A02DCB3B
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 16:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D3563070797
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 15:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B08838F957;
	Fri, 20 Mar 2026 15:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rpHpAdXH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B477302163
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 15:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774020280; cv=none; b=T0tqrqzEwtSsfEUOmUpEORj/Rs8YAlZTa+KvSkqabGotvEkPzXatq362IeU77szIrfIJmNf61s/RpOF7Vu4d/ofVelZmKtv3JFihwkciaUJuLdfvkBSeDxOO5BYf+VCnG/AZ1eUa3eCPwLHQIacKyCgZT7/8L3z81XESn2YtY2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774020280; c=relaxed/simple;
	bh=1uUWbAfjhQKGsekiHalIN3wkJj3mxEEBjAHougA6NbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X79D6VQgr5utUiF0fgqUmW3aYsB7w2oP6kjZkuTy3cUbub76hnThaAcZwu5WWYyzTsWYJS1gv/g+0Tm6RQJZrohZwxz6nC025MslHVxckPTCzkcHKKbysQ5qaScnz9LaB3a+wFZ7yPwhxHVbGj8lyeTirh5NkpQAwegqofBH9Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rpHpAdXH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48538c5956bso18923975e9.0
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 08:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774020278; x=1774625078; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EGuAgDtSJcuttCP6aHyWnJnRrzDxd6vKtX0ipXN9Dgo=;
        b=rpHpAdXH55b27GtYFM02oUpbQYUX469RBhm9tX8PCevng+6acrEtSge84WdQvJWbKr
         1BYHZiANoz+d78VO7fgy21jGLgjBmKUh/6ND486tR1t+aGfF4ksuOEGYw/1g3CNxXi2N
         GG7GeHAasVmHXOJZHWDdSMtL+yZnPT66dmFb4sgBKdrPaq5VqDqznoKUy/yAeKGsSb4L
         tf1c/xhgYGmR+BSu7qlesId9pkMhOqhpmaUowtEJlAu4qpZWYM6vr9wBfQim20hXY+yg
         zcAEMKO/m7BhBs0lXOcFuemNwI41xwXmLJ9g+L60zftWEImu0f5Ajfc2yIVsYl9tDxSj
         1y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774020278; x=1774625078;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EGuAgDtSJcuttCP6aHyWnJnRrzDxd6vKtX0ipXN9Dgo=;
        b=DZP/cyp0YcVfzZPuvjgxD1LobCpMsikLEXXWWZAdWhnhQYxz8hsvkIDD33alpVjJQl
         A79kPrX4s+dhYZ/vpQ8vKrARgf6PrBhXM5HWG5Q9okD71J4LrcoZcuBQ0QGBUyAB5zas
         9YN+UfE46UyC6LIyNaGOrFL5o+yMUlijbpwW7s0WTZJat2wQATMVOHk50ju14nyLNfHB
         67JxadVnh13MkVaOxTqFwATLioqndwP3G72pCwGxraYVLZwntql3PCFClw39wVPJ5XXR
         gtV2s9VW2+Pb9YFaYXLknwzGYypgge0Z8RxEPG/lOJOrtOY0moX5SlfnhsbzV8LCFdoJ
         Q90w==
X-Forwarded-Encrypted: i=1; AJvYcCUNB5fiOKiV/C73gV/j16EF185dK2+nO3YCK3enKHrt3xECfrRKHsjUjWrqa75p31yiffW4+YSjntHZ9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSxS0PnUYmAmKBfsqHC7sKf6SK787voL2r1LeDlkktLvU3umip
	+Gh5KRnhutq0nIvmkQaqpqQgaFkYKWZUCZUd5MVTYJMB7Z32BH8FHA2wssofFJd8qhY=
X-Gm-Gg: ATEYQzwJobvn7m2QS/zW3cuqDv6urGaDPWP/bVUBke2Hv90Zv8A7yHq8ICvt2zqvG2v
	2PtOOmpIdxbL3GhN+wtF0gY9hs5jB6wnywz3QEnTa/YidIWTR7k5LmDVqmk1nFr5s4xcw08hMCa
	RXsxB9RyCcxOA7vHrF4SLR1Dt06tbDJy5ZkI3KB/bqF1dWyXghcR0n+EHxK4SrmqjJANJqa0tkS
	i70MzfO7GtI9t6FDYPZMjw9RHovzaXbbCAX7PohKWr74t9i46nSsKePR/EDUYbDq/0YAIwquzHs
	t8kdS1TwBYrpQYaNY1NlFocav9AoosygUyPiA1cOQD2oh6S6JIuoKt46TMuCgIwmh41hPVmqR9N
	dJ53UuDnPv7rmwXmHiGfMPMqswYHiVhpIwh7mjc08KZevWxQ5c4z4cSjA5dC64EOOhxyD/XTMlo
	v3+X6isQ8MPqieT2Q4tyUt1BGTOoiDQ37D9sMPfjyrFwfQ7qk=
X-Received: by 2002:a05:600d:8449:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-486fe8a2bafmr46366735e9.3.1774020277489;
        Fri, 20 Mar 2026 08:24:37 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.207.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff1e6029sm33334055e9.9.2026.03.20.08.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 08:24:36 -0700 (PDT)
Message-ID: <e5e9cc38-9d8c-4a79-ab4f-8c5ed98f6eee@linaro.org>
Date: Fri, 20 Mar 2026 15:24:35 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: avoid format string warning
To: Arnd Bergmann <arnd@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Vincent Knecht <vincent.knecht@mailoo.org>,
 Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260320151828.3456863-1-arnd@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260320151828.3456863-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56538-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,linaro.org,gmail.com,google.com,kernel.org,mailoo.org,oss.qualcomm.com,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-media,lkml,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: EA7A02DCB3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/03/2026 15:18, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang-22 warns about csiphy_match_clock_name() taking a variable format
> string that is not checked against the 'int index' argument:
> 
> drivers/media/platform/qcom/camss/camss-csiphy.c:566:44: error: diagnostic behavior may be improved by
>        adding the 'format(printf, 2, 3)' attribute to the declaration of 'csiphy_match_clock_name'
>        [-Werror,-Wmissing-format-attribute]
>    561 | static bool csiphy_match_clock_name(const char *clock_name, const char *format,
>        | __attribute__((format(printf, 2, 3)))
>    562 |                                     int index)
>    563 | {
>    564 |         char name[16]; /* csiphyXXX_timer\0 */
>    565 |
>    566 |         snprintf(name, sizeof(name), format, index);
>        |                                                   ^
> drivers/media/platform/qcom/camss/camss-csiphy.c:561:13: note: 'csiphy_match_clock_name' declared here
>    561 | static bool csiphy_match_clock_name(const char *clock_name, const char *format,
>        |             ^
> 
> Change the function to use a snprintf() style format string that allows this
> to be checked at the call site.
> 
> Fixes: 0727615fb975 ("media: qcom: camss: Functionally decompose CSIPHY clock lookups")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 62623393f414..78a1b568dbae 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -558,12 +558,16 @@ static int csiphy_init_formats(struct v4l2_subdev *sd,
>   	return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
>   }
>   
> -static bool csiphy_match_clock_name(const char *clock_name, const char *format,
> -				    int index)
> +static bool __printf(2, 3)
> +csiphy_match_clock_name(const char *clock_name, const char *format, ...)
>   {
>   	char name[16]; /* csiphyXXX_timer\0 */
> +	va_list args;
> +
> +	va_start(args, format);
> +	vsnprintf(name, sizeof(name), format, args);
> +	va_end(args);
>   
> -	snprintf(name, sizeof(name), format, index);
>   	return !strcmp(clock_name, name);
>   }
>   
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

