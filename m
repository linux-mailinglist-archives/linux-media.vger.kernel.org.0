Return-Path: <linux-media+bounces-58487-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BmyCQOx2GljgwgAu9opvQ
	(envelope-from <linux-media+bounces-58487-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 10:12:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B753D3D55
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 10:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C16903080EBB
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 08:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B692C3AA4E5;
	Fri, 10 Apr 2026 08:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xWtgbwQm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA60933A9F8
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775808405; cv=none; b=QOsDweBq+F+/YGB+PF5ChOFQrYwl4/WNVJvf/kXfo4F4I2ZUinfB0SB7BPeSH197D3rDd1MfIa9pmqqJzLjBMJD/rnrtFfoBRjyEdW7J+78SWV4ORjKoC6GZeOzRbKc2OLlcEzGkneypjL2fj3l+qMDR5w1ocWN7rPEadINuC+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775808405; c=relaxed/simple;
	bh=GBGCIVS5N+RaJ7icTp4wgwTB79qWgs2D2v5gmbrA8bw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=or/sXXHX351YzjbF5B1kWyykH7tLM/xAjfVs2hXLCJ7si6aFqqYBjOzexDxDVXZHM48UQL9a2UChDBzEmI0nhWKQeH8zGbkgakyBixliAa+XV8Pp9igJrJ5V899fQ6B18+hnDQwbVQOg5wyc1kaR/5lL2fQNE5QrQ0T2zSA5dew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xWtgbwQm; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9c04152730so284247166b.0
        for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 01:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775808402; x=1776413202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qxA5detxxijNUecQFSx43HHyt88jXCieq2fj6pzLvOQ=;
        b=xWtgbwQmactRlBEr6xGCmlUiSfkEDvUfPzy/cocsyfyeIEmDiUBpY8vOM1Mgo4zilo
         +mCirrmxzV3z3pZk7KGk14DKlFocDelc2pHCi55IqKDn8WzJsw+6x56qahHzCRaZFqm2
         ozJqLXHlux19IAInOjaJS4zBFuzI7Mmo0559StKCNcpY5DZd+fODsMnB3UOity6qxeT2
         HWwOWevjmRhBFyI+xHfvLJqZcuCHpW7J6SBbCu9tbazdaQfdLeEgGyIXsPfiuFOWVYys
         6Edn3ZHfTy56DP1NOk9NMFyqupCT0iKEfBwypz4nO/Y8n5KmtUeZa/dckDvTNbFnEtmo
         x23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775808402; x=1776413202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxA5detxxijNUecQFSx43HHyt88jXCieq2fj6pzLvOQ=;
        b=V7I7OWCbMwjcx2BWvR0r6gr+V5kyH6Qt616Rk9fYEhLXFWLu9gyFuOGNmh5yrRWUQA
         EMw6Rfdj6pilGixdH3BThTI4mcfRKXuqWcMOfDlc9Uzeej412fWEjyVRkACEgD3P0qjG
         UGOzdW43WeeNOD0JpQfhHu2ArA11TCW4c16eAv+kGraX4KMIy/dgdfC01LyR5wnrb9kK
         DLCQ4PnuDdO2vHTdkS2LFaN4NQlViy/n/41sk7y6paSC6HBkJ72rJqVrW9M8NVveRh5g
         ca+BWIVvJU4ULKnwQ0xUU3hKmgGMudo3WMxXZKr3WxgBY+a2oYYmBKupHB1P9uzWyQJg
         1HPA==
X-Gm-Message-State: AOJu0YzCTSunQ0aNHlEoky+6/dz19wBX4Er5mgBd9fXTPYMbpxYgxs41
	UZGBY8HLjRiN56pm3ucldyGqGu2pIOLdruqEJo9e5EgCbjf7beHitYql3bMzY3k762k=
X-Gm-Gg: AeBDievhrBxvGasb91xcHJ7am3ffcCtjo/Wux5xJmb6Dykfg7Sp1GtSvPhS24kKBjXv
	3X9KsZixJAN7offHhAWNw1huhh/ZCiOedWgun5MgfTk3E8c9HBFLmj0Lwn2o9puPHLkwrJffM7v
	cak0japPAuTE1HbmPK9gvnTOS/JKrS/Kvut9rh2IN9gbV0a6HscSSNufoB4TdDLE02xFVe6Z7K1
	dMZK+ZEMuUKvvP5Eu1FjtQ2SsAIazfk4uA63umLXmVIwElh4kwDIgG4TN07XbJr/GXr3aV2Abxn
	3AJyUBl+Jrtf7jXn/QX0QV7YC3UnLaPiMRxLT8q6VRGsAgsELFjomVLtkYr9NtlK3FrciB4lSDZ
	RaTuJa0pxh0EVOI0HWul2mpfjt+IS3c6vuU5/6krzNzttf4emshG1P6kTWIHkcaU6+8fEbjQtvX
	PbA6e3/dW4tUfXX4Q1hX6o+ONiXTmleecRzDLTtgkAcozsc4HSQRINlMGHGggTymEs0LHhOUzVC
	UxupkCNyB7UCNgiZ8FkmbPCqEmpw5gOKYlFXezYUG1B/iTXXXolyJbKKUFIf05SXARpXWdWQjDG
	hnMelymHJ5Q3Ew==
X-Received: by 2002:a17:907:a0d3:b0:b98:132e:ca97 with SMTP id a640c23a62f3a-b9d72815099mr138971466b.47.1775808402011;
        Fri, 10 Apr 2026 01:06:42 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070815d27sm357147a12.24.2026.04.10.01.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:06:40 -0700 (PDT)
Message-ID: <2959855a-3448-4d98-99ab-eb0e36bbecbd@linaro.org>
Date: Fri, 10 Apr 2026 09:06:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: media: Add bindings for
 qcom,x1p42100-camss
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com>
 <20260410-purwa_camss-v1-1-eedcf6d9d8ee@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260410-purwa_camss-v1-1-eedcf6d9d8ee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58487-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 91B753D3D55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10/04/2026 05:25, Wenmeng Liu wrote:
> +  vdd-csiphy-0p8-supply:
> +    description:
> +      0.8V supply to a PHY.
> +
> +  vdd-csiphy-1p2-supply:
> +    description:
> +      1.2V supply to a PHY.
> +
> +  phys:
> +    maxItems: 2
> +
> +  phy-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy4
> +

So if we still can't agree to get phys = in in the next kernel cycle, 
then this scheme is acceptable but with the huge caveat that one 
power-rail for each PHY is known to be wrong.

And I absolutely hate to continue to knowingly do the wrong thing...

---
bod

