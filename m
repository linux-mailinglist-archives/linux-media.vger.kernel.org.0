Return-Path: <linux-media+bounces-67269-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TiaDBBvOUGoj5QIAu9opvQ
	(envelope-from <linux-media+bounces-67269-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 12:48:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5280A739D53
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 12:48:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=lMANLxrB;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67269-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67269-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 024E2303D301
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 10:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7F440BCBD;
	Fri, 10 Jul 2026 10:44:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24C840BCB0
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 10:44:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783680298; cv=none; b=Ni8nDuxz5OF/9VI5IBuKC2lvWlI5AvsEEhYKcZ40Px4ff/nd1ZsA2CiX19+KBmlmi4xXXVrXfHHg43/ky//ON9/wsJY8VOuZP0vNv4euH/BS9IlddtDzN8tbYKEAkGsRsK3UGFQGVfVzFVsJYmP/1peaGzFyzdevr3Kh8pEFJFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783680298; c=relaxed/simple;
	bh=w+wGRAZeX7QLyoy91j3GSV4L9xJhSn7RrLgxxW7Bjzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SO7eUAEHKGgL3cwhbnclqyACk/8xckerx7s3nXp2NfTsnGTTgbG419X++X/r2vxe64qfyb0RC+n2oOoy1ICvPTNonNQSKtNj4YAUA3XuFI7TBnkFkQj4cAUKEdhECCfmhAvDxEWG2f2yfDKMjVrh+orIW4Sl+uH4sLLFiKauoS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lMANLxrB; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b27c7451so23126915e9.0
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 03:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783680295; x=1784285095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eoyDGwp3qtW9jL5dYVqhKVgocL99cZP1Cm9KAwZE1z4=;
        b=lMANLxrB4GC0Jh7Dw7JVWLNLf1xtASm3pCwtfiwdVtpvlqGoRESQa7ZNwpwDdms/zc
         Cp8oC9PKk4qFqotFDRbdbTprnvfnwxj1FnoStEbZUvi7WpGaZ57plyTF3QKS9PD7j8Fx
         yvTN+cv6mgD8cBYdnc3gjTQvN0qqRJcZ2qGksTe+8AzJ5BmtAsY0JFwzKu6W4BjSaYvQ
         B0J0FC2eJuVueJYNIHYtD6QiOa9sH74TAydrBxvz2Ifu2C0VZOnM9f/dxaWAqKYNdrvO
         4339P3JHIHpw01GcylKagcPWP6rieh+1ywt6sgykySeQSpz3gUQAjibSlfgQykUi8o0I
         EGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783680295; x=1784285095;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eoyDGwp3qtW9jL5dYVqhKVgocL99cZP1Cm9KAwZE1z4=;
        b=KKp9siRaIWui1hh7A100u7O5xFQxEoOYnc3ROYlGs5OYFmbjAnJgKPXY6YDglvlfBE
         pAj7Bs4dRLxwpB2q26n70sEboAd+vdI3uHgvSdxzJVoffualapFPbQgy1AolgnKHEtbK
         5+Y7w5P2AXO21RK6yea22lJUWn519+bN3H8R4CfhdNbHvpk+n1haxR6t/UjmrIhVP4c3
         pcvj+jpNNyCWAFRcEzuh3FoijggiKm2tmreT+TZ7AIUcLncxNlID18p2JIjrjFrdB6vx
         hPO0qIlzEZU7gHAz3Yh0tesfIgsVBPR9+0dULFEKYavx66abgXBV+pFu9uHEot7dVPYW
         JQwg==
X-Forwarded-Encrypted: i=1; AHgh+RoBWuBpMNIgYFKjb3Y+XUhz64UdQlZ29K8p1DFP+uVHNFVn643wtsuadE2ghTHM7suExcypiCJswtp98Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3CZtKybqg/mcjzVSC4eXm2eTmlU0bBKIjFvVfV64WkoZrpWVZ
	0osOWJHFmiES+uSnFsbqs0puRKM7tPE84GJsKDwAT16p96SuSOiwKdZYzp/0VWZhfWg=
X-Gm-Gg: AfdE7ckLaoaTM23ER6abcoZ39o2bkGWEwIA0F4eIgFx0gFBNHwKto+XkmxhPshMel2H
	TgYQGRfAIbH/dYMqv/weAKk+oK3aRZnxAM3CAsT1FNDXeAROTYxrPzQ3QmEzgUY4BjQCZea+dr4
	UBKG4mrhcghpDLn7YNw/3n3q0EaZGgChL5BL8sDzeVUJFwEKPQHLb2JYU/Icx/C3p4wDQc6xIdy
	SqBCxZ7chHVGfqKDmqn7dGN8GLG1jsUnCsHdPOqycuGNDKj6kYciAkw3yMzlGsDQ9BRp9jUt97b
	H+7e+rKbHffI6zccdG8wBmwF4Wiy5juBrNRimnE2s9VrDiZpOD4poq5Q90N4dqC7bhYmWMYwCE0
	5JKtP1usyeugpMd6Ax0E1NOmdWAT7fMrNraV3tOrFkkMg+TGOXZOw/PmS84kNBLnHagoZBtjDMV
	gaRh2nWtc5PN8k9+kMPlX4Urez
X-Received: by 2002:a05:600c:56d3:b0:493:e2c3:af25 with SMTP id 5b1f17b1804b1-493f2b37187mr16432975e9.12.1783680295345;
        Fri, 10 Jul 2026 03:44:55 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.243.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb73b161sm116251275e9.9.2026.07.10.03.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 03:44:54 -0700 (PDT)
Message-ID: <916f8a0b-4ef5-4c2e-833a-aa8d2ef13543@linaro.org>
Date: Fri, 10 Jul 2026 11:44:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
 <20260710-camss-isp-ope-v4-4-51207a0319d8@oss.qualcomm.com>
 <d5475ff0-1296-437a-89f4-1d3d6e9ac637@linaro.org>
 <CAFEp6-1j=kA=3=wxWOrn_A_=Ugj-kgxRgKzN=a=3UsAef9YiTA@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEp6-1j=kA=3=wxWOrn_A_=Ugj-kgxRgKzN=a=3UsAef9YiTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67269-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5280A739D53

On 10/07/2026 11:38, Loic Poulain wrote:
> On Fri, Jul 10, 2026 at 12:20 PM Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
>> On 10/07/2026 10:04, Loic Poulain wrote:
>>> +        reg = <0x5c42400 0x200>,
>>> +              <0x5c42600 0x200>,
>>> +              <0x5c42800 0x4400>,
>>> +              <0x5c46c00 0x190>,
>>> +              <0x5c46d90 0xa00>;
>>> +        reg-names = "top", "qos", "pipeline",
>>> +                    "bus_read", "bus_write";
>>> +
>> Does this register space cover the entire OPE i.e. where are the CDM
>> registers ?
>>
>> We should map those upfront even if they are not included in your first
>> drop, we map CDM regs in the IFE even when not used.
> My initial thought, especially when we first moved to the CAMSS
> subnode model, was that CDM would be represented as a separate node
> and referenced from OPE through a phandle. However, CDM may not be
> generic enough to justify that level of abstraction/complexity.
> Therefore, I'll reintroduce the CDM resources here instead.
> 
> Thanks,
> Loic

There's no harm in mapping the CDM regs here.

Worst case is we have a generic CDM driver and the regs appear here 
unused as well as in a CDM node right before OPE.

Not the end of the world.

---
bod

