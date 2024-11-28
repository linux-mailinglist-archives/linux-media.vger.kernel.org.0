Return-Path: <linux-media+bounces-22209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B5A9DB495
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 10:10:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E99691664C0
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 09:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6DA6A8D2;
	Thu, 28 Nov 2024 09:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L/1cCBFR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EAB14F9D6
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 09:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732785033; cv=none; b=bs+l0vnw0bSnIOi7FwfZSAg/+I1w+YkmlyMntNm/3OEqKhJ5td4Ko9xB0iMcbf6Eux97ucGBcGGifDuWwKjfYxyDl4Ocf0orQTWCC8wrZz5znw44mVkPQdTQwDoadlpuN65i8iJg8loqi0er7f2RtmKDx8rsStP2xgvQFrCvAyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732785033; c=relaxed/simple;
	bh=1qvWRKNboNmu51AxojQ5Qj4X9MnAEEhEsvcOe+PFzl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MgjgrA8LjKap5x58CCx1flpZbp4juxDpjk/C66+FtkmmwjBRubpt4LQnGwu6/fZzNph32bhpwOZdTAAVPiY1dP6gIPPK6iKSy1X+7NDHJdtq3EpPrTqu4EQnQZMI0nTgN1ug1Cuq0Mb3VBnjaz2VM/7lixhC0pbGBI2VKluIzag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L/1cCBFR; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53dd2fba94fso96365e87.3
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 01:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732785030; x=1733389830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mfj/AobFLMhgE1cIWyFSrn5uWbVuXPFzxVqiYuk7vew=;
        b=L/1cCBFR2FtmHdasWv05bxiEb/BfD8CC+XgFoUJouLppSCuII3770hI/R+mtVVhI/C
         5dOl+ifdMQs56DlwfnwV6fQxJf+g8JALden//8KV1OMr65yIitBd3lWA7RZZUgKRVak6
         Wvq2f8fkYL+6E/wxOlcAcZT0xZ8wCQZ1S0JiyU2mWMz6FrsS5I62JyhzJqgDzsPn5awJ
         FFgZwHaZ3rcPZo7dDW9cpFHat9s5Tog3tX4yTYPpbSu0UCgJvkjqUNFceTVSXgnXaC81
         hvRLci0aW8Nkr6xtglb5mEtW73AAmY0ps9/mA8TvTK5lb/6NKWmRB1oMqa5te9eRNyCP
         tljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732785030; x=1733389830;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mfj/AobFLMhgE1cIWyFSrn5uWbVuXPFzxVqiYuk7vew=;
        b=nUx3JfRshA1nyULU05Cwt9hVMUSAAdANIb1J7atmaS6fbbEwOMBwYSNHL6skFdjQmC
         LPj5qV1svXtPPhP7XxQConxrSVzOHIGD4rd4TvBs3gDgoQCaUEpYKVTjDydVgHuAnEQ2
         NJ+UkRnNXofmuI8iWJ0k8P6fwBo6kgmyHskFb1b1qAPczMkug+VtzyZsHVITWALvrlsO
         XjJ5fBodFeyy7GpowJurSSsXqduErohSoqJnn0OaQ10B+UGBNcUZT5COdl2Hm2gvk+AO
         dfKh9c4No2x3PHwJTlYrXZKP6nSnGpjvG4anHD81u/QJ7RRzoHd3jMYGPZkHg5SpUgQb
         KhUg==
X-Gm-Message-State: AOJu0YxsrYkvvG3jXvrWJMd9Ky2PCiEmduHUU1FohSzTrrISrTx+SiNr
	d8bhU7gYklDuvPkrBkslljNZEyhQC/f4ByTS7gdGGa2AWFronizatLhHEy3hHUQ=
X-Gm-Gg: ASbGncvCpae1q34o0Dl8U5W4U8w9GIkUAjcwO0116sJw6gvwFTe75okwmqcHB7obJPZ
	VAZ6Hk7e1LW9tWFZ2fjSpgCgJrSy1xwWFEt643Qh+dxdELEZlv1STIY4TKkLvD0nH1Ghozjl1Qs
	tzJC4Xt8IxMkIsNH5S+x9ikAQRkbYBMptl5znaT3/2pJR6zz83EL5AygnRT52BA1GZ8Z7FcnUXv
	yCcgF5UVjAanXVR68CLG7AV14QH3b59vKhnD0qCa9bORIXhaWxlkLXp5Tn60dmeqBOwkRKMByCM
	snZ+p1S96OyuhRjgRpi1TzetB65x
X-Google-Smtp-Source: AGHT+IH0bl8SdTIeN9JDYq+vH2q816+b4x6RwU31gSdNCIs8qjdn3XBYa1+adMS2nm5uya1S5PmfZA==
X-Received: by 2002:a05:6512:2212:b0:53d:d049:8743 with SMTP id 2adb3069b0e04-53df00ff9f5mr830506e87.9.1732785029864;
        Thu, 28 Nov 2024 01:10:29 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6496be6sm117511e87.221.2024.11.28.01.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 01:10:28 -0800 (PST)
Message-ID: <acb6366a-aa6b-4c84-a3b2-cad03ae02ee7@linaro.org>
Date: Thu, 28 Nov 2024 11:10:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: fix VFE pm domain off
Content-Language: en-US
To: Yassine Oudjana <y.oudjana@protonmail.com>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <a0a41b77-ee63-4d55-8c91-baf667c25cba@protonmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <a0a41b77-ee63-4d55-8c91-baf667c25cba@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/27/24 12:01, Yassine Oudjana wrote:
> On 22/11/2024 5:06 am, Barnabás Czémán wrote:
>> Fix NULL pointer check before device_link_del
>> is called.

The intention is clear, but the context of the change is completely lost.

>> Fixes: eb73facec2c2 ("media: qcom: camss: Use common VFE pm_domain_on/pm_domain_off where applicable")

It's invalid, the change is not a fix.

>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>    drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>
>> ---
>> base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
>> change-id: 20241122-vfe_pm_domain_off-c57008e54167
>>
>> Best regards,
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index 80a62ba11295042802cbaec617fb87c492ea6a55..1bf1473331f63b9ab106d21ea263c84d851c8a31 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -595,7 +595,7 @@ void vfe_isr_reset_ack(struct vfe_device *vfe)
>>     */
>>    void vfe_pm_domain_off(struct vfe_device *vfe)
>>    {
>> -	if (!vfe->genpd)
>> +	if (!vfe->genpd_link)
>>    		return;
>>    
>>    	device_link_del(vfe->genpd_link);
> 
> Tested-by: Yassine Oudjana <y.oudjana@protonmail.com>
> 

The change is useless and it shall be dropped.

--
Best wishes,
Vladimir

