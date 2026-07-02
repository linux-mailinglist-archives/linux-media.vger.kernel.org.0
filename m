Return-Path: <linux-media+bounces-66285-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GjExFD2sRWrqDgsAu9opvQ
	(envelope-from <linux-media+bounces-66285-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 02:09:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 948C16F291C
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 02:09:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="o9LbZoJ/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66285-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66285-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF3E5304344A
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 00:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C5F13E02A;
	Thu,  2 Jul 2026 00:08:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA52CA45
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 00:08:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782950932; cv=none; b=d8hLNoS4QApFFnpmSmy1xFgsNrW+tqFUrNb2to+M9ZFINMmP3QD7R8Fy1hfm3O/ImO8zH8POCrSN3dM8iEE1hrLOFcQcECXU34AmjhgJADyLOglXgRexm+yJ5yhsBKimRC3+qL5gvvpJfo0zYRcXs8v//LEXXqBIursC3SgeBV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782950932; c=relaxed/simple;
	bh=vpK3lrRvtjtz1zpn4+fNk4iRculZWTOVXgTV2Q/9+EU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IM+BBL7z5fldx9HYQ5AolAf1m13nuYBcBgo03y+0A7cO/bcDbKYasOFJwRLYzlEY+5KoW9/VXjEsa6paHCkcPsXq51XyBht6nQ3VxxQ6s+Xd+vIRt1CmsE7cvtlhVzt5vNobEtV2Hm/O6b9EL2XswS4wdb3sA9oFePCqjebiDhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o9LbZoJ/; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c4ce68fbso2572455e9.1
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 17:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782950929; x=1783555729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PNsykQwqe+udfzbubaksG4wXVqyFa0ncqpop64TNBKw=;
        b=o9LbZoJ/XoY1XaRCsmwpSAqHflUxEAKDEvwGyoW+kZHPC3JePkWyK/BhveS5Pk0Agv
         g3ZuwZRg8wRMVb1T3M00kos7E3f80aUTcnY5BqIEOJqJUSf22edqeBISnaMTegz4QS78
         seDRc/oOJZx+ymVyd4zmXN3r1AFA3s6YDHqq0GCrab393aBuZeMdfWCt0BtnwzDJZAY4
         iUctKhYprEzq8xj/PEzPOdEXZM5yvdO4D5yxRPDF7LgSWgfzP6He+7y218ont+yosGD7
         TD34jI0xYmqR8kxnQmMVQv989xoF9xO3ADj2DgGepsE1SlK6R5QXuL4TQxLdzZ46SGGP
         sztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782950929; x=1783555729;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNsykQwqe+udfzbubaksG4wXVqyFa0ncqpop64TNBKw=;
        b=ax4ydB1+2rlPo4dXAe5iu9BSVRhCh3ta505rXOeNSV2MGl6182iW2eyY9e3zYv6Yb3
         ic2GqUOB37x74Hp2UkZKyw3aNyxrc77KG4L476dKivB3E0QuIxJI0HzwUR6Bq16tdq3t
         vop1ysQMQ+zXuhgsoovPMK9k8cVzY7knk1P5enECV24JlD2DccQqNsG8meOW8J+Q52vn
         NtSNXeTTQgBG9w+vF3NrcZD13ilHzRWN5SSJzR3zWLOU8moa3AjbjsO5ATeM0V44BHpa
         dllVWbuY5jNOBKytTHNTS/ZICni24EVmSZLnM/SHcjcl59bK9g30F2L7vvxk00o/ZWdv
         qG9A==
X-Forwarded-Encrypted: i=1; AFNElJ9nHxfCrlKD7i3bxaVNBNHx1ahCHgm4Gl21cHwtVFygNnYpAiexHAdQiLEJmd46cWlWpYsbn/KPGHDoPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6eou1YAvzN2v6tRvp9dJin2ZbXOQ5vV8TmvjP0fO25AuUG4Ao
	1EG7DRLcezuS3HyAjMFm3P+NjXJfeKEh0eenfT8glH4g2dKefmhVb5xKVlh+gZdcuHdp9fx7ZCo
	qP0Xz8og=
X-Gm-Gg: AfdE7ck8cvkyh6eFs29xbWoyQgjogVAZWLH1nDckbLZeQWrwKFVoucYEcDoScmdBApR
	TStVpducV58/FF9ihhwFO1LjsY8gZLVjGj4v2Ndooa3omIkgC1h+GzMTLRcCB7D0hDR34LdZBEd
	nDNEL9AN1u6/F1iIf904gol44z9wGMznACPNL48sCz+zI97SlkeNk4xCvBdcP5Be87kbieskviI
	cb5AwUZUWnkajPCD8Gf+/RzDdMZHZ+tGDUeI/r4K7D5DoORfe83IDfJ2Yg/L7ud483jrIpxNlR/
	SWTr2rHl8jt41h7+f3uTd5mHCLzVWxFa64/r0+lZMFpIrwNafFrV6axRxmPQJKwnpu4t7tLa+/I
	o3U/v5YwYM7gFmcM2OWVKqqN48K3St6RStpNaWZ2AVr7lH7wBCEc9D5/+33+Yub7L7QQdQkedFM
	5EvII3E7RZDYOOsxnZM6Z6qRTT
X-Received: by 2002:a05:600c:8b75:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-493c2b3ce9fmr53986115e9.2.1782950929104;
        Wed, 01 Jul 2026 17:08:49 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.66.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637bbcfsm1790375e9.6.2026.07.01.17.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 17:08:48 -0700 (PDT)
Message-ID: <6b6492a4-7610-4dce-a81c-8dc0387a4061@linaro.org>
Date: Thu, 2 Jul 2026 01:08:47 +0100
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
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <ae3a381b-5697-43ee-bdfd-aaf2d22ceedf@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-66285-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 948C16F291C

On 02/07/2026 00:37, Vladimir Zapolskiy wrote:
>>
>> Inserting bus-type into the PHY layer is borrowing from one domain
>> linux-media and pushing the concept into PHYs.
> 
> It's the other way around, "bus-type" is an endpoint property of media
> devices, reference to video-interfaces.yaml to get more details about it.
> 
>> phy-cells = 1 with CPHY/DPHY specified in the consumer, as was Rob's
>> suggestion will specify the mode.
> 
> This cell is just not needed, and unneeded complexity should not be added.

I'm going to stick to Rob's initial guidance on this.

https://lore.kernel.org/linux-media/20250710230846.GA44483-robh@kernel.org/

Happy to revisit if the DT the Gods so command.

---
bod

