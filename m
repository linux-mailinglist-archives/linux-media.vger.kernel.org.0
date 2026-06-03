Return-Path: <linux-media+bounces-63697-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oBMXHh+3IGpk7AAAu9opvQ
	(envelope-from <linux-media+bounces-63697-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 01:22:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AAE63BD95
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 01:22:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=lBeZTzPb;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63697-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63697-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 39E7F30312FC
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 23:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346274DD6E0;
	Wed,  3 Jun 2026 23:16:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598B64DD6D6
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 23:16:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780528570; cv=none; b=XEgBu3zsfnTwk608pZCmoahoOoa+eSDnEP568kP/4w5mxBHuRkQSUf2CCPYgL1LsP/nW6bto/rYHory+gLNCywMgyhblox+yAxdxVAzB+5NdOSuAOmkY7gtaje7fSCrMlttgfyIQLe2DbJkZBazGeQ/DqmzpfRn8x4voY/ci2ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780528570; c=relaxed/simple;
	bh=IIJGXZ517/1odyBzl3yh/mi2UlFo51wwrWvadaljdf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=llthvM7fY9m+PZq4+lzBAl7VMopLec3kNAiPFUHAhb9Vb6jWSheAAqQYI3KgkkUl+B1z/Vr8tTTdCEukLjR+OuGSJIO6C/F7VfNs4gIfMsNld/iJXH2cHsQxBOkjQzNCrd3einIzTndNYsxNI0d1zdvyWDlFU6dbAajl4CPJyhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lBeZTzPb; arc=none smtp.client-ip=209.85.221.53
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ebafde87cso38731f8f.3
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 16:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780528567; x=1781133367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWizzsQNDQB/C5tp1FfFcGVRcCGlCmeyJzRdeEaQEMg=;
        b=lBeZTzPbcvggaA5NCmytVo/vePQvi3GEb4+yN170q+kjISsnW0AubJTjcird0CBSPB
         s1lv0Eik/fVef/KZaE10wxDhlj6E2b9vbdy4JdQCJp6813ji5OlzBazXe1PlpCLoFin6
         i8GQLVe9voBntgYUoikMRefCVgVg4jggjMLEQ9NhzFMU/PAIwMN+UcGyxVXC/IyeeWv7
         MHX1IXGqRL0gLjuy/j1nw+j9yNHAcdPqQGHs2TT4NHmhy53HCVE+jYDkUj5hkcWBzi2l
         95/2zkmdtk4FFLcSCSvKoSyAJ0uVihVmCp8VFuqGseq7GNY3I2BUw4H0qgKhZ2AKNVUW
         D1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780528567; x=1781133367;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWizzsQNDQB/C5tp1FfFcGVRcCGlCmeyJzRdeEaQEMg=;
        b=XYO7zIGhjCWI6ZkqW7/hPlqZvaTQGfOh2BY7GANawDnTs5IS+L+xh0U41oX2rI9Bs/
         GaQAZfXlWq2gQJneAgb/NsHJCgkKkIsyj3lh3x65F+U/Uv/l6Q7ZoCWHQCaCq7jpdzlf
         i0JHZ1Ai7yd0f5BdVkFP23BQtJlLbIsNeonbp8VpBTF16KOsbXMqw0n5srEGf6j4A+cp
         ue//37tsw4IECPnyZNLlNsDomgYD0Npr9hpLP0SY4I/hFxbUzzQ1LEu21jTdif78QaN0
         diXER69YJfl1ObzbXu625MCsyRRhuycwSfekALHZtZA71KwxNjPU1lPcsji8PdP/QZQU
         NRLA==
X-Forwarded-Encrypted: i=1; AFNElJ/82TtvfxFluS5Z/zVlhVifj9LMaNpFznlddHXzTMfZ52KKcnNRM7RLeciIFldurZLJOCF+FxXVSxhGjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeC6QJ+iFSHQpXpDaY4Y52y/6Jw7K1kLKHmEClIPEVBgQjKBko
	lpmBcLF4C0Vy7cWdNmPMQvBJJSgSF1fNjwIt5/Gnp56Qze6l7eCt9HQ6FxDJIfZZUhA=
X-Gm-Gg: Acq92OF5hSlR6tgSOzpdToUTuN3cn5nIfav6zT60cs/4BsA3iyi2RpiUxJIItJSJKlo
	cKEI/t+cefF+sItFFlfZimGkc7JqWiwLQTXe44QxpJ6YMj00TaHc9TUrSiJq/DwPjpw19W5GOtE
	uGHaD0izRpYU20WwyRfjfLDm3uAODHnTWLOcG5X7Pjp1plwpdIRJTswyUR/Wb7nlJ67RcEvt1il
	7Uq7EHnPGiUy2fjzcjPy43jZoVlZ0m1mkm/dA0enzeaPgTXPalxXEnJv+RwCeJnt2Qg25lu8dFg
	yg09sWdA4020DhpOcT8ujsvPS9OiK9mptD17rnaG6iKHK6iDq5nuXj/5MFXyCpGOrrwHce/X48N
	Wcfh8FiYv06Oy34BGUiNR5VX5GC9zscjITErRdaLZVSE8/dVJQFGj4ijW6hZvM8liW2izEAv9wj
	b0sVssvrSysI8hNk2bbnkTAIcxn4rjKBdBroX1MnbZA7pXXA==
X-Received: by 2002:a05:6000:e51:b0:44f:da08:18f2 with SMTP id ffacd0b85a97d-460216d7f47mr5876752f8f.12.1780528566788;
        Wed, 03 Jun 2026 16:16:06 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.42.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35133csm10440882f8f.25.2026.06.03.16.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 16:16:05 -0700 (PDT)
Message-ID: <11134fb3-8c78-48c8-bd63-719ad1c35036@linaro.org>
Date: Thu, 4 Jun 2026 00:16:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Rename unused macro parameter
To: Hungyu Lin <dennylin0707@gmail.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org
Cc: vladimir.zapolskiy@linaro.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260603231202.6569-1-dennylin0707@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260603231202.6569-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63697-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81AAE63BD95

On 04/06/2026 00:12, Hungyu Lin wrote:
> The ISPIF_VFE_m_RDI_INTF_n_PACK_CFG_0_CID_c_PLAIN() macro
> declares a parameter named 'c' but uses 'cid' in the macro
> body instead.
> 
> Rename the parameter to match the identifier used in the
> macro body and silence the checkpatch warning:
> 
>    WARNING: Argument 'c' is not used in function-like macro
> 
> No functional change intended.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss-ispif.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
> index aaf3caa42d33..8b0753e606c1 100644
> --- a/drivers/media/platform/qcom/camss/camss-ispif.c
> +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
> @@ -83,7 +83,7 @@
>   					(0x270 + 0x200 * (m) + 0x4 * (n))
>   #define ISPIF_VFE_m_RDI_INTF_n_PACK_CFG_1(m, n)	\
>   					(0x27c + 0x200 * (m) + 0x4 * (n))
> -#define ISPIF_VFE_m_RDI_INTF_n_PACK_CFG_0_CID_c_PLAIN(c)	\
> +#define ISPIF_VFE_m_RDI_INTF_n_PACK_CFG_0_CID_c_PLAIN(cid)	\
>   					(1 << ((cid % 8) * 4))
>   #define ISPIF_VFE_m_PIX_INTF_n_STATUS(m, n)	\
>   					(0x2c0 + 0x200 * (m) + 0x4 * (n))

Nasty

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

