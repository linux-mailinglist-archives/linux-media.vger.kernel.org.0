Return-Path: <linux-media+bounces-52520-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGpEAc8vi2lVQwAAu9opvQ
	(envelope-from <linux-media+bounces-52520-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 14:17:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C5A11B290
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 14:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0F46304A581
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 13:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981AD329C48;
	Tue, 10 Feb 2026 13:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h/R5cJsn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ACE19067C
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 13:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770729381; cv=none; b=oTkXf42dAvS74V9P8Tdzmm3udyl+tgp8QAl4SkUAXE1w2e0OuT9DlrZoKcZtlplgKBkqPSKqiIe3pGKSEVIGJh4APnYn9cqhG/Xt7JsPDjDGLTB/rXGDaQpLHjce8qiuW5y8FKH7vvR+g2TE+ZNdh66nUj8U9teRgoThgMHpHCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770729381; c=relaxed/simple;
	bh=47lTU55/gykUcjRt+xxtWjYlJLvvJMCfBp+RED1uTkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XTq5lPz/ONutbEGTeEYyDc6ArVqxM37DaKmkr5RTLC6D8cx3qF/d6CywlpTz1gmrScIA/iuUx+vEDuLhgBwYsGg5Nn6XMo4nA4iDu3vX8zhe22HOWb0PjZ1dkKLlTgxs9A91zOvEqcxcRyIfou7vjD/RuZXjdpCvf5uDCgYGmRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h/R5cJsn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so7158775e9.1
        for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 05:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770729378; x=1771334178; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OYSe1+CAiybXtDZ7qn+sljqCDCmOWnnVyECoc1AwnJs=;
        b=h/R5cJsnrDi94NyDn/J7FIOCfsNM7gozZyxaObjI+6X6rB9sprwsX7pR9y3pGMv0YA
         woI2CgwbvOFDzBR1swB+bHKpWYNCCNW4C1Hr16Of/A47BheUb9P3UEcd9Bl7pLYG/Trq
         +fzdixSUZzv8T583rW3eFf4bdw1PXeDjh57Az0TS8Lu5jcVm0aZNauPwfC6C2pCvObKx
         PBqkJJWnFfAlJ3Zt019Y/9umAIfIJTghqZGrZ/+IPlk8nxN2baChBKUCnWB6Ib0TqK4N
         bJ90s0aQKX637GvW61zgznta3ae1S7neoNeTKWzZ1X0TlEo0icLZd3rgRazdVnWuEkPK
         8lcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770729378; x=1771334178;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYSe1+CAiybXtDZ7qn+sljqCDCmOWnnVyECoc1AwnJs=;
        b=vN7W1BD03gCPzMt3edcu+wNKanaf52lC2hM1CUIB8+0csrwQFoK1ZQbcxhm4cu0mmo
         kAT4XtUxDvoZyLvgMNZ27u/KOJKWz0Gufques8cDuOKp6ZvYHVshrNUSzlsGyVBkCo6H
         AC1uNzDeIePme22AxQs0KBaLxUvTWoI/SBazyjpcY83Esnw4URDsS4Sdi5yhlhb6cEj7
         d+JTIpn/dyRyEHgzgw7kV8++NthDomWDJ9r+Pze4wBxur5qF2+ILo7RiFXDkYbhXs2ms
         CruYVzKWRKiu26P2gmTfvFzLumQFXok0DPazpKpolT6Vbl9xkZqdgkajHNx9reNvnPhK
         Cz6w==
X-Forwarded-Encrypted: i=1; AJvYcCW7xf3l03kOm6l0MBWYlvFkO/vDi4a/X+UvOnByo6l21ujRUqJcEqEKWsoO/xh5d0R7dwDto12+429ANA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN2s+7lpaMBpj9dBMaCf09rgCXkwrHkqU3Kcv4vZikC+0K8J7U
	Pf1Vy19Qx7CLGkzcCD6/YztBMOP6SIlrDNkfHWDe2tOR/DVycuRNcA/v55MGS9Lhi9A=
X-Gm-Gg: AZuq6aK6UNR1BAlvZEsj80dSDzlHXVW+2+b1ZLkoDaGWAKnRbIBClOnctbrfz4dkN+T
	HXNcPS1O5JpYNolrngL0WnPwCstNzsp7Bw+ou+pQ5sN4UNacva8KCRAqP48AjYk5jO7YSS/09Hp
	kQDz5HAAb7HqwOG2RccdWQrg984O6mynS2pjJkU7n7NH3q8/PVnTieLEf6u5kGGWA2Uj21ZuWZW
	mZhuMYJYe8KwBONSVQPgDWoRXxw9o9o0WznzL6hmCIKp+eO+plgDODVb7IIRv7R5A/o3mX+FU9u
	q8z/bnGk6PE8cLhxc1QojQtYbG96smst24QFzZ8v93NI9WuK6itB6NHpuWM0xipkKI5HBvhg5Ze
	3eualIHP3HhDIactF0g+NSXjHiISMC7/EXJXxDchG1cF4lIE6FEj4oHlQud70iDLlLZR/bLRjYh
	DuDDvf+gsHWhfGXYCiqP2aOZM5GPslngN2x3/Ch9mcSnnGwPf8eCOLz56y30Pc8y4x
X-Received: by 2002:a05:600c:3552:b0:480:4a90:1afe with SMTP id 5b1f17b1804b1-48320339137mr232607865e9.34.1770729378123;
        Tue, 10 Feb 2026 05:16:18 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d7e64b0sm72637865e9.11.2026.02.10.05.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 05:16:17 -0800 (PST)
Message-ID: <416e2f12-92c1-4e41-bf08-860443710035@linaro.org>
Date: Tue, 10 Feb 2026 13:16:15 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/7] dt-bindings: media: qcom,sdm670-camss: Remove
 clock-lanes property
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Tianshu Qiu
 <tian.shu.qiu@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
 David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
References: <20260210020207.10246-1-mailingradian@gmail.com>
 <20260210020207.10246-2-mailingradian@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260210020207.10246-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52520-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.0.0.2:email];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 90C5A11B290
X-Rspamd-Action: no action

On 10/02/2026 02:02, Richard Acayan wrote:
> The clock-lanes property has no effect on the hardware configuration, as
> of 336136e197e2 ("media: dt-bindings: media: camss: Remove clock-lane
> property"). Remove the clock-lanes property.
> 
> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Link: https://lore.kernel.org/r/bbf0dcd9-d0f2-49a6-a2f2-6ec9376f2f59@linaro.org
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   .../bindings/media/qcom,sdm670-camss.yaml           | 13 -------------
>   1 file changed, 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> index 35c40fe22376..78b9e03da06b 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> @@ -116,15 +116,11 @@ properties:
>               unevaluatedProperties: false
>   
>               properties:
> -              clock-lanes:
> -                maxItems: 1
> -
>                 data-lanes:
>                   minItems: 1
>                   maxItems: 4
>   
>               required:
> -              - clock-lanes
>                 - data-lanes
>   
>         port@1:
> @@ -139,15 +135,11 @@ properties:
>               unevaluatedProperties: false
>   
>               properties:
> -              clock-lanes:
> -                maxItems: 1
> -
>                 data-lanes:
>                   minItems: 1
>                   maxItems: 4
>   
>               required:
> -              - clock-lanes
>                 - data-lanes
>   
>         port@2:
> @@ -162,15 +154,11 @@ properties:
>               unevaluatedProperties: false
>   
>               properties:
> -              clock-lanes:
> -                maxItems: 1
> -
>                 data-lanes:
>                   minItems: 1
>                   maxItems: 4
>   
>               required:
> -              - clock-lanes
>                 - data-lanes
>   
>   required:
> @@ -308,7 +296,6 @@ examples:
>                       reg = <0>;
>   
>                       csiphy_ep0: endpoint {
> -                        clock-lanes = <7>;
>                           data-lanes = <0 1 2 3>;
>                           remote-endpoint = <&front_sensor_ep>;
>                       };

I think the ask was to have clock-lanes in the board dts rather than 
dropping the clock-lanes from the yaml.

We want to keep clock-lanes in general as some SoCs support changing the 
lane assignment.

---
bod

