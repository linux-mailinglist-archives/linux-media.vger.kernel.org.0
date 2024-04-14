Return-Path: <linux-media+bounces-9246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DF28A424E
	for <lists+linux-media@lfdr.de>; Sun, 14 Apr 2024 14:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5804C1C20A00
	for <lists+linux-media@lfdr.de>; Sun, 14 Apr 2024 12:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CADE2D04E;
	Sun, 14 Apr 2024 12:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kbKnskrI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6D41E53A
	for <linux-media@vger.kernel.org>; Sun, 14 Apr 2024 12:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713098404; cv=none; b=NuV4h/FnXHNM4cOl7unfEbeaxaI/6zKg/a0GbseKK7/4mY1ec9VV4dtILX2cM8xi3LgsyOFtnIl0yeKw8ZNjspFgQlJkiTlovPjaNVUvQvTWJdLD/M1wyCAU9HcjA9hED7b3KqP9yPwyQ/niJLRkwxrTYYERNpvKwtX2tSZ9AL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713098404; c=relaxed/simple;
	bh=BPchb6SuF3YffLRf+8/iXRceh/nK/f1NxS1WB7VSjUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uh6pH9/5g1YulzrwKFDzck3PIyV2yi7aLZWDWcxiysxGuTMHPyKrL8+O/MyC6r3wIcR0epPZmcB+aO9cCIhznUfbBnLs0WJJgCxHkWKnsKCLUR9XmkihG8d2nzhd3DdWL6kpfMBpTJofldpY2Tx4krSVqZQbN/1w6xnTUiXJ+MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kbKnskrI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4155819f710so15636065e9.2
        for <linux-media@vger.kernel.org>; Sun, 14 Apr 2024 05:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713098401; x=1713703201; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6caUmj4J65h/YjIX6IywsH74tzjrKOAOHEmC2FZcC/o=;
        b=kbKnskrIfFSbWafD1c8jnSIXPlRFMr6brtEmO2LQ8WZAtfP8DzIFWMFkptyTpD9556
         24zLebmBGdamcz6vaJTEgFaqpV94yfb+23GqtrMDdwpy+tR31Ydunwz57uVaFiP+86ew
         Kxb+7DWP2sW1slwuF0NXq162INu5R0axivxuLvUoVqm/hsg56YaUypc3REyWt2NX7h+9
         pY7VOx7M9/88aB5oGbqLn5TRpJ65C/cTDAsA1g2tMLGHe0mov7Ah8J2RUTd7x15sQgT0
         zc+8avD9wwCpD5yDm017fzPGd69b7h7R75iXqRtGt3q7IoNjwLowEt4QaUaQ3oXVKkH5
         harA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713098401; x=1713703201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6caUmj4J65h/YjIX6IywsH74tzjrKOAOHEmC2FZcC/o=;
        b=sVj95XU6Ihery9v2SGJyU/RfFMp69NjFDWvC4TSzZh1oJ8BDf9+uHDqfxmMeNIRUc6
         6TX+1XrPRbSK9FFant4XVCqJvqoAGU7ilJWSOZ7SqCI9NExYHIZgsmBEB7VRkwkiV2mg
         2FhODkPzjDMKfUx2oHL4+LIckGuefT+FQT9OaA0skaTisU2fT0UknW1qPV3tqMfta1LZ
         MqQgixGClksXc5KGBzJsXixGTBW2dPtcR4tC7eKJXyCSygmB8bH3LXwHNnvK3SX7n8cR
         UHKZjnAGvnFrkQ9QTj6sn6oLuBHk3w2xRmuub5k4kDLC04I7b3pRuO1x3xb+3BFhVZNB
         3YxA==
X-Forwarded-Encrypted: i=1; AJvYcCUPN7TBpj3FSDEgWm1VLviKhcH7S0Cu+m7cGj2bhnx9PFz3Pdkaq5m0FWBWnvrRqIa8yc0CZn1VHLmKMaZbPlKF7y9lVxWxZf7KcU0=
X-Gm-Message-State: AOJu0Yzdnu15OlasAdta3ilaiUCAl9vl7PDoD88ExZkKJX5fwOLqUNmo
	Vd5eTaGMAq3rAHnWhWbgETEG4ZESCyAQqHpVtkxRq8PcCZhBuC6hkW99nEWNLcM=
X-Google-Smtp-Source: AGHT+IEzKotbasPvGOvaLyaGMQ52XR+G02Abegkqynt4r4bUFHkn5OitwWrQeeo81+f0h4YeQuBFqA==
X-Received: by 2002:a05:600c:1992:b0:418:273a:7688 with SMTP id t18-20020a05600c199200b00418273a7688mr2224806wmq.32.1713098401592;
        Sun, 14 Apr 2024 05:40:01 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c46cc00b00417bab31bd2sm12159302wmo.26.2024.04.14.05.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Apr 2024 05:40:00 -0700 (PDT)
Message-ID: <5c78ad52-524b-4ad7-b149-0e7252abc2ee@linaro.org>
Date: Sun, 14 Apr 2024 13:39:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 RESEND 5/5] venus: pm_helpers: Use
 dev_pm_genpd_set_hwmode to switch GDSC mode on V6
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>
References: <20240413152013.22307-1-quic_jkona@quicinc.com>
 <20240413152013.22307-6-quic_jkona@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240413152013.22307-6-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/04/2024 16:20, Jagadeesh Kona wrote:
> The Venus driver requires vcodec GDSC to be ON in SW mode for clock
> operations and move it back to HW mode to gain power benefits. Earlier,
> as there is no interface to switch the GDSC mode from GenPD framework,
> the GDSC is moved to HW control mode as part of GDSC enable callback and
> venus driver is writing to its POWER_CONTROL register to keep the GDSC ON
> from SW whereever required. But the POWER_CONTROL register addresses
> are not constant and can vary across the variants.
> 
> Also as per the HW recommendation, the GDSC mode switching needs to be
> controlled from respective GDSC register and this is a uniform approach
> across all the targets. Hence use dev_pm_genpd_set_hwmode() API which
> controls GDSC mode switching using its respective GDSC register.
> 
> In venus V6 variants, the vcodec gdsc gets enabled in SW mode by default
> with new HW_CTRL_TRIGGER flag and there is no need to switch it to SW
> mode again after enable, hence add check to avoid switching gdsc to SW mode
> again after gdsc enable. Similarly add check to avoid switching GDSC to HW
> mode before disabling the GDSC, so GDSC gets enabled in SW mode in the next
> enable.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

When I tested this out on sm8250 a few months ago it was broken.

I don't quite see in your commit logs, how the breakage was addressed.

Can you provide some details ?

---
bod


