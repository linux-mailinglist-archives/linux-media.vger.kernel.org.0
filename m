Return-Path: <linux-media+bounces-36566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8D1AF5828
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 15:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EED343BA1CE
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 13:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECC5242D6F;
	Wed,  2 Jul 2025 13:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iZhvQyam"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8EC24DD18
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 13:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751461893; cv=none; b=lFUrnSrm2gzs+GCoI6f8ropNYW8vVcyfh8gEPWBZZEvjO26JpzAbAgQcOurTxgDrN/dhj4JJg+2x3xZppqf2PpG+bgJYxyqTEU9T0Jf/JboDzEQLz6P+JeRTxnYAo7f9MK1K4B5lfZNmvH/MmxTQ286gp3oMJi0/Yzo66xjq5kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751461893; c=relaxed/simple;
	bh=2qnYYx6xwWMHatqOtbmA5fZZO68GJhtCXnEdgTR+uR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IkeO7ph1HHlKnPEzoletPVcAYhKKpcZeQiLYX0cXIfS4qViHdBjDXaSkvWlDZjn75RXoZi/X8blzE0CCXcztVk2K/AR9mAwcUp9xrdXbL/j6voUHP2d6enhXGPjkuqjMlkCrsnIw/9RPY5HgSLe1jPOluA1g1yTdJjbXJQrB7ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iZhvQyam; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5627avne019697
	for <linux-media@vger.kernel.org>; Wed, 2 Jul 2025 13:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jay9izauXc/A0gdbOKQN9NpMjdCplbml2iUZTiy4bd8=; b=iZhvQyamk8dz9MfS
	UNokItTXOgeGBF083BrEcVIIhMMAfXDNJAjHfP/bbXe4j2qCqvaiG+Rp41kq5yHe
	cnhVgPEQUSlVOL5jFhFKDZlhcuJ9WZx8bl7iiow/OEyvH8ChfcKNzmyklnsaCsbC
	peP/VUt+IKdoPXHeiFr3BUDV91JT3gkcIkqi5SnsQyVrGuy6W8IUhCd+XY2SYHRH
	gL+V0MIEIuipWxwf7CYVjsjV7mUbG8rbqyep+KOoQWqpXd8XoyZlGiEnjKoTKTni
	Cte6NzLNkMBUY01SDrYRezE+WwMJKzp5z9TzPirnYc1bahDsrM0Kj1Dr81lu4Dly
	6QXjaw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47n0h8h35v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 02 Jul 2025 13:11:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0976a24ceso219544285a.2
        for <linux-media@vger.kernel.org>; Wed, 02 Jul 2025 06:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751461889; x=1752066689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jay9izauXc/A0gdbOKQN9NpMjdCplbml2iUZTiy4bd8=;
        b=EONIeyokane82N0cl52tDeBYsKcEW0o89ZYPErMrDMOojud3Sp6fzv0pVqbrfkvtH7
         1kyTi4rM3eOCFXxgIM2H87HbWdGR5qQg4Xup0IKp4271g9RPVzCVgC23nb/TgfZRW0Ry
         ZTp9AIKQGDmroqhzhOSShKwyZkVkJXnUnefwjkLHIf5kA63L/mAukEfNpZFxgUa4GzK9
         vDVvw52KhqTUQyK96Si6TzynlLT3evM2wh/sLr1QqUTeNMMIoRhZMt51P0hjY08jEfpC
         9HMa01JZYl15rMK5Wvi00GSK1TZhIhYM/Tip81+zJbuHgal0ZO11uR/jpqalD8KskRix
         /C/g==
X-Gm-Message-State: AOJu0Ywgiqw2Nd6taH3ee5t+q5u5VzEzy9z7ujR7vliCIpdawG3Iul+A
	ufvpwDFfE/zERLXaDc9Isv07+cp7d65jqg1P9HT7wlJOWuAroP+EXyjePYjGP3WgNeKMGHZtTdQ
	gsbpwQNTBaiUgySUVeQ07D/hHFoHJsWA4E6Jub7L4omZ5UV6UV2QKWPtQetc19JsJUw==
X-Gm-Gg: ASbGncsiU2WaRjdAK0WYX6vIizAMexTa/PMNb5Zqq9i/qKdozKJey+9ZTSVDYIAIKaX
	KISDu8c3kRdLNaDuIubb0bcI/Zfk44C7ViDUDZ2spZPc+USytL1dSOy3njWBaJ+FkmTlwIQJxpT
	ktJhCNN9fY3Gp6eoRcZJYwZI0az9QRUx468C1E1KD2aUkTduDxuvGTwrBbVF65kOW3FbgzHtlfQ
	XJb24EIVFcpYq0Ik44rmM1RYePhDdcVA0FW7tDXTAtbXRmUUkQyGZZrP0f33WcpH6MDPwGdPYNr
	XyfaWRtZnSjVV4xZwOe8hu3A4nbu5a4PyXwiuclHi3bytuPh5VW+zBErI3jSk1yMRYG6bEXQWqw
	Lovk=
X-Received: by 2002:a05:620a:3954:b0:7d4:1ecb:dc36 with SMTP id af79cd13be357-7d5c471292emr168243285a.3.1751461889648;
        Wed, 02 Jul 2025 06:11:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTS+JCpkO+wdIex8GFBFpWIr+rL0zlZnGn08j7hpD5QH4DqCrlEVJJr/mrxA97KHZJKBH54A==
X-Received: by 2002:a05:620a:3954:b0:7d4:1ecb:dc36 with SMTP id af79cd13be357-7d5c471292emr168240985a.3.1751461889141;
        Wed, 02 Jul 2025 06:11:29 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bbfdsm1080255266b.115.2025.07.02.06.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 06:11:28 -0700 (PDT)
Message-ID: <9f5be122-302d-402f-91f2-675507612d32@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 15:11:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] media: dt-bindings: add non-pixel property in iris
 schema
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-1-51e18c0ffbce@quicinc.com>
 <19dd2e69-ad13-46f2-b99f-04a5e26f10d3@kernel.org>
 <08c8cdfd-099e-7b90-b163-23ecee3a5da4@quicinc.com>
 <118f2cbe-d8bd-4177-b0d5-91d9f1dbbef0@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <118f2cbe-d8bd-4177-b0d5-91d9f1dbbef0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEwNyBTYWx0ZWRfX/UU5x7XthHyj
 Fk6rpkY3DdB6JPl4M1Hhrt5fKgDLNzgif57MaNsDMZVwy6To7Duuz7LByAlldgwLHOdL+AE8RJo
 MYaJmQ86EGMHGGPzfQZl6hGsts71kqYvvONsPwcRSxllZxat+iWqw26in7hig4ibVY+GsEVgQAp
 UTdgCKGbwxXHQfhaO8V/OlwKldzQLvZYPcCdg2PlSyTTYKeIyfHLlFo8Mv1kvvTqLrskpDVmLmF
 6aS1KUqZmeB+pZ9tpyPlSNvbhwNgzVE2RBebbK7y2iGpDOFnNJXR5ochBXyGuh9hPTabw78d4tS
 fHo6Iy6BAlQqUjg7m8aVsj29F0+ZqW4Tx6WgtARGoH+EJN2lYyRhJsGOMt9J4/4Oo8TVSlT30CT
 oipuAYw+hPrXZXlLWcOUNKEVczejj2/x5kewZH8+owGM75q+2UC2UpWup4cX3iJVSTk+k2iu
X-Proofpoint-ORIG-GUID: lNevKo4zwtNlzbIcMYo3IBUvJMpOlz8E
X-Authority-Analysis: v=2.4 cv=L4odQ/T8 c=1 sm=1 tr=0 ts=68653003 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=wGamMhhJhDPYSn1yWlIA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: lNevKo4zwtNlzbIcMYo3IBUvJMpOlz8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-07-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 mlxlogscore=801 suspectscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020107

On 7/2/25 1:46 PM, Krzysztof Kozlowski wrote:
> On 02/07/2025 13:32, Vikash Garodia wrote:
>>
>> On 7/2/2025 4:43 PM, Krzysztof Kozlowski wrote:
>>> On 27/06/2025 17:48, Vikash Garodia wrote:
>>>> Existing definition limits the IOVA to an addressable range of 4GiB, and
>>>> even within that range, some of the space is used by IO registers,
>>>> thereby limiting the available IOVA to even lesser. Video hardware is
>>>> designed to emit different stream-ID for pixel and non-pixel buffers,
>>>> thereby introduce a non-pixel sub node to handle non-pixel stream-ID.
>>>>
>>>> With this, both iris and non-pixel device can have IOVA range of 0-4GiB
>>>> individually. Certain video usecases like higher video concurrency needs
>>>> IOVA higher than 4GiB.
>>>>
>>>> Add reference to the reserve-memory schema, which defines reserved IOVA

[...]

>>>>    dma-coherent: true
>>>>  
>>>> +  non-pixel:
>>>
>>> Why EXISTING hardware grows?
>> Same here, the commit describes the limitation of existing design and also
>> explains the need for having the non-pixel device. Its not that the hardware is
>> growing here, rather the hardware stream-IDs are utilized differently to get
>> higher device addressable range.
> 
> You are not doing this for a new device. There is no new device here at
> all. Nowhere here is a new device.
> 
> Changes for a new device COME TOGETHER with the new device.
> 
> What you are doing here is changing existing hardware without any
> explanation why.

This is bindings getting a reality check.. this goes as far back as Venus
existed (msm8974/2012)

We unfortunately have to expect a number of similar updates for all
multimedia peripherals (GPU/Camera/Display etc.), as certain mappings
must be done through certain SIDs (which are deemed 'secure') and some
hardware has general addressing limitations that may have been causing
silent issues all along

Konrad

