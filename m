Return-Path: <linux-media+bounces-15004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9E4930C1F
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 01:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7370A1F21ACF
	for <lists+linux-media@lfdr.de>; Sun, 14 Jul 2024 23:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0562413D28C;
	Sun, 14 Jul 2024 23:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IMIdFc4M"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5713273F9
	for <linux-media@vger.kernel.org>; Sun, 14 Jul 2024 23:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720998496; cv=none; b=XdwYgTDqq7mdf3cjiTuZ3NFsyvjSaNok/QuBb9GfiQKpuO7eCJSJr1qYEb1Hw/olThbIwzDI3CGeZvOkXIJcAlC/5P9jVy5QKCOdDK0zEQdR4etsdpen5Wo3vAXKPidR6pZ/RH5Qw9KU+d0GbC2YvsV+4TNsa1avPazKN0L0+rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720998496; c=relaxed/simple;
	bh=OMkN5np2QtCs1JNvE31sSeSC1J+h0T2xqETYrtz/Jvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yn1+mafFwzmiZeNLlEZL/Lgo0oED6zVd8lnB8jM9bllNIIZdzEKVoTySnSV8YZW0wlBjUmVR99oQmfZEeqpJ1LJlgfGjzJadA+p6kz0ehwu6xrJyC29eo2zgo3YUzC4jRSwpF9Dc0kFM8oI4/1dcsSxye6aH1wsx4CysyeHjwdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IMIdFc4M; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-36794da7c96so327954f8f.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jul 2024 16:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720998493; x=1721603293; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=giOaqGkW3gh78EAsAQJqHIlxqObHcBjMGF7SPoyrBgw=;
        b=IMIdFc4MW2Yg6OPSpUgXBa4MZbS6twZtslBhTsBJ/IK001rWc78GjXZPPWUOeHMfem
         NRTkTmWSWoTKQoznW7tU+fXPkOnQPuQzCu/WbSOg71unlJYQo+mcFADiKCfGX5vv6qwi
         gmiFfLImakLREO9JdXat5GPOOPSyrOQkFQVy4WRbDCBkrE2s/4VKmLp9U3cCWYXBM//E
         DHFY3FAAN2d13PTOmtvWc3b+AgUkAtfuO/f7+FZCbX8ouqDizj7YZHVwvO3MUnBnIxm6
         1CXBX/53qgkJAGhy8gq1OXN+Wd9P/wMTBKHgURf2+QbCEvS3ROKrhD3ZqF3BK6lf2r0o
         3PLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720998493; x=1721603293;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=giOaqGkW3gh78EAsAQJqHIlxqObHcBjMGF7SPoyrBgw=;
        b=eIu2wC0LElemVtidobC2SyOv3c2pX7AGPcST2hZ4LXWkn5Lya0Foz/FTFsmY0HOw8V
         hAr4UgTVfvhBKjcXvqPnHtssHqQW5lzPu58hhpZDxaOBqQM80x4rUWG+C4w/dvn7mz8P
         UjdnvQVXE/oTwByaYEeRgn3HVfJFFAA19zMXnThX73Ab4r3Wc4YFk1DpIzaU86EeRlRH
         agcds/+dVaoNRVziHqNWbQvRaEucoUAYv88IU+9oJtEv7XY8Syc8hNCR4t28z06T9PBn
         gkiqq9Uwhm9cp4fiSeNzVAPtGgd7/CO1Fy0Stk1JbMnC65v0FOBNabCpE4e5hMRUJ/+n
         c8fA==
X-Forwarded-Encrypted: i=1; AJvYcCWfWXOze/StaR5JIbQfswCw1W07PdvxDcHB+Ad1sM9tKSZH7rP2A/is5uQd9FYjrdQVtSgwsuUncQaIx2dtUr/cuDMesBMWN8WL3c8=
X-Gm-Message-State: AOJu0YwR4EEb3DqbguuztX7GaBiBuUTfIoLrYaOhlSh2FW6E3gS5wxIf
	iNRMs72fiaxS6K9lFqsPZW4sdriigC1Do9gIpHPDAw52iWmmNB9tN3E1tVLrw35SqO7yvTMEXfW
	Nd2Q=
X-Google-Smtp-Source: AGHT+IHEJtdJ8gx7OOIcLqOTFIx9I0LKxCSaI1ZsOORagte27E0UhFbA3bxbSv/hBaM4nMePlTVBRg==
X-Received: by 2002:a5d:6a52:0:b0:367:8909:197b with SMTP id ffacd0b85a97d-367cead94b9mr10738905f8f.61.1720998493213;
        Sun, 14 Jul 2024 16:08:13 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680daccc55sm4807421f8f.50.2024.07.14.16.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jul 2024 16:08:12 -0700 (PDT)
Message-ID: <dfe6be96-9ec1-4f49-b561-19865bc313c9@linaro.org>
Date: Mon, 15 Jul 2024 00:08:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] PM: domains: add device managed version of
 dev_pm_domain_attach|detach_list()
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <1720763312-13018-1-git-send-email-quic_dikshita@quicinc.com>
 <1720763312-13018-2-git-send-email-quic_dikshita@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1720763312-13018-2-git-send-email-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/07/2024 06:48, Dikshita Agarwal wrote:
> This patch adds the devres-enabled version of dev_pm_domain_attach|detach_list.
> If client drivers use devm_pm_domain_attach_list() to attach the PM domains,
> devm_pm_domain_detach_list() will be invoked implicitly during remove phase.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---

> +	num_pds = dev_pm_domain_attach_list(dev, data, list);
> +
> +	ret = devm_add_action_or_reset(dev, devm_pm_domain_detach_list, (void *)list);

Fairly sure that cast isn't necessary eg

drivers/input/touchscreen/ili210x.c::ili210x_i2c_probe()
drivers/power/supply/axp288_fuel_gauge.c::axp288_fuel_gauge_probe()

---
bod

