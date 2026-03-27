Return-Path: <linux-media+bounces-57305-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFjEFIvCxmm8OQUAu9opvQ
	(envelope-from <linux-media+bounces-57305-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:46:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EA8348927
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44A7E301CCD8
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82E831A07B;
	Fri, 27 Mar 2026 17:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wLELYUxH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DD930AACB
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 17:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633340; cv=none; b=c0x5mthPV7jpSSZ3og2oGkOukcTm0wQA0NDNUGsvsFEnXetxwlG8vmXRSbvspjE7La+M1UrG1z/9SMjy6ZWzbnQTXLoWPl6duAgSe3Ps1254kG7qPEzHijk8wQ1lGYRWSayOeG+sqsfKrgjTQjovlg7/74wr5RochiJt4LvVeuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633340; c=relaxed/simple;
	bh=ETJq2PPi48JVsLsmWI9PZOd4lZiQNUeAf8BRU0YBYTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dlnY8RmXPoA83aNVHhKrJ391HX81ZlBY+0Y8iBp5DBMXX4qhvIxNjyN7VofBuWX1msasr01P3IvoX1My0DQwvmjI8SSBu3/ZXYcLA5VVpyH7A+Dt0roXCH3NGE4+wMPQICjSGGxqtZl4YeFlhmiSXH2KLzXODVI2y4gkhs9rNv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wLELYUxH; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b871dd06eso1406030f8f.0
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 10:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774633337; x=1775238137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yfu/d6+o0zctQTHLu2MWPdnz/JwccY9dTbonya9Zlio=;
        b=wLELYUxHX7osQKoxO2CZUd96lWlg7qNF6VR5x0ztPGEAMyIunRJ+4MKieRHjCrx1eK
         VXW1LA8N4N2cqsh8XrwyuABjr6EmzONiim988HhXPeCemSA7W8XdZ1/iSeK4uA0I2JtE
         2XdOpOfvXTdbz8w1q/+/w1apPYzp+myboRxfbKB59z4QtwKlWJUd7LH7LGLdIzh5w6Jp
         dgutxT2S7uJNyJcuwSlt8lB224+ddNRDj81ltdWjWdFT6ueMSC1ISb6vjdAn3eiJhyy1
         3qgPJZWguLiqshgA/Aa7PFeXq4q1GbyA4raQ9cHB622HitwoW0DIhpJjrGM7/yoWlAh1
         yX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774633337; x=1775238137;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yfu/d6+o0zctQTHLu2MWPdnz/JwccY9dTbonya9Zlio=;
        b=D1cAYqQwcMoOU6LNtVunE9BgV8ZbKYmYamDO81tNyZxSC5afybZEQBDBqsiR6QPZz8
         SizjmuruRuf9H3kKqQv0pauPRsiGjq6wAdq4uAhpj3foIbE5pYDh/Kqgxjd/+CW+VEc4
         7NNR9YFT+BHVGF63gc5aKwX3ABYo6MQIyBs1qN4HS7heF5ySTtsx6CCqn2fCnJU4EAcB
         LHr3vs9bLlbaVAL7b+X3qHO70mEv+sDPW7ZNO4x8267GNATaffPQ62Ttsn2n9/KycAq1
         DKpAUNrW9GjELExl4Ug6Ti7+COL2eUzHbI5nc5v2nqWI2jRMbxIeLHix3egh+TQ/kmrs
         QcBg==
X-Forwarded-Encrypted: i=1; AJvYcCUZV5QtlrAr5N3T4urzN5IR/fOuK3epBlZeRO3tMUpLDCg6ohX83xa0LwlmgAc+1wMn0NbVIYGYAvYqFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywov4KrPwtJhBA9ssxqj3Vmdrlm2moSOnmPSnAmWxkEk2PWu+ip
	mI2Ko6vT6S+4nNOpoDPZmTQfj1Qk9iXktVi2E8I5jiJOggLilkvHpD7JDk/KrOHfmY0=
X-Gm-Gg: ATEYQzxckSo2VjkcOiNJ5D/QK6L/8yVvCWlUTwCzku4kYkwBfLZJv8Pb7PMpd+0HzSx
	Yk0FmZMgjhc2YUtYl/jtiC28tzMRUUpXUVgeXwB6z7Ut4aLGvLJSKmGRQJZBD2yuW3s6VO2MC3F
	+T8JLPdD7nYPIkqY/BytRJ36AYjB5uJa8qXpfOQJFRaIBnl6vc6txab89gklwAaYSQWq1HtcvGr
	MmoOLm6QVR0RMElUStFP0H2ZU9oiYc6peXZ5O6kxmHFJ0Up6iUWEpxMV8MNcFK78iPsaJ/F/0FR
	YfE8bilgJdPL0hfw3D8exxfAyk+BJgIq24bJyvFfW1kgrkhkO/URI69UqoJT32+9janWx1eNkJQ
	jwlbUtli9TRPkMqIN4j/AMhoSelO3An3rqLpL9uXIZhotSFjskuFfPYrJMgHukiO5r6iaqmnvKv
	fKwMrSySmup4wM8fZlj2D2bbARuBc311TuGmlN
X-Received: by 2002:a05:6000:2006:b0:43b:41df:705e with SMTP id ffacd0b85a97d-43b9ea77850mr5911220f8f.49.1774633336801;
        Fri, 27 Mar 2026 10:42:16 -0700 (PDT)
Received: from [192.168.0.167] ([78.152.214.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919432f0sm17358844f8f.13.2026.03.27.10.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 10:42:15 -0700 (PDT)
Message-ID: <c5278028-dfe9-4d09-970a-a25977967bdd@linaro.org>
Date: Fri, 27 Mar 2026 17:42:14 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
 <da3ed78d-fb5e-4820-95d6-527d540cf03e@linaro.org>
 <1f38187a-9464-4aa9-b70a-03b767349d56@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <1f38187a-9464-4aa9-b70a-03b767349d56@linaro.org>
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57305-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: C5EA8348927
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27/03/2026 15:28, Neil Armstrong wrote:
>> To be frankly honest you can make an argument for it either way. 
>> However my honestly held position is analysing other upstream 
>> implementations connecting to the PHY means we can't make the PHY 
>> device a drivers/phy device - it would have to be a V4L2 device and 
>> then for me the question is why is that even required ?
> 
> This is plain wrong, DT definition is different from software 
> implementation, you can do whatever you want if you describe HW accurately.

I'm not sure what point it is you are trying to make here. Are you 
trying to say drivers/phy is OK with you but you want an endpoint ? If 
so, please just say so.

I can see an argument for that hence my response to Konrad, I just don't 
see why its a Qualcomm specific argument and of course understood stuff 
bubbles up in review, we have a public debate and come to a consensus - 
that's a good thing.

However, I'd want wider buy-in and understanding that endpoints in the 
PHYs is a more accurate description of the data-flow.

We've been applying DT bindings aplenty without that so far. So we would 
establish new CSI2 PHY bindings should represent the sensor endpoints.

Is that what you want ?

> The CSIPHYs are not tied to a single "consumer" block, they can be 
> connected to different consumers at runtime, which is not something 
> classic PHY devices are designed for. So they are de facto a media 
> element in the dynamic camera pipeline.

The existing CAMSS binding and media graph are not changed by this series.

> And actually Rob Herring asked use to define the complete data flow, it 
> was a strong requirement. I don't see why we wouldn't here.

I'm implementing feedback from Rob.

https://lore.kernel.org/linux-media/20250710230846.GA44483-robh@kernel.org/

To me, here is where we stand:

- Individual nodes - we all agree that
- As sub-nodes - I think the majority agrees this Krzsztof, Dmitry
   I'm fine with it too.
- drivers/phy - I think we are accepting this is also fine ?
- endpoints should flow into the PHY and then back to the controller

I get that argument. In fact I _like_ that argument at least I like my 
conception of that argument.

I'll stipulate to that argument meaning then that, new CSI2 PHYs shall 
include endpoints for this purpose globally.

As I've said before, there's nothing Qualcomm specific about this 
discussion, really.

---
bod

