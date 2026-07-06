Return-Path: <linux-media+bounces-66778-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v1uGG+/GS2pcaAEAu9opvQ
	(envelope-from <linux-media+bounces-66778-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 17:17:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C58DD71275C
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 17:17:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=MA+Tf+UY;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66778-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66778-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8200434D7753
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 14:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D632409613;
	Mon,  6 Jul 2026 14:12:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA3E379C32
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 14:12:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347131; cv=none; b=aoeyLawzNjPsEivLTroGsHc1v2WwM1dpIc6knswNSPNY0XFH1OvMPspoOxYkkPArsAYf+zKyRXyYVRE2+Xd3MQCGETZk6yrAn3Aee9li1AxgQi7v028qbeTpCUnvSnIJuMPRB7mxijLKME90V9sZ38zMLM1yx2n4nZBoycwXwNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347131; c=relaxed/simple;
	bh=AUKedEW8L364I8JPQAlKye3yP1O85tY325vvcI429kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZB4st4vhqmpoUX+7xUvwGxD/hzz1P4WUWImcll39O4mJcVcKTVW5STMwPzbpODsLEgz/Yk+KD1l/B9Rly4kMeX/9LK8kFF5J9T1qta79aQfKQUFk/9ggYm2etReLYkROIEhNGGbzDIrEHan5sf8Nk4rChWCHvPCkADFCcmErnww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MA+Tf+UY; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so31050795e9.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 07:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783347126; x=1783951926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SRglC65mYb/1PKnmY3GPB+Y//IKYaoRtYD9DfcwlSuc=;
        b=MA+Tf+UYpjIp5PwnmckYY7d65jEoi6xAkwBfJEDSFfM7S0DeC1DSCJnqYtPfxFWpK7
         SaW37deSkncxbWk4Vjiy0TX3EVCkZaypDiNF3OV7Z0uC1JxtpzQv7VdkdqFXk+yKuKZg
         sWo2+opfDfCtNmEqmukrcKYZWj0zfHdMUlHftTiwPTZSP3tLVkRYxObUDCypYNMJC8b0
         NHP8iwxXSKdy4TgU8SZOPUrDEWwrhIZiwIDTcY0CePmwqtguer0l2lzA5DG/xVlKGc8e
         T0yvlpOczcurrmZJtiApFTLgS5X8aYFgthqxcoCOu3UrBEv4hTFR0evrRCoL649V7g9F
         BzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783347126; x=1783951926;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRglC65mYb/1PKnmY3GPB+Y//IKYaoRtYD9DfcwlSuc=;
        b=Mv2rHc9mVBiYTym70KR7sqX6nxP4iZUmlQxcm76jCorB7ta7Cqs59uHd5a/QnGoZvF
         Snrfa8cHfSYIAQKSbrNAo5HAu0O8icCFoeZxClJS/+0nNqK0ox0IWJUwUAmCTSJclbbc
         5tFOO8PG8ShzdYIghnbIvDjrPowtRdui+S4wYIWYApLgu3fb1QcIouSJyOMTnNtVVS0t
         WpudGId37qNuzb3NpDy2eqD41Jzu+XPBWs4cTJkK4fM10GBfbk0Sdqigws/P71nFgIkp
         AXVZxPGw15hJ6U9uSM0QNmpui5FDeKmebCTkwlZQwyWyVdqsR6jAs4oX2NIZET/uVUze
         PPtQ==
X-Forwarded-Encrypted: i=1; AHgh+RqY7mEGA5NPxnW1B+mH8eg+KquWqtzCFaPy9nysCnQIAoxmyaIUt/5euLVzMKngsKNVg2vmbf61T3espA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKgU449UgeGeu49frhR9rSLPMh+v9t8/FmUWqGQpieWBAzhb90
	yOJjGyZJH8nNrhr7LOhPAK9VUips6fRnhiS5fO4kYJAGSs6hBvTs+nBCAdcQMIHZ9OI=
X-Gm-Gg: AfdE7clu3lxxmRWEZvaz68G93iMv5QjQv2dwE/tqaUXjSnhicBKP9NXkuf0PCD6DL3M
	BZoM6EjDPWUrSo1OBY9a4OX43yFHK3H4VyfSzBvkvN7UWl7llMniUTnkfuAuD1tmcXIQeN0tVYf
	2VUNimOjbpwFO/kTSeRdwTSh/xkT03wXjnGXJhY9bgRq80Wwb96wQTx+Z3KtdO6pBWkomGgadaA
	xmetsgAmsfxCZSkbBdkn+dD6bOz4Ff1YciuC9j0/xWWm/FnYujPeo389yz/yKtZ/gVqL75iGknc
	ROj4l7H8ObGZipPPNNlHZhXtZa/SuZnEb7Y8oTCmwCB75PjDqUDJ03gaeG0Gax9bpcxcBSeZgn4
	9123bE9M3dtSTUoSD95ijY21qlGTIOrC9ex3kDVs1PxFd2XCW5kWYsAvdgQ8sOZy/eFQ3+xVSGL
	i26euJ2Aqtc9ScVxZG+vVmRkTCAA==
X-Received: by 2002:a05:600c:4747:b0:493:be3e:cc3 with SMTP id 5b1f17b1804b1-493df093146mr8495275e9.21.1783347125751;
        Mon, 06 Jul 2026 07:12:05 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d83bdsm25651263f8f.13.2026.07.06.07.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 07:12:05 -0700 (PDT)
Message-ID: <f3d148cc-496d-4301-af45-51d8921d7798@linaro.org>
Date: Mon, 6 Jul 2026 15:12:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <48c3ce6b-1e2a-457c-93b2-8fbc0912dc20@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <48c3ce6b-1e2a-457c-93b2-8fbc0912dc20@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66778-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:dkim,linaro.org:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C58DD71275C

On 06/07/2026 14:57, Vladimir Zapolskiy wrote:
>> This debate is going nowhere. Check the downstream you don't need the
>> docs titan_top_gdsc is provided by CAMCC.
>>
> 
> There is no debate, since my arguments are not debated so far... Why?

An odd claim, since this is the fourth ? level of email reply.

> And at the same time you didn't provide any support to have N identical
> spread hardware property descriptions instead of the single one.
> 
> What is a good enough reason to prefer complexity over simplicity?

I'm not sure I parse your here. The core fact is there is no "thing" in 
the CAMSS block that can be modelled as a provider to JPEG in lieu of 
TITAN_TOP_GDSC.

That GDSC is provided by CAMCC not by any other silicon block. So 
omitting power-domains for individual nodes is incorrect. Best practice 
and in fact the _only_ practice that can work is to list power-domains, 
interconnects in the individual nodes themselves as - I've pointed out 
multiple times now - those blocks have to ramp clocks and scale voltages 
dependent on their particular use cases.

---
bod

