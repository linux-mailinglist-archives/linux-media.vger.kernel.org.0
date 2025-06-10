Return-Path: <linux-media+bounces-34412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8EDAD32A6
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 11:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE670188D221
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF8228B7F6;
	Tue, 10 Jun 2025 09:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="scAx+Ssr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7487828C872
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 09:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548897; cv=none; b=P74lNupZhuMyHPidgMgZuu2otP7oLiP8rlCh+30B8hA0OuTf0CIcH2otvLTHk6RR7/kMELoGhv7UzkqMmCmt3gLzIQ6yTPMw/6aqm+J/FyyaUEgulGU0/oaH6GzzTk7ixbGN0OAA6i3MI/C72xsCNGCaL6DkbviKbuCm2wR3dJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548897; c=relaxed/simple;
	bh=drtc7gbE8EVnagG9aoANO0Qzm9NCLkeYbn19VDrN7lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EKDle8YJSu8XBGNoEANU+y56rZVCB9Nrpu+uJ8tYAE6UYaiUVwC0qFgzjMUKbGsXRxnJz4rjIYWHkRJmWnQSGU2Sa2YT3sBqwCMnhACgWfVcYh0d8nH6i5dd5jD84CeEWMfoNm5GQG8zbY9l0YApBI5Hl5EOuXl9Pv3rCLxc1TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=scAx+Ssr; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553645133f0so564405e87.0
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 02:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749548893; x=1750153693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sgWX/fDU4kZifwwXOkRhcJUMm2OkuAYm3wpAj+nwwK8=;
        b=scAx+SsrlfVuPuqcaMtTXapNGGrTB5aQau5mq50//ivDM8yO1CJcmReZzhMlsMy6vK
         ftl3ZMclXD6FVwN2c2ZGJQsTnruNK4EW3kv/EpiG0zu1bkTqUlBS92VD/yNG41MXeWmz
         WX/UgUkfMjGMwI/kMWg4sGaKLlH3tdlhLGy1XoWAArjwUFiAkPFyHugg6xZJcVA+raPK
         W0Pa0P4WCdvQ9CIuj5B7RxYW0GLJ1Ahbz7SqMc7opdXZEp40LqCJ+sEkTyO/5jmLoOgp
         mr1xPKawAjKUcs0DoTFx+5W/JNP/2+wtBzbpydrdVTbfTDDx0qk3+vVf9QeCNXwmpWEi
         LP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548893; x=1750153693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sgWX/fDU4kZifwwXOkRhcJUMm2OkuAYm3wpAj+nwwK8=;
        b=QpJKssokrH/fwi2XeOWPkvaa5BU3DypYhiuE5BuHJtU9nXW3a5AltvcqWRn0HUmgAw
         jh2ygwdkpntvVHK6WFQxAXXZ4hFifB2SNo2yfzo4SUdH4tlQDw+tj5aS1k94IP8kfqPk
         nuDQ8CA6JAPspygC+6gSf4GOLnUwxrLBIEaM048uuwwbGqqkZb+NvkM6AGt6iX3pU2ke
         1wQ7BNbKZjvWk5qV7ilV3uvWyxeXEGGNJmcWRHcwXVVIA4Vypbt2JGwDGyZ5qvoa7qmu
         lxR/bgI9irvySexK6sERxQjZJVh6odRe2X/Y6OQYpia42fbW+Clrc7RMzA5RXswjXZIp
         ulDA==
X-Forwarded-Encrypted: i=1; AJvYcCX6/X0DskFzMseWJkZ+8KGiXAmYH/JrYC3RZhsdXCOghXD8h0hNHZN9bGXHootmvLgwQbPfs5pi2x5J/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7mCcAJn95yhOn/Whhyp3AefwK4n294XDYE4R30/FMSRC40d0K
	0EAr7W8V/H94e4z54s3r9BKwh/3ehPAfPYATA9t0LMpLp0lGQmxvjyXsrf/zY0yyFGM=
X-Gm-Gg: ASbGncvfcEEJ6ya4QXDhV247e1sjMA/Bg0NPTNh2o+3gXli+yTU4RIA9X3le8vHbldw
	fSDJI7P5NaMnwkEEK9Z4ygu0VX+rIlMBMTn5/aR3NbH6yBEwIlrrPBKj/S4NXRd1SnxRe4GOcao
	ON5WvcoY4kyPnMnG/KtnatGEzxj8aO8DK+hCKHGO3aUm/4Vx3IWsuAdM/o2kKVtgPQ0ktlhie+/
	CAdl47bD7xEVar8SuDPYmDz/dfPuLe05gWHHyKU1Zvr1oIzGu7050LLdK4FNDPwdl1byCA1Qf8N
	Nzcl2QIh8+YqR1U5KaksdVdH1aeJEtKMj8bRxf3eXqT3KjS2TbPvyybiNvs3qSyfp9t0g8W/1M9
	/WH3goJE0Ds13KZeWuQThw6FUUIlEwxg3zbEo58yr
X-Google-Smtp-Source: AGHT+IGe42fvbz6UNMq3WeYyozKULgQbXzEyVJQNlI32jNbCy2BtIg4bwXtTOyqOT4GzCdoEQ38Mew==
X-Received: by 2002:a05:6512:3b96:b0:553:2e90:98c6 with SMTP id 2adb3069b0e04-553687982cemr1368395e87.11.1749548892235;
        Tue, 10 Jun 2025 02:48:12 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367722392sm1471777e87.127.2025.06.10.02.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 02:48:11 -0700 (PDT)
Message-ID: <0367d5bd-a42e-4b6c-b841-ba20190b3127@linaro.org>
Date: Tue, 10 Jun 2025 12:48:10 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
Content-Language: ru-RU
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
 bryan.odonoghue@linaro.org, todor.too@gmail.com, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Wenmeng.

On 5/16/25 10:27, Wenmeng Liu wrote:
> Add support for the camera subsystem on the SM8550 Qualcomm SoC. This
> includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.
> 
> SM8550 provides
> - 3 x VFE, 3 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE
> - 3 x CSID
> - 2 x CSID Lite
> - 8 x CSI PHY
> 
> Co-developed-by: Depeng Shao <quic_depengs@quicinc.com>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 210 +++++++++++++++++++++++++++
>   1 file changed, 210 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index e9bb077aa9f0..722521496a2d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3326,6 +3326,216 @@ cci2_i2c1: i2c-bus@1 {
>   			};
>   		};
>   
> +		isp: isp@acb7000 {
> +			compatible = "qcom,sm8550-camss";
> +

This is the first time, when 'isp' label is used instead of 'camss', it might
be I missed the context, is there any particular reason to do such a change?

If the label name is changed to the regular 'camss', then

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

