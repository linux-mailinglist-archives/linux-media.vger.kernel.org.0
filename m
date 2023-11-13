Return-Path: <linux-media+bounces-224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7497E9B8C
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 12:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4F871F21012
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 11:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20BA1CFBF;
	Mon, 13 Nov 2023 11:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c1Tv0+Zv"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7951CF91
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 11:57:13 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32CF9D6D
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 03:57:12 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9e1fb7faa9dso659615566b.2
        for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 03:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699876630; x=1700481430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g8RqWbgQzYLg3PyCTLVQhcj1adjOh+k7MefEyaZ5Nfo=;
        b=c1Tv0+Zv+PDRKyo+j5UN+aLGpnR5Dl7voltoQHRjZUfeA86wZ2jTwIY/bGPY4qsGAW
         NcmUWHnCXpQr6CpN4OShpfbhY/zjkVfZBi8J2+uZk2X6gGrYbn7vYxoGK/PLE0r/BAY7
         z0IWUuEnTSEFyj7fGE9iXNatbUyF6JHY2Vi5JSQ3mXz/U7ER1gqTTe3+QzQfWwz9nPtQ
         GGIbHmUKycFXVEMsxgzpGTKYv0EctcryO8IDH/JgyN1E7HG5IIPpOOOew7Oyp7dL3r/f
         M8c2Q3RMILNOZC0gozkhhmY3Z+lSjY9WN8dmorZVDfjdNZOOY8vZpbR+nERtLCKPRTdB
         y6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699876630; x=1700481430;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8RqWbgQzYLg3PyCTLVQhcj1adjOh+k7MefEyaZ5Nfo=;
        b=Qt4SG1GiCrgH7MPumCASkivdDYKHxXuFfFeJyxT0IA7b1YHv915U8sXvbqVnhJhJ8O
         SwATbwQon3cfa/T6jHjafl0Qqt5vJDdFLPkG5otiLIqjdqWHQJXMI0wX+jxRXXsGrYsE
         7TjvCCxTr1kTAbcw5M/uUU3CnYj2X09AJAGDDAE/4CVH1j0Pbs1/nx/O+Jz23/4CokIF
         i0AjHwfJnh9iZoZ9SWy7LQpYMern9PB7nIT05b0x8MEalQsqOVx54Q33y9POCortguiI
         +84LQcQf5Lwlg3fVebT3kVWB21Hw5sCzEjQEHLqpk8UtDA8hu7tL/rwI1rZKxnp+5aYD
         uSLQ==
X-Gm-Message-State: AOJu0Yz8+3blao9vj49SBJU5t6GQaVH5syPudCzTF14eke4Y+eA3i6e4
	RdKu7kN7l7TQ+IGakgGbTyT6IzEq3XYUKG/Ok0k=
X-Google-Smtp-Source: AGHT+IF1nR/U1205K6tOwCWtLvWwJlc8OQPlDxUAGZ90GYOB0iVq8MzlFCjYhzxdWykIrTvVmiB4Vw==
X-Received: by 2002:a17:906:c452:b0:9e5:37fd:8827 with SMTP id ck18-20020a170906c45200b009e537fd8827mr5203194ejb.63.1699876630540;
        Mon, 13 Nov 2023 03:57:10 -0800 (PST)
Received: from [192.168.201.100] (178235177064.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.64])
        by smtp.gmail.com with ESMTPSA id gx24-20020a170906f1d800b009c503bf61c9sm3868184ejb.165.2023.11.13.03.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 03:57:10 -0800 (PST)
Message-ID: <ea15a00d-a60c-460a-8d3d-f6cb4cea46db@linaro.org>
Date: Mon, 13 Nov 2023 12:57:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] media: qcom: camss: Add sc8280xp resource details
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, hverkuil-cisco@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org,
 matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231110-b4-camss-sc8280xp-v5-0-7f4947cc59c8@linaro.org>
 <20231110-b4-camss-sc8280xp-v5-4-7f4947cc59c8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231110-b4-camss-sc8280xp-v5-4-7f4947cc59c8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.11.2023 02:04, Bryan O'Donoghue wrote:
> This commit describes the hardware layout for the sc8280xp for the
> following hardware blocks:
> 
> - 4 x VFE, 4 RDI per VFE
> - 4 x VFE Lite, 4 RDI per VFE
> - 4 x CSID
> - 4 x CSID Lite
> - 4 x CSI PHY
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
[...]

> +static const struct camss_subdev_resources vfe_res_sc8280xp[] = {
> +	/* IFE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb", "camnoc_axi", "vfe0", "vfe0_axi" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 19200000, 80000000},
> +				{ 19200000, 150000000, 266666667, 320000000, 400000000, 480000000 },
> +				{ 400000000, 558000000, 637000000, 760000000 },
> +				{ 0 }, },
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.pd_name = "ife0",
So, the comments before each array member, the reg/intr and pd names
are all over the place between IFE and VFE.. Is there a reason to this?


On top of that, another ideas to add onto your cleanup stack:

- Are VFEs within a CAMSS block actually different? Can we just do "vfe
  data" and "vfe number" + "vfe_lite data" & "vfe_lite number"?

- Should we move these platform structs into separate files?

- Reminder about the clk_bulk_enable for clk_rate=0 clocks suggestion 

- OPP

- Use _num instead of sentinels and magic scary while (not null)

Konrad

