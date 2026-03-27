Return-Path: <linux-media+bounces-57382-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHf/MqEGx2kyRwUAu9opvQ
	(envelope-from <linux-media+bounces-57382-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:37:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C76C34BFDB
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 170AB305E432
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 22:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A917539E162;
	Fri, 27 Mar 2026 22:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="URoLuYmE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A0436EAB9
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 22:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774651032; cv=none; b=sd6fRdsqaKbcRNtIxoTDS5aZH3SZeTC1YAB+qFNQrQ3RXl+/OBm4nAtEjrKKz7EIPaGgE++djRDPRQALz0xpdsZSxq6nXJvOG67LFRh+rNX3FkY9u2pIGiawp1DwfqNFfcOOlsOogy/BqKk7bEO2aFv6VEJtXHyETnXM7bpcdd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774651032; c=relaxed/simple;
	bh=Mz94M9j3CiZjbegbr4S9pqf4HEm+HXNGIzWBfuew2IA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=db5ojDx5thnv2k36xR+xL04DLsBq3rhhR3D/r2QL0a63Rzx57xRe1tizPMvGSkRoIn9GnW15+YhuZv3LJPmmJGrZWXKXNEXkJg8PENQaWn8p4Vdk8Tgg9bsKhm2A4hpeqzRwrXkyntChoMo/gRnBSVtRyIVP2HNIDw5lVasfAbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=URoLuYmE; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43ba1f3fa7eso801061f8f.2
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 15:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774651029; x=1775255829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bmGmc6Vgd8VKGv3mHVXKZQWf2GOsa5gLJXBEugfIWyU=;
        b=URoLuYmEYJ20BrHmlwS2nQwpHOoYYMXHu7iPdwYNRxd7ypkWMukbTsIAPy8Ug0tdJN
         K8TmRboDyuZDd/9PIjPPx1d+HBKAhsa9foCwT+XJfra8HTV/uHb6bD9wJQXOvH3Nm9NV
         NOc6FC7ZOba5hp0/WqIpFHK0YGp++s86Hlnkus1H7NnDMnGPF6jPykv+f+hCsURLiy1v
         UB3rgtORpTXDk2ZKJh3hduy2iioLiwwFgoAcWQqFSBR0uwBfJBIbXjgBVnUsxzZnq8By
         xrA9o+eRZNOxoatng4dLXEiRSUa5h7t4lJuN+T1l151l+k996nb2hJvM8mb/5uM/KAZc
         /ZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774651029; x=1775255829;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bmGmc6Vgd8VKGv3mHVXKZQWf2GOsa5gLJXBEugfIWyU=;
        b=IX6Jmg3cnuFGH9TP76Nfyv5Kh/ev7sljI7xi4iFe5Sutf31HR+ZtF++mcJZO+tVFVj
         p96QQsHENhjkb/kn14FeXDckkLRbbwXQ5TntVcFipbN9iYrmqP0aTV+PovRPn6oEpcP6
         tAf3yAlAX44yte1W7BwBgHGNtxtv9ZYv6VAhMpEXhNx1OSNZpTdWkjULlb2Bm7ci1bQi
         PkL7dEeW4SB6fRYZbGXkYE4U42KR6mbmQenl0HP9BYKUmuWcK/ZIj5Perl/Y+ACXM14T
         YCpuwypo3OxJjMc2ZRpMxcL26ytQd2lvX1DMxKQz3WNq7mm5MIqMwmnzfuzLrJuK6agH
         aLzA==
X-Forwarded-Encrypted: i=1; AJvYcCVMpdk/hKDVrDjD8T73rrcqOMEL8JTOgt1gDSJAu9mxI2FsJbVPf2xPjMHy+hKrSl5Ch+X8GuHg1tSyHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA1RySUDPVaF0880QMiZDFA/Yixx7kEZjnn86op0LWfCE4fKNt
	8dp7Jl6S14deygCHRNxRMdjEqgoIU+tTkLITGeJ6u/2+jJAJ43D4KvfNqx1PRZW+e4A=
X-Gm-Gg: ATEYQzybQwiQKwm+uxdjssVc3z5+LxC5QznsCP70qDG8JZQRadu3RY+pA9Te+4JVSpq
	CEGxCK8v1EvCofDUyFaiKmkFvSp95NgBF+vXCgUEWBesmn8Z9i2Dxl48vnalPO5ZuraZfmIGPvs
	jEqzPVinuZzRVz5IDzB3LaqOzgz+EZmXpFwa4e8q1Gc42LjkmFjw1/ywis4oHRUR3glfFWsMLTI
	LsnKcO57GMSx5s8OI78aURqaO5rQdMiknZAq6l85IrdBdJ69aL2pAvo06wbL9RTVCuIy0QhOC1S
	oLaUcDN1fyhMWEyABB7LngC0LFnmbK5h9RivwcNPibHKfucbBgZZbpOqHgwMS/VLmguahYaUKAN
	tcpY+vvf2HvDLrFkbCxQO3o4dl2VCUQaxumdWQ19xdlV1q7mJXfhIufK3geVgPonZ0RRRKmRxqI
	ygGd90hnbA2tytGYqoYnW59LfRhQXNZodNFO208rhArlmBtRQ=
X-Received: by 2002:a05:6000:2dc9:b0:43b:490a:db51 with SMTP id ffacd0b85a97d-43b9e9fb32cmr7544314f8f.24.1774651028947;
        Fri, 27 Mar 2026 15:37:08 -0700 (PDT)
Received: from [192.168.0.167] ([78.152.214.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21f1749sm1094260f8f.14.2026.03.27.15.37.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 15:37:08 -0700 (PDT)
Message-ID: <7757b121-da4f-4157-93c9-4ba162b2696f@linaro.org>
Date: Fri, 27 Mar 2026 22:37:06 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/7] media: qcom: camss: Add support to populate
 sub-devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
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
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
 <CAFEp6-2s=N9=Z5A3gZZYo+XErBT=gMRHdxB7EQV71wPd3UqYrg@mail.gmail.com>
 <b7hndy63j2foc5iuly4reaunaorvg5asfgeza5ptjytaghc772@6jxgnimkcvx6>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <b7hndy63j2foc5iuly4reaunaorvg5asfgeza5ptjytaghc772@6jxgnimkcvx6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-57382-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 3C76C34BFDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27/03/2026 21:33, Dmitry Baryshkov wrote:
>> Other drivers typically call the populate function at the end of the
>> probe function. In this case, however, it is invoked before the main
>> resources are enabled. I assume this is because the CSIPHY device
>> needs to be available early. Aside from that, it looks good to me.
> This becomes fragile. The CSI PHY might be built as a module, which
> might be loaded later.

Is it any more or less fragile than "simple-mfd" in a DT though ? 
Krzysztof isn't very much in favour of simple-mfd so this method of 
population is the alternative to hand.

The CSIPHY driver uses devm_of_phy_get which handles deferred probe. If 
the PHY module isn't loaded yet when CAMSS tries to get it, CAMSS gets 
-EPROBE_DEFER and retries.

> 
>> Reviewed-by: Loic Poulain<loic.poulain@oss.qualcomm.com>
>>
>>> @@ -4964,6 +4965,8 @@ static int camss_probe(struct platform_device *pdev)
>>>          if (!camss)
>>>                  return -ENOMEM;
>>>
>>> +       devm_of_platform_populate(dev);
>>> +
>>>          camss->res = of_device_get_match_data(dev);
>>>
>>>          atomic_set(&camss->ref_count, 0);
> And this looks suspicious. What if drivers for submodules are already
> there and start probing once populated? Do they have a chance to access
> this ref_count?

Nope, we don't share the camss pointer or any of the data-structures in 
the existing upstream driver with sub-modules.

---
bod

