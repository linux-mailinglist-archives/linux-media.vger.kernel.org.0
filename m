Return-Path: <linux-media+bounces-67077-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qk6nAofPTmo3UgIAu9opvQ
	(envelope-from <linux-media+bounces-67077-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 00:30:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2D072AE24
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 00:30:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Lqi1o7+w;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67077-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67077-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62F153026224
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 22:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E999A3FF8BE;
	Wed,  8 Jul 2026 22:30:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D483A366048
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 22:30:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783549819; cv=none; b=W+l7coBm+5v9sB7nNve1oO3jUVYLruQvVagBr/56f2zz6CjxUJ+FqseUBcufjWSmQ01HwP8YcNhsVS94Q5J5Gu/fujFp8cBh7MKjihhd0BrkK5gW+Q1QPVXNV4pfaJI8t05YRW8zUp2SHkBiJCe6R2jv2neW/DYPfngZhuoBONk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783549819; c=relaxed/simple;
	bh=Ucy2b3MPSEnBCBhKVkHMWhghZFra35xFFNj5Qb50XsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RDWDmI3dvxVNhKYeSzo4ZcZzIbjP8uXznHRA4af4hhEk3paT5PwmP0xKFm9x0DPXHhJWc26O+bJtGAzNYNeBDGNBYM/i3dwE4VEXVX4IWUCMHttWKR+ptQS25Kl3WQlL7qSDpYXFrKE1C/b0Wy2gsNUCki8Som5X21yn6fJxvPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lqi1o7+w; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-475417f010dso546311f8f.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 15:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783549816; x=1784154616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=90IOI9EUyLOw2eSiEVVHF1LKd1Sg9MHQdR1C6WQNJ10=;
        b=Lqi1o7+wVIWB3ifqgsn6xdp6t1KqFZUP2XjUycj/9SQqPoQyi7tZLKo+a9JxKQ8nE9
         116s3PnM7+hBDGuQBggD3Wl5NUaISy++kYlfeg7TysKuENF+6gJMh6m6lzX3EDRsdkc1
         g2NPTSLcja1Y4bA7pJytWr0d0g3AZdDecJl5fHZDSNkwMmLdHWJeSoPs6u8UFtrsz+yW
         zaspY21tFQdqgD0nZG1vAJRNcYuQodKA+jTPqkLfISKsK2EVgM22nOHD//qvP0wuR20O
         nE4ymz1SMwv37kJdeWZQ9Fw9ArOvqMfFAVoZgHAbOnPUxwDpBffAUxKO53V2zSKjmiH5
         o6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783549816; x=1784154616;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90IOI9EUyLOw2eSiEVVHF1LKd1Sg9MHQdR1C6WQNJ10=;
        b=HmxYdbid5d5vBOU0CvE7UnPgAQkNfTO4wSZ0shQ4bFJmZWTerGiGuw/rE1bAyMUbYw
         qKLyC4qgS0gW1YL++noh4SmomefmgZORl+EQNCax5T3JNCDUcw8rN9+UwHsU1MunFQKh
         VUQHYIXFOTtm2U4ukimxbjDb6eHERDIvEFjQ6psC08yGT2CxS8Jifgasavw/X4P3544B
         r7jsUtAf60IO2BzS+UnaReiqUaXIu8x2zZFPvnOG3zU07PE/mz/mJ+Eq0f9+hNJaBgmC
         H9uxnOpTmtrafJER5RDBQacawADQC0UE5nPmDP+YunsfZFs43/U/NFYJZK1VwdEdonwn
         8Oxw==
X-Forwarded-Encrypted: i=1; AHgh+RqWBqf+3eJ/kD+m5DXjebeHgtDrd7timFU0SRbI6QEZpHEPOqg1QMnXo5Y/hrBbCC000PSU6qv+Bip1iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAnXogc2xLfYb0ptzSA4+VNeJxryeRn9CeobQSjkOANE754yf3
	8sOlXpOquSdj8nHZ+ZZ09wQiNvsD0Ttw0zcHSktipg3ssUIh4VuSv9Mem3LkxAGpNl8TDhtYftx
	ByhJu
X-Gm-Gg: AfdE7cnx896BVqJJlZbOlyqToMNsXAZFySOM0WH4Qv6y5CCw+LNVwqOZkn5vrNiehhj
	dkMZVmWIMymj1EyNF9vmlF+a6fDzHE85Js21l8jqDyw/f+FxjTheeGZzEGdIm7V2LFOLwo5Mbuv
	VWs0xdpbsn/dcNMWzvUzhvIXb7xPEisSq7rtvV3tNp2WcN2gcEbXYoh3za0EIMiXCEzh7305T+e
	sQeA4X++v+a+uYiqG5gpURt28Stlv7n+6HA+DqUtqMlefxYUlUEZiVQJAc+Ne79c/OuqwIJLRch
	C/+PE0xScFvCOOSzQaRm+7vBR99r/ocJMsMNMEBMcyza+o4sXgRBVPyFzkDCw2OIVtUr1+dv1bo
	lJktr2znVpKU3kgaosrNLM973aeftJf4S4YFQ//xnbhp6GcW52dGoIO6vzjQAiqVyVdA2PaLxn9
	KxYfQ2ksK4Ksz0InlzHK03W/Rl9d4zaY4KLuaHlw==
X-Received: by 2002:a05:6000:2013:b0:46e:624e:3c2f with SMTP id ffacd0b85a97d-47df077b2e6mr4491121f8f.47.1783549816190;
        Wed, 08 Jul 2026 15:30:16 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.204.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm46711271f8f.26.2026.07.08.15.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 15:30:14 -0700 (PDT)
Message-ID: <d579ffd2-b99e-4e8d-b2b7-e7e896b2d71d@linaro.org>
Date: Wed, 8 Jul 2026 23:30:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices
 via DT
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org
Cc: vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67077-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D2D072AE24

On 06/07/2026 08:11, Atanas Filipov wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Use devm_of_platform_populate() so that child nodes declared under the
> CAMSS device tree node (e.g. OPE) are automatically instantiated as
> platform devices. This is required now that CAMSS is modelled as a
> simple-bus and ISP blocks such as OPE are described as child nodes.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Looking at my commit logs I see this isn't my commit message ..

Anyway.

> ---
>   drivers/media/platform/qcom/camss/camss.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d..95e655a8b6aa 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -16,6 +16,7 @@
>   #include <linux/of.h>
>   #include <linux/of_device.h>
>   #include <linux/of_graph.h>
> +#include <linux/of_platform.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/pm_domain.h>
>   #include <linux/slab.h>
> @@ -5362,6 +5363,8 @@ static int camss_probe(struct platform_device *pdev)
>   	if (!camss)
>   		return -ENOMEM;
>   
> +	devm_of_platform_populate(dev);
> +
>   	camss->res = of_device_get_match_data(dev);
>   
>   	atomic_set(&camss->ref_count, 0);

Just drop this patch entirely and model JPEG as a peer of CAMSS. I'll do 
the same with the CSIPHY and Loic the OPE.

Modelling for subnodes is nice if you have the idea the camera block 
should be a bus.

But for what reason ? As you pointed out it should be possible to both 
compile and run JPEG without the compat=camss node on sm8250.

Making the camera block a bus is a nice idea for "reasons" as this 
thread has shown, its a problem to implement with an upside we struggle 
to define.

When the facts change, I change my mind.

You were right to argue to have this as a peer node. Lets do that.

---
bod

