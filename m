Return-Path: <linux-media+bounces-37485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE56B01C5C
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 14:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24BAA1C283FA
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 12:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF6F2C327C;
	Fri, 11 Jul 2025 12:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X9FUJbEq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509C12C2AA5
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 12:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238075; cv=none; b=bpE/EQndc/x9OlPxvHK+O0Fo3/oq8IJHi5wNQMm4g1sGDNvYTa5CcgN0IUdTMtK/i5KcJ/RX67R3840QEvlmX6wHjZpQGGHwsT1IMpSkllggHmKqX7JVts9C5wqcnc1vvDJzplQ0kkXFRdQo/TYRH8X1/jq42RUMNsnFsZ1Lk1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238075; c=relaxed/simple;
	bh=UNxMOEUno3xTWwKEaRj5cEusAaX9h5nRn17UJeR0sAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G0FbTonxk71HrGuNWOFuFY7Kfn9UyoJ6sMZITNQ4Crt9asn8MWYp3cZ9XeQtyZE5PSrrBtrnPwRaxUcFSP9gL6FIDBbrbvl161BGSZ9vgMS9oMpIrG8+7EkIzxyx34UAopWDMY1YAHI6QSNLiQmI/pxZ6Q5iOeMvVw9Rw8bX+Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X9FUJbEq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BB1ppK006635
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 12:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tAAJC0j1RSdDu1oR46fr2tvvyrGBbj/Zy+RWTiBXIb8=; b=X9FUJbEqXt/GRWi1
	MpZGRnbIhTCx/5UJ9Uow0gemXj+HVxuGpHQ12qKBSWodNyS0mx9njaBuUtNbXGQj
	/+MnWLvHdUlij0hdi9+v/DC+oHAq3vdqKzHjCCqC3PtNncciru30+UXvycUi09+4
	vpUlvnf3kaXI8/EMKfg+BYAyKdv5tsGjJ98SKPqepyNkJJ7yZ4IGzRv5r6WQOIxC
	kUhwu11Kwx52f1ThxJmrKIUq584ALAiE/tvXQCwV0l1qJZshfFhmVHUTiuxx3fF1
	3VkcWa6Z0uh/M4lP6RWE44dzayw/rCKwrFIIs+04QGfKMy/gposntl34WwDvGxFS
	8ACUPg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47u1c588ra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 12:47:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7df5870c8b1so13900885a.0
        for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 05:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238072; x=1752842872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tAAJC0j1RSdDu1oR46fr2tvvyrGBbj/Zy+RWTiBXIb8=;
        b=nj7fYvbuXEKkRUsDQuOeIPFlg/k2IYYSsVPFuidmTo9FiDin9nXXDoTwX5M7ZFuIMa
         SMtYcPaYhiLdDX07TYo3qZNI7sPi6/0KLeTp5/63BSTEswaMeBHKVefGnc9Fh9bAQHxB
         t2QMF1OoCx3bVd6enR4R7D0ZHFdsLQJ9SQa3WfjO0keTbkul0ZJJrLLICOqSgjNKRbkb
         vw2t9dQdsWAsKGMbkS63wLXO7MA7DhrpvEbSt6Gd3g7jN+Ddw062CFtW8D82/exeSRpt
         X9KEjVf3UiLE5M1vvRMGtHjLbb/c1rarB5kOiLik9imYdfOjMhBA8pyjVDV2lzbNL2B/
         +INA==
X-Gm-Message-State: AOJu0YyWgFpj/iG7HnOZCVKqUh+YVgjzv5DMChUa8669AtURwClQuvhQ
	0+OtIsfchplMj9F4tx+Ryddtw+qeZdBTuUvgIWMkcO+SR7NnK0QMh7cfW/B5s6roON2FhSGmr0F
	VQgO1WEewQcd3bK6QNxVeb94Z0G5k+yp+FZgzab+xmPtn5VIY6ch0JRvB+mjVMPbb1A==
X-Gm-Gg: ASbGncs0wyZWq+bLKZfW9Z4QpzV0QeZhxcsOt7txOCNtpIQyv4o3Ouz05H4D+N8Tci3
	TyKRawer/rYOUwxnO0MA4NUC5M5hXxB+4kcXQoG0VN7FWWcZq2Bgm3xTvPIHbAXrBE3O96BTLQn
	zKEq9aDe6h7cibZzJRQWRANLP6EM0EFuz3y4oBKEokoYU6qbD6yDMMQXf/tLaanbKA1VYAOiDyk
	T+fyiC64t/ye8mLf7IUsRCPhFm7x/Cd5gc3J7pTwxOyr1GrjhtIg54Ons23SZA0PvUWr+52uyOP
	LqxY6E4LmjwPf4pV3/usa6kU/xUYTONo4WTXReMvdNHuowqyW4a2AaP3qmwqUL2/OSjLtq6PC16
	XdWQlJVVdUk0lNqcbbLHu
X-Received: by 2002:a05:620a:4514:b0:7c3:c814:591d with SMTP id af79cd13be357-7dde99543ccmr215846485a.1.1752238072121;
        Fri, 11 Jul 2025 05:47:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESeu2U+6k3WIMyxzzNWPESRT3vMyXcb5iFXXbJeFXaDa9YBQhYzxhAIugUY6ZcfdnzrOroHg==
X-Received: by 2002:a05:620a:4514:b0:7c3:c814:591d with SMTP id af79cd13be357-7dde99543ccmr215843785a.1.1752238071499;
        Fri, 11 Jul 2025 05:47:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c95256d0sm2173291a12.24.2025.07.11.05.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 05:47:50 -0700 (PDT)
Message-ID: <05fd9c4d-4fc0-4386-88f8-9b11516e11ca@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 14:47:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/72] arm64: dts: qcom:
 sdm845-db845c-navigation-mezzanine: Replace clock-frequency in camera sensor
 node
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mehdi Djait <mehdi.djait@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <20250710174808.5361-13-laurent.pinchart@ideasonboard.com>
 <214c3d98-d0ee-4806-8c0e-81c1766dd1f0@oss.qualcomm.com>
 <20250711124553.GG27674@pendragon.ideasonboard.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250711124553.GG27674@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QG6sYx0Us-wqHjHbkuEzRVPlz-j72xkZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA5MCBTYWx0ZWRfX4JZvvo9W52bp
 sihmk/3m84o9hYovaZPBq6o5AF+lVKX19ZmnKRU9aCIy+Da2h+aHiay4itKuvI//mYuT704Try5
 O2O29sMiMox3sEVsnwoBTf4njzchF/Ra1axV4InUQ0w1aylZfX1GQpLmzNrEhNmumLfz5wtgXfL
 583Ycbbsojnk25CuW2E7UCPup+WxnGXjy+nnGBLVfmCPGiYEEc3Db8mBb5BjlLfx8rZ1nrdcQoR
 oBj+jK8wciR9iCeEx/Jt/5Ol7iYG4Cfm8/ZFMLEy2aPB5x3AOqetRIPyEYUan1/bNOIPhHPB6ix
 2V97k8zYw4uJ/8hQXjroUXh6e4LXkIUtUCUgoVVdiKz6ENXkIJ3OTPma9zIsJYa3pqdW0cQjCvh
 4/3AesURIaOyWySaQaH1tNUOcw/G5HhQA3lMVU2azvjtCdDxk2fH7W1A/ma9vHzrc0hxMkog
X-Proofpoint-GUID: QG6sYx0Us-wqHjHbkuEzRVPlz-j72xkZ
X-Authority-Analysis: v=2.4 cv=N9MpF39B c=1 sm=1 tr=0 ts=687107f9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8
 a=EUspDBNiAAAA:8 a=NubvJ2om332UdV8EFb0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110090

On 7/11/25 2:45 PM, Laurent Pinchart wrote:
> Hi Konrad,
> 
> On Fri, Jul 11, 2025 at 02:25:14PM +0200, Konrad Dybcio wrote:
>> On 7/10/25 7:47 PM, Laurent Pinchart wrote:
>>> The clock-frequency for camera sensors has been deprecated in favour of
>>> the assigned-clocks and assigned-clock-rates properties. Replace it in
>>> the device tree.
>>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> ---
>>>  .../boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso      | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
>>> index 51f1a4883ab8..dbe1911d8e47 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
>>> @@ -44,7 +44,8 @@ camera@10 {
>>>  
>>>  		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
>>>  		clock-names = "xvclk";
>>> -		clock-frequency = <19200000>;
>>> +		assigned-clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
>>> +		assigned-clock-rates = <19200000>;
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> (although your patches still seem to leave clk_set_rate in
>> ov8856.c anyway?)
> 
> The call gets removed in patch 69/72 ([1]). It gets replaced by
> devm_v4l2_sensor_clk_get_legacy(), which internally calls
> clk_set_rate(), so the behaviour is preserved to avoid breaking backward
> compatibility with old DTs.
> 
> [1] https://lore.kernel.org/linux-media/20250710174808.5361-70-laurent.pinchart@ideasonboard.com

Overlooked that, thanks

Konrad


