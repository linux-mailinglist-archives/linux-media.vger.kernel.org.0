Return-Path: <linux-media+bounces-41405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B0AB3DCE9
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 10:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D463E1896F54
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 08:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AFED2FE58D;
	Mon,  1 Sep 2025 08:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H4D6D3UK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112532FB99F
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 08:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756716389; cv=none; b=K2+rsJO6m1HMOkmwtzyLKYO/Fsm+jdCs7ULwB0kAXyLiRO4TWv5rGSn1x/iMI/mWFNGMOV4w8XaahDuEUASdtQjWq4SJxucSLYUk7B9hx72JsFdiEHTjaAzMBbPaNpHkAOgWF5tV2cm42cF5z/la+Yzpq0n1IJhI2XA6JkSA4fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756716389; c=relaxed/simple;
	bh=iflz5Nt461X1bRlMAcJS6icPWKPS3TA+XUoGxapPj3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WPyGl1pfleGpF/E3jSRHY5T4a5+Pfco5b0MKTGjvj9pGlL5mH36qCx0Re5jjFSLI8LpD7iLKzoe0GgiXbeG4QyMzKb7rhKUPI0rd9+eOQMVp2oegNOmzczBP9LW39Hd21bxFQe86jqIRl3WbNVn2tBGTuSd3oPFH2HsKvO/jvcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H4D6D3UK; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b0411b83aafso209291566b.1
        for <linux-media@vger.kernel.org>; Mon, 01 Sep 2025 01:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756716385; x=1757321185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G2sT5xK9I1G5rI22V3pZH7RFm4MZzhppyHAkAzi7QT0=;
        b=H4D6D3UK+OsbzeSzDoqaN1ek5jX4lekmMLB7kB9FDHuy2fOoem6um4XjArE7TjGgft
         bk6Ox1SDRKXx20Bi8sjgPeX4Jt3JMRRBI3PVRMEmZjHCh2EpIh0O9cxUxBmFJrU85q79
         v85nN5XlWGeDqrLjMgaNiUunW4qOV24PO1RIBrEevV0Kitp4sjYpKIVqEK8pP2noBY5D
         UjIHg4FhHiu4n5dZ7k96Am55kytA9qGraU5/dHmPVrRq2bDPyIGsQOlW0uNpJ/q/n+Ps
         i4Ag0pd7rNvS+ZniE2YnE+Ac1IOFQxwIcHNiC1bYu5ESxl+ymQzNyEqQfMKVi6GaRnna
         Eo8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756716385; x=1757321185;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G2sT5xK9I1G5rI22V3pZH7RFm4MZzhppyHAkAzi7QT0=;
        b=TWT5oUehtwibAwTs2ltOhwK9g2ZHmSnwTMQm9JHgekd9j6V6DucoYRtQFH+oeC5myL
         /uF3jG49WFwYncd3u7HMkoY9KNIYuMrz6uSTFPbtLZ1qaHa+f98Arp6H1+PZXDbt6Jqb
         INoMBNn8d2Qd/awHxpe/fe6O3gS0Un4aPFjU+nvV5AmdoddTHxQA0VKcVOvbBKEEfGRc
         e6xC+CwZ53sLmjYzAFkjKoNK892Q5KWJJ2cwoVYD+X/04fMO27aIReS1XcAj5XZsFUkz
         oFZR714R/O03cNn8ne5pzuSs3gSD1WWXctNAEdVY51wsd5feGSOTY5wj32DkDv1NZD/e
         5ueA==
X-Forwarded-Encrypted: i=1; AJvYcCUCqc3N4IiymqRs2YSkSiPMh/SIbHjSNycDsE3oYSNPO1Z5E/BowVMjTUsnKrEd132LvwPE/h+WMT9Caw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs0RUVOdtqhAfZAhydvOTKvqY0cGStaxKUscDKu4BtkFMt/WbV
	Rl8nTHJlDbH9yzKO0W3v+PzKipfE4BAZH5U6KF+eGBelg2OwENqmzaRiPPpEn+SSfR0=
X-Gm-Gg: ASbGncskRFo815H0006M/mNNgAxeTjlp31XSDUGUS43zMk4jz2MQvm4fduQ/d8315Jf
	iKL7u+os3GURHeOuVRWpToBtcy/qVP7JY3duGTqYzeTkQcV2LLfwEtZ40zoOX2T2Dzuo0fnMWSt
	vZouP2f71xgUocIiVQqwS9i75+r2tG0Ai371kZvUxLKc7fTAZ+m2nyPSj1ejJj2shXTfRbep8AU
	WhSMvdWbAU4QwmTeWPJarFLqwwd54Ib8CcQcyf4FDtkTtxour3ujoDS9uE34HZjHBWUwMDs7Z1D
	a7PJmpy3OiMTFqBtiw2e8fg1oYFuL0TPlQvMyNnxF+NvpvnmWh6RyRVWrzKwzbXMv5T7rDneSAU
	MI7Noxf4b8eZ4IukBE759NlvUnMq5G/V9hgROi07vSlIj4BwZPyMrOG24UGReZLboYEAvup3h02
	YAP/tlzXvSt8inUVbVc+2wcVqfOn/OXw==
X-Google-Smtp-Source: AGHT+IEjci4SG+urOJ3OKy5HCPXFmJGLZVHBKnf2mE109Xz+m/ZM7BpLkpOAiXXp+R++EbZpUDHjyw==
X-Received: by 2002:a17:907:a07:b0:afe:dd76:7cd7 with SMTP id a640c23a62f3a-b01d8a266c2mr751367566b.4.1756716385331;
        Mon, 01 Sep 2025 01:46:25 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04279a59ffsm219333966b.60.2025.09.01.01.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 01:46:24 -0700 (PDT)
Message-ID: <d32a9e2c-5dc9-461a-b22e-65fddfbf600a@linaro.org>
Date: Mon, 1 Sep 2025 09:46:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Documentation: media: update Dikshita Agarwal's email
 address
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250901-update-email-v1-0-8fd49d58c0e5@oss.qualcomm.com>
 <20250901-update-email-v1-2-8fd49d58c0e5@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250901-update-email-v1-2-8fd49d58c0e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2025 08:33, Dikshita Agarwal wrote:
> Replace quic_dikshita@quicinc.com by dikshita.agarwal@oss.qualcomm.com.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index c79bf2101812d83b99704f38b7348a9f728dff44..0d630e620b097d01001fa866b6a4a3c6328e89ca 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -8,7 +8,7 @@ title: Qualcomm iris video encode and decode accelerators
>   
>   maintainers:
>     - Vikash Garodia <quic_vgarodia@quicinc.com>
> -  - Dikshita Agarwal <quic_dikshita@quicinc.com>
> +  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>   
>   description:
>     The iris video processing unit is a video encode and decode accelerator
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

