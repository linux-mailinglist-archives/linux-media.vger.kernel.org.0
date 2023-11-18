Return-Path: <linux-media+bounces-535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ADF7EFF4C
	for <lists+linux-media@lfdr.de>; Sat, 18 Nov 2023 12:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DED5280FCD
	for <lists+linux-media@lfdr.de>; Sat, 18 Nov 2023 11:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127E25382;
	Sat, 18 Nov 2023 11:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jusyyr7h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE41810C4
	for <linux-media@vger.kernel.org>; Sat, 18 Nov 2023 03:35:33 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4079ed65582so2345995e9.1
        for <linux-media@vger.kernel.org>; Sat, 18 Nov 2023 03:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700307332; x=1700912132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=44TB2Q4xVBrawfbtki6oGL++4vEDUXWgPnAMX9eIRIg=;
        b=Jusyyr7hwHGPh9Eo1RMQt6rniM3X+ZgjMxeHleJ6HktP5HCmHw282YIBd09Kef7z65
         eGqjPT0ILbew6vUEuZ6MVLeyIYqJ9ndnLWz7fik4TV+0X6wpGiYeOIeRJD2JuE/63FNT
         QDVpgODvagQP3xe+SNltqWIgiTfeMza9bJA/KkvK5ej4S//KonOhddrWj7sg+/vobVce
         i/pKRQZ26ZlJvg7hWwoP3XY2+5FdQtXl1dN8/p1oBMT/LecgH4wrOE0K+ZiEBjbzjefZ
         J7fJq46LLTyJMku0U9olkjgA7KrB4+6QdKm+xX37gDDEqcohLiOAvckndUTqe92V1hdN
         MMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700307332; x=1700912132;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=44TB2Q4xVBrawfbtki6oGL++4vEDUXWgPnAMX9eIRIg=;
        b=WAHpKQhCr1ZRMNYsU75SnvbFBFFctkUaoJO1O8aMX4HEUDi+0abgkP5aQzdmLsOBoY
         7Q/KOV5KrKUDwrCVqh+KkbIoV405yKqREEtaFqP7I0gnmMi0m+i+91NkoXIXLOYBpJsK
         c+E38XwXxK3YV7bnT51qXqnSDyGKHt+jj8PZWPnzQKSHIhhLzUC03jFC/l9xwnVtTbxu
         skJsLpPJ08MV3xsE4RF2UgGgt4wv+yOk72A2LS21UD/tJMS15C8M5IO88PdYxVMlfbJ1
         JVT0lP/wIptgPFamfmMse/oa1XAu0aydFtz/wgpDsiPEnVOeRr4q7DDuLhJC4GpS4pvR
         gx3w==
X-Gm-Message-State: AOJu0YwVYtqdJSDfoofz2gNEw+6KIQT2wVVpctEH4xukBdLgK7v4+w+0
	dBNAx0+wLcpADseCiJEt8AJX6qsHjCOSZchvS7QdVHIT
X-Google-Smtp-Source: AGHT+IH45WnOTljmI1rzZoyBuGD11rEpJzz1WSRqMnUWf3O1tSvVnk0jrE9ZNWS/nxCHkc+DlvJ/lA==
X-Received: by 2002:a05:600c:5487:b0:40a:43eb:b752 with SMTP id iv7-20020a05600c548700b0040a43ebb752mr1805937wmb.34.1700307332257;
        Sat, 18 Nov 2023 03:35:32 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id t4-20020a5d4604000000b0032fbd0c7d04sm5101992wrq.55.2023.11.18.03.35.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Nov 2023 03:35:31 -0800 (PST)
Message-ID: <57c9b7e8-bb0e-4d31-adeb-19a83137c082@linaro.org>
Date: Sat, 18 Nov 2023 11:35:30 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] media: qcom: camss: Move VFE power-domain
 specifics into vfe.c
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, hverkuil-cisco@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, matti.lehtimaki@gmail.com,
 quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231103-b4-camss-named-power-domains-v4-0-33a905359dbc@linaro.org>
 <20231103-b4-camss-named-power-domains-v4-4-33a905359dbc@linaro.org>
 <0fbef967-62db-4c5f-8108-2c545c53a39e@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0fbef967-62db-4c5f-8108-2c545c53a39e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2023 00:32, Konrad Dybcio wrote:
>> +	/* count the # of VFEs which have flagged power-domain */
> [...]
> 
> Personal peeve, but this comment seems a bit excessive

Well, to me this code "does stuff" that isn't terribly obvious. It took 
a while to understand the Gordian knot so its worthwhile documenting it 
inline until we can use named pds to make it all go away forever.

> 
>> +	for (vfepd_num = i = 0; i < camss->vfe_total_num; i++) {
>> +		if (res->vfe_res[i].has_pd)
>> +			vfepd_num++;
>> +	}
>>   
>> -	camss->genpd_link = devm_kmalloc_array(dev, camss->genpd_num,
>> -					       sizeof(*camss->genpd_link),
>> -					       GFP_KERNEL);
>> -	if (!camss->genpd_link)
>> -		return -ENOMEM;
>> +	/*
>> +	 * If the number of power-domains is greater than the number of VFEs
>> +	 * then the additional power-domain is for the entire CAMSS block the
>> +	 * 'top' power-domain.
> the last 3 words seem out of place


> 
>> +	 */
>> +	if (camss->genpd_num <= vfepd_num)
>> +		return 0;
> if (!(camss->genpd_num > vfepd_num))
> 
> would probably be easier to follow given your comment above

Sure, if its easier to read/understand for you, then it is probably so 
for others.

I will V5 this.

---
bod

