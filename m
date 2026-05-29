Return-Path: <linux-media+bounces-63051-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELQ4OuOzGWoRyggAu9opvQ
	(envelope-from <linux-media+bounces-63051-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 17:42:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9728E604F0C
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 17:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E039632E8622
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 15:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E513F1AA2;
	Fri, 29 May 2026 15:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wr9MG4XV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C810B3F076E
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 15:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780067263; cv=none; b=A1oVAdGtXy0N05SXw0WFrx81Pm6alU71lDZ+uwuvnNZVU1XbmAyjf414C1TI55X/kgV44cxa7nlgycrT2h+rQedA2LJEsfYhpuBdanUaPXH3np2ojzbbIcFjkPZDouhuWZakAM8Wn2F4g4XSDv2Yf0AiT8KcPa7RXgq87P8TYnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780067263; c=relaxed/simple;
	bh=tF43KjufwHIu80KkfJ7VV26iopIlq2XuutVp9qCHPRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ECxyWwPOzcoioN3ftwUUyflrA1UAzITj7ucXONF3iI4iKG5IhJVKJ268UC7uEpYJ3fVfy7YqzmadMUe0C1yN6VQ7y8aUpkQd4RIuiSI0fXrc15muCE0QrkwxEZER7nPNuv6EFrsXqBZvGcYlnz1sWgt1jpN7PxSAGPQQUvQqOB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wr9MG4XV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so74405095e9.1
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 08:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780067260; x=1780672060; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMsYKu0rt98o4CUIj1PMUPtxut+9KNkzkjaeGCrAIPg=;
        b=Wr9MG4XVrb2AlEpJ2OuftCHDddxh00iA/NqJ0CsRzpHi/XPGFame3B5yHnl6IJeYPp
         HWCx0p1d6cp3GYZH5oUyta/eCJA/TaChfDViofKIwI4LrI1wlSCKzPA24Vd4d6c2lMKU
         ADxrfJXu8d4beDprcfkHcPEzkJr0LI92X/PbdIVnekcRK/u87aShycKNDOEgjoebYNt/
         P0G1yhuP5+OP1fLq3HNmvggckV+UNHmq1ASesLiaebrMeUuh79+gc1SHai1UaWngeqO+
         1JS3EgeCHzNnKrWy+VnqxUCdS9KtBnAetNWPMrYv9uVsblLvO3wRgwW2XXz/3avIFk1y
         vZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067260; x=1780672060;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMsYKu0rt98o4CUIj1PMUPtxut+9KNkzkjaeGCrAIPg=;
        b=ee0MX2w6jre5Ztkd42dB4jIWpvPXwdhFdY0YE3kanVZacWnMt9JcvJhUG3Z6NWd7s7
         yoj6Vu45NhjU5fpMvjcTmHZZQRsrkiDC4edg6YqJIDzUZp/OeOfXCI6c5wjN/cu25ctj
         Z9vZvdjCcfC/hHxJBHWQBcZsLn+bnb/uNruQaARf4Oo9B31aq0XOJeNEc2Ms5SNSXeEC
         rmq2eswOx+KUVnkv4xE8egc1HE0+N+5oqSKhpp8Iba91elguON35DyL9/xZ1PamZ7rUb
         tiqrsEQkVWxijX+wZodGj7sKjt0Xxv025pfJoZhyknslcc3QVu3pDIKlrHx8Hs6TvL/Z
         kl1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9MKBmvnPZMhKrXXisNkclBWcgF57dMFa6+qf0tFGHpDO2ZlWJ6W1K4pyM3P84ni5Gy2d1WkbB16XOdzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+/xw+K4w+c2ua2LFKKhew7qNwQcj+odQ+F5uXMBl/OWb64nL2
	8Ylt7pCSMkLTvppoPLg+k69GFl5KS1BSI3Ae9h3XQryx1YRrzZJ7DB9KFgoOXbZBzxU=
X-Gm-Gg: Acq92OHrmGYrWO24iBdhZAZomHSrtF7esn7+imOqnFMsko/E26XXuZOu5Nwr+WMG91V
	6rx5iwBEnI2TUtw6dPe3CSjMN4SOIJ9JGZWhZgZKFdmlS/X1zELXlt2VW1kvpsYigzsXFq/Ka07
	Mhtn83sne1R/mrwNAduEq7GzgzftNqEO2PvTZBGrrUztQsorgLcCtcvthmOE1YWYt6E0YFgyRQr
	146xhiFILHC/nipPrNCD1JvT+OE7R8p0fnIXxXEB8DfIn0sUavcPm4WV3o7KlIuUQzjNmUKMdJN
	OqM3/nK+b2AC9uK5qcUzRfYqYFyJPgUzJX7U8y/gAbxzZufmYPj744iIDhNB7TtV/A/Caw3ipyj
	1sOtf/NWP+NhiH2k73b4qnnK1aqmmV35t9Q1RbcAioKVVcgfQsXBOMWEvMHOxIbr+qkylSSVmqa
	pwv8tP+3kZJYD5coB1/hbzCM6wJSH1xuJnX8npO9on+hs=
X-Received: by 2002:a05:600c:a30f:b0:490:4b89:5372 with SMTP id 5b1f17b1804b1-4909c62603cmr38449265e9.11.1780067260267;
        Fri, 29 May 2026 08:07:40 -0700 (PDT)
Received: from [192.168.0.101] ([64.43.33.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a04e2sm3789037f8f.1.2026.05.29.08.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 08:07:39 -0700 (PDT)
Message-ID: <8618255e-ecbf-4f55-877d-09cb2faa6f50@linaro.org>
Date: Fri, 29 May 2026 16:07:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: media: Add bindings for
 qcom,glymur-camss
To: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-1-bee535396d22@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260529-glymur_camss-v1-1-bee535396d22@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-63051-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9728E604F0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 29/05/2026 15:37, Vikram Sharma wrote:
> +
> +  vdd-csiphy-0p8-supply:
> +    description:
> +      Phandle to 0.8V regulator supply to CSI PHYs.
> +
> +  vdd-csiphy-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSI PHYs pll block.
> +

To be brutally honest, I'd rather see effort and buy-in from qcom 
engineers in converting to CSIPHY as a distinct sub-node.

Pushing patches to hit your own internal deadlines to the detriment of 
upstream quality is not OK.

This binding should be predicated on separate CSIPHY nodes. I've 
published... three perhaps four versions of that patch to radio silence 
on your side.

---
bod

