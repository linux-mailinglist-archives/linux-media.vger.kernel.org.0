Return-Path: <linux-media+bounces-59735-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOw6FOXb72kiHAEAu9opvQ
	(envelope-from <linux-media+bounces-59735-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 23:57:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BA447AFEB
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 23:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5C193024A73
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 21:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4C93A16B6;
	Mon, 27 Apr 2026 21:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sMyQxbao"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E503F27E056
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 21:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327056; cv=none; b=KaFBSamw9mG2Kz8blm5BY3nnj8QYha6roGgbD+w8DvKdMLcB+jb8JLEbW3TgOd68+YyjfpU0qVo++ateKM53h0lWSQqOB8v+UE+BXhOH6Vo6IL0GuXtZZPSuO8XlE4Q4fRzc2tE+LG3OyBZC6nNsJQA12BDpqXAgzcmCW7aFpME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327056; c=relaxed/simple;
	bh=OFgtGCn1mfUaoCP8LhdAyM8uQwb3Te8gLBE/Ti+VRMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D6ZDWjg1reI9mXyEtZEYPnxsR+7IcGJaQqqQtZxsNmSfAvnECfyZgOg5fCdbnA+/NcnLhbiguZLoY6MQa6ODWVyhMyag/KFfTdjPxIB8aa7WO/zfBiDm44F8d6RKP469kyKwrCftTmX9ZRSQcOgpG0/DeUVuBja3CDRVSMmN4/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sMyQxbao; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so63506285e9.1
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 14:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777327053; x=1777931853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kV+WIZsj9AmJtT9rTaHxlweLR0VMyPyAnS2ki5QOUJg=;
        b=sMyQxbaoFGJX/irParUdWhOOocCeUXvxFueNP6tsUkKMDA09z0L27fpY339j5ZCWOJ
         eVzCjDzD7vnD2t2iCuSoLzQnv8USvbSt3L5MxtOEvVMMsKRrHEN7CIJ7Ulxt3yKHD9rU
         ztw18e5W+kSqQHS/HYUdoXTEBfEYL5cNNw50k/MGVAFE2645Bh6ZHm8MLFtuOZPFXKs2
         K8cp10m4Ix5aYnNASAg3qCMpay1gY4706zIWd6QX752KDNbqy1i0ZvFqGRtaPrll93QD
         gr9BHek6wJpEQzL+mHVhiOaVsUl6npQ8cQJpWbOeGOtPrZG87br/DgVk19I4KrDSDGtY
         eTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777327053; x=1777931853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV+WIZsj9AmJtT9rTaHxlweLR0VMyPyAnS2ki5QOUJg=;
        b=P55B1ROiIlFAtl4spjzykPWNCfyBf06+A2ArGD/D3WHYjiudY9Y5WJ+r2U/gz255qk
         tc6F8xcsJ4e3n4ghAnd4uE9/gb52/1xqJkOJdAun5SbBYkK61m9v76OKL4+Qr6H5VOU5
         /jbvh82lPPqakmO5SrW7Do7/NKAE4pLQ7EZF8DEhUqN0M5QY+D7QmHO4GF/eK6H6B5y3
         nu/yapAIc3196bJKWpWZwFXtvCPRI87wZq7Ij60oljfW5rWxoRvbVSsmdNHV5sJjjlOm
         P3vtjKg78rWjFWsAxmiF2BnYJmXdoJ8XD/znWQiv1LvH6IQ91caxuvaCo7TxKWWWkCxA
         Qxpg==
X-Gm-Message-State: AOJu0YwDpxSFydcpefucBTEvZaUKdQxdyQClWeRtTUhJgTrh4lNGS5Tw
	E8tB+4nMF5v3pnSpGdMzR7MMlmzYxAqGFBP9GOslp6KTtQ0nc7Bz664P5gM4czu+TM8=
X-Gm-Gg: AeBDietOhQKO8x1nMZGkHyzw7wpeRM5G+52HqUJdze6G6X/Uu6CdYh0hwKb5w04pN2k
	myjI+wT8fQgeRP9kNg1LFF5s13AQNZNotzdKJ0ZJQDqQVAOJeakoalaMqmQbQN2CfypUlj4bYi2
	HROs+ZpSdqEQ9niQgz0eh72noX9JwJ10Ng3lhfk9fEnrkClmmbKeW9JIIT2E9oYAlI1k8KETY71
	IEa0su3dwPFVigO8LqftYeI31oNaZf4GIEURAf/rL5a+ZrxVs23RCC0VPwUCq94Fdl9ZI+jqcn5
	aDBfeHEzVgwYsvWltciQcZ4L3jLKp5l/QwaSqE2fUp0y8lGt8xC1lL064RY8YNXHrw4qPsg/+ao
	WbaR6GVkdNwJqJJEgdOpvPPH2aDA4QkYcSv5GDAnHsDG8uiySFt8T/XPBI/W7DYB/vXkJ/IU3/P
	zafF81QKxGskZLmxB1WBt2AO+zz3i2ncucb671p+8bMwUNubxT+j7OWQ==
X-Received: by 2002:a05:600c:4f0b:b0:48a:55d8:7882 with SMTP id 5b1f17b1804b1-48a77ae6477mr5384895e9.9.1777327052826;
        Mon, 27 Apr 2026 14:57:32 -0700 (PDT)
Received: from [10.156.67.45] ([89.101.53.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a77609a82sm3993585e9.36.2026.04.27.14.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:57:32 -0700 (PDT)
Message-ID: <1b914585-4c27-4f4d-8264-181340c27791@linaro.org>
Date: Mon, 27 Apr 2026 22:57:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/14] media: uapi: Add CAMSS ISP configuration
 definition
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 kieran.bingham@ideasonboard.com
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-12-f430e7485009@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260427-camss-isp-ope-v2-12-f430e7485009@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E2BA447AFEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59735-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]

On 27/04/2026 13:43, Loic Poulain wrote:
> +/**
> + * struct camss_params_wb_gain - White Balance gains
> + *
> + * @header:   generic block header; @header.type = CAMSS_PARAMS_WB_GAIN
> + * @g_gain:   green channel gain (15uQ10)
> + * @b_gain:   blue channel gain (15uQ10)
> + * @r_gain:   red channel gain (15uQ10)
> + */
> +struct camss_params_wb_gain {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 g_gain;
> +	__u16 b_gain;
> +	__u16 r_gain;
> +	__u16 _pad;
> +} __attribute__((aligned(8)));

So I published a comprehensive list of these structures a few days ago.

https://lore.kernel.org/linux-media/20260426000418.1158716-1-bryan.odonoghue@linaro.org/T/#u

See:

struct camss_params_wb_gain - White balance gains and offsets

The ICP/HFI structures - at least for the stats I believe are how 
hardware writes data to memory.

OTOH on the way in, the params ought to be pretty uniform as again 
HFI/ICP needs to take that representation and either

- Hand it over to CDM or
- Pass it over HFI so that ICP can hand it over to CDM

The ordering and precision is a resolved thing. I'm ~ sure OPE must 
write and consume in the same format.

---
bod

