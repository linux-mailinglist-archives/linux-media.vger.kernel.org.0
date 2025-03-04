Return-Path: <linux-media+bounces-27512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56359A4E839
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 18:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C9407AB83B
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 17:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E4229B21E;
	Tue,  4 Mar 2025 16:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LnKSGZ6W"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0619294EE2
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 16:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107058; cv=none; b=MFyBetB0NMAom46Emf0v1qCPo6KNG7bhhSqOplPD0dFWWKveV6UnxMSQzIDlQTZyLYkni15cxvl719nHkYr0tUkAJGui3RnOOnvq825tJt32vAP4tOM4tcEX9C2VlvDkbEcpcQhfU23KtcEeIxXG3EpF5/Eyo+bcYtqDHWn2wuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107058; c=relaxed/simple;
	bh=4RFYlaNdV3WhrdxEC9D3J9GzPcuRDBI0yIBQjLj03KA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rk8gJXJskjbEdpzMHi3Io7aDDZOLyN9qVit4wnGEFf9p9uCWDp0xyVE+Ka7iFKYzzQX52V8TSiWMvXfVColCY6u2UNREIDtCf/AkdB9YH3bKksZAQLahA3FGPYEjjcB4XnuodwisQeVaLG43uq09d4q8cWlrsktiUJu/GZ/3Adk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LnKSGZ6W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524ACQtY005995
	for <linux-media@vger.kernel.org>; Tue, 4 Mar 2025 16:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JnwyaU3JlcPGpgvlX3B6lDWi5ibaBzsG39kIqRDdvi0=; b=LnKSGZ6WzA3Gdaz0
	fO5lFxEYzA4ZiHf6o6/ZX4sTjgFtKh1jtt8S2dnh3/tO9f//1y/YoUyVLhd+U1rK
	VRHX21qiPh00UCqlHaS9ll7NJFMMWHalCOmDBSwG1vvL3ZXPBYsiJNqhwcysHo17
	2LRXBgewpdzGOTPG1A5jDp+5S26lqpKs6p+oeqpG1dAEEzZ74bxSprOxV1cjqBhP
	EM2+PbrS4xWzkOfOvU2JjaMIVxK95ZmlEA/6/TpwDCz3vt/mPnxr3kP1rEwvoY3P
	5TEL7t24JgVkoafWwmIMKqlAtbbQ/oBTSGthzIzJdPx1EHozy2kfVfdrUrti2Ftd
	WHnSwg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tjh42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 04 Mar 2025 16:50:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8add20c70so3409756d6.0
        for <linux-media@vger.kernel.org>; Tue, 04 Mar 2025 08:50:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107054; x=1741711854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JnwyaU3JlcPGpgvlX3B6lDWi5ibaBzsG39kIqRDdvi0=;
        b=PVUqzV5SF5Jtv7uBhJRxcG82NFhxRws+833/J0z9iHTK/LjrmyrL2NGPBHt30IhiKx
         n3gCppjfWfZyuVoukX6/JGzjsNHhO4oKmrIoxKGoVYEKqRYbOXrwQd6Rr4i2c7sJlyvF
         OK098wnJAyibZr2Q5h0okT6cLbX0hRdy8Qk35mqccc+sVkh5b84eOH6O3LMP6OdIGW1Y
         a7pdfFx9cJ3l2Jc/hpNy3V/2Kpg4+OyWMHR0VtZySHJhBhBXjaNXHL2YbCWgbLfqilGE
         dr1ZZVH8bSXt/NW+le3P/KcuwpgeQLSKe1kbrElpjOTTTeMx7DpdD6vJcnd290gIVXae
         B6gA==
X-Gm-Message-State: AOJu0Yy/U0J/fba/3xWRzpflnDj1P8wGgy93R1J8g9oJH2hCcoU7pZFE
	Tpo5GtVgJF2X4ZjCm7V6deOyr593TBODZP94b285KoYb+Tyl8MLfEktcIFj4eqEzxSq767fQa9j
	J7x20c/E9aGyQV3u6z0Scf8T3D5G8shEcExpuyBS4q2aAV2gBh9wFdTnlLJPIig==
X-Gm-Gg: ASbGncuWgtC2cIjtvDDVquRJzoj+DxjjZ+V0orCY21/hrMBAoYBnOyFZXY2fxEUuyda
	WUyFJCt36mVNn2i/pbCARfIhNfYadmx+GuuzQNKuPG/cOHRByho7GTo6U2p04caCUppDEp5Ld/l
	uiyZqmIjjK12XsVEV7nCQyvMKISvW82mgylIFlx2/p5v6/LsLtxJcUUL/CnxLsJRamCowk7EXx9
	6jPIbs5RZBX7rsL+D+EztZSoASJqRwPFq4qYm8NJVIM1QIerMED+f4o2u7m0h8zcO1bKcjBQGVh
	c50bmrl3HuRuEsKwjh6oBSm10KwmGiAiR0pPmjq+GccQSJ517VGw7rN7W4uWLWXWmt4b6w==
X-Received: by 2002:a05:6214:2249:b0:6e6:60f6:56db with SMTP id 6a1803df08f44-6e8dc2274b3mr15831256d6.6.1741107054342;
        Tue, 04 Mar 2025 08:50:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFf87lGftwctD13xLBr9ieIfLbY5PRnLIDpwQlrO1FKZ7RBee9kzNRBgBFxtoKck0poA3iYWQ==
X-Received: by 2002:a05:6214:2249:b0:6e6:60f6:56db with SMTP id 6a1803df08f44-6e8dc2274b3mr15831146d6.6.1741107053902;
        Tue, 04 Mar 2025 08:50:53 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac202dff7d7sm56462966b.169.2025.03.04.08.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 08:50:53 -0800 (PST)
Message-ID: <04b2df01-82c6-45af-a4bd-b899b404ccce@oss.qualcomm.com>
Date: Tue, 4 Mar 2025 17:50:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: sc8280xp: Add Venus
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
 <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-7-279c7ea55493@linaro.org>
 <77475c23-c173-4512-b257-d7b01fa2054d@kernel.org>
 <d4d658a3-e276-4e0f-ae71-5efd077e8a12@oss.qualcomm.com>
 <10ab5c5a-68c5-4f5c-9484-a5a8fc420ad3@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <10ab5c5a-68c5-4f5c-9484-a5a8fc420ad3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HZbuTjE8 c=1 sm=1 tr=0 ts=67c72f6f cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=KU1-Q2Yg5eEZC9oVEj4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HODWTE7FgmrqomJKm2GJrB1A8pQseMn0
X-Proofpoint-ORIG-GUID: HODWTE7FgmrqomJKm2GJrB1A8pQseMn0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_07,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=756 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503040134

On 4.03.2025 5:49 PM, Bryan O'Donoghue wrote:
> On 04/03/2025 16:41, Konrad Dybcio wrote:
>> On 4.03.2025 3:02 PM, Krzysztof Kozlowski wrote:
>>> On 04/03/2025 14:07, Bryan O'Donoghue wrote:
>>>> From: Konrad Dybcio <konradybcio@kernel.org>
>>>>
>>>> Add the required nodes to enable Venus on sc8280xp.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>
>>>
>>> SoB and From do not match.
>>
>> .mailmap breaks this
>>
>> I previously worked around this by kicking the relevant entries from the
>> file, but that in turn broke base-commit in the cover letter
>>
>> Konrad
> 
> OK with you if I switch your email to kernel.org here ?

I personally don't mind as I'm still the same person, not sure if
Linaro will be a fan of removing their name from the author field
though

Konrad

