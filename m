Return-Path: <linux-media+bounces-27510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECF8A4E83E
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 18:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B2A119C66D0
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 17:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5CB294EFA;
	Tue,  4 Mar 2025 16:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nuur6wkI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81604294EDA
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 16:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741106972; cv=none; b=YmMWiMclwNb5ldJwhacHw96JdYKqi+D0/I6l2p1UYA92ICoMPnhk+W41rvGp5vCA3vJTkt3KggNNGpyrTU6vadralsyFO86en9RasD/+njsT/4XNTa9f8HyxFYTED8VqmbdESzrva9Tbl7tTsqbmFXmcECl1OHDJuVES9Hrp+Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741106972; c=relaxed/simple;
	bh=9Z5yiF0KSO+NPcolTUzxks0Yc/uCbphDTbGq4JaB8Vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VzdJLoEEC9XTKqJyZUngoyN03Z48WctAhiY/eKCwKuXt64H03+TFmwI5fCgR8cOqEQl0AZQ7quxuoz9EPHnyxt4WnvMLm5Aw+RoGFYBYdlSGZFaCjbpAltKdZGhml69m+AcojBQDz8r0CoL9KKrOsfxtCucPG13Yrq4YRQmbvV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nuur6wkI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43bc0b8520cso16153625e9.1
        for <linux-media@vger.kernel.org>; Tue, 04 Mar 2025 08:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741106969; x=1741711769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zouj1Hp3SfYIrOLTqQLJUUDe/x9qYEs9R8lkvyWGV2M=;
        b=Nuur6wkIzXEfa4bQLuv4P1LuUykaEFULdZQ0hjYoK1XXBIxOjLbbNzh7jqlOlyObI9
         D7XFMipUXdbJ0tPH7Z8L1TgbSIwDimsGvZEaQT1px9KXuSp5Dj964IqB2+oIxuURTdNG
         jiAzaQY5eGkr4Og0Z3LmcmgQO+ZuE3wwvPS8bZrUg+sZ80BeB5KoionPzfeyyMUwpnRi
         EGwAvkqy39zmf/UNGyIJ/tBDCLfVhDsT9flZI8llVH7qBpCIWTqEeebzTdyReYvz2zNH
         cYFBqms1GoR1Wzx1q/pRCtRNGopLuK5JUa3gVklLO6TG9ZeJ4iXZCYchisIm2wEYf+b+
         Vqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741106969; x=1741711769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zouj1Hp3SfYIrOLTqQLJUUDe/x9qYEs9R8lkvyWGV2M=;
        b=tssQf6PvYw83+y+mBzZUhggVl7AiuwmTSq07gjdSM8AX9lI4vHbIRmATU9bqgvXDmQ
         eRr8eNJTcPwN5PbiyxIcmfcv5yjZbqM1LZbpYoWmHscoGwGUIeyfJZwtXcnwbmDIgXZy
         ugfdiTly5lqUPPt8XCBcJBFKWgzgez3SZXir48wNEmv6hdmSwXWyEQ5JPkiUawCWxOgP
         8x92Khx1zQ4nhjCVCo06AEsvMEhs/+DPah4LYwCC8ONNkkqI6Xi9ytzrb7HXDWMId8I7
         2RMi6I2CQuPp6pIN5FF2rl7NTOyI0uPH0FFixKPpGlbyutlUKPt7X2QwrfF8D4r9Pg5V
         mTwg==
X-Gm-Message-State: AOJu0YyPSR/kpCJO4ZXy01FgOB6Hxam1VQa2Db/d38JwHqcEvDrh5gYG
	3xjCq3Ve9P43GFf4wmlJSH84Az5HKmFLkpKKK7cWgO0/PB4g1OFK1Ox1pqui82U=
X-Gm-Gg: ASbGncsuyqbxRFyqPdlC27qrSRR0MvbXI+fvaNBnVPzovUATvk5w2iUs/OptydOoSaP
	NFjaRFSTGBi1kWgHT1kyH1GvvyLKPEhVe5hFCghjTM00cxNpOAGh6q0TOMpuYNIybe70PGuXzUT
	tgZ8FuWNbfuiKrsUAL/1rk1yX3Yv/Q05BhnBAV6SeuTjAqJVO3OPRZ2ma8GmET6PtDXWVj4i4Ro
	/y+aAXmJ5sbMddHiueg1S/Wv5Ywdza3Nrxk1I+WMkOl0ySOih5IxAbs67YMYafNf8yRQS/tDDbC
	Vwz/LhuHdtCltmBTS6m/xZusERYtAooaQqVywnoeAMUDpTN8kvOHYVz57bBQiMv7ERmqP0nZVsb
	7GC5O0xksxA==
X-Google-Smtp-Source: AGHT+IHnEjomaLJcNubPCqgScHWOFRvf7a69WTdmkPmuw90OYKp/8j177FQoZiJgfCYxKTwR20hDgA==
X-Received: by 2002:a05:600c:1d9e:b0:43b:c309:da40 with SMTP id 5b1f17b1804b1-43bc309dba5mr62613095e9.4.1741106968691;
        Tue, 04 Mar 2025 08:49:28 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b7a28b285sm204943155e9.33.2025.03.04.08.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 08:49:28 -0800 (PST)
Message-ID: <10ab5c5a-68c5-4f5c-9484-a5a8fc420ad3@linaro.org>
Date: Tue, 4 Mar 2025 16:49:27 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: sc8280xp: Add Venus
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
 <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-7-279c7ea55493@linaro.org>
 <77475c23-c173-4512-b257-d7b01fa2054d@kernel.org>
 <d4d658a3-e276-4e0f-ae71-5efd077e8a12@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d4d658a3-e276-4e0f-ae71-5efd077e8a12@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/03/2025 16:41, Konrad Dybcio wrote:
> On 4.03.2025 3:02 PM, Krzysztof Kozlowski wrote:
>> On 04/03/2025 14:07, Bryan O'Donoghue wrote:
>>> From: Konrad Dybcio <konradybcio@kernel.org>
>>>
>>> Add the required nodes to enable Venus on sc8280xp.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>>
>> SoB and From do not match.
> 
> .mailmap breaks this
> 
> I previously worked around this by kicking the relevant entries from the
> file, but that in turn broke base-commit in the cover letter
> 
> Konrad

OK with you if I switch your email to kernel.org here ?

---
bod

