Return-Path: <linux-media+bounces-53670-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDdEK3haoWl2sQQAu9opvQ
	(envelope-from <linux-media+bounces-53670-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 09:48:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E9D1B4AAD
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 09:48:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16CB330603EC
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 08:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14391E3DE5;
	Fri, 27 Feb 2026 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tZctkDXb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E646936492F
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 08:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182131; cv=none; b=N4mBKsOm0VNdRF4lHUaQ8V9+9tT0+A/tjV7fBayB5HfZUWjWPHNORMP5HY9abdHm8OHfIrM+c5KQjoa6x6NT12AE7PTRTois6ft4nsnVoImLWlwjhe3LP1CR56EqPdX87rG//2Eseax03q9gWxs0aqkpo6kkpSx+vToijkvU8Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182131; c=relaxed/simple;
	bh=+C2AViCGBu6JCnL7njP0l/RXkEu3njPw7S4z03Ac/Ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yvy9YrsoMjOWC+QO+e0lfi3MJEMPmgYRRegX33fVUGmnUVtiD96gADkFv2FL0BfANTHyZOmU9h3Kz/p36x0Ki89ySCT/EYzw7I5NP0QR12WBobWLTqouviZcd8EpVSYVGpaTEdSGDM+99GsGrVJu/ikM7sOG1mJTvVcyxma9ZEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tZctkDXb; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43770c94dfaso1675591f8f.2
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 00:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772182128; x=1772786928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DygztlrJ/2EfLqsjEMNZWS27dKKJ7KUU3T7C84zCrOQ=;
        b=tZctkDXbiUHo/OXhkW0WyGZX6gNs/L+qk6jXa5ayADuO3XIbWqKLLDwIka8/hqiXyO
         2wgsUKCB/lBPi1KnUKbaH71LDryBTX9+By11Vrq0VQYlOdm6eInYntouyTskl/ykQCTw
         3JPcktBGQu5sTCD6EMRVPAcPzTUkNF7CPFPpYqne4XGgQgnhDc0pNp1NBj8oN77Hxco6
         B/gUhpVnQtx8qKkxt28Awrz2hW7fHq6oS1nsFxHq6uVUBvChWBNXT+pK1E8mTbwWl80v
         LwGRqCelU4h24IBRvRMvim13Bmgd4tamO5YgHQdmTgR8VUJnOFOwu+ywGim1cOmAGSHB
         zTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772182128; x=1772786928;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DygztlrJ/2EfLqsjEMNZWS27dKKJ7KUU3T7C84zCrOQ=;
        b=BZMBbg7MF2bUpw2FyBoeUpjZR4JPS9bUbn2+SLIokzZTV4sqXGOtirdogmP5f6YodU
         gEGAEBja30Xd16lsjQftoCFe5+14a/WDTLlh4btOp9yM7XNCIPy23LJMOZzYQk4njthr
         FLMjNZfU7GQlXYyk/aCBFrshg9PFF0SeoCC0DO5r4zC0ngQxSu4jHGHgV02Ptws/DdNU
         zdx0tojv6c1xAPfK/NskOjfs8IOvLG6wPNvaIYRGAEzrkyY849uslfrNJWsoD4oKBj3o
         uhn7c3/P0B2A+r9O5BtNPMfJPrLAuDf63EPMpUAEoSz2o4uM/p9/fQEUC9Mi8ctaTCaR
         tWNA==
X-Forwarded-Encrypted: i=1; AJvYcCX9Ypt2lIoNzFgPZZyYL+DUK0mA3km5DsTLMy+BYv7BRZrZQb+IQu0zQu6P1EMAH8wnC4UdmmuRNjz0Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBIlzZyQEWVjvivfwTrKHMUNTSiffo5gXXcRtozGaSS2DQt/K5
	IsPoK9VpilfHCoup8OdVbgG3/lFaNEqDhK1ZMVFggCehkUmbMpwe0EdHsIwnUnOGjME=
X-Gm-Gg: ATEYQzy5pq8sAXYdjuCy2i7xdI3lQNUrNwQCCAj0hTQE8Z3WgeO/TJ3FaKKxi2iqVmX
	EYT3rKvd7bykvmkYoKDszklgCyA2R9pfKs2AjbgIOUsU+C/a4jVWcnZpCMN1rE1Pj4UuphvWSMD
	UlIVIXevcCqnMbt/MK8NtlcDRFSdPrCXIKYyS4Oq9kcJw75MQD+xT4aq24uWq7U0sSyOhGQRUim
	N2Rfr04Wt6Kz17fwOnPDXeRJuTddgn9GRp6UkAZYhzZ7VjtKrhHxrWDtzd5m5VGnIlUr14H5EcV
	x3V9rEupctKGeS40L++nsGI7j/M/Zhr/BtoI+ltBGc5/6gUbNmzbwmiECL05CaJER5YX37S76cG
	WMhWcGWqRvir2r1a0MC2QPiqeaVHZcGu1NhyOfr+Wn49nKCo8HtOxNJI1I1ZlmZW/t1OZxwsyuJ
	WgYxgElzNZZppcJ1R+tBQ/0+UUBwJ72Y5WlwqaLShkLXOQMNIJGn6sE79VfxzQNWvv
X-Received: by 2002:a5d:4527:0:b0:437:664c:3f28 with SMTP id ffacd0b85a97d-4399de4a684mr2333826f8f.47.1772182128271;
        Fri, 27 Feb 2026 00:48:48 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c76b40esm4856509f8f.36.2026.02.27.00.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 00:48:47 -0800 (PST)
Message-ID: <71fcb165-7fda-4714-b56b-40d6537b8ccd@linaro.org>
Date: Fri, 27 Feb 2026 08:48:45 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/18] dt-bindings: media: qcom,x1e80100-camss: Convert
 from inline PHY definitions to PHY handles
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
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-2-95517393bcb2@linaro.org>
 <CuJMpimPBtwHGAd5-YHUArL6FkU2HQeY4SjbxeMwf0ToQ7LKO3zWSTn86L-HKxC1KfarWc4rRbZqnCMQsv0pcw==@protonmail.internalid>
 <20260226-fluffy-complex-malamute-7ecec6@quoll>
 <35b1ba2a-e156-4542-b33a-d4e53f6a62cb@kernel.org>
 <tVxcOw7tqTRGXAoW06WPM_voMVBY3SO7Mm_MTMWp6OuotVmgmyi0DOgVHdDavO2V6o3iRH7ax0NosgHuzGkHgw==@protonmail.internalid>
 <4ebe2f26-29fa-4104-bc90-3f5aa7009ec3@kernel.org>
 <c2d9742c-3d82-4340-a11b-16370bcad5ea@kernel.org>
 <72f0ed74-ac86-4571-8a72-d41282349718@kernel.org>
 <d1ddaa7f-cfba-4e71-8a9f-70014c57de74@linaro.org>
 <934812b1-a853-471f-beb7-3988eff0856d@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <934812b1-a853-471f-beb7-3988eff0856d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53670-lists,linux-media=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 29E9D1B4AAD
X-Rspamd-Action: no action

On 27/02/2026 07:24, Krzysztof Kozlowski wrote:
>> Well, is there a way to support both then ?
> I would just not touch x1e80100, but if you want then probably binding
> should stay backwards compatible, where you keep all properties intact
> and only add csiphy nodes.
> 

I really want to stop adding new stuff with the legacy way that has 
broken power-rails, even if that means x1e has a bit Frankenstein binding.

>> Right now I have csiphy and their registers listed in the camss block.
>>
>> I could add phys = <> as optional in the schema. Is there any reason to
>> stop adding adjacent csiphy nodes ?
> I think no.

Great so, that's what I'll do.

---
bod

