Return-Path: <linux-media+bounces-22009-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D35F9D8819
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 15:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 767B91660A0
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 14:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFC01B0F36;
	Mon, 25 Nov 2024 14:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CR+cQKHE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E6918F2DB
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 14:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732545177; cv=none; b=mkjYK7IeibHkBGDecU8ULJIQzRXPt4Vo9AwxpvDRsec7KGTEVxB+zqQwqEdZFZtqPr5quvcNW1tzmIUCNqXnDbWlbu3kaO2alSs/hf4qC7O/BVNedO9CmQly9bsG2VaKvqKVhIvswrFg3Om83eWY/6m6NcSZn3JVIwLtMva3qrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732545177; c=relaxed/simple;
	bh=HgNXDurU1Y6/iVHhxRcPHbCNyKwUgMFho7p6ih9pzg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PA9lx6Ovek7eVGY7RDXnaoxBtnCJeoTG/oSQXM0VUXZ6ewlJ1+kh3hgfIBIE6yCd5RGvJ9/s2S2XFEnTgZAIP8TNkukwj8LogK/DhK7UZv4PTr75TQeAf5mIR27K4HypVcTsuckqgGtWWs6D/gbgfTBdwQxYoIPN7mBVPEOufPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CR+cQKHE; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3824aef833bso3285019f8f.0
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 06:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732545175; x=1733149975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J+Y0HXpyKgeDtrQhAYRPzCv1yrc8XspvZqRwVQTSQoQ=;
        b=CR+cQKHEDl89HnHZ3BI77rrrIKLQCINdHlBd0ZbnE+T2FD60yysJ6wd558KnT1+4aV
         qnVrHdvJQWfF3PjyQeb6ePZPy3iZhNIXPtrky4A2neJijJjT8kgz8H8D6ZW5GQsZ2t6a
         1YMEpA2pyOFzE1N/tb2fXtRSM2VP1gJQFw3xgEglI4vez2OKczj8RqmGtJXXcBbYEHxZ
         91vkhGCGmLREIa8Lim43LF4pZDCPaPVvPSx0dY8MXJBekG9zlWvsnEnoq6SVONEgZckp
         Rg3JNWcFQPZCWY2UMLbuIpXTXveinDrDbm6WiDobJKjNLNUd0deAzAa+2zRUPUjRgrHe
         LNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732545175; x=1733149975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J+Y0HXpyKgeDtrQhAYRPzCv1yrc8XspvZqRwVQTSQoQ=;
        b=HUyKgKy09a1BkLRJftG24V+16yKF73i2/MUS2CrvAhVZT/P0tK+dg2fJsLbVyMtT/D
         KA9fSaSseLpqCfO9FfKH3RrgfaZ49alLqDADQSYKXFvU6k5yxoaRNYLrVgaLkh3UKHDQ
         Qd21snmdMFYVVM3DX1HZua6rkiSzdCVSsn1ZOkQG4hwqHhBSVmRvwB0OrmGOkC5OJiZj
         ekDJouOkrNccxu7ySB+OypfPGjMen7iEVPD2qqJE8XrTwoyFIDToP0GeJQcsrkriaxH+
         ono5ok/DAR0YRmwGGLHrm9Qt/P0x6ZKuzz8Mb+rHG3DwqJ3eWXb/7Vi1QiggS2IywF+n
         fqGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnKfx1ueFTnyvr6ppbgbQzvwvafw8VEY9XAn2x1KXH5yyW3ha+1B6V3RpwSQ8U+KWPSFcv02pl1QtMjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrhw2eEI+mWuztwHq1ELz8OGtjcsQnbPMT0NvOhL/tkE9JY12j
	+nHYqhPveRTjoDP7NBlBv+/2l3EKu543j/fsvB/QUxmlvGRqFQeqT7mYSFqCyK4=
X-Gm-Gg: ASbGncuUkdwcV8dYCFU6k7+g1mpTm++umOAbJrlZ3s4CjEO9jSdwKWGKRjsvaavXFZW
	lpitQTLo5LFiNDxTEuT9pRpfjldAoWHis4OTW40dFFRS5YHWvD28u3thseYxcTJeIJAj+88gOGD
	LeEU1ExmPYdGN/fl2pXgXK73QV0J+p7UY6efWxcZfh52+/ixXX9HtCYQbpfyGIWiBXvJhTeogdP
	irohM8oiCEUlXFiAVzw2oPY0WYGid3WxSKFNq0+Yw9gA0NchTxIYRwoCoF04aw=
X-Google-Smtp-Source: AGHT+IHLpdEqvHkFDrmf7iYo+O6NcGKzmFklgROp89/Mv/+qWdOXbu1wuq8DK5pShhF7HXcnisT0Zg==
X-Received: by 2002:a5d:588f:0:b0:382:4851:46d2 with SMTP id ffacd0b85a97d-38260b45c95mr12173123f8f.1.1732545174756;
        Mon, 25 Nov 2024 06:32:54 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fb36612sm10492934f8f.59.2024.11.25.06.32.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 06:32:54 -0800 (PST)
Message-ID: <7876986a-0164-4004-a8c7-43439e30fcbb@linaro.org>
Date: Mon, 25 Nov 2024 14:32:53 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] media: dt-bindings: Add qcom,sc7280-camss
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241112173032.2740119-1-quic_vikramsa@quicinc.com>
 <20241112173032.2740119-2-quic_vikramsa@quicinc.com>
 <20241115165031.GA3344225-robh@kernel.org>
 <0234971e-9029-4371-a0aa-7da835591351@linaro.org>
 <f1ff6df1-89f3-4e63-bea7-2404fefe81f8@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f1ff6df1-89f3-4e63-bea7-2404fefe81f8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/11/2024 14:30, Krzysztof Kozlowski wrote:
> On 25/11/2024 15:18, Bryan O'Donoghue wrote:
>> On 15/11/2024 16:50, Rob Herring wrote:
>>>> +  reg:
>>>> +    maxItems: 15
>>>> +
>>>> +  reg-names:
>>> reg and reg-names go after 'compatible'. See the documented ordering.
>>
>> Rob, the documented ordering pertains to the dtsi and examples not to
>> the yaml right ?
> 
> 
> The coding style indeed is explicit that it applies to DTS, however same
> rules apply to the bindings as well.  I just did not cover bindings when
> writing DTS coding style.
> 
> Best regards,
> Krzysztof

ACK, thanks for the clarification.

---
bod

