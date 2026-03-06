Return-Path: <linux-media+bounces-54825-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAOgGXAVq2lzZwEAu9opvQ
	(envelope-from <linux-media+bounces-54825-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 18:57:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D36A1226817
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 18:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E081306B4E1
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 17:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F84C41B378;
	Fri,  6 Mar 2026 17:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="axgMx0Y+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B8B36D512
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 17:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772819814; cv=none; b=UQhqk3VcUYR5mquTMfQsqbZMO1Dfad+iqIp0MZY1sEjObYZbqz5ye5KqBvwkGqrfvxyG3xOCwoB4gL3+GDNVL3CweNZLN4hfNU33HaODqGZ5vKb888pWWY+d7eoDORo2cGqmeR4FHGD5ato9LPQLmcHuUuvDqMhzmiTomSVp8ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772819814; c=relaxed/simple;
	bh=CjrVcnQzVchi06EUZQAn7mO7PN16zxrfyxUhD4HdI4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UGO1m0D5Z2UNBN1ZulISHqU3dvL3iJaWw4s2hdYt+t8n5P+ow/CRwPiyusQOqpG1jkupPOyQHY/ffJLrLwsBn9WikVnOzKa3UiKmajasfK1sEvhThizUZVApnZa88Dqu/C1pWHpyWA3O5afOur3FkIi831O0VPGXVqONXP3BgsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=axgMx0Y+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so111104875e9.1
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 09:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772819812; x=1773424612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=18d+owKLsGut3KU1+skCMZJUMBkNZSDjMEjKlVuS/dE=;
        b=axgMx0Y+rKKLIYz2FB0/9lqYJ/KXHSJcEJwUwaPTEjP6/cRFKPJIi/1aANLTuXgvAg
         UeKUW3R8GovLO8b0+/VBTeMsQKxgVXv9QcI2CZr3BCTAAjlGln0Be6hEwNy2RO9uQNdM
         x8imllAFqEniGpPGNHEXZeHh9f6oDiAcj1dl32IwUzq0ZlptxP3qc0LqidD+cpnJ4cBq
         v/ba4BjSs4MRp3TWFys7e/+5htnDHttPQCm9Rk2ZXaPLEfZzAnimvF/TgDupF23wk7h9
         8mW1kU+/2t0HIPfskn12mO+iR5NpT/AguIpW16Z8kQon+zR5mwP64A2nkRM9PVCVDdWz
         TZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772819812; x=1773424612;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18d+owKLsGut3KU1+skCMZJUMBkNZSDjMEjKlVuS/dE=;
        b=vJSWr+Om/rLhlYJ/IDn8b5Lzk3SjD9bLu+JEZgvp1XQqx1eMxSDZKb4lggguJPdhj4
         DQPkIiZqneMSWUam6HmgRyt3pRw6K4fHHbdZp1CYQ03vx/VhbuLIFGIBkLjMXzJkjbQr
         B8398gPsSlrJl9F9LNl3m+ls/VaTOsSySzb70pMMg7KAIrlWvxGUdDKroKl8urWeqGlN
         C3MAFDl7ckNYVWfi25NjUUydrbLFqfaEh20Gl0bgEpBPEyHiWFDIjcm913o+FsRrcCl9
         Dtn/72egXBllN3W44p8Glt0AVHDkiWXl7Ne/lHxkG8rjvZw2V2b995oC6nVw8riJg/NA
         DoQg==
X-Gm-Message-State: AOJu0YyqOjwSLEnfqV84kIGUTbo1NukgyNbKneJ9T/N8PONPmiFA76/M
	8qNs9UzRGPbGfUjOAekBrusU48MAcIQIilq7NXronPBEzMG6x1hc/Mg1v0RnrEqJkM1QznFg4pY
	iXU9W
X-Gm-Gg: ATEYQzzFxNLKQXv/MqeZ1qbtG6esg2tQoi0NNC9odWnGBg2HlgJgreSSrqpjzzFw9a1
	0NFS/0A+MGz+txDSRvhZBjCT6AGtzauNMyaXoifE/LRyEmUfrHmNRkP9GlUFBd3d5JPCT2invaU
	sunhujRlw41gcqVz1W3txhc891t46ICkadwRb0RGbVG6t7Fdxy+4EuqT+4UopUDaZMDrdIeF0Ed
	ad/jc+PUPIpiSc2e+OAFHqYQDde9zhSS069tqTLQV7oHoFxE7PugWV+9LR1mTCitUtzx5L3e1pe
	jK84UUaAU2v5fRYSthiU4cboNE9nY4BlIAuZMCXqFGi+yaoo8wtrZKq1Nm7qArspidzC1ztjyLz
	RqjEZ7HSv3/Gw4IZUKTeS25SGyRIGK5v45u3hXS22IEuBZ0eRHSt9ImFsorCGkbtQnPqZmh+MFt
	FEUZIGDh9z6KQyzFpzW9cYx5HerpBixCvZdq8=
X-Received: by 2002:a05:600c:3b0c:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-48526918939mr50182265e9.7.1772819812144;
        Fri, 06 Mar 2026 09:56:52 -0800 (PST)
Received: from [192.168.1.102] ([93.107.81.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb277e3sm118076395e9.10.2026.03.06.09.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 09:56:51 -0800 (PST)
Message-ID: <c15ce981-a14a-413e-8c81-7ec8521420a2@linaro.org>
Date: Fri, 6 Mar 2026 17:56:48 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] media: qcom: camss: vfe-340: Proper client
 handling
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
 dmitry.baryshkov@oss.qualcomm.com
References: <20260306140220.1512341-1-loic.poulain@oss.qualcomm.com>
 <20260306140220.1512341-5-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260306140220.1512341-5-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D36A1226817
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54825-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.948];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Action: no action

On 06/03/2026 14:02, Loic Poulain wrote:
> +static inline enum tfe_client  __wm_to_client(u8 wm)
> +{
> +	if (wm >= ARRAY_SIZE(tfe_wm_client_map)) {
> +		pr_warn("VFE: Invalid WM%u\n", wm);
> +		return TFE_CLI_RDI0;
> +	}
> +
> +	return tfe_wm_client_map[wm];
> +}
> +

I still don't really agree that array out-of-bounds should result in RDI0.

---
bod

