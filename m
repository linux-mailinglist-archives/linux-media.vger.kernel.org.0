Return-Path: <linux-media+bounces-58047-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGeEJPBU0GkA6gYAu9opvQ
	(envelope-from <linux-media+bounces-58047-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 02:01:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 103B3399296
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 02:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 587203069D6C
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2026 00:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B5BE26A1CF;
	Sat,  4 Apr 2026 00:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Te5Y/3jh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225E6246768
	for <linux-media@vger.kernel.org>; Sat,  4 Apr 2026 00:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775260841; cv=none; b=pU/wW8NnPJUN8lgCrpMXvKrYlcifY0vZLUPZUTR4goQnUrRP8apCNZPjJ50In2Ut0ng+SoOJgWFAZVwhsg9PxMMT1Smq/rQDPdr2wHgrx0ECySvaPfi+0rBjmXQknoYGCq5uIPlv1ITTj9N+gJP5p0MulhmOHZukW2LwvXJAWMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775260841; c=relaxed/simple;
	bh=xHxijxgek5mfHjwCdabAUrjt9AfnXDUiySgG8SMzkqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V4F31V0zXuwpiiPwanNnTUqNnD5j2zi0hmzwti3u7s5GS5ho+mdd5BVbSTrBYSb7Fwja4i9ihzYe7N9rTuiPkiExBIjRehKNVxzSajcOI87jOSz8py2vMbjzdMWFvBr7i64ctaP9BDKy3raEydL2/zJAj7gW9IcVfgPR289ztg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Te5Y/3jh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4888375f735so20200875e9.3
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2026 17:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775260838; x=1775865638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vPREYlvR5Y5BvzTLzoCRE5R4pDf7TpilW49wGVrQaeo=;
        b=Te5Y/3jhDo69BxMw+yPGk0FeEtGBgd62OTrm+a2xU01PA2AFU6jRfAD1bnDD3FjfVl
         NI6vPnjccKxEDRb3kYJe/0MS94ABDwxV7eptqE69b6MfH7lx61aY7HfqmT717CTMvuOf
         83gJ7rMbBakbasGFbzGJ0FTEHH2WytY2pYrLYz/laQbpu0lRUzeX0y1KXh7DaLq1nYLK
         BNOCVljMyQ13sh2Nq1BUFZh08nfN2FTz5tpGs9iBRC78WgGk1njGFUjGsqNsNsIZ4u9S
         2Sjxs4AW1oFaWoGANzKYu67y18qvi2Tkd6DANYQ6K/mq4vpKIWw/ORtaMB7rxfmMaWez
         CV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775260838; x=1775865638;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vPREYlvR5Y5BvzTLzoCRE5R4pDf7TpilW49wGVrQaeo=;
        b=f9L9ZDuK6q0AQtFV0MCkvRCU5hZDgh5WEKSSavBZSKNN786OzD8Swmo3kXFuNHBjUK
         539nYs+2BEA5QZHcJp9Q2VPkQj+g31q3yrHl6exyfd1lbuzF+xUJYtTDRIHPLf9w5u/6
         8fl5y8/9jCU6uL/x+HjE8CyocIKZU34O8vFXJztQO9/l0hIeJBGv6He8yxS1ld64f3pQ
         yxTvbHjQdDqmvvgNxarXNVMDf6tlBah8GOfJInk+BofHrty+R3b1kxC2grnEFHsTghRd
         8N7NXCdmcqmH/F3YHYiLcOWQzj2f8KaONRM+mWWl7qFAcAzXSSGSw/h7xDgyL2679Oly
         KNvA==
X-Forwarded-Encrypted: i=1; AJvYcCXHnMWY9ZYztydsiwk0X927KD5jOfQ6/9HcOLdXvt5rudCsjyByIcSkar/bePH96JO8cbn+bi0LW0sE/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJPMg0sc2njqwt2DCVD2CHYrxQsMZlGcoKqdwJdGbkbISGtK1J
	VEFyY/Hkl3YIG5Ou8wWFmbfFYYxngypBIDlgcWt8nFhLME782vpkBAhBUYDzZycnVn0=
X-Gm-Gg: ATEYQzxNkYC9YhOwEmuwJwjQ6H4q6+/y6lICjsNJl6xXIpRF0ul/Gkz3nxJLZGkAeH7
	E/hW2beEYxdITXgR7/4qi0gRHs1ULqbGR1uQOzrEXOOGHOZiCas09jJDS5KfXi7lnXFpJYLGNWg
	e9nUwS6e2Toi22OPLa8QhuGSaqWfz/+8qEKFgUflY7jnvswKFdi1TmAZ6kyD5Y5FYRF1n0RRqjn
	xYAOSHxvkndI03BipIV8ueDlSCdaKJJ4kEf2/yvgC+YmBCkGyDpLHagA9dSvYJccPRjfMp7XRmB
	+x5b6YHBMM/r5DdFEzD7bc7v6zft4/ScTIidYRY6oJfj78qy9OW4d+BlnyJXZ/bg4KA2ylLjgjD
	ZmVzrlGo9ibcPf4V6QPa7CDy5azjmFMwOW0CuCALUvVXeqlKLpJFp9r+7eh4Dl5taUR5sVRZAaC
	XRPzDzIX1GyQSwO0qWeju52Byl+SQr39DD/1/yDOAQOlCLdXo=
X-Received: by 2002:a05:600c:a318:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-488997dd54fmr46727505e9.24.1775260837924;
        Fri, 03 Apr 2026 17:00:37 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.207.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e967badsm395691065e9.14.2026.04.03.17.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 17:00:37 -0700 (PDT)
Message-ID: <47061b6c-8589-492b-888e-3550c878e072@linaro.org>
Date: Sat, 4 Apr 2026 01:00:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: media: iris: enable SM8350 and SC8280XP support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Steev Klimaszewski <threeway@gmail.com>
Cc: vikash.garodia@oss.qualcomm.com, abhinav.kumar@linux.dev,
 andersson@kernel.org, bod@kernel.org, conor+dt@kernel.org, david@ixit.cz,
 devicetree@vger.kernel.org, dikshita.agarwal@oss.qualcomm.com,
 johan+linaro@kernel.org, konrad.dybcio@oss.qualcomm.com,
 konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 mchehab@kernel.org, robh@kernel.org, stanimir.varbanov@linaro.org
References: <a1dcd0e3-db1c-4752-9473-7934e69198a3@oss.qualcomm.com>
 <20260403214140.7307-1-threeway@gmail.com>
 <uiv4w3eptbniohzanp753f3wtwt4efjxupdro7kom2kgycco7f@nks5b4ctxty7>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <uiv4w3eptbniohzanp753f3wtwt4efjxupdro7kom2kgycco7f@nks5b4ctxty7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-58047-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 103B3399296
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 03/04/2026 22:59, Dmitry Baryshkov wrote:
> On Fri, Apr 03, 2026 at 04:41:39PM -0500, Steev Klimaszewski wrote:
>> Hi Vikash,
>>
>>>> This is not just with totem, showtime shows the same issue.  If I let the video
>>>> play, it plays just fine, however, if I attempt to skip forward, back, or even
>>>> play*after* the video has played, then I see the smmu fault
>>>>
>>>>    arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xd51e3e00, fsynr=0x600002, cbfrsynra=0x2a00, cb=6
>>> please log the info about which "iova=0xd51e3e00" buffer is faulting in
>>> this case
>> I will include the diff that I applied against my kernel, in case this isn't the
>> correct information, but I get the following output in EL2:
> 
> But these logs don't capture, which buffers are causing the IOMMU error.

I'd be interested to see if we can run this test on venus - instead of iris.

Konrad's patches are still floating around somewhere.

---
bod

