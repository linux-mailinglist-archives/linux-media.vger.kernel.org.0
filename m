Return-Path: <linux-media+bounces-49787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F12CEB8C3
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 09:35:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B12C430402C5
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 08:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 840981A0728;
	Wed, 31 Dec 2025 08:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qWlNSgs0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365342E22BA
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 08:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767170105; cv=none; b=vFZbgG7RDne62Edns+ZmMYUBvr8edvG+8A13H09a/geGY/V3b6UGkvCwU/OFYkCNGPIuzP1oCTF88J+7hF4/B5d5A2gUCinPjfAkydaDPW/3knHaEqgHW6QGQmjSoivL1UG8/27wGUAvxJhFiTnEuXSD6ZrSd51NldkOB9xrZdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767170105; c=relaxed/simple;
	bh=JDWS9/pcDlSo5dcHYgDW+IDEa86kz1UK7AomgxHRh0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZRlKhlAMqURFa+HEWQoHE+VmSOKdR6typSBJhr//4e8JJOMVKiyH7rf9agpHfIbAHk38Y52KcmC0227iLv4k8DS6OGfRxk+EbVF81E3i6sMy88o1hVbpH7P7ps03wKzWb/f1o0uN+gZNMlCgG7fRpxShXTbkwHPz87O+yenV3Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qWlNSgs0; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37ffd64f478so13312131fa.1
        for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 00:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767170101; x=1767774901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpp/z+J+tsEiwPe2KgJPeWCipeCjqxXWZmlQtlixZvA=;
        b=qWlNSgs08vpR8ThI71PV4rGNUsQvAaGPFLkuh0h2BdSEMF+CPezRQLG1fDIPc3fd7i
         49EgcvKy8+Oj2T/rvbJrCZRSkTr3u70dfPKtG2xqOVe1XCEHPHxJq5nAmELMXgJ2uypv
         n+PY4E+OIySYVzMDHKs9rlQTFLJc62EEjjsJ+DCqtIjTWbul2WZai5xg0QQggRpa/c/o
         q5zHFXEQfJZAPxAv7n12cBxSYN8+Fm2GsrQUlk9o4iVTfdTXnAaZzyGkgc08UXegTCXq
         TKAvkRGgH1CtXTjZEYQv6cC/GPVAI3z2vzejomNcymDANROMS8UW3Dh4HVDSDq2n8bUt
         Yr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767170101; x=1767774901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vpp/z+J+tsEiwPe2KgJPeWCipeCjqxXWZmlQtlixZvA=;
        b=dNCcxkhHS5qMX4Msw0DG1hN6jQy8ZA8LlkWnfe9m6K5W1rkOWbVrrHGNo7RDcUhlZ0
         x6vTI4ulq8Vq3RXhB8YKnzG+TGYfcYVqvWdChgBm6nKKXSWANrHNJjWDJQnqKDmYgICY
         RG+xhOCiG+/qBu7uu4GMLEFXbeFQaFaqb3EHGnkCLvtjtbhGoUa3UpElImomRBRGHG1U
         euZ6uxBjFxZU6Z9OxX0OzaMphXRfJM/xSNPCmwlRo9Z3J3VbI2WhJhEShtXUMJv4lL10
         3kq65z+UVnZWvDTWpeZz2cqSGHx+WtmMu+5J/rVIQRtEDxU4M/rheAbiYekRlKP2khDy
         3/Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWcywpqWyCTIEdPEu4ULctoSGp/J6ZG/YOq2EJChS/jFeChMhIwhr4x4AfqzxRrlSJkrpLTT69bC+Gqww==@vger.kernel.org
X-Gm-Message-State: AOJu0YyemjxV5bekJa4aY6U3qPMYwRxYQ9TWtHRwI3eCo+h/lZVNCR9A
	M1//dp5dEv95g1SykD/q+K1wsGIGYuEDZW6OrZBWJCnuM5sMojTS7GFQ6+kNZ0ZjqTKV6m45unC
	jN7Lh
X-Gm-Gg: AY/fxX7w04z4EfcNdbC1WLzXgZIOq3KyPpPZRbMhWbhknHSD/KNXtjA4+019pSfMuc2
	W7cu6jDsmEOfZRSD7KdFjhv+1LQYwiFsgldzWyt617C7MpIwTSaFBIjVLQhbm437Fj3v6eo1df1
	lKdb9rZjFNNpaERat0jWzrvemJe9BRo4NQ2WEwJ+GL9aceg4fJnb5XSRWgZpR9W3CquFUuelq8m
	lth8+SCJNz0jO7PpMqLAerhaRbGwOtSFT4DYHQv1gi3SO0dUXqPQenoD2oY4lmflvd529aaOmTe
	PVC8WBsFlT9YR5jqPej8mnTFwkEf0EfX01TxZxOmdEkM5/evs8c7a/SLo8cG8ytBZkc5Dnn1qVB
	R/uM6Zufy+fBQsnzLt3HfPfMIe9GAK5OGvulYxPmnbSUa4+8DKWunnTzwoAkHMoch9RWpMEaBqv
	QTgQGJdz9o3PSdL7I40IDcnvKlIz/Vy3oJg8NAB++etpI2Eo0PfOAZ4iXj8ivxe9V9tw==
X-Google-Smtp-Source: AGHT+IHMK7CiqyMcRO6mPySQIRVNL4guO+avS82BCcU/vB06uk+9kxXjB6+ZtfSaA4TXhkYwNr1bmA==
X-Received: by 2002:a05:6512:3e1b:b0:594:5607:3b1a with SMTP id 2adb3069b0e04-59a17cbfb40mr6988752e87.0.1767170101072;
        Wed, 31 Dec 2025 00:35:01 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185dd252sm10637734e87.24.2025.12.31.00.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 00:35:00 -0800 (PST)
Message-ID: <8a0083a8-cc5f-4f08-ac8e-7a4516e0de54@linaro.org>
Date: Wed, 31 Dec 2025 10:34:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: support for empty endpoint
 nodes
To: Richard Acayan <mailingradian@gmail.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20251230022759.9449-1-mailingradian@gmail.com>
 <1fa74da9-bd3e-43c6-afbc-8cfcbb93af93@linaro.org> <aVSSNGCtvcYCTylu@rdacayan>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aVSSNGCtvcYCTylu@rdacayan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/31/25 05:02, Richard Acayan wrote:
> On Tue, Dec 30, 2025 at 10:18:39AM +0200, Vladimir Zapolskiy wrote:
>> On 12/30/25 04:27, Richard Acayan wrote:
>>> This series adds support for empty endpoint nodes. It is currently RFC
>>> because it continues an ongoing discussion on how to selectively connect
>>> some CAMSS ports to cameras and leave others disconnected.
>>>
>>> The SDM670 patches are for a full example. If agreed on, this should
>>> expand to SoCs that have CAMSS.
>>>
>>> Example SoC dtsi:
>>>
>>> 	camss: isp@00000000 {
>>> 		...
>>>
>>> 		status = "disabled";
>>>
>>> 		ports {
>>> 			#address-cells = <1>;
>>> 			#size-cells = <0>;
>>>
>>> 			port@0 {
>>> 				reg = <0>;
>>>
>>> 				camss_endpoint0: endpoint {
>>> 				};
>>> 			};
>>
>> I do not see this device tree node layout as a valid one. A 'port' provides
>> an interface description (an option), and an 'endpoint' declares a connection
>> over a port (the accepted option).
>>
>>  From dtschema/schemas/graph.yaml:
>>
>>      Each port node contains an 'endpoint' subnode for each remote device port
>>      connected to this port.
>>
>> This is violated in the example given by you above, when a remote device along
>> with its ports is just missing, thus there is no connection. A forced alternative
>> reading may (or will) break the legacy, so in this particular case you shall
>> start from making a change to the shared graph.yaml documentation, since it's
>> all not about CAMSS or even linux-media specifics.
> 
> So, if endpoints MUST/SHALL (in IETF RFC 2119 terms) have a remote, then
> would it be acceptable to label the ports instead, so a board DTS can
> specify its own fully connected endpoint(s) under the port labels?

It could be done. For the record, the solution is not to "label the ports
instead", but the preliminary added endpoints should be gone, and it implies
that the labels to the endpoints are gone also.

> 
> The labels to ports aren't looking as "excessive"[1] as they used to be.
> Is the original review comment on port labels still relevant?
> 
> [1] https://lore.kernel.org/r/565d14e1-1478-4a60-8f70-a76a732cde97@linaro.org

It's relevant with a modulus of 'likely', it's so secondary that I've issued
my RB at that time. You can write a proper dt graph layout without using dt
labels, and since it's expected that you touch &camss anyway to change its
'status' property value etc., you may add ports and endpoints under the same
labelled &camss device tree node at once. There is no rule to use some labels
no matter what, but technically you may introduce port labels and add endpoints
by a port label, this approach is practically found e.g. with Rockchip or
TI ISP device tree nodes.

-- 
Best wishes,
Vladimir

