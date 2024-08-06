Return-Path: <linux-media+bounces-15876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E515B949BAD
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 00:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 212DA1C220D1
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 22:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69013171E73;
	Tue,  6 Aug 2024 22:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xPjIo4KG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DF3171E6A
	for <linux-media@vger.kernel.org>; Tue,  6 Aug 2024 22:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722985110; cv=none; b=rdbZQnH8SHWg59Ng9+yclXk+R9HTq6YBGIjy91eFypy0morWIrITfIV5pdnyarAcGF8ac1pB4XL09u5DSNyGC/5WeMnuaAMLXLbVVPfI82tZgcdWmt+/TWgOqcdagzI/QTntsywyWsiDJEzj73iQKzmNICq7PNJGZ4jfA+JoMCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722985110; c=relaxed/simple;
	bh=DCrt4e2csQcgaOcoc7wvmZTQ/fOXRJmfPUKFxrYg/qY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TjYQRelnkmA/TrLZmKexWeP/FCI3vwyahKVnWiM5KUfHfXQg6Th5IovFy4FGXbzyozszqL2FVTQlP4n9Ie4uUmupZMIuZsCUzxi4/UwBqM0Nuc3CVDaOPvHxJbEN+Y1CZMIBz9Dx3ewyaZ0F5qwzzuJAnNcb/ryc87qP7PUms5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xPjIo4KG; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-368313809a4so172660f8f.0
        for <linux-media@vger.kernel.org>; Tue, 06 Aug 2024 15:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722985107; x=1723589907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6VgOqGVZjJb+ycfH6+81Nmb6cqd2SEWfGswHYDs07ts=;
        b=xPjIo4KG3m9banCe/JgYu3zI+A6X7biKjSrWenyDfUgyvVJtY7gUE6gFY28kgWQhwS
         oDAAYK9haZzb1lCbp0cUa/rrkoLJUSYbD1ptsdfC8pg7pZu09FJ/rMGocnNde4cuxPMh
         rb9yvGDL2QMOY8jCz58HgZUSZnbjicfcQ44/F4ZJZ3fUJrlgrIcgwm4fr6UFTbSgkL4F
         SyAgbvCFCK6UGcv+QZt2o/trilHPOiI9/ZbLFMQ0q/Z/7DNJcfhcZl0XyG3e8AIXZ2qv
         KImN6fyCArEAAnj8NB8VbL7Uyi2FdY/oKKGKze7v+RVZqYeIiauPrRY2CSKWuZkEJ19z
         cjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722985107; x=1723589907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6VgOqGVZjJb+ycfH6+81Nmb6cqd2SEWfGswHYDs07ts=;
        b=VF2vkxLivtDxOgPg8CfLpE/msqxMNEwgoQ29QK+i/szh0Ns8HUOHUboiUsuT7QCh+X
         cP4rxEQf7GQ2IY7g5eg5ttJuAgVPAtGfFCjCW58mvSt0sKzZ4WYKqLEt5x/hg/KMrDyX
         /gc6lz5i+TfWNgFkPTcUPRzzbXUN1vltgcrHutHusPl32b2DVJfLSpq3zR/NaWr4w36b
         uKPkUIDStprK69yxn2/BoHO8CACDB6xTkPf19Gg/Y+qfFQdK5ZJcF0W6ZG+hXHxIkgnr
         At0rkfyv4SxOD6tudEmPQ5/PSFXGhOs8/lRi9oFbwrpWb6v+ozsLjJB+bdxR3ARzpzzT
         1AxA==
X-Forwarded-Encrypted: i=1; AJvYcCU2yAtbQ0OtLy0bL0thf03YMxujgGVQy9t8/KDsOOkIBWjeRyw8FS2Nx+jDPzJl/674na/urf9iYYS7dW1IGKvCrav5Mfp0SZwTolQ=
X-Gm-Message-State: AOJu0YxClfSSba25N0X5pLHJuunf83CLJZoQsW00kZreEajgPr1K+J6e
	4S6iLnZqiT/7u7FAfLrzDvBgtawH0xV5g9aoen/DjwfFknPx6D5v5bPsXp/I0gg=
X-Google-Smtp-Source: AGHT+IHr3I+rKTStPBoCANodVKvFELxt2xSun5IdD0M5aN8HcwcsaQwDHFSnpsdESWfT/LjY9sr+6w==
X-Received: by 2002:a05:6000:b8c:b0:367:9048:e952 with SMTP id ffacd0b85a97d-36bf0dec5a6mr159172f8f.18.1722985107468;
        Tue, 06 Aug 2024 15:58:27 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059a6703sm1063145e9.37.2024.08.06.15.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 15:58:27 -0700 (PDT)
Message-ID: <d083367d-cb61-40e4-b9c3-2ff3e450e656@linaro.org>
Date: Tue, 6 Aug 2024 23:58:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: i2c: qcom-cci: Document SDM670
 compatible
To: Richard Acayan <mailingradian@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240806224219.71623-7-mailingradian@gmail.com>
 <20240806224219.71623-8-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240806224219.71623-8-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2024 23:42, Richard Acayan wrote:
> The CCI on the Snapdragon 670 is the interface for controlling camera
> hardware over I2C. Add the compatible so it can be added to the SDM670
> device tree.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index c33ae7b63b84..49fa8304fe4c 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -27,6 +27,7 @@ properties:
>             - enum:
>                 - qcom,sc7280-cci
>                 - qcom,sc8280xp-cci
> +              - qcom,sdm670-cci
>                 - qcom,sdm845-cci
>                 - qcom,sm6350-cci
>                 - qcom,sm8250-cci

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

