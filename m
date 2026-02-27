Return-Path: <linux-media+bounces-53671-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNYSNcBboWmDsQQAu9opvQ
	(envelope-from <linux-media+bounces-53671-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 09:54:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 406B21B4C06
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 09:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DF13317933A
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 08:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0A23B531A;
	Fri, 27 Feb 2026 08:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rjzexa22"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554E0389DE8
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 08:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182223; cv=none; b=G6WVHu/jmiOi9E5nX1v/5DABZ4IR7+194ZfPP5qZEwQ8ez6VDK8wi9QfyYR2vP5E97VKTe6OvufvuxR2DGyFxZ2v79CsAXKI9bTemN68qJut66aK7goX+y00aalBFHePP6UjpF6HGpkB21Le3w1JO1Civ3WWtyHzWQwdmK0qNf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182223; c=relaxed/simple;
	bh=m75GTlzzItsnmceJyWSlLMXL2IXTZE/pklfGMLQT/9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KH96uFrw/cBc2/FPvJhPf+dsFrTGRYgD4uohwHxzQ6Q3tpoSWHG5W8fqE6XTHFKzg31FWLpVSEg5tDc1sksuaCQPwgPG2AxkMn0YB3/6ZKKyxRh9itu2vsJI8f0VIq8HTn2sUj1Cob1e+jLwZ/PEMrokl4Lm9CPB2FfRvk9RHxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rjzexa22; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-483a233819aso17536015e9.3
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 00:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772182219; x=1772787019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1fAwVs7Otjkhg3KIx6sVOnt9Pa3bh3y7PAXDFn0IhyQ=;
        b=Rjzexa22BpoYN8hYaFyOJDuDUijiHbQ8Jv8TZy97nK0cAhh3RClJ0hwSfjwxkLmvYG
         7610A8Jv4jukimD7iE6YZoUiFt92Le2UX9pKtCXmMDEC5LwhH4xjtQh1V7aXVwQY1urR
         usA8MWsB4ToGrDfHjV+nBTSGOAjYVjbFvtwL4CrViCWAvNhXJVDbN8hrjlyyDKnjUB4E
         NULkSaRRUEaK4pWPGaHuEcaWQW3HftrdDTxYMw/bJEu9bZaMp92zvuANk7l03MwXAKVc
         3ILJLY4YaieHo7GrOmowjxjFC1tyrwNgo/w+4gXvSasnzRhgDsXDvP8+Or7u9YnAQmm0
         egjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772182219; x=1772787019;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fAwVs7Otjkhg3KIx6sVOnt9Pa3bh3y7PAXDFn0IhyQ=;
        b=T1Hlh+2/wEkngiRSGQiVCq7XnBkXTvr+jwFAQUh3Qk82S9ewlN1zGUK7rkO1n8vKks
         wgJAlE5MjanA6efzOT4bGJPq+bJKbFA7056O6EsDYqAnVeGWWbMxaVwy57HM43EMrJxC
         Tf5UBfmEclytxs6Du9SMFqyldIz6fBmYuLpl3T6vhb0I5BQxEJ3KHKiuXQ3MFEWf6jGt
         7PDLuRkPIXfJQmunrJuRUzOuJSleJzsZTbdmulQQhe/z7mYOvqBtZr+DjjKC/3JSJkUs
         MjJHe/T4TXWWMPfHFV0/HuxtLAT5w8GIrlsu6VHRLaoZp8cur+3O8lRjnpNmofMjl5Dz
         /0uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQOPpnH7ORb8z++RpU9bhEZ7yBV+Ja430j57eJE41IMPXYKMwzLSO0xSqrebnIFR63ylLW5HgqVkmFBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDeIqvBbl+zLDwPLDd/9tt0+zcDb9ZkjweT/mcrdMp1W4m+DV2
	9MR6t2pPMp+FAoPWxC0XONc1lF3MgHhSqeRLai7EtME8RnGNZ7THcywSmxspnx5ERNA=
X-Gm-Gg: ATEYQzxAluto34wAe/m4zvY339W17inKtIbdPKRnDPnDUZkc4Qs/rMoxSkAQCZ9/Uc/
	ZV1qEuDH6ysmG6bTC5y6PgecDt8FpZd1BVcaapQQxl/KtB6MNqOAM9xDxc8E8WeTr0oC9IKwGSQ
	sLiMKiz1bY/FKUo0ONbOzakQ/RRwtNJnwcDTSwXNpX2zA3D/ovBa1SPYeHIV69C2Yiya1zxc6Ln
	lbXeZ+gVsCiExC4xl5VfneD8bJlbcZB3J8dfmWsYjndFGAvUvGVBvWwZSw/ex/J+zuUx9pHWteU
	H3QlMnpDHD8KPZt1XRIsBd+J0OC6GrnVfGO2LSu27BqsNgf96eT5vkR5RRFncLkM8fIBcTFNpb3
	4pWW+yA83U4sZNdh0/omYOd9tp+eguwbHpPxz/nVG3uUnblyZY7y91vCO1ZaWoAkkks7kvlBTTX
	VWcKqOZ1VwCJiWrcVeHext1zYDaBAD/aAeAg/h1gk9LIuit2rW6gKlk2+BTHfA66vk
X-Received: by 2002:a05:600c:8b26:b0:483:9139:4c1d with SMTP id 5b1f17b1804b1-483c9bc1e0fmr28491395e9.14.1772182218741;
        Fri, 27 Feb 2026 00:50:18 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf5fbsm54151445e9.18.2026.02.27.00.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 00:50:18 -0800 (PST)
Message-ID: <e844eda1-2de1-4bf0-8531-088cbd59b06d@linaro.org>
Date: Fri, 27 Feb 2026 08:50:16 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/7] dt-bindings: media: qcom,x1e80100-camss: Add
 iommus minItems: 5
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
 <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-3-a59c3f037d0b@linaro.org>
 <20260227-electric-singing-tanuki-fd290f@quoll>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260227-electric-singing-tanuki-fd290f@quoll>
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
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-53671-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 406B21B4C06
X-Rspamd-Action: no action

On 27/02/2026 07:27, Krzysztof Kozlowski wrote:
> On Thu, Feb 26, 2026 at 02:28:44PM +0000, Bryan O'Donoghue wrote:
>> Specify a minimum number of iommus entries. Currently the schema
> 
> Why? Your commit msg must explain that.
> 
>> requires exactly eight. Add minItems to allow fewer entries while
>> retaining the existing maximum.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> index 8dbaab16b11d4..f406cf6f8f9c1 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> @@ -104,6 +104,7 @@ properties:
>>         - const: sf_icp_mnoc
>>   
>>     iommus:
>> +    minItems: 5
>>       maxItems: 8
> 
> Same review given to two other such tries from Qualcomm - you need to
> list the items. You know differentiate them, so the items in the list
> have strict order and meaning.

Ah I knew there was something I couldn't quite remember - an 
differentiated list.

Yes np.

---
bod

