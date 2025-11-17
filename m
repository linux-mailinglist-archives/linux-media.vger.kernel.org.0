Return-Path: <linux-media+bounces-47212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9A0C64431
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 14:06:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EC5FC385A4D
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 12:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4307B32F772;
	Mon, 17 Nov 2025 12:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BjG/BDks";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M1dCxlvO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4300332A3F1
	for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 12:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763384018; cv=none; b=ZSjOSugbIgSdaGzQuvNA3A2LhCpszXqy+3YlNTJhaVEIU1JQrVxiEZwZSto9oeRCZPD1OXk6Ip0nJd913StjvN2cUiHXEXtQL+ygdU9IZq/C49GZcUwGgrxlTNL6gfhYZh9IaTimXERimYXhXhPD8IACE0/bT56Xin8UC9Qkgyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763384018; c=relaxed/simple;
	bh=n0eh/NtDf/nYf0LwlhPqDDAQ+7UTxU/Qm/qJqghRnYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nXIoy48KtqsuW/n7l+nIbtIlsrmfgBFKfGT+nRH0YooyehJqqyCtCuJiHe27CuayQVOITXQNEPm4PUI6sssATOFl1QeEy0L4pVWkINLPck8hXFn25C/ksD/I4FMDakIrBFX8B6kf9ZjR1Pr8WAPrj+Sy9w/KRJsVvctPCLe6/Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BjG/BDks; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M1dCxlvO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB64i54107469
	for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 12:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v7eCMvYSrDmmZnV36o1pJlusI4kswM1CDbztYSeOKW4=; b=BjG/BDksUtN+3j2t
	VRWtx96peGyQqvvacO3zhnieBK1y6dgRsPl/7LYwY/3Ww4DXZaPk8Mw7Fg7xQAyX
	ionLGFf+K+/WHIEE93lFnVxFbm5TCNd4RqvjS2jhQsX+vd6KnSK7KIowDpPI8s/a
	pWWZPE20R4pvYREXnn0ZwzDXoYLKk5kBHgEQZY5E7VS6HuSC6xTSlWu7Ikg2vsP2
	t1GOy/2ej1ZsaFJbZNHdsPvKI157hFywzPjvuVkyLcNpZNqRYP5xti+JhunA7JCZ
	Pj1++N1I7oDtC4MQLK36HAsciXQyxvN4y6l1PLL5Js6oRZLpbQdGvE0Wsnxl1XFE
	2FnTfQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2hp89ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 12:53:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87ff7511178so18345986d6.2
        for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 04:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763384013; x=1763988813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v7eCMvYSrDmmZnV36o1pJlusI4kswM1CDbztYSeOKW4=;
        b=M1dCxlvOuV3wghjuo5SbDIPG0gZEef8Ey5BHOZrkktFentS7LBTEs9jbT4ZPOyvCTb
         fr71D3NwSB0rDYjqwRaIHsT7f54GdzBguQ8OG1Lluc8wFshuGKrQehJ6dcll8tsolXRU
         NghzOFUnCZAkOazUMpTtjVDIhSjOxrfCVIiEXBmxKAFwfELe+kFvZG8+JUr8kfJgFqNh
         FmMD4ffnwpFBk5j1x0uepTBI4krW7fltmMMhcBiLFU6TqH9+/SJiYZI8Q4TFfLnAe1B7
         0qOiYg+NuQaSe6S6DvfKQx3z+Dmtx8gu7j80hA/LHsWlGcNs4agnAC8GY81iLyUmNX1e
         cryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763384013; x=1763988813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7eCMvYSrDmmZnV36o1pJlusI4kswM1CDbztYSeOKW4=;
        b=dUqP3LoQ2HdPthmvm+Sae8KnijFstHj3p9dHwt09nUR7+rDMWgIVOj11oL/4afHYnK
         HuYHMZpcXIEZtvsIcZb2BwrvZYf+WOdX6AdHfCI7FZBUpZmIIC12driMbetDRjpe9aoe
         EVnFIiHRVS82R7dbqu/gumV85YndzVwsB3HXC/Y2VjcWMinS0t8qkLBHIquoh87LA2+2
         s+lFo+VXVKC7Ak883F3piOaAVQzWGa0aek+X/jQ1XMywT/inK+ZjMgM9yvBYa2mFi9pQ
         AkrL5onpAiVjl28puwFk/wYH61GEgMji7OXk+9cZTZPc4iQptM+iMKNId9kOnR29xykV
         GVCA==
X-Forwarded-Encrypted: i=1; AJvYcCVWJR+JAKLOnX+q1DdUXHP2/xUPBp8onyEDzqACecLufrn3OX7kz7kycRctG7utgqgPhEeaUu9ymnCFTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Cgu3rGzSffRbmkNzVY08FodQM23r6hNRKt9oLPeTZJYeaTwi
	HSgXN7N6k88qQMjaOXpX1af6DPbw/5BMGEve3/RvavIf0edLoZ12N4Np6KPNOmoHUt0Z6Pi9cwJ
	3UK+fgV79NSoyH3uqhi3NqkOQ6AR4S2wgLjMlNhPVq4rrVhQwEcQJf2JCUb6uJTSC7w==
X-Gm-Gg: ASbGncsJsm8Srstg/OwLGGeZ+vZ9m4XaKvR9PLBhsrRynXgbgcwFpkYnp4TIENxc15I
	xrmKbWF/SGAjQd5xsNJXTH8DIFz+T9znLduYHTQLnox+8H5QbWtlmjk73ESb2Oq+0eR8wYHbx4C
	K2RKbswctp70wz5HosVXq6nisHFbEQaGuSTXRKgObVfa2uw2D/tGkwvE4sZy0wFy0OKBZwELll9
	K7HcKSDFUVFQzNJ7cw9WeiGR8eaCwcZBekClXVNqF3e+z6OLbgFxciRDpPKBa3L6DnmktpETsFH
	fOjEUY2wwmhIaB1kbp2fKYGSrbpZ9Foq9rESqGrGiRpvyy3/nu/PHpZQoE+5Qm83aF2OTyUtNzb
	iSPyRu7kaIK1yZA+UZwgJVtMIQHlFEJVD9SewGJAPjNur1Hoz+PtzOYRd
X-Received: by 2002:ac8:5d49:0:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4edf36e32acmr108017811cf.10.1763384013352;
        Mon, 17 Nov 2025 04:53:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcT0L5Dx/YiL8NZATdQikVgImZJ8zfUUN40OB1IZPnLg8TY3yZ8A4iHR4J5qVSr+Dbqwsp4g==
X-Received: by 2002:ac8:5d49:0:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4edf36e32acmr108017571cf.10.1763384012954;
        Mon, 17 Nov 2025 04:53:32 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3f96e2sm10089790a12.16.2025.11.17.04.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 04:53:32 -0800 (PST)
Message-ID: <893b97ad-7d2b-4408-bab5-2cd63fdaa33b@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:53:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add CAMSS support for SM6350
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <3ph8XeidoxkUIsK7qiOH29pde94sdwa3ReWKVVrPabgS5enIAmwVAC5plyFnBMJGKQBnxFB6df6j69OMFIeavw==@protonmail.internalid>
 <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
 <df4a6a77-9004-4dbe-9b11-7af2bea7e068@kernel.org>
 <DE8JJCQA0C4Q.35NEED7XG0K0V@fairphone.com>
 <17e7ebc9-3b88-4334-b87d-1bce6d5bb120@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <17e7ebc9-3b88-4334-b87d-1bce6d5bb120@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: B2S0bLIDRiYtcUCs6UdSQ11GHaulh7PD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwOSBTYWx0ZWRfX8e0Uj6d7m0Jd
 +Fq4yaJGzwsPqM5CvtzVDXK+EI8yqIQ7jWpjPjZqpk2ZcVQSffelsrtRCG+n5rzerXVSIY/WRUe
 A0Zq6vftACPJ+uvg8W/GH26Vb26XnHDL6oRYJfd251/KJ/CqAORLAbZF3bdmvOUbgWGKzS0rfI9
 rtRiHmURQEOwzW4Dkb17U2KTayw/p+loUoWWbi4KMD0XSZQ4c5sy7j7SJC3rxDUshWvgUMlZ+I/
 0JpPK6c/DeAr7+vFXV9EQzkk/1pbxzb/dza51jmyyk9oNI6h2l1inBuDQgmzO6yHe/d0fJQmMt5
 DsI2LL2J6xCyYsP72OCNrMfVDnnuxbR85nRVtCCG2EJ1IVyZ1cGtRIAQQMFvFqiDsi4sDX9SZq/
 36wjYpAay5EVomyG09RQNHm7fQSofQ==
X-Proofpoint-ORIG-GUID: B2S0bLIDRiYtcUCs6UdSQ11GHaulh7PD
X-Authority-Analysis: v=2.4 cv=Y5L1cxeN c=1 sm=1 tr=0 ts=691b1ace cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=Gbw9aFdXAAAA:8
 a=zgB8h5vYSv3AeE4VIxkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170109

On 11/16/25 3:30 PM, Bryan O'Donoghue wrote:
> On 14/11/2025 15:59, Luca Weiss wrote:
>> On Fri Nov 14, 2025 at 4:51 PM CET, Bryan O'Donoghue wrote:
>>> On 14/11/2025 11:15, Luca Weiss wrote:
>>>> Add bindings, driver and dts to support the Camera Subsystem on the
>>>> SM6350 SoC.
>>>>
>>>> These patches were tested on a Fairphone 4 smartphone with WIP sensor
>>>> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
>>>> far as I can tell.
>>>>
>>>> Though when stopping the camera stream, the following clock warning
>>>> appears in dmesg. But it does not interfere with any functionality,
>>>> starting and stopping the stream works and debugcc is showing 426.4 MHz
>>>> while the clock is on, and 'off' while it's off.
>>>>
>>>> Any suggestion how to fix this, is appreciated.
>>>>
>>>> [ 5738.590980] ------------[ cut here ]------------
>>>> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
>>>> [ 5738.591049] WARNING: CPU: 0 PID: 6918 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x170/0x190
>>>
>>> Do you have a full and complete kernel tree we could look at here ?
>>
>> Sure, this branch has everything in:
>>
>> https://github.com/sm6350-mainline/linux/tree/sm6350-6.17.y/
>>
>> For further refence, at least two other people have tested this branch
>> in postmarketOS, nothing particularly exciting to report from there,
>> apart from that the sdm-skin-thermal thermal zone (thermistor right next
>> to SoC) is currently configured with 55 degC as critical trip, which is
>> quickly achieved when starting a video recording, but that's not really
>> an issue with camss, but will need some tweaking regardless.
>>
>> https://gitlab.postmarketos.org/postmarketOS/pmaports/-/merge_requests/7281
> 
> diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
> index a4d6dff9d0f7f..229629ef82809 100644
> --- a/drivers/clk/qcom/gcc-sm6350.c
> +++ b/drivers/clk/qcom/gcc-sm6350.c
> @@ -908,9 +908,7 @@ static struct clk_branch gcc_camera_ahb_clk = {
> 
>  static struct clk_branch gcc_camera_axi_clk = {
>         .halt_reg = 0x17018,
> -       .halt_check = BRANCH_HALT,
> -       .hwcg_reg = 0x17018,
> -       .hwcg_bit = 1,

No reason to drop the hwcg description

> +       .halt_check = BRANCH_VOTED,

It'd be useful to explain why we should ignore the hw feedback in this case

>         .clkr = {
>                 .enable_reg = 0x17018,
>                 .enable_mask = BIT(0),

Konrad

