Return-Path: <linux-media+bounces-41946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E23B48367
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 06:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E24B0189A1D4
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 04:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7805021FF39;
	Mon,  8 Sep 2025 04:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B3KEIGdp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221341D7995
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 04:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757307103; cv=none; b=HJpl5UXKFaH4yEH+MTHRDuGfqVBhev1RCzmIsoGpib3Bqau5ejqUPqZxGSnCuoD0akiPa+joYTU1bZGs68l2BHpUiSVHvwVLe9a1nl1gdFpPvmQlkJpGSqeQR9ZffOWbTTe9P8y4WYi2lHb7KF5FT9LG4jNr3di7LWvd1tLd6K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757307103; c=relaxed/simple;
	bh=PiTMXDeB+RZXXFHBE8pp2cblxqqUufgT3jQ3N1Z0SZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eCGXKCxGauKe/G/8U0YkPAkTJ+VftnIQju+NMz/nsW4EJeDbP+EAunPI8B9GxV5CQsOaR58jWTA2GG+BShWmm1wWhQntF+6nev9a0Le7HoaCkMuY60Wt+EffJL3GX7ET9I0mDUVZLCjC8ZF6KurlwAem2jBD+Zpj226OYioV5DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B3KEIGdp; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so22446355e9.0
        for <linux-media@vger.kernel.org>; Sun, 07 Sep 2025 21:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757307100; x=1757911900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QH42QsL0Brv8nCGOlCqNoHb4KURJ5994q00eblEx34A=;
        b=B3KEIGdpLfpaf+LLLjOGaI5Lub25lSQiE1twEu89X9FYq784/ODGT1kQwrpB+2p1yo
         GxcqovRrHBHmgYJ/byhfOqDwqe+1aDpBAxeasc8ZScp4I10GHJpE/2eKSHXTHwjbowzM
         XBSeHmd/y4KRt/bu+bLn/L5t4CK/i9XtnAoOns1EPkHHOTo0BXmU7R3tE/+PmM+fknCF
         yWcfauWP5LPDLLQh27cLLDEFXkU0c7559ZvduXPVQxsjrSnIVlFNF/u6fjUae5DUNnCE
         AsS6h7srseG+ElmdCfZL0ZHzD9OGHegAFQ2BA3hcGPa0Y+mws5/V0l70R0OKqMXvLWoM
         Hx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757307100; x=1757911900;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QH42QsL0Brv8nCGOlCqNoHb4KURJ5994q00eblEx34A=;
        b=GI+IU0MswZQTCKwpWMWef9h1jHqlJ5vtC5Pu2yNxSDyszGSPEA1F8pObQEQUUFpcSP
         CgA6PeCyvwH0jKDanEOFQhW6CkdLmFCUw1WXJBLwMEYUQD780XsruUqjpEZqAYzALDUp
         t8Z41qQhZAd5FWJUFo6BDPGfkNeHc4FwuXbowGy6+Fz5ppIFUlZ/u2AyBguoDKQRx0bi
         5V3elC+/Z5wpzjDjNZQe9NTplcitETJ4rFhGOxBy1PJGVjMiL9whIREcwiP4rZf9rFLw
         NaahberALh7L4lWRVAk9ab4CoX/nuTEAFO99EyND/hJDcTgeGtJg2AhIdYpvfVq7Ks7e
         pLAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBoPFt+WtW6Bo1ZtbfkzBp4F+AFIlke1HX1CNkbKer5y26Ovd49sj74QbS1YGUlOddI0le/VAn2YzxuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSHVIaipE2hzhvDpCovVo+PsLjqjk6RbcNbNFGiuM30mw9/whS
	IRyO7I6l0+gWQMCdcKr7UuKmGDxW47N4Bt4h0K5k1k9mWGPkwrGT0Lb1UGtJkltIJ2s=
X-Gm-Gg: ASbGncvkLF8mf9+Ctv7d3dcN+ou1TQFB3XW7W8+iLlREoXVbu39VKPeheEOE+bUKC+q
	1EWSoMdsy9SLX25XuAhmO4J529shsz/xRPJl4R6PafB3eN8bAsld/WvtRej2i7H4PBp500h6Mto
	/pBTAWl29gzEIXk5MiT9SPe7FHBYWE661Q2UTQ+p10gNfH0LjYVPVazI3nb3mxHipsZXxJPptn2
	d03sAUPflhYUoXMOmB4KLh3oTmA5ODEFPMvhvXIncFYioC3dB+s9MWbuDPHlSJnmyuM/EatUDPQ
	ps98DdCWdON4SID4/8jWq2F4gVxCq9jnk4mqww72fxHU6BkcMEO8mHp2jnM+LS8PS8eYh2Pr1tX
	slXkUd3pzhZMo6OsZkm6unu2rpcv4WSILlEerOMsiCxUhIb8AlRQUgpfIsWc8uE0MiT2/XSi960
	syxuEqDrHKuFz5QW49yXg=
X-Google-Smtp-Source: AGHT+IHJUG3UxrigQCdKhJJdmiAwf+H3VfZ4m5MK0YKe4/GVGBasirbK5SoRbuR1aXJTIQEIhs4uiA==
X-Received: by 2002:a05:600c:c0c5:b0:45d:e531:99df with SMTP id 5b1f17b1804b1-45de64869d9mr12553795e9.3.1757307100364;
        Sun, 07 Sep 2025 21:51:40 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9a6ecfafsm271826825e9.21.2025.09.07.21.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Sep 2025 21:51:39 -0700 (PDT)
Message-ID: <e0e1827f-aa8b-4337-b26c-dc2ac43e0e2a@linaro.org>
Date: Mon, 8 Sep 2025 05:51:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add CAMSS support for MSM8939
To: git@apitzsch.eu, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vincent Knecht <vincent.knecht@mailoo.org>
References: <20250908-camss-8x39-vbif-v1-0-f198c9fd0d4d@apitzsch.eu>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250908-camss-8x39-vbif-v1-0-f198c9fd0d4d@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/09/2025 23:04, André Apitzsch via B4 Relay wrote:
> (This series resumes [1].)

Thank you for following up on this.

Could you give a brief synopsis what changed between this series and the 
previous series ?

> [1] https://lore.kernel.org/all/20250613-camss-8x39-vbif-v5-0-a002301a7730@mailoo.org/
Good series submission style would have something in the coverletter like.

"Here is my awesome series of patches which do X

v2:
- Fixed everything wise and benevolent kernel community asked for

v1:
- Enabled cool stuff
"

I recall we were pretty close to picking these patches up previously so 
thank you for re-upping your effort.

A brief bit of guidance on what if anything changed from your last 
submission is appreciated and good practice so that we can review and 
apply quicker.

---
bod

