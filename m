Return-Path: <linux-media+bounces-10386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 645128B6602
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 01:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CEC91C21B30
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 23:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A10129E74;
	Mon, 29 Apr 2024 23:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zWWhImlz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C1377F10
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 23:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714431997; cv=none; b=jijH6+tU7203P3wKgjZfCutHfL7THinGa+rW2gJfat08CwtD4ex8WQnJsJt/9rO72zEUox5PWYdfJrGx9f9MXy6Vwz1cU45MuCFORWxC0sdyefnesIKG1dHWjBbv6nd95uWB9how4YRsSHQ5bUIL/gz2RfV7OrT/8zKKo8VGho4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714431997; c=relaxed/simple;
	bh=oCpzsnULxIgSn6f6NyIWzCzj4/D2x7S7p/X3jeHAGOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2VdQW1DgqAfd9sENOsZNrQOYK5jP8xRTWVWQA2417bSZH9MrZdAJvqAm2H/QksuOc/vHS1rxatGOv84zdjpChMt9ugiT2RAzc9Kyr2McNXjtQJLwTpsPO15FxZMg144iyMlO7mC1xN4QxPN0xBUthSWOtbKmbrI3AdFDK8QG0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zWWhImlz; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-343d2b20c4bso3442040f8f.2
        for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 16:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714431994; x=1715036794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y9Wc1VRWdSj/kw6OxjVRGGw4/2n20BQdC0iB/qkj8dg=;
        b=zWWhImlzXZjQmWla9wIXBCooFCJDbmLFMy7op2Wc8hoDsHj3i/qCfnrfvvOx8MM14Y
         6ayFOyZAWWEYM8FlRLy4gbVhQJGibdwPo5lINr88DZg4s+QcYX7NhBl91RZlq3VI1cu7
         8PIAf6mwVKzi7/AcUcUlXxqqRC9dKI7Lm4HKKWuLgnKC4tsobq8YsYYf4KUw6rv70Ebf
         ORhItLOh8nwLOLr/ZzkQGQAwqEw3tTUkwtrmeUWLEKHQJfEzMNO6rteu+b6lqsP5kvz8
         i0oS/VGko/IwLY2DsifvcqicxcZ4nw3OolLb7SVKzRaNoaM1aMGkMI81PqpHNyQoWB39
         miNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714431994; x=1715036794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9Wc1VRWdSj/kw6OxjVRGGw4/2n20BQdC0iB/qkj8dg=;
        b=XODin3oqdM3e1BA0uHLRfnlgHiLDTYY26iM2s2CVxDyjXemb9m0+FlckP0KUgokXOg
         x0IzLAyda8ded+85roiHjjv+s/fsPxeJpGbj86WaAINWBnZdwI6t5+g/9xps0EocpEsk
         NVwPPaOhPycyex4g/XpIO+/brwBRPLDrb3Wo7+Fi0dFbUnpdDRO9DmqEmHSFfOFSL1uI
         VT5OwoJgwdkFcQezOoqTvHBxCTOU1UGQ3+RnPfxGZ6sjEi9ueZ4owu9yyQJKH7cM0TfR
         hz1MxRjpzp1ZdywAQZWyzQxFz1WKV/EuxjvhiOHWC/N6aZt4Li0TBhoIkFvB0XwDtXPg
         tDMg==
X-Forwarded-Encrypted: i=1; AJvYcCXIyoG0kMgPiwdovs/WhvXIaRMq5rb10LDwRFpsUfJMW6ctQFt4Ol8zW2I9AiK+lUUWSw2xNZ74AMq/XMMrBAHm5xpLxfFZSDvLhRY=
X-Gm-Message-State: AOJu0YyXB8ruAJmr6IVKSDO4AJuHO28uBbPzcIeOlPreAmuXz13H05dG
	wyM2pY/94LnvoBaiFCfiIjzo8+mHYgB7u26eQC77qSUurm92RTx7NSrEikYeZ4w=
X-Google-Smtp-Source: AGHT+IHCWKrgaTKGrhkqF26FTfzxhgQB+moXIvDSb8J8J/IOshycaSS5Xrsj1BsiFf+7Gnj7wtoHtg==
X-Received: by 2002:adf:ee0c:0:b0:34a:2a90:c45 with SMTP id y12-20020adfee0c000000b0034a2a900c45mr8641646wrn.31.1714431993724;
        Mon, 29 Apr 2024 16:06:33 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id r30-20020adfb1de000000b00343e392829dsm30873168wra.97.2024.04.29.16.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 16:06:33 -0700 (PDT)
Message-ID: <32b3c158-8709-42c0-9e6e-81ccdd0e7ab5@linaro.org>
Date: Tue, 30 Apr 2024 00:06:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: media: add qcom,msm8998-venus
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <2b21b160-a530-486a-9404-c5bf8863ffed@freebox.fr>
 <4ea494cf-134e-4380-aea1-4c166a626561@freebox.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <4ea494cf-134e-4380-aea1-4c166a626561@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/2024 17:15, Marc Gonzalez wrote:
> Add YAML binding for Qualcomm MSM8998 Venus HW video encode and decode.
> (Based on qcom,msm8996-venus.yaml)
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>   Documentation/devicetree/bindings/media/qcom,msm8998-venus.yaml | 155 ++++++++++++++++++++++++++++
>   1 file changed, 155 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8998-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8998-venus.yaml
> new file mode 100644
> index 0000000000000..86a20954cb354
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8998-venus.yaml
> @@ -0,0 +1,155 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,msm8998-venus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm MSM8998 Venus video encode and decode accelerators
> +
> +maintainers:
> +  - Stanimir Varbanov <stanimir.varbanov@linaro.org>

You should list yourself as maintaining a file you add upstream, plus 
I'm pretty sure that's not Stan's current email address.

However, looking at this I think you should just add a new compat to 
Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml since 
the rest of the file is 1:1

---
bod

