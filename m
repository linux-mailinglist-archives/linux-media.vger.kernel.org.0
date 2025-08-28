Return-Path: <linux-media+bounces-41260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7786B3A2CD
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E632F3B4B1C
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 14:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9BD31354E;
	Thu, 28 Aug 2025 14:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uVMSpbPL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A9330F944
	for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 14:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756392819; cv=none; b=dW8j+SiBbO5ZOuWXQS9vnxOMr978bM0wemkCcldELVQZVaEL3v8LPhC+kALtT3YrILZKImxscKnlcUHdBNnHukrce3UHrEOkdXtkHAmihc4010Z4GgkSwOo5TGjKAgZPHFh0tiiNW/tZ2BMc1urZkFlC95B3hII3PrazBkuCXy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756392819; c=relaxed/simple;
	bh=/DJCTdY3b1P2Or2NvSx10h8mL8R7PGDv7zdfJNYKi88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qsqRL2N1ns907fDSIZZkLEnIz3l4LtJrZDMFX0o8UtWcXtROigc8XMbGTlkoXC4ceXezixmVUhozCaqZSclk9H04hBdIy10ubdrC63aPuLa2+KJJwkBV7t83KQ36Nz/I+YiR5qDxuWrpBvRffHI48u1XQywwFpB/xfj/j/PH7h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uVMSpbPL; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f4e0c8d2eso157128e87.0
        for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 07:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756392816; x=1756997616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgRsIq6h9IQubkV0Zd6BIst1A8E0nIWsW8u9giQ2ZLk=;
        b=uVMSpbPLwEREKSdUhOsR9H6bvbCJ6YjXSHgVQm9tfQG9uoEaHo71GR/LTCuyCi1Q/b
         z175iwtHVFEZGkNAXUfDcwR+ADQDCJbEsv9ikPHpGEZ7GVe0XgYKgQ6+++Xt0xOxBrUK
         xBYmSQYFAY69xQNzvCF32LhUCvlnnNcX/vU6eWspr7Tt1y4TUKq4GAtxCOpmUAYi1XIM
         DHQrMI6zni813zf56hgzP/6/76MDUwz050IsSae64ruk8lJW13Hri2lcexax6XeJUbm/
         iSW5OGeaxHV6hK1GKiwxmGvokZ4Q10/YkgFUAjT2s7BtXx2GRUZwvl0og80XoyQ/zJYZ
         R0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756392816; x=1756997616;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RgRsIq6h9IQubkV0Zd6BIst1A8E0nIWsW8u9giQ2ZLk=;
        b=k3T2FzATjGs0h2hdCdyoiHhIKu7VVBccdIqct5Ka5VrUvdHDY4Yrg9UAYEwlrX+baZ
         AXf4ex1dlOv4wxAhctSEKfp9L1+F76TzHqU95a2k26A0VEP1Bl2REFSmUkNhb3XSe1K0
         tDiEPvSs8Gb2b05Fi7FoDfoCoLq0zuTkSYbqWhFFELNAqdtZT/nEfI/BJVI0l4sGRgeR
         xk981I+VGMPbHXaT2utMdfzJ7R4txSjTZfGVzHHlAEuIEyLYwCeAeDuBOS3cjtTJpf5R
         K6V52HdpNJC7GcTXzPZGfh8VrrAMCpaFsXn95Rx7K68aQ24TBmc4H+bHWaYtLwmTo5TE
         cRUA==
X-Forwarded-Encrypted: i=1; AJvYcCWZTrzpcFI9kTbJagOiqC8MpFGsgCXl8Pe7xC2GvJWXdxNNIpMIPYdeG16kr/IUHPGlIQNI1WAKy80SvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSUJl/V/sMvN5uZO6AwoLwshSnoG3RhBDADz54PH/wosbgexWc
	pVvpNGk759VkuujtpsYE5LmdB1q5BHqE2mkidZTMCUi/IfqH0Hhnn1OTvQr7lCdZ3z4=
X-Gm-Gg: ASbGncuyVSvelzcuxIdep6FRdHwR4CnYYQHzDukBjIH86jzDry81/Uq7PGF7EV3Yf3+
	KuyD5NkDEQMgC9/Dgv+dgKuEpWLogmspaCBw4hKITR33bZWSSjMzZIJgkd8R8Ze5usnRRvE1lve
	z0HBlujeuT0MRi3tZyPZmIm4O692pm8UOpAeTukRCYh/sA4GwnQfVNH7/yeEQxM0BaVm5au0Wov
	/oJXbwKtZaZs1metTXcghAV4y9YXc+awKrfk2d0V9k3rcVLiJ2KN66+diOu3/jiwAiSPbJVJDpt
	fZIrl0p42myTIgucSqIHQUo8NVUYkYEare2CRQfnccLpbwdS3AdIDJCrMjkjwGYkzQ7hC4NdjK+
	iTAhOD7J54EINP/oBEJ2wOHgaKMHU7auMj2/97//KuKBXea290ht3j/XNJLYxzFroB1jmrpjGPq
	L3FNiU/Ckv8sA=
X-Google-Smtp-Source: AGHT+IGSuI6V+Kke1CGBKIzaGvPw1P+D1NcZ65uMuJ+zPiHBgCmf2jcWw97duRvN9bxsU4rWcf1vCg==
X-Received: by 2002:a05:6512:12d1:b0:55f:4e46:8979 with SMTP id 2adb3069b0e04-55f4e468ad1mr1956400e87.8.1756392816152;
        Thu, 28 Aug 2025 07:53:36 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f63098450sm227908e87.60.2025.08.28.07.53.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 07:53:35 -0700 (PDT)
Message-ID: <17cd27d4-c881-4b88-9a28-555527546bbe@linaro.org>
Date: Thu, 28 Aug 2025 17:53:27 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] media: dt-bindings: ovti,ov2680: Use
 unevaluatedProperties for endpoint
To: Frank Li <Frank.Li@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "open list:OMNIVISION OV2680 SENSOR DRIVER" <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20250827194919.82725-1-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250827194919.82725-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/27/25 22:49, Frank Li wrote:
> The endpoint ref to /schemas/media/video-interfaces.yaml#, so replace
> additionalProperties with unevaluatedProperties to allow use common
> properties.
> 
> Fix below CHECK_DTBS warnings:
>    arch/arm/boot/dts/nxp/imx/imx7s-warp.dtb: camera@36 (ovti,ov2680): port:endpoint: 'clock-lanes', 'data-lanes' do not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov2680.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> index 634d3b821b8c7..ec5c40684b6bd 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> @@ -58,7 +58,7 @@ properties:
>       properties:
>         endpoint:
>           $ref: /schemas/media/video-interfaces.yaml#
> -        additionalProperties: false
> +        unevaluatedProperties: false
>   
>           properties:
>             link-frequencies: true

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

