Return-Path: <linux-media+bounces-56115-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIwnKs2PuWk5KQIAu9opvQ
	(envelope-from <linux-media+bounces-56115-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:30:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0FE2AFB8F
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9ACA7303DA13
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 17:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129A7346797;
	Tue, 17 Mar 2026 17:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gdvK5O8r"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF8C35BDB2
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 17:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773768553; cv=none; b=HA5d/+zg2VI6JKM7D0kz6otGeQ96w5DFMvTBMyukeAFgUoeTjKkKJ/Z5oSCFbuKXAUiH5GEHEk4ZJRPr2RS6cYp5N7t8ipbkjVVPxgkELqUEsRvaYOkYKMTFA4As2N2eTZx4s8IMKEmR/Kv9kFxfEO0mC78ooXosuqr7lsWYj9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773768553; c=relaxed/simple;
	bh=GAKCFy2OkiKG7jpWJ/XJktQv9SAhQII1ABVEufIwzOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PcJB/Pcwerzn++q7Iakb/oGjHrervgDKuJF0/5el2eP50dX/tv14oGXVJZ5ne9EMpdMCEDtGlHbCbmLqQZozehACyAdTCDa/GExro/cfbzWwxzQHJuVHpyd8eA2ipU6xmddlJHuERSXXKqn+lgJ6xig4bnVUnUaMPxyNbkUdHGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gdvK5O8r; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so68358325e9.3
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773768550; x=1774373350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HY9BNi0SB5U83gy+SRIh1ay4mmvnJ8DxaHKR7xUwkfM=;
        b=gdvK5O8r42PNDfDku/MX5Sha8NGmBDu+QKqs07OwjWBFNc9/TE5KGT1Z36AjEI8L47
         RLqjxfEWLSLMpwAhMw4SDFVyfY467iWwQeRHY1/vo4WwaPZkeO5AfxxNJ8d33bqMyV/v
         wGYv/V8qIcam/5MUKT5o7SE/PSIXxzwCwptaJoaDeYpFdGury+tFzLzH+1pvgYhn7Snp
         81c4ZFoxRPXTeGGkAHJk9MZYgayvSbQtw8odV+RnRgAaGHKeUZBk8msUSL3HJTm35apv
         b2/bWsS5S+v9zuFRKkSBXrt4s+56DYGEYODmwSZ4+1jr5gjo/FtV3dDoWQ5WdEXrZ7Ut
         E/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768550; x=1774373350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HY9BNi0SB5U83gy+SRIh1ay4mmvnJ8DxaHKR7xUwkfM=;
        b=Qlx1gA4SaqlXikCCrUd/IEmPcbJz2ZkgslVztg5K/vfnDvh1PMoyMXE66EyEcX2Oe/
         /+2E2W+M/SFqko7GZ1Qgm/rLExxDnjerWBb3NXPIQdP8wDk9zBGZz4h9HalRlMNRaPaE
         Ih7Z1rw+nt71R+avLZ+GrlJTFCIwQFcnEPIvHQmwdcRnI6tZyBDnzp01yt8+hkcQGnJu
         8pBjeyN1sk3stRfEdyfrMGUJXldsfLejijUr1wdJfxszKcQtuCR5nbHUyQtc+gEXdaCY
         fgb/5M6rlhrbxA4u644rmSmV7ca1I2tmghk966P7JCyJOXdYuwpho9Vob3Y+B26jbLu7
         wUBA==
X-Forwarded-Encrypted: i=1; AJvYcCXR07NAD+TndriBawmp0/zSXlCcUC2mfgPqXEA84PS8ue6jIOmFcSrP5D0PbP4O/Yxnk1bo+K5iodHd5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yztm099fU7jXg79gayozUZTAiUb5qIqrqu3oDLqqk41v+1Ar3IH
	+OqrAF0pZsC4vz4If1WsjAP6X5O3WBNr2u26Bb9dWTMLm0kAHbqTjJhl1pvmBDR5WpA=
X-Gm-Gg: ATEYQzwHDOvDZthi2WpCmc7smXXkObiIicOhN+yNq4fxvg3WiL0FILLLXIbIdLXxINb
	a266ko/O/+dr6SgPu6QJYmVKOB68pLOfniD9vCMFMkIhLTB9rWENhBiiq/irsgBhlaV59IzWOBj
	Fb2T+OpUhsqjf6BIH1m/M2Gpypml9aGNQRW3j5nQnLAOPU2I5O07PuAwwaKVkHht+b1oU0X5lCW
	Crc7Zl4mgjx085cJARiV6hibNg2Vq4psDBokHDKvZtTf47vr16sf0JBTEaCieK1EyHI7DpP4H/K
	gTShsvqPMo2uChPt66w6Pz9epckOwsR9SDJAGGHulG1XS0N9tSybuS9OZ4/EmPQJqo0eWII+bXG
	qiyBYjiLQjC/uw9e7vUTTsgl7jY2UsRY96I5pGmbD2fbd5yEhvhJ6WFTQaoblLoemKl8gfrXjqf
	RnVGNjmuSOvVxKvECX94lLQ1uaOV1d1kECDCIaTgqYH2PVDQ6YTjWdFu3LQrsBhpqDC1Fzlrqdq
	rwuMbA=
X-Received: by 2002:a05:600c:4f0c:b0:485:358b:e80c with SMTP id 5b1f17b1804b1-486f4208becmr8101705e9.0.1773768550459;
        Tue, 17 Mar 2026 10:29:10 -0700 (PDT)
Received: from [192.168.0.100] (188-141-32-125.dynamic.upc.ie. [188.141.32.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f443b77esm4890005e9.15.2026.03.17.10.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 10:29:09 -0700 (PDT)
Message-ID: <85fc368a-c765-487e-bd9a-c5dd0376fca8@linaro.org>
Date: Tue, 17 Mar 2026 17:29:20 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 simple-mfd compatible
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
 <20260316-glaring-jaybird-from-wonderland-4f8fd6@quoll>
 <94f4fda4-504e-44eb-87f0-e34e557402f8@linaro.org>
 <471895f6-dc60-44d8-84ce-8ba0069110e4@kernel.org>
 <xSErLOaV_RuZ1DggWWH3WGK4mpUp_7CrvmjVU4ZZd33l60PWpjxiSGID27A9hHbdDYmghPXgZONyhiTJ_USPDg==@protonmail.internalid>
 <1671b8ce-cbf9-45ae-947b-f35d174be93e@kernel.org>
 <61fa4409-e19c-49d9-b7fa-dc6f8413c181@kernel.org>
 <2eef8129-8cec-4ef3-9bb1-22e78b004905@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2eef8129-8cec-4ef3-9bb1-22e78b004905@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-56115-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 6B0FE2AFB8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17/03/2026 16:29, Krzysztof Kozlowski wrote:
>> To my mind that fits the criteria you've set of !depends on parent.
> OK, understood, although I have doubts though, because you have also
> interconnects and iommus only in the parent.
> 
> Regardless of that, even if this fits simple-mfd there is simply no
> benefits of doing that way and your driver should just populate children.

Right so this is a precursor to what I'd like to do with ICP/BPS and IPE 
which will define iommus within themselves.

Not quite ready for RFC yet but:

https://github.com/0xB0D/linux/blob/qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots%2Bstats/arch/arm64/boot/dts/qcom/hamoa.dtsi#L5676

Then again if I'm understanding you here, you aren't opposed to 
sub-nodes its the simple-mfd you're skeptical about.

There's nothing stopping us doing platform_register_device() from inside 
of camss to launch these devices ..

---
bod

