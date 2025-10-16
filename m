Return-Path: <linux-media+bounces-44737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2ECBE3899
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 14:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7F7558573C
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 12:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFDD5335BB5;
	Thu, 16 Oct 2025 12:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULPJIdJG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D868F334393
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 12:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760619405; cv=none; b=AB79ELQlB9VdXhOCROwSBR+yB+v4K9dDp8+5FpnPeC1jqs8lupgJAyEyg4YhJ/wn4L38D3403/kpdthEW0SGv8wrcnTKO8qcSDbWBaVcrEt5EH6L+291e2+P8z7mz6LiJ55p/hMtyn4uEpO/Yyjaffhwu8YYs5UjVXE4UZnjp4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760619405; c=relaxed/simple;
	bh=Jbv8XMDahtn9wKO+PXew2xk51xBX5L1k+/IC6OmuoMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RA7DrGH2dLAPdqrRXLdGJr74ITCP7fymN32UMKYIGfzmCYLL7hRfAqblHDb/X/qokLOY6HguVMYSgCtMzKBBHSirEojowWClXSV5VD0LKwZG5ojCo4WDb9NbCJV1jjiys1rcsRhMIO0sR9f7CJGp/GRmrDd7gWZwO3PhfetNFNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULPJIdJG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G7F8Zk004682
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 12:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aDcnEN/SEPhIGH2w0jNSMNXONDaOo4xYbjpnlUa6mcA=; b=ULPJIdJGV/cxPzlc
	l51ufxG8KK4M7aQnRcsYONSzRn8Rm0RtYmHA0xC+e/wpCgVedccLzd1VdQeepUMH
	EMI9AZ1FwigDOoYrDvma+VzYyYPNG2JtORioMNIfuHyXXI7yuABy9RMGTS2VHdIt
	YlksKS6s2mZyksya0voPQoUk2BR1SWZVoYuDIOlXBZrlBjmFDveXM754MShhhmeS
	HeXDcorOju+BcMjPVXKMKBdcrLnHVaHR5w4gpFeU+OUGetVUEbXKNICSn54Ss7Il
	iP8zKGk7hccs3NNuZnbQwjYgAGTRqkNNlWojQ+01/ch/c5SzQbIROIGNzeTb+9FV
	TlCgTw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwtmd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 12:56:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-89022a2981eso77064385a.3
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 05:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760619401; x=1761224201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aDcnEN/SEPhIGH2w0jNSMNXONDaOo4xYbjpnlUa6mcA=;
        b=NjI3Zl7NQVwT17Yq7ebIeNZ9A37PupILvB48BA+3tSTQJyLxRDhBF1qg3SslcZL0qN
         k+RRUH9GDiQCxA+vSsvwGr/Hb1lueU2IWxyTqQUrgsNt/Byw8bMmgD+irg3YDFsCmNZg
         kiEDABNNKqRsNsxnTtUbGc39+cx+kH1vD90IgZzwXcF7QlovfUVQIosP7O60mjOWHIJF
         516PwMU3pAjWz8OIZQMRjxZwbwoUIrJwn33lzFTdUzXhILJvjxcUgrb2GzMZR703IsY/
         qwQScHF9+rScS1QhNtR+tbF8ILCcltr71E6zoHtbtDopT/1TjBMYvD3gv2sw0ZynvtmB
         KULA==
X-Forwarded-Encrypted: i=1; AJvYcCUIA2x3+3wMl7VA/6OhLfdSohHJ+xh5ucE/sih6xxeopq+rkYkHLrGXNymVY/CmJgbe3X9aA6dHRix8RA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQtJxXABRebYiqha4mEaqWagKXF9/jsucgOM4fWoBgF4enS0Uc
	Yr27CJHi1ct2bAl99jHTBIyJQRbGOnpr14NDmHYCCe3kJF7Qkgr7EZpgR4JBdP9ctxtjmohv45j
	BW2vZYBYMltX1Oj3mScvdqigTwrbYLgLUiI13Jyp2JD4dI7Aq3MTr0iUEXkF0NOjZmQ==
X-Gm-Gg: ASbGnct3kWZZDX7UpXFWoX/RNl1HyTeQeFNzGyGkHGlTAjzBJFTp/+9iJufaZPf9tFc
	rEx8ok35yayqj/SOFZmu8HPp6FkQ+iMEbxXLB5WFcpmAhvMzsRcXe0m3qAs6CfsZVgTK+I44qsX
	SHYXYrPBKzhGtCmgEq/bx4KQtJOVknPg4FtHzVqmgEWVQLaXhYxwB2rEL89F4Q8dw3ztjsaL8A9
	3rmEAhBiraBeE2moQOn50FJyBmr+dIIh6ivJQFl1LDgIQHU1vx6heerTWD5cWFE3a/OoIWde8LS
	V9mafEVdvMcuIUbzxbDJYl6kU7z9TXYIreJM/i/OdC1lk22ECprk3vmfmrkOpp+hcIzJsQn/KXM
	nSQhxAR3ah6llQLEu0+HTT511OzAh8aVN8Gp5dZM6rekqBA3op0qM9sYVYVi5X9o=
X-Received: by 2002:a05:620a:1791:b0:88e:6f4:2160 with SMTP id af79cd13be357-88e06f42330mr908702485a.12.1760619400639;
        Thu, 16 Oct 2025 05:56:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuMl1hYNZddQ/dcADbLf0KGudXkeAs8SKF2Tj8TJbuhBzi9Jt8gOt7GxvWs8IrTaszx1MO7w==
X-Received: by 2002:a05:620a:1791:b0:88e:6f4:2160 with SMTP id af79cd13be357-88e06f42330mr908698085a.12.1760619400063;
        Thu, 16 Oct 2025 05:56:40 -0700 (PDT)
Received: from [10.111.161.126] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-88f3587272csm192372985a.6.2025.10.16.05.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 05:56:39 -0700 (PDT)
Message-ID: <400360a0-6580-402a-8b28-54c5212e7390@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 20:56:33 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] media: qcom: camss: tpg: Add TPG support for
 SA8775P and QCS8300
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250925-camss_tpg-v4-0-d2eb099902c8@oss.qualcomm.com>
 <20250925-camss_tpg-v4-3-d2eb099902c8@oss.qualcomm.com>
 <eb90f34c-4b63-4696-abf5-1d412d7bf263@oss.qualcomm.com>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <eb90f34c-4b63-4696-abf5-1d412d7bf263@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfXz0pKdMtZd12F
 RREtxnFxarO4KQ+rt4A18hEp3iv3ckH6t3O51ewfUFdDV6t9EOFPch5zTwD3tV8/vl5+eXqUCx/
 Lde/LgSDvE+giZGrmbK7BcrfNeGUwbUoSi2VMFOJYXHJg5EevQBDnm/XVXVP6uKx/Io8HgEH8VA
 nWD+TjciJUf326Jqu9MyOxIC07/gEQj5tYP414Z7K5x0lPNZje1mrcx41mwy5XxeU8Osw//b3Gj
 uGps8Sx0W1kH5ii/qLN5jI5fvkYzp8GB5xs1B0zzPnvV+iYYN7HX/LrxGEDWYuIQi6dyHDvYE2P
 0onrfG29krKFFStlEg2xMrme8ASr7t0uC/YEFQ68GqDgWmZDGdRiOC94ICQ6UtVPlIkk/cXAc/4
 JMoHfC8jzjaB4peSMaWBfjjWT10f/g==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68f0eb8a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=n-feYObeC9k_B3tjsesA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 1rMtSjf2qT1xNtJwo7b3K8lxy-S5pLIM
X-Proofpoint-ORIG-GUID: 1rMtSjf2qT1xNtJwo7b3K8lxy-S5pLIM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083



On 10/8/2025 6:50 PM, Konrad Dybcio wrote:
> On 9/25/25 2:32 AM, Wenmeng Liu wrote:
>> Add support for TPG found on SA8775P and QCS8300.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> @@ -4350,6 +4413,7 @@ static const struct camss_resources msm8916_resources = {
>>   	.ispif_res = &ispif_res_8x16,
>>   	.vfe_res = vfe_res_8x16,
>>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8x16),
>> +	.tpg_num = 0,
> 
> Uninitialized fields of partially-initialized structs default to zero,
> i.e. drop all lines like this
> 
> Konrad

sure, will update in next version.

Thanks,
Wenmeng

