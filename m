Return-Path: <linux-media+bounces-63780-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V80WEyFbIWrqEwEAu9opvQ
	(envelope-from <linux-media+bounces-63780-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 13:01:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B10E663F43C
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 13:01:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=buE1OBR6;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63780-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63780-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E56C303F717
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 10:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D03406260;
	Thu,  4 Jun 2026 10:54:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B03409114
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 10:54:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780570470; cv=none; b=SONDo5bDSxj8e68NA87jiU8Qo5c7Qn95Znx1fSH1jLn7ac/lmG+wo+q9X2+X8TecK0pNeEfnoBEqNPuVnJoJ+SWKkMnmLZ6vcn7t/y5tWqguVboOwzI80SKGU5xNWb8BSdb8H9T6JTLxKsY5+E4h2rZiaZTbiQHLJfZp7dqPSp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780570470; c=relaxed/simple;
	bh=scvY+dflouvP3WjbFewFlJ+s3wcSoSglkisnCRmgzio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LzA7g2fwBfR3Ro4T0hq30gTTyXbkwdUSA471FT7SKbuOPKZFwic9E4nrwAC3yY+0+xEARHGbT9OYRvvCeSajwA1i7Xp5yJaysauzSqr02YyFY3CueMo0stm0ggjeixTdvVEc66QvmUuOiECjCGK0fpRIHpHM+2cBg1stgw9coes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=buE1OBR6; arc=none smtp.client-ip=209.85.208.180
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-396775428d6so543581fa.3
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 03:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780570464; x=1781175264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCnxhfojGBE4En3AxLCMLMPhWtZG8rg5zO2UJYy4dS8=;
        b=buE1OBR6bEQ7yvMBHuZ3NIA2NIqOPblVwrPI7CHVaL63pKifJCxeh0ENQFeOItfGU8
         0hAIqe8DX9u4m8MusUApQPOVaizkwM3cATevvLIKWMCCZwtEOXrqSQPqRaWLLwml9wig
         zQzfv2/2+kaRZD8dVRolL0l/P7LUAPxCbE+vXRlVs+6PkaeFaskjcEQypUsY4LrUJ5f1
         gyhHLA3TA70iYUIMov+PSNRmqAOouiDRCQOVh66jXOCs9o96hUxdlEWxLMxJ4HoMpIGS
         3w2XDL3nud4TvVOT+0b0bdyRHV8sG8ePLoM5oALln00hTij2fHLRS9ZmcHb1psE+W2ue
         bwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780570464; x=1781175264;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bCnxhfojGBE4En3AxLCMLMPhWtZG8rg5zO2UJYy4dS8=;
        b=NiirbUtKnrQTH2wLBUcRosfGTu7yrKfHlKIhMSkLOHHIwVyClcuwfcRG0AJxWRD7tx
         qMV/AzCIHnNsPMqTGjvtlVEvzoQsKruKO+QtC4LtC9rTnkG+pnkS4im9+mDHYD0vat0m
         mrq9xwI4tnyPigyMcVQ5nC1TZUCsaz+GptbTVi8S370lkPrOwckrYDPjbK39ZXPNswHp
         3vzBLZOqh/Q/7u5ZkuVESyHNfHqsj6osryGv42dcvjG9aXXGShWXG6yMSjNsJZdhSmIu
         en9959JsJHiO7FvpeGXTG8AIgY+6ITaPJDJ8oFVJbNzdcdK8wEcPdBKiY/XxKFh2SLA3
         ofCw==
X-Forwarded-Encrypted: i=1; AFNElJ85AFrIxXthUSBO7Ogrzfe9AII47JovYKUp1IEk+lL0rlIfLviqLwoQ4PTJsYBV+IKuGso/knufX/0wYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKWn57Mh7dA04cp9Q6jBMExuX/O/GbN+O9XJPvVTitHkPTAl6g
	2g+JJFFt4/2AH1GrhO3jAkmAQCPXvLRcSncpXAC328mJE2MPRPsRY+9EwT9O1PzhPlw=
X-Gm-Gg: Acq92OFwnzcoILhUJy1smSZN07l9lOAiqIoyg6Jqf2jzEr1tdZY3FLZXUbYq8VY/APS
	oRHNyFUWqU7Ec5vytAAx4R5Xs7lmiWu4A/XfdD/hhJyrrR0V8IQ4NgpMlo+KaGVBw+L4vyRlkiH
	+xPXX2u8kDnH8ZqtnzqVii0IgWnSid5iB5fl2gbN/P/upgCAdnvQEJRQwaAx2PhG02gnK29lYD4
	yD79v5MdHfamzW9HAbJuKhXnCbp4f8PlBkIYhd8cuv2kt0RSAFQSHPl9YGfqLy7GO+8ZvtI8uMg
	fQTMtDd8WjeKGh8AZ9dVuEw90xTJNQRVaJ2KF6FDYH98sAhKFIlarVb5/pE4/NDPopbPfFLrfMb
	FyW8JTmnODmBmCOuNxrjDy3AJQNAox1RWgjsr0KIO9v2dykhD9EvG15EyYsEFxQshdE9IxJTpb3
	Jg2kcV1xLVm4EmGY8FJXfOTx1xItlEFEAUnNgHGcp1+Ia8N6bVJD7u39W7iyx7GCW1ndQqq17mw
	Zc0OoOtNXIx8m0L
X-Received: by 2002:a2e:be20:0:b0:396:92eb:36a0 with SMTP id 38308e7fff4ca-396bed4f78amr3316271fa.0.1780570463834;
        Thu, 04 Jun 2026 03:54:23 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ec0sm15504751fa.33.2026.06.04.03.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 03:54:23 -0700 (PDT)
Message-ID: <81c069f2-bb15-44cc-aefc-a44c1c6396c6@linaro.org>
Date: Thu, 4 Jun 2026 13:54:22 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bod@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <478df3ed-d4ef-43aa-bb84-e2075798542b@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <478df3ed-d4ef-43aa-bb84-e2075798542b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63780-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:bryan.odonoghue@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B10E663F43C

On 6/3/26 01:51, Bryan O'Donoghue wrote:
> On 02/06/2026 22:59, Vladimir Zapolskiy wrote:
>> On 5/23/26 05:48, Bryan O'Donoghue wrote:
>>> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
>>> PHY devices.
>>>
>>> The hardware can support both CPHY, DPHY and a special split-mode DPHY.
>>>
>>> The schema here defines three ports:
>>>
>>> port@0:
>>>        The first input port where a sensor is always required.
>>>
>>> port@1:
>>>        A second optional input port which if present implies DPHY split-mode.
>>>
>>> port@2:
>>>        A third always required output port which connects to the controller.
>>>
>>
>> This port numeration is imperfect, because port@0 and port@2 are required,
>> while middle port@1 is optional.
>>
>> Like it was stated before a number of times, it seems natural to operate
>> with two ports, where input port may have two endpoints rather than 3 ports,
>> also that approach solves the problem of a hole in the port numeration.
> 
> Can you confirm this is what you are after ?
> 
> port@0 {
>       #address-cells = <1>;
>       #size-cells = <0>;
> 
>       endpoint@0 {              /* primary sensor */
>           reg = <0>;
>           data-lanes = <0 1 2 3>;
>           remote-endpoint = <&sensor0_out>;
>       };
> 
>       endpoint@1 {              /* split-mode second sensor, optional */
>           reg = <1>;
>           data-lanes = <0>;
>           remote-endpoint = <&sensor1_out>;
>       };
> };
> 
> port@1 {                     /* output to CAMSS, was port@2 */
>       endpoint { remote-endpoint = <&controller_in>; };
> };
> 
> This works for me BTW.
> 

Something like this will be a much better description, below are additional
notes:

1. for endpoints to sensors data-lanes and clock-lanes should be specified,
2. as it was stated before the numeration should start from 1,
3. output port may be just removed, otherwise there are supposed to be 3 (!)
links between the umbrella CAMSS and children CSIPHY devices, namely the
links are a) parent-child layout, b) phy connection and c) media endpoints,
it sounds as an excessive overload, where a simplification is possible.

-- 
Best wishes,
Vladimir

