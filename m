Return-Path: <linux-media+bounces-30880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C79BA99AD3
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 23:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4972B3B41AF
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 21:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB8C1F7575;
	Wed, 23 Apr 2025 21:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P9eszGJ1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5079D1EB9EF
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 21:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745444212; cv=none; b=A8AuW7VgTV9RemFfMByo+/JOVKsunIMpbQpwPCxO3hYOUJrRMjvBswGzTHa8hXgK2QWsU5ZPYN1DJjOJpmKcXmKyIh61hjlm7TFQSF0MOvMlg8KyJw+nYpbxRPXOgzevtpV+eiaXnjl3fuYHHa0/3bGHUqzWA9A/4BKLRXNu3Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745444212; c=relaxed/simple;
	bh=bLFs+8/609N5da21p6V3HY8mVyw8mskxF34anzVCFCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F8JyduLFM/Qi+Hw+JbycXmQLz/apKMyGBraCexct996EFWJBT9HJ6hPP8XhHHAMJI3f2Q0IbfYqDj2QolT4D1Ny2kC7cji0aL5Er91SjaUDsRNG/VTnjyRRevJFekcbWpRvcaXahBnrQC7/2APWc7BALYH/k1xbbSt+4VFORIkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P9eszGJ1; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-391342fc0b5so226224f8f.3
        for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 14:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745444208; x=1746049008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bLFs+8/609N5da21p6V3HY8mVyw8mskxF34anzVCFCI=;
        b=P9eszGJ1vxDzwFgcnqRyNPl4UJaD5snD8B1AbGdJWsgcJootZkpKFXM1n6Cg/nwCew
         ol7bFG+ziEZe46xK1m515LtX1mKcpuZt0m39GmgO1yKBCwgHoE64F73veMI1I8s7pyYs
         nXrRIyS2XCJiheGBRSxJ4ZE+SBFS/hgnj6v02S7FAdSoFKkOTBrG/OxslvkBf2XvOV4q
         LGbVW5boPt9Q7ANvjbtJl43gk9CKN+1jK578htQQiyWQV74EjSJsu2aPdehrDRwhiwY+
         lK758+WoJLcG4qzQfdrkW+9JV7l9Y1AMSOqsiW26oPZeLEERwor/HgHbhykoOUWjp+bo
         bkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745444208; x=1746049008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bLFs+8/609N5da21p6V3HY8mVyw8mskxF34anzVCFCI=;
        b=rKgzkwd7uerha1LAKByaIQVBkPPXMDlAb6RyZZ615p8lxFcPoNG8fZY/IoVq5Gb1MA
         dm5Hp6+NQ1o34pV+d4zfIvdUAo90+5DIeuNLJT3zyBX5FpX9UtnVSKLkM3iyWUFAjcYS
         +y6bCGzvR2rJWi25FOVVDHcvWFWAsRP3iCdcVp+qzJe0pazBhL0fqG4x3pTz6c4Jxkt3
         sLtxhSIo0pCqtp33sab1YT8Llp+3pfnIIi+U+moTrh9+1u7WIJW5Fs4yGopxHqMmO1Cx
         dAeVjhsqNgZLWrOtJ716XQaXY0oLWES59bJG5F13jVZIBoR9ZkgIsuqxSlWWYZT0kzd5
         pKlA==
X-Gm-Message-State: AOJu0YxdSdO+PZgiMoF8ReCPphh7emP5yazPrxOGHkOF7u5eKQ3PgWAh
	TJjtr7ZX1uk6NNZAesF8GudQkzZ/busd5kVuD8x94aAMJS7HNz3Czh6+4Dmw4Es=
X-Gm-Gg: ASbGncvct2E9Q4UD01iZqVOSl1UYU2MiVEF7YJTm9ciA8Ma48JyFoaGd6YxN/lOWpzF
	UPpX1ZYmOgVcomXoyQFcmaXEiuJzIBueELN1eUIJOM9iofElrsWY2xQzJlCc6okvIT24uvC+a4O
	iBmH5icCnTkkHeEXPPmVLjoT+8zCTGD1VNO1ccXvhNW8uFDp5gYW0wXp1T7XpGtZV3j3/TzHiuo
	s7STiAdVFWnDGKp8Jna6pS61cc+LeYD7RtzgieFtQCzRT5DtTjc0I8O0Im3H6/nKxjlpPNz108c
	LVwSVirHlCBl4yxkE1rWkGzxQuhsVDDRJ0tdQf40u8pfXUozwNs0ny/3Ip0AytOlqaCuSQXyut1
	KEF28NA==
X-Google-Smtp-Source: AGHT+IHX4800B8+8wispo4NFuzLS1LI13Oo5p3SlOPOoJI9EwHInwHF0S8Z/t4cJbeWZDuERNzlMOA==
X-Received: by 2002:a5d:47a9:0:b0:39c:30cd:352c with SMTP id ffacd0b85a97d-3a06cf4b95amr43032f8f.8.1745444208469;
        Wed, 23 Apr 2025 14:36:48 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4c4945sm5473f8f.47.2025.04.23.14.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 14:36:48 -0700 (PDT)
Message-ID: <0e1030b2-0bf1-4fb7-8588-4019d7dfeedf@linaro.org>
Date: Wed, 23 Apr 2025 22:36:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] media: iris: add qcs8300 platform data
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250424-qcs8300_iris-v4-0-6e66ed4f6b71@quicinc.com>
 <20250424-qcs8300_iris-v4-3-6e66ed4f6b71@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250424-qcs8300_iris-v4-3-6e66ed4f6b71@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/04/2025 20:33, Vikash Garodia wrote:
> Add platform data for QCS8300, which has different capabilities compared
> to SM8550. Introduce a QCS8300 header that defines these capabilities
> and fix the order of compat strings.

I'll drop the "and fix the order of compat strings" no need to resend.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

