Return-Path: <linux-media+bounces-66785-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g5nDFWvhS2rhbwEAu9opvQ
	(envelope-from <linux-media+bounces-66785-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 19:10:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6D5713B2A
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 19:10:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=kUX4AneU;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66785-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66785-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 319603333F4F
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 15:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D608037D12E;
	Mon,  6 Jul 2026 15:00:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1513378828
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 15:00:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350048; cv=none; b=XVZ+dh/0/sGEs1uJQr0IdAymFxf+o7abAuG9hCH+9c0qwX6u61zEy+qDwWclNILHnR80JuBtFfI9wW8GkTUMjUAB8uq4cgKH43w8yFedZ7JS7LLsowycbynkLe/W8WyXS3LKr0vBgQeY1Wqcy+eciT0FFcltxGJAlNLp7h4nor0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350048; c=relaxed/simple;
	bh=XedTG2IDkwdx5NfpwzrYaYqHqJ8175odIg3hePCzwGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OYxsIlmMZ+s86y9K3vorertfObPvwAjwwTG4VxIc2dv2+g20sf5tXevv1x2uHZclUe5a0dVu0B7hz75kB3E3CCNSFHfP2d8LAA9HVsdBig/to1mIXdJZsb7JDPYEZc0BfqtRxPm3LRcOYEBz0Q5ohUlEUTwaIeIDLoyxQg/4RfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kUX4AneU; arc=none smtp.client-ip=209.85.167.48
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeb40ebefbso811762e87.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 08:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350045; x=1783954845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=60w9TL2qL6gOoHgKKaAE5HXP/8r+pqMsqQsZhkVDhRk=;
        b=kUX4AneUZOS98SlKNe8Kpsu7J0P4MKP0Q0Iw769bdSgq2ngBiT7fDInHF++nMRFrCF
         xCr4VYwhNJargur315nLxfFg1HNBLXAgoUWhcoj4LixhwqtTq1k7rwiz+/7PVawWgs/Y
         /LF0CckXf+RmmybNADKgzAzNIojPPO3DzkOiu0fD/sHHAGAWCLytekIdtTg4H84Hi3uU
         ZdOOOwEn6U2inW54wJNr2pM5Yj/t2eFvnCD9ycuktvaRYf0D+sVkYpGnP4ty+YVMTslw
         Qq8LRmB9KOmUoVAY1qaXp/tb9b4U1yYJa9TRhQK4tYzRo96k4pMLnh6O9jDgUxkVPVCT
         a6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350045; x=1783954845;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60w9TL2qL6gOoHgKKaAE5HXP/8r+pqMsqQsZhkVDhRk=;
        b=QhWdxAKJuRm35OrCN8ZNjwj3wdd0Oex+FQM7HYk8qdrUu7Pmq46E5G3C9bMmwLLLnw
         cMHBHVnOVzpwSOd2ZJyekTgh5aKE/tlCuZEXyZNBOVr1sGbFq7KfIUvuKmgEf4QPCFPQ
         fNsc0Jk7QwRG2YD/uI+oTZNbgxVpsvitN9y8KaOtNMuC314MRaz3qt/4W9GctWOiM3Xp
         sy2G4mWb11rXbUJg4iDeXrkUfHtNyBYzrpcsk3D3GYWP45bJrJ7IM3IGHyp0Cp1bNq5f
         MzYFRBxf/RZQ+NIppV4Abf7FmlmkA76ELzuFVMA9N3jwNPy5dYGRD0cw2FWbYeDkYPIU
         /n8g==
X-Forwarded-Encrypted: i=1; AHgh+RqLwfAZHJS3a7d8LquMT1RxG1OOCibJjnhpXskBl0beEaAN9VVSNhDYiS6+/t3iMSDezsE3qrV8jcXPAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCIfsTOM2mZI7LXin8gFbHVzkONE87nlNbRdAtKjdb4kjgt58z
	TPlJJ4mO+nPlsHs5vLua/Vg9VIf9gZy74NiAHbvm/jJ0pQ9Xa7dgT71owhHhQlRSmyk=
X-Gm-Gg: AfdE7cn1gGH5rDTlUCHSs9NK2rBb4m17Q3lNQFvV8wLiNIwpWC72ZYZPkbGWf6Pi5wy
	BMF31+a2kEY7SeIIrCcv+mgw8OGGklo+DzP1FaFN2+uiAx5al2c2Ms8+s1DOZHA7v7Zhy3o4HZj
	23IUodyJNVffoQGzFaxRzXVPo8BUBzGDeh1XXbeHiL9eTP38tzi4G3s3IKpX0R0EoGZJ2wJMIWj
	c/AJKqS1fzSnkWT0E7B7HEp/7V/7cxGzdAR45YCUx8Cvj2cfDA5R7Hv0ft8ZRGbw5XWUweOoQu+
	zM40ECXnjY9PaU11naBH+5qDbc5m68NyktMFdG3rejLcr5P2dqp3T4OxyMKODD5gkYBxrILA47b
	Wbcr3mO6s0xWaWTCyuAhIlo9xVbE6OHpDuO+fawOKHurZADwTVZlY+YLPnzITxJhaYKNETx+SCS
	rd429kihhBBEMJKYSJyBoK2gY9pD+XgHT44D4ijHSFQHt5brkTkF3tD/bqqQYm554ul6s=
X-Received: by 2002:a05:6512:3d04:b0:5ae:b2df:c11a with SMTP id 2adb3069b0e04-5aed44f625emr1264574e87.0.1783350044591;
        Mon, 06 Jul 2026 08:00:44 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bfdf2sm2996177e87.58.2026.07.06.08.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 08:00:44 -0700 (PDT)
Message-ID: <0a1e26f6-29be-4328-9b04-48daa6a0177f@linaro.org>
Date: Mon, 6 Jul 2026 18:00:43 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
 <f3d148cc-496d-4301-af45-51d8921d7798@linaro.org>
 <3b0f7a36-05d7-417f-8efe-d6ba06488406@linaro.org>
 <6e8ccebb-4eb8-479f-a589-6981b543fc2b@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <6e8ccebb-4eb8-479f-a589-6981b543fc2b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66785-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B6D5713B2A

On 7/6/26 17:49, Bryan O'Donoghue wrote:
> On 06/07/2026 15:35, Vladimir Zapolskiy wrote:
>>> omitting power-domains for individual nodes is incorrect. Best practice
>>> and in fact the _only_ practice that can work is to list power-domains,
>>
>> Let's step back and discuss hardware description of CAMSS IPs, so far
>> there is no point to jump to the practice.
>>
>>> interconnects in the individual nodes themselves as - I've pointed out
>>> multiple times now - those blocks have to ramp clocks and scale voltages
>>> dependent on their particular use cases.
>>>
>>
>> Right, you've pointed it a few times, no surprise a straw man fallacy
>> argument resembles as is, because it does not address or debate the
>> initial point of concern [1], when the absolutely excessive complexity
>> is proposed to be implemented for "CAMSS power island" and its IPs.
>>
>> [1] https://lore.kernel.org/linux-media/e04cb9dc-76dd-4fa8-92f4-
>> be002bf7ee8b@linaro.org
> 
> You seem a little stuck on the term "CAMSS power island" the individual
> blocks within the CAMSS "island" are individually collapsible.

It's not me, who stuck, but dt bindings documentation describes CAMSS on
a number of Qualcomm platforms.

> That is why they _must_ have their own power-domains.
> 
> The CamNoc is shared between these components but not outside. Hence it
> is more like a bus than a parent/child relationship.
> 
> As to your argument about complexity. I think that's subjective.
> 

What is subjective between one instance and multiple identical instances
of hardware properties? The first is simple the latter is complex.

-- 
Best wishes,
Vladimir

