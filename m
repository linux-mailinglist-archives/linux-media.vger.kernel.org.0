Return-Path: <linux-media+bounces-67329-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +JT0CzxnUWpTEAMAu9opvQ
	(envelope-from <linux-media+bounces-67329-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 23:42:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 862FA73F114
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 23:42:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=F7RIYxd7;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67329-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67329-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FDED301175F
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 21:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E133C2786;
	Fri, 10 Jul 2026 21:41:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFC53C278A
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 21:41:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783719665; cv=none; b=LdHgAYL/5rv5Gne6Es4NuOTNIizyrpNomLfwtEiatEgSCFBbGVhDIlBZ7SY1j40yx2ZwzDY9I5NjdXi2907ClgFjs+njB+8A31tWYZaz/gGx+jkPjiiFfA0cai/0JBXCyfODHX+zIni6CvjIZmHIQpgz5BlqZPQOtM0s+YodF84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783719665; c=relaxed/simple;
	bh=sRLsKhX3nbX3ip0h+lFJX6a9doiDlrP1aVmvc5UQZsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GIiLuXf71dZUAmk5vgLmFHM4Wc55mWedSWX+zIdW6GX17lRfu+FFSL8ik/yj+2B3PjHDZZ31YTQpGGCVegqfzX1yYvEEbg6yZ7Y1EJOS5UVxp06Fu18lP7gytmxVWLXwzNPL8ISJtV1UmYIio4OxM8XtBV5uXOsnlykVcEiltak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F7RIYxd7; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so1026731f8f.2
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 14:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783719663; x=1784324463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98z+F18zm2o1eM5nkxQ5VKYEoQh7CpUJdp3ti2B74Ec=;
        b=F7RIYxd708YM3jQHsLdNtcVcoZ7aOviKcVmkiiGo0mw7fvIMpGl0CsQgrlft/cOoKG
         kSxqFPAhQEDSKD9vtdUO3nC8TR95bDPsIkFAJZPEzeKXeLh6zN56ERp8njtiz0nSwJLV
         rFDjyB0UhTpMquTModkqZZTPRT8CKZ6o/8cq0vORdwFq3+SxTucffQf5BWaSl1Q+ChcT
         3c74Gxh4yEFqLyla7jImI1NifWzRXT0u8zNHNGUMFntD/kF4BbVw2BZ5FIuqrMae5j9Y
         OOn8SwEYz1BCFmSSeTPf2aMLro5JZ0hBakzJ2mCcNneCI2K82MuGjRldftO5ZY+sZ84q
         SMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783719663; x=1784324463;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98z+F18zm2o1eM5nkxQ5VKYEoQh7CpUJdp3ti2B74Ec=;
        b=D+6QgVUW+8HIiRO5JAZjdWoDRNTXSmxra4Rr95u/zazRiy4WjmyZJ0fkqKamvlZHp6
         F47Z8QChLj8RYNxzwM3+XQA48BHXIT723zgP3zq6xsmPLqBXxllKxiltFcSnBVpbzJ2j
         8n2AsuXmrswmIkhezJlTgQWRPamu7Yt3yxI+jlrY2vRE6wBzpMt4Yx+jQPAhl/8rdlV5
         6FIyDOETFWWEHwM2SLb88LhqEinn3Hrs0H7Fr/mgAN7N2z5ORZAuoWP7H3qf9z8fj7+u
         djiVFh7gC5WBONVwKB4TkBp3KGLXLji57bEg9oVX9E/P0RV5GJhwWgCLxprMuQYLnlqn
         DnDQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYo5btJwEIgdHBBN3wuXWUDYmvLSylG7z84EI1n8OUOkcgQeUbwrnqnxa0DJ3gAoUVRj89v4nXBmJ05Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQVMFr+5HT2Gpnx1qY4zMF+iWve4Mha8wSi4t4xuIUHkP7akOO
	IbBRXVQcjVnJiX29Hx1aHtMVgJ3QR+Ew/x2tpuHRMx4Bkhl+Rz08EXWRsSjDndT2UNk=
X-Gm-Gg: AfdE7cnTvzXszCmTuNl0uvUHL1dGPVqWA1Of6HSJcFsfK1VFqwx4YNT4Xvsq6d0zlwg
	1j0NLCKgIk9mI5mahPyUHpeccUSGrOlMy+aOgvsj2cehnBAPy/1xf/kXL7+iLfXtAjMVYWedCxS
	GuBDbEYWUEFhn18exhA1TdXlp/rTKHgE99P7knHwhopUbE0xt3cRinDhGOQqEzeZ4cEoNzab3D3
	/TPAloHkjVKK8ll4jMIL1GGUN/FOdCIz8S3VmBYLdRIrIiWYkeaH+H+byxAZepvLcKF5GoOHTvn
	5/AV0hU/fxwuDUAeRtyvDEttE52G6HV0KtfPpB4W6FPmoyCtk02wRwreR13BTbZm2XLEBQ1uiNJ
	NcKstcLe7/SB2ttbAsMVsOmSX+psjq72K83QF5zar1kDjSMH9TvgIcQ3i90roVlJ5mC7wgHvFen
	xqQRKvA2qxp0C0GbNnKUfvvLgE
X-Received: by 2002:a05:6000:4284:b0:477:b22:488d with SMTP id ffacd0b85a97d-47f2dca803amr471641f8f.10.1783719662677;
        Fri, 10 Jul 2026 14:41:02 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.243.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm65817946f8f.21.2026.07.10.14.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 14:41:02 -0700 (PDT)
Message-ID: <54d76244-8ba2-472f-8577-b5d445d6ede0@linaro.org>
Date: Fri, 10 Jul 2026 22:41:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] media: uapi: Add CAMSS ISP configuration
 definition
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
 <20260710-camss-isp-ope-v4-5-51207a0319d8@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260710-camss-isp-ope-v4-5-51207a0319d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67329-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:dkim,linaro.org:mid,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 862FA73F114

On 10/07/2026 10:04, Loic Poulain wrote:
> Add the uapi header camss-config.h defining the ISP parameter
> structures used by the CAMSS Offline Processing Engine (OPE) driver.
> This includes structures for white balance, chroma enhancement and
> color correction configuration.
> 
> Signed-off-by: Loic Poulain<loic.poulain@oss.qualcomm.com>
> ---
>   include/uapi/linux/camss-config.h | 161 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 161 insertions(+)
> 
> diff --git a/include/uapi/linux/camss-config.h b/include/uapi/linux/camss-config.h

Why haven't you based this on the HFI stuff I supplied though ? Its the 
same hardware right ?

---
bod

