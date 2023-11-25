Return-Path: <linux-media+bounces-1013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 838387F8AF0
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 13:54:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5ACF1C20B04
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 12:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E98F101FF;
	Sat, 25 Nov 2023 12:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B7Df0Am3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA8C31BDA
	for <linux-media@vger.kernel.org>; Sat, 25 Nov 2023 04:54:00 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a002562bd8bso528704666b.0
        for <linux-media@vger.kernel.org>; Sat, 25 Nov 2023 04:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700916839; x=1701521639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g5upvyQLnMuRo1dbMadphRh3m2TM7U1uw9oHbCa8dgk=;
        b=B7Df0Am3pyoIQYq0xhvtSjOEXvdbWc09hVJo9c4w74x3Vs6KAOLc7zk7fxHJbCxcul
         OEB1bup/x7272hkXD2UUbwvnCLKFsMg/1FJqzCDqPnAiMDNF2mNW/KvGkP+sowb5l5g7
         J9TK668r78b+EUAF95D8FiAs8Lo2BYBDq8MvxC3IhftaQAQsCszjk6mZM6FUlidjWLX9
         aru+YAYraWxpOT8TIJt2GkjoHVWnYeEYC7jZ3FhVMkG/XqoURMjb3leX1N1AFWIGJLYQ
         fFmMP2sNZu/Wh//Ra9d3mxK+La/yKVWsTPTxLzZsYTBmHoWvxfts5meC4dF0TZU0vjly
         MFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700916839; x=1701521639;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g5upvyQLnMuRo1dbMadphRh3m2TM7U1uw9oHbCa8dgk=;
        b=JRiqH+aaHBMjwvPu0UkOiDpBMSgkHG63nlJFxFJ60EIK5SI1hX4gcK9l9whzpHtsyj
         P1F7ifKwlyLEntQLDVC4CS58SMVh8W2BsogXTyZAaupgGpZYPBK6tDeBLMvJtGuq5CsG
         lgIAfEkUAXfXt5xB2l7iyXlEW7YMr3WXATvHGDhkcFDFEPY0mKur6eaRGlzlz7Zjh5U4
         GqnSLs+MWROVKuQsHP+GizSL/MPdCP8b86grC6N6Cg6/jaYpztK3BHQmBfmHRobCz7t+
         tJv40w4k0dbETvXCxl7VG4NVeF79Y/HV7Iazbd/HtkKKxXlfG/ZyDfFGlEsr5J0kgfb2
         YSVA==
X-Gm-Message-State: AOJu0Yx9QSPFGE7YFmUbcotOQ97ZZCjxUF+xBouD01MzTM9kBW/Hmi6Y
	wU2rxazpRXYxB/xYjbXSlrMa1w==
X-Google-Smtp-Source: AGHT+IGSc5yefHXWkLQTXSaNg4wx9Y+3010q0VXtS0JCv4yg12Ipub8YWCyuolbbylixV9gAb8aohA==
X-Received: by 2002:a17:907:7da9:b0:9fd:9e54:a4fc with SMTP id oz41-20020a1709077da900b009fd9e54a4fcmr10176305ejc.15.1700916839279;
        Sat, 25 Nov 2023 04:53:59 -0800 (PST)
Received: from [192.168.201.100] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id uz2-20020a170907118200b00a098348d803sm1983946ejb.141.2023.11.25.04.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Nov 2023 04:53:58 -0800 (PST)
Message-ID: <3b8e6b65-5f37-49e5-b83e-b89726867ed2@linaro.org>
Date: Sat, 25 Nov 2023 13:53:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/8] media: qcom: camss: Move VFE power-domain
 specifics into vfe.c
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, hverkuil-cisco@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, matti.lehtimaki@gmail.com,
 quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231123-b4-camss-named-power-domains-v6-0-3ec2fd9e8e36@linaro.org>
 <20231123-b4-camss-named-power-domains-v6-4-3ec2fd9e8e36@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231123-b4-camss-named-power-domains-v6-4-3ec2fd9e8e36@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.11.2023 18:03, Bryan O'Donoghue wrote:
> Moving the location of the hooks to VFE power domains has several
> advantages.
> 
> 1. Separation of concerns and functional decomposition.
>    vfe.c should be responsible for and know best how manage
>    power-domains for a VFE, excising from camss.c follows this
>    principle.
> 
> 2. Embedding a pointer to genpd in struct camss_vfe{} meas that we can
>    dispense with a bunch of kmalloc array inside of camss.c.
> 
> 3. Splitting up titan top gdsc from vfe/ife gdsc provides a base for
>    breaking up magic indexes in dtsi.
> 
> Suggested-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Tested-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybciolinaro.org>

Konrad

