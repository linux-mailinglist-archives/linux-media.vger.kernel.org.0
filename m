Return-Path: <linux-media+bounces-64643-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bAGeM1G7K2oyDgQAu9opvQ
	(envelope-from <linux-media+bounces-64643-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:54:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 712E96777CA
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:54:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=O0XRd3RE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64643-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64643-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4FD3F303CD7A
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 07:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D8926FA7A;
	Fri, 12 Jun 2026 07:54:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFBC3E008F
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 07:54:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250843; cv=none; b=KGhCupcyydjyLnzOX4qoG2lPf9cnhN13RmDoj/b98jitm+412ZtE++lWyAcgRnV9Fp0vTXUp/xs8L/GIpqsx6f6ns3rXGp5lYGbNKIo3EONgXX37cWHulWx48cH967hSR7MTFvslZzbUQ6eQUKYZuo3eTLajA1ip8uThpFgu8Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250843; c=relaxed/simple;
	bh=QBbXSr/c3akYemQ3kzkXquISdpepjP/Y0O5V7dwTJwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rRrMvFdpvSkA0bS9noJmYMe7jRtdBLFuBhcDN/zhIpB4tjn9OzsOh1gBLnxG3tsOAt2wmIyyb8iJ9iGTV7UyR2Y/sLChR5XfyeHt9ojIrZSM4htgvtyAJtYR1qedMeNRGWQWs8tw1aOB04x3E2/E2hGin3v1OM3oR8TYFAvLLBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O0XRd3RE; arc=none smtp.client-ip=209.85.208.171
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3967701fc3cso328951fa.0
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 00:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781250838; x=1781855638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YJ6W0UJoQmAwaQGvuK/o3SKo9denIg2VA3bJEyyrOY=;
        b=O0XRd3REwQ+hL3+Z/uzTLTyWtn4vfUV/1UwMutQmF1cUJy9JmK3Un/RgNaApnoZ4rm
         0wXUU0jZ7/3WDEXNal+6Zz+M4+ikJuJ2/x+LKi1Hs0xkxwyRn6r6Rj09r662z72E7b1T
         LGqExvLFurJsHeA+VJiT55uy9CrrPDdvKm7i6GdBQsjBdfsT2VS081/SsY/BkCgcTX1F
         O0ztj+ajpNR5HxfD/JLOXnOOd7JHZ/V062uytcfAxL5GVKxYXhHXVFSgVAPxLf6MxmVf
         PJMmStSb6tmoety+DlFDpmG/nYIY3WyKj71Xu/7T/pOHStYDfp2w/6UE0DD78KBquXbl
         lz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250838; x=1781855638;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4YJ6W0UJoQmAwaQGvuK/o3SKo9denIg2VA3bJEyyrOY=;
        b=M1u0GS0Ybwe6SONnoF6pv/4J5J8uenEHehqDg1BgxW3+hc51DZ58LPSG4VWygLlb1V
         d5jmzlWT21QMUb8q7Xq32rE3scjRV9HH8eYc1yHKqvBoXX40elwN5HQg1MLFrEQHKCFY
         6D8bNy28roCzV1ZGLsao7Vbq0Dh50hK4k2AqbIgBIRquv9dNog0ZqitDJZ5XbaAJS8GO
         Kf8NbbGh2bIoA1p9XzChV6UnnXKN0dTWR0Z6aK8viidZkrO8VtUCdcNF1BR/p9TUZLWP
         Ps4+hlFJ4HmNQQXNb5sErgmIFvOAtCb6scCnRRBafj6oDlnJ5S/RcZ2+N8mUC0FsQD2J
         PTGA==
X-Forwarded-Encrypted: i=1; AFNElJ+2sCBpQRM4C5u3YZLRUGhDyPBL6WmZfnagPr8WUvli4wCnnbFXZECMGSx2fHO++12f4/i1HQFOlF5kLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpfsNuelimuV2vQh12iOnPZBskHloD9wSIMfwUHQ0XZYhu7u6E
	Dl6Nl2wXECTCaVLPU6lROUm1/EtXHiR+OZXz9K/V8UBKNuFaJ38cH6iebJb+SjhGg3s=
X-Gm-Gg: Acq92OEFmG/fhMx9xQKxztROWVKxx1wfT3laoC/HvxRt61Ckg+jdhOnEgVfcMX9BY/X
	sl47TEVuOpaT6Al71ILMDZKUsL1jiwkV+AcLT9go4wy2XaIorGF+Hr6PGDc/0PoqHWyVJ/07b1v
	cB8Vx/i8vZYEFXHfrZ3MsN7TAdWYA31bhckoQZIXfcZDMJjpbolt7UoDzP+WTCnspvyCmW8v3N6
	oZnLjggUFnzbKv2TH13Kri25IbeT+k231a5LoLkhm5+YK6L/oUe6zKQx+uKzjhqhqPQoVkJzGzj
	Ctbo4dLJtW0F9vZIUUv6B2VjDs2eU9CHmRoHh0z5tBrhxFebkJdiC+k4iRDsJdJr5n0Rdti8HU6
	RlwWZKIA5jfpE/CA1cv+RSOrwjVbfvB0t2+AI+8yQ7tq6DMEgYgCvn2CJs+AE7tponjF6ygTGT2
	LO+h1Nn4u5jdJ/Pu2uewXhdr3S64KqB8MACGxWesL1PrQ8OvP7AKtCO8HYaSAumx0a6jkY5CHyz
	P+20g==
X-Received: by 2002:a05:6512:b91:b0:5aa:6fc5:642c with SMTP id 2adb3069b0e04-5ad2db715f8mr228537e87.3.1781250838480;
        Fri, 12 Jun 2026 00:53:58 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b4516sm308890e87.72.2026.06.12.00.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 00:53:57 -0700 (PDT)
Message-ID: <ad62d09d-ea06-4b65-937b-6dc49581bebb@linaro.org>
Date: Fri, 12 Jun 2026 10:53:57 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] dt-bindings: i2c: qcom-cci: Document Shikra
 compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-2-ca1936bf1219@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-2-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64643-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:nihal.gupta@oss.qualcomm.com,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:wsa+renesas@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,sang-engineering.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 712E96777CA

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
> Add Shikra compatible consistent with CAMSS CCI interfaces.
> It requires only two clocks.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

