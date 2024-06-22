Return-Path: <linux-media+bounces-13964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE8491334A
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2024 13:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 397CD1F22F4B
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2024 11:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF4614D2B3;
	Sat, 22 Jun 2024 11:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nN+a9oHT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C76314D70B
	for <linux-media@vger.kernel.org>; Sat, 22 Jun 2024 11:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719055091; cv=none; b=fw0elp+XI1c28B56VDhi/7GOSS8YiO4ZJ5QdH4skzJqZ7nhcIaeg+yMv1OdcaMEuPdAGd+BOSil0nl8q9Cg7AzOrwLYet2UBNbLzFWxu/sb/5Qut9ik/khYY2OLx8KEh+akU7lXnpMsmOekcGtOvIpprreQg8+Eewbo7svXSTdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719055091; c=relaxed/simple;
	bh=OVGsGcULAd+tm0Vg7GHlWNp6LFLAHZM/qfneNJMZlxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKaHumQpcF4PfG2caXdfOwwBan42MHKkLm1JCZoPoRkntrDZ36ZFu6LMSw/xP/xry3Bct5lYb6pRJ0R09LapkYXf/PvzCqnLLYJV/nqQ728i63g16o/wpsXUutS6ausz4Z3XKWHVnbQbxgnA4XsvTn9Hrl8prGW/UJ5jn6NQB28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nN+a9oHT; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57d044aa5beso3106551a12.2
        for <linux-media@vger.kernel.org>; Sat, 22 Jun 2024 04:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719055088; x=1719659888; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6gw8DfMPxQlCfKy+ZVvAQOOA7tVUV5IG3EFW3SPyUVE=;
        b=nN+a9oHTofXVRBtSMd5Od6aVoUgcp/z/Sw2bjgqe9eWfygHP6Bsrl4Gak+wuFGE405
         HL0/Fo5Bi6Q0icnGk/qodIChNTLzT2vpsFeuWfVjmonHhoRBhuHtEC8kXyAdRnLOEeej
         iLrVfNWPkE14OFb7ct6xcnMAW3GRyMEAnj9yKbyg4Adkn7N1kBbo5vElIGtgc9UI+OZ/
         3rGqPF9pCmIESgdaZS0lbIX8XycOxqnIfA0G4MB56ffuY0V0dj+KHKhfrOTw0KE90wGh
         TvTFkJj9SWGpNT1Siv9izB+NNH6tO/OtITAwXO5U047zlmgvbZZmUP+gMImvKNA5Bi9U
         077Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719055088; x=1719659888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gw8DfMPxQlCfKy+ZVvAQOOA7tVUV5IG3EFW3SPyUVE=;
        b=W7X81PGR8ZlpQ4EFE6/ngTg7HO5wNFVBR2xwfJKbK/XB+5QHnfZgpqKL863VRvUeqO
         E/MnWk+ecAiJ14/29ItsMDsEvHMRHTO69NtKUNwywG+eUbiitxeWqjsRenExQZ00jgOJ
         o3f7suTPOl1tImwTdy8f8xRKe8oN7BWGhRrXm5wxQB5qDu6HEJG0UuebqUHJ4Xqbc85F
         3kNc5qMpQ8zT0Vsbp6yxTvAmNPldT/tMdx0LAh6J4b2gur3HjPyOneIo9TQsOvoKPUoR
         tqZUZl6l9xAh7d1r0ICvF2B0yUR8F6zmhe6rzZWxREPj5yEZpb6xdaPDtvk8dpEDPUv8
         izKQ==
X-Gm-Message-State: AOJu0Yy5mDBl+1mEhAEKxiry4qKdosQ/m3OgaZZr1kwCDC+BF519Xsq+
	Kb9T7vDBE9fRRMRiwgdUngXug373sHI8Je8LCEEUGcKOBfNmQuVM6pUQl90hMMY=
X-Google-Smtp-Source: AGHT+IEGl09yCfUVjE+wkwdBqE2TH1nQo3iaXzRoYMg4XBas3g3QfYdOFkUtr5VyAYAg0iHfHQmJtw==
X-Received: by 2002:a50:d699:0:b0:579:ca97:da1b with SMTP id 4fb4d7f45d1cf-57d07e0d427mr6300172a12.6.1719055088268;
        Sat, 22 Jun 2024 04:18:08 -0700 (PDT)
Received: from [192.168.128.35] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3048b93asm2253205a12.56.2024.06.22.04.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 04:18:07 -0700 (PDT)
Message-ID: <3660e37e-2716-4d9f-a9cf-b69568d4e77c@linaro.org>
Date: Sat, 22 Jun 2024 13:18:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] media: qcom: camss: Add sc7180 resources
To: gchan9527@gmail.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
 <20240621-b4-sc7180-camss-v1-5-14937929f30e@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240621-b4-sc7180-camss-v1-5-14937929f30e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.06.2024 11:40 AM, George Chan via B4 Relay wrote:
> From: George Chan <gchan9527@gmail.com>
> 
> This commit describes the hardware layout for the sc7180 for the
> following hardware blocks:
> 
> - 2 x VFE
> - 1 x VFE Lite
> - 2 x CSID
> - 1 x CSID Lite
> - 4 x CSI PHY
> 
> Signed-off-by: George Chan <gchan9527@gmail.com>
> ---

[...]

>  		if (ret) {
> -			dev_err(dev, "clock enable failed: %d\n", ret);
> +			dev_err(dev, "clock enable failed: %s %d\n", clock[i].name, ret);

This is a good change, but should be separate


Generally this looks quite in line with [1], although I wasn't able to find
the matching clock rates

Konrad

[1] https://git.codelinaro.org/clo/la/kernel/msm-4.14/-/blob/UC.UM.1.0.r1-02500-sa8155.0/arch/arm64/boot/dts/qcom/atoll-camera.dtsi

