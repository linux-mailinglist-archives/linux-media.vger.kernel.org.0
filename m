Return-Path: <linux-media+bounces-48623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B47CB58D5
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 11:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A764A301819F
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 10:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECFD306480;
	Thu, 11 Dec 2025 10:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="taRiryPZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C0F2DC333
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765450073; cv=none; b=soaZ6v23d0TUy4DGzsRPCHa4o8ZIwu8htR0RsuSZsfxYhqAgz7KMLMkK3oWMHm/+zCD4qVfjd2R7KVl1kpk09RqPBdnzdvr9c3Xg5RM6QcYu1yfHHgAhFZ6eU6VXGw1HnUT65CQSQQA/0WqllfPAfOSuR/YqxLCL0NjTd/sTS9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765450073; c=relaxed/simple;
	bh=/hJYTPgyO3sAld5wDaKkhaw6EwYwaEEqTlH2rzJMZ18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CaibsgvcpUeixAwdGesQhPQZu1AMiz4f8bm3dgrJrREIpashl8SfiP9eyr1lxdE/x+jzmv9NXNCQFPk/LVDMAm93Znf+0mgIZaEFe4LrtkVVl1AkbrkZy/ByNNNDaoI3adLY+zcGIrP9DJwrnW/EcbQdhYvkFofi/6+fhHu0EZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=taRiryPZ; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37a990ec4e5so529271fa.3
        for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 02:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765450070; x=1766054870; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sa4s1sdDw8tatxWU1wIWykEhaXAgMDTgFi6xwN1LbFg=;
        b=taRiryPZHvOW9mL33v9ReHpkrhaoocqTitjcPVbfs4xVSwYcLXLbTuUYatSTE7ByuO
         hp7KVu++Cf6FWfGN0HVQhx2GDef8cAQiNBMJ4RaQ9kSLZ02xgv6GaTKSOEtbUD8AkW/E
         CLhGLvzELWudAb9wEMa2is/oCPaKFGl9p1l6mOMojUz67w31vXSLMBMHHg5ezu0HYGMc
         DVuFCsenWa2JjDb6iKw8pXdpLRRRBxiG+9RpdAa0C5HPu8GcdHz3c1xVDvfKqgc44pA5
         SlTV/zINSzIFAwdtHJtRBfWiMaqoqLDg72xhVHRT+XoeBMID3R9gm6PTdWZBz36OF/8u
         cMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765450070; x=1766054870;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sa4s1sdDw8tatxWU1wIWykEhaXAgMDTgFi6xwN1LbFg=;
        b=DyOfhYUCw7KIyndA0dJEyWI0Mj+vaRme9tSGf0wnwFkXGVn8w4dYk/+5jaN3ejK/QV
         3sN/4MNW+rlYDWN4L5nW9OetsyMt+a+bxwK5F7KfEKFnr15xSx30GPFy6V30Fhgxdc+b
         PDS+wuAz4K0ltVTauHmCOfbFah7/Ayo54PaBhjtdl8sDMcHHTU2pId8AhoN7tP4wNq9M
         SobtJOTvArL+ZK2PXsSfVS9wseFhjTqGylz2BcVBTJq5Mt62RzvCsz1A1Q7k0haTdtGO
         OQmMKXxnpKBYxkKQU7SteT1+mQ7kCNKbMPjglA6uopwFJC3ZbAO3Tj2ybbVZDkgkteEF
         YxKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmrjmK/B0yoRxUr91G8wBAZc3ilw0F4fFFqZbZ4+H08oRLRuW6RVmUAbVqzJrmmpmGt7kUIzWBYYKvEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCbXjVYFAotMcGWgxl/EobKzUxucyNkyKOwHfhZHK44ZX9zU7G
	zuHC1OjldgRSyRiQ4X3hIUZtv8k3ApuiH86WK84DiSI+MuvCeT08GmUefL1/mw1f088=
X-Gm-Gg: AY/fxX4trokCuJS2706n7kz7qIAe5yE7YOP07qpDsnNDqMOV/He8p9jjE53ZYKdyc0Y
	jxaID+tVnsxGfzqTowx6GGmPSzNberFj8QublZxyrO1AoVpvQFCRurdbyLf347WzTG6FPMjr/rC
	ashjiZc+MqTahIufAI1AfWrnfwdCw4pO95t/UmJ6u7hypdSq4h8RGPIrbtUgy2vkfpOXkAcjIWv
	ER5bkg1GcJh2SNi7Fw82lC/Ds14BcGOsgdc5D6uSZ4XgV6dibpC5mUYtTvuThXxoRDjMGIcexDv
	0gQo3VEmNjdO2kvqzgvaxZdadTi7tq8kA/duZoWj2NwSUb5x/vR6wJHTiePUa5ErRwWUrwaeEGR
	JoIzPyflvEF52X42Nt6CCitrENH0u/T21HHUkc5Mo7JYMMXBeK/XvF924/UZUME81IdZ2Vew0mR
	O8TL4RY/asozg/MlOK3C1HCDno1zcRR/TH105TTST4MYZzLU7f83UoG+YCbo8HzBSrwgzAWsueb
	oNx
X-Google-Smtp-Source: AGHT+IHL0nA4s/oF/x2Q6BybMdGdTLDPq2ugV8txN57v1OrxcOFcQnTUnN2DMwrgc1SDYdT1FHQ2+A==
X-Received: by 2002:a05:651c:f1c:b0:37b:bafc:26a4 with SMTP id 38308e7fff4ca-37fbe0c23a7mr3640941fa.1.1765450070139;
        Thu, 11 Dec 2025 02:47:50 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fbc9ba1e6sm5688151fa.17.2025.12.11.02.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 02:47:49 -0800 (PST)
Message-ID: <dfeb8bbe-8751-45f8-9ed8-1e28435056e2@linaro.org>
Date: Thu, 11 Dec 2025 12:47:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sdm670: add camera mclk pins
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-5-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251211014846.16602-5-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/25 03:48, Richard Acayan wrote:
> The camera subsystem is added for the SoC common devicetree, but the
> mclk pins should also be common across the SoC. Add the mclk pins for
> the cameras.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/5135823c-f2e4-4873-9e3a-9d190cac0113@oss.qualcomm.com
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

