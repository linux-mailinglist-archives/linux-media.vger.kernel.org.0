Return-Path: <linux-media+bounces-64587-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pzRHHT6pKmpQugMAu9opvQ
	(envelope-from <linux-media+bounces-64587-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 14:25:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EE5671CE7
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 14:25:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=sZuwcPG3;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64587-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64587-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC3AB31372E3
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 12:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B76346FA0;
	Thu, 11 Jun 2026 12:22:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB1231197C
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 12:22:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180572; cv=none; b=R1Mnf9JVBhHWb8MIhAPd3xoJDqaQqdmsAwgc93i5AKitdDsvYL4jmJBKeEF0DmHafjw4EXTW8RuoLvXwTkp5+mlykpAkFCoVC1LtNGo8wDQsZu4TZ/kAqKZTr0G3ftFP4hc4mHwSfGuyf+oanJrg4bodoHLE199DdKnLRRzcK6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180572; c=relaxed/simple;
	bh=6mybAxFWA9piKMYdQTC95b5ZGi6YKc2Dvduxn+GK1Rs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V66eb7YMCtDWH+lcaTddksG8vOXTGLRc05zqdPOCJxoE8q0nRRC/zTZcYIJ+vsMUQhkx0SUvantdkLemVmPqJh87+MPTIITS9TgQi7GmDZ9rfl3i76WYSFwe4MH9IsIwfQM/qeTL8JueBL9nVIjLxEXXObe+YlXMFZU2T7tgqq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sZuwcPG3; arc=none smtp.client-ip=209.85.167.42
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa68da4e45so709136e87.2
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 05:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781180569; x=1781785369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UVAPv+vJYyMdfCgAAqYJ+tpswqCocudVoYqqRm2LCg=;
        b=sZuwcPG3VczZISaPBGPUIykdEVbYJmqWYESl0nQwgXSBnWyTgIQx+NZWRAXknB/oBd
         i7jzaBuPwUV5Eaz1P9UvlsuO+18UVjbHf2PKL8Mltx8H09UjN3nvf2tL+fcKDz1ylKuY
         1pHLnMxxk7Gju4UrFZsszu2s0brHQs4i0PXmmsR+4Pr+50dOEbXGIq3D+7RVMFMTVIoM
         euvfJGEKm2UELN6qTQ2z6G2pb81APsN/FIxtGLiDDSDfXIgFZkXG/KJZe1EJuXlGxCSk
         h1Wy9jsHN/7KsPEyYyxKQ88nzCXu9QbGQZXgzHnQBwXriPQdJhDu5tDVuiQzCZhR46Yk
         qS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180569; x=1781785369;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3UVAPv+vJYyMdfCgAAqYJ+tpswqCocudVoYqqRm2LCg=;
        b=snfv8H49rp4D01JRlf27XRGsACFRxrOHShkpBC9wiDqvHbHzGwwHH0IhnFDSlz+xnD
         twjjNdM18JyQOdq6A/VjJU2ZZdY/7EGXUOG6oVHBX82ZdrfUXQoKL0bON18iQkVF17Vs
         oU4jHjEHcU4RKHN2Kzudgiq1laIV0MgMxr9tg8Jnw3GpOJITUPyJ+Fa8HLh2QbwjxWSV
         zRNRPw2BMCs4CrUlvotpuR9ejvb3TWBbB7wOLmZVJmO8mgC8bXvNXGxzCGexDw8qnlbY
         l/KhMaGd5JJHvCPWpelZX60dqj8RQD1KYbHBzEci4jR7iYenfxR3giVllFK6EZKmWGlk
         Syug==
X-Forwarded-Encrypted: i=1; AFNElJ9in/1Ob1e3RHvbAKzFioMx+I6wVfYrKH52OKE516gCp5KhcjAHTxPWmFM/QE+jzRULp5wmmB5QwH3s0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyTDU8fL25pHbiUNibAauZnbYym+HiUZQhCs1TRMUqc6yhw9JS
	5elJvv8Oi4CSt/v8aPrmnx7UccIAoiaYtaBMq9kDxQw1Ong0+DunBxP+3Xm4UdUe6yc=
X-Gm-Gg: Acq92OHpPL2HcNE9UF7vGf/I6MXlcXbb9tQkC1NIKKeSaFUMPFPBafLC9RP6eDNcY24
	3RNOU/4AqcFiVmqc7PdFEJ7Ayw2U55NAphXmiHMq67BGHfsRDvV5t12soAw7NjDfW0dGa5FI4uw
	MObeCVtrVwG4h/EjUePB9NQ6tzzeH5PKH43kNpEcJglE888s3ZXqBks7cnBAzn4GpYzvuUkfU1P
	u2A9d78T7eqi1xxJDIRTnr29Us5fcgn6mKOdJKW8OouRhYbUH5bh7MQaJxkyCewxpphtv0MPZcD
	HIgWAckNYVOwMvZVZtLJ83VtldROVQQnf0u7veO/0ivFPNTGIBXZIy6CWUjxPPN4ult/iV8QP8p
	m08BKJ0utH3yiKGHjqtbftkcWNxsl0k/SNA59n+VoDCPRiR6NyMGQsC6TNmel22J983tliSeOA4
	NHNzEQ2l3U1mGZ/y7jgSNsv2WTmWL7M4XmOLLtMhbDfdcZfwsvSiQwX/D3jm6QXikwe2yWh5DYC
	iXLoRGq8oaBLEXo
X-Received: by 2002:a05:6512:1548:b0:5ad:2ac0:9fb0 with SMTP id 2adb3069b0e04-5ad2ac0a109mr69074e87.4.1781180569120;
        Thu, 11 Jun 2026 05:22:49 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fc8d9sm6258927e87.28.2026.06.11.05.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:22:48 -0700 (PDT)
Message-ID: <ed42708e-97b6-4c5a-aa52-d712cd4dc591@linaro.org>
Date: Thu, 11 Jun 2026 15:22:47 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] media: qcom: camss: csiphy-3ph: Fix lane mask
 calculation
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
 Petr Hodina <phodina@protonmail.com>, "Dr. Git" <drgitx@gmail.com>,
 Cory Keitz <ckeitz@amazon.com>, Loic Poulain
 <loic.poulain@oss.qualcomm.com>, Hans Verkuil <hverkuil@kernel.org>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, stable@vger.kernel.org
References: <20260610-qcom-cphy-v8-0-cd4387785179@ixit.cz>
 <20260610-qcom-cphy-v8-2-cd4387785179@ixit.cz>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260610-qcom-cphy-v8-2-cd4387785179@ixit.cz>
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64587-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:hverkuil@kernel.org,m:nihal.gupta@oss.qualcomm.com,m:Frank.Li@nxp.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:stable@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 80EE5671CE7

On 6/10/26 21:28, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The lane mask must be multiplied by 2, but this was accidentally omitted.

Fortunately this computed lane mask value has never been used expectedly by
csiphy-3ph users.

> 
> Fixes: c94d21ffa814 ("media: camss: Add CSIPHY files")
> Cc: stable@vger.kernel.org
> Suggested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Fixes shall be the first patches in any series, please reorder for v9.

Then, formally it looks like a fix, but to my understanding it's just a noop
change against the current upstream codebase, thus the change is not justified
to gain the Fixes tag, see Documentation/process/stable-kernel-rules.rst.

> ---
>   drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index dac8d2ecf7995..7c8c0e41bc62f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1114,17 +1114,17 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>   static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
>   {
>   	u8 lane_mask;
>   	int i;
>   
>   	lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
>   
>   	for (i = 0; i < lane_cfg->num_data; i++)
> -		lane_mask |= 1 << lane_cfg->data[i].pos;
> +		lane_mask |= BIT(lane_cfg->data[i].pos * 2);
>   
>   	return lane_mask;
>   }
>   
>   static bool csiphy_is_gen2(u32 version)
>   {
>   	bool ret = false;
>   
> 

After dropping Fixes tag and cc to stable,

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

