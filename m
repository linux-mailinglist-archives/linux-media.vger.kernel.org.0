Return-Path: <linux-media+bounces-50460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB71D12766
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 13:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7EC63047FFB
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 12:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D8435771A;
	Mon, 12 Jan 2026 12:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rbZ4bA3Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ADA2F5A1A
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 12:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768219645; cv=none; b=pSm13L0jU28QFW2OGf8YhUnRrHgx2AHqPwjQm8Dz5Fa2dvy8OUw8p6qZlk2ZaJCPmmVw9MqUFjcHf7D7YoKmdXHVwGcoSIoiA6L/SoSHEhWPLJ48cJ00QEh4hxK5QMfJTMrumbZCwpOxpiNGgktEWlOzolaX3BRyM68UoClYJ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768219645; c=relaxed/simple;
	bh=bmEIvyVsr6DVsM5nUAfh2W2TpABYdDSi08tkrELKVNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gl+uVO4tx7/CIGR+osJMgTTO6CKCN4PFNjlEBtG+wxxDTG70kcawa0J6cn+mTPHakVUENs8Vb7mXLNe+vcieXXKx8VQ3Sm+fPRssOUVgunbRjgs4ZOYwDIWHZYVqKNLbLvixYt6QiysHEpRlX49SueZdywjEXqnJnjREdVxreOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rbZ4bA3Q; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47d3ffa5f33so28469845e9.2
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 04:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768219642; x=1768824442; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cyFmiTOwx9WydPZqcUGcsWNSpaGu3ePZ7mQ4/4dnfXw=;
        b=rbZ4bA3Quywl2lJ4jnkrGU6zeJ/jZIlvpYC22sC5cvlExxfGTfZnWupLynd3ce0dWs
         +Zx+DxzJiUt2kGMxm21U08EloLvh7o+RDhdJhDYzqKnO1vuWv/r/2U+FPuNQ+iB+dD+l
         V8SoDHWPTiTYriIVKd7wn0cAIok1KI1Ge7uNsuxXbxUzKx4lTVzAKnOki615tBX3Q3vB
         dQW2RWeyQsaJJZ9Fic8HMju3Q6WJh+QKGiAR+diBPh2w+3Pk1CnYKmKFg66JslKvE3NT
         991IwReeC8pKGDroEzjVzpiK0LcnC6kpSHPA/eMVNK9OLg36aNa43SzjL5dfs6qVo/HK
         2AKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768219642; x=1768824442;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cyFmiTOwx9WydPZqcUGcsWNSpaGu3ePZ7mQ4/4dnfXw=;
        b=UMvShpQY9HQOx0OOkQ/N+QT7Tc20fFA650n1ZPxGvGtwnR8WgC6LdZZ4+jtBnn/Mau
         9fzB7FZbKO/dCww7Nn868iM87C9s+3MV0B7LV+0M9hWqar/mkSTC6nwGJks6+Lu8IsKI
         YBraBd8B6y/adw0inWZnm/LIicxEgv74zRxAJ0KtS2q+gGln7Byrt5t+N5igsh9OJBRP
         f4F4rcre6HJxw4LGIx14ptMKAupJBbnvkxFylsW1kilca6I6Z53ooqI5UCw9rbZ+zzVF
         xwCWSyadsLMYOmGvN6ah6PEsyFDD6+j+SCj0uC8+EYg7hz6cmWd7+1C6BzudMdYUpzBR
         +fUA==
X-Gm-Message-State: AOJu0YweH8QO4Z3bKLMulqd61z9MoIR9UsjrdeM9poZEiBaFYaNYssLP
	A27EvnNu5ArirsFWzbXz9C1BNCNPYjFo2M0hGMzlshl7LligFfH089HJLRXWL+Ito0c=
X-Gm-Gg: AY/fxX6PJ02lfkc1JYEqsvLPJ7ta6d0rSgU1sPQYuFkTHpsuSpBpD8azzI77jaHHqdL
	zn9EwsNVFyfNjZsvaqxowrAC3SS3ZaQ9wMGFhc5d/A5POj3uBZKc52tmn+AGb1EPa4LCQ1DMyrl
	T6SJNAHqP7YkznyUo0PEDPTH9apbTm9VD5/qcg1tuGFYkcqJPRzxsCU4N1zN/a7rKDfZrDafLnt
	O/psezKWbe394ljDhKV3PvvHRxWp18QHB2y8ux2RbFSxduFYSXWkwnVTZ0RzQHprDuJJB4hIhXp
	BBKr1XR58wNuJqu/Ksqq31+SAE0ASCQ9zfVl8YXtgGG8+ON6StdLs6YUg+jYemYrVYS2ijyDbwN
	+lN9XU2gNLM3KOb4dW9b2qjI5LUbouTvoo4jmfCia1pQzIb0XyE2BAPsbo28jUT36VOjRGoyNzj
	00Ut+i+m9zmoU492Y2nhPCr4MjmkEPnw34WL914OH3WsVst+7hzQ3t
X-Google-Smtp-Source: AGHT+IGRc0EV50kscbKyU9XViNWiLVNiv77Je1cCMktwdnW0YTBJo1cj4/Vq0LD/5Xpo0+DbEm8dbg==
X-Received: by 2002:a05:600c:3112:b0:477:7f4a:44b4 with SMTP id 5b1f17b1804b1-47d84b26d08mr189479945e9.1.1768219642142;
        Mon, 12 Jan 2026 04:07:22 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f41f5e0sm344704455e9.8.2026.01.12.04.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 04:07:21 -0800 (PST)
Message-ID: <f574665b-48e9-4bb1-8c8c-95ff0f7449f7@linaro.org>
Date: Mon, 12 Jan 2026 12:07:20 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/5] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260112-kaanapali-camss-v11-0-81e4f59a5d08@oss.qualcomm.com>
 <20260112-kaanapali-camss-v11-3-81e4f59a5d08@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260112-kaanapali-camss-v11-3-81e4f59a5d08@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/01/2026 09:02, Hangxiang Ma wrote:
> Add more detailed resource information for CSIPHY devices in the camss
> driver along with the support for v2.4.0 in the 2 phase CSIPHY driver
> that is responsible for the PHY lane register configuration, module
> reset and interrupt handling.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---


> +static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = { "vdd-csiphy0-0p8", "vdd-csiphy0-1p2" },

Please sync up with Wenmeng's patch:

https://lore.kernel.org/linux-arm-msm/20251114082649.4240-1-wenmeng.liu@oss.qualcomm.com/

---
bod

