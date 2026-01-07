Return-Path: <linux-media+bounces-50096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBECCFC08C
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 05:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73A27302B13A
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 04:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8899925D216;
	Wed,  7 Jan 2026 04:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k4uJpw0n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AED8257830
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 04:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767761966; cv=none; b=t9TZqO4JnDC/SpjQ2AN3Dl0NGE5fM8mQUlIVfbppK6vCO0OMMAJzeytSGJgqC2XssVQthI+9hxxEyUPjoS+4RS62gJdbjd052NMqKijix7f3KenPrAtRccBR6dQaDQTfPOACzXjhxhZviDX71qh2w9Plbnlu9iysMK4msRmBoe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767761966; c=relaxed/simple;
	bh=8ayjC1pw1QgU/U+6p7ezCG4vcZstIeW4+HvogWqFNdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A36PMd2QfaVNy3JbvPmIn0UVjwIZB/vE1sAFcNrwU9xm0GwMj3MNPkjLZ8wTggi6BSvd0/hTsTPB8PqExHKavZ7+rJKF6Cfipq3l4M5Bg/zYnZFg7guoOIvCxD+AJQ7mFHn53s3Dbrk1UOFJP+FZL8Qf1cz4drHdT4JWY1OjBs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k4uJpw0n; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-382f10ce137so1588251fa.1
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 20:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767761962; x=1768366762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpaDww3Ahj2lTPiIw3h+P4X6jy6j4Poz5P8K1VBVmPo=;
        b=k4uJpw0n8AkhYVl2GjBKdNuOLcZ5Ds7p9Sft8uCncZfZBRFLjLOyCp4B47E1XDZ1Dy
         nzefpzQZGFfIibASL00vHAHcyXqpKjAKEFUuKuGO8h3VNNiIo0wrkZctHGmPEkKLqNAi
         4nbMcVqs9aB2+G6Ft1EdAKo7ke3tzTr1RnRBtCByZhEFHJxas+2M1rNixXbeF9HkJK6C
         V0J9b2gYm71QKfPyisOaY7tk1pL2Qx9/2skvZJLMQi/M65OJp0SplbIbeSZWcEGjx7bO
         5cR6CsMFQdEGY9cBGeopSP8i/GTWxjLVJl8uHdAkkrjX8KWUNjWrUIDcGOfc9QyQerX0
         O6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767761962; x=1768366762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vpaDww3Ahj2lTPiIw3h+P4X6jy6j4Poz5P8K1VBVmPo=;
        b=bvihbdTDs5N5Zi0tUkHKuKN0TjqLf0jbAHc03HSJItkIqtB4OkQ9CosZk6X1Xpbzi6
         3yHsJj8KXaTBoFeTgJ/sHwwGhWVB1K5VKotMedBWk3FQFg1/lpuS+Hhprwd415OFno4e
         AkiE2w0marVe1x2JQsV1mRoYnBd1Pynesd+o0VCxN9L4l7xEV7wHUoRXGLkKdyS3k5Ej
         RQr3m+SsY+ZYc+jw1j8fMLkd3NQFXgHoSxcG9Efi85bsnYIikgTUoAA7+eyl//Fzd7Na
         OfSws9q+2ywwsrYm3H7gG4fm/ukO11JT78HKWZIMregSucdl4MRTqpEkTV3Ova8/4dzo
         uq6A==
X-Forwarded-Encrypted: i=1; AJvYcCXnvX+Y5r7ixV6SqQKTECUlP/3BgoRWliOdC4chk/k3KzJ9rw0Q7nIhiDjENdIn67HD+RnbtEJMXm6F4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy96f1OVVy41Q59SA9Phdh08wb2iiMQvQ/4Ozn6g6edpKyOtWBo
	u2E9eD6sdlW7wrX7wsMghLo7YB7B0sc8nsohpGyJduXmZruGZyYu+N5z7Ks7mFOcZV8=
X-Gm-Gg: AY/fxX7sMFp5I1ETwo3XgjF982pVpy3GUeYTYEVsSUtQmXLnVlA1F3f6tF/hLGae7jP
	Uft0TVDRQ3Ssko+IkGRnLgf4asSNW3KyhQBWO5jXr+7SRlxzXjLFivVr/hVp91utZ/Ajqq8pPmF
	TLevfkiS4ZcECmfUMmlAapTpsXdIGxd/3ES7fODKSl4tR/XorMoZLbqTEa8vfrD6RU0zTcroAfG
	bLrFxYTpo+hS/ljb94aeE4iKPmFsTMNY2pT7Um0nQcy56dKt6GB7T/Xvb9UCXcY6iuZ6b4HXSNd
	GWFl3JLcv5gbg/fEG5mwW1Uiui0E8G9KdxAqIJvU15sEHzhlYhLWiVjeCpFVcK6BAyPUsZhemW8
	frwyHwQk4vwRtZdvMNKWDyzpxo88knEH4s91lotfSM9f9nBclBqwY+r5ApHPBKRcN3c2qtGDngS
	Ebq4fFVpdOOePwVzfSka5pNdkl4wjm/9/YQcJ9jk5Y/hdBj7qYr5ApIx7gWf/Ppt39JxufJREqG
	LkG
X-Google-Smtp-Source: AGHT+IFaxz9I7SxHKBSLqa991ssFTR2Wj4rTr7PJ83MaGolYYv4zzgp8G4eV7mqAU7xUX3mc+fdLyg==
X-Received: by 2002:a2e:be8c:0:b0:37f:8b25:a327 with SMTP id 38308e7fff4ca-382ff58718cmr2576611fa.0.1767761961920;
        Tue, 06 Jan 2026 20:59:21 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb7c708fsm8961761fa.21.2026.01.06.20.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 20:59:20 -0800 (PST)
Message-ID: <6aa9932c-a0d4-47d4-a884-f25b46ae130c@linaro.org>
Date: Wed, 7 Jan 2026 06:59:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] arm64: dts: qcom: sdm670: label the camss ports
 instead of endpoints
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Robert Mader <robert.mader@collabora.com>, Bryan O'Donoghue
 <bod@kernel.org>, David Heidelberg <david@ixit.cz>,
 phone-devel@vger.kernel.org
References: <20260107043044.92485-1-mailingradian@gmail.com>
 <20260107043044.92485-4-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260107043044.92485-4-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/26 06:30, Richard Acayan wrote:
> Endpoints cannot be pre-defined since dcf6fb89e6f7 ("media: qcom: camss:
> remove a check for unavailable CAMSS endpoint") was applied, probing all
> endpoint nodes and requiring them to have a remote. There is no sensible
> remote in the SoC devicetree because camera sensors are board-specific.
> 
> The ports are meant to be extended by a board devicetree in order to
> define fully configured endpoints and connect the ports to camera
> sensors. For nodes that are only meaningful if extended, labels are
> usually assigned. Label these ports so they can be extended directly.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/sdm670.dtsi | 18 +++---------------
>   1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index b8a8dcbdfbe3..3eb4eaf7b8d7 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -1776,28 +1776,16 @@ ports {
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   
> -				port@0 {
> +				camss_port0: port@0 {
>   					reg = <0>;
> -
> -					camss_endpoint0: endpoint {
> -						status = "disabled";
> -					};
>   				};
>   
> -				port@1 {
> +				camss_port1: port@1 {
>   					reg = <1>;
> -
> -					camss_endpoint1: endpoint {
> -						status = "disabled";
> -					};
>   				};
>   
> -				port@2 {
> +				camss_port2: port@2 {
>   					reg = <2>;
> -
> -					camss_endpoint2: endpoint {
> -						status = "disabled";
> -					};
>   				};
>   			};
>   		};

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

I'd suggest to split this series into two, one for the added driver, another one
for .dts changes with the dependency on the sensor dt binding documentation on
the mailing list.

-- 
Best wishes,
Vladimir

