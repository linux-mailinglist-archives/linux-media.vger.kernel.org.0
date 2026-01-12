Return-Path: <linux-media+bounces-50457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB076D12653
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 12:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C50CD308EA0A
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33E83570BD;
	Mon, 12 Jan 2026 11:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUmX7dkO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/PTRg0Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA42A2D7DDC
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768218647; cv=none; b=WHcDQJV+Mhme9fpSxBKat9RUXxML0IN8HIGwWJeK86edQCmq+QHCw1K3jXf4bJYkmYM72Rl1DWv7JVbEUNGEzmLu+eExOj26fP3XFJBvcKEpZthqWcDvXvRE9FsbTkKpUusKvIIL/azbPobzwmxshxGrdmbykZPvZSD+k/0He7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768218647; c=relaxed/simple;
	bh=fD0VasFyz17RMZAtNf0dob/9XEoH5FERv1VGRi8KVzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EO8Q/zV5e8R6VkSY//YiPPbTxD5B+hUyUQwCUEUEOVU8+N99nSPc6dsqZ3+Uym4df/P1VHYdVLZE2a+2hWOD78kayvx2VHxzG9iPUQ0qyBfIQFtKrO8rf1Pq3fkLPKx7xKqpp9kITEk5Qc2YdkzHW7rfmKxDORtbiaURRB8hiH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUmX7dkO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/PTRg0Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8rsSr675693
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JAaB59HhwqZUd77zPo5+uCl4TMQPko/1bghunuekK1Y=; b=NUmX7dkOWaMqNX/C
	z0USQhCeo+fpGpAJuOAg8e1zHCm5h8LHHY6n8VlkSJ+gnUjdV5tdgxP6HNFMp0GU
	PJArZNCruwkCVvVT7XHB2HFgt4VmYek4XrgWvEG5YFfsa39G3RUF42sXj4wockQn
	rAiBcQwQbMv6r35Wd/CL8DNlHWiTJF/UF7rltKIgUQQGxAiCbSG8deJj7jgah12B
	YAHOUxrHn0T+ET4AJ+9DYqL9PZDOKefn5XFamtTROB6QKkkgqEIgibRjDxiotyLo
	6DBUY8FynrWOEwzTaDIotJQ3k6B7dW2SP0u4V1MUADuPj1gHGH1zTxpc3Utq5ovE
	mxxI4A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmwur8gvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 11:50:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed782d4c7dso124090141cf.2
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 03:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768218644; x=1768823444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JAaB59HhwqZUd77zPo5+uCl4TMQPko/1bghunuekK1Y=;
        b=g/PTRg0YhdDwbNM+Tqig0ZsxKA6xJ5zrVJjPLqwFz5FzgGOFTM5wr29WnQBCKfSR/u
         Xgi+9uu9XW0B+qUAlcD/rTl4adxWkn4O7IJBI3j6J11JAhUXQ1op7AeQsrLCuS4MLNPk
         vPZbq40eOCEevIuqV5qSiBJFv4r8f8OX70fvUxPcl9OcJYwRI3FXfJ+FA8Z6pKjc5594
         /aRiRfDRZH6WFGbX6bBjkmImWrLNX7eb+UFBSg9DR+wXQaj8az6VnfI2zYbqePIsIH0H
         Hu9P8+d4FUNGBJpmAdqplCf1J51tDGXIZCgflmU7bIeHHQaIOQMl2m9GtgFIybMHd7rF
         GWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768218644; x=1768823444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JAaB59HhwqZUd77zPo5+uCl4TMQPko/1bghunuekK1Y=;
        b=CeJjuz3x/Z5LJooFK4nqhgZ4BCFdj7Io2XU5GIXxH3BbAqDZbc4sIPhrIdW4w1TdMT
         4KbwYVCxIq1E3BZ3bzuHqMQ3p6rfFzKmFnv4RiqXXVDakZ/k3XdwByzbIdutQ1u9zmcM
         j1JzGd0AvJvPqIwRPz3lvBijPy4UMjYIiVFmw1mLfw1+L/eUW2qi4cHEqA38PC4oz2nt
         pM6OHAgW7voTqdN8w7XmmoCpXQzuWni/BglVwQQLemAIxjRG07Gi3D5Jn/xP1epn7mQi
         6kH8f6eFGqoAVBKQBzIHwzci3dZZwzWVoiPhrrWLAVgB2Y4EpJOVqCkJ3G9VTXzdpXKv
         Zpfg==
X-Forwarded-Encrypted: i=1; AJvYcCX01AgB09XvV10KejMXWLuryJzWc8k+zM9yjW3q4Xt6I+ghN3BvNTGU4P6h2d3WQoJRWkFytB5H+MO3rQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxgGFG8jFrpL5bqw3qn5T7KmNvt5raqy9Tv73aBdQL4pYovaeF
	m2fEPcy1PmZGoCZ+ns86a06Y4akyPu0KDOayNnSZWdRtUTbXsf/tLbKe5CKa2piM26gttv1q7k2
	hpMZ6ZbJJN3t8MpHqkrh16AzCQ9eFlQ58AyUm0z449xBTJm5rd/wK5qDbSSYnNNzRO0KspoTzWv
	Mk
X-Gm-Gg: AY/fxX6TViE/GDZP3uKyygRlKCebmssKTlFP8GOE5PTQNy0l2pX43proFA7YxzmOFbk
	pb0rEhk0arZvkHmlttwgR1TifeLzg67SxkqHjeOQJvJzhvuQrxzorT+Otn4nhaQKU8u/5u30Qfc
	gXemUemH4s4D1bEVrSHAcvpdB45dOY2OqkDRX1lLULKzBQTlGWetL9AzGd333dAOk3wmwf1HDdg
	aNzUGTNDU7m+eyt14lLWs//WeNgNR1iTk931OmgUDu2wDGzN8f92hNP4Gtvu7oYKShKxfj98ani
	Z+nwSChTBsTNcR8HgN6tSKJ3QCkTl1V/zeoub+Mg8dwXvB0uM+dZfcNNh5PDNNGIsm/M0zWGYxp
	xcMFP6ZPqPwD/2kLPE3ENVxCzkiVNuZJIxm/iZZqNy/wPR87r1GaxNsERklcRl89bwSlUs6Q=
X-Received: by 2002:a05:622a:1a94:b0:4ec:f2e1:483 with SMTP id d75a77b69052e-4ffb495b32fmr240901671cf.26.1768218643687;
        Mon, 12 Jan 2026 03:50:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZ7vaqV3WTOysb6dkr9ldig/Cbe79ZpkSXK4D50nP/VMWg4u1+R/eaUqeyPwQyfFduFXH3uw==
X-Received: by 2002:a05:622a:1a94:b0:4ec:f2e1:483 with SMTP id d75a77b69052e-4ffb495b32fmr240901491cf.26.1768218643226;
        Mon, 12 Jan 2026 03:50:43 -0800 (PST)
Received: from [10.38.241.92] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077235411sm142247056d6.29.2026.01.12.03.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:50:42 -0800 (PST)
Message-ID: <828597fc-ec02-488c-99e9-418a7ff266d3@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 19:50:38 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: imx412: wait for NVM read (T7) before
 programming mode registers
To: Bryan O'Donoghue <bod@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <tjF2Z2nt6dR-T_d-5cSpzZqItgoMsUzNmUBQ-jucG9SMQ9Q4y9cCrW4aya-hRJR0dQG-q63OBmZajTWMbxfeUA==@protonmail.internalid>
 <20260109044913.3310-1-wenmeng.liu@oss.qualcomm.com>
 <dc68db73-163e-4443-b334-31e2ae529e99@kernel.org>
 <1344ad43-a4c4-4e37-ae4e-eddd2c577b3f@oss.qualcomm.com>
 <aWS5qIA1Hfrr-3Yb@kekkonen.localdomain>
 <Q_aYRmvRyFExck1x7KCq3R5cFB8HTgFftErKAzEIWCCKIgXQuS1IZxzlbX7RbGoZ0M-IGKyellEXIdniJzgQcg==@protonmail.internalid>
 <468ce093-7704-4497-a538-c54baacbd8ae@oss.qualcomm.com>
 <ca5e24d7-94ea-47f0-9e02-cb6ecb3b9b24@kernel.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <ca5e24d7-94ea-47f0-9e02-cb6ecb3b9b24@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA5NSBTYWx0ZWRfX1yk5Qu0+OPZH
 ETBfONaMQkqv8cPsGlmuzCmTxSMSHMKGRSkc4nindeuaRAT31Tfq7sIQ65KKYN1ufy0aPnAx7a2
 8Ls2/fA5WIaOU+iBAfg88KF4W0Kvtn2I2lGQETUIhj8i4AN6qv2bo4mGDqm5Ewfh/8za2MmMzlB
 xxF527Bhzw0hWqupeqglMvQnllKM1VUv+WrDooJe2OmS8dW/StWDeobvwLcTUJbU+3vcvCCfmFA
 1C/KBA4KoQ4FjniAVg7GwFi5EC1RuHxLhlx9aNWQ8/7k36dFA2bsPFe7CI8RDH7htgrfuKeXd3Y
 LQ4Wlp4O4M10wDL/6bk2fOgvmRNhRJDn8WGpAVsH060YQkLqxttS/+mkLdeXk8959+JaWcRJMvH
 P6RtbMCB2vUPtZZQBxZ9BB5tthc+JKlzf0mFi/64LLqQO0+fSKqDa9zbyCkDJovQwgnp2DfT/x8
 dxCu2+/yw/+JCHyye1Q==
X-Authority-Analysis: v=2.4 cv=HrJ72kTS c=1 sm=1 tr=0 ts=6964e015 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=9SyD2Jwyq_Eki1JmFGgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ey2fsKNUNg1rpIbVKEsnpw8v8v1eBrEX
X-Proofpoint-ORIG-GUID: ey2fsKNUNg1rpIbVKEsnpw8v8v1eBrEX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120095



On 1/12/2026 6:21 PM, Bryan O'Donoghue wrote:
> On 12/01/2026 10:09, Wenmeng Liu wrote:
>>>>> This delay should go at the end of the operation that requires the 
>>>>> delay
>>>>> not at the start of the streaming operation.
>>> I would have thought that, too, but I understand there's an issue 
>>> with an
>>> Arducam module. It's also not exactly clear to me if all other registers
>>> are writable at the sensor identification time or is the required delay
>>> only concerning starting streaming (I'd hope so).
>>>
>> Hi Sakari,
>>
>> I tried adding a read ID at the end of power_on func and found that it
>> could only read the ID during probe; subsequent attempts during stream
>> on would fail to read every power on read.
>>
>> [   11.298460] imx412 2-001a: read reg chip id: 577
>> [   11.310703] imx412 2-001a: read reg chip id: 577
>> [   35.392396] imx412 2-001a: read reg failed ret = -5
>> [   39.583990] imx412 2-001a: read reg failed ret = -5
> 
> This "smell wrong" points to the power_on() sequence not being correct.
> 
> You should be able to read the identity register at the end of 
> power_on() every single time, if not, power_on - isn't working.
> 
> 
> You should be able to put exactly the same delay into power_on() and 
> have the same result as having no delay in power_on() instead having it 
> in start_streaming().
> 
> Are you sure something else isn't happening - a reset line, pm_runtime .. ?
> 
> I think either power_off() is happening without you knowing it or more 
> likely the reset line logic in the power_on() sequence isn't correct, 
> which is why detecting the chip then fails.

-- if disable gpiod_set_value_cansleep(imx412->reset_gpio, 1); form 
imx412_power_off, the issue will not happen.

Through this analysis, the issue was ultimately identified as the 
Arducam IMX577 sensor module requiring a relatively long wait time after 
the reset pin is pulled high.

The reason why the ID can be read successfully the first time is that 
the GPIO’s default state is not output low. Therefore, to fix this 
problem, it is necessary to increase the delay time in the power_on 
sequence.

 > In fact, looking at the power_on() sequence, I'd say we should have put
 > reset 1, switched on power, and clock and then taken the part out of 
reset.

I tried this, but it didn't work at all.

Thanks,
Wenmeng









