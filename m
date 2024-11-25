Return-Path: <linux-media+bounces-22001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6419D87BF
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 15:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3EE928B433
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 14:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14AD71B21AB;
	Mon, 25 Nov 2024 14:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AVNaiX5U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27761B0F3F
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 14:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732544303; cv=none; b=gV3rUvSddaUvZGxEkdf0CiGrG3qhcN4NtcU3uRelLZKQ9wKEwtCa35amKAiLd2cc5yFx0pFXzhWSIe/xkTa/+1fJ6IB8w3hT8WkCZs7mGO3nVx9R0SMrmxYpGfdIhqJ2JZH5fVL9v3I7z0vKsomk6uzVKd7vLoFPbsi7qaQAI7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732544303; c=relaxed/simple;
	bh=8gTbO0LZfixjkq6uUtLon7DMBOv2a37UPXCjBZJ2iZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cIXOM7hC2j4XNITMoBVfaWfpgq3NqCwIDX0IGgFouqyQPGb9GwBJsk4QEGLPvh6+43I0O3cRjMdN82D1AKXU5PgTe+6Db2zOpiMo4iqFJXjKcUNO2scU+rRn6+Fl1E/lH1GWfgCSLoQ/hIlJ43ik3MOb7gFWFZ6jIUc6dOZFpS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AVNaiX5U; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-431695fa98bso38436945e9.3
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 06:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732544300; x=1733149100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4UZHmb0OeUd+8GPshNVOwzcpmIxly7Jn8Ce9CCCQHOg=;
        b=AVNaiX5UtMhyLsFr8D8SfQOlwaLmWvccxYpy2xAP2//Ahs267pSpeEbLlWDqrmpAgP
         5cdsgTZSxVkwPAKrheDdv0DLWLS+m1EWXPDPsV9yA2rQ8di3wepVhn3hxjsAe5r0OwPc
         Z4aw09Le5MRRNyqUW3MOiI9kuSuIkf8yOZSQEj9RqEiU2O/d6B2H3Cb8r1qFqd8tbeZ5
         V/s1LH7VNK1nrVBbm0voae0WxglKf1fYVT3C7GSvyulbcEQMxUD6fhhOnCea+Mi/UZfn
         +66Wb43ii2tTiSd8b8V2itoWbeYtB2JDJutXXUlTs7hnNZjal/g2t6ZPUULYUobIz5bh
         41Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732544300; x=1733149100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4UZHmb0OeUd+8GPshNVOwzcpmIxly7Jn8Ce9CCCQHOg=;
        b=d1NN3ubNr2i7O5NnNYdeGwjVVQ0Tum+95F2/cXGK82FeQypy7m9hF7dASx29DyLn61
         OI/tbvPC3UQ5plQSCgIbGufquP2LCOJVCdgb2dPjG1kbHVlu379X44uAAQQeUmS8Jh0D
         H8FC1pUQbji9GYfSQRy2ISr3a6XscpMlUZ6MusKdA+H/Aik3Nj8T/dFnOjwRuwhFci9M
         geWwfFYHJYeaciAwSBG2VeLU3dnyHaS227KwXKbcAGOLvVVx6s/A4c30Sxd53ftlfgK5
         wtfD3unZ1vpSSW2rrXzYNTOLwMLal2DV1MkT+7WFJPceRBbFYq1dpckt2l6WIS1/bE6m
         wURw==
X-Forwarded-Encrypted: i=1; AJvYcCWZGnqN7gELE3lnIiBweQezMoBSu/V8FXmzaQXa9TW2PxOskEq96NfTJLQ6Bm6qnX+ioZyELqddCR40dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxjlj/BmB9R/8ALvtUnr/5OCZ7R9Ve6EMfCro4esR/+Ow8AYJ4
	c8As1o7Q79NFIdk+fK8XUU/bJlySaWZqItBDN+cPGxFUX2aGgeD0m8mWX8mWAho=
X-Gm-Gg: ASbGncvV7yX7kTfCefNDx/v6EVdPQRPEDW1t2J4r7yZnu1JVGJ+P34BnVS9rA5QG77A
	Q90ZsLEJDdY2U3TqRNGd5UuGspi/dEZArYhbPd8GD5qxbBO80nY4z6FeZHnyxxFwI1RqletSxA2
	MxygjAUIOwQHemjwMTBblqBto8iJZL/9XqZoUIMJR4xufBoPjKDgOCXecNnDwrdfyTuswTxFi4H
	EK8z323pzqTjHfLG3OcCKfS7aYBxowr6gxHRJcFGdLCK49H1cUSkK2JwuNAL70=
X-Google-Smtp-Source: AGHT+IHqIIihdF3fumt0wugdqbgPyd4zHYslJ9WQYwGzPsEPSKNIXwv+JbkUTAaRMXwekVdAEkvLDQ==
X-Received: by 2002:a05:600c:548d:b0:433:c463:62dd with SMTP id 5b1f17b1804b1-433ce4e73camr111806745e9.27.1732544300035;
        Mon, 25 Nov 2024 06:18:20 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349fba472asm36556345e9.17.2024.11.25.06.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 06:18:19 -0800 (PST)
Message-ID: <0234971e-9029-4371-a0aa-7da835591351@linaro.org>
Date: Mon, 25 Nov 2024 14:18:17 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] media: dt-bindings: Add qcom,sc7280-camss
To: Rob Herring <robh@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>
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
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241115165031.GA3344225-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/11/2024 16:50, Rob Herring wrote:
>> +  reg:
>> +    maxItems: 15
>> +
>> +  reg-names:
> reg and reg-names go after 'compatible'. See the documented ordering.

Rob, the documented ordering pertains to the dtsi and examples not to 
the yaml right ?

---
bod

