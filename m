Return-Path: <linux-media+bounces-1754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 182C3806FA9
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 13:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 492C51C20A91
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 12:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD54364D9;
	Wed,  6 Dec 2023 12:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NQ4mEUVH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B35112
	for <linux-media@vger.kernel.org>; Wed,  6 Dec 2023 04:28:40 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a1db6816177so70891566b.0
        for <linux-media@vger.kernel.org>; Wed, 06 Dec 2023 04:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701865719; x=1702470519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bGOyXBc8VpYXUIzqop1SwzGsMBqr5Cx6QC/TSPQu1wg=;
        b=NQ4mEUVHOg0m0nHeWw9lS+377zGiZRay6YJ91WsONO5FknLQD4Sda86lXfuLhrmT9D
         ENwEfcami6RJo/G0G24C0GzYmVa4U6iC6NpCnYfQiQG+XC81fY5yQiSqx1AmYdNW959T
         2W2n0i7UOijaHUYOt/5WlGPjVuI5XVCWFkHHQV1VRWLQ7+XyWLQuNJVE7o5s4WTIo35b
         PRziR+J5EGxsAC1zg+gum1Y69IIH4zwpCWqDJgLkAhBmhslYm9xkbCeV0n9R2M+5pmmr
         z2CP/nfaJRv7uRVOR4MwIM8/MnWLdciK6/xyD9qbA0SwCPZnKvGzlRRWwVLp1b1m7jWA
         aJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701865719; x=1702470519;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bGOyXBc8VpYXUIzqop1SwzGsMBqr5Cx6QC/TSPQu1wg=;
        b=c+r8GoInuq1iHgL5XqfWyzoSS87gZQQl9in3K+R9ERjsgUe7hWwiB7B/4yCilIGFDs
         C7u/jG8HWxC4i6DyGOJnpBaB0+uM9dtWHU/PZ0UcecJ2nozxfmQizgBhsHFytxJVJf8e
         zI5ABgzLpGSz/YSGdm+lUQ77WvctpFrCnF4QcMYEKPL6wvy91keekzXW20p8A+b3unhf
         UiUNQ78ve1+1XgtmT2WgxEMGJqtrqTjoH/dBwIIv+GSGu0MXqdZFH9LGRKipvpJZGHMB
         hdQ+NZVceFsb0KLsScLz+SVF2DuWoVtIm6Kt8ZO79XUHOCPrDs8vCUmtWR0+5UUOJF5k
         ma+A==
X-Gm-Message-State: AOJu0YxZdjEhncBpQ4Rpo30e3lgUouDKiTU/VzaAbrFkhOKPubH5PJNA
	U4CkU64CTI/m67z1Fsg/aUf07A==
X-Google-Smtp-Source: AGHT+IFO3C/Pc5x7AswNh/M8nngpoQqbv98xjwdSP/J2C+mcuKgVmSNZUHtS3ujBIgbkR9VMTamsgg==
X-Received: by 2002:a17:906:7497:b0:a08:1224:abd6 with SMTP id e23-20020a170906749700b00a081224abd6mr529383ejl.3.1701865718694;
        Wed, 06 Dec 2023 04:28:38 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:366d:ca8f:f3af:381? (2001-1c06-2302-5600-366d-ca8f-f3af-0381.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:366d:ca8f:f3af:381])
        by smtp.gmail.com with ESMTPSA id ef10-20020a17090697ca00b00a1b6ec7a88asm4358000ejb.113.2023.12.06.04.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 04:28:38 -0800 (PST)
Message-ID: <a25394b4-438b-43da-93ef-043620b6128d@linaro.org>
Date: Wed, 6 Dec 2023 13:28:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] media: qcom: camss: Add support for named
 power-domains
Content-Language: en-US
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 laurent.pinchart@ideasonboard.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, matti.lehtimaki@gmail.com,
 quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231123-b4-camss-named-power-domains-v6-0-3ec2fd9e8e36@linaro.org>
 <20231123-b4-camss-named-power-domains-v6-5-3ec2fd9e8e36@linaro.org>
 <43621420-2482-4634-9c3e-1a3278481540@xs4all.nl>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <43621420-2482-4634-9c3e-1a3278481540@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2023 12:35, Hans Verkuil wrote:
>> +	if (IS_ERR_OR_NULL(camss->genpd)) {
>>   		ret = PTR_ERR(camss->genpd);
> I get this smatch warning here:
> 
> drivers/media/platform/qcom/camss/camss.c:1555 camss_configure_pd() warn: passing zero to 'PTR_ERR'
> 
> I'm not really sure what the intent is here.
> 
> If the fix is small, then I can change it myself, otherwise I need an updated patch.
> 
> Regards,
> 
> 	Hans

Update sent

