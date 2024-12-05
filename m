Return-Path: <linux-media+bounces-22695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B889E51CA
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 11:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DCEB283115
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 10:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45B21DF251;
	Thu,  5 Dec 2024 09:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yd1WbUu3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2BD1DF252
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 09:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733392401; cv=none; b=mj2KF00ew0JmqXuznuUwzRKCgQIs+305ujonwqdumLwR3Qn0AUy5mt1OOkKTmJha61coV3TuEqC/NwbFBivQZgVSo5+A93ZdTVCoayWrvOeW1gB7aHPG/0X1ZT1w4a0GBSPrxmkXEY4+0xGQF1fI7a8wcgIeE0VTc9Jon1oPCwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733392401; c=relaxed/simple;
	bh=fcUD1G+KSAjumj93FjMt++z+am/RSCtRwF7W26pQ08g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ciMT9lLRTtoM6EE0BArZEMf6lPpZNPEfeXkQkUHKP4cy2bau1INj58uECkvI1fv8YOm1RCimxCqvbfYXtMQWsHthOxrgiiCxHW3b6SCF1y6tdwbUCZdgWG8thRa8C+j9Mcohe7DsSL+7sMnkfdyQR8rFpGz1eQIlTQoleNfqXpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yd1WbUu3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso609104f8f.1
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 01:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733392397; x=1733997197; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C8UuJPAg4uzKsmRkl80xAfQvVQX+ZS1np+zrvtyOjdU=;
        b=yd1WbUu3Zb/E8mN5vYA9A3FoobZHzLvOc1usZV+ZQ6SlgHg7HQYK7lgifqpRTh7QOu
         FGoxfxFkIRnbxZrOzsVdRYBS9aJZdpCgsQUjYW2NfnZYQmCH30zj1qX+bTgc5aZIwn8T
         rnTPAL4AiVpXRfDDF+RgEzq0wiopc7MVq+1jb3QIzVnJr7Q+C56XGBtGAR496oSRz9Wi
         VYhZzvNiZXbKFcsFlyqv0Xy5PG5hyPTdgAomRvCh7ndZbQK/EmKczTlyga59iBCZmH5H
         AFW28ApPo+n7Bsje/daRcCuFNSxMkdbEsyhpJQdTto3OM4iNOaScCpNErLGINb43DFrL
         ZO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733392397; x=1733997197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C8UuJPAg4uzKsmRkl80xAfQvVQX+ZS1np+zrvtyOjdU=;
        b=McCNKyzlEKzV2wa1tMfGtwgLmPJ1dHwLghgNPVisRPVcvUyvJ9HdTIvAbmRZy4itJs
         ylM4lNjFLqkaB94ZQaQr0y51mp8dIXXk5fnc13I+Gz+raY2nN5xb3JTAo7C/sTH0xt67
         aMwXjJRxmUiLRH0gBuc0g8zlngsdvzahGDzUDY6FB+zzA9KZfB48aMAnFVZBFJKtQbAB
         hvO5xb3Ob0vEiWqLou1cWIidMmr1ifNz16F1YLLKre0aLPduwQgpwACDNa0v7b5ET5Gh
         exlMxO01XTuS2ohDBY2dSndYzZjRPVYxpp7QXiqdhLQnCn+dybVKyGvNDgC49jLGzQFf
         qEUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6FSzyHN16tW52e56R82D1cE+AuFFMYY50kceg+1t+1uAwGO7lrQNf/sFYxuDJp8TUDTB494sHkCk8Hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwodB4MBejUoFtwp+mYKAE1WA6UxamvQ0TtdDyrzsdzFWp80Dru
	mYA2V7pVu6w4T2RAezWkLZ43KIM9zKOFSfYkVnVe+RD+7KydtvXN252Vkh45+Eg=
X-Gm-Gg: ASbGncswtiIzCQqEDTNUDxepfvCOHb/i0JA25hnef2LqpQVrI8gfe0cN55e8312ziKU
	RoIU7/m6MDbK0sdRrzPBvxNPtH/z5J1wpgKl1TGSnFTwaY6P42x/eCPaXHIQ0LD6gnjqKMmxbpJ
	qIATat8fZ/mL8qusF6Y+pfnva60gpaDpwzyzvEX7uMipiPNE/Y+idAG7+iJ7Ixnrgu8DyNtbPFv
	OykWJpvcaO+PNvKFimnEKYxNu1FQiI75XBSkBmms44aq52V6aLC7nD3MBZybJU=
X-Google-Smtp-Source: AGHT+IEVsK2hb41ndk08DsAN+R8x9yzNiSD3Xnxn/d42LtoWyp9X9Q3Lvp8+NitADR+4PPEFGgGGsA==
X-Received: by 2002:a05:6000:4009:b0:385:f909:eb2c with SMTP id ffacd0b85a97d-385fd43556bmr9734740f8f.38.1733392397068;
        Thu, 05 Dec 2024 01:53:17 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861ecf4087sm1529194f8f.5.2024.12.05.01.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 01:53:16 -0800 (PST)
Message-ID: <02a2660f-b577-42b5-9c3d-4fb0429d8c67@linaro.org>
Date: Thu, 5 Dec 2024 09:53:15 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] media: dt-bindings: Add qcom,sc7280-camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241204100003.300123-1-quic_vikramsa@quicinc.com>
 <20241204100003.300123-2-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241204100003.300123-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2024 09:59, Vikram Sharma wrote:
> Add bindings for qcom,sc7280-camss to support the camera subsystem
> on the SC7280 platform.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

