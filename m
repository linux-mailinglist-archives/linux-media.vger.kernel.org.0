Return-Path: <linux-media+bounces-66323-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VvUTAEgtRmqPLAsAu9opvQ
	(envelope-from <linux-media+bounces-66323-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 11:20:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 926236F529D
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 11:20:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=nheqRINr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66323-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66323-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 78B1D3034F05
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 08:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4ED47CC64;
	Thu,  2 Jul 2026 08:46:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F9C44D6B2
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 08:46:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981970; cv=none; b=g4u9LvGfcDsoDvsugg0mTbxWUKGVdxQ7ag+y6+E1YeciB6/vxWx63FOtUNP5sagLi8RoMPyD4gn0RHEIwUcRVS+VAJW1eICQWTunq6k6tnPUWgkEac91bVezMreCO4vBO8ggKLfYQrOPCmyALuElzYWanR/ivACEykfRwwJ87FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981970; c=relaxed/simple;
	bh=MS5mWFwy5vf0hf4HoyQCtkkdTuvb0vq8o19bZAWxSgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s7wiuN70mOx8EQTJZbQAaqso4Oe9F92/mXWtKGK6URiSJ3jsi1FYE8GUMS/zIrOdHqPAD9BaCpV5D9aJeNWbYQvj8EI88wcMvPuXQRG5tC6hlNl8LZPQ22s3KgS/hw2Xg5ucCcNkpS3WV8Ap+389zLcqOv/WDWf/Dn5faWd/r0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nheqRINr; arc=none smtp.client-ip=209.85.218.45
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c0868ca8738so228875166b.0
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 01:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782981966; x=1783586766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XTERvRmf6CZrO5bc1Pl8xU9eJ7e9Wlwnz0/kVW1zl8I=;
        b=nheqRINrw8OuAzndytOu+U0QWFfYPNF1JD9cSK+I+G7nlr4N9TjerS2hZFQUpTNCkn
         FNLWVeCDnsGuEetWuhqiZLF83EhZL6V0gEBfT29X9sZ+8jj5ysod+s49WmgzOLq6un9n
         AlY4Hc/NJbqX53jNeop1y3rwiVUJ4pjVOR7CeDrP5/a+5GICf//1RhbzLcuWwZ46n4PO
         JcZcZvjnQRbiV3FlxLw7CgLvDKUjZjYxmrhCWSaSDSGjg73CDYrvrdumLtj8fh47uNdO
         Fd1s9E87rZWnmOz8MhcKvZsljcVOZ3X7eo/R8S9u4kkCGvdbxR3th46Yibx0rx5oUjRr
         acow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981966; x=1783586766;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTERvRmf6CZrO5bc1Pl8xU9eJ7e9Wlwnz0/kVW1zl8I=;
        b=AnbSrgrrU8b0c27XPcTvrA1q30d/iBOx00iKwrcoVHctSZkkqUWs+jN9a/ivuYZd84
         mwxaO5m5FoObn4ttuCZaqthaIGlH5lCL9jCV48OQG3cLn/SD9vzS4zNE5hUf+QZtGrdf
         0IvH42NEDstfmVuRSqc/PpsVtmVJJUlR7buUTR/+xmpvx0SupdJUHBtaT/Kvpy9+z+7P
         Qsfo0DjEWgYYFL+Jcm90URUMCA4/RSfHNp/ZkupSX4k/zL4f4+bWx+kQyfEkZUoMZyFh
         e6/Yqog5ECo7lA2Gwovkmlmhaph3kGx5fhQV2rI7G1SmHuLtmC9w6pIIeWtps9o6IkYL
         5Kww==
X-Forwarded-Encrypted: i=1; AHgh+RoU2DO87qsGDUR5xmKzLj3/9/xBL36/2X5yUeTJjfsqumX4111LeCzTrfmlOf5Iy6R3VDcMzZP0TLKs6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2gJNfI/PX10DkB6eA2ha9yXK6/xJUFun7it6m8+fA6Ri/vIqU
	RdxPWtvZU+3El7iQZ/XaIHUjs5lli7bj58X4U5MmYEX04tggzJDuvUfI2m+MXxgJ6u0=
X-Gm-Gg: AfdE7clsMwwe005uqCqjcGreDG6F55jAU0c5368Tf2jtdUg8fuP4t4Kgk3jOzo3rkbH
	4llwzklwjKz7SyJI5fdHLFxxLJntRy8tuLkIUd9NL8bdb7JQFza4H2VB+gWzFQ/xKA7GSEYD7cl
	clUI0rdKgmbMBHEdYeqIxxdkrlSCiYJHzCy5j7PVhg5T2Ii8XsxpHgOBY2EKkbBUujiMIQe8WaV
	pb6iIMv4vpIktRrOdJhTnnGBVsPH4m+VFcd4S3r4jSSdq6m0j9mfTsr9eLHbGuC1N0fVJQha9wb
	x5QVBqwNkhrek+74uAI5n7+5cTQisJAB0TeXm3qsZiGce1lq39NqzgqXAiDG0egHMWdV5CMwKyF
	KjbaDSQSSJ4ZrWFpwMp7zyMTKemVj7/KXJyFIjH/epCIjSDSYnk7XPSjIJGEm+BDnb2oJVBFfxd
	GLK0FSY4MVXA1oxanN2oLUUbI=
X-Received: by 2002:a17:906:6a07:b0:c12:706f:c8ee with SMTP id a640c23a62f3a-c12a9d385e9mr217162766b.11.1782981966186;
        Thu, 02 Jul 2026 01:46:06 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.47.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f6e3dsm89006666b.62.2026.07.02.01.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 01:46:05 -0700 (PDT)
Message-ID: <3e2e6184-e020-49cc-9a4b-609c05aed846@linaro.org>
Date: Thu, 2 Jul 2026 09:46:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <7c564df8-5c5a-4b43-806e-5e017e5c51db@kernel.org>
 <ae3a381b-5697-43ee-bdfd-aaf2d22ceedf@linaro.org>
 <6b6492a4-7610-4dce-a81c-8dc0387a4061@linaro.org>
 <1c583e24-09db-4d90-8f32-d3d3961188a0@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <1c583e24-09db-4d90-8f32-d3d3961188a0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66323-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 926236F529D

On 02/07/2026 09:31, Vladimir Zapolskiy wrote:
>>>> phy-cells = 1 with CPHY/DPHY specified in the consumer, as was Rob's
>>>> suggestion will specify the mode.
>>>
>>> This cell is just not needed, and unneeded complexity should not be 
>>> added.
>>
>> I'm going to stick to Rob's initial guidance on this.
>>
>> https://lore.kernel.org/linux-media/20250710230846.GA44483- 
>> robh@kernel.org/
>>
> 
> Sure, the discussion will be continued abouve v9 of the series, it's
> just a chance to do it now. Rob properly pointed out, that the invented
> "phy-type" is not needed at all.

I'll quote here

 >> +  phy-type:
 >> +    description: D-PHY or C-PHY mode
 >> +    enum: [ 10, 11 ]
 >> +    $ref: /schemas/types.yaml#/definitions/uint32

 > Perhaps putting this in phy cells would be better because the consumer
 > decides on the mode.

A clear instruction which I'm implementing.

> Ther fact is that the whole placement of the CSIPHY to phy subsystem
> looks execessive, since you add a driver for a media device, there will
> be nothing PHY driver specific left in the CSIPHY driver but name.
No, a block with its own pins, external voltage rails, even its own 
specific votes to scale individual clocks, is a distinct PHY.

There will be no further CSIPHY init sequences getting buried in CAMSS. 
It is well past time to dispense with the monolith.

---
bod

