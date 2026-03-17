Return-Path: <linux-media+bounces-55996-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALipOeDsuGknlwEAu9opvQ
	(envelope-from <linux-media+bounces-55996-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 06:55:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F000C2A4243
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 06:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF978301C59D
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 05:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E080B37FF78;
	Tue, 17 Mar 2026 05:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gWwbLYod"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074E737F8D4
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 05:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773726913; cv=none; b=uCzLjV5pPqn59wfctNMV9uGYjsshL0rf61OCdB69bdKkHQpG8AmFU/eoUm3pppQDaxpJe2FGY3EMgsLYKD4xdPlpw8l3LkSXjO5n+IaZP4w9uMefzPSmLrMXR1g4YjeUJGGzY80touJjohT2YptYbQMrqRkTA4dYkwzvAc+LXyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773726913; c=relaxed/simple;
	bh=GMP79ITCgxv/qqTOcIGDhMjkPwlpAtEKWoKxT1QzKrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U7SXAT2+wsWNTZI2ji0xOzAI6DF2yejYAmXhzuNlrPoD2RY85arXDfcla/0Cb+wbEnc5Kn+bMS/Yl+IpKjULFyLD2RvVHAP7AGMd/sMv2DSSVSeK/+uaPPPWkI4VprEHzVXFw0i1mhU7Y17wwPF0gsMpnVQuqqQIbI+p2e2nBFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gWwbLYod; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4853fd7b59aso32567255e9.2
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 22:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773726910; x=1774331710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kcOeBnO85QXQKxiCKrlrGwovlX4gkf5w7/X9rdV9RuA=;
        b=gWwbLYod2MJtEqf29QupScfb9gpItkNGwvBMBG1+UiQNzmrCwp3qD4mNusAWvRpXTV
         vYjNt1lXqeIpRZXFQKWyz3VmpDNYTq2QheBIE3V19iFt9PCSFdlz74ABhoESa+WrIGiR
         1rCWK5f952IJ5CcX/Wn0U8u8eApmFLBDRXvkbJFv9QvShtcVx40Id67a1w2blQcn1IfH
         ez/7RduyRZEzIAuS3BS5u71L2+j96GJ8WoN/+OzkdHHyJ9ZTDNipE0g9rPHUBvAOR4v9
         9Sr9OG+Bz/fnJgcTfzG8zRtUsq6becPQzDM3zQKmx+YfdQOw12WHgLM3unIzhsC99AnC
         cM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773726910; x=1774331710;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kcOeBnO85QXQKxiCKrlrGwovlX4gkf5w7/X9rdV9RuA=;
        b=qJ+u0TJY8K7+kfTUneTMz+Qm+DNWxGWOA0LDLWTqlmKeQhDOi8e6BL0nllv8wRJe+9
         RMtMEersBO2o6sydgE5A71eohGYZeu1h3IdcjfOjv1dyLENSZk2hQkfatEQq1SWkiGS6
         cgs3DwzKCD21grXqiooUKbUOvbLlh1XVfLN6ztYJLOeHBE2K+5FXDDeCPlzXRwDqMjX7
         A1nU/N4PoWaht6wRSEnKkWdLtYvxVCebd+Of1XP2gGRXBU4rGq6TJd7wrgHVcGemIGR1
         J5Xg6UpvFFEeqToVSqv8xwlDX1qIbhFUjTaDU1+/M1S2E22vpeVdiZivw7bda5J6vavH
         zSoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2pesO/qcQxNxLJGkksrHqHGoExFlsSd+P4XXnXqCKGjwu2rF+jaeEvcL3WziTeMcNh8njLrvBHRjN+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiArSFj87D0PV7X0XzXDvwo+CVTOj9yGSQliTdL5LjXA47EGsT
	CZRFK1W3K4Zc/4RUuWswLJLHfQHthjx9FCCK3hut8Jyp6bGi4MsC0Y4x1ep2PD6c+vA=
X-Gm-Gg: ATEYQzy98DOhg6ibeVvA4VgV6Pp3KS1+lLRNqhQ9XHNYep3gZ5RRhIjRY/C4Q7HPnyT
	jgu5GWrAvBoUKB8eY/3kpH2MGx6Mnb44X3N2gzY7tbiAg0fTM0eRhseuz7ElpHO12KT2inhsRdO
	hh7pcmsDO3HpUveBGGEu8rntS3iOfBIYEkrwVx5VVQEM+tzptuG9K7dfGDvXRKl24Yh5WVXSGez
	S9FH0ABhR6jmXW/U/vY+uEtY8kBuUQRAdEBKBbp/zrnig0V6IC0VALHHk3mXK8mN8N82wBq3kPd
	Cq7uVstgwWp67Bp6eIFi0QZptZb/H67weRh6pzUIj0fs9oF93v3pH1lIsyDDInZjnDI+AOIpnuR
	sKNWo2nEb40ol1gIMzJuJi/r//qkEJSicjkCL1m8xmFH9hI8uGsdiyoTZCpcAqrfhzFugwR+RGW
	SSTFEKLndDysXEPKQfoz8XXOWDi56e7h7HxIY=
X-Received: by 2002:a05:600c:c8d:b0:47e:e2ec:9947 with SMTP id 5b1f17b1804b1-4855671052dmr255918505e9.33.1773726910252;
        Mon, 16 Mar 2026 22:55:10 -0700 (PDT)
Received: from [192.168.0.101] ([51.37.189.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea98070sm42508625e9.6.2026.03.16.22.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 22:55:09 -0700 (PDT)
Message-ID: <d104e54d-8276-4d1e-bb7d-9c01c45a7184@linaro.org>
Date: Tue, 17 Mar 2026 05:55:07 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-2-fdfe984fe941@linaro.org>
 <20260316-papaya-mink-of-examination-6db401@quoll>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260316-papaya-mink-of-examination-6db401@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-55996-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F000C2A4243
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16/03/2026 07:31, Krzysztof Kozlowski wrote:
>> +patternProperties:
>> +  "^phy@[0-9a-f]+$":
>> +    $ref: /schemas/phy/qcom,x1e80100-csi2-phy.yaml
>> +    unevaluatedProperties: false
>> +
>> +  "^opp-table(-.*)?$":
> Why do you expect multiple opp-tables?
> 
> And where are operating-points phandle? Please look how other bindings
> do it.
> 
>> +    type: object
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -175,8 +201,6 @@ required:
>>     - iommus
>>     - power-domains
>>     - power-domain-names
>> -  - vdd-csiphy-0p8-supply
>> -  - vdd-csiphy-1p2-supply
>>     - ports
>>   
>>   additionalProperties: false
>> @@ -188,6 +212,7 @@ examples:
>>       #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>>       #include <dt-bindings/interconnect/qcom,icc.h>
>>       #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
>> +    #include <dt-bindings/phy/phy.h>
>>       #include <dt-bindings/power/qcom-rpmpd.h>
>>   
>>       soc {
>> @@ -233,6 +258,10 @@ examples:
>>                           "vfe_lite0",
>>                           "vfe_lite1";
>>   
>> +            #address-cells = <2>;
>> +            #size-cells = <2>;
>> +            ranges;
> Again, incomplete example. Where the the phy?

Both of these q's can be answered by adding a phys to the example, which 
I will do.

---
bod

