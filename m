Return-Path: <linux-media+bounces-65296-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bM+9J/VYNWp3tgYAu9opvQ
	(envelope-from <linux-media+bounces-65296-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 16:57:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5626A687C
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 16:57:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="q9N/eMvJ";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65296-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65296-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4E8D63016750
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 14:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5126399011;
	Fri, 19 Jun 2026 14:57:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10322DC32C
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 14:57:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781881070; cv=none; b=sQeM1rLY/1O+KArkwSnMYKkNBMxMa4tK585l5ljNRhq/z/vgo/mAp/2Rt50MWM4FpLFIGbyaHl602TpG3vBAwGDEN9hLIwqArVYqW6waDlZwD74uAvCdGuh/zyOreEDMe6CzpjLyxsXMsgxnHk0u8XlxyKatz8U919tDdeRE9YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781881070; c=relaxed/simple;
	bh=r+Vx8bE9bzuOFwGqKWOBdk/pvY5QcwTgaH/iYD/LprU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgTj3/3U6sZKXuP3w7y34zzUhT4F9jtOLKB5Swru2iEGAfq5Lai7ga2iIlOhr9yKcA9rsgQpgBYg8IAGb6hJGil3CMf+uvDAP7k2pa+inL8hrzVV01+row3pUFaACoZS7GaQIYV7jV+DYLv8XzgGwpIg9IUCAFc3voqn9Q38E7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q9N/eMvJ; arc=none smtp.client-ip=209.85.208.170
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3997264fc55so3220951fa.3
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 07:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781881067; x=1782485867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqar4JczNNOg75V9/pJCCBRYnOJd819Em91TzN50JyI=;
        b=q9N/eMvJq5hm3/IJqOlwRwwlWEAXsvlFvpfcry2qK+FEUoywHH+SbJ+5/PC/2ku2lO
         vC0d4EYHVqqnYqudzShfT45J+oJ14P6sYGsHaOvPQrhcRrg6EaHD9rcz0svEe/QG3Xvw
         bTFSQZN+8Yqe/nGCWbia6/H6Ie9nx5/Us5xtBwMLSQVd4CoZGmGYMPOhjiyxc1eIxOr9
         QaoH/sgWr/uGZ2vjWXmLCcLDmBrPAinv00gQGBWG74A4tPdk+3Xa3PPTPiPoIW8FF0gh
         W5PdMGXS4kbTpTthcDkRNOEhMTvuuWvkCKBW/7tE+5JMToJnbldD6eV+qmIsy2ub6dz3
         h/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781881067; x=1782485867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wqar4JczNNOg75V9/pJCCBRYnOJd819Em91TzN50JyI=;
        b=basP9ewqilbSWtxsbc9IvY4DmhiS8LZXSOUsvqjxYzinAPB5YSKeSrHS9/aXras8zS
         u128qRK8JpSkXktYtUP1oyo7ZfhdarcmOKhGv31gwaAU7dbQS6W4QdLOpX9hwMlNFdCg
         ijp/0Lyt2mgOsQ1fKK0aE+Szqc35z9eF5z1aD5Xm+A13WKzGDeHQG9VM5kzQUlaN3P5C
         mBiKVSOW2B4TrVNkw+sAxrS+FBwO8Aqga+LkhlwnH/2zi40EjOS+3+55XBWM/ojXXYJt
         rJ1qh7BE9O+ryjPUY96X0C23x7HIGd8Zj4Axe5snC+b9uiho1u7yCIl3K9L7Pr3wt9tU
         yu5w==
X-Forwarded-Encrypted: i=1; AFNElJ+ICX2BtB7XNL9mWs+yUO7Mex+ZXr6Vp8GNwam+QSyXpXpBOoaFtCFTy9gQsP+SVk8yNjWNVGG06f8w9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPFxe3K3MKY1k4gkK/2rtJL8/yrO2iu1x0A7bRvjNUNruaSnx1
	jHyYf/tZR7GB1zDEfFGtGbVRY9D/wYySbIPijY/3k+MtI06W3fZ60nep37BSNJhnyq4A2oNjQ3G
	44nCjU7c=
X-Gm-Gg: AfdE7cllb8NksARih+ip77kadre7XXB60NaBLS1Ml16y2QjK0cVeltCNFCzPIlScxmh
	zhvFD0kefjxHw0Mm5RfzPPACFy6Z/foC+jId3F1hEPjn7q0uplX5L6d6F21SVaJF6z7E7LDLMQB
	VaUmV+ooU/5/+ErB7oTtTJ+wOOJ4IlqXtj4UWDFljnT714H7UzlbUYoAkNqv+igYGPHC6drEumD
	5CRZ1aT+Hfcd1u80L3YqESplpZblDJ1X6mjJSVa+vx2VPbwucZtcwrnUzn9Q8tz7ZB2S/ZgHzDv
	D828DeT7N1FIYUWRg/hX0IRMOyXrM9AtPKYFdNe1V/G4uVf/dZ2N/qH2DhVUevnYrs/MuG1QdRF
	HcOJXciD0iJRKIGNNyIuZR5TsHfRrg+Aw9XfYz4PJMU8ZGZVhXQZ2/vjTsleQPXWMBQTsqqPk52
	8i7o/6PEc7X3iVojaLazp4/qOaxvg1Gha2kSUqq1V2iswH/ZLcy70XKGkfJI+iWmVHZjU=
X-Received: by 2002:a2e:a884:0:b0:396:8d4f:573d with SMTP id 38308e7fff4ca-3998a306993mr5773511fa.4.1781881066524;
        Fri, 19 Jun 2026 07:57:46 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3998bec969esm5732211fa.6.2026.06.19.07.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 07:57:45 -0700 (PDT)
Message-ID: <45a4b138-0fbd-4c55-bccd-83858d95df5d@linaro.org>
Date: Fri, 19 Jun 2026 17:57:44 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: sm8550: Add JPEG encoder node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <n0iPW9ltP_HyfKgagM8MIvaGg_NF7KvUV834b6MPuE3llz9v6B1jdn6wEvXMkIHS_zLRsjnb7pXY3dURUOSs9g==@protonmail.internalid>
 <20260612194417.1737009-3-atanas.filipov@oss.qualcomm.com>
 <8d230cca-2023-4a13-876f-d5db8eb200a1@kernel.org>
 <Y69RNi5x51R9xs6wvf1lRTwKww7gu_-s3WDlGvLpDuZ4YEhg4lrXnuwn4V2p9bSGUQRM5x-vVsDTNt29kOst3w==@protonmail.internalid>
 <3d4e0147-8e62-4872-b881-1452f5e09e85@oss.qualcomm.com>
 <f754c28c-2d0f-4e10-b542-37eca70b091e@kernel.org>
 <ehUvd-M9IX-H_rtmYz4jHzPTzKqm9thaBhx9C145BsCT6P_YaSRD1L2jC_B2EWH_2m4WZ_Zoms_7Yx106I6kMg==@protonmail.internalid>
 <9fab1877-976b-4495-86de-a8c853b9ba24@oss.qualcomm.com>
 <f862ff70-c42d-4be5-a7aa-3d0470106aef@kernel.org>
 <c0017e02-ff6d-42bc-b02b-d51eec65736a@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <c0017e02-ff6d-42bc-b02b-d51eec65736a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65296-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:bod@kernel.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A5626A687C

On 6/19/26 17:38, Konrad Dybcio wrote:
> On 6/14/26 3:13 AM, Bryan O'Donoghue wrote:
>> On 13/06/2026 12:16, Atanas Filipov wrote:
>>> Thank you for the detailed explanation. Let me share my understanding of
>>> the shared upper-level blocks. They are exactly the reason we have
>>> frameworks like ICC with aggregate bandwidth voting, reference counting
>>> in the clock framework, and so on — the same applies to power domains. I
>>> do not think using shared resources is a problem when the drivers are
>>> correctly designed.
>>>
>>> We have actually validated this: we got CAMSS working alongside the
>>> Qualcomm downstream camera stack after fixing the shared resource
>>> management — something everyone considered nearly impossible at the time.
>>>
>>> On the CAMNOC and CPAS concern: if that coordination becomes necessary,
>>> the right fix is to address the resource management in both drivers
>>> independently, using the aggregate capabilities of the existing
>>> frameworks — not to introduce a
>>> hierarchical dependency between them. Moving JPEG under CAMSS does not
>>> solve the CAMNOC, clock and power domain coordination problems, it just
>>> papers over them.
>>>
>>> IMO the problem you are pointing at is more general than just CAMNOC — I
>>> would add priorities, QoS and other shared resources to the list as
>>> well. The answer to all of them is the same: correct use of the existing
>>> frameworks, not driver
>>> merging.
>>>
>>> On the idea of putting JPEG inside CAMSS with an external API:
>>
>> I haven't remotely suggested that.
>>
>>> no engine or pipeline that produces YUV output, which is what the JPEG
>>> encoder needs as input. If JPEG moves into CAMSS without an external
>>> API, it becomes
>>> inaccessible to userspace. If it does expose one, we end up with a
>>> standalone interface anyway, just with an extra layer of indirection on top.
>>
>> This is a very long winded way of saying no without acknowledging the core point that the DT should scribe the hardware the way it really is, as opposed to following software architecture preference.
>>
>> It is the case JPEG lives inside of CAMSS. This is a fact of the hardware, the DT should express those facts not software preferences.
> 
> That's also precisely what the "Tree" part is about - CAMSS is essentially
> a bus (as evidenced by the existence of a set of resources, like the
> AHB/CPAS clocks, the TITAN_TOP GDSC and the interconnect paths that gate
> access to everything on it), just like MDSS essentially is a bus. The JPEG

I also agree that CAMSS should be thought as a bus, and therefore a child IP
shall both a) be described as a subnode, b) get shared resources on parent's
side like PDs and clocks avoiding unnecessary repeated description in its
own node.

I believe this general notice should be applicable to all CAMSS IPs, and I
repeat it here, because there was a disagreement about it somewhere else.

> encoder, just like all the other blocks are then devices on that bus,
> logically belonging to the CAMSS node
> 

-- 
Best wishes,
Vladimir

