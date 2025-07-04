Return-Path: <linux-media+bounces-36845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CCBAF965C
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 17:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A51EB58667F
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 15:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BBCB309A48;
	Fri,  4 Jul 2025 15:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wT2OD5+I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E51D3093C3
	for <linux-media@vger.kernel.org>; Fri,  4 Jul 2025 15:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751641668; cv=none; b=BPbwSlNFd8JkIREePlZcGF2PYSlLqVQHWz+qSN1728n1vsNWigIrcje+0lmg8ajOLnvf6f+49Hc2zixij9A29MNC3P3zz+edueDzVF034cMtPPK8+rZZvy6YG22uFwiOFGOBTPky2sIa/HZMKVY73JQeY92cXoE3Y5VuqbkSobk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751641668; c=relaxed/simple;
	bh=q2PI2I6DpmIBa/PZTooLY5T7w0VsVRO6mzyBLjxOd2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MX7jY/TpW8Zf4Xqu3sTFeYgrHymAUM5PKL2LZ6hIJnUSAh9bqWNVuDPMlCGOjoXToGEnG51x2tQHCPug8U2vFM9xwiRU40t/7dSRbHcRdUu5FCRSOuqXQNLJwfJst2KsUKmRLMDWrMPb6OpZ1te2X0kc5Z2gSHUHYHDoVRUpmf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wT2OD5+I; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-453634d8609so7423975e9.3
        for <linux-media@vger.kernel.org>; Fri, 04 Jul 2025 08:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751641664; x=1752246464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UYKMtLCQMU9Jbn/Hf3wX+1NuY//33AgfBI91LQJ8MGY=;
        b=wT2OD5+ItIoGdf28wgmaYorskH/4msq9z6DCuxt5QCfhhTARvnlPnXncZlGOa16p5I
         vJRnqgSdPZXNH8jeXQC/qH2A52A+czVrFr8x4Pv1586GivLRaISaWyLmY/0dTYUzF2/5
         H9mvVHbjhxEFtkn9oeOcHUHhSP8tmTNiJDJJGKIRsVZf6DeNAFrOC2Y6TbeK1Boj2gGx
         JkuRqXqNXQf3xwp3mmWdsryxc7y1+XAvKhPxwdXaCNfpOrcp/3M++TisJeOVsN0STLEP
         PsaHdsaF2aw316Es3AGs1dj9trrFf4kKNUPoJEJugIdOh9HeBsFZ+jvO05LLLKakPnwb
         /M/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641664; x=1752246464;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYKMtLCQMU9Jbn/Hf3wX+1NuY//33AgfBI91LQJ8MGY=;
        b=DjkXxOEcE4K5F1qXL7SmwmN+vvJ5iWjz+PQIHgyVlcDwGUQD2eUMCTqynshbqe3VMW
         AfggI6osPM9t2zRhrn7E6HD5bSrkzVNpsh25Ij9Zjf1+ewQT/elQn/wHbUDRZyIRMyo5
         WUIPzVk1EP9cagOritaP+U67G+MrwiKh/vCNJHBUVQmSocw1gwP7XRK8fqkE+6eeYipt
         TXa7WBQ+HK606XZCPBIDq2TZq94R8FIZn5hAHuW0dSKRdsOLyLpTnhZyl9FG5SC+9wxG
         2qz7FJo9z61TGYQ8K7FoNKmABFW0+dDEKxtUX8GPcukw5UCfA2SuqI3IWVl+j42gt7Ws
         S5qA==
X-Forwarded-Encrypted: i=1; AJvYcCVXDC0atSNrVOf6NQIgJ+aOProB12prMEZO6EHba4uz8LzrCIBP9BTqA/7PHZPIztY4Lmp3dyB3KJtIBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh4qa9HDoHHtv18rwUmXWv3UyA+CVwYbqfmhKsZqRuFwHFze/x
	A4tMQhi9D2fAvjxwbdEbZxITE2dP+w0ZUiObudRQhSIGTq842NxAfXFDC8fe6HUOSaw=
X-Gm-Gg: ASbGncsZ3LD1bg0A0n7qEIcCSouxPYxYCTm2iILZVX+Mlfy3lsMc7mhUnhuJdDh/rnQ
	ZNigP4zOQ/MY+QIMRam3NSWYBG+yaItC3yNnotvWzUOhCsOATPUfMBwBl49ac86Ij8i3F9YmssT
	Z6wiCnfUkv+t+Eo3Nvz/zRTz4zGOa0nK4f/XjBSwZXV9dVzKD/HaHlY/DkHFkhicvwuB4wlho4P
	9jTSRWgFWD5ngf3hmqG9EnGi375QppENlRT66zQBHQw1XDMeT0zcWENraVT+TyQFOlVu2guZuyR
	40azv10HKVpfOTZCi6b2wZ5TGxH21M3Nr7EkCNwpxYJwoc1oLcvCayEBYyW5RAmBbvAdznBVIBd
	R/AmlYNvPniVj041zRYJRLAwfk5I=
X-Google-Smtp-Source: AGHT+IGCWK6GEjyuYgdWySF7UumkNIAA260ijlRTJDfE/t1th536V8nTvCURxmWZM6UF6IOMpNbQjQ==
X-Received: by 2002:a05:6000:2890:b0:3a4:cbc6:9db0 with SMTP id ffacd0b85a97d-3b4966046e2mr2935145f8f.51.1751641664468;
        Fri, 04 Jul 2025 08:07:44 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225a2e8sm2696936f8f.75.2025.07.04.08.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 08:07:43 -0700 (PDT)
Message-ID: <96f2c5af-9d42-4fb9-a468-ec4d22a76198@linaro.org>
Date: Fri, 4 Jul 2025 16:07:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: media: qcom,sm8550-iris: Add X1E80100
 compatible
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Schmidt <stefan.schmidt@linaro.org>
References: <20250704-x1e-iris-v1-1-c3137d979e43@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250704-x1e-iris-v1-1-c3137d979e43@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/07/2025 14:38, Stephan Gerhold wrote:
> Iris in X1E80100 is pretty much identical to SM8550. We can use the same
> firmware image and the same definitions in the driver, so just add
> qcom,x1e80100-iris to the existing list with qcom,sm8550-iris as fallback
> compatible.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index c79bf2101812d83b99704f38b7348a9f728dff44..9504d7ea23f4a30fd2d03e8683721641f8b1a115 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -20,6 +20,7 @@ properties:
>         - items:
>             - enum:
>                 - qcom,sa8775p-iris
> +              - qcom,x1e80100-iris
>             - const: qcom,sm8550-iris
>         - enum:
>             - qcom,qcs8300-iris
> 
> ---
> base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
> change-id: 20250704-x1e-iris-4a5d033f4a2d
> 
> Best regards,

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

